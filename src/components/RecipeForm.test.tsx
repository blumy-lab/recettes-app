import { describe, it, expect, vi, beforeEach } from 'vitest'
import { render, screen, fireEvent, cleanup, waitFor } from '@testing-library/react'
import RecipeForm from './RecipeForm'
import type { Recipe } from '../types'

vi.mock('../store', () => ({
  saveRecipe: vi.fn().mockResolvedValue(undefined),
}))

import { saveRecipe } from '../store'

const existing: Recipe = {
  id: 'r-42',
  title: 'Gratin',
  source_url: '',
  ingredients: [{ id: 'i1', name: 'Pommes de terre', quantity: '1', unit: 'kg' }],
  steps: ['Cuire'],
  created_at: new Date().toISOString(),
}

const titleInput = () => screen.getByPlaceholderText('Ex : Quiche lorraine') as HTMLInputElement

beforeEach(() => {
  vi.clearAllMocks()
})

describe('RecipeForm — brouillon conservé après actualisation', () => {
  it('retrouve le titre et les ingrédients saisis après un rechargement', () => {
    const first = render(<RecipeForm onBack={vi.fn()} onSuccess={vi.fn()} />)
    fireEvent.change(titleInput(), { target: { value: 'Tarte aux poireaux' } })
    fireEvent.change(screen.getByPlaceholderText('farine'), { target: { value: 'poireaux' } })
    first.unmount() // = actualisation de la page

    render(<RecipeForm onBack={vi.fn()} onSuccess={vi.fn()} />)
    expect(titleInput().value).toBe('Tarte aux poireaux')
    expect((screen.getByPlaceholderText('farine') as HTMLInputElement).value).toBe('poireaux')
  })

  it('le retour volontaire (←) efface le brouillon', () => {
    const onBack = vi.fn()
    const first = render(<RecipeForm onBack={onBack} onSuccess={vi.fn()} />)
    fireEvent.change(titleInput(), { target: { value: 'Brouillon abandonné' } })
    fireEvent.click(screen.getByText('←'))
    expect(onBack).toHaveBeenCalled()
    first.unmount()

    render(<RecipeForm onBack={vi.fn()} onSuccess={vi.fn()} />)
    expect(titleInput().value).toBe('')
  })

  it('l\'enregistrement efface le brouillon', async () => {
    const onSuccess = vi.fn()
    const first = render(<RecipeForm onBack={vi.fn()} onSuccess={onSuccess} />)
    fireEvent.change(titleInput(), { target: { value: 'Soupe' } })
    fireEvent.change(screen.getByPlaceholderText('farine'), { target: { value: 'carottes' } })
    fireEvent.click(screen.getAllByText('Créer')[0])

    await waitFor(() => expect(onSuccess).toHaveBeenCalled())
    expect(saveRecipe).toHaveBeenCalled()
    first.unmount()

    render(<RecipeForm onBack={vi.fn()} onSuccess={vi.fn()} />)
    expect(titleInput().value).toBe('')
  })

  it('le brouillon d\'une recette en édition ne se mélange pas avec celui d\'une nouvelle recette', () => {
    const first = render(<RecipeForm initial={existing} onBack={vi.fn()} onSuccess={vi.fn()} />)
    fireEvent.change(titleInput(), { target: { value: 'Gratin modifié' } })
    first.unmount()
    cleanup()

    render(<RecipeForm onBack={vi.fn()} onSuccess={vi.fn()} />)
    expect(titleInput().value).toBe('')

    cleanup()
    render(<RecipeForm initial={existing} onBack={vi.fn()} onSuccess={vi.fn()} />)
    expect(titleInput().value).toBe('Gratin modifié')
  })
})
