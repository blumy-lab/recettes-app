import { describe, it, expect } from 'vitest'
import { readPersisted, writePersisted, clearPersisted } from './persistedState'
import { loadNav, saveNav, DEFAULT_NAV, isView, viewNeedsRecipe } from './navState'

describe('persistedState', () => {
  it('relit ce qui a été écrit', () => {
    writePersisted('a', { x: 1, tags: ['b'] })
    expect(readPersisted('a')).toEqual({ x: 1, tags: ['b'] })
  })

  it('renvoie undefined pour une clé absente', () => {
    expect(readPersisted('absente')).toBeUndefined()
  })

  it('ignore un JSON corrompu au lieu de planter', () => {
    sessionStorage.setItem('mr:v1:casse', '{pas du json')
    expect(readPersisted('casse')).toBeUndefined()
  })

  it('rejette une valeur que parse refuse (forme changée entre deux versions)', () => {
    writePersisted('n', 'texte')
    expect(readPersisted('n', raw => (typeof raw === 'number' ? raw : undefined))).toBeUndefined()
  })

  it('écrire undefined supprime la clé', () => {
    writePersisted('k', 'v')
    writePersisted('k', undefined)
    expect(readPersisted('k')).toBeUndefined()
  })

  it('clearPersisted supprime par préfixe sans toucher au reste', () => {
    writePersisted('form:new:title', 'a')
    writePersisted('form:new:steps', ['b'])
    writePersisted('form:42:title', 'c')
    sessionStorage.setItem('autre-appli', 'intact')

    clearPersisted('form:new:')

    expect(readPersisted('form:new:title')).toBeUndefined()
    expect(readPersisted('form:new:steps')).toBeUndefined()
    expect(readPersisted('form:42:title')).toBe('c')
    expect(sessionStorage.getItem('autre-appli')).toBe('intact')
  })

  it('clearPersisted sans préfixe efface tout l\'état de l\'appli (déconnexion) mais pas les autres clés', () => {
    writePersisted('nav', { view: 'shopping' })
    writePersisted('list:search', 'poulet')
    sessionStorage.setItem('pending_invite', 'token')

    clearPersisted()

    expect(readPersisted('nav')).toBeUndefined()
    expect(readPersisted('list:search')).toBeUndefined()
    expect(sessionStorage.getItem('pending_invite')).toBe('token')
  })
})

describe('navState', () => {
  it('démarre sur la liste des recettes quand rien n\'est sauvegardé', () => {
    expect(loadNav()).toEqual(DEFAULT_NAV)
  })

  it('restaure la page courante (ex. onglet Courses)', () => {
    saveNav({ view: 'shopping', returnView: 'recipes', recipeId: null })
    expect(loadNav()).toEqual({ view: 'shopping', returnView: 'recipes', recipeId: null })
  })

  it('restaure une fiche recette avec son id et la vue de retour', () => {
    saveNav({ view: 'detail', returnView: 'planner', recipeId: 'r-1' })
    expect(loadNav()).toEqual({ view: 'detail', returnView: 'planner', recipeId: 'r-1' })
  })

  it('une vue « fiche » sans id de recette retombe sur la liste', () => {
    saveNav({ view: 'detail', returnView: 'recipes', recipeId: null })
    expect(loadNav()).toEqual(DEFAULT_NAV)
  })

  it('oublie l\'id de recette pour une vue qui n\'en a pas besoin', () => {
    saveNav({ view: 'pantry', returnView: 'recipes', recipeId: 'r-9' })
    expect(loadNav().recipeId).toBeNull()
  })

  it('ignore une vue inconnue (version précédente de l\'appli)', () => {
    sessionStorage.setItem('mr:v1:nav', JSON.stringify({ view: 'ancienne-vue', returnView: 'recipes', recipeId: null }))
    expect(loadNav()).toEqual(DEFAULT_NAV)
  })

  it('isView / viewNeedsRecipe', () => {
    expect(isView('shopping')).toBe(true)
    expect(isView('nimporte-quoi')).toBe(false)
    expect(viewNeedsRecipe('edit')).toBe(true)
    expect(viewNeedsRecipe('recipes')).toBe(false)
  })
})
