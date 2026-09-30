import { describe, it, expect } from 'vitest'
import { isHealthyRecipe } from './healthyFilter'
import type { Recipe } from '../types'

function makeRecipe(overrides: Partial<Recipe> = {}): Recipe {
  return {
    id: 'r1',
    title: 'Recette test',
    source_url: '',
    ingredients: [],
    steps: [],
    created_at: new Date().toISOString(),
    ...overrides,
  }
}

describe('isHealthyRecipe', () => {
  it('tag santé présent, pas de donnée nutritionnelle → sain', () => {
    expect(isHealthyRecipe(makeRecipe({ tags: ['riche-fibres'] }))).toBe(true)
  })

  it('pas de tag, calories basses (350) → sain', () => {
    expect(isHealthyRecipe(makeRecipe({ nutrition_calories: 350 }))).toBe(true)
  })

  it('pas de tag, calories hautes (800) → pas sain', () => {
    expect(isHealthyRecipe(makeRecipe({ nutrition_calories: 800 }))).toBe(false)
  })

  it('ni tag ni donnée nutritionnelle → pas sain', () => {
    expect(isHealthyRecipe(makeRecipe())).toBe(false)
  })

  it('tag santé présent même avec des calories hautes → sain (le tag suffit)', () => {
    expect(isHealthyRecipe(makeRecipe({ tags: ['ig-bas'], nutrition_calories: 900 }))).toBe(true)
  })
})
