import { describe, it, expect, vi } from 'vitest'

// scraper.ts imports generateId from lib/uuid — mock it to return a stable id
vi.mock('./lib/uuid', () => ({ generateId: () => 'test-id' }))

import { parseDuration, parseJsonLd } from './scraper'

// ── parseDuration ──────────────────────────────────────────────────────────

describe('parseDuration', () => {
  it('returns undefined for undefined input', () => {
    expect(parseDuration(undefined)).toBeUndefined()
  })

  it('PT45M → 45', () => {
    expect(parseDuration('PT45M')).toBe(45)
  })

  it('PT1H → 60', () => {
    expect(parseDuration('PT1H')).toBe(60)
  })

  it('PT1H30M → 90', () => {
    expect(parseDuration('PT1H30M')).toBe(90)
  })

  it('PT2H15M → 135', () => {
    expect(parseDuration('PT2H15M')).toBe(135)
  })

  it('unrecognised format → undefined', () => {
    expect(parseDuration('P1D')).toBeUndefined()
  })
})

// ── parseJsonLd ────────────────────────────────────────────────────────────

function wrap(json: unknown): string {
  return `<html><head><script type="application/ld+json">${JSON.stringify(json)}</script></head></html>`
}

const SIMPLE_RECIPE = {
  '@type': 'Recipe',
  name: 'Tarte tatin',
  recipeIngredient: ['4 pommes', '100g beurre'],
  recipeInstructions: [{ text: 'Éplucher les pommes' }, { text: 'Cuire' }],
  recipeYield: '4',
  prepTime: 'PT20M',
  cookTime: 'PT40M',
}

describe('parseJsonLd', () => {
  it('simple Recipe object', () => {
    const result = parseJsonLd(wrap(SIMPLE_RECIPE))
    expect(result).not.toBeNull()
    expect(result!.title).toBe('Tarte tatin')
    expect(result!.ingredients).toEqual(['4 pommes', '100g beurre'])
    expect(result!.steps).toEqual(['Éplucher les pommes', 'Cuire'])
    expect(result!.servings).toBe(4)
    expect(result!.prep_time).toBe(20)
    expect(result!.cook_time).toBe(40)
  })

  it('@graph with nested Recipe', () => {
    const json = {
      '@context': 'https://schema.org',
      '@graph': [
        { '@type': 'WebPage', name: 'Ma page' },
        { ...SIMPLE_RECIPE, name: 'Quiche lorraine' },
      ],
    }
    const result = parseJsonLd(wrap(json))
    expect(result).not.toBeNull()
    expect(result!.title).toBe('Quiche lorraine')
  })

  it('array of JSON-LD objects containing Recipe', () => {
    const json = [
      { '@type': 'BreadcrumbList' },
      { ...SIMPLE_RECIPE, name: 'Crêpes' },
    ]
    const result = parseJsonLd(wrap(json))
    expect(result).not.toBeNull()
    expect(result!.title).toBe('Crêpes')
  })

  it('no Recipe type → null', () => {
    const result = parseJsonLd(wrap({ '@type': 'WebPage', name: 'Accueil' }))
    expect(result).toBeNull()
  })

  it('no JSON-LD script tag → null', () => {
    expect(parseJsonLd('<html><body><p>Bonjour</p></body></html>')).toBeNull()
  })

  it('HTML-encoded type attribute is handled', () => {
    // Some sites write type="application&#x2F;ld+json"
    const html = `<script type="application&#x2F;ld+json">${JSON.stringify(SIMPLE_RECIPE)}</script>`
    const result = parseJsonLd(html)
    expect(result).not.toBeNull()
    expect(result!.title).toBe('Tarte tatin')
  })

  it('image as string', () => {
    const json = { ...SIMPLE_RECIPE, image: 'https://example.com/img.jpg' }
    const result = parseJsonLd(wrap(json))
    expect(result!.image_url).toBe('https://example.com/img.jpg')
  })

  it('image as object with url', () => {
    const json = { ...SIMPLE_RECIPE, image: { url: 'https://example.com/img.jpg' } }
    const result = parseJsonLd(wrap(json))
    expect(result!.image_url).toBe('https://example.com/img.jpg')
  })
})
