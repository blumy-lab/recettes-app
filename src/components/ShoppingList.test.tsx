import { describe, it, expect, vi, beforeEach, afterEach } from 'vitest'
import { waitFor, cleanup } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { render, screen, within } from '../test-utils'
import ShoppingList from './ShoppingList'
import type { ShoppingItem, ShoppingList as ShoppingListType } from '../types'

vi.mock('../lib/supabase', () => {
  const chain: Record<string, unknown> = {}
  const methods = ['select', 'eq', 'in', 'order', 'limit', 'update', 'delete', 'insert', 'upsert', 'not', 'is', 'single', 'count', 'head']
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
  getShoppingLists: vi.fn(),
  createShoppingList: vi.fn(),
  renameShoppingList: vi.fn(),
  deleteShoppingList: vi.fn(),
  getShoppingList: vi.fn(),
  addShoppingItem: vi.fn(),
  updateShoppingItem: vi.fn(),
  deleteShoppingItem: vi.fn(),
  clearCheckedItems: vi.fn(),
  clearAllShoppingItems: vi.fn(),
  getActiveListId: vi.fn().mockReturnValue('list-1'),
  setActiveListId: vi.fn(),
  shareListWithPseudo: vi.fn(),
  getListShares: vi.fn().mockResolvedValue([]),
  removeListShare: vi.fn(),
  createInviteLink: vi.fn().mockResolvedValue('http://example.com/invite'),
}))

vi.mock('../hooks/useOfflineSync', () => ({
  useOfflineSync: vi.fn(),
}))

vi.mock('../lib/offlineQueue', () => ({
  enqueue: vi.fn(),
}))

import {
  getShoppingLists,
  getShoppingList,
  clearCheckedItems,
} from '../store'

const mockList: ShoppingListType = {
  id: 'list-1',
  name: 'Courses',
  created_at: new Date().toISOString(),
}

const mockItems: ShoppingItem[] = [
  { id: 'item-1', name: 'Carottes', quantity: '500', unit: 'g', checked: false, rayon: 'Fruits & légumes' },
  { id: 'item-2', name: 'Pommes', quantity: '3', unit: '', checked: true, rayon: 'Fruits & légumes' },
]

afterEach(cleanup)

beforeEach(() => {
  vi.clearAllMocks()
  vi.mocked(getShoppingLists).mockResolvedValue([mockList])
  vi.mocked(getShoppingList).mockResolvedValue([])
})

describe('ShoppingList', () => {
  it('les items cochés apparaissent séparément des non-cochés', async () => {
    vi.mocked(getShoppingList).mockResolvedValue(mockItems)

    render(<ShoppingList />)

    await screen.findByText('Carottes')

    // L'item non coché doit être dans un li sans classe "checked"
    const carrotLi = screen.getByText('Carottes').closest('li')
    expect(carrotLi?.className).not.toContain('checked')

    // L'item coché doit être dans un li avec classe "checked"
    const appleLi = screen.getByText('Pommes').closest('li')
    expect(appleLi?.className).toContain('checked')

    // Le séparateur "Dans le panier" doit être visible
    expect(screen.getByText(/Dans le panier/)).toBeDefined()
  })

  it('cliquer sur "Supprimer les cochés" ouvre la modale de confirmation', async () => {
    const user = userEvent.setup()

    const { container } = render(<ShoppingList />)
    await waitFor(() => expect(vi.mocked(getShoppingList)).toHaveBeenCalled())

    // Ouvrir le menu ⋯ — scoped au container courant pour éviter les stale DOM nodes
    const header = container.querySelector('.page-header') as HTMLElement
    await user.click(within(header).getByText('⋯'))

    // Cliquer sur "Supprimer les cochés"
    await user.click(screen.getByText('Supprimer les cochés'))

    // La modale de confirmation doit apparaître
    expect(await screen.findByText('Supprimer les articles cochés ?')).toBeDefined()
  })

  it('annuler dans la modale ne supprime pas les articles', async () => {
    const user = userEvent.setup()
    vi.mocked(clearCheckedItems).mockResolvedValue(undefined)

    const { container } = render(<ShoppingList />)
    await waitFor(() => expect(vi.mocked(getShoppingList)).toHaveBeenCalled())

    // Ouvrir le menu et déclencher la confirmation
    const header = container.querySelector('.page-header') as HTMLElement
    await user.click(within(header).getByText('⋯'))
    await user.click(screen.getByText('Supprimer les cochés'))
    await screen.findByText('Supprimer les articles cochés ?')

    // Cliquer "Annuler"
    await user.click(screen.getByText('Annuler'))

    // clearCheckedItems ne doit pas avoir été appelé
    expect(vi.mocked(clearCheckedItems)).not.toHaveBeenCalled()
  })
})
