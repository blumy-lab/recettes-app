// Conversion vers unité de base : poids → g, volume → ml
export const TO_BASE: Record<string, number> = {
  g: 1, kg: 1000, mg: 0.001,
  ml: 1, cl: 10, dl: 100, l: 1000,
}

// Groupes d'unités compatibles
export const WEIGHT_UNITS = new Set(['g', 'kg', 'mg'])
export const VOLUME_UNITS = new Set(['ml', 'cl', 'dl', 'l'])

function normalizeUnit(u: string): string {
  return u.toLowerCase().trim().replace(/\.$/, '')
}

function unitsCompatible(a: string, b: string): boolean {
  const na = normalizeUnit(a)
  const nb = normalizeUnit(b)
  if (na === nb) return true
  if (WEIGHT_UNITS.has(na) && WEIGHT_UNITS.has(nb)) return true
  if (VOLUME_UNITS.has(na) && VOLUME_UNITS.has(nb)) return true
  return false
}

function bestUnit(totalBase: number, unitGroup: Set<string>): string {
  if (unitGroup === WEIGHT_UNITS) {
    if (totalBase >= 1000) return 'kg'
    return 'g'
  }
  if (unitGroup === VOLUME_UNITS) {
    if (totalBase >= 1000) return 'l'
    if (totalBase >= 100) return 'dl'
    if (totalBase >= 10) return 'cl'
    return 'ml'
  }
  return ''
}

export function mergeQuantity(
  existingQty: string,
  newQty: string,
  existingUnit: string,
  newUnit: string,
): { qty: string; unit: string } {
  const eu = normalizeUnit(existingUnit)
  const nu = normalizeUnit(newUnit)

  if (!newQty) return { qty: existingQty, unit: existingUnit }
  if (!existingQty) return { qty: newQty, unit: newUnit }

  const a = parseFloat(existingQty.replace(',', '.'))
  const b = parseFloat(newQty.replace(',', '.'))
  if (isNaN(a) || isNaN(b)) return { qty: existingQty, unit: existingUnit }

  // Same unit — simple addition
  if (eu === nu) {
    return { qty: String(Math.round((a + b) * 100) / 100), unit: existingUnit }
  }

  // Compatible units (both weight or both volume) — convert to base then back
  if (!unitsCompatible(eu, nu)) return { qty: existingQty, unit: existingUnit }

  const factorA = TO_BASE[eu] ?? 1
  const factorB = TO_BASE[nu] ?? 1
  const totalBase = a * factorA + b * factorB

  const group = WEIGHT_UNITS.has(eu) ? WEIGHT_UNITS : VOLUME_UNITS
  const targetUnit = bestUnit(totalBase, group)
  const targetFactor = TO_BASE[targetUnit] ?? 1
  const result = Math.round((totalBase / targetFactor) * 100) / 100

  return { qty: String(result), unit: targetUnit }
}
