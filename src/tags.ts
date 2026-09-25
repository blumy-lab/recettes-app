export interface TagDef {
  id: string
  label: string
  emoji: string
  group: 'regime' | 'allergene' | 'sante' | 'repas' | 'local'
}

export const TAG_DEFS: TagDef[] = [
  // Type de repas
  { id: 'petit-dejeuner', label: 'Petit-déjeuner', emoji: '🌅', group: 'repas' },
  { id: 'entree',         label: 'Entrée',          emoji: '🥗', group: 'repas' },
  { id: 'plat',           label: 'Plat',            emoji: '🍽️', group: 'repas' },
  { id: 'dessert',        label: 'Dessert',         emoji: '🍰', group: 'repas' },
  { id: 'snack',          label: 'Snack',           emoji: '🥨', group: 'repas' },
  { id: 'soupe',          label: 'Soupe',           emoji: '🥣', group: 'repas' },
  { id: 'boisson',        label: 'Boisson',         emoji: '🥤', group: 'repas' },
  // Régimes identitaires
  { id: 'vegetarien',     label: 'Végétarien',      emoji: '🥦', group: 'regime' },
  { id: 'vegan',          label: 'Vegan',           emoji: '🌱', group: 'regime' },
  { id: 'sans-porc',      label: 'Sans porc',       emoji: '🚫🐷', group: 'regime' },
  { id: 'sans-alcool',    label: 'Sans alcool',     emoji: '🍵', group: 'regime' },
  { id: 'pescetarien',    label: 'Pescétarien',     emoji: '🐟', group: 'regime' },
  // Allergènes
  { id: 'sans-gluten',    label: 'Sans gluten',     emoji: '🌾', group: 'allergene' },
  { id: 'sans-lactose',   label: 'Sans lactose',    emoji: '🥛', group: 'allergene' },
  { id: 'sans-oeufs',     label: 'Sans œufs',       emoji: '🥚', group: 'allergene' },
  { id: 'sans-fruits-a-coque', label: 'Sans fruits à coque', emoji: '🌰', group: 'allergene' },
  { id: 'sans-arachides', label: 'Sans arachides',  emoji: '🥜', group: 'allergene' },
  // Santé
  { id: 'ig-bas',               label: 'IG bas',             emoji: '📉', group: 'sante' },
  { id: 'sans-sel',             label: 'Sans sel',           emoji: '🧂', group: 'sante' },
  { id: 'faible-cholesterol',   label: 'Faible cholestérol', emoji: '❤️', group: 'sante' },
  { id: 'riche-proteines',      label: 'Riche en protéines', emoji: '💪', group: 'sante' },
  { id: 'riche-fibres',         label: 'Riche en fibres',    emoji: '🌿', group: 'sante' },
  // Local
  { id: 'local-reunion', label: 'Local Réunion', emoji: '🌺', group: 'local' },
]

export const TAG_GROUPS: { id: TagDef['group']; label: string }[] = [
  { id: 'repas',    label: 'Type de repas' },
  { id: 'regime',   label: 'Régime alimentaire' },
  { id: 'allergene', label: 'Allergènes' },
  { id: 'sante',    label: 'Objectifs santé' },
  { id: 'local',    label: 'Origine' },
]

export function getTagDef(id: string): TagDef | undefined {
  return TAG_DEFS.find((t) => t.id === id)
}

// Chips rapides pour les barres de filtre (sous-ensemble)
export const FILTER_CHIPS: string[] = [
  'petit-dejeuner', 'entree', 'plat', 'dessert', 'snack', 'soupe',
  'vegetarien', 'vegan', 'sans-porc', 'sans-gluten', 'sans-lactose',
  'ig-bas', 'sans-sel', 'faible-cholesterol',
]
