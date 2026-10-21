import { describe, it, expect, vi, beforeEach, afterEach } from 'vitest'
import { render, screen, fireEvent, waitFor } from '@testing-library/react'
import App from './App'
import { saveNav, loadNav } from './lib/navState'
import { readPersisted, writePersisted } from './lib/persistedState'
import type { Recipe } from './types'

// ── Réseau / base : session connectée factice, aucune requête réelle ──
vi.mock('./lib/supabase', () => {
  const chain: Record<string, unknown> = {}
  const methods = ['select', 'eq', 'in', 'order', 'limit', 'update', 'delete', 'insert', 'upsert', 'not', 'is', 'single']
  methods.forEach(m => { (chain as Record<string, () => unknown>)[m] = vi.fn(() => chain) })
  chain.then = (resolve: (v: unknown) => void) =>
    Promise.resolve({ data: [], error: null, count: null }).then(resolve)
  return {
    supabase: {
      auth: {
        getSession: vi.fn().mockResolvedValue({ data: { session: { user: { id: 'u1' } } } }),
        getUser: vi.fn().mockResolvedValue({ data: { user: { id: 'u1' } } }),
        onAuthStateChange: vi.fn().mockReturnValue({ data: { subscription: { unsubscribe: vi.fn() } } }),
        signOut: vi.fn().mockResolvedValue({}),
      },
      from: vi.fn(() => chain),
      rpc: vi.fn().mockResolvedValue({ data: [], error: null }),
      channel: vi.fn(() => ({ on: vi.fn().mockReturnThis(), subscribe: vi.fn() })),
      removeChannel: vi.fn(),
    },
  }
})

vi.mock('./store', () => ({
  getRecipes: vi.fn().mockResolvedValue({ data: [], hasMore: false }),
  getRecipesByIds: vi.fn(),
  getPublicRecipeById: vi.fn(),
  acceptInvite: vi.fn(),
  setActiveListId: vi.fn(),
  getProfile: vi.fn().mockResolvedValue(null),
  acceptMenuInvite: vi.fn(),
}))

vi.mock('./lib/offlineQueue', () => ({ getPendingCount: vi.fn().mockResolvedValue(0) }))

// ── Écrans remplacés par des repères : on teste uniquement la navigation ──
vi.mock('./components/RecipeList', () => ({ default: () => <div data-testid="screen-recipes">liste</div> }))
vi.mock('./components/ShoppingList', () => ({ default: () => <div data-testid="screen-shopping">courses</div> }))
vi.mock('./components/MealPlanner', () => ({ default: () => <div data-testid="screen-planner">menu</div> }))
vi.mock('./components/ExploreScreen', () => ({ default: () => <div data-testid="screen-explore">explorer</div> }))
vi.mock('./components/PantryScreen', () => ({ default: () => <div data-testid="screen-pantry">stock</div> }))
vi.mock('./components/ImportRecipe', () => ({ default: () => <div data-testid="screen-import">import</div> }))
vi.mock('./components/ImportPhoto', () => ({ default: () => <div data-testid="screen-import-photo">photo</div> }))
vi.mock('./components/RecipeForm', () => ({
  default: ({ initial }: { initial?: { title: string } }) => <div data-testid="screen-form">{initial ? `édition ${initial.title}` : 'création'}</div>,
}))
vi.mock('./components/RecipeDetail', () => ({
  default: ({ recipe, onBack }: { recipe: { title: string }; onBack: () => void }) => (
    <div data-testid="screen-detail">Fiche : {recipe.title}<button onClick={onBack}>retour-fiche</button></div>
  ),
}))
vi.mock('./components/ProfileScreen', () => ({
  default: ({ onSignOut }: { onSignOut: () => void }) => (
    <div data-testid="screen-profile"><button onClick={onSignOut}>se-deconnecter</button></div>
  ),
}))

import { getRecipesByIds, getPublicRecipeById } from './store'

const poulet: Recipe = {
  id: 'r1', title: 'Poulet rôti', source_url: '',
  ingredients: [{ id: 'i1', name: 'Poulet', quantity: '1', unit: 'kg' }],
  steps: ['Cuire'], created_at: new Date().toISOString(),
}

