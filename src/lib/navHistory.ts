import { isView, type NavState, type View } from './navState'

// Lien entre les écrans de l'appli et l'historique du navigateur : le geste
// « retour » du téléphone (ou le bouton ← du navigateur) revient à l'écran
// précédent au lieu de quitter l'appli. L'adresse (URL) ne change pas.

export interface HistoryEntry {
  nav: NavState
  // écran de l'entrée juste en dessous dans la pile, pour reconnaître un retour
  prev: NavState | null
}

export type HistoryAction = 'none' | 'replace' | 'push' | 'back'

const STATE_KEY = 'mrNav'

// Écrans « profonds » : on y entre depuis un onglet et on en ressort par ←.
const DEEP_VIEWS: View[] = ['detail', 'detail-public', 'edit', 'create', 'import', 'import-photo']
// Écrans de saisie : une fois la recette enregistrée, ← ne doit pas y ramener.
const FORM_VIEWS: View[] = ['create', 'import', 'import-photo']

function parseNav(raw: unknown): NavState | null {
  if (!raw || typeof raw !== 'object') return null
  const { view, returnView, recipeId } = raw as Record<string, unknown>
  if (!isView(view)) return null
  return {
    view,
    returnView: isView(returnView) ? returnView : 'recipes',
    recipeId: typeof recipeId === 'string' && recipeId ? recipeId : null,
  }
}

export function readEntry(state: unknown): HistoryEntry | null {
  if (!state || typeof state !== 'object') return null
  const raw = (state as Record<string, unknown>)[STATE_KEY]
  if (!raw || typeof raw !== 'object') return null
  const nav = parseNav((raw as Record<string, unknown>).nav)
  if (!nav) return null
  return { nav, prev: parseNav((raw as Record<string, unknown>).prev) }
}

const sameScreen = (a: NavState, b: NavState) => a.view === b.view && a.recipeId === b.recipeId

export function planHistory(current: HistoryEntry | null, next: NavState): HistoryAction {
  if (!current) return 'replace'
  if (sameScreen(current.nav, next)) return current.nav.returnView === next.returnView ? 'none' : 'replace'
  // on revient à l'écran d'en dessous (← de l'appli) : on dépile au lieu d'empiler
  if (current.prev && sameScreen(current.prev, next)) return 'back'
  if (!DEEP_VIEWS.includes(next.view)) return 'replace'
  if (FORM_VIEWS.includes(current.nav.view) && next.view === 'detail') return 'replace'
  return 'push'
}

function wrap(nav: NavState, prev: NavState | null) {
  return { [STATE_KEY]: { nav, prev } }
}

// Applique l'action au navigateur ; renvoie sans effet si l'historique est inaccessible.
export function syncHistory(next: NavState): void {
  try {
    const current = readEntry(window.history.state)
    const action = planHistory(current, next)
    if (action === 'push') window.history.pushState(wrap(next, current?.nav ?? null), '')
    else if (action === 'replace') window.history.replaceState(wrap(next, current?.prev ?? null), '')
    else if (action === 'back') window.history.back()
  } catch {
    // historique indisponible : la navigation interne continue de fonctionner
  }
}
