import { readPersisted, writePersisted } from './persistedState'

export const VIEWS = [
  'recipes', 'shopping', 'planner', 'explore', 'pantry', 'import', 'import-photo',
  'create', 'edit', 'detail', 'detail-public', 'profile',
] as const

export type View = typeof VIEWS[number]

export function isView(v: unknown): v is View {
  return typeof v === 'string' && (VIEWS as readonly string[]).includes(v)
}

// Vues qui affichent une recette précise (elle est rechargée par son id).
export function viewNeedsRecipe(v: View): boolean {
  return v === 'detail' || v === 'detail-public' || v === 'edit'
}

export interface NavState {
  view: View
  returnView: View
  recipeId: string | null
}

const NAV_KEY = 'nav'

export const DEFAULT_NAV: NavState = { view: 'recipes', returnView: 'recipes', recipeId: null }

function parseNav(raw: unknown): NavState | undefined {
  if (!raw || typeof raw !== 'object') return undefined
  const { view, returnView, recipeId } = raw as Record<string, unknown>
  if (!isView(view)) return undefined
  const safeReturn: View = isView(returnView) ? returnView : 'recipes'
  const id = typeof recipeId === 'string' && recipeId ? recipeId : null
  // Une vue « recette » sans recette connue ne peut pas être restaurée.
  if (viewNeedsRecipe(view) && !id) return DEFAULT_NAV
  return { view, returnView: safeReturn, recipeId: viewNeedsRecipe(view) ? id : null }
}

export function loadNav(): NavState {
  return readPersisted(NAV_KEY, parseNav) ?? DEFAULT_NAV
}

export function saveNav(nav: NavState): void {
  writePersisted(NAV_KEY, nav)
}
