import { useState, useEffect, useRef } from 'react'
import { AuthProvider } from './contexts/AuthContext'
import { useAuth } from './hooks/useAuth'
import { HouseholdsProvider } from './hooks/useHouseholds'
import { ConfirmProvider } from './hooks/ConfirmProvider'
import AuthScreen from './components/AuthScreen'
import RecipeList from './components/RecipeList'
import RecipeDetail from './components/RecipeDetail'
import RecipeForm from './components/RecipeForm'
import ShoppingList from './components/ShoppingList'
import ImportRecipe from './components/ImportRecipe'
import ImportPhoto from './components/ImportPhoto'
import ProfileScreen from './components/ProfileScreen'
import MealPlanner from './components/MealPlanner'
import ExploreScreen from './components/ExploreScreen'
import PantryScreen from './components/PantryScreen'
import PublicRecipeView from './components/PublicRecipeView'
import type { Recipe, Profile } from './types'
import { getRecipes, getRecipesByIds, getPublicRecipeById, acceptInvite, setActiveListId, getProfile, acceptMenuInvite } from './store'
import { supabase } from './lib/supabase'
import { getPendingCount } from './lib/offlineQueue'
import { isValidRecipeId } from './lib/publicRecipeUrl'
import { clearPersisted } from './lib/persistedState'
import { syncHistory, readEntry } from './lib/navHistory'
import { loadNav, saveNav, DEFAULT_NAV, viewNeedsRecipe, type View, type NavState } from './lib/navState'
import './App.css'

