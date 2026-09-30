import type { Recipe } from '../types'

const HEALTH_TAGS = ['ig-bas', 'sans-sel', 'faible-cholesterol', 'riche-proteines', 'riche-fibres']
export const HEALTHY_CALORIE_THRESHOLD = 500

export function isHealthyRecipe(recipe: Recipe): boolean {
  const hasHealthTag = recipe.tags?.some((t) => HEALTH_TAGS.includes(t)) ?? false
  const isLowCalorie = recipe.nutrition_calories != null && recipe.nutrition_calories < HEALTHY_CALORIE_THRESHOLD
  return hasHealthTag || isLowCalorie
}
