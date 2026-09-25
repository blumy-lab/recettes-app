import { useState, useEffect, useRef, useCallback } from 'react'
import type { Recipe } from '../types'
import { getRecipes, deleteRecipe, getProfile } from '../store'
import { useConfirm } from '../hooks/useConfirm'
import { FILTER_CHIPS, getTagDef } from '../tags'

type SortMode = 'recent' | 'az' | 'duration' | 'favorites' | 'popular'

interface Props {
  onSelect: (recipe: Recipe) => void
  onImport: () => void
  onCreate: () => void
  onGoToProfile: () => void
  dietaryFilters?: string[]
  refreshKey?: number
}

export default function RecipeList({ onSelect, onImport, onCreate, onGoToProfile, dietaryFilters = [], refreshKey = 0 }: Props) {
  const { confirm } = useConfirm()
  const [recipes, setRecipes] = useState<Recipe[]>([])
  const [loading, setLoading] = useState(true)
  const [loadingMore, setLoadingMore] = useState(false)
  const [page, setPage] = useState(0)
  const [hasMore, setHasMore] = useState(false)
  const [search, setSearch] = useState('')
  const [debouncedSearch, setDebouncedSearch] = useState('')
  const [hasProfile, setHasProfile] = useState<boolean | null>(null)
  const [profileBannerDismissed, setProfileBannerDismissed] = useState(() =>
    localStorage.getItem('profileBannerDismissed') === '1'
  )
  const [activeTagFilters, setActiveTagFilters] = useState<string[]>(() => {
    try {
      const saved = JSON.parse(localStorage.getItem('recipeTagFilters') || '[]') as string[]
      return [...new Set([...saved, ...dietaryFilters])]
    } catch { return dietaryFilters }
  })
  const [sortMode, setSortMode] = useState<SortMode>('recent')
  const debounceTimer = useRef<ReturnType<typeof setTimeout> | null>(null)

  useEffect(() => {
    getProfile().then(p => setHasProfile(p !== null))
  }, [])

  // Débounce 400ms sur la saisie
  useEffect(() => {
    if (debounceTimer.current) clearTimeout(debounceTimer.current)
    debounceTimer.current = setTimeout(() => setDebouncedSearch(search), 400)
    return () => { if (debounceTimer.current) clearTimeout(debounceTimer.current) }
  }, [search])

  // 'az' et 'recent' passent côté serveur; les autres modes trient le résultat accumulé côté client
  const serverSort = sortMode === 'az' ? 'az' : 'recent'

  const fetchPage = useCallback(async (pageNum: number, append: boolean) => {
    if (!append) setLoading(true)
    else setLoadingMore(true)
    try {
      const result = await getRecipes({
        page: pageNum,
        search: debouncedSearch.trim() || undefined,
        tags: activeTagFilters.length ? activeTagFilters : undefined,
        sort: serverSort,
      })
      setRecipes(prev => append ? [...prev, ...result.data] : result.data)
      setHasMore(result.hasMore)
      setPage(pageNum)
    } catch (e) {
      console.error(e)
    } finally {
      setLoading(false)
      setLoadingMore(false)
    }
  }, [debouncedSearch, activeTagFilters, serverSort])

  // Recharge depuis la page 0 si recherche/filtres/tri/refreshKey changent
  useEffect(() => {
    fetchPage(0, false)
  }, [fetchPage, refreshKey])

  const toggleTagFilter = (tag: string) => {
    setActiveTagFilters(prev => {
      const next = prev.includes(tag) ? prev.filter(t => t !== tag) : [...prev, tag]
      localStorage.setItem('recipeTagFilters', JSON.stringify(next))
      return next
    })
  }

  // Tri client-side sur la liste accumulée (pour duration/favorites/popular)
  const sorted = [...recipes].sort((a, b) => {
    if (sortMode === 'az') return a.title.localeCompare(b.title, 'fr')
    if (sortMode === 'duration') {
      return ((a.prep_time || 0) + (a.cook_time || 0)) - ((b.prep_time || 0) + (b.cook_time || 0))
    }
    if (sortMode === 'favorites') return (b.is_favorite ? 1 : 0) - (a.is_favorite ? 1 : 0)
    if (sortMode === 'popular') return (b.favorites_count || 0) - (a.favorites_count || 0)
    return new Date(b.created_at).getTime() - new Date(a.created_at).getTime()
  })

  const handleDelete = async (e: React.MouseEvent, id: string) => {
    e.stopPropagation()
    if (!await confirm({ title: 'Supprimer cette recette ?', confirmLabel: 'Supprimer', cancelLabel: 'Annuler', variant: 'danger' })) return
    await deleteRecipe(id)
    setRecipes(prev => prev.filter(r => r.id !== id))
  }

  const isEmpty = !loading && recipes.length === 0 && !debouncedSearch.trim() && activeTagFilters.length === 0
  const noResults = !loading && sorted.length === 0 && (!!debouncedSearch.trim() || activeTagFilters.length > 0)

  return (
    <div className="page">
      <header className="page-header">
        <h1>Mes Recettes</h1>
        <div className="header-actions">
          <button className="btn-outline small" onClick={onCreate}>+ Créer</button>
          <button className="btn-terracotta small" onClick={onImport}>+ Importer</button>
        </div>
      </header>

      {hasProfile === false && !profileBannerDismissed && (
        <div style={{
          display: 'flex', alignItems: 'center', gap: 10,
          margin: '0 0 8px 0', padding: '10px 14px',
          background: 'var(--primary)', borderRadius: 10,
          cursor: 'pointer', color: '#fff', fontSize: 13,
        }} onClick={onGoToProfile}>
          <span style={{ fontSize: 20 }}>⚙️</span>
          <span style={{ flex: 1 }}>Créez votre pseudo pour partager vos recettes et listes !</span>
          <button
            style={{ background: 'none', border: 'none', color: '#fff', fontSize: 18, cursor: 'pointer', padding: '0 2px', lineHeight: 1 }}
            onClick={(e) => { e.stopPropagation(); localStorage.setItem('profileBannerDismissed', '1'); setProfileBannerDismissed(true) }}
            title="Fermer"
          >×</button>
        </div>
      )}

      {!isEmpty && (
        <>
          <div className="search-bar">
            <span className="search-icon">🔍</span>
            <input
              type="search"
              className="search-input"
              placeholder="Rechercher une recette…"
              value={search}
              onChange={(e) => setSearch(e.target.value)}
            />
            {search && <button className="search-clear" onClick={() => setSearch('')}>×</button>}
          </div>
          <div className="filter-bar">
            <button
              className={`filter-chip${activeTagFilters.length === 0 ? ' active' : ''}`}
              onClick={() => { setActiveTagFilters([]); localStorage.setItem('recipeTagFilters', '[]') }}
            >Tous</button>
            {FILTER_CHIPS.map(id => {
              const def = getTagDef(id)
              if (!def) return null
              const active = activeTagFilters.includes(id)
              return (
                <button key={id} className={`filter-chip${active ? ' active' : ''}`} onClick={() => toggleTagFilter(id)}>
                  {def.emoji} {def.label}
                </button>
              )
            })}
          </div>
          <div className="sort-bar">
            <span className="sort-label">Trier :</span>
            {([
              ['recent', '🕒 Récent'],
              ['az', 'A → Z'],
              ['duration', '⏱ Durée'],
              ['favorites', '❤️ Favoris'],
              ['popular', '🌟 Populaires'],
            ] as [SortMode, string][]).map(([mode, label]) => (
              <button
                key={mode}
                className={`filter-chip${sortMode === mode ? ' active' : ''}`}
                onClick={() => setSortMode(mode)}
              >{label}</button>
            ))}
          </div>
        </>
      )}

      {loading ? (
        <div className="empty-state">
          <div className="spinner" />
          <p className="hint">Chargement de vos recettes…</p>
        </div>
      ) : isEmpty ? (
        <div className="empty-state">
          <p>🍳</p>
          <p>Aucune recette pour l'instant</p>
          <p className="hint">Importez depuis le web ou créez votre propre recette</p>
          <div style={{ display: 'flex', gap: 10, flexDirection: 'column', width: '100%' }}>
            <button className="btn-primary" onClick={onImport}>Importer une recette</button>
            <button className="btn-outline" onClick={onCreate}>Créer une recette</button>
          </div>
        </div>
      ) : noResults ? (
        <div className="empty-state">
          <p>🔍</p>
          <p>Aucun résultat</p>
          <p className="hint">
            {search ? `Aucune recette ne correspond à « ${search} »` : 'Aucune recette ne correspond à ces filtres'}
          </p>
          <button className="btn-outline" onClick={() => { setSearch(''); setActiveTagFilters([]); localStorage.setItem('recipeTagFilters', '[]') }}>
            Effacer les filtres
          </button>
        </div>
      ) : (
        <>
          <ul className="recipe-list">
            {sorted.map(recipe => (
              <li key={recipe.id} className="recipe-card" onClick={() => onSelect(recipe)}>
                {recipe.image_url
                  ? <img src={recipe.image_url} alt={recipe.title} className="recipe-thumb" />
                  : <div className="recipe-thumb-placeholder">🍽️</div>
                }
                <div className="recipe-info">
                  <h2 title={recipe.title}>{recipe.title}</h2>
                  <div className="recipe-meta">
                    {recipe.prep_time && <span>⏱ {recipe.prep_time} min</span>}
                    {recipe.cook_time && <span>🔥 {recipe.cook_time} min</span>}
                    {recipe.servings && <span>👥 {recipe.servings} pers.</span>}
                    <span>🥄 {recipe.ingredients.length} ingr.</span>
                  </div>
                </div>
                <button className="btn-icon delete" onClick={(e) => handleDelete(e, recipe.id)}>🗑</button>
              </li>
            ))}
          </ul>
          {hasMore && (
            <div style={{ textAlign: 'center', padding: '16px 0' }}>
              <button
                className="btn-outline"
                onClick={() => fetchPage(page + 1, true)}
                disabled={loadingMore}
              >
                {loadingMore ? <span className="spinner" style={{ width: 16, height: 16, display: 'inline-block' }} /> : 'Charger plus'}
              </button>
            </div>
          )}
        </>
      )}
    </div>
  )
}
