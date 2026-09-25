import type { Recipe, ShoppingItem, ShoppingList, Profile, ScannedItem, PantryItem } from './types'
import { detectRayon } from './rayons'
import { supabase } from './lib/supabase'

/* ── Recipes ── */

export interface RecipesOptions {
  page?: number
  search?: string
  tags?: string[]
  sort?: 'recent' | 'az'
}

export interface RecipesPage {
  data: Recipe[]
  hasMore: boolean
}

const PAGE_SIZE = 20

export async function getRecipes(opts: RecipesOptions = {}): Promise<RecipesPage> {
  const { page, search, tags, sort = 'recent' } = opts

  let query = supabase.from('recipes').select('*', { count: 'exact' })
  if (search?.trim()) query = query.ilike('title', `%${search.trim()}%`)
  if (tags?.length) query = query.contains('tags', tags)
  if (sort === 'az') query = query.order('title', { ascending: true })
  else query = query.order('created_at', { ascending: false })
  if (page !== undefined) query = query.range(page * PAGE_SIZE, page * PAGE_SIZE + PAGE_SIZE - 1)

  const { data, error, count } = await query
  if (error) throw error

  const rows = data || []
  const recipeIds = rows.map(r => r.id as string)
  const counts = recipeIds.length ? await getFavoritesCounts(recipeIds) : {}

  return {
    data: rows.map(row => ({ ...toRecipe(row), favorites_count: counts[row.id as string] || 0 })),
    hasMore: page !== undefined && count !== null ? (page + 1) * PAGE_SIZE < count : false,
  }
}

export async function saveRecipe(recipe: Recipe): Promise<void> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('Non connecté')
  const { error } = await supabase.from('recipes').upsert({
    id: recipe.id,
    user_id: user.id,
    title: recipe.title,
    source_url: recipe.source_url || '',
    image_url: recipe.image_url ?? null,
    servings: recipe.servings ?? null,
    prep_time: recipe.prep_time ?? null,
    cook_time: recipe.cook_time ?? null,
    ingredients: recipe.ingredients,
    steps: recipe.steps,
    created_at: recipe.created_at,
    user_notes: recipe.user_notes ?? '',
    user_photo_url: recipe.user_photo_url ?? null,
    tags: recipe.tags ?? [],
  })
  if (error) throw error
}

export async function saveRecipeNotes(id: string, notes: string, photoUrl?: string): Promise<void> {
  const patch: Record<string, unknown> = { user_notes: notes }
  if (photoUrl !== undefined) patch.user_photo_url = photoUrl || null
  const { error } = await supabase.from('recipes').update(patch).eq('id', id)
  if (error) throw error
}

export async function deleteRecipe(id: string): Promise<void> {
  const { error } = await supabase.from('recipes').delete().eq('id', id)
  if (error) throw error
}

function normalizeIngredients(raw: Recipe['ingredients'] | string[]): Recipe['ingredients'] {
  if (!Array.isArray(raw) || raw.length === 0) return []
  if (typeof raw[0] === 'string') {
    return (raw as string[]).map((s, i) => ({
      id: `gen-${i}`,
      name: s,
      quantity: '',
      unit: '',
    }))
  }
  return raw as Recipe['ingredients']
}

function toRecipe(row: Record<string, unknown>): Recipe {
  return {
    id: row.id as string,
    title: row.title as string,
    source_url: (row.source_url as string) || '',
    image_url: (row.image_url as string) || undefined,
    servings: (row.servings as number) || undefined,
    prep_time: (row.prep_time as number) || undefined,
    cook_time: (row.cook_time as number) || undefined,
    ingredients: normalizeIngredients((row.ingredients as (Recipe['ingredients'] | string[])) || []),
    steps: (row.steps as string[]) || [],
    created_at: row.created_at as string,
    user_notes: (row.user_notes as string) || '',
    user_photo_url: (row.user_photo_url as string) || undefined,
    is_public: (row.is_public as boolean) || false,
    moderation_status: (row.moderation_status as Recipe['moderation_status']) || 'private',
    user_id: (row.user_id as string) || undefined,
    is_favorite: (row.is_favorite as boolean) || false,
    tags: (row.tags as string[]) || [],
  }
}

/* ── Public recipes ── */

async function getFavoritesCounts(recipeIds?: string[]): Promise<Record<string, number>> {
  let query = supabase.from('recipe_favorites').select('recipe_id')
  if (recipeIds?.length) query = query.in('recipe_id', recipeIds)
  const { data } = await query
  const map: Record<string, number> = {}
  for (const row of data || []) {
    map[row.recipe_id] = (map[row.recipe_id] || 0) + 1
  }
  return map
}

