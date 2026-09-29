import { useState, useCallback, useRef, type ReactNode } from 'react'
import { createPortal } from 'react-dom'
import ConfirmModal from '../components/ConfirmModal'
import { ConfirmContext, type ConfirmOptions } from './confirm-context'

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

  return (
    <ConfirmContext.Provider value={{ confirm }}>
      {children}
      {createPortal(
        <ConfirmModal
          isOpen={state.isOpen}
          title={state.options.title}
          message={state.options.message}
          confirmLabel={state.options.confirmLabel}
          cancelLabel={state.options.cancelLabel}
          variant={state.options.variant}
          onConfirm={() => close(true)}
          onCancel={() => close(false)}
        />,
        document.body
      )}
    </ConfirmContext.Provider>
  )
}
