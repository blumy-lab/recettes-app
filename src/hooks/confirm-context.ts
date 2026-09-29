import { createContext } from 'react'

export interface ConfirmOptions {
  title: string
  message?: string
  confirmLabel?: string
  cancelLabel?: string
  variant?: 'danger' | 'default'
}

export interface ConfirmContextType {
  confirm: (opts: ConfirmOptions) => Promise<boolean>
}

export const ConfirmContext = createContext<ConfirmContextType | null>(null)