export async function getPublicRecipes(
  opts: RecipesOptions & { favoriteIds?: string[] } = {}
): Promise<RecipesPage> {
  const { page, search, tags, sort = 'recent', favoriteIds = [] } = opts

  let query = supabase.from('recipes').select('*', { count: 'exact' })
    .eq('is_public', true)
    .eq('moderation_status', 'approved')
  if (search?.trim()) query = query.ilike('title', `%${search.trim()}%`)
  if (tags?.length) query = query.contains('tags', tags)
  if (sort === 'az') query = query.order('title', { ascending: true })
  else query = query.order('created_at', { ascending: false })
  if (page !== undefined) query = query.range(page * PAGE_SIZE, page * PAGE_SIZE + PAGE_SIZE - 1)
  else query = query.limit(200)

  const { data, error, count } = await query
  if (error) throw error

  const rows = data || []
  const recipeIds = rows.map(r => r.id as string)
  const counts = recipeIds.length ? await getFavoritesCounts(recipeIds) : {}
  const userIds = [...new Set(rows.map(r => r.user_id as string).filter(Boolean))]
  const { data: profiles } = userIds.length > 0
    ? await supabase.from('profiles').select('user_id, display_name').in('user_id', userIds)
    : { data: [] }
  const profileMap = Object.fromEntries((profiles || []).map(p => [p.user_id, p.display_name]))

  return {
    data: rows.map(row => ({
      ...toRecipe(row),
      is_favorite: favoriteIds.includes(row.id as string),
      favorites_count: counts[row.id as string] || 0,
      author_name: profileMap[row.user_id as string] || undefined,
    })),
    hasMore: page !== undefined && count !== null ? (page + 1) * PAGE_SIZE < count : false,
  }
}

export async function publishRecipe(id: string, status: 'approved' | 'private'): Promise<{ ok: boolean; reason?: string }> {
  if (status === 'private') {
    const { error } = await supabase
      .from('recipes')
      .update({ is_public: false, moderation_status: 'private' })
      .eq('id', id)
    if (error) throw error
    return { ok: true }
  }

  // Passage en pending avant modération
  const { error: pendingError } = await supabase
    .from('recipes')
    .update({ is_public: false, moderation_status: 'pending' })
    .eq('id', id)
  if (pendingError) throw pendingError

  const { data, error } = await supabase.functions.invoke('moderate-recipe', {
    body: { recipeId: id },
  })

  if (error) {
    try {
      await supabase
        .from('recipes')
        .update({ is_public: false, moderation_status: 'private' })
        .eq('id', id)
    } catch { /* rollback best-effort */ }
    throw new Error('Erreur lors de la modération')
  }

  return data as { ok: boolean; reason?: string }
}

/* ── Favorites ── */

export async function getFavoriteIds(): Promise<string[]> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return []
  const { data } = await supabase
    .from('recipe_favorites')
    .select('recipe_id')
    .eq('user_id', user.id)
  return (data || []).map((r) => r.recipe_id as string)
}

export async function getFavoriteRecipes(): Promise<Recipe[]> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return []
  const { data: favData } = await supabase
    .from('recipe_favorites')
    .select('recipe_id')
    .eq('user_id', user.id)
  const ids = (favData || []).map((r) => r.recipe_id as string)
  if (ids.length === 0) return []
  const { data, error } = await supabase
    .from('recipes')
    .select('*')
    .in('id', ids)
    .order('created_at', { ascending: false })
  if (error) throw error
  return (data || []).map((row) => ({ ...toRecipe(row), is_favorite: true }))
}

export async function toggleFavorite(recipeId: string, isFavorite: boolean): Promise<void> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return
  if (isFavorite) {
    await supabase.from('recipe_favorites').delete()
      .eq('user_id', user.id).eq('recipe_id', recipeId)
  } else {
    await supabase.from('recipe_favorites').insert({ user_id: user.id, recipe_id: recipeId })
  }
}

/* ── Reports ── */

export async function isAdmin(): Promise<boolean> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return false
  const { data } = await supabase.from('admins').select('user_id').eq('user_id', user.id).maybeSingle()
  return !!data
}

export async function reportRecipe(recipeId: string, reason: string): Promise<void> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('Non connecté')
  const { error } = await supabase.from('recipe_reports').insert({
    recipe_id: recipeId,
    reporter_id: user.id,
    reason,
  })
  if (error) throw error
}

