import { describe, it, expect } from 'vitest'
import { normalizeScannedItems } from './gemini'

describe('normalizeScannedItems — transformation du résultat Gemini', () => {
  it('items vide → tableau vide sans erreur', () => {
    expect(normalizeScannedItems([])).toEqual([])
    expect(normalizeScannedItems(undefined)).toEqual([])
    expect(normalizeScannedItems(null)).toEqual([])
  })

  it('item sans quantité → quantity: 1, unit: \'\' par défaut', () => {
    expect(normalizeScannedItems([{ name: 'Lait' }])).toEqual([
      { name: 'Lait', quantity: 1, unit: '' },
    ])
    expect(normalizeScannedItems([{ name: 'Pain', quantity: null, unit: null }])).toEqual([
      { name: 'Pain', quantity: 1, unit: '' },
    ])
  })

  it('item avec quantité → valeurs conservées telles quelles', () => {
    expect(normalizeScannedItems([{ name: 'Yaourts', quantity: 4, unit: 'pot' }])).toEqual([
      { name: 'Yaourts', quantity: 4, unit: 'pot' },
    ])
  })
})
