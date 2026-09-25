import type { Recipe, PantryItem } from '../types'

function normalize(s: string): string {
  return s
    .toLowerCase()
    .normalize('NFD')
    .replace(/[̀-ͯ]/g, '')
    .trim()
}

export function scorePantryMatch(recipe: Recipe, pantryItems: PantryItem[]): number {
  const ingredients = recipe.ingredients || []
  if (ingredients.length === 0) return 0

  const normalizedPantry = pantryItems.map((p) => normalize(p.name)).filter(Boolean)
  if (normalizedPantry.length === 0) return 0

  let matched = 0
  for (const ing of ingredients) {
    const ingName = normalize(ing.name)
    if (!ingName) continue
    const found = normalizedPantry.some((p) => p === ingName || ingName.includes(p) || p.includes(ingName))
    if (found) matched++
  }
  return matched / ingredients.length
}
