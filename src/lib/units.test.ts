import { describe, it, expect } from 'vitest'
import { mergeQuantity } from './units'

describe('mergeQuantity — consolidation multi-recettes', () => {
  it('500g + 1kg → 1.5kg', () => {
    expect(mergeQuantity('500', '1', 'g', 'kg')).toEqual({ qty: '1.5', unit: 'kg' })
  })

  it('250ml + 75cl → 1l', () => {
    expect(mergeQuantity('250', '75', 'ml', 'cl')).toEqual({ qty: '1', unit: 'l' })
  })

  it('100g + 200g → 300g (même unité)', () => {
    expect(mergeQuantity('100', '200', 'g', 'g')).toEqual({ qty: '300', unit: 'g' })
  })
})
