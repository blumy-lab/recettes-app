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
  if (req.method === 'OPTIONS') return new Response(null, { headers: corsHeaders })
  if (req.method !== 'POST') return jsonResponse({ error: 'Method not allowed' }, 405)

  // Vérification JWT
  const authHeader = req.headers.get('Authorization')
  if (!authHeader?.startsWith('Bearer ')) return jsonResponse({ error: 'Non autorisé' }, 401)

  const userClient = createClient(
    Deno.env.get('SUPABASE_URL') ?? '',
    Deno.env.get('SUPABASE_ANON_KEY') ?? '',
    { global: { headers: { Authorization: authHeader } } }
  )
  const { data: { user }, error: authError } = await userClient.auth.getUser()
  if (authError || !user) return jsonResponse({ error: 'Non autorisé' }, 401)

  let body: { recipeId: string }
  try {
    body = await req.json()
  } catch {
    return jsonResponse({ error: 'Corps de requête invalide' }, 400)
  }

  const { recipeId } = body
  if (!recipeId) return jsonResponse({ error: 'recipeId requis' }, 400)

  // Client service_role — bypass RLS pour lire et mettre à jour
  const adminClient = createClient(
    Deno.env.get('SUPABASE_URL') ?? '',
    Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
  )

  // Lecture de la recette + vérification propriétaire
  const { data: recipe, error: recipeError } = await adminClient
    .from('recipes')
    .select('id, title, ingredients, user_id')
    .eq('id', recipeId)
    .single()

  if (recipeError || !recipe) return jsonResponse({ error: 'Recette introuvable' }, 404)
  if (recipe.user_id !== user.id) return jsonResponse({ error: 'Non autorisé' }, 403)

  const apiKey = Deno.env.get('GEMINI_API_KEY')
  if (!apiKey) return jsonResponse({ error: 'Clé API Gemini non configurée' }, 500)

  // Prompt de modération — identique à gemini.ts > moderateRecipe
  const ingredientNames = ((recipe.ingredients as Array<{ name: string }>) || [])
    .slice(0, 10)
    .map((i) => i.name)

  const prompt = `Tu es un modérateur de contenu pour une application de recettes de cuisine.
Analyse ce contenu et réponds UNIQUEMENT avec un JSON : {"ok": true} ou {"ok": false, "reason": "explication courte"}

Critères de rejet :
- Ce n'est pas une recette de cuisine
- Contenu offensant, inapproprié ou spam
- Titre ou ingrédients nonsensiques

Titre : ${recipe.title}
Ingrédients : ${ingredientNames.join(', ')}`

  // Appel Gemini
  let moderationResult: { ok: boolean; reason?: string } = { ok: true }

  const geminiRes = await fetch(`${GEMINI_API_URL}?key=${apiKey}`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ contents: [{ parts: [{ text: prompt }] }] }),
  })

  if (geminiRes.ok) {
    const geminiData = await geminiRes.json()
    const responseText = geminiData?.candidates?.[0]?.content?.parts?.[0]?.text?.trim() || ''
    const clean = responseText.replace(/^```json\n?/, '').replace(/\n?```$/, '').trim()
    try {
      moderationResult = JSON.parse(clean)
    } catch {
      // Défaut à ok=true si la réponse Gemini est illisible
    }
  }

  // Mise à jour via service_role (contourne la RLS et le trigger)
  const newStatus = moderationResult.ok ? 'approved' : 'rejected'
  const { error: updateError } = await adminClient
    .from('recipes')
    .update({
      moderation_status: newStatus,
      is_public: moderationResult.ok,
    })
    .eq('id', recipeId)

  if (updateError) return jsonResponse({ error: 'Erreur mise à jour base de données' }, 500)

  return jsonResponse(moderationResult)
})