/* ── Shopping lists ── */

const ACTIVE_LIST_KEY = 'active_shopping_list_id'

const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i
export function getActiveListId(): string | null {
  const val = localStorage.getItem(ACTIVE_LIST_KEY)
  return val && UUID_RE.test(val) ? val : null
}

export function setActiveListId(id: string): void {
  localStorage.setItem(ACTIVE_LIST_KEY, id)
}

export async function getShoppingLists(): Promise<ShoppingList[]> {
  // RLS returns owned + household lists automatically
  const { data, error } = await supabase
    .from('shopping_lists')
    .select('*')
    .order('created_at', { ascending: true })
  if (error) throw error
  return (data || []).map((r) => ({
    id: r.id as string,
    name: r.name as string,
    created_at: r.created_at as string,
    user_id: r.user_id as string,
    household_id: (r.household_id as string | null) || null,
    is_private: (r.is_private as boolean) || false,
  }))
}

export async function createShoppingList(name: string): Promise<ShoppingList> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('Non connecté')
  const { data, error } = await supabase
    .from('shopping_lists')
    .insert({ user_id: user.id, name })
    .select()
    .single()
  if (error) throw error
  return { id: data.id, name: data.name, created_at: data.created_at }
}

export async function renameShoppingList(id: string, name: string): Promise<void> {
  const { error } = await supabase.from('shopping_lists').update({ name }).eq('id', id)
  if (error) throw error
}

export async function deleteShoppingList(id: string): Promise<void> {
  const { error } = await supabase.from('shopping_lists').delete().eq('id', id)
  if (error) throw error
}

/* ── Shopping items ── */

export async function getShoppingList(listId: string): Promise<ShoppingItem[]> {
  if (!listId) return []
  const { data, error } = await supabase
    .from('shopping_items')
    .select('*')
    .eq('list_id', listId)
    .order('name', { ascending: true })
  if (error) throw error
  return (data || []).map(toShoppingItem)
}

import { mergeQuantity } from './lib/units'
export { mergeQuantity }

async function mergeOrInsertItem(
  userId: string,
  listId: string,
  existing: ShoppingItem[],
  item: { name: string; quantity: string; unit: string; checked: boolean; rayon: string; recipe_id?: string | null; recipe_title?: string | null }
): Promise<void> {
  const key = item.name.toLowerCase().trim()
  const match = existing.find((e) => e.name.toLowerCase().trim() === key && !e.checked)
  if (match && match.id) {
    const { qty: newQty, unit: newUnit } = mergeQuantity(match.quantity, item.quantity, match.unit, item.unit)
    const { error } = await supabase
      .from('shopping_items')
      .update({ quantity: newQty, unit: newUnit })
      .eq('id', match.id)
    if (error) throw error
    match.quantity = newQty
    match.unit = newUnit
  } else {
    const { data: inserted, error } = await supabase.from('shopping_items').insert({
      user_id: userId,
      list_id: listId,
      name: item.name,
      quantity: item.quantity,
      unit: item.unit,
      checked: item.checked,
      rayon: item.rayon,
      recipe_id: item.recipe_id ?? null,
      recipe_title: item.recipe_title ?? null,
    }).select('id').single()
    if (error) throw error
    existing.push({ id: inserted?.id ?? '', name: item.name, quantity: item.quantity, unit: item.unit, checked: false, rayon: item.rayon, list_id: listId })
  }
}

export async function addShoppingItem(item: Omit<ShoppingItem, 'id'>, listId: string): Promise<void> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('Non connecté')
  const existing = await getShoppingList(listId)
  await mergeOrInsertItem(user.id, listId, existing, item)
}

export async function updateShoppingItem(id: string, patch: Partial<ShoppingItem>): Promise<void> {
  const { error } = await supabase.from('shopping_items').update(patch).eq('id', id)
  if (error) throw error
}

export async function deleteShoppingItem(id: string): Promise<void> {
  const { error } = await supabase.from('shopping_items').delete().eq('id', id)
  if (error) throw error
}

export async function clearCheckedItems(listId: string): Promise<void> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('Non connecté')
  const { error } = await supabase
    .from('shopping_items')
    .delete()
    .or(`list_id.eq.${listId},and(user_id.eq.${user.id},list_id.is.null)`)
    .eq('checked', true)
  if (error) throw error
}

