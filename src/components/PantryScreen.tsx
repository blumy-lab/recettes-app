import { useState, useEffect } from 'react'
import type { PantryItem } from '../types'
import { getPantryItems, addPantryItem, updatePantryItem, deletePantryItem } from '../store'
import { detectRayon, RAYONS } from '../rayons'
import { searchIngredients } from '../ingredients'
import { useConfirm } from '../hooks/useConfirm'

const UNITS = ['', 'g', 'kg', 'ml', 'cl', 'L', 'c. à café', 'c. à soupe', 'pincée', 'sachet', 'tranche', 'feuille']

function daysUntil(dateStr: string): number {
  const today = new Date()
  today.setHours(0, 0, 0, 0)
  const target = new Date(`${dateStr}T00:00:00`)
  return Math.round((target.getTime() - today.getTime()) / 86400000)
}

export default function PantryScreen() {
  const { confirm } = useConfirm()
  const [items, setItems] = useState<PantryItem[]>([])
  const [loading, setLoading] = useState(true)
  const [search, setSearch] = useState('')
  const [showAdd, setShowAdd] = useState(false)
  const [name, setName] = useState('')
  const [qty, setQty] = useState('')
  const [unit, setUnit] = useState('')
  const [expiresAt, setExpiresAt] = useState('')
  const [suggestions, setSuggestions] = useState<string[]>([])
  const [adding, setAdding] = useState(false)
  const [editingId, setEditingId] = useState<string | null>(null)
  const [editQty, setEditQty] = useState('')
  const [editExpires, setEditExpires] = useState('')

  const load = async () => {
    setLoading(true)
    try {
      setItems(await getPantryItems())
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => { load() }, [])

  useEffect(() => {
    if (name.length >= 2) setSuggestions(searchIngredients(name).slice(0, 5))
    else setSuggestions([])
  }, [name])

  const handleAdd = async () => {
    const trimmed = name.trim()
    if (!trimmed) return
    setAdding(true)
    try {
      const parsedQty = qty.trim() ? parseFloat(qty.replace(',', '.')) : NaN
      const created = await addPantryItem({
        name: trimmed,
        quantity: isNaN(parsedQty) ? null : parsedQty,
        unit,
        rayon: detectRayon(trimmed),
        expires_at: expiresAt || null,
      })
      setItems((prev) => [...prev, created].sort((a, b) => a.rayon.localeCompare(b.rayon) || a.name.localeCompare(b.name)))
      setName('')
      setQty('')
      setUnit('')
      setExpiresAt('')
      setSuggestions([])
    } finally {
      setAdding(false)
    }
  }

  const handleDelete = async (item: PantryItem) => {
    if (!await confirm({ title: `Supprimer "${item.name}" du garde-manger ?`, confirmLabel: 'Supprimer', cancelLabel: 'Annuler', variant: 'danger' })) return
    setItems((prev) => prev.filter((i) => i.id !== item.id))
    await deletePantryItem(item.id)
  }

  const startEdit = (item: PantryItem) => {
    setEditingId(item.id)
    setEditQty(item.quantity != null ? String(item.quantity) : '')
    setEditExpires(item.expires_at || '')
  }

  const saveEdit = async (item: PantryItem) => {
    const parsedQty = editQty.trim() ? parseFloat(editQty.replace(',', '.')) : NaN
    const quantity = isNaN(parsedQty) ? null : parsedQty
    const expires_at = editExpires || null
    setItems((prev) => prev.map((i) => i.id === item.id ? { ...i, quantity, expires_at } : i))
    setEditingId(null)
    await updatePantryItem(item.id, { quantity, expires_at })
  }

  const filtered = items.filter((i) => !search.trim() || i.name.toLowerCase().includes(search.trim().toLowerCase()))
  const grouped = RAYONS.map((rayon) => ({
    rayon,
    items: filtered.filter((i) => (i.rayon || 'Autre') === rayon),
  })).filter((g) => g.items.length > 0)

  return (
    <div className="page">
      <header className="page-header">
        <h1 style={{ flex: 1 }}>Mon Garde-manger</h1>
        <button className="btn-icon" title="Ajouter un article" onClick={() => setShowAdd((v) => !v)}>{showAdd ? '✕' : '+ Ajouter'}</button>
      </header>

      {showAdd && (
        <div className="add-item-bar">
          <div className="add-item-inputs" style={{ flexWrap: 'wrap', rowGap: 8 }}>
            <input className="input-qty" type="text" placeholder="Qté" value={qty} onChange={(e) => setQty(e.target.value)} />
            <select className="input-unit" value={unit} onChange={(e) => setUnit(e.target.value)}>
              {UNITS.map((u) => <option key={u} value={u}>{u || '—'}</option>)}
            </select>
            <div className="input-name-wrap">
              <input
                className="input-name"
                type="text"
                placeholder="Nom de l'article…"
                value={name}
                onChange={(e) => setName(e.target.value)}
                onKeyDown={(e) => e.key === 'Enter' && handleAdd()}
              />
              {suggestions.length > 0 && (
                <ul className="suggestions">
                  {suggestions.map((s, i) => (
                    <li key={i} className="sugg-item" onMouseDown={() => { setName(s); setSuggestions([]) }}>
                      <span className="sugg-name">{s}</span>
                      <span className="sugg-cat">{detectRayon(s)}</span>
                    </li>
                  ))}
                </ul>
              )}
            </div>
            <input
              className="form-input"
              type="date"
              value={expiresAt}
              onChange={(e) => setExpiresAt(e.target.value)}
              style={{ margin: 0, width: 145 }}
              title="Date d'expiration (optionnel)"
            />
            <button className="btn-add" onClick={handleAdd} disabled={adding || !name.trim()}>+</button>
          </div>
        </div>
      )}

      <div style={{ padding: '10px 16px 0' }}>
        <input
          className="form-input"
          placeholder="🔍 Rechercher dans le garde-manger…"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
        />
      </div>

      {loading ? (
        <div className="empty-state"><div className="spinner" /></div>
      ) : items.length === 0 ? (
        <div className="empty-state">
          <p>🏠</p>
          <p>Garde-manger vide</p>
          <p className="hint">Ajoutez ce que vous avez chez vous pour des menus plus malins</p>
        </div>
      ) : filtered.length === 0 ? (
        <div className="empty-state"><p className="hint">Aucun résultat pour « {search} »</p></div>
      ) : (
        <div className="shopping-content">
          {grouped.map(({ rayon, items: rayonItems }) => (
            <div key={rayon} className="rayon-group">
              <h3 className="rayon-header">{rayon}</h3>
              <ul className="shopping-list">
                {rayonItems.map((item) => {
                  const expiring = item.expires_at ? daysUntil(item.expires_at) : null
                  return (
                    <li key={item.id} className="shopping-item">
                      {editingId === item.id ? (
                        <div style={{ display: 'flex', gap: 6, alignItems: 'center', flex: 1, padding: '4px 0' }} onClick={(e) => e.stopPropagation()}>
                          <span className="item-name" style={{ flex: 1 }}>{item.name}</span>
                          <input className="input-qty" style={{ width: 50 }} value={editQty} onChange={(e) => setEditQty(e.target.value)} placeholder="Qté" autoFocus />
                          <input className="form-input" type="date" style={{ margin: 0, width: 138 }} value={editExpires} onChange={(e) => setEditExpires(e.target.value)} />
                          <button className="btn-icon small" onClick={() => saveEdit(item)}>✓</button>
                        </div>
                      ) : (
                        <>
                          <span className="item-text" onClick={() => startEdit(item)} style={{ cursor: 'pointer' }}>
                            {(item.quantity != null || item.unit) && (
                              <span className="item-qty">{item.quantity ?? ''} {item.unit}</span>
                            )}
                            <span className="item-name">{item.name}</span>
                            {expiring !== null && expiring < 0 && <span className="badge-expired">Expiré</span>}
                            {expiring !== null && expiring >= 0 && expiring <= 3 && <span className="badge-expiring">⚠️ Expire bientôt</span>}
                          </span>
                          <button className="btn-remove" onClick={() => handleDelete(item)}>×</button>
                        </>
                      )}
                    </li>
                  )
                })}
              </ul>
            </div>
          ))}
        </div>
      )}

      {!loading && items.length > 0 && (
        <p className="hint" style={{ textAlign: 'center', padding: '12px 16px 80px' }}>
          {items.length} article{items.length > 1 ? 's' : ''} dans votre garde-manger
        </p>
      )}
    </div>
  )
}
