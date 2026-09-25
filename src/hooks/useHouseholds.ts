import { createContext, useContext, useState, useEffect, useCallback, type ReactNode, createElement } from 'react'
import type { Household } from '../types'
import { supabase } from '../lib/supabase'

const PALETTE = ['#f97316', '#3b82f6', '#10b981', '#8b5cf6', '#ef4444', '#f59e0b', '#06b6d4', '#ec4899']

const APP_URL = import.meta.env.VITE_APP_URL as string

interface HouseholdsContextType {
  households: Household[]
  isLoading: boolean
  createHousehold: (name: string) => Promise<Household>
  joinHousehold: (code: string) => Promise<Household>
  leaveHousehold: (householdId: string) => Promise<void>
  removeMember: (householdId: string, userId: string) => Promise<void>
  renameHousehold: (householdId: string, name: string) => Promise<void>
  regenerateCode: (householdId: string) => Promise<string>
  deleteHousehold: (householdId: string) => Promise<void>
  getHouseholdColor: (householdId: string) => string
  shareCode: (household: Household) => Promise<void>
  reload: () => Promise<void>
}

const HouseholdsContext = createContext<HouseholdsContextType | null>(null)

export function useHouseholds(): HouseholdsContextType {
  const ctx = useContext(HouseholdsContext)
  if (!ctx) throw new Error('useHouseholds must be used within HouseholdsProvider')
  return ctx
}

async function fetchHouseholds(_userId: string): Promise<Household[]> {
  const { data, error } = await supabase.rpc('get_my_households')
  if (error) throw new Error(error.message)

  const rows = (data || []) as Array<{
    household_id: string; household_name: string; invite_code: string
    color: string; created_by: string; my_role: string
    member_user_id: string | null; member_role: string | null
  }>

  // Fetch profiles for all members
  const allUserIds = Array.from(new Set(rows.map(r => r.member_user_id).filter(Boolean) as string[]))
  const profileMap: Record<string, { pseudo: string; avatar_url: string | null }> = {}
  if (allUserIds.length > 0) {
    const { data: profiles } = await supabase
      .from('profiles')
      .select('user_id, display_name, avatar_url')
      .in('user_id', allUserIds)
    for (const p of profiles || []) {
      const pr = p as Record<string, unknown>
      profileMap[pr.user_id as string] = {
        pseudo: (pr.display_name as string) || 'Membre',
        avatar_url: (pr.avatar_url as string) || null,
      }
    }
  }

  // Aggregate rows by household_id
  const householdMap = new Map<string, Household>()
  for (const row of rows) {
    if (!householdMap.has(row.household_id)) {
      householdMap.set(row.household_id, {
        id: row.household_id,
        name: row.household_name,
        invite_code: row.invite_code || '',
        color: row.color,
        created_by: row.created_by,
        role: row.my_role as 'owner' | 'member',
        members: [],
      })
    }
    if (row.member_user_id) {
      const h = householdMap.get(row.household_id)!
      if (!h.members.find(m => m.user_id === row.member_user_id)) {
        h.members.push({
          user_id: row.member_user_id,
          pseudo: profileMap[row.member_user_id]?.pseudo || 'Membre',
          avatar_url: profileMap[row.member_user_id]?.avatar_url || null,
          role: row.member_role as 'owner' | 'member',
        })
      }
    }
  }

  return Array.from(householdMap.values())
}

interface ProviderProps { children: ReactNode }

export function HouseholdsProvider({ children }: ProviderProps) {
  const [households, setHouseholds] = useState<Household[]>([])
  const [isLoading, setIsLoading] = useState(true)

  const reload = useCallback(async () => {
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) { setHouseholds([]); setIsLoading(false); return }
    try {
      const result = await fetchHouseholds(user.id)
      setHouseholds(result)
    } catch (e) {
      console.error('[useHouseholds] fetchHouseholds error:', e)
      setHouseholds([])
    } finally {
      setIsLoading(false)
    }
  }, [])

  useEffect(() => {
    reload()
    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
      if (session?.user) reload()
      else { setHouseholds([]); setIsLoading(false) }
    })
    return () => subscription.unsubscribe()
  }, [reload])

  const getHouseholdColor = useCallback((householdId: string): string => {
    return households.find(h => h.id === householdId)?.color || '#94a3b8'
  }, [households])

  const pickNextColor = useCallback((): string => {
    const usedColors = new Set(households.map(h => h.color))
    return PALETTE.find(c => !usedColors.has(c)) || PALETTE[households.length % PALETTE.length]
  }, [households])

  const createHousehold = useCallback(async (name: string): Promise<Household> => {
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) throw new Error('Non connecté')
    const color = pickNextColor()
    const { data, error } = await supabase.rpc('create_household', { p_name: name, p_color: color })
    if (error) throw new Error(error.message)
    await reload()
    return households.find(h => h.id === data) || { id: data as string, name, invite_code: '', color, created_by: user.id, role: 'owner', members: [] }
  }, [households, pickNextColor, reload])

  const joinHousehold = useCallback(async (code: string): Promise<Household> => {
    const { data, error } = await supabase.rpc('join_household_by_code', { p_code: code })
    if (error) throw new Error(error.message)
    await reload()
    const h = households.find(x => x.id === data)
    if (!h) throw new Error('Foyer introuvable')
    return h
  }, [households, reload])

  const leaveHousehold = useCallback(async (householdId: string): Promise<void> => {
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) throw new Error('Non connecté')
    const { error } = await supabase.from('household_members')
      .delete().eq('household_id', householdId).eq('user_id', user.id)
    if (error) throw new Error(error.message)
    await reload()
  }, [reload])

  const removeMember = useCallback(async (householdId: string, memberId: string): Promise<void> => {
    const { error } = await supabase.from('household_members')
      .delete().eq('household_id', householdId).eq('user_id', memberId)
    if (error) throw new Error(error.message)
    await reload()
  }, [reload])

  const renameHousehold = useCallback(async (householdId: string, name: string): Promise<void> => {
    const { error } = await supabase.from('households').update({ name }).eq('id', householdId)
    if (error) throw new Error(error.message)
    await reload()
  }, [reload])

  const regenerateCode = useCallback(async (householdId: string): Promise<string> => {
    const { data, error } = await supabase.rpc('regenerate_invite_code', { p_household_id: householdId })
    if (error) throw new Error(error.message)
    await reload()
    return data as string
  }, [reload])

  const deleteHousehold = useCallback(async (householdId: string): Promise<void> => {
    const { error } = await supabase.from('households').delete().eq('id', householdId)
    if (error) throw new Error(error.message)
    await reload()
  }, [reload])

  const shareCode = useCallback(async (household: Household): Promise<void> => {
    const text = `Utilise le code ${household.invite_code} pour rejoindre ${household.name}.`
    if (navigator.share) {
      await navigator.share({ title: 'Rejoins notre foyer sur Mes Recettes', text, url: APP_URL })
    } else {
      await navigator.clipboard.writeText(`${text}\n${APP_URL}`)
    }
  }, [])

  const value: HouseholdsContextType = {
    households, isLoading,
    createHousehold, joinHousehold, leaveHousehold, removeMember,
    renameHousehold, regenerateCode, deleteHousehold,
    getHouseholdColor, shareCode, reload,
  }

  return createElement(HouseholdsContext.Provider, { value }, children)
}