// Si listId fourni : supprime uniquement les items de cette liste.
// Si absent : supprime uniquement les items orphelins de l'utilisateur (list_id IS NULL).
// Les deux cas sont mutuellement exclusifs.
export async function clearAllShoppingItems(listId?: string): Promise<void> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('Non connecté')
  if (listId) {
    const { error } = await supabase.from('shopping_items').delete().eq('list_id', listId)
    if (error) throw error
  } else {
    const { error } = await supabase.from('shopping_items').delete().eq('user_id', user.id).is('list_id', null)
    if (error) throw error
  }
}

export async function addIngredientsToShoppingList(recipe: Recipe, listId?: string): Promise<void> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('Non connecté')
  const targetList = listId ?? getActiveListId()
  if (!targetList) throw new Error('Aucune liste de courses sélectionnée')
  const existing = await getShoppingList(targetList)
  for (const ing of recipe.ingredients) {
    await mergeOrInsertItem(user.id, targetList, existing, {
      name: ing.name,
      quantity: ing.quantity,
      unit: ing.unit,
      checked: false,
      rayon: detectRayon(ing.name),
      recipe_id: recipe.id,
      recipe_title: recipe.title,
    })
  }
}

export async function addItemsFromReceipt(listId: string, items: ScannedItem[]): Promise<void> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('Non connecté')
  if (items.length === 0) return
  const rows = items.map((item) => ({
    user_id: user.id,
    list_id: listId,
    name: item.name,
    quantity: String(item.quantity ?? 1),
    unit: item.unit ?? '',
    checked: true,
    rayon: detectRayon(item.name),
  }))
  const { error } = await supabase.from('shopping_items').insert(rows)
  if (error) throw error
}

/* ── Pantry ── */

import { scorePantryMatch } from './lib/pantryMatcher'
export { scorePantryMatch }

function toPantryItem(row: Record<string, unknown>): PantryItem {
  return {
    id: row.id as string,
    user_id: (row.user_id as string) || undefined,
    household_id: (row.household_id as string) || undefined,
    name: row.name as string,
    quantity: (row.quantity as number) ?? null,
    unit: (row.unit as string) || '',
    rayon: (row.rayon as string) || '',
    expires_at: (row.expires_at as string) || null,
    created_at: row.created_at as string,
  }
}

export async function getPantryItems(): Promise<PantryItem[]> {
  const { data, error } = await supabase.from('pantry_items').select('*')
  if (error) throw error
  return (data || [])
    .map(toPantryItem)
    .sort((a, b) => a.rayon.localeCompare(b.rayon) || a.name.localeCompare(b.name))
}

export async function addPantryItem(item: Omit<PantryItem, 'id' | 'created_at'>): Promise<PantryItem> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('Non connecté')
  const { data, error } = await supabase
    .from('pantry_items')
    .insert({
      user_id: user.id,
      name: item.name,
      quantity: item.quantity,
      unit: item.unit,
      rayon: item.rayon,
      expires_at: item.expires_at,
    })
    .select()
    .single()
  if (error) throw error
  return toPantryItem(data)
}

export async function updatePantryItem(id: string, updates: Partial<Pick<PantryItem, 'quantity' | 'unit' | 'expires_at' | 'rayon'>>): Promise<void> {
  const { error } = await supabase.from('pantry_items').update(updates).eq('id', id)
  if (error) throw error
}

export async function deletePantryItem(id: string): Promise<void> {
  const { error } = await supabase.from('pantry_items').delete().eq('id', id)
  if (error) throw error
}

export async function clearPantry(): Promise<void> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('Non connecté')
  const { error } = await supabase.from('pantry_items').delete().eq('user_id', user.id)
  if (error) throw error
}

/* ── Profiles ── */

export async function getProfile(): Promise<Profile | null> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return null
  const { data } = await supabase.from('profiles').select('*').eq('user_id', user.id).maybeSingle()
  return data ? {
    user_id: data.user_id,
    display_name: data.display_name,
    avatar_url: data.avatar_url ?? undefined,
    dietary_filters: (data.dietary_filters as string[]) ?? [],
    created_at: data.created_at,
  } : null
}

export async function saveProfile(displayName: string, avatarUrl?: string): Promise<void> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('Non connecté')
  const patch: Record<string, unknown> = { user_id: user.id, display_name: displayName.trim() }
  if (avatarUrl !== undefined) patch.avatar_url = avatarUrl
  const { error } = await supabase.from('profiles').upsert(patch)
  if (error) throw error
}

