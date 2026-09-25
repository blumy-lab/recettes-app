import type { Recipe, Ingredient } from './types'
import { generateId } from './lib/uuid'

interface ScrapedData {
  title: string
  image_url?: string
  ingredients: string[]
  steps: string[]
  servings?: number
  prep_time?: number
  cook_time?: number
}

export function parseJsonLd(html: string): ScrapedData | null {
  // Some sites encode the type attribute with HTML entities
  const normalizedHtml = html.replace(/&#x2F;/g, '/').replace(/&#x2B;/g, '+').replace(/&amp;/g, '&')
  const matches = normalizedHtml.matchAll(/<script[^>]+type="application\/ld\+json"[^>]*>([\s\S]*?)<\/script>/gi)
  for (const match of matches) {
    try {
      const data = JSON.parse(match[1])
      const recipe = Array.isArray(data)
        ? data.find((d) => d['@type'] === 'Recipe')
        : data['@type'] === 'Recipe'
        ? data
        : data['@graph']?.find((d: { '@type': string }) => d['@type'] === 'Recipe')

      if (!recipe) continue

      const ingredients: string[] = (recipe.recipeIngredient || []).map((i: string) => i.trim())
      const steps: string[] = (recipe.recipeInstructions || []).map((s: { text?: string } | string) =>
        typeof s === 'string' ? s : s.text || ''
      )

      return {
        title: recipe.name || '',
        image_url: typeof recipe.image === 'string' ? recipe.image : recipe.image?.url,
        ingredients,
        steps: steps.filter(Boolean),
        servings: parseInt(recipe.recipeYield) || undefined,
        prep_time: parseDuration(recipe.prepTime),
        cook_time: parseDuration(recipe.cookTime),
      }
    } catch {
      continue
    }
  }
  return null
}

export function parseDuration(iso?: string): number | undefined {
  if (!iso) return undefined
  const match = iso.match(/PT(?:(\d+)H)?(?:(\d+)M)?/)
  if (!match) return undefined
  return (parseInt(match[1] || '0') * 60) + parseInt(match[2] || '0')
}

const UNITS = ['g', 'kg', 'ml', 'cl', 'l', 'dl', 'mg',
  'cuillère', 'cuillères', 'cuillere', 'cuilleres',
  'c\\.à\\.s\\.?', 'c\\.à\\.c\\.?', 'cas', 'cac',
  'tasse', 'tasses', 'verre', 'verres',
  'sachet', 'sachets', 'boîte', 'boites', 'boîtes', 'grosses', 'grosse',
  'gousse', 'gousses', 'tranche', 'tranches',
  'pincée', 'pincees', 'poignée', 'poignees',
  'litre', 'litres', 'gramme', 'grammes', 'kilogramme', 'kilogrammes',
  'centilitre', 'centilitres', 'millilitre', 'millilitres',
  'oignon', 'oignons', // common mistakes where the word IS the unit on Marmiton
]
const UNIT_RE = new RegExp(
  `^([\\d\\s\\/.,½¼¾⅓⅔]+)?\\s*(${UNITS.join('|')})\\.?\\s+(.+)$`, 'i'
)

function parseIngredientText(text: string): Ingredient {
  const m = text.match(UNIT_RE)
  if (m) {
    return {
      id: generateId(),
      quantity: m[1]?.trim() || '',
      unit: m[2]?.trim() || '',
      name: m[3]?.trim() || text,
    }
  }
  // No unit found — try to extract a leading number only
  const numMatch = text.match(/^([\d\s\/.,½¼¾⅓⅔]+)\s+(.+)$/)
  if (numMatch) {
    return {
      id: generateId(),
      quantity: numMatch[1].trim(),
      unit: '',
      name: numMatch[2].trim(),
    }
  }
  return { id: generateId(), quantity: '', unit: '', name: text.trim() }
}

export async function scrapeRecipe(url: string): Promise<Recipe> {
  const encoded = encodeURIComponent(url)
  const proxies = [
    { url: `${import.meta.env.VITE_APP_URL}/proxy.php?url=${encoded}`, type: 'text' },
    { url: `https://api.allorigins.win/get?url=${encoded}`, type: 'allorigins' },
    { url: `https://corsproxy.io/?url=${encoded}`, type: 'text' },
    { url: `https://api.codetabs.com/v1/proxy?quest=${encoded}`, type: 'text' },
  ]

  let html = ''
  for (const proxy of proxies) {
    try {
      const response = await fetch(proxy.url, { signal: AbortSignal.timeout(12000) })
      if (!response.ok) continue
      if (proxy.type === 'allorigins') {
        const json = await response.json()
        html = json.contents || ''
      } else {
        html = await response.text()
      }
      if (html && html.length > 500) break
    } catch {
      continue
    }
    html = ''
  }

  if (!html) throw new Error('Impossible de charger la page. Vérifiez votre connexion.')

  const scraped = parseJsonLd(html)
  if (!scraped || scraped.ingredients.length === 0) {
    throw new Error('Aucune recette trouvée sur cette page. Le site n\'est peut-être pas compatible.')
  }

  return {
    id: generateId(),
    title: scraped.title,
    source_url: url,
    image_url: scraped.image_url,
    servings: scraped.servings,
    prep_time: scraped.prep_time,
    cook_time: scraped.cook_time,
    ingredients: scraped.ingredients.map(parseIngredientText),
    steps: scraped.steps,
    created_at: new Date().toISOString(),
  }
}
