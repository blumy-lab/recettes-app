import { createContext, useContext, useState, useCallback, useRef, createElement, type ReactNode } from 'react'
import { createPortal } from 'react-dom'
import ConfirmModal from '../components/ConfirmModal'

export interface ConfirmOptions {
  title: string
  message?: string
  confirmLabel?: string
  cancelLabel?: string
  variant?: 'danger' | 'default'
}

interface ConfirmContextType {
  confirm: (opts: ConfirmOptions) => Promise<boolean>
}

const ConfirmContext = createContext<ConfirmContextType | null>(null)

interface ModalState {
  isOpen: boolean
  options: ConfirmOptions
}

export function ConfirmProvider({ children }: { children: ReactNode }) {
  const [state, setState] = useState<ModalState>({ isOpen: false, options: { title: '' } })
  const resolveRef = useRef<((v: boolean) => void) | null>(null)

  const confirm = useCallback((options: ConfirmOptions): Promise<boolean> =>
    new Promise(resolve => {
      resolveRef.current = resolve
      setState({ isOpen: true, options })
    })
  , [])

  const close = (value: boolean) => {
    resolveRef.current?.(value)
    resolveRef.current = null
    setState(s => ({ ...s, isOpen: false }))
  }

  return createElement(
    ConfirmContext.Provider,
    { value: { confirm } },
    children,
    createPortal(
      createElement(ConfirmModal, {
        isOpen: state.isOpen,
        title: state.options.title,
        message: state.options.message,
        confirmLabel: state.options.confirmLabel,
        cancelLabel: state.options.cancelLabel,
        variant: state.options.variant,
        onConfirm: () => close(true),
        onCancel: () => close(false),
      }),
      document.body
    )
  )
}

export function useConfirm() {
  const ctx = useContext(ConfirmContext)
  if (!ctx) throw new Error('useConfirm must be used within ConfirmProvider')
  return ctx
}