export async function saveDietaryFilters(filters: string[]): Promise<void> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('Non connecté')
  const { error } = await supabase.from('profiles').upsert({ user_id: user.id, dietary_filters: filters })
  if (error) throw error
}

export async function savePublicRecipe(recipeId: string): Promise<void> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('Non connecté')
  const { data: src, error } = await supabase.from('recipes').select('*').eq('id', recipeId).single()
  if (error) throw error
  const { error: e2 } = await supabase.from('recipes').insert({
    user_id: user.id,
    title: src.title,
    source_url: src.source_url || '',
    image_url: src.image_url ?? null,
    servings: src.servings ?? null,
    prep_time: src.prep_time ?? null,
    cook_time: src.cook_time ?? null,
    ingredients: src.ingredients,
    steps: src.steps,
    tags: src.tags ?? [],
    is_public: false,
    moderation_status: 'private',
  })
  if (e2) throw e2
}

export async function uploadAvatar(file: File): Promise<string> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('Non connecté')
  const ext = file.name.split('.').pop() || 'jpg'
  const path = `${user.id}/avatar.${ext}`
  const { error } = await supabase.storage.from('avatars').upload(path, file, { upsert: true })
  if (error) throw error
  const { data } = supabase.storage.from('avatars').getPublicUrl(path)
  return `${data.publicUrl}?t=${Date.now()}`
}

export async function uploadRecipePhoto(recipeId: string, file: File): Promise<string> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('Non connecté')
  const ext = file.name.split('.').pop() || 'jpg'
  const path = `${user.id}/${recipeId}.${ext}`
  const { error } = await supabase.storage.from('recipe-photos').upload(path, file, { upsert: true })
  if (error) throw error
  const { data } = supabase.storage.from('recipe-photos').getPublicUrl(path)
  return `${data.publicUrl}?t=${Date.now()}`
}

export async function updatePassword(currentPassword: string | null, newPassword: string): Promise<void> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user?.email) throw new Error('Non connecté')
  // En mode récupération (lien email), la session est déjà authentifiée — pas besoin de vérifier l'ancien mot de passe
  if (currentPassword !== null) {
    const { error: signInError } = await supabase.auth.signInWithPassword({ email: user.email, password: currentPassword })
    if (signInError) throw new Error('Mot de passe actuel incorrect')
  }
  const { error } = await supabase.auth.updateUser({ password: newPassword })
  if (error) throw error
}

export async function isDisplayNameAvailable(name: string): Promise<boolean> {
  const { data } = await supabase.from('profiles').select('user_id').eq('display_name', name.trim()).maybeSingle()
  return !data
}

export async function searchProfileByName(pseudo: string): Promise<Profile | null> {
  const { data } = await supabase.from('profiles').select('*').eq('display_name', pseudo.trim()).maybeSingle()
  return data ? { user_id: data.user_id, display_name: data.display_name, created_at: data.created_at } : null
}

/* ── Shopping list shares ── */

export async function shareListWithPseudo(listId: string, pseudo: string): Promise<void> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('Non connecté')
  const target = await searchProfileByName(pseudo)
  if (!target) throw new Error(`Pseudo "@${pseudo}" introuvable`)
  if (target.user_id === user.id) throw new Error('Vous ne pouvez pas partager avec vous-même')
  const { error } = await supabase.from('shopping_list_shares').insert({
    list_id: listId, owner_id: user.id, invited_user_id: target.user_id, can_edit: true,
  })
  if (error?.code === '23505') throw new Error(`Déjà partagé avec @${pseudo}`)
  if (error) throw new Error(error.message + (error.hint ? ' — ' + error.hint : ''))
}

export async function getListShares(listId: string): Promise<{ user_id: string; display_name: string }[]> {
  const { data } = await supabase
    .from('shopping_list_shares')
    .select('invited_user_id')
    .eq('list_id', listId)
  if (!data || data.length === 0) return []
  const ids = data.map((r) => r.invited_user_id as string)
  const { data: profiles } = await supabase.from('profiles').select('user_id, display_name').in('user_id', ids)
  return (profiles || []).map((p) => ({ user_id: p.user_id, display_name: p.display_name }))
}

export async function removeListShare(listId: string, invitedUserId: string): Promise<void> {
  await supabase.from('shopping_list_shares').delete().eq('list_id', listId).eq('invited_user_id', invitedUserId)
}

const APP_URL = import.meta.env.VITE_APP_URL as string

