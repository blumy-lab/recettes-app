import { describe, it, expect } from 'vitest'
import { generateSlots, poolForType } from './lib/menuGenerator'
import { scorePantryMatch } from './lib/pantryMatcher'
import type { Recipe, MenuConfig, MenuSlot, PantryItem } from './types'

// ── Helpers ────────────────────────────────────────────────────────────────

function makeRecipe(id: string, tags: string[] = []): Recipe {
  return {
    id,
    user_id: 'u1',
    title: `Recette ${id}`,
    ingredients: [],
    steps: [],
    tags,
    created_at: new Date().toISOString(),
    is_public: false,
    moderation_status: 'private',
  } as unknown as Recipe
}

function makeRecipeWithIngredients(id: string, ingredientNames: string[]): Recipe {
  return {
    ...makeRecipe(id),
    ingredients: ingredientNames.map((name, i) => ({ id: `${id}-ing${i}`, name, quantity: '1', unit: '' })),
  }
}

function makePantryItem(name: string): PantryItem {
  return { id: `pantry-${name}`, name, quantity: 1, unit: '', rayon: '', expires_at: null, created_at: new Date().toISOString() }
}

const BASE_CONFIG: MenuConfig = {
  days: 7,
  entrees: 0,
  plats: 7,
  desserts: 0,
  tags: [],
  persons: 4,
}

// ── poolForType ─────────────────────────────────────────────────────────────

describe('poolForType', () => {
  it('recipe with tag "entree" is in entree pool', () => {
    const r = makeRecipe('1', ['entree'])
    expect(poolForType([r], 'entree')).toContain(r)
  })

  it('recipe with tag "entree" is NOT in plat pool', () => {
    const r = makeRecipe('1', ['entree'])
    expect(poolForType([r], 'plat')).not.toContain(r)
  })

  it('recipe with no tags falls into plat pool', () => {
    const r = makeRecipe('1', [])
    expect(poolForType([r], 'plat')).toContain(r)
  })

  it('recipe with tag "dessert" is in dessert pool', () => {
    const r = makeRecipe('1', ['dessert'])
    expect(poolForType([r], 'dessert')).toContain(r)
  })

  it('recipe with tag "plat" is in plat pool', () => {
    const r = makeRecipe('1', ['plat'])
    expect(poolForType([r], 'plat')).toContain(r)
  })
})

// ── scorePantryMatch ────────────────────────────────────────────────────────

describe('scorePantryMatch', () => {
  it('tous les ingrédients sont dans le pantry → 1', () => {
    const recipe = makeRecipeWithIngredients('1', ['Tomate', 'Oignon', 'Ail'])
    const pantry = [makePantryItem('Tomate'), makePantryItem('Oignon'), makePantryItem('Ail')]
    expect(scorePantryMatch(recipe, pantry)).toBe(1)
  })

  it('aucun ingrédient en commun → 0', () => {
    const recipe = makeRecipeWithIngredients('1', ['Tomate', 'Oignon'])
    const pantry = [makePantryItem('Chocolat'), makePantryItem('Farine')]
    expect(scorePantryMatch(recipe, pantry)).toBe(0)
  })

  it('matching partiel avec normalisation (accents, casse) → score correct', () => {
    const recipe = makeRecipeWithIngredients('1', ['Crème fraîche', 'ÉCHALOTE', 'Poivron', 'Lait'])
    // "crème fraîche" ~ "creme" (contenu l'un dans l'autre), "ÉCHALOTE" == "echalote" (accents/casse), Poivron et Lait absents
    const pantry = [makePantryItem('creme'), makePantryItem('echalote')]
    expect(scorePantryMatch(recipe, pantry)).toBe(0.5)
  })
})

// ── generateSlots ───────────────────────────────────────────────────────────

describe('generateSlots', () => {
  it('7 jours × 1 plat/jour → 7 slots générés', () => {
    const recipes = Array.from({ length: 10 }, (_, i) => makeRecipe(String(i)))
    const slots = generateSlots(recipes, BASE_CONFIG)
    expect(slots).toHaveLength(7)
  })

  it('chaque slot a mealType "plat"', () => {
    const recipes = Array.from({ length: 10 }, (_, i) => makeRecipe(String(i)))
    const slots = generateSlots(recipes, BASE_CONFIG)
    expect(slots.every(s => s.mealType === 'plat')).toBe(true)
  })

  it('pas de doublon si le pool est suffisamment grand', () => {
    const recipes = Array.from({ length: 14 }, (_, i) => makeRecipe(String(i)))
    const slots = generateSlots(recipes, BASE_CONFIG)
    const ids = slots.map(s => s.recipeId)
    expect(new Set(ids).size).toBe(ids.length)
  })

  it('les slots verrouillés ne sont pas remplacés lors d\'une régénération', () => {
    const recipes = Array.from({ length: 14 }, (_, i) => makeRecipe(String(i)))

    // Premier passage : génère 7 slots
    const first = generateSlots(recipes, BASE_CONFIG)

    // Verrouiller 3 slots
    const locked: MenuSlot[] = first.slice(0, 3).map(s => ({ ...s, locked: true }))

    // Régénérer avec les slots verrouillés
    const second = generateSlots(recipes, BASE_CONFIG, locked)

    // Les 3 premiers slots doivent être identiques à ceux verrouillés
    for (const lk of locked) {
      const found = second.find(s => s.day === lk.day && s.mealType === lk.mealType && s.position === lk.position)
      expect(found).toBeDefined()
      expect(found!.recipeId).toBe(lk.recipeId)
    }
  })

  it('génère entrees + plats + desserts avec le bon mealType', () => {
    const config: MenuConfig = { ...BASE_CONFIG, days: 3, entrees: 3, plats: 3, desserts: 3 }
    const entreeRecipes = Array.from({ length: 5 }, (_, i) => makeRecipe(`e${i}`, ['entree']))
    const platRecipes   = Array.from({ length: 5 }, (_, i) => makeRecipe(`p${i}`, ['plat']))
    const dessertRecipes= Array.from({ length: 5 }, (_, i) => makeRecipe(`d${i}`, ['dessert']))
    const recipes = [...entreeRecipes, ...platRecipes, ...dessertRecipes]

    const slots = generateSlots(recipes, config)
    expect(slots.filter(s => s.mealType === 'entree')).toHaveLength(3)
    expect(slots.filter(s => s.mealType === 'plat')).toHaveLength(3)
    expect(slots.filter(s => s.mealType === 'dessert')).toHaveLength(3)
  })

  it('pool vide → aucun slot généré', () => {
    const slots = generateSlots([], BASE_CONFIG)
    expect(slots).toHaveLength(0)
  })
})
