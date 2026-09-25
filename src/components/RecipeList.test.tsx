import { describe, it, expect, vi, beforeEach, afterEach } from 'vitest'
import { fireEvent } from '@testing-library/react'
import { render, screen, act } from '../test-utils'
import RecipeList from './RecipeList'
import type { Recipe } from '../types'

vi.mock('../lib/supabase', () => {
  const chain: Record<string, unknown> = {}
  const methods = ['select', 'eq', 'in', 'order', 'limit', 'update', 'delete', 'insert', 'upsert', 'not', 'is', 'single']
  methods.forEach(m => { (chain as Record<string, () => unknown>)[m] = vi.fn(() => chain) })
  chain.then = (resolve: (v: unknown) => void) =>
    Promise.resolve({ data: [], error: null, count: null }).then(resolve)
  return {
    supabase: {
      auth: {
        getSession: vi.fn().mockResolvedValue({ data: { session: null } }),
        getUser: vi.fn().mockResolvedValue({ data: { user: null } }),
        onAuthStateChange: vi.fn().mockReturnValue({ data: { subscription: { unsubscribe: vi.fn() } } }),
        signOut: vi.fn(),
      },
      from: vi.fn(() => chain),
      rpc: vi.fn().mockResolvedValue({ data: [], error: null }),
      channel: vi.fn(() => ({ on: vi.fn().mockReturnThis(), subscribe: vi.fn() })),
      removeChannel: vi.fn(),
    },
  }
})

vi.mock('../store', () => ({
  getRecipes: vi.fn(),
  getProfile: vi.fn(),
  deleteRecipe: vi.fn(),
}))

import { getRecipes, getProfile } from '../store'

const mockRecipe: Recipe = {
  id: 'r1',
  title: 'Poulet rôti',
  source_url: '',
  ingredients: [{ id: 'i1', name: 'Poulet', quantity: '1', unit: 'kg' }],
  steps: ['Cuire'],
  created_at: new Date().toISOString(),
}

const defaultProps = {
  onSelect: vi.fn(),
  onImport: vi.fn(),
  onCreate: vi.fn(),
  onGoToProfile: vi.fn(),
}

beforeEach(() => {
  vi.clearAllMocks()
  vi.mocked(getProfile).mockResolvedValue(null)
})

// Garantit que les faux timers sont remis en état même si un test échoue
afterEach(() => {
  vi.useRealTimers()
})

describe('RecipeList', () => {
  it('affiche "Aucune recette" quand le tableau est vide', async () => {
    vi.mocked(getRecipes).mockResolvedValue({ data: [], hasMore: false })

    render(<RecipeList {...defaultProps} />)

    expect(await screen.findByText('Aucune recette pour l\'instant')).toBeDefined()
  })

  it('débounce la recherche à 400ms', async () => {
    // Recette initiale pour que la barre de recherche soit visible
    vi.mocked(getRecipes).mockResolvedValue({ data: [mockRecipe], hasMore: false })

    render(<RecipeList {...defaultProps} />)
    await screen.findByText('Poulet rôti')

    // Passe aux faux timers après le rendu initial
    vi.useFakeTimers()
    vi.mocked(getRecipes).mockClear()
    vi.mocked(getRecipes).mockResolvedValue({ data: [], hasMore: false })

    const searchInput = screen.getByPlaceholderText('Rechercher une recette…')
    fireEvent.change(searchInput, { target: { value: 'poulet' } })

    // Avant le délai, getRecipes ne doit pas encore avoir été appelé avec le terme
    expect(vi.mocked(getRecipes)).not.toHaveBeenCalledWith(
      expect.objectContaining({ search: 'poulet' })
    )

    // Avance de 400ms et vide la file des promesses en attente
    await act(async () => { vi.advanceTimersByTime(400) })

    expect(vi.mocked(getRecipes)).toHaveBeenCalledWith(
      expect.objectContaining({ search: 'poulet' })
    )
  })

  it('un clic sur une recette appelle onSelect avec la bonne recette', async () => {
    const onSelect = vi.fn()
    vi.mocked(getRecipes).mockResolvedValue({ data: [mockRecipe], hasMore: false })

    render(<RecipeList {...defaultProps} onSelect={onSelect} />)

    const title = await screen.findByText('Poulet rôti')
    fireEvent.click(title.closest('li')!)

    expect(onSelect).toHaveBeenCalledTimes(1)
    expect(onSelect).toHaveBeenCalledWith(mockRecipe)
  })
})
