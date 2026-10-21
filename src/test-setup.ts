import { afterEach, vi } from 'vitest'
import { cleanup } from '@testing-library/react'

// jsdom n'implémente pas scrollTo : on le neutralise pour ne pas polluer la sortie des tests.
window.scrollTo = vi.fn() as unknown as typeof window.scrollTo

// Vitest n'enregistre pas le nettoyage de Testing Library tout seul (pas de globals) :
// on démonte les composants et on vide le stockage — où l'état de l'interface est
// conservé (voir lib/persistedState) — après chaque test pour qu'ils restent indépendants.
afterEach(() => {
  cleanup()
  sessionStorage.clear()
  localStorage.clear()
})
