// Sauvegarde de l'état de l'interface dans sessionStorage : survit à une
// actualisation de la page (F5, tirer pour actualiser, rechargement
// automatique après une mise à jour de l'appli) mais pas à la fermeture
// de l'onglet. Le préfixe versionné permet d'invalider d'anciennes données
// si leur forme change.

const PREFIX = 'mr:v1:'

export function readPersisted<T>(key: string, parse?: (raw: unknown) => T | undefined): T | undefined {
  try {
    const raw = sessionStorage.getItem(PREFIX + key)
    if (raw === null) return undefined
    const value: unknown = JSON.parse(raw)
    return parse ? parse(value) : (value as T)
  } catch {
    // stockage indisponible (navigation privée stricte) ou JSON corrompu
    return undefined
  }
}

export function writePersisted(key: string, value: unknown): void {
  try {
    if (value === undefined) sessionStorage.removeItem(PREFIX + key)
    else sessionStorage.setItem(PREFIX + key, JSON.stringify(value))
  } catch {
    // stockage plein ou indisponible : l'appli continue sans persistance
  }
}

// Supprime toutes les clés qui commencent par `prefix` (tout si omis).
export function clearPersisted(prefix = ''): void {
  try {
    const full = PREFIX + prefix
    const toRemove: string[] = []
    for (let i = 0; i < sessionStorage.length; i++) {
      const k = sessionStorage.key(i)
      if (k && k.startsWith(full)) toRemove.push(k)
    }
    toRemove.forEach(k => sessionStorage.removeItem(k))
  } catch {
    // idem
  }
}
