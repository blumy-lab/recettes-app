/**
 * Détecte une durée dans un texte de recette français et la retourne en secondes.
 * Gère : "10 minutes", "1h30", "45 min", "2 heures", "1 h", "2-3 minutes" (borne basse).
 * Retourne null si aucune durée reconnue.
 */
export function parseStepDuration(text: string): number | null {
  const t = text.toLowerCase()

  // Heures + minutes adjacentes : "1h30", "1 h 30", "1 heure 30 min", "1heure30"
  const hmMatch = t.match(
    /(\d+)(?:-\d+)?\s*h(?:eure(?:s?)?)?\s*(\d+)(?:-\d+)?\s*(?:min(?:ute(?:s?)?)?)?/
  )
  if (hmMatch) {
    return (parseInt(hmMatch[1]) * 60 + parseInt(hmMatch[2])) * 60
  }

  // Heures seules : "2 heures", "1 h", "1 heure"
  const hMatch = t.match(/(\d+)(?:-\d+)?\s*h(?:eure(?:s?)?)?\b/)
  if (hMatch) {
    return parseInt(hMatch[1]) * 3600
  }

  // Minutes seules : "45 min", "10 minutes"
  const mMatch = t.match(/(\d+)(?:-\d+)?\s*min(?:ute(?:s?)?)?/)
  if (mMatch) {
    return parseInt(mMatch[1]) * 60
  }

  return null
}
