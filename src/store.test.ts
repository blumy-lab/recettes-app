import { describe, it, expect } from 'vitest'
import { mergeQuantity } from './lib/units'

describe('mergeQuantity', () => {
  it('same unit — adds quantities directly', () => {
    const result = mergeQuantity('200', '300', 'g', 'g')
    expect(result).toEqual({ qty: '500', unit: 'g' })
  })

  it('500g + 1kg → 1.5kg', () => {
    const result = mergeQuantity('500', '1', 'g', 'kg')
    expect(result).toEqual({ qty: '1.5', unit: 'kg' })
  })

  it('25cl + 500ml → 7.5dl (bestUnit choisit dl pour 750ml)', () => {
    const result = mergeQuantity('25', '500', 'cl', 'ml')
    expect(result).toEqual({ qty: '7.5', unit: 'dl' })
  })

  it('incompatible units (g + ml) — returns existing unchanged', () => {
    const result = mergeQuantity('100', '200', 'g', 'ml')
    expect(result).toEqual({ qty: '100', unit: 'g' })
  })

  it('empty new quantity — returns existing unchanged', () => {
    const result = mergeQuantity('200', '', 'g', 'g')
    expect(result).toEqual({ qty: '200', unit: 'g' })
  })

  it('empty existing quantity — returns new', () => {
    const result = mergeQuantity('', '150', 'g', 'g')
    expect(result).toEqual({ qty: '150', unit: 'g' })
  })

  it('non-numeric quantity — returns existing unchanged', () => {
    const result = mergeQuantity('quelques', '2', 'g', 'g')
    expect(result).toEqual({ qty: 'quelques', unit: 'g' })
  })

  it('unit normalisation — strips trailing dot', () => {
    const result = mergeQuantity('100', '50', 'g.', 'g')
    expect(result).toEqual({ qty: '150', unit: 'g.' })
  })

  it('250ml + 75cl → 1l', () => {
    const result = mergeQuantity('250', '75', 'ml', 'cl')
    expect(result).toEqual({ qty: '1', unit: 'l' })
  })
})
