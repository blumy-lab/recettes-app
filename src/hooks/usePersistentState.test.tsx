import { describe, it, expect } from 'vitest'
import { renderHook, act } from '@testing-library/react'
import { usePersistentState } from './usePersistentState'

describe('usePersistentState', () => {
  it('utilise la valeur initiale quand rien n\'est sauvegardé', () => {
    const { result } = renderHook(() => usePersistentState('k', 'début'))
    expect(result.current[0]).toBe('début')
  })

  it('accepte une valeur initiale paresseuse', () => {
    const { result } = renderHook(() => usePersistentState('k', () => [1, 2]))
    expect(result.current[0]).toEqual([1, 2])
  })

  it('retrouve la valeur après un « rechargement » (démontage puis remontage)', () => {
    const first = renderHook(() => usePersistentState('recherche', ''))
    act(() => first.result.current[1]('poulet'))
    first.unmount()

    const second = renderHook(() => usePersistentState('recherche', ''))
    expect(second.result.current[0]).toBe('poulet')
  })

  it('fonctionne avec la forme fonctionnelle de setState', () => {
    const first = renderHook(() => usePersistentState<string[]>('tags', []))
    act(() => first.result.current[1](prev => [...prev, 'vegan']))
    act(() => first.result.current[1](prev => [...prev, 'sans-gluten']))
    first.unmount()

    const second = renderHook(() => usePersistentState<string[]>('tags', []))
    expect(second.result.current[0]).toEqual(['vegan', 'sans-gluten'])
  })

  it('retombe sur la valeur initiale si parse rejette la valeur sauvegardée', () => {
    localStorage.setItem('mr:v1:portions', JSON.stringify('pas un nombre'))
    const parseNumber = (raw: unknown) => (typeof raw === 'number' ? raw : undefined)
    const { result } = renderHook(() => usePersistentState('portions', 4, parseNumber))
    expect(result.current[0]).toBe(4)
  })

  it('deux clés différentes ne se mélangent pas', () => {
    const a = renderHook(() => usePersistentState('a', 'A'))
    const b = renderHook(() => usePersistentState('b', 'B'))
    act(() => a.result.current[1]('A2'))
    expect(b.result.current[0]).toBe('B')
    expect(localStorage.getItem('mr:v1:a')).toBe(JSON.stringify('A2'))
  })
})
