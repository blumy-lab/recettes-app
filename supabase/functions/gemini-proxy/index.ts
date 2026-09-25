import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const GEMINI_API_URL = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization',
}

function jsonResponse(body: unknown, status = 200): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, 'Content-Type': 'application/json' },
  })
}

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response(null, { headers: corsHeaders })
  }

  if (req.method !== 'POST') {
    return jsonResponse({ error: 'Method not allowed' }, 405)
  }

  // Vérification JWT — seuls les utilisateurs authentifiés peuvent appeler ce proxy
  const authHeader = req.headers.get('Authorization')
  if (!authHeader?.startsWith('Bearer ')) {
    return jsonResponse({ error: 'Non autorisé' }, 401)
  }

  const supabase = createClient(
    Deno.env.get('SUPABASE_URL') ?? '',
    Deno.env.get('SUPABASE_ANON_KEY') ?? '',
    { global: { headers: { Authorization: authHeader } } }
  )
  const { error: authError } = await supabase.auth.getUser()
  if (authError) {
    return jsonResponse({ error: 'Non autorisé' }, 401)
  }

  const apiKey = Deno.env.get('GEMINI_API_KEY')
  if (!apiKey) {
    return jsonResponse({ error: 'Clé API Gemini non configurée' }, 500)
  }

  let body: { action: string; payload: Record<string, unknown> }
  try {
    body = await req.json()
  } catch {
    return jsonResponse({ error: 'Corps de requête invalide' }, 400)
  }

  const { action, payload } = body
  if (!action || !payload) {
    return jsonResponse({ error: 'Champs action et payload requis' }, 400)
  }

  // Construction du corps de la requête Gemini selon l'action
  let geminiBody: object

  if (action === 'extractFromText') {
    const text = payload.text as string
    if (!text) return jsonResponse({ error: 'Champ text requis' }, 400)

    const prompt = `Tu es un assistant culinaire. Extrais la recette dans ce texte et retourne-la en JSON strict.
Réponds UNIQUEMENT avec un objet JSON valide, sans markdown, sans explication.

Format attendu :
{
  "title": "Nom de la recette",
  "servings": 4,
  "prep_time": 15,
  "cook_time": 30,
  "ingredients": [
    { "quantity": "200", "unit": "g", "name": "farine" }
  ],
  "steps": [
    "Première étape...",
    "Deuxième étape..."
  ]
}

Règles :
- title : nom de la recette en français
- servings : nombre de personnes (entier, null si non précisé)
- prep_time : temps de préparation en minutes (entier, null si non précisé)
- cook_time : temps de cuisson en minutes (entier, null si non précisé)
- ingredients : liste des ingrédients avec quantité, unité et nom séparés
- steps : liste des étapes de préparation
- Si une information n'est pas précisée, mets null pour les nombres
- Traduis en français si le texte est dans une autre langue

Texte de la recette :
${text}`

    geminiBody = { contents: [{ parts: [{ text: prompt }] }] }

  } else if (action === 'extractFromImage') {
    const imageBase64 = payload.imageBase64 as string
    const mimeType = payload.mimeType as string
    if (!imageBase64 || !mimeType) return jsonResponse({ error: 'Champs imageBase64 et mimeType requis' }, 400)

    const prompt = `Tu es un assistant culinaire. Analyse cette photo de recette et extrais les informations suivantes en JSON strict.
Réponds UNIQUEMENT avec un objet JSON valide, sans markdown, sans explication.

Format attendu :
{
  "title": "Nom de la recette",
  "servings": 4,
  "prep_time": 15,
  "cook_time": 30,
  "ingredients": [
    { "quantity": "200", "unit": "g", "name": "farine" }
  ],
  "steps": [
    "Première étape...",
    "Deuxième étape..."
  ]
}

Règles :
- title : nom de la recette en français
- servings : nombre de personnes (entier, null si non précisé)
- prep_time : temps de préparation en minutes (entier, null si non précisé)
- cook_time : temps de cuisson en minutes (entier, null si non précisé)
- ingredients : liste des ingrédients avec quantité, unité et nom séparés
- steps : liste des étapes de préparation
- Si une information n'est pas visible, mets null pour les nombres et [] pour les listes
- Traduis en français si la recette est dans une autre langue`

    geminiBody = {
      contents: [{
        parts: [
          { text: prompt },
          { inline_data: { mime_type: mimeType, data: imageBase64 } }
        ]
      }]
    }

  } else if (action === 'moderateRecipe') {
    const title = payload.title as string
    const ingredients = payload.ingredients as string[]
    if (!title || !Array.isArray(ingredients)) return jsonResponse({ error: 'Champs title et ingredients requis' }, 400)

    const prompt = `Tu es un modérateur de contenu pour une application de recettes de cuisine.
Analyse ce contenu et réponds UNIQUEMENT avec un JSON : {"ok": true} ou {"ok": false, "reason": "explication courte"}

Critères de rejet :
- Ce n'est pas une recette de cuisine
- Contenu offensant, inapproprié ou spam
- Titre ou ingrédients nonsensiques

Titre : ${title}
Ingrédients : ${ingredients.slice(0, 10).join(', ')}`

    geminiBody = { contents: [{ parts: [{ text: prompt }] }] }

  } else if (action === 'scanReceipt') {
    const imageBase64 = payload.imageBase64 as string
    const mimeType = payload.mimeType as string
    if (!imageBase64 || !mimeType) return jsonResponse({ error: 'Champs imageBase64 et mimeType requis' }, 400)

    const prompt = `Tu es un assistant qui lit les tickets de caisse. Analyse cette photo de ticket de caisse et extrais la liste des articles achetés en JSON strict.
Réponds UNIQUEMENT avec un objet JSON valide, sans markdown, sans explication.

Format attendu :
{
  "items": [
    { "name": "Lait demi-écrémé", "quantity": 1, "unit": "L" }
  ]
}

Règles :
- name : nom de l'article, simplifié et en français (ex: "LAIT 1/2 ECR CARREFOUR 1L" → "Lait demi-écrémé")
- quantity : quantité numérique si déductible du ticket (ex: "x2" → 2), sinon null
- unit : unité si présente (g, kg, ml, cl, L, etc.), sinon null
- Ignore les lignes qui ne sont pas des articles (totaux, sous-totaux, mode de paiement, numéro de ticket, carte de fidélité, etc.)
- Si aucun article n'est détecté, retourne {"items": []}`

    geminiBody = {
      contents: [{
        parts: [
          { text: prompt },
          { inline_data: { mime_type: mimeType, data: imageBase64 } }
        ]
      }]
    }

  } else if (action === 'estimateNutrition') {
    const title = payload.title as string
    const ingredients = payload.ingredients as Array<{ quantity: string; unit: string; name: string }>
    const servings = payload.servings as number
    if (!title || !Array.isArray(ingredients) || !servings) return jsonResponse({ error: 'Champs title, ingredients et servings requis' }, 400)

    const ingList = ingredients.map(i => `${i.quantity} ${i.unit} ${i.name}`.trim()).join('\n')

    const prompt = `Tu es nutritionniste. Estime les valeurs nutritionnelles de cette recette.
Réponds UNIQUEMENT avec un JSON valide sans markdown.

Format : {"calories":450,"proteins":25,"fat":18,"carbs":42}
- Valeurs PAR PORTION (recette prévue pour ${servings} portion${servings > 1 ? 's' : ''})
- calories en kcal, proteins/fat/carbs en grammes, tous entiers arrondis
- Donne une estimation raisonnable même si les quantités manquent

Recette : ${title}
Ingrédients (total pour ${servings} portion${servings > 1 ? 's' : ''}) :
${ingList}`

    geminiBody = { contents: [{ parts: [{ text: prompt }] }] }

  } else {
    return jsonResponse({ error: `Action inconnue : ${action}` }, 400)
  }

  // Appel Gemini
  const geminiRes = await fetch(`${GEMINI_API_URL}?key=${apiKey}`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(geminiBody),
  })

  if (!geminiRes.ok) {
    const err = await geminiRes.json().catch(() => ({}))
    return jsonResponse({ error: err?.error?.message || `Erreur Gemini (${geminiRes.status})` }, 502)
  }

  const geminiData = await geminiRes.json()
  const responseText = geminiData?.candidates?.[0]?.content?.parts?.[0]?.text?.trim() || ''

  if (!responseText) {
    return jsonResponse({ error: 'Réponse vide de Gemini' }, 502)
  }

  const clean = responseText.replace(/^```json\n?/, '').replace(/\n?```$/, '').trim()

  try {
    const result = JSON.parse(clean)
    return jsonResponse(result)
  } catch {
    return jsonResponse({ error: 'Impossible de parser la réponse Gemini', raw: responseText }, 502)
  }
})
