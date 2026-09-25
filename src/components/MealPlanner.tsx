import { useState, useEffect, useRef } from 'react'
import type { Recipe, MenuMealType, MenuConfig, MenuSlot, SavedMenu, PantryItem } from '../types'
import {
  getPublicRecipes, addIngredientsToShoppingList, getActiveListId,
  createMenuInviteLink, shareMenuWithPseudo, getMenuShares, removeMenuShare,
  updateMenuSlot, replaceMenuSlots, getPantryItems,
} from '../store'
import { supabase } from '../lib/supabase'
import { useConfirm } from '../hooks/useConfirm'
import { detectRayon } from '../rayons'
import { mergeQuantity } from '../lib/units'
import { scorePantryMatch } from '../lib/pantryMatcher'

import { generateSlots, replaceSlot } from '../lib/menuGenerator'

/* ── Shopping consolidation ── */

interface ConsolidatedItem { name: string; quantity: string; unit: string; rayon: string }

function consolidate(slots: MenuSlot[], recipes: Recipe[], persons: number): ConsolidatedItem[] {
  const map = new Map<string, ConsolidatedItem>()
  for (const slot of slots) {
    const recipe = recipes.find(r => r.id === slot.recipeId)
    if (!recipe) continue
    // ratio = persons / recipe.servings (default 1 if not set)
    const ratio = recipe.servings && recipe.servings > 0 ? persons / recipe.servings : 1
    for (const ing of recipe.ingredients) {
      const key = ing.name.toLowerCase().trim()
      const rawQty = parseFloat(ing.quantity.replace(',', '.'))
      const scaledQty = !isNaN(rawQty) ? Math.round(rawQty * ratio * 100) / 100 : NaN
      const scaledStr = !isNaN(scaledQty) ? String(scaledQty) : ing.quantity
      if (!map.has(key)) {
        map.set(key, { name: ing.name, quantity: scaledStr, unit: ing.unit, rayon: detectRayon(ing.name) })
      } else {
        const ex = map.get(key)!
        const merged = mergeQuantity(ex.quantity, scaledStr, ex.unit, ing.unit)
        ex.quantity = merged.qty
        ex.unit = merged.unit
      }
    }
  }
  return Array.from(map.values()).sort((a, b) => a.rayon.localeCompare(b.rayon) || a.name.localeCompare(b.name))
}

/* ── Supabase helpers ── */

async function fetchMenus(): Promise<SavedMenu[]> {
  const { data } = await supabase.from('menus').select('*').order('created_at', { ascending: false })
  return (data || []).map(r => ({
    id: r.id as string, name: r.name as string, days_count: r.days_count as number,
    config: r.config, created_at: r.created_at as string,
    user_id: r.user_id as string,
    household_id: (r.household_id as string | null) || null,
    is_private: (r.is_private as boolean) || false,
  }))
}

async function fetchMenuItems(menuId: string, allRecipes: Recipe[]): Promise<MenuSlot[]> {
  const { data } = await supabase.from('menu_items').select('*').eq('menu_id', menuId).order('day_number').order('position')
  return (data || []).map(r => ({
    day: r.day_number,
    mealType: r.meal_type as MenuMealType,
    position: r.position,
    recipeId: r.recipe_id,
    recipeTitle: allRecipes.find(x => x.id === r.recipe_id)?.title || '',
    locked: r.locked,
  }))
}

async function persistMenu(name: string, config: MenuConfig, slots: MenuSlot[]): Promise<string> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('Non connecté')
  const { data, error } = await supabase
    .from('menus')
    .insert({ user_id: user.id, name, days_count: config.days, config })
    .select('id').single()
  if (error) throw new Error(error.message)
  if (!data) throw new Error('Aucune donnée retournée')
  const items = slots.map(s => ({
    menu_id: data.id, day_number: s.day, meal_type: s.mealType,
    recipe_id: s.recipeId, locked: s.locked, position: s.position,
  }))
  const { error: e2 } = await supabase.from('menu_items').insert(items)
  if (e2) throw new Error(e2.message)
  return data.id as string
}

/* ── Constants ── */

const MEAL_LABEL: Record<MenuMealType, string> = { entree: 'Entrée', plat: 'Plat', dessert: 'Dessert' }
const MEAL_EMOJI: Record<MenuMealType, string> = { entree: '🥗', plat: '🍽️', dessert: '🍰' }
const TAG_FILTERS = ['vegetarien', 'vegan', 'sans-porc', 'sans-gluten', 'sans-lactose']

