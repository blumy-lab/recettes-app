import { describe, it, expect, beforeEach, vi } from 'vitest'
import { planHistory, readEntry, syncHistory, type HistoryEntry } from './navHistory'
import type { NavState } from './navState'

const nav = (view: NavState['view'], recipeId: string | null = null, returnView: NavState['view'] = 'recipes'): NavState =>
  ({ view, returnView, recipeId })
const entry = (n: NavState, prev: NavState | null = null): HistoryEntry => ({ nav: n, prev })

describe('planHistory', () => {
  it('première entrée : remplace l\'entrée du navigateur', () => {
    expect(planHistory(null, nav('recipes'))).toBe('replace')
  })

  it('même écran : ne fait rien', () => {
    expect(planHistory(entry(nav('shopping')), nav('shopping'))).toBe('none')
  })

  it('passer d\'un onglet à l\'autre ne remplit pas l\'historique', () => {
    expect(planHistory(entry(nav('recipes')), nav('shopping'))).toBe('replace')
  })

  it('ouvrir une fiche empile une entrée', () => {
    expect(planHistory(entry(nav('recipes')), nav('detail', 'r1'))).toBe('push')
  })

  it('ouvrir une autre fiche depuis une fiche empile aussi', () => {
    expect(planHistory(entry(nav('detail', 'r1')), nav('detail', 'r2'))).toBe('push')
  })

  it('le ← de l\'appli dépile au lieu d\'empiler', () => {
    const current = entry(nav('detail', 'r1'), nav('recipes'))
    expect(planHistory(current, nav('recipes'))).toBe('back')
  })

  it('enregistrer une modification revient à la fiche (dépile)', () => {
    const current = entry(nav('edit', 'r1'), nav('detail', 'r1'))
    expect(planHistory(current, nav('detail', 'r1'))).toBe('back')
  })

  it('créer une recette remplace le formulaire par la fiche', () => {
    const current = entry(nav('create'), nav('recipes'))
    expect(planHistory(current, nav('detail', 'neuve'))).toBe('replace')
  })

  it('un changement de returnView seul met l\'entrée à jour', () => {
    expect(planHistory(entry(nav('detail', 'r1', 'recipes')), nav('detail', 'r1', 'planner'))).toBe('replace')
  })
})

describe('readEntry', () => {
  it('ignore un état absent ou étranger', () => {
    expect(readEntry(null)).toBeNull()
    expect(readEntry({})).toBeNull()
    expect(readEntry({ mrNav: { nav: { view: 'nimporte' } } })).toBeNull()
  })

  it('relit une entrée valide', () => {
    const e = readEntry({ mrNav: { nav: nav('detail', 'r1'), prev: nav('recipes') } })
    expect(e?.nav.view).toBe('detail')
    expect(e?.prev?.view).toBe('recipes')
  })
})

describe('syncHistory', () => {
  beforeEach(() => { window.history.replaceState(null, '') })

  it('empile une fiche puis la retire avec back', () => {
    syncHistory(nav('recipes'))
    const before = window.history.length
    syncHistory(nav('detail', 'r1'))
    expect(window.history.length).toBe(before + 1)
    expect(readEntry(window.history.state)?.nav.view).toBe('detail')
    expect(readEntry(window.history.state)?.prev?.view).toBe('recipes')
  })

  it('dépile quand on revient à l\'écran du dessous', () => {
    syncHistory(nav('recipes'))
    syncHistory(nav('detail', 'r1'))
    const back = vi.spyOn(window.history, 'back').mockImplementation(() => {})
    syncHistory(nav('recipes'))
    expect(back).toHaveBeenCalledTimes(1)
    back.mockRestore()
  })
})
