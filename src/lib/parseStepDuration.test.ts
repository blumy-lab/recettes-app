import { describe, it, expect } from 'vitest'
import { parseStepDuration } from './parseStepDuration'

describe('parseStepDuration', () => {
  it('10 minutes → 600s', () => {
    expect(parseStepDuration('faire cuire 10 minutes')).toBe(600)
  })

  it('1h30 compact → 5400s', () => {
    expect(parseStepDuration('laisser reposer 1h30')).toBe(5400)
  })

  it('45 min → 2700s', () => {
    expect(parseStepDuration('mijoter pendant 45 min')).toBe(2700)
  })

  it('2 heures → 7200s', () => {
    expect(parseStepDuration('attendre 2 heures')).toBe(7200)
  })

  it('1 h → 3600s', () => {
    expect(parseStepDuration('cuire 1 h')).toBe(3600)
  })

  it('range "2-3 minutes" → borne basse (120s)', () => {
    expect(parseStepDuration('2-3 minutes de repos')).toBe(120)
  })

  it('1 h 30 min → 5400s', () => {
    expect(parseStepDuration('cuire 1 h 30 min')).toBe(5400)
  })

  it('1 heure 30 minutes → 5400s', () => {
    expect(parseStepDuration('mijoter 1 heure 30 minutes')).toBe(5400)
  })

  it('texte sans durée → null', () => {
    expect(parseStepDuration('préparer les légumes')).toBeNull()
  })

  it('secondes non reconnues → null', () => {
    expect(parseStepDuration('chauffer 30 secondes')).toBeNull()
  })
})