beforeEach(() => {
  vi.mocked(getRecipesByIds).mockResolvedValue([poulet])
  vi.mocked(getPublicRecipeById).mockResolvedValue(poulet)
})

afterEach(() => {
  window.history.replaceState({}, '', '/')
})

describe('App — la page courante survit à une actualisation', () => {
  it('démarre sur la liste des recettes quand rien n\'est sauvegardé', async () => {
    render(<App />)
    expect(await screen.findByTestId('screen-recipes')).toBeDefined()
  })

  it('revient sur l\'onglet Courses après une actualisation', async () => {
    saveNav({ view: 'shopping', returnView: 'recipes', recipeId: null })

    render(<App />)

    expect(await screen.findByTestId('screen-shopping')).toBeDefined()
    expect(screen.queryByTestId('screen-recipes')).toBeNull()
  })

  it('mémorise l\'onglet choisi : remonter l\'appli retombe sur le même onglet', async () => {
    const first = render(<App />)
    await screen.findByTestId('screen-recipes')

    fireEvent.click(screen.getByText('Stock'))
    await screen.findByTestId('screen-pantry')
    expect(loadNav().view).toBe('pantry')
    first.unmount() // = actualisation de la page

    render(<App />)
    expect(await screen.findByTestId('screen-pantry')).toBeDefined()
  })

  it('recharge la fiche recette qui était ouverte', async () => {
    saveNav({ view: 'detail', returnView: 'recipes', recipeId: 'r1' })

    render(<App />)

    expect(await screen.findByText('Fiche : Poulet rôti')).toBeDefined()
    expect(getRecipesByIds).toHaveBeenCalledWith(['r1'])
  })

  it('recharge l\'édition d\'une recette (formulaire sur la bonne recette)', async () => {
    saveNav({ view: 'edit', returnView: 'recipes', recipeId: 'r1' })

    render(<App />)

    expect(await screen.findByText('édition Poulet rôti')).toBeDefined()
  })

  it('une fiche d\'Explorer est rechargée comme recette publique', async () => {
    saveNav({ view: 'detail-public', returnView: 'recipes', recipeId: 'r1' })

    render(<App />)

    expect(await screen.findByText('Fiche : Poulet rôti')).toBeDefined()
    expect(getPublicRecipeById).toHaveBeenCalledWith('r1')
  })

  it('si la recette n\'existe plus, retombe sur la liste au lieu d\'un écran vide', async () => {
    vi.mocked(getRecipesByIds).mockResolvedValue([])
    saveNav({ view: 'detail', returnView: 'recipes', recipeId: 'supprimee' })

    render(<App />)

    expect(await screen.findByTestId('screen-recipes')).toBeDefined()
    expect(screen.queryByTestId('screen-detail')).toBeNull()
  })

  it('si le chargement de la recette échoue (hors ligne), retombe sur la liste', async () => {
    vi.mocked(getRecipesByIds).mockRejectedValue(new Error('réseau'))
    saveNav({ view: 'detail', returnView: 'recipes', recipeId: 'r1' })

    render(<App />)

    expect(await screen.findByTestId('screen-recipes')).toBeDefined()
  })

  it('un lien de partage ?url= garde la priorité sur la page sauvegardée', async () => {
    saveNav({ view: 'shopping', returnView: 'recipes', recipeId: null })
    window.history.replaceState({}, '', '/?url=https%3A%2F%2Fexemple.fr%2Frecette')

    render(<App />)

    expect(await screen.findByTestId('screen-import')).toBeDefined()
  })

  it('un état sauvegardé illisible est ignoré', async () => {
    localStorage.setItem('mr:v1:nav', '{pas du json')

    render(<App />)

    expect(await screen.findByTestId('screen-recipes')).toBeDefined()
  })

  it('la déconnexion efface la page et les brouillons sauvegardés', async () => {
    writePersisted('form:new:title', 'brouillon secret')
    writePersisted('list:search', 'poulet')
    saveNav({ view: 'profile', returnView: 'recipes', recipeId: null })

    render(<App />)
    fireEvent.click(await screen.findByText('se-deconnecter'))

    await waitFor(() => expect(readPersisted('form:new:title')).toBeUndefined())
    expect(readPersisted('list:search')).toBeUndefined()
    expect(loadNav().view).toBe('recipes')
  })
})
