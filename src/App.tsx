import { useState, useEffect } from 'react'
import { AuthProvider, useAuth } from './contexts/AuthContext'
import { HouseholdsProvider } from './hooks/useHouseholds'
import { ConfirmProvider } from './hooks/useConfirm'
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
import type { Recipe } from './types'
import { getRecipes, acceptInvite, setActiveListId, getProfile, acceptMenuInvite } from './store'
import { supabase } from './lib/supabase'
import { getPendingCount } from './lib/offlineQueue'
import './App.css'

type View = 'recipes' | 'shopping' | 'planner' | 'explore' | 'pantry' | 'import' | 'import-photo' | 'create' | 'edit' | 'detail' | 'detail-public' | 'profile'

function AppContent() {
  const { user, loading, signOut } = useAuth()
  const [view, setView] = useState<View>('recipes')
  const [refreshKey, setRefreshKey] = useState(0)
  const [plannerRecipes, setPlannerRecipes] = useState<Recipe[]>([])
  const [selectedRecipe, setSelectedRecipe] = useState<Recipe | null>(null)
  const [isPasswordRecovery, setIsPasswordRecovery] = useState(false)
  const [dietaryFilters, setDietaryFilters] = useState<string[]>([])
  const [isOnline, setIsOnline] = useState(navigator.onLine)
  const [offlinePendingCount, setOfflinePendingCount] = useState(0)
  const [pendingMenuId, setPendingMenuId] = useState<string | null>(null)
  const [returnView, setReturnView] = useState<View>('recipes')

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
  }, [view, returnView])

  // Capturer les tokens d'invitation AVANT la connexion
  useEffect(() => {
    const params = new URLSearchParams(window.location.search)
    const inviteToken = params.get('invite')
    const menuInviteToken = params.get('menu_invite')
    if (inviteToken || menuInviteToken) {
      if (inviteToken) sessionStorage.setItem('pending_invite', inviteToken)
      if (menuInviteToken) sessionStorage.setItem('pending_menu_invite', menuInviteToken)
      window.history.replaceState({}, '', '/')
    }
  }, [])

  useEffect(() => {
    if (!user) return

    // Charger les préférences alimentaires
    getProfile().then((p) => {
      if (p?.dietary_filters) setDietaryFilters(p.dietary_filters)
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
      window.history.replaceState({}, '', '/')
      sessionStorage.setItem('shared_url', sharedUrl)
      setView('import')
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

  const goBack = () => {
    setSelectedRecipe(null)
    setView(returnView)
    if (returnView === 'recipes') triggerRefresh()
    setReturnView('recipes')
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
      {view === 'recipes' && (
        <RecipeList
          onSelect={openRecipe}
          onImport={() => setView('import')}
          onCreate={() => setView('create')}
          onGoToProfile={() => setView('profile')}
          dietaryFilters={dietaryFilters}
          refreshKey={refreshKey}
        />
      )}
      {view === 'detail' && selectedRecipe && (
        <RecipeDetail
          recipe={selectedRecipe}
          onBack={goBack}
          onEdit={() => setView('edit')}
          onRefresh={triggerRefresh}
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
        />
      )}
      {view === 'profile' && (
        <ProfileScreen
          onSignOut={signOut}
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
