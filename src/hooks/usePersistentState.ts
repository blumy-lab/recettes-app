import { useState, useEffect, type Dispatch, type SetStateAction } from 'react'
import { readPersisted, writePersisted } from '../lib/persistedState'

// Comme useState, mais la valeur est sauvegardée dans localStorage et
// restaurée au montage (donc après une actualisation de la page).
// - `key` doit rester stable pendant la vie du composant.
// - `parse` valide/convertit la valeur relue ; renvoyer undefined la rejette
//   et on retombe sur `initial` (utile si la forme des données a changé).
export function usePersistentState<T>(
  key: string,
  initial: T | (() => T),
  parse?: (raw: unknown) => T | undefined,
): [T, Dispatch<SetStateAction<T>>] {
  const [state, setState] = useState<T>(() => {
    const stored = readPersisted<T>(key, parse)
    if (stored !== undefined) return stored
    return initial instanceof Function ? initial() : initial
  })

  useEffect(() => {
    writePersisted(key, state)
  }, [key, state])

  return [state, setState]
}
