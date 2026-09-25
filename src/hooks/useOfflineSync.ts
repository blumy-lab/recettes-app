import { useEffect, useCallback } from 'react'
import { getAll, dequeue, incrementRetry, type PendingMutation } from '../lib/offlineQueue'
import { updateShoppingItem, addShoppingItem, deleteShoppingItem } from '../store'
import { detectRayon } from '../rayons'

type SyncResult = { synced: number; failed: number }

async function applyMutation(m: PendingMutation): Promise<void> {
  switch (m.type) {
    case 'check':
      await updateShoppingItem(m.payload.itemId!, { checked: true })
      break
    case 'uncheck':
      await updateShoppingItem(m.payload.itemId!, { checked: false })
      break
    case 'add':
      if (m.payload.item && m.payload.listId) {
        const item = m.payload.item
        await addShoppingItem(
          {
            name: item.name!,
            quantity: item.quantity ?? '',
            unit: item.unit ?? '',
            checked: false,
            rayon: item.rayon ?? detectRayon(item.name!),
          },
          m.payload.listId,
        )
      }
      break
    case 'delete':
      await deleteShoppingItem(m.payload.itemId!)
      break
    case 'update_rayon':
      await updateShoppingItem(m.payload.itemId!, { rayon: m.payload.rayon })
      break
  }
}

export async function replayQueue(onProgress?: (synced: number, total: number) => void): Promise<SyncResult> {
  const mutations = await getAll()
  let synced = 0
  let failed = 0
  for (const m of mutations) {
    try {
      await applyMutation(m)
      await dequeue(m.id)
      synced++
      onProgress?.(synced, mutations.length)
    } catch {
      await incrementRetry(m.id)
      failed++
    }
  }
  return { synced, failed }
}

export function useOfflineSync(onSynced?: (result: SyncResult) => void) {
  const sync = useCallback(async () => {
    if (!navigator.onLine) return
    const result = await replayQueue()
    if (result.synced > 0 || result.failed > 0) {
      onSynced?.(result)
    }
  }, [onSynced])

  useEffect(() => {
    window.addEventListener('online', sync)
    return () => window.removeEventListener('online', sync)
  }, [sync])
}
