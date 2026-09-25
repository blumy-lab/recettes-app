import { useState, useEffect, useRef } from 'react'
import type { ShoppingItem, ShoppingList } from '../types'
import {
  getShoppingLists,
  createShoppingList,
  renameShoppingList,
  deleteShoppingList,
  getShoppingList,
  addShoppingItem,
  updateShoppingItem,
  deleteShoppingItem,
  clearCheckedItems,
  clearAllShoppingItems,
  getActiveListId,
  setActiveListId,
  addPantryItem,
} from '../store'
import ShareListModal from './ShareListModal'
import ScanReceipt from './ScanReceipt'
import { detectRayon, RAYONS } from '../rayons'
import { searchIngredients } from '../ingredients'
import { supabase } from '../lib/supabase'
import { enqueue } from '../lib/offlineQueue'
import { useOfflineSync } from '../hooks/useOfflineSync'
import { useConfirm } from '../hooks/useConfirm'

const UNITS = ['', 'g', 'kg', 'ml', 'cl', 'L', 'c. à café', 'c. à soupe', 'pincée', 'sachet', 'tranche', 'feuille']

export default function ShoppingList() {
  const { confirm } = useConfirm()
  const [lists, setLists] = useState<ShoppingList[]>([])
  const [activeListId, setActiveListIdState] = useState<string | null>(getActiveListId())
  const [items, setItems] = useState<ShoppingItem[]>([])
  const [loading, setLoading] = useState(true)
  const [input, setInput] = useState('')
  const [qty, setQty] = useState('')
  const [unit, setUnit] = useState('')
  const [suggestions, setSuggestions] = useState<string[]>([])
  const [adding, setAdding] = useState(false)
  const [showMenu, setShowMenu] = useState(false)
  const [showListMenu, setShowListMenu] = useState(false)
  const [editingName, setEditingName] = useState(false)
  const [newName, setNewName] = useState('')
  const [showNewList, setShowNewList] = useState(false)
  const [newListName, setNewListName] = useState('')
  const [showShareModal, setShowShareModal] = useState(false)
  const [showScanReceipt, setShowScanReceipt] = useState(false)
  const [rayonPickerItemId, setRayonPickerItemId] = useState<string | null>(null)
  const [pendingIds, setPendingIds] = useState<Set<string>>(new Set())
  const [isOnline, setIsOnline] = useState(navigator.onLine)
  const [sendingToPantry, setSendingToPantry] = useState(false)
  const [pantryToast, setPantryToast] = useState('')
  const menuRef = useRef<HTMLDivElement>(null)
  const listMenuRef = useRef<HTMLDivElement>(null)

  useOfflineSync(async ({ synced }) => {
    if (synced > 0) {
      setPendingIds(new Set())
      const id = getActiveListId()
      if (id) await loadItems(id)
    }
  })

  const loadLists = async () => {
    const ls = await getShoppingLists()
    setLists(ls)
    // Determine active list
    let activeId = getActiveListId()
    if (!activeId || !ls.find((l) => l.id === activeId)) {
      if (ls.length > 0) {
        activeId = ls[0].id
      } else {
        // Create default list
        const def = await createShoppingList('Courses')
        activeId = def.id
        ls.push(def)
        setLists([...ls])
      }
      setActiveListId(activeId!)
      setActiveListIdState(activeId)
    }
    return activeId!
  }

  const loadItems = async (listId: string) => {
    setLoading(true)
    try {
      setItems(await getShoppingList(listId))
    } catch (e) {
      console.error('Erreur chargement liste:', e)
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    loadLists().then((id) => loadItems(id))

    const onOnline = () => setIsOnline(true)
    const onOffline = () => setIsOnline(false)
    window.addEventListener('online', onOnline)
    window.addEventListener('offline', onOffline)

    const channel = supabase
      .channel('shopping_items')
      .on('postgres_changes', { event: '*', schema: 'public', table: 'shopping_items' }, () => {
        const id = getActiveListId()
        if (id) loadItems(id)
      })
      .subscribe()

    return () => {
      supabase.removeChannel(channel)
      window.removeEventListener('online', onOnline)
      window.removeEventListener('offline', onOffline)
    }
  }, [])

  useEffect(() => {
    if (input.length >= 2) setSuggestions(searchIngredients(input).slice(0, 5))
    else setSuggestions([])
  }, [input])

  useEffect(() => {
    const handler = (e: MouseEvent) => {
      if (menuRef.current && !menuRef.current.contains(e.target as Node)) setShowMenu(false)
      if (listMenuRef.current && !listMenuRef.current.contains(e.target as Node)) setShowListMenu(false)
      setRayonPickerItemId(null)
    }
    document.addEventListener('mousedown', handler)
    return () => document.removeEventListener('mousedown', handler)
  }, [])

  const switchList = (id: string) => {
    setActiveListId(id)
    setActiveListIdState(id)
    setShowListMenu(false)
    loadItems(id)
  }

  const handleCreateList = async () => {
    const name = newListName.trim()
    if (!name) return
    const list = await createShoppingList(name)
    setLists((prev) => [...prev, list])
    setNewListName('')
    setShowNewList(false)
    switchList(list.id)
  }

  const handleRename = async () => {
    if (!activeListId || !newName.trim()) return
    await renameShoppingList(activeListId, newName.trim())
    setLists((prev) => prev.map((l) => l.id === activeListId ? { ...l, name: newName.trim() } : l))
    setEditingName(false)
    setNewName('')
  }

  const handleDeleteList = async () => {
    if (!activeListId || lists.length <= 1) return
    if (!await confirm({ title: `Supprimer la liste "${activeList?.name}" ?`, message: 'Tous ses articles seront supprimés.', confirmLabel: 'Supprimer', cancelLabel: 'Annuler', variant: 'danger' })) return
    await deleteShoppingList(activeListId)
    const remaining = lists.filter((l) => l.id !== activeListId)
    setLists(remaining)
    switchList(remaining[0].id)
  }

  const addItem = async (overrideName?: string) => {
    if (!activeListId) return
    const name = (overrideName ?? input).trim()
    if (!name) return
    setAdding(true)
    setSuggestions([])
    const itemData = { name, quantity: qty.trim(), unit, checked: false, rayon: detectRayon(name) }
    setInput('')
    setQty('')
    setUnit('')
    try {
      if (!isOnline) {
        const tempId = `temp-${Date.now()}-${Math.random().toString(36).slice(2)}`
        const optimistic: ShoppingItem = { id: tempId, ...itemData, list_id: activeListId, recipe_title: undefined }
        setItems((prev) => [...prev, optimistic])
        setPendingIds((prev) => new Set(prev).add(tempId))
        await enqueue({ type: 'add', payload: { listId: activeListId, item: itemData } })
      } else {
        await addShoppingItem(itemData, activeListId)
        await loadItems(activeListId)
      }
    } finally {
      setAdding(false)
    }
  }

  const toggle = async (item: ShoppingItem) => {
    const newChecked = !item.checked
    setItems((prev) => prev.map((i) => i.id === item.id ? { ...i, checked: newChecked } : i))
    if (!isOnline) {
      setPendingIds((prev) => new Set(prev).add(item.id))
      await enqueue({ type: newChecked ? 'check' : 'uncheck', payload: { itemId: item.id } })
    } else {
      try {
        await updateShoppingItem(item.id, { checked: newChecked })
      } catch {
        setItems((prev) => prev.map((i) => i.id === item.id ? { ...i, checked: item.checked } : i))
      }
    }
  }

  const removeItem = async (id: string) => {
    setItems((prev) => prev.filter((i) => i.id !== id))
    if (!isOnline) {
      setPendingIds((prev) => { const s = new Set(prev); s.delete(id); return s })
      await enqueue({ type: 'delete', payload: { itemId: id } })
    } else {
      try {
        await deleteShoppingItem(id)
      } catch {
        const id2 = id
        setItems((prev) => [...prev])
        console.error('Erreur suppression item', id2)
      }
    }
  }

  const handleClearChecked = async () => {
    if (!activeListId) return
    if (!await confirm({ title: 'Supprimer les articles cochés ?', confirmLabel: 'Supprimer', cancelLabel: 'Annuler', variant: 'danger' })) return
    await clearCheckedItems(activeListId)
    setShowMenu(false)
    await loadItems(activeListId)
  }

  const handleClearAll = async () => {
    if (!activeListId) return
    if (!await confirm({ title: 'Vider toute la liste de courses ?', confirmLabel: 'Vider', cancelLabel: 'Annuler', variant: 'danger' })) return
    await clearAllShoppingItems(activeListId)
    setShowMenu(false)
    await loadItems(activeListId)
  }

  const openShareModal = () => {
    setShowMenu(false)
    setShowShareModal(true)
  }

  const handleChangeRayon = async (itemId: string, rayon: string) => {
    setItems((prev) => prev.map((i) => i.id === itemId ? { ...i, rayon } : i))
    setRayonPickerItemId(null)
    if (!isOnline) {
      setPendingIds((prev) => new Set(prev).add(itemId))
      await enqueue({ type: 'update_rayon', payload: { itemId, rayon } })
    } else {
      await updateShoppingItem(itemId, { rayon })
    }
  }

  const handleSendToPantry = async () => {
    const toSend = items.filter((i) => i.checked)
    if (toSend.length === 0) return
    setSendingToPantry(true)
    try {
      for (const item of toSend) {
        const parsedQty = item.quantity.trim() ? parseFloat(item.quantity.replace(',', '.')) : NaN
        await addPantryItem({
          name: item.name,
          quantity: isNaN(parsedQty) ? null : parsedQty,
          unit: item.unit,
          rayon: item.rayon || detectRayon(item.name),
          expires_at: null,
        })
        await deleteShoppingItem(item.id)
      }
      setItems((prev) => prev.filter((i) => !i.checked))
      setPantryToast(`${toSend.length} article${toSend.length > 1 ? 's' : ''} ajouté${toSend.length > 1 ? 's' : ''} au garde-manger`)
      setTimeout(() => setPantryToast(''), 2500)
    } finally {
      setSendingToPantry(false)
    }
  }

  const activeList = lists.find((l) => l.id === activeListId)
  const unchecked = items.filter((i) => !i.checked)
  const checked = items.filter((i) => i.checked)
  const grouped = RAYONS.map((rayon) => ({
    rayon,
    items: unchecked.filter((i) => (i.rayon || 'Autre') === rayon),
  })).filter((g) => g.items.length > 0)

  return (
    <div className="page">
      <header className="page-header">
        <div className="list-selector" ref={listMenuRef}>
          <button className="list-selector-btn" onClick={() => setShowListMenu((v) => !v)}>
            {editingName ? (
              <input
                className="list-name-input"
                value={newName}
                onChange={(e) => setNewName(e.target.value)}
                onKeyDown={(e) => { if (e.key === 'Enter') handleRename(); if (e.key === 'Escape') setEditingName(false) }}
                autoFocus
                onClick={(e) => e.stopPropagation()}
              />
            ) : (
              <>
                <span>{activeList?.name ?? 'Courses'}</span>
                <span className="list-selector-arrow">▾</span>
              </>
            )}
          </button>
          {showListMenu && (
            <div className="list-dropdown">
              {lists.map((l) => (
                <button
                  key={l.id}
                  className={`list-dropdown-item ${l.id === activeListId ? 'active' : ''}`}
                  onClick={() => switchList(l.id)}
                >
                  <span>{l.name}{l.household_id && !l.is_private ? <span style={{ fontSize: 12, marginLeft: 5 }}>👨‍👩‍👧</span> : l.is_private ? <span style={{ fontSize: 12, marginLeft: 5 }}>🔒</span> : ''}</span>
                  {l.id === activeListId && <span className="list-check">✓</span>}
                </button>
              ))}
              <div className="list-dropdown-divider" />
              {showNewList ? (
                <div className="list-new-row" onClick={(e) => e.stopPropagation()}>
                  <input
                    className="list-name-input"
                    placeholder="Nom de la liste…"
                    value={newListName}
                    onChange={(e) => setNewListName(e.target.value)}
                    onKeyDown={(e) => { if (e.key === 'Enter') handleCreateList() }}
                    autoFocus
                  />
                  <button className="btn-icon small" onClick={handleCreateList}>✓</button>
                </div>
              ) : (
                <button className="list-dropdown-item new" onClick={(e) => { e.stopPropagation(); setShowNewList(true) }}>
                  + Nouvelle liste
                </button>
              )}
              {lists.length > 1 && (
                <>
                  <button className="list-dropdown-item rename" onClick={(e) => { e.stopPropagation(); setNewName(activeList?.name ?? ''); setEditingName(true); setShowListMenu(false) }}>
                    ✏️ Renommer
                  </button>
                  <button className="list-dropdown-item danger" onClick={(e) => { e.stopPropagation(); setShowListMenu(false); handleDeleteList() }}>
                    🗑 Supprimer cette liste
                  </button>
                </>
              )}
            </div>
          )}
        </div>

        <div style={{ display: 'flex', gap: 4 }}>
          {editingName && (
            <button className="btn-icon" onClick={handleRename}>✓</button>
          )}
          <div style={{ position: 'relative' }} ref={menuRef}>
            <button className="btn-icon" onClick={() => setShowMenu((v) => !v)}>⋯</button>
            {showMenu && (
              <div className="dropdown-menu">
                <button onClick={openShareModal}>👥 Partager la liste</button>
                <button onClick={handleClearChecked}>Supprimer les cochés</button>
                <button onClick={handleClearAll} style={{ color: 'var(--error)' }}>Vider la liste</button>
              </div>
            )}
          </div>
        </div>
      </header>

      <div className="add-item-bar">
        <div className="add-item-inputs">
          <input
            className="input-qty"
            type="text"
            placeholder="Qté"
            value={qty}
            onChange={(e) => setQty(e.target.value)}
            onKeyDown={(e) => e.key === 'Enter' && addItem()}
          />
          <select className="input-unit" value={unit} onChange={(e) => setUnit(e.target.value)}>
            {UNITS.map((u) => <option key={u} value={u}>{u || '—'}</option>)}
          </select>
          <div className="input-name-wrap">
            <input
              className="input-name"
              type="text"
              placeholder="Ajouter un article..."
              value={input}
              onChange={(e) => setInput(e.target.value)}
              onKeyDown={(e) => e.key === 'Enter' && addItem()}
            />
            {suggestions.length > 0 && (
              <ul className="suggestions">
                {suggestions.map((s, i) => (
                  <li key={i} className="sugg-item" onMouseDown={() => { setInput(s); setSuggestions([]) }}>
                    <span className="sugg-name">{s}</span>
                    <span className="sugg-cat">{detectRayon(s)}</span>
                  </li>
                ))}
              </ul>
            )}
          </div>
          <button className="btn-add" onClick={() => addItem()} disabled={adding || !input.trim()}>+</button>
          <button className="btn-icon" title="Scanner un ticket de caisse" onClick={() => setShowScanReceipt(true)}>🧾</button>
        </div>
      </div>

      {loading ? (
        <div className="empty-state"><div className="spinner" /></div>
      ) : items.length === 0 ? (
        <div className="empty-state">
          <p>🛒</p>
          <p>Liste vide</p>
          <p className="hint">Ajoutez des articles ci-dessus ou depuis une recette</p>
        </div>
      ) : (
        <div className="shopping-content">
          {grouped.map(({ rayon, items: rayonItems }) => (
            <div key={rayon} className="rayon-group">
              <h3 className="rayon-header">{rayon}</h3>
              <ul className="shopping-list">
                {rayonItems.map((item) => (
                  <li key={item.id} className="shopping-item" style={{ position: 'relative' }}>
                    <span className="checkbox" onClick={() => toggle(item)} />
                    <span className="item-text" onClick={() => toggle(item)}>
                      {(item.quantity || item.unit) && (
                        <span className="item-qty">{item.quantity} {item.unit}</span>
                      )}
                      <span className="item-name">{item.name}</span>
                    </span>
                    {pendingIds.has(item.id) && (
                      <span title="En attente de synchronisation" style={{ fontSize: 12, opacity: 0.7 }}>⏳</span>
                    )}
                    {item.recipe_title && (
                      <span className="item-source">{item.recipe_title}</span>
                    )}
                    <button
                      className="btn-icon small"
                      style={{ opacity: 0.4, fontSize: 14 }}
                      title="Changer le rayon"
                      onClick={(e) => { e.stopPropagation(); setRayonPickerItemId(rayonPickerItemId === item.id ? null : item.id) }}
                    >🏷️</button>
                    <button className="btn-remove" onClick={() => removeItem(item.id)}>×</button>
                    {rayonPickerItemId === item.id && (
                      <div style={{
                        position: 'absolute', right: 0, top: '100%', zIndex: 100,
                        background: 'var(--surface-2, var(--surface))', border: '1px solid var(--border)',
                        borderRadius: 10, padding: 6, minWidth: 180, boxShadow: '0 4px 16px rgba(0,0,0,0.25)',
                      }} onClick={(e) => e.stopPropagation()}>
                        {RAYONS.map((r) => (
                          <button key={r} onClick={() => handleChangeRayon(item.id, r)} style={{
                            display: 'block', width: '100%', textAlign: 'left', padding: '7px 10px',
                            background: item.rayon === r ? 'var(--primary)' : 'none',
                            color: item.rayon === r ? '#fff' : 'var(--text)',
                            border: 'none', borderRadius: 6, cursor: 'pointer', fontSize: 13,
                          }}>{r}</button>
                        ))}
                      </div>
                    )}
                  </li>
                ))}
              </ul>
            </div>
          ))}

          {checked.length > 0 && (
            <>
              <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', gap: 8 }}>
                <p className="checked-header" style={{ margin: 0 }}>Dans le panier ({checked.length})</p>
                <button className="btn-text" onClick={handleSendToPantry} disabled={sendingToPantry}>
                  {sendingToPantry ? '…' : '🏠 Envoyer au garde-manger'}
                </button>
              </div>
              <ul className="shopping-list checked">
                {checked.map((item) => (
                  <li key={item.id} className="shopping-item checked" onClick={() => toggle(item)}>
                    <span className="checkbox checked-box">✓</span>
                    <span className="item-text">
                      {(item.quantity || item.unit) && (
                        <span className="item-qty">{item.quantity} {item.unit}</span>
                      )}
                      <span className="item-name">{item.name}</span>
                    </span>
                  </li>
                ))}
              </ul>
            </>
          )}
        </div>
      )}
      {pantryToast && <div className="toast">{pantryToast}</div>}
      <ShareListModal list={activeList} isOpen={showShareModal} onClose={() => setShowShareModal(false)} />
      {showScanReceipt && activeListId && (
        <ScanReceipt
          listId={activeListId}
          onClose={() => setShowScanReceipt(false)}
          onItemsAdded={() => { if (activeListId) loadItems(activeListId) }}
        />
      )}
    </div>
  )
}