function AppContent() {
  const { user, loading, signOut } = useAuth()
  // Page courante restaurée après une actualisation (un lien de partage ?url=
  // garde la priorité et ouvre l'import).
  const [initialNav] = useState<NavState>(() =>
    new URLSearchParams(window.location.search).get('url')
      ? { ...DEFAULT_NAV, view: 'import' }
      : loadNav()
  )
  const [view, setView] = useState<View>(initialNav.view)
  const [refreshKey, setRefreshKey] = useState(0)
  const [plannerRecipes, setPlannerRecipes] = useState<Recipe[]>([])
  const [selectedRecipe, setSelectedRecipe] = useState<Recipe | null>(null)
  // Recette à recharger par son id après une actualisation (fiche, édition).
  const [restoring, setRestoring] = useState<{ id: string; view: View } | null>(() =>
    initialNav.recipeId && viewNeedsRecipe(initialNav.view) ? { id: initialNav.recipeId, view: initialNav.view } : null
  )
  const [isPasswordRecovery, setIsPasswordRecovery] = useState(false)
  const [dietaryFilters, setDietaryFilters] = useState<string[]>([])
  const [seasonZone, setSeasonZone] = useState<Profile['season_zone'] | null>(null)
  const [isOnline, setIsOnline] = useState(navigator.onLine)
  const [offlinePendingCount, setOfflinePendingCount] = useState(0)
  const [pendingMenuId, setPendingMenuId] = useState<string | null>(null)
  const [recipeToAdd, setRecipeToAdd] = useState<Recipe | null>(null)
  const [returnView, setReturnView] = useState<View>(initialNav.returnView)

  useEffect(() => {
    saveNav({ view, returnView, recipeId: selectedRecipe?.id ?? restoring?.id ?? null })
  }, [view, returnView, selectedRecipe, restoring])

  // Historique du navigateur : le geste « retour » du téléphone revient à l'écran précédent
  const selectedRef = useRef<Recipe | null>(null)
  useEffect(() => { selectedRef.current = selectedRecipe }, [selectedRecipe])

  useEffect(() => {
    syncHistory({ view, returnView, recipeId: selectedRecipe?.id ?? restoring?.id ?? null })
  }, [view, returnView, selectedRecipe, restoring])

  useEffect(() => {
    const onPopState = (e: PopStateEvent) => {
      const entry = readEntry(e.state)
      if (!entry) return
      const { view: v, returnView: rv, recipeId } = entry.nav
      setView(v)
      setReturnView(rv)
      if (viewNeedsRecipe(v) && recipeId) {
        if (selectedRef.current?.id !== recipeId) {
          setSelectedRecipe(null)
          setRestoring({ id: recipeId, view: v })
        }
      } else {
        setSelectedRecipe(null)
        setRestoring(null)
      }
    }
    window.addEventListener('popstate', onPopState)
    return () => window.removeEventListener('popstate', onPopState)
  }, [])

  // Chaque nouvel écran s'ouvre en haut de page
  useEffect(() => { window.scrollTo(0, 0) }, [view])

  // Recharge la recette de la fiche/édition ouverte avant l'actualisation
  useEffect(() => {
    if (!user || !restoring) return
    let cancelled = false
    const { id, view: restoredView } = restoring
    const load = restoredView === 'detail-public'
      ? getPublicRecipeById(id)
      : getRecipesByIds([id]).then(found => found[0] ?? null)
    load
      .catch(() => null)
      .then(recipe => {
        if (cancelled) return
        if (recipe) setSelectedRecipe(recipe)
        else {
          // recette supprimée ou devenue inaccessible : retour à la liste
          setView(restoredView === 'detail-public' ? 'explore' : 'recipes')
          setReturnView('recipes')
        }
        setRestoring(null)
      })
    return () => { cancelled = true }
  }, [user, restoring])

  // Bandeau offline
  useEffect(() => {
    const onOnline = () => {
      setIsOnline(true)
      getPendingCount().then(setOfflinePendingCount)
    }
    const onOffline = () => {
      setIsOnline(false)
      getPendingCount().then(setOfflinePendingCount)
    }
    window.addEventListener('online', onOnline)
    window.addEventListener('offline', onOffline)

    // Rafraîchir le compteur toutes les 3s quand hors ligne
    const interval = setInterval(() => {
      if (!navigator.onLine) getPendingCount().then(setOfflinePendingCount)
    }, 3000)

    return () => {
      window.removeEventListener('online', onOnline)
      window.removeEventListener('offline', onOffline)
      clearInterval(interval)
    }
  }, [])

  // Détecter le retour depuis un lien de réinitialisation de mot de passe
  useEffect(() => {
    const { data: { subscription } } = supabase.auth.onAuthStateChange((event) => {
      if (event === 'PASSWORD_RECOVERY') {
        setIsPasswordRecovery(true)
        setView('profile')
      }
    })
    return () => subscription.unsubscribe()
  }, [])

  const triggerRefresh = () => setRefreshKey(k => k + 1)

  // Charge les recettes de l'utilisateur pour MealPlanner la première fois que le planner s'ouvre
  useEffect(() => {
    if ((view === 'planner' || (view === 'detail' && returnView === 'planner')) && plannerRecipes.length === 0) {
      getRecipes().then(({ data }) => setPlannerRecipes(data)).catch(console.error)
    }
  }, [view, returnView, plannerRecipes.length])

  // Capturer les tokens d'invitation AVANT la connexion
  useEffect(() => {
    const params = new URLSearchParams(window.location.search)
    const inviteToken = params.get('invite')
    const menuInviteToken = params.get('menu_invite')
    if (inviteToken || menuInviteToken) {
      if (inviteToken) sessionStorage.setItem('pending_invite', inviteToken)
      if (menuInviteToken) sessionStorage.setItem('pending_menu_invite', menuInviteToken)
      window.history.replaceState(window.history.state, '', '/')
    }
  }, [])

  useEffect(() => {
    if (!user) return

    // Charger les préférences alimentaires
    getProfile().then((p) => {
      if (p?.dietary_filters) setDietaryFilters(p.dietary_filters)
      if (p) setSeasonZone(p.season_zone)
    })

    // Accepter une invitation de liste en attente
    const pendingInvite = sessionStorage.getItem('pending_invite')
    if (pendingInvite) {
      sessionStorage.removeItem('pending_invite')
      acceptInvite(pendingInvite)
        .then((listId) => {
          setActiveListId(listId)
          setView('shopping')
        })
        .catch((e) => console.error('Invite error:', e))
    }

    // Accepter une invitation de menu en attente
    const pendingMenuInvite = sessionStorage.getItem('pending_menu_invite')
    if (pendingMenuInvite) {
      sessionStorage.removeItem('pending_menu_invite')
      acceptMenuInvite(pendingMenuInvite)
        .then((menuId) => {
          setPendingMenuId(menuId)
          setView('planner')
        })
        .catch((e) => console.error('Menu invite error:', e))
    }

    const params = new URLSearchParams(window.location.search)
    const sharedUrl = params.get('url')
    if (sharedUrl) {
      window.history.replaceState(window.history.state, '', '/')
      sessionStorage.setItem('shared_url', sharedUrl)
    }

    // Temps réel — synchronisation des recettes du foyer
    const channel = supabase
      .channel('recipes_realtime')
      .on('postgres_changes', { event: '*', schema: 'public', table: 'recipes' }, () => {
        triggerRefresh()
      })
      .subscribe()

    return () => { supabase.removeChannel(channel) }
  }, [user])

  if (loading) {
    return (
      <div className="auth-screen">
        <div className="auth-card" style={{ alignItems: 'center' }}>
          <div className="spinner" style={{ width: 40, height: 40 }} />
        </div>
      </div>
    )
  }

  if (!user) return <AuthScreen />

  const openRecipe = (recipe: Recipe, from: View = 'recipes') => {
    setSelectedRecipe(recipe)
    setReturnView(from)
    setView('detail')
  }

  // « Au menu » depuis une fiche : on ouvre le planificateur qui demande l'emplacement
  const addToMenu = (recipe: Recipe) => {
    setRecipeToAdd(recipe)
    setView('planner')
  }

  const goBack = () => {
    setSelectedRecipe(null)
    setView(returnView)
    if (returnView === 'recipes') triggerRefresh()
    setReturnView('recipes')
  }

  // Déconnexion : on efface l'état sauvegardé (page, brouillons) pour qu'il ne
  // soit pas montré à la prochaine personne qui se connecte dans cet onglet.
  const handleSignOut = () => {
    clearPersisted()
    setSelectedRecipe(null)
    setRestoring(null)
    setReturnView('recipes')
    setView('recipes')
    return signOut()
  }

  // La nav reste visible dans detail, detail-public, planner et profile ; cachée dans les vues formulaire/import
  const isFullscreen = ['import', 'import-photo', 'create', 'edit'].includes(view)

  return (
    <div className="app">
      {!isOnline && (
        <div className="offline-banner">
          {offlinePendingCount > 0
            ? `Mode hors ligne — ${offlinePendingCount} modification${offlinePendingCount > 1 ? 's' : ''} en attente`
            : 'Mode hors ligne — les modifications seront synchronisées à la reconnexion'}
        </div>
      )}
      {restoring && (
        <div className="page">
          <div className="empty-state"><div className="spinner" /></div>
        </div>
      )}
      {view === 'recipes' && (
        <RecipeList
          onSelect={openRecipe}
          onImport={() => setView('import')}
          onCreate={() => setView('create')}
          onGoToProfile={() => setView('profile')}
          dietaryFilters={dietaryFilters}
          refreshKey={refreshKey}
          seasonZone={seasonZone}
        />
      )}
      {view === 'detail' && selectedRecipe && (
        <RecipeDetail
          recipe={selectedRecipe}
          onBack={goBack}
          onEdit={() => setView('edit')}
          onRefresh={triggerRefresh}
          seasonZone={seasonZone}
          onAddToMenu={addToMenu}
        />
      )}

      {view === 'shopping' && <ShoppingList />}
      {view === 'import' && (
        <ImportRecipe
          onBack={() => { setView('recipes'); triggerRefresh() }}
          onSuccess={(recipe) => { setSelectedRecipe(recipe); setView('detail'); triggerRefresh() }}
          onImportPhoto={() => setView('import-photo')}
        />
      )}
      {view === 'explore' && (
        <ExploreScreen
          onSelect={(recipe) => { setSelectedRecipe(recipe); setView('detail-public') }}
          dietaryFilters={dietaryFilters}
          seasonZone={seasonZone}
        />
      )}
      {view === 'pantry' && <PantryScreen />}
      {view === 'detail-public' && selectedRecipe && (
        <RecipeDetail
          recipe={selectedRecipe}
          onBack={() => setView('explore')}
          onEdit={() => setView('edit')}
          onRefresh={triggerRefresh}
          isPublicView={true}
          onSaved={() => { triggerRefresh(); setView('recipes') }}
          seasonZone={seasonZone}
          onAddToMenu={addToMenu}
        />
      )}
      {view === 'profile' && (
        <ProfileScreen
          onSignOut={handleSignOut}
          isPasswordRecovery={isPasswordRecovery}
          onPasswordRecoveryDone={() => setIsPasswordRecovery(false)}
          onDietaryFiltersChange={setDietaryFilters}
        />
      )}
      {(view === 'planner' || (view === 'detail' && returnView === 'planner')) && (
        <div style={view !== 'planner' ? { display: 'none' } : undefined}>
          <MealPlanner
            recipes={plannerRecipes}
            onBack={() => setView('recipes')}
            onGoToShopping={() => setView('shopping')}
            onOpenRecipe={(recipe) => openRecipe(recipe, 'planner')}
            defaultDietaryFilters={dietaryFilters}
            pendingMenuId={pendingMenuId}
            onMenuOpened={() => setPendingMenuId(null)}
            seasonZone={seasonZone}
            recipeToAdd={recipeToAdd}
            onRecipeAddDone={() => setRecipeToAdd(null)}
          />
        </div>
      )}
      {view === 'import-photo' && (
        <ImportPhoto
          onBack={() => setView('import')}
          onSuccess={(recipe) => { setSelectedRecipe(recipe); setView('detail'); triggerRefresh() }}
        />
      )}
      {view === 'create' && (
        <RecipeForm
          onBack={() => setView('recipes')}
          onSuccess={(recipe) => { setSelectedRecipe(recipe); setView('detail'); triggerRefresh() }}
        />
      )}
      {view === 'edit' && selectedRecipe && (
        <RecipeForm
          initial={selectedRecipe}
          onBack={() => setView('detail')}
          onSuccess={(recipe) => { setSelectedRecipe(recipe); setView('detail'); triggerRefresh() }}
        />
      )}

      {!isFullscreen && (
        <nav className="bottom-nav">
          <button className={view === 'recipes' ? 'active' : ''} onClick={() => setView('recipes')}>
            <span className="nav-icon">🍽️</span>
            <span>Recettes</span>
          </button>
          <button className={view === 'shopping' ? 'active' : ''} onClick={() => setView('shopping')}>
            <span className="nav-icon">🛒</span>
            <span>Courses</span>
          </button>
          <button className={view === 'planner' ? 'active' : ''} onClick={() => setView('planner')}>
            <span className="nav-icon">📅</span>
            <span>Menu</span>
          </button>
          <button className={view === 'explore' ? 'active' : ''} onClick={() => setView('explore')}>
            <span className="nav-icon">🌍</span>
            <span>Explorer</span>
          </button>
          <button className={view === 'pantry' ? 'active' : ''} onClick={() => setView('pantry')}>
            <span className="nav-icon">🏠</span>
            <span>Stock</span>
          </button>
          <button className={view === 'profile' ? 'active' : ''} onClick={() => setView('profile')}>
            <span className="nav-icon">⚙️</span>
            <span>Profil</span>
          </button>
        </nav>
      )}
    </div>
  )
}

export default function App() {
  const publicRecipeId = new URLSearchParams(window.location.search).get('public_recipe')
  if (publicRecipeId && isValidRecipeId(publicRecipeId)) {
    return <PublicRecipeView recipeId={publicRecipeId} />
  }

  return (
    <AuthProvider>
      <HouseholdsProvider>
        <ConfirmProvider>
          <AppContent />
        </ConfirmProvider>
      </HouseholdsProvider>
    </AuthProvider>
  )
}
