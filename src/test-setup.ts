import { afterEach } from 'vitest'
import { cleanup } from '@testing-library/react'

// Vitest n'enregistre pas le nettoyage de Testing Library tout seul (pas de globals) :
// on démonte les composants et on vide sessionStorage — où l'état de l'interface est
// conservé (voir lib/persistedState) — après chaque test pour qu'ils restent indépendants.
afterEach(() => {
  cleanup()
  sessionStorage.clear()
})
