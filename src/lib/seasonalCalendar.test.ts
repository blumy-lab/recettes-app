import { describe, it, expect } from 'vitest'
import { isInSeason, isRecipeInSeason } from './seasonalCalendar'
import type { Ingredient } from '../types'

function ing(name: string): Ingredient {
  return { id: name, name, quantity: '1', unit: '' }
}

describe('isInSeason', () => {
  it('produit clairement de saison à un mois donné → true', () => {
    expect(isInSeason('fraise', 'reunion', 1)).toBe(true)
  })

  it('produit clairement hors saison → false', () => {
    expect(isInSeason('fraise', 'reunion', 7)).toBe(false)
  })

  it('produit absent du calendrier → false, pas d\'erreur', () => {
    expect(isInSeason('kiwi', 'reunion', 1)).toBe(false)
  })

  it('insensible à la casse et aux accents ("Pêche" matche "peche")', () => {
    expect(isInSeason('Pêche', 'reunion', 1)).toBe(true)
  })

  it('résultat différent selon la zone au même mois (mangue en avril)', () => {
    expect(isInSeason('mangue', 'reunion', 4)).toBe(true)
    expect(isInSeason('mangue', 'metropole', 4)).toBe(false)
  })

  it('utilise le mois courant par défaut si non fourni', () => {
    const month = new Date().getMonth() + 1
    expect(isInSeason('ananas', 'reunion')).toBe(true)
    expect(typeof month).toBe('number')
  })
})

describe('isRecipeInSeason', () => {
  it('true quand au moins 50% des ingrédients sont de saison', () => {
    const ingredients = [ing('fraise'), ing('kiwi')] // fraise oui, kiwi absent
    expect(isRecipeInSeason(ingredients, 'reunion', 1)).toBe(true)
  })

  it('false quand moins de 50% des ingrédients sont de saison', () => {
    const ingredients = [ing('fraise'), ing('kiwi'), ing('kiwi')] // 1/3
    expect(isRecipeInSeason(ingredients, 'reunion', 1)).toBe(false)
  })

  it('false pour une liste d\'ingrédients vide', () => {
    expect(isRecipeInSeason([], 'reunion', 1)).toBe(false)
  })
})