type Screen = 'list' | 'config' | 'grid' | 'export'

interface Props {
  recipes: Recipe[]
  onBack: () => void
  onGoToShopping: () => void
  onOpenRecipe?: (recipe: Recipe) => void
  defaultDietaryFilters?: string[]
  pendingMenuId?: string | null
  onMenuOpened?: () => void
}

/* ── Component ── */

export default function MealPlanner({ recipes, onBack, onGoToShopping, onOpenRecipe, defaultDietaryFilters = [], pendingMenuId, onMenuOpened }: Props) {
  const { confirm } = useConfirm()
  const [screen, setScreen] = useState<Screen>('list')
  const [config, setConfig] = useState<MenuConfig>({ days: 7, entrees: 0, plats: 7, desserts: 0, tags: defaultDietaryFilters, persons: 4 })
  const [slots, setSlots] = useState<MenuSlot[]>([])
  const [menuName, setMenuName] = useState('')
  const [savedMenus, setSavedMenus] = useState<SavedMenu[]>([])
  const [allRecipes, setAllRecipes] = useState<Recipe[]>(recipes)
  const [saving, setSaving] = useState(false)
  const [exporting, setExporting] = useState(false)
  const [loadingMenus, setLoadingMenus] = useState(true)
  const [toast, setToast] = useState('')
  const [exportItems, setExportItems] = useState<ConsolidatedItem[]>([])
  // Sharing state
  const [savedMenuId, setSavedMenuId] = useState<string | null>(null)
  const [isMenuOwner, setIsMenuOwner] = useState(true)
  const [currentUserId, setCurrentUserId] = useState<string | null>(null)
  const [showShareModal, setShowShareModal] = useState(false)
  const [shareInput, setShareInput] = useState('')
  const [shareError, setShareError] = useState('')
  const [shareLoading, setShareLoading] = useState(false)
  const [shareToast, setShareToast] = useState('')
  const [sharedWith, setSharedWith] = useState<{ user_id: string; display_name: string }[]>([])
  const [inviteLink, setInviteLink] = useState('')
  const [inviteLinkLoading, setInviteLinkLoading] = useState(false)
  // Recipe picker
  const [pickerSlot, setPickerSlot] = useState<MenuSlot | null>(null)
  const [pickerSearch, setPickerSearch] = useState('')
  const [pantryItems, setPantryItems] = useState<PantryItem[]>([])
  const allRecipesRef = useRef(allRecipes)

  useEffect(() => { allRecipesRef.current = allRecipes }, [allRecipes])

  useEffect(() => {
    supabase.auth.getUser().then(({ data: { user } }) => { if (user) setCurrentUserId(user.id) })
    fetchMenus().then(m => { setSavedMenus(m); setLoadingMenus(false) })
    getPublicRecipes().then(({ data: pub }) => {
      setAllRecipes(prev => {
        const ids = new Set(prev.map(r => r.id))
        return [...prev, ...pub.filter(r => !ids.has(r.id))]
      })
    }).catch(() => {})
    getPantryItems().then(setPantryItems).catch(() => {})
  }, [])

  // Realtime subscription on the active saved menu's items
  useEffect(() => {
    if (!savedMenuId) return
    const channel = supabase
      .channel(`menu_items_${savedMenuId}`)
      .on('postgres_changes', { event: '*', schema: 'public', table: 'menu_items', filter: `menu_id=eq.${savedMenuId}` }, async () => {
        const items = await fetchMenuItems(savedMenuId, allRecipesRef.current)
        setSlots(items)
      })
      .subscribe()
    return () => { supabase.removeChannel(channel) }
  }, [savedMenuId])

  // Auto-open a menu when arriving from an invite link
  useEffect(() => {
    if (!pendingMenuId || loadingMenus) return
    const menu = savedMenus.find(m => m.id === pendingMenuId)
    if (menu) {
      fetchMenuItems(menu.id, allRecipesRef.current).then(items => {
        setSlots(items)
        setConfig(menu.config)
        setMenuName(menu.name)
        setSavedMenuId(menu.id)
        setIsMenuOwner(!menu.household_id || menu.user_id === currentUserId)
        setScreen('grid')
        onMenuOpened?.()
      })
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [pendingMenuId, loadingMenus])

  const showToast = (msg: string) => {
    setToast(msg)
    setTimeout(() => setToast(''), 2500)
  }

  const handleGenerate = () => {
    setSlots(generateSlots(allRecipes, config, [], pantryItems))
    setMenuName('')
    setSavedMenuId(null)
    setIsMenuOwner(true)
    setScreen('grid')
  }

  const handleRegenerate = () => {
    const locked = slots.filter(s => s.locked)
    const newSlots = generateSlots(allRecipes, config, locked, pantryItems)
    setSlots(newSlots)
    if (savedMenuId) {
      replaceMenuSlots(savedMenuId, newSlots).catch(e => console.error('Regenérer persist error:', e))
    }
  }

  const handleReplace = (slot: MenuSlot) => {
    const newSlot = replaceSlot(slot, allRecipes, slots)
    setSlots(prev => prev.map(s => s === slot ? newSlot : s))
    if (savedMenuId) {
      updateMenuSlot(savedMenuId, newSlot).catch(e => console.error('Remplacer persist error:', e))
    }
  }

  const handlePickRecipe = (slot: MenuSlot, recipe: Recipe) => {
    const newSlot = { ...slot, recipeId: recipe.id, recipeTitle: recipe.title, locked: false }
    setSlots(prev => prev.map(s => (s.day === slot.day && s.mealType === slot.mealType && s.position === slot.position) ? newSlot : s))
    if (savedMenuId) {
      updateMenuSlot(savedMenuId, newSlot).catch(e => console.error('Pick recipe persist error:', e))
    }
    setPickerSlot(null)
    setPickerSearch('')
  }

  const toggleLock = (slot: MenuSlot) => {
    const newSlot = { ...slot, locked: !slot.locked }
    setSlots(prev => prev.map(s => s === slot ? newSlot : s))
    if (savedMenuId) {
      updateMenuSlot(savedMenuId, newSlot).catch(e => console.error('Verrouiller persist error:', e))
    }
  }

  const handleSave = async () => {
    const name = menuName.trim()
    if (!name) { showToast('Donnez un nom au menu'); return }
    setSaving(true)
    try {
      if (savedMenuId) {
        await supabase.from('menus').update({ name, config }).eq('id', savedMenuId)
        await replaceMenuSlots(savedMenuId, slots)
        setSavedMenus(await fetchMenus())
        showToast('Menu mis à jour !')
      } else {
        const newId = await persistMenu(name, config, slots)
        setSavedMenuId(newId)
        setIsMenuOwner(true)
        setSavedMenus(await fetchMenus())
        showToast('Menu sauvegardé !')
      }
    } catch (e) {
      showToast('Erreur : ' + (e instanceof Error ? e.message : 'inconnue'))
    } finally {
      setSaving(false)
    }
  }

  const handleOpenSaved = async (menu: SavedMenu) => {
    const items = await fetchMenuItems(menu.id, allRecipes)
    setSlots(items)
    setConfig(menu.config)
    setMenuName(menu.name)
    setSavedMenuId(menu.id)
    setIsMenuOwner(!menu.household_id || menu.user_id === currentUserId)
    setScreen('grid')
  }

  const handleDeleteMenu = async (id: string) => {
    if (!await confirm({ title: 'Supprimer ce menu ?', confirmLabel: 'Supprimer', cancelLabel: 'Annuler', variant: 'danger' })) return
    await supabase.from('menus').delete().eq('id', id)
    setSavedMenus(prev => prev.filter(m => m.id !== id))
    if (savedMenuId === id) { setSavedMenuId(null); setScreen('list') }
  }

  const openShareModal = async () => {
    if (!savedMenuId) return
    setShowShareModal(true)
    setShareError('')
    setShareInput('')
    setShareToast('')
    setInviteLink('')
    const shares = await getMenuShares(savedMenuId)
    setSharedWith(shares)
  }

  const handleCopyMenuLink = async () => {
    if (!savedMenuId) return
    setInviteLinkLoading(true)
    try {
      const link = await createMenuInviteLink(savedMenuId)
      setInviteLink(link)
      await navigator.clipboard.writeText(link)
      setShareToast('Lien copié !')
      setTimeout(() => setShareToast(''), 2500)
    } catch {
      setShareError('Erreur lors de la création du lien')
    } finally {
      setInviteLinkLoading(false)
    }
  }

  const handleShareByPseudo = async () => {
    if (!savedMenuId || !shareInput.trim()) return
    setShareLoading(true)
    setShareError('')
    try {
      await shareMenuWithPseudo(savedMenuId, shareInput.trim())
      setShareInput('')
      const shares = await getMenuShares(savedMenuId)
      setSharedWith(shares)
      setShareToast('Menu partagé !')
      setTimeout(() => setShareToast(''), 2500)
    } catch (e) {
      setShareError(e instanceof Error ? e.message : 'Erreur inconnue')
    } finally {
      setShareLoading(false)
    }
  }

  const handleRemoveMenuShare = async (userId: string) => {
    if (!savedMenuId) return
    await removeMenuShare(savedMenuId, userId)
    setSharedWith(prev => prev.filter(s => s.user_id !== userId))
  }

  const handleExport = () => {
    setExportItems(consolidate(slots, allRecipes, config.persons))
    setScreen('export')
  }

  const handleConfirmExport = async () => {
    const listId = getActiveListId()
    if (!listId) { showToast('Aucune liste de courses active'); return }
    setExporting(true)
    try {
      // Use unique recipe ids to avoid adding same recipe twice
      const uniqueIds = [...new Set(slots.map(s => s.recipeId))]
      for (const id of uniqueIds) {
        const recipe = allRecipes.find(r => r.id === id)
        if (recipe) await addIngredientsToShoppingList(recipe, listId)
      }
      showToast('Ingrédients ajoutés !')
      setScreen('grid')
      setTimeout(() => onGoToShopping(), 1200)
    } catch {
      showToast('Erreur lors de l\'export')
    } finally {
      setExporting(false)
    }
  }

  const days = [...new Set(slots.map(s => s.day))].sort((a, b) => a - b)

  /* ── Screen: List ── */
  if (screen === 'list') return (
    <div className="page">
      <header className="page-header">
        <button className="btn-icon" onClick={onBack}>←</button>
        <h1>Mes menus</h1>
      </header>
      <div className="detail-content">
        <button className="btn-primary" style={{ width: '100%', marginBottom: 24 }} onClick={() => setScreen('config')}>
          + Créer un menu
        </button>
        {loadingMenus ? (
          <div className="empty-state"><div className="spinner" /></div>
        ) : savedMenus.length === 0 ? (
          <div className="empty-state">
            <p style={{ margin: 0 }}>Aucun menu sauvegardé</p>
            <p style={{ fontSize: 13, color: 'var(--text-tertiary)', marginTop: 6 }}>Créez votre premier menu personnalisé !</p>
          </div>
        ) : (
          <div style={{ display: 'flex', flexDirection: 'column', gap: 10 }}>
            {savedMenus.map(m => (
              <div key={m.id} style={{ display: 'flex', alignItems: 'center', gap: 12, padding: '12px 16px', background: 'var(--surface)', border: '1px solid var(--border)', borderRadius: 12 }}>
                <div style={{ flex: 1, cursor: 'pointer', minWidth: 0 }} onClick={() => handleOpenSaved(m)}>
                  <div style={{ fontWeight: 600, fontSize: 15, overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>{m.name}</div>
                  <div style={{ fontSize: 12, color: 'var(--text-tertiary)', marginTop: 2 }}>
                    {m.days_count} jour{m.days_count > 1 ? 's' : ''} · {new Date(m.created_at).toLocaleDateString('fr')}
                    {m.household_id && !m.is_private && <span style={{ marginLeft: 4 }}>· 👨‍👩‍👧</span>}
                    {m.is_private && <span style={{ marginLeft: 4 }}>· 🔒</span>}
                  </div>
                </div>
                <button className="btn-icon small delete" onClick={() => handleDeleteMenu(m.id)}>×</button>
              </div>
            ))}
          </div>
        )}
      </div>
      {toast && <div className="toast">{toast}</div>}
    </div>
  )

  /* ── Screen: Config ── */
  if (screen === 'config') return (
    <div className="page">
      <header className="page-header">
        <button className="btn-icon" onClick={() => setScreen('list')}>←</button>
        <h1>Configurer le menu</h1>
      </header>
      <div className="detail-content" style={{ display: 'flex', flexDirection: 'column', gap: 28 }}>
        {/* Days slider */}
        <div>
          <div style={{ fontWeight: 600, fontSize: 14, marginBottom: 10 }}>
            Durée : <span style={{ color: 'var(--primary)' }}>{config.days} jour{config.days > 1 ? 's' : ''}</span>
          </div>
          <input type="range" min={1} max={14} value={config.days}
            onChange={e => {
              const days = Number(e.target.value)
              setConfig(c => ({
                ...c, days,
                entrees: Math.min(c.entrees, days * 2),
                plats: Math.min(c.plats, days * 2),
                desserts: Math.min(c.desserts, days * 2),
              }))
            }}
            style={{ width: '100%', accentColor: 'var(--primary)' }}
          />
          <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: 11, color: 'var(--text-tertiary)', marginTop: 4 }}>
            <span>1 jour</span><span>14 jours</span>
          </div>
        </div>

        {/* Persons counter */}
        <div>
          <div style={{ fontWeight: 600, fontSize: 14, marginBottom: 10 }}>
            Nombre de personnes : <span style={{ color: 'var(--primary)' }}>{config.persons}</span>
          </div>
          <div style={{ display: 'flex', alignItems: 'center', gap: 12 }}>
            <button
              className="btn-outline"
              style={{ width: 38, height: 38, padding: 0, fontSize: 20, flexShrink: 0 }}
              onClick={() => setConfig(c => ({ ...c, persons: Math.max(1, c.persons - 1) }))}
            >−</button>
            <div style={{ flex: 1 }}>
              <input type="range" min={1} max={12} value={config.persons}
                onChange={e => setConfig(c => ({ ...c, persons: Number(e.target.value) }))}
                style={{ width: '100%', accentColor: 'var(--primary)' }}
              />
            </div>
            <button
              className="btn-outline"
              style={{ width: 38, height: 38, padding: 0, fontSize: 20, flexShrink: 0 }}
              onClick={() => setConfig(c => ({ ...c, persons: Math.min(12, c.persons + 1) }))}
            >+</button>
          </div>
          <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: 11, color: 'var(--text-tertiary)', marginTop: 4 }}>
            <span>1 personne</span><span>12 personnes</span>
          </div>
          <p style={{ fontSize: 12, color: 'var(--text-tertiary)', marginTop: 6 }}>
            Les quantités de la liste de courses seront ajustées par rapport aux portions des recettes.
          </p>
        </div>

        {/* Meal counts */}
        <div>
          <div style={{ fontWeight: 600, fontSize: 14, marginBottom: 4 }}>Nombre de repas (total sur {config.days} jour{config.days > 1 ? 's' : ''})</div>
          <p style={{ fontSize: 12, color: 'var(--text-tertiary)', marginTop: 0, marginBottom: 14 }}>
            Les repas sont répartis sur les jours disponibles.
          </p>
          {([
            ['entrees', '🥗 Entrées'] as const,
            ['plats', '🍽️ Plats'] as const,
            ['desserts', '🍰 Desserts'] as const,
          ]).map(([key, label]) => (
            <div key={key} style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: 16 }}>
              <span style={{ fontSize: 14 }}>{label}</span>
              <div style={{ display: 'flex', alignItems: 'center', gap: 10 }}>
                <button className="btn-outline" style={{ width: 34, height: 34, padding: 0, fontSize: 20, flexShrink: 0 }}
                  onClick={() => setConfig(c => ({ ...c, [key]: Math.max(0, c[key] - 1) }))}>−</button>
                <span style={{ minWidth: 30, textAlign: 'center', fontWeight: 700, fontSize: 16, color: 'var(--primary)' }}>{config[key]}</span>
                <button className="btn-outline" style={{ width: 34, height: 34, padding: 0, fontSize: 20, flexShrink: 0 }}
                  onClick={() => setConfig(c => ({ ...c, [key]: Math.min(config.days * 2, c[key] + 1) }))}>+</button>
              </div>
            </div>
          ))}
        </div>

        {/* Tag filters */}
        <div>
          <div style={{ fontWeight: 600, fontSize: 14, marginBottom: 10 }}>Filtres alimentaires</div>
          <div style={{ display: 'flex', flexWrap: 'wrap', gap: 8 }}>
            {TAG_FILTERS.map(tag => (
              <button key={tag}
                className={`filter-chip${config.tags.includes(tag) ? ' active' : ''}`}
                onClick={() => setConfig(c => ({
                  ...c,
                  tags: c.tags.includes(tag) ? c.tags.filter(t => t !== tag) : [...c.tags, tag],
                }))}
              >{tag}</button>
            ))}
          </div>
          {config.tags.length > 0 && (
            <p style={{ fontSize: 12, color: 'var(--text-tertiary)', marginTop: 8 }}>
              Seules les recettes ayant tous ces tags seront utilisées.
            </p>
          )}
        </div>

        {pantryItems.length > 0 && (
          <p className="hint" style={{ textAlign: 'center', margin: 0 }}>
            🏠 Priorise {pantryItems.length} article{pantryItems.length > 1 ? 's' : ''} du garde-manger
          </p>
        )}

        <button className="btn-primary" onClick={handleGenerate} disabled={config.plats === 0 && config.entrees === 0 && config.desserts === 0}>
          ✨ Générer le menu
        </button>
      </div>
    </div>
  )

  /* ── Screen: Export ── */
  if (screen === 'export') {
    const byRayon = exportItems.reduce<Record<string, ConsolidatedItem[]>>((acc, item) => {
      acc[item.rayon] = acc[item.rayon] || []
      acc[item.rayon].push(item)
      return acc
    }, {})
    return (
      <div className="page">
        <header className="page-header">
          <button className="btn-icon" onClick={() => setScreen('grid')}>←</button>
          <h1>Liste de courses</h1>
        </header>
        <div className="detail-content">
          <p style={{ fontSize: 13, color: 'var(--text-tertiary)', marginBottom: 16 }}>
            {exportItems.length} ingrédient{exportItems.length > 1 ? 's' : ''} consolidés pour {slots.length} repas · <strong>{config.persons} personne{config.persons > 1 ? 's' : ''}</strong>
          </p>
          {Object.entries(byRayon).map(([rayon, items]) => (
            <div key={rayon} style={{ marginBottom: 20 }}>
              <div style={{ fontWeight: 700, fontSize: 11, color: 'var(--text-secondary)', marginBottom: 6, textTransform: 'uppercase', letterSpacing: '0.06em' }}>
                {rayon}
              </div>
              {items.map(item => (
                <div key={item.name} style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', padding: '7px 0', borderBottom: '1px solid var(--border)' }}>
                  <span style={{ fontSize: 14 }}>{item.name}</span>
                  <span style={{ fontSize: 13, color: 'var(--text-secondary)', flexShrink: 0, marginLeft: 8 }}>
                    {item.quantity} {item.unit}
                  </span>
                </div>
              ))}
            </div>
          ))}
          <button className="btn-primary" style={{ width: '100%', marginTop: 8 }}
            onClick={handleConfirmExport} disabled={exporting}
          >
            {exporting ? 'Ajout en cours…' : '✅ Ajouter à mes courses'}
          </button>
        </div>
        {toast && <div className="toast">{toast}</div>}
      </div>
    )
  }

  /* ── Screen: Grid ── */
  return (
    <div className="page">
      <header className="page-header" style={{ gap: 8 }}>
        <button className="btn-icon" onClick={() => setScreen('list')}>←</button>
        <input
          className="form-input"
          style={{ flex: 1, margin: 0, fontSize: 15, fontWeight: 600, padding: '6px 10px' }}
          placeholder="Nom du menu…"
          value={menuName}
          onChange={e => setMenuName(e.target.value)}
          readOnly={!isMenuOwner}
        />
        {isMenuOwner && savedMenuId && (
          <button className="btn-icon" title="Partager" onClick={openShareModal}>🔗</button>
        )}
        <button className="btn-outline small" onClick={handleSave} disabled={saving} title="Sauvegarder">
          {saving ? '…' : '💾 Sauver'}
        </button>
      </header>

      <div style={{ display: 'flex', gap: 8, padding: '8px 16px', borderBottom: '1px solid var(--border)' }}>
        <button className="btn-outline small" style={{ flex: 1 }} onClick={handleRegenerate}>
          🔀 Regénérer tout
        </button>
        <button className="btn-primary small" style={{ flex: 1 }} onClick={handleExport}>
          🛒 Courses
        </button>
      </div>

      <div className="detail-content" style={{ paddingTop: 12 }}>
        {days.map(day => (
          <div key={day} style={{ marginBottom: 14, borderRadius: 12, border: '1px solid var(--border)', overflow: 'hidden' }}>
            <div style={{ background: 'var(--surface-2, var(--surface))', padding: '8px 14px', fontWeight: 700, fontSize: 13, borderBottom: '1px solid var(--border)' }}>
              Jour {day}
            </div>
            {slots.filter(s => s.day === day).map((slot, i) => {
              const sameTypeOnDay = slots.filter(s => s.day === day && s.mealType === slot.mealType).length
              const slotRecipe = allRecipes.find(r => r.id === slot.recipeId)
              const pantryScore = slotRecipe && pantryItems.length > 0 ? scorePantryMatch(slotRecipe, pantryItems) : 0
              return (
                <div key={i} style={{ display: 'flex', alignItems: 'center', padding: '10px 12px', borderTop: i > 0 ? '1px solid var(--border)' : 'none', gap: 8 }}>
                  <span style={{ fontSize: 20, width: 26, flexShrink: 0 }}>{MEAL_EMOJI[slot.mealType]}</span>
                  <div style={{ flex: 1, minWidth: 0 }}>
                    <div style={{ display: 'flex', alignItems: 'center', gap: 6, fontSize: 10, color: 'var(--text-tertiary)', textTransform: 'uppercase', letterSpacing: '0.05em', lineHeight: 1 }}>
                      <span>{MEAL_LABEL[slot.mealType]}{sameTypeOnDay > 1 ? ` ${slot.position + 1}` : ''}</span>
                      {pantryScore > 0 && <span className="pantry-match-badge">🏠 {Math.round(pantryScore * 100)}%</span>}
                    </div>
                    <div
                      style={{ fontSize: 14, fontWeight: 500, marginTop: 2, overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap', cursor: onOpenRecipe && slot.recipeTitle ? 'pointer' : 'default', color: onOpenRecipe && slot.recipeTitle ? 'var(--primary)' : 'inherit' }}
                      onClick={() => {
                        if (!onOpenRecipe || !slot.recipeTitle) return
                        const recipe = allRecipes.find(r => r.id === slot.recipeId)
                        if (recipe) onOpenRecipe(recipe)
                      }}
                    >
                      {slot.recipeTitle || <span style={{ color: 'var(--text-tertiary)', fontStyle: 'italic' }}>Aucune recette disponible</span>}
                    </div>
                  </div>
                  <button className="btn-icon small" onClick={() => handleReplace(slot)} title="Remplacer aléatoirement" style={{ flexShrink: 0 }}>🔀</button>
                  <button className="btn-icon small" onClick={() => { setPickerSlot(slot); setPickerSearch('') }} title="Choisir une recette" style={{ flexShrink: 0 }}>✏️</button>
                  <button
                    className="btn-icon small"
                    onClick={() => toggleLock(slot)}
                    title={slot.locked ? 'Déverrouiller' : 'Verrouiller'}
                    style={{ flexShrink: 0, opacity: slot.locked ? 1 : 0.35, transition: 'opacity 0.15s' }}
                  >🔒</button>
                </div>
              )
            })}
          </div>
        ))}
      </div>
      {toast && <div className="toast">{toast}</div>}

      {/* ── Recipe Picker Modal ── */}
      {pickerSlot && (
        <div className="modal-overlay" onClick={() => setPickerSlot(null)}>
          <div className="modal-card" onClick={e => e.stopPropagation()} style={{ maxHeight: '80vh', display: 'flex', flexDirection: 'column' }}>
            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: 12 }}>
              <h2 style={{ margin: 0, fontSize: 18 }}>Choisir une recette</h2>
              <button className="btn-icon" onClick={() => setPickerSlot(null)}>×</button>
            </div>
            <div style={{ fontSize: 12, color: 'var(--text-tertiary)', marginBottom: 10 }}>
              {MEAL_EMOJI[pickerSlot.mealType]} {MEAL_LABEL[pickerSlot.mealType]} — Jour {pickerSlot.day}
            </div>
            <input
              className="form-input"
              style={{ margin: '0 0 12px 0' }}
              placeholder="Rechercher une recette…"
              value={pickerSearch}
              onChange={e => setPickerSearch(e.target.value)}
              autoFocus
            />
            <div style={{ overflowY: 'auto', flex: 1, display: 'flex', flexDirection: 'column', gap: 6 }}>
              {allRecipes
                .filter(r => !pickerSearch || r.title.toLowerCase().includes(pickerSearch.toLowerCase()))
                .map(r => (
                  <button
                    key={r.id}
                    style={{ textAlign: 'left', padding: '10px 12px', background: r.id === pickerSlot.recipeId ? 'var(--primary-bg, oklch(0.95 0.04 75))' : 'var(--surface)', border: `1px solid ${r.id === pickerSlot.recipeId ? 'var(--primary)' : 'var(--border)'}`, borderRadius: 8, fontSize: 14, cursor: 'pointer', color: 'var(--text-primary)' }}
                    onClick={() => handlePickRecipe(pickerSlot, r)}
                  >
                    <div style={{ fontWeight: r.id === pickerSlot.recipeId ? 600 : 400 }}>{r.title}</div>
                    {r.tags && r.tags.length > 0 && (
                      <div style={{ fontSize: 11, color: 'var(--text-tertiary)', marginTop: 2 }}>{r.tags.slice(0, 4).join(' · ')}</div>
                    )}
                  </button>
                ))}
              {allRecipes.filter(r => !pickerSearch || r.title.toLowerCase().includes(pickerSearch.toLowerCase())).length === 0 && (
                <p style={{ color: 'var(--text-tertiary)', textAlign: 'center', marginTop: 20 }}>Aucune recette trouvée</p>
              )}
            </div>
          </div>
        </div>
      )}

      {/* ── Share Modal ── */}
      {showShareModal && (
        <div className="modal-overlay" onClick={() => setShowShareModal(false)}>
          <div className="modal-card" onClick={e => e.stopPropagation()}>
            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: 20 }}>
              <h2 style={{ margin: 0, fontSize: 18 }}>Partager le menu</h2>
              <button className="btn-icon" onClick={() => setShowShareModal(false)}>×</button>
            </div>

            {/* Lien d'invitation */}
            <div style={{ marginBottom: 20 }}>
              <div style={{ fontWeight: 600, fontSize: 13, marginBottom: 8 }}>Lien d'invitation</div>
              {inviteLink ? (
                <div style={{ display: 'flex', gap: 8, alignItems: 'center' }}>
                  <input readOnly value={inviteLink} className="form-input" style={{ flex: 1, margin: 0, fontSize: 12 }} onClick={e => (e.target as HTMLInputElement).select()} />
                  <button className="btn-outline small" onClick={() => { navigator.clipboard.writeText(inviteLink); setShareToast('Copié !'); setTimeout(() => setShareToast(''), 1500) }}>Copier</button>
                </div>
              ) : (
                <button className="btn-outline" style={{ width: '100%' }} onClick={handleCopyMenuLink} disabled={inviteLinkLoading}>
                  {inviteLinkLoading ? 'Génération…' : '🔗 Générer & copier le lien'}
                </button>
              )}
            </div>

            {/* Partage par pseudo */}
            <div style={{ marginBottom: 20 }}>
              <div style={{ fontWeight: 600, fontSize: 13, marginBottom: 8 }}>Partager par pseudo</div>
              <div style={{ display: 'flex', gap: 8 }}>
                <input
                  className="form-input"
                  style={{ flex: 1, margin: 0 }}
                  placeholder="Pseudo de l'utilisateur…"
                  value={shareInput}
                  onChange={e => setShareInput(e.target.value)}
                  onKeyDown={e => e.key === 'Enter' && handleShareByPseudo()}
                />
                <button className="btn-primary small" onClick={handleShareByPseudo} disabled={shareLoading || !shareInput.trim()}>
                  {shareLoading ? '…' : 'Inviter'}
                </button>
              </div>
              {shareError && <p style={{ color: 'var(--danger, #e53e3e)', fontSize: 13, marginTop: 6 }}>{shareError}</p>}
            </div>

            {/* Membres */}
            {sharedWith.length > 0 && (
              <div>
                <div style={{ fontWeight: 600, fontSize: 13, marginBottom: 8 }}>Membres</div>
                <div style={{ display: 'flex', flexDirection: 'column', gap: 8 }}>
                  {sharedWith.map(s => (
                    <div key={s.user_id} style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: '8px 12px', background: 'var(--surface)', borderRadius: 8, border: '1px solid var(--border)' }}>
                      <span style={{ fontSize: 14 }}>{s.display_name}</span>
                      <button className="btn-icon small delete" title="Retirer" onClick={() => handleRemoveMenuShare(s.user_id)}>×</button>
                    </div>
                  ))}
                </div>
              </div>
            )}

            {shareToast && <div className="toast" style={{ position: 'static', marginTop: 12, textAlign: 'center' }}>{shareToast}</div>}
          </div>
        </div>
      )}
    </div>
  )
}
