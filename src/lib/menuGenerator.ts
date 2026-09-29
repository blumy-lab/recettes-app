import type { Recipe, MenuMealType, MenuConfig, MenuSlot, PantryItem } from '../types'
import { scorePantryMatch } from './pantryMatcher'
import { isRecipeInSeason, type SeasonZone } from './seasonalCalendar'

// Un menu sauvegardé avant l'ajout de `considerSeasonality` n'a pas ce champ
// dans son config JSON (malgré ce que le type MenuConfig affirme une fois le
// blob chargé depuis Supabase) — on le traite alors comme `true` (comportement
// historique, avant même l'introduction du départage saisonnier).
type StoredMenuConfig = Omit<MenuConfig, 'considerSeasonality'> & { considerSeasonality?: boolean }
export function withConfigDefaults(config: StoredMenuConfig): MenuConfig {
  return { considerSeasonality: true, ...config }
}

export const shuffle = <T,>(arr: T[]): T[] => {
  const a = [...arr]
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [a[i], a[j]] = [a[j], a[i]]
  }
  return a
}

// Tags qui disqualifient une recette du pool "plat"
export const NON_PLAT_TAGS = [
  'entree', 'soupe',
  'dessert', 'patisserie', 'gâteau', 'gateau',
  'cocktail', 'boisson', 'boissons', 'jus', 'smoothie',
  'aperitif', 'apéritif', 'apero', 'apéro',
  'gouter', 'goûter', 'snack',
  'petit-dejeuner', 'petit-déjeuner', 'brunch',
]

export function poolForType(recipes: Recipe[], type: MenuMealType): Recipe[] {
  if (type === 'entree') return recipes.filter(r => r.tags?.some(t => ['entree', 'soupe'].includes(t)))
  if (type === 'dessert') return recipes.filter(r => r.tags?.some(t => ['dessert', 'patisserie', 'gâteau', 'gateau', 'gouter', 'goûter'].includes(t)))
  // plat : tag 'plat' explicite, OU pas de tag de type connu (recette non classifiée)
  return recipes.filter(r => r.tags?.includes('plat') || !r.tags?.some(t => NON_PLAT_TAGS.includes(t)))
}

// Départage : à score garde-manger égal, préférer les recettes de saison.
// Le filter() préserve l'ordre relatif, mais tout groupe qui repasse par
// shuffle() après coup (cf. `tail` ci-dessous) doit ré-appliquer ce tri.
function seasonalFirst(recipes: Recipe[], seasonZone: SeasonZone | null | undefined): Recipe[] {
  if (!seasonZone) return recipes
  const month = new Date().getMonth() + 1
  const seasonal = recipes.filter(r => isRecipeInSeason(r.ingredients, seasonZone, month))
  const rest = recipes.filter(r => !isRecipeInSeason(r.ingredients, seasonZone, month))
  return [...seasonal, ...rest]
}

// Réordonne un pool déjà mélangé pour privilégier les recettes qui utilisent le plus
// d'ingrédients du garde-manger, sans dépasser 70% des slots de ce type.
export function withPantryPriority(recipes: Recipe[], pantryItems: PantryItem[] | undefined, slotsForType: number, seasonZone?: SeasonZone | null): Recipe[] {
  const shuffled = seasonalFirst(shuffle(recipes), seasonZone)
  if (!pantryItems || pantryItems.length === 0 || slotsForType === 0) return shuffled

  const highMatch = shuffled.filter(r => scorePantryMatch(r, pantryItems) >= 0.5)
  if (highMatch.length === 0) return shuffled

  const highSet = new Set(highMatch.map(r => r.id))
  const others = shuffled.filter(r => !highSet.has(r.id))
  const maxHigh = Math.max(1, Math.ceil(slotsForType * 0.7))
  const head = highMatch.slice(0, maxHigh)
  const tail = seasonalFirst(shuffle([...highMatch.slice(maxHigh), ...others]), seasonZone)
  return [...head, ...tail]
}

export function generateSlots(allRecipes: Recipe[], config: MenuConfig, locked: MenuSlot[] = [], pantryItems?: PantryItem[], seasonZone?: SeasonZone | null, considerSeasonality = true): MenuSlot[] {
  const base = config.tags.length > 0
    ? allRecipes.filter(r => config.tags.every(t => r.tags?.includes(t)))
    : allRecipes

  // Le flag ne fait que couper la zone envoyée au départage saisonnier :
  // seasonalFirst(recipes, null) est déjà un no-op, testé comme tel.
  const effectiveZone = considerSeasonality ? seasonZone : null

  const lockedIds = new Set(locked.map(s => s.recipeId))
  const usedIds = new Set(lockedIds)

  const pools: Record<MenuMealType, Recipe[]> = {
    entree: withPantryPriority(poolForType(base, 'entree').filter(r => !usedIds.has(r.id)), pantryItems, config.entrees, effectiveZone),
    plat: withPantryPriority(poolForType(base, 'plat').filter(r => !usedIds.has(r.id)), pantryItems, config.plats, effectiveZone),
    dessert: withPantryPriority(poolForType(base, 'dessert').filter(r => !usedIds.has(r.id)), pantryItems, config.desserts, effectiveZone),
  }
  const fallback = withPantryPriority(base.filter(r => !usedIds.has(r.id)), pantryItems, config.entrees + config.plats + config.desserts, effectiveZone)

  const pick = (type: MenuMealType): Recipe | undefined => {
    let r: Recipe | undefined = pools[type].shift()
    if (!r) r = fallback.shift()
    if (r) {
      usedIds.add(r.id)
      for (const t of Object.keys(pools) as MenuMealType[]) {
        pools[t] = pools[t].filter(x => x.id !== r!.id)
      }
      const fi = fallback.findIndex(x => x.id === r!.id)
      if (fi !== -1) fallback.splice(fi, 1)
    }
    return r
  }

  // Distribute totals round-robin across days: item i → day (i % days)+1, position floor(i/days)
  const defs: { day: number; mealType: MenuMealType; position: number }[] = []
  const distribute = (total: number, mealType: MenuMealType) => {
    for (let i = 0; i < total; i++) {
      defs.push({ day: (i % config.days) + 1, mealType, position: Math.floor(i / config.days) })
    }
  }
  distribute(config.entrees, 'entree')
  distribute(config.plats, 'plat')
  distribute(config.desserts, 'dessert')

  return defs.map(def => {
    const key = `${def.day}-${def.mealType}-${def.position}`
    const lk = locked.find(s => `${s.day}-${s.mealType}-${s.position}` === key)
    if (lk) return lk
    const recipe = pick(def.mealType)
    if (!recipe) return undefined
    return { ...def, recipeId: recipe.id, recipeTitle: recipe.title, locked: false }
  }).filter((s): s is MenuSlot => s !== undefined)
}

export function replaceSlot(slot: MenuSlot, allRecipes: Recipe[], currentSlots: MenuSlot[]): MenuSlot {
  const usedIds = new Set(currentSlots.filter(s => s !== slot).map(s => s.recipeId))
  const pool = allRecipes.filter(r => !usedIds.has(r.id))
  const typed = poolForType(pool, slot.mealType)
  const candidates = typed.length > 0 ? typed : pool
  if (candidates.length === 0) return slot
  const pick = candidates[Math.floor(Math.random() * candidates.length)]
  return { ...slot, recipeId: pick.id, recipeTitle: pick.title, locked: false }
}
