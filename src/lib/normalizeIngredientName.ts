export function normalizeIngredientName(s: string): string {
  return s
    .toLowerCase()
    .normalize('NFD')
    .replace(/[̀-ͯ]/g, '')
    .replace(/['''‛]/g, "'")
    .replace(/\s+/g, ' ')
    .trim()
}
