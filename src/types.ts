export interface Ingredient {
  id: string
  name: string
  quantity: string
  unit: string
}

export interface Recipe {
  id: string
  title: string
  source_url: string
  image_url?: string
  servings?: number
  prep_time?: number
  cook_time?: number
  ingredients: Ingredient[]
  steps: string[]
  created_at: string
  user_notes?: string
  user_photo_url?: string
  is_public?: boolean
  moderation_status?: 'private' | 'pending' | 'approved' | 'rejected'
  user_id?: string
  is_favorite?: boolean
  favorites_count?: number
  tags?: string[]
  author_name?: string
}

export interface Profile {
  user_id: string
  display_name: string
  avatar_url?: string
  dietary_filters?: string[]
  created_at: string
}

export type MenuMealType = 'entree' | 'plat' | 'dessert'

export interface MenuConfig {
  days: number
  entrees: number
  plats: number
  desserts: number
  tags: string[]
  persons: number
}

export interface MenuSlot {
  day: number
  mealType: MenuMealType
  position: number
  recipeId: string
  recipeTitle: string
  locked: boolean
}

export interface SavedMenu {
  id: string
  name: string
  days_count: number
  config: MenuConfig
  created_at: string
  user_id?: string
  household_id?: string | null
  is_private?: boolean
}

export interface ShoppingList {
  id: string
  name: string
  created_at: string
  user_id?: string
  household_id?: string | null
  is_private?: boolean
}

export interface HouseholdMember {
  user_id: string
  pseudo: string
  avatar_url: string | null
  role: 'owner' | 'member'
}

export interface Household {
  id: string
  name: string
  invite_code: string
  color: string
  created_by: string
  role: 'owner' | 'member'
  members: HouseholdMember[]
}

export interface ShoppingItem {
  id: string
  name: string
  quantity: string
  unit: string
  checked: boolean
  rayon: string
  recipe_id?: string
  recipe_title?: string
  list_id?: string
}

export interface ScannedItem {
  name: string
  quantity: number | null
  unit: string | null
}

export interface PantryItem {
  id: string
  user_id?: string
  household_id?: string
  name: string
  quantity: number | null
  unit: string
  rayon: string
  expires_at: string | null
  created_at: string
}
