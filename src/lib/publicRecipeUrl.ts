const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i

export function isValidRecipeId(id: string): boolean {
  return UUID_RE.test(id)
}

export function buildPublicRecipeUrl(id: string, appUrl?: string): string | undefined {
  if (!isValidRecipeId(id)) return undefined
  const base = appUrl ?? (import.meta.env.VITE_APP_URL as string | undefined) ?? 'https://recettes.pharmaciepitondesgoyaves.re'
  return `${base}/share-recipe.php?id=${encodeURIComponent(id)}`
}