export async function createInviteLink(listId: string): Promise<string> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('Non connecté')
  // Réutilise un token existant pour cette liste
  const { data: existing } = await supabase
    .from('list_invites').select('token').eq('list_id', listId).eq('owner_id', user.id).maybeSingle()
  if (existing) return `${APP_URL}/?invite=${existing.token}`
  const { data, error } = await supabase
    .from('list_invites').insert({ list_id: listId, owner_id: user.id }).select('token').single()
  if (error) throw new Error(error.message)
  return `${APP_URL}/?invite=${data.token}`
}

export async function acceptInvite(token: string): Promise<string> {
  const { data, error } = await supabase.rpc('accept_list_invite', { invite_token: token })
  if (error) throw new Error(error.message)
  return data as string
}

/* ── Menu shares ── */

export async function createMenuInviteLink(menuId: string): Promise<string> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('Non connecté')
  const { data: existing } = await supabase
    .from('menu_invites').select('token').eq('menu_id', menuId).maybeSingle()
  if (existing) return `${APP_URL}/?menu_invite=${existing.token}`
  const { data, error } = await supabase
    .from('menu_invites').insert({ menu_id: menuId }).select('token').single()
  if (error) throw new Error(error.message)
  return `${APP_URL}/?menu_invite=${data.token}`
}

export async function acceptMenuInvite(token: string): Promise<string> {
  const { data, error } = await supabase.rpc('accept_menu_invite', { invite_token: token })
  if (error) throw new Error(error.message)
  return data as string
}

export async function shareMenuWithPseudo(menuId: string, pseudo: string): Promise<void> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('Non connecté')
  const target = await searchProfileByName(pseudo)
  if (!target) throw new Error(`Pseudo "@${pseudo}" introuvable`)
  if (target.user_id === user.id) throw new Error('Vous ne pouvez pas partager avec vous-même')
  const { error } = await supabase.from('menu_shares').insert({ menu_id: menuId, shared_with_user_id: target.user_id, can_edit: true })
  if (error?.code === '23505') throw new Error(`Déjà partagé avec @${pseudo}`)
  if (error) throw new Error(error.message)
}

export async function getMenuShares(menuId: string): Promise<{ user_id: string; display_name: string }[]> {
  const { data } = await supabase.from('menu_shares').select('shared_with_user_id').eq('menu_id', menuId)
  if (!data || data.length === 0) return []
  const ids = data.map(r => r.shared_with_user_id as string)
  const { data: profiles } = await supabase.from('profiles').select('user_id, display_name').in('user_id', ids)
  return (profiles || []).map(p => ({ user_id: p.user_id, display_name: p.display_name }))
}

export async function removeMenuShare(menuId: string, userId: string): Promise<void> {
  await supabase.from('menu_shares').delete().eq('menu_id', menuId).eq('shared_with_user_id', userId)
}

export async function leaveMenu(menuId: string): Promise<void> {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('Non connecté')
  await supabase.from('menu_shares').delete().eq('menu_id', menuId).eq('shared_with_user_id', user.id)
}

export async function updateMenuSlot(menuId: string, slot: import('./types').MenuSlot): Promise<void> {
  const { error } = await supabase.from('menu_items')
    .update({ recipe_id: slot.recipeId, locked: slot.locked })
    .eq('menu_id', menuId)
    .eq('day_number', slot.day)
    .eq('meal_type', slot.mealType)
    .eq('position', slot.position)
  if (error) throw error
}

export async function replaceMenuSlots(menuId: string, slots: import('./types').MenuSlot[]): Promise<void> {
  const { error: e1 } = await supabase.from('menu_items').delete().eq('menu_id', menuId)
  if (e1) throw e1
  if (slots.length === 0) return
  const items = slots.map(s => ({
    menu_id: menuId, day_number: s.day, meal_type: s.mealType,
    recipe_id: s.recipeId, locked: s.locked, position: s.position,
  }))
  const { error: e2 } = await supabase.from('menu_items').insert(items)
  if (e2) throw e2
}

function toShoppingItem(row: Record<string, unknown>): ShoppingItem {
  return {
    id: row.id as string,
    name: row.name as string,
    quantity: (row.quantity as string) || '',
    unit: (row.unit as string) || '',
    checked: (row.checked as boolean) || false,
    rayon: (row.rayon as string) || 'Autre',
    recipe_id: (row.recipe_id as string) || undefined,
    recipe_title: (row.recipe_title as string) || undefined,
    list_id: (row.list_id as string) || undefined,
  }
}
