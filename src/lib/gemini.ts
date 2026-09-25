import type { Recipe, Ingredient, ScannedItem } from '../types'
import { generateId } from './uuid'
import { supabase } from './supabase'

export interface NutritionEstimate {
  calories: number
  proteins: number
  fat: number
  carbs: number
}

async function callProxy(action: string, payload: Record<string, unknown>): Promise<unknown> {
  const { data, error } = await supabase.functions.invoke('gemini-proxy', {
    body: { action, payload },
  })
  if (error) {
    let message = 'Erreur du proxy Gemini'
    try {
      const parsed = JSON.parse(error.message)
      if (parsed?.error) message = parsed.error
    } catch { /* ignore */ }
    throw new Error(message)
  }
  if (data?.error) throw new Error(data.error)
  return data
}

export async function estimateNutrition(
  title: string,
  ingredients: Ingredient[],
  servings: number
): Promise<NutritionEstimate> {
  const data = await callProxy('estimateNutrition', { title, ingredients, servings })
  return data as NutritionEstimate
}

export async function moderateRecipe(title: string, ingredients: string[]): Promise<{ ok: boolean; reason?: string }> {
  try {
    const data = await callProxy('moderateRecipe', { title, ingredients })
    return data as { ok: boolean; reason?: string }
  } catch {
    return { ok: true }
  }
}

export async function extractRecipeFromText(text: string): Promise<Recipe> {
  const data = await callProxy('extractFromText', { text }) as {
    title?: string
    servings?: number | null
    prep_time?: number | null
    cook_time?: number | null
    ingredients?: { quantity?: string; unit?: string; name?: string }[]
    steps?: string[]
  }

  if (!data.title) throw new Error('Aucune recette détectée dans ce texte.')

  const ingredients: Ingredient[] = (data.ingredients || []).map((ing) => ({
    id: generateId(),
    quantity: ing.quantity || '',
    unit: ing.unit || '',
    name: ing.name || '',
  }))

  return {
    id: generateId(),
    title: data.title,
    source_url: '',
    image_url: undefined,
    servings: data.servings ?? undefined,
    prep_time: data.prep_time ?? undefined,
    cook_time: data.cook_time ?? undefined,
    ingredients,
    steps: data.steps || [],
    created_at: new Date().toISOString(),
  }
}

export async function extractRecipeFromImage(imageBase64: string, mimeType: string): Promise<Recipe> {
  const data = await callProxy('extractFromImage', { imageBase64, mimeType }) as {
    title?: string
    servings?: number | null
    prep_time?: number | null
    cook_time?: number | null
    ingredients?: { quantity?: string; unit?: string; name?: string }[]
    steps?: string[]
  }

  if (!data.title) throw new Error('Aucune recette détectée dans cette image.')

  const ingredients: Ingredient[] = (data.ingredients || []).map((ing) => ({
    id: generateId(),
    quantity: ing.quantity || '',
    unit: ing.unit || '',
    name: ing.name || '',
  }))

  return {
    id: generateId(),
    title: data.title,
    source_url: '',
    image_url: undefined,
    servings: data.servings ?? undefined,
    prep_time: data.prep_time ?? undefined,
    cook_time: data.cook_time ?? undefined,
    ingredients,
    steps: data.steps || [],
    created_at: new Date().toISOString(),
  }
}

interface RawScannedItem {
  name: string
  quantity?: number | null
  unit?: string | null
}

export function normalizeScannedItems(items: RawScannedItem[] | undefined | null): ScannedItem[] {
  if (!items || items.length === 0) return []
  return items.map((item) => ({
    name: item.name,
    quantity: item.quantity ?? 1,
    unit: item.unit ?? '',
  }))
}

export async function scanReceipt(imageBase64: string, mimeType: string): Promise<{ items: ScannedItem[]; error?: string }> {
  try {
    const data = await callProxy('scanReceipt', { imageBase64, mimeType }) as { items?: RawScannedItem[] }
    return { items: normalizeScannedItems(data.items) }
  } catch (e) {
    return { items: [], error: e instanceof Error ? e.message : 'Erreur lors du scan' }
  }
}
