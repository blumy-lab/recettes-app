import { describe, it, expect } from 'vitest'
import { generateSlots, poolForType, withPantryPriority, withConfigDefaults } from './lib/menuGenerator'
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
  considerSeasonality: true,
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

// ── withPantryPriority — départage saisonnier ──────────────────────────────
// 'ananas' est de saison toute l'année à La Réunion ; 'kiwi' est absent du
// calendrier réunionnais (toujours faux). Ce choix rend les assertions
// indépendantes du mois réel d'exécution des tests.

describe('withPantryPriority — départage saisonnier', () => {
  it('sans garde-manger : les recettes de saison passent systématiquement en tête', () => {
    const seasonal = [makeRecipeWithIngredients('s1', ['ananas']), makeRecipeWithIngredients('s2', ['ananas'])]
    const notSeasonal = [makeRecipeWithIngredients('n1', ['kiwi']), makeRecipeWithIngredients('n2', ['kiwi'])]
    for (let i = 0; i < 15; i++) {
      const pool = withPantryPriority([...notSeasonal, ...seasonal], undefined, 2, 'reunion')
      expect(pool.slice(0, 2).map(r => r.id).sort()).toEqual(['s1', 's2'])
    }
  })

  it('avec garde-manger et débordement dans la "queue" : le critère saisonnier n\'est plus perdu par le ré-mélange', () => {
    const pantry: PantryItem[] = [{ id: 'p1', name: 'riz', quantity: 1, unit: '', rayon: '', expires_at: null, created_at: new Date().toISOString() }]

    // 4 recettes à score garde-manger égal (0.5) : 2 de saison, 2 non — plus que
    // maxHigh (=2 pour slotsForType=2), donc 2 d'entre elles débordent dans la queue.
    const highSeasonal = [makeRecipeWithIngredients('hs1', ['riz', 'ananas']), makeRecipeWithIngredients('hs2', ['riz', 'ananas'])]
    const highOther = [makeRecipeWithIngredients('ho1', ['riz', 'kiwi']), makeRecipeWithIngredients('ho2', ['riz', 'kiwi'])]
    // Une recette hors garde-manger (score 0), de saison, qui doit remonter en tête de la queue.
    const otherSeasonal = makeRecipeWithIngredients('os1', ['ananas'])
    const otherNotSeasonal = makeRecipeWithIngredients('on1', ['kiwi'])

    for (let i = 0; i < 15; i++) {
      const pool = withPantryPriority(
        [...highOther, ...highSeasonal, otherSeasonal, otherNotSeasonal],
        pantry, 2, 'reunion'
      )
      // head = les 2 premiers (score 0.5, maxHigh=2) — toujours les 2 de saison
      expect(pool.slice(0, 2).map(r => r.id).sort()).toEqual(['hs1', 'hs2'])
      // queue = le reste (ho1, ho2 débordés + os1 + on1) — la recette de saison
      // restante (os1) doit être en tête de cette queue, pas perdue dans le ré-mélange.
      expect(pool[2].id).toBe('os1')
    }
  })
})

// ── generateSlots — flag considerSeasonality ────────────────────────────────

describe('generateSlots — flag considerSeasonality', () => {
  const config: MenuConfig = { ...BASE_CONFIG, days: 1, plats: 1 }
  const seasonal = makeRecipeWithIngredients('s1', ['ananas'])
  const notSeasonal = makeRecipeWithIngredients('n1', ['kiwi'])

  it('true → la recette de saison est systématiquement choisie face à une seule concurrente hors-saison', () => {
    for (let i = 0; i < 15; i++) {
      const slots = generateSlots([seasonal, notSeasonal], config, [], undefined, 'reunion', true)
      expect(slots[0].recipeId).toBe('s1')
    }
  })

  it('false → les deux recettes ont une chance égale d\'être choisies (pas de biais saisonnier mesurable)', () => {
    const trials = 200
    let seasonalPicked = 0
    for (let i = 0; i < trials; i++) {
      const slots = generateSlots([seasonal, notSeasonal], config, [], undefined, 'reunion', false)
      if (slots[0].recipeId === 's1') seasonalPicked++
    }
    // Sans biais, ~50% de tirages "s1" ; marge large pour éviter toute instabilité statistique.
    expect(seasonalPicked).toBeGreaterThan(trials * 0.3)
    expect(seasonalPicked).toBeLessThan(trials * 0.7)
  })

})

describe('withConfigDefaults', () => {
  it('un config JSON pré-existant sans considerSeasonality devient true', () => {
    const legacyConfig = { days: 7, entrees: 0, plats: 7, desserts: 0, tags: [], persons: 4 }
    expect(withConfigDefaults(legacyConfig).considerSeasonality).toBe(true)
  })

  it('un config qui a explicitement considerSeasonality: false le conserve', () => {
    const config: MenuConfig = { ...BASE_CONFIG, considerSeasonality: false }
    expect(withConfigDefaults(config).considerSeasonality).toBe(false)
  })
})
