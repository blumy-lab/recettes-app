// Sauvegarde de l'état de l'interface dans localStorage : survit à une
// actualisation de la page et à la fermeture puis réouverture de l'appli (on
// retombe là où on s'était arrêté) tant que la dernière activité date de moins
// d'un certain délai (voir expireStalePersisted). Effacé à la déconnexion. Le préfixe
// versionné permet d'invalider d'anciennes données si leur forme change.

const PREFIX = 'mr:v1:'
const SAVED_AT_KEY = PREFIX + 'saved_at'

export function readPersisted<T>(key: string, parse?: (raw: unknown) => T | undefined): T | undefined {
  try {
    const raw = localStorage.getItem(PREFIX + key)
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
    if (value === undefined) localStorage.removeItem(PREFIX + key)
    else localStorage.setItem(PREFIX + key, JSON.stringify(value))
    localStorage.setItem(SAVED_AT_KEY, String(Date.now()))
  } catch {
    // stockage plein ou indisponible : l'appli continue sans persistance
  }
}

// Supprime toutes les clés qui commencent par `prefix` (tout si omis).
export function clearPersisted(prefix = ''): void {
  try {
    const full = PREFIX + prefix
    const toRemove: string[] = []
    for (let i = 0; i < localStorage.length; i++) {
      const k = localStorage.key(i)
      if (k && k.startsWith(full)) toRemove.push(k)
    }
    toRemove.forEach(k => localStorage.removeItem(k))
  } catch {
    // idem
  }
}

// À appeler une fois au démarrage : si rien n'a été enregistré depuis plus de
// maxAgeMs, l'ancien état (page, brouillons) est oublié plutôt que restauré.
export function expireStalePersisted(maxAgeMs: number, now = Date.now()): void {
  try {
    const savedAt = Number(localStorage.getItem(SAVED_AT_KEY))
    if (savedAt && now - savedAt > maxAgeMs) clearPersisted()
  } catch {
    // stockage indisponible : rien à oublier
  }
}
