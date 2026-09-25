import { useState, useEffect, useRef, useCallback } from 'react'
import type { Recipe } from '../types'
import { getPublicRecipes, getFavoriteIds, getFavoriteRecipes, toggleFavorite } from '../store'
import { FILTER_CHIPS, getTagDef } from '../tags'

type SortMode = 'recent' | 'az' | 'duration' | 'favorites' | 'popular'

interface Props {
  onSelect: (recipe: Recipe) => void
  dietaryFilters?: string[]
}

export default function ExploreScreen({ onSelect, dietaryFilters = [] }: Props) {
  const [publicRecipes, setPublicRecipes] = useState<Recipe[]>([])
  const [favoriteRecipes, setFavoriteRecipes] = useState<Recipe[]>([])
  const [loading, setLoading] = useState(true)
  const [loadingMore, setLoadingMore] = useState(false)
  const [page, setPage] = useState(0)
  const [hasMore, setHasMore] = useState(false)
  const [search, setSearch] = useState('')
  const [debouncedSearch, setDebouncedSearch] = useState('')
  const [tab, setTab] = useState<'all' | 'favorites'>('all')
  const [activeTagFilters, setActiveTagFilters] = useState<string[]>(dietaryFilters)
  const [sortMode, setSortMode] = useState<SortMode>('recent')
  // favoriteIds chargés une fois au montage, accessibles via ref pour éviter de déclencher un re-fetch
  const [initDone, setInitDone] = useState(false)
  const favoriteIdsRef = useRef<string[]>([])
  const debounceTimer = useRef<ReturnType<typeof setTimeout> | null>(null)

  useEffect(() => {
    Promise.all([getFavoriteIds(), getFavoriteRecipes()])
      .then(([ids, favs]) => {
        favoriteIdsRef.current = ids
        setFavoriteRecipes(favs)
        setInitDone(true)
      })
      .catch(() => setInitDone(true))
  }, [])

  // Débounce 400ms sur la saisie
  useEffect(() => {
    if (debounceTimer.current) clearTimeout(debounceTimer.current)
    debounceTimer.current = setTimeout(() => setDebouncedSearch(search), 400)
    return () => { if (debounceTimer.current) clearTimeout(debounceTimer.current) }
  }, [search])

  const serverSort = sortMode === 'az' ? 'az' : 'recent'

  const fetchPage = useCallback(async (pageNum: number, append: boolean) => {
    if (!append) setLoading(true)
    else setLoadingMore(true)
    try {
      const result = await getPublicRecipes({
        page: pageNum,
        search: debouncedSearch.trim() || undefined,
        tags: activeTagFilters.length ? activeTagFilters : undefined,
        sort: serverSort,
        favoriteIds: favoriteIdsRef.current,
      })
      setPublicRecipes(prev => append ? [...prev, ...result.data] : result.data)
      setHasMore(result.hasMore)
      setPage(pageNum)
    } catch (e) {
      console.error(e)
    } finally {
      setLoading(false)
      setLoadingMore(false)
    }
  }, [debouncedSearch, activeTagFilters, serverSort])

  // Charge la page 0 une fois les favoriteIds connus, puis à chaque changement de recherche/filtres
  useEffect(() => {
    if (initDone && tab === 'all') fetchPage(0, false)
  }, [fetchPage, tab, initDone])

  const toggleTagFilter = (tag: string) => {
    setActiveTagFilters(prev => prev.includes(tag) ? prev.filter(t => t !== tag) : [...prev, tag])
  }

  const handleFavorite = async (e: React.MouseEvent, recipe: Recipe) => {
    e.stopPropagation()
    const nowFavorite = !(recipe.is_favorite || false)
    await toggleFavorite(recipe.id, recipe.is_favorite || false)
    setPublicRecipes(prev => prev.map(r => r.id === recipe.id ? { ...r, is_favorite: nowFavorite } : r))
    if (nowFavorite) {
      setFavoriteRecipes(prev => prev.find(r => r.id === recipe.id) ? prev : [...prev, { ...recipe, is_favorite: true }])
      favoriteIdsRef.current = [...favoriteIdsRef.current, recipe.id]
    } else {
      setFavoriteRecipes(prev => prev.filter(r => r.id !== recipe.id))
      favoriteIdsRef.current = favoriteIdsRef.current.filter(id => id !== recipe.id)
    }
  }

  // Onglet favoris : filtrage et tri client-side (liste courte)
  const favoritesFiltered = favoriteRecipes
    .filter(r => {
      const matchSearch = !debouncedSearch.trim() || r.title.toLowerCase().includes(debouncedSearch.toLowerCase())
      const matchTags = activeTagFilters.length === 0 || activeTagFilters.every(tag => r.tags?.includes(tag))
      return matchSearch && matchTags
    })
    .sort((a, b) => {
      if (sortMode === 'az') return a.title.localeCompare(b.title, 'fr')
      if (sortMode === 'duration') return ((a.prep_time || 0) + (a.cook_time || 0)) - ((b.prep_time || 0) + (b.cook_time || 0))
      if (sortMode === 'popular') return (b.favorites_count || 0) - (a.favorites_count || 0)
      return new Date(b.created_at).getTime() - new Date(a.created_at).getTime()
    })

  // Onglet "Toutes" : tri client-side sur la liste accumulée (recherche/tags déjà filtrés côté serveur)
  const publicSorted = [...publicRecipes].sort((a, b) => {
    if (sortMode === 'az') return a.title.localeCompare(b.title, 'fr')
    if (sortMode === 'duration') return ((a.prep_time || 0) + (a.cook_time || 0)) - ((b.prep_time || 0) + (b.cook_time || 0))
    if (sortMode === 'favorites') return (b.is_favorite ? 1 : 0) - (a.is_favorite ? 1 : 0)
    if (sortMode === 'popular') return (b.favorites_count || 0) - (a.favorites_count || 0)
    return new Date(b.created_at).getTime() - new Date(a.created_at).getTime()
  })

  const displayList = tab === 'favorites' ? favoritesFiltered : publicSorted

  return (
    <div className="page explore-page">
      <header className="page-header">
        <h1>Explorer</h1>
      </header>

      <div className="explore-content">
        <div className="explore-tabs">
          <button className={`explore-tab ${tab === 'all' ? 'active' : ''}`} onClick={() => setTab('all')}>
            🌍 Toutes
          </button>
          <button className={`explore-tab ${tab === 'favorites' ? 'active' : ''}`} onClick={() => setTab('favorites')}>
            ❤️ Mes favoris
          </button>
        </div>

        <div className="search-bar">
          <input
            type="text"
            placeholder="Rechercher une recette…"
            value={search}
            onChange={(e) => setSearch(e.target.value)}
          />
        </div>

        <div className="filter-bar">
          <button
            className={`filter-chip${activeTagFilters.length === 0 ? ' active' : ''}`}
            onClick={() => setActiveTagFilters([])}
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

        {loading ? (
          <div className="empty-state"><div className="spinner" /></div>
        ) : displayList.length === 0 ? (
          <div className="empty-state">
            <p>🍽️</p>
            <p>{tab === 'favorites' ? 'Aucun favori pour l\'instant' : 'Aucune recette publique'}</p>
            <p className="hint">Publiez vos recettes pour les partager avec la communauté</p>
          </div>
        ) : (
          <>
            <div className="explore-grid">
              {displayList.map(recipe => (
                <div key={recipe.id} className="explore-card" onClick={() => onSelect(recipe)}>
                  {recipe.image_url ? (
                    <img src={recipe.image_url} alt={recipe.title} className="explore-card-img" />
                  ) : (
                    <div className="explore-card-placeholder">🍽️</div>
                  )}
                  <div className="explore-card-body">
                    <h3 className="explore-card-title">{recipe.title}</h3>
                    {recipe.author_name && (
                      <div style={{ fontSize: 11, color: 'var(--text-tertiary)', marginBottom: 4 }}>@{recipe.author_name}</div>
                    )}
                    <div className="explore-card-meta">
                      {recipe.prep_time && <span>⏱ {recipe.prep_time} min</span>}
                      {recipe.servings && <span>👥 {recipe.servings}</span>}
                      <span>{recipe.ingredients.length} ingr.</span>
                    </div>
                  </div>
                  <button
                    className="explore-fav-btn"
                    onClick={(e) => handleFavorite(e, recipe)}
                    title={recipe.is_favorite ? 'Retirer des favoris' : 'Ajouter aux favoris'}
                  >
                    {recipe.is_favorite ? '❤️' : '🤍'}
                  </button>
                </div>
              ))}
            </div>
            {tab === 'all' && hasMore && (
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
    </div>
  )
}
