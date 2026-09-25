/**
 * Rendu RTL avec les contextes de l'application.
 * Les tests qui utilisent ce wrapper doivent mocker '../lib/supabase'
 * pour éviter les appels réseau dans AuthProvider et HouseholdsProvider.
 */
import type { ReactNode } from 'react'
import { render, type RenderOptions } from '@testing-library/react'
import { AuthProvider } from './contexts/AuthContext'
import { HouseholdsProvider } from './hooks/useHouseholds'
import { ConfirmProvider } from './hooks/useConfirm'

function AllProviders({ children }: { children: ReactNode }) {
  return (
    <AuthProvider>
      <HouseholdsProvider>
        <ConfirmProvider>
          {children}
        </ConfirmProvider>
      </HouseholdsProvider>
    </AuthProvider>
  )
}

function customRender(ui: React.ReactElement, options?: Omit<RenderOptions, 'wrapper'>) {
  return render(ui, { wrapper: AllProviders, ...options })
}

export * from '@testing-library/react'
export { customRender as render }
