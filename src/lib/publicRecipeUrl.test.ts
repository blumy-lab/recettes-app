import { describe, it, expect } from 'vitest'
import { isValidRecipeId, buildPublicRecipeUrl } from './publicRecipeUrl'

describe('isValidRecipeId', () => {
  it('accepte un UUID valide', () => {
    expect(isValidRecipeId('8d6512ac-4307-4673-8447-1c51e615863d')).toBe(true)
  })

  it('rejette une chaîne vide', () => {
    expect(isValidRecipeId('')).toBe(false)
  })

  it('rejette une tentative d\'injection <script>', () => {
    expect(isValidRecipeId('<script>alert(1)</script>')).toBe(false)
  })

  it('rejette une tentative de traversée de chemin ../', () => {
    expect(isValidRecipeId('../../etc/passwd')).toBe(false)
  })
})

describe('buildPublicRecipeUrl', () => {
  it('construit l\'URL de partage pour un id valide', () => {
    expect(buildPublicRecipeUrl('8d6512ac-4307-4673-8447-1c51e615863d', 'https://example.test'))
      .toBe('https://example.test/share-recipe.php?id=8d6512ac-4307-4673-8447-1c51e615863d')
  })

  it('retourne undefined pour un id invalide', () => {
    expect(buildPublicRecipeUrl('not-a-uuid', 'https://example.test')).toBeUndefined()
  })
})
