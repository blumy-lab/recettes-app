import type { Ingredient } from '../types'
import { normalizeIngredientName } from './normalizeIngredientName'

export type SeasonZone = 'reunion' | 'metropole'

// Mois où chaque produit est de saison (1 = janvier ... 12 = décembre)
// Source Réunion : DAAF La Réunion, calendrier "Pilon Pilé" 2024
// Source Métropole : UFC-Que Choisir, calendrier des fruits et légumes de saison
export const SEASONAL_CALENDAR: Record<SeasonZone, Record<string, number[]>> = {
  reunion: {
    'ananas': [1,2,3,4,5,6,7,8,9,10,11,12],
    'avocat': [1,2,3,4,9,10,11,12],
    'banane': [1,2,3,4,5,6,7,8,9,10,11,12],
    'coco': [1,2,3,4,5,6,7,8,9,10,11,12],
    'fraise': [1,2,12],
    'goyavier': [6,7,8,9,10],
    'letchi': [2,3,4],
    'longani': [5,6],
    'mandarine': [7,8,9,10,11,12],
    'mangue': [2,3,4,5,6],
    'melon': [1,2,3,4,5,6,7,8,9,10,11,12],
    'orange': [2,3,4,8,9,10,11],
    'papaye': [1,2,3,4,5,6,7,8,9,10,11,12],
    'pasteque': [1,2,3,4,5,6,7,8,9,10,11,12],
    'peche': [1,2,4,8,9],
    'pitaya': [2,3,7,8,9],
    'prune': [5,6],
    'tangor': [10,11,12],
    // légumes : quasi toute l'année à La Réunion (climat tropical, pas de dormance hivernale)
    'betterave': [1,2,3,4,5,6,7,8,9,10,11,12],
    'brede': [1,2,3,4,5,6,7,8,9,10,11,12],
    'navet': [1,2,3,4,5,6,7,8,9,10,11,12],
    'poireau': [1,2,3,4,5,6,7,8,9,10,11,12],
    'poivron': [1,2,3,4,5,6,7,8,9,10,11,12],
    'piment': [1,2,3,4,5,6,7,8,9,10,11,12],
    'tomate': [1,2,3,4,5,6,7,8,9,10,11,12],
    'bringelle': [1,2,3,4,5,6,7,8,9,10,11,12],
    'brocoli': [1,2,3,4,5,6,7,8,9,10,11,12],
    'carotte': [1,2,3,4,5,6,7,8,9,10,11,12],
    'chou vert': [1,2,3,4,5,6,7,8,9,10,11,12],
    'chou-fleur': [1,2,3,4,5,6,7,8,9,10,11,12],
    'courgette': [1,2,3,4,5,6,7,8,9,10,11,12],
    'chouchou': [1,2,3,4,5,6,7,8,9,10,11,12],
    'citrouille': [1,2,3,4,5,6,7,8,9,10,11,12],
    'concombre': [1,2,3,4,5,6,7,8,9,10,11,12],
    'haricots verts': [1,2,3,4,5,6,7,8,9,10,11,12],
    'laitue': [1,2,3,4,5,6,7,8,9,10,11,12],
  },
  metropole: {
    'artichaut': [5,6,7,8,9,10],
    'asperge': [4,5],
    'aubergine': [6,7,8,9],
    'betterave': [1,2,3,10,11],
    'brocoli': [9,10,11],
    'carotte': [1,2,3,9,10,11],
    'celeri': [1,2,3,10,11],
    'celeri-rave': [1,2,3,10,11],
    'champignons': [1,2,3,4,5,6,7,8,9,10,11],
    'chou de bruxelles': [1,2,3,10,11],
    'chou-fleur': [1,2,3,9,10,11],
    'concombre': [5,6,7,8,9,10],
    'courge': [1,9,10,11],
    'courgette': [5,6,7,8,9,10],
    'echalote': [10,11],
    'endive': [1,2,3,4,10,11],
    'epinard': [1,2,3,4,5,9,10,11],
    'fenouil': [4,5,6,7,8,9,10,11],
    'haricot vert': [6,7,8,9,10],
    'laitue': [4,5,6,7,8,9,10],
    'mais': [7,8,9],
    'oignon': [1,2,3,4,9,10,11],
    'panais': [1,2,3,10,11],
    'poireau': [1,2,3,4,9,10,11],
    'poivron': [6,7,8,9],
    'radis': [3,4,5,6,7,8,9,10],
    'tomate': [6,7,8,9],
    'topinambour': [1],
    'abricot': [6,7,8],
    'cerise': [6,7],
    'clementine': [1,2],
    'mandarine': [1,2],
    'figue': [7,8,9,10],
    'fraise': [5,6,7],
    'framboise': [6,7,8],
    'kiwi': [1,2,3],
    'melon': [6,7,8,9],
    'mure': [7,8,9],
    'noisette': [9,10],
    'noix': [9,10],
    'orange': [1,2,3],
    'pamplemousse': [2,3,4,5],
    'peche': [6,7,8,9],
    'poire': [8,9,10],
    'pomme': [1,2,3,4,8,9,10],
    'raisin': [9,10],
    'rhubarbe': [4,5],
  }
}

type NormalizedEntry = { key: string; months: number[] }
const normalizedCalendarCache: Partial<Record<SeasonZone, NormalizedEntry[]>> = {}

function getNormalizedCalendar(zone: SeasonZone): NormalizedEntry[] {
  let entries = normalizedCalendarCache[zone]
  if (!entries) {
    entries = Object.entries(SEASONAL_CALENDAR[zone]).map(([name, months]) => ({
      key: normalizeIngredientName(name),
      months,
    }))
    normalizedCalendarCache[zone] = entries
  }
  return entries
}

export function isInSeason(ingredientName: string, zone: SeasonZone, month: number = new Date().getMonth() + 1): boolean {
  const ingName = normalizeIngredientName(ingredientName)
  if (!ingName) return false
  const entry = getNormalizedCalendar(zone).find(
    (e) => e.key === ingName || ingName.includes(e.key) || e.key.includes(ingName)
  )
  return entry ? entry.months.includes(month) : false
}

// Une recette est "de saison" si au moins la moitié de ses ingrédients le sont.
export function isRecipeInSeason(ingredients: Ingredient[], zone: SeasonZone, month: number = new Date().getMonth() + 1): boolean {
  if (ingredients.length === 0) return false
  const seasonalCount = ingredients.filter((ing) => isInSeason(ing.name, zone, month)).length
  return seasonalCount / ingredients.length >= 0.5
}
