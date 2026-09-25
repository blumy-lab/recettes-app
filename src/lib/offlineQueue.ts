import { openDB, type IDBPDatabase } from 'idb'
import type { ShoppingItem } from '../types'

export interface PendingMutation {
  id: string
  type: 'check' | 'uncheck' | 'add' | 'delete' | 'update_rayon'
  payload: {
    itemId?: string
    listId?: string
    item?: Partial<ShoppingItem>
    rayon?: string
  }
  createdAt: number
  retries: number
}

const DB_NAME = 'recettes-offline'
const STORE = 'mutations'
const MAX_RETRIES = 5

let db: IDBPDatabase | null = null

async function getDb() {
  if (!db) {
    db = await openDB(DB_NAME, 1, {
      upgrade(database) {
        if (!database.objectStoreNames.contains(STORE)) {
          database.createObjectStore(STORE, { keyPath: 'id' })
        }
      },
    })
  }
  return db
}

export async function enqueue(mutation: Omit<PendingMutation, 'id' | 'createdAt' | 'retries'>): Promise<string> {
  const db = await getDb()
  const id = `${Date.now()}-${Math.random().toString(36).slice(2)}`
  const entry: PendingMutation = { ...mutation, id, createdAt: Date.now(), retries: 0 }
  await db.put(STORE, entry)
  return id
}

export async function dequeue(id: string): Promise<void> {
  const db = await getDb()
  await db.delete(STORE, id)
}

export async function getAll(): Promise<PendingMutation[]> {
  const db = await getDb()
  const all = await db.getAll(STORE)
  return all.sort((a, b) => a.createdAt - b.createdAt)
}

export async function incrementRetry(id: string): Promise<void> {
  const db = await getDb()
  const entry = await db.get(STORE, id) as PendingMutation | undefined
  if (!entry) return
  if (entry.retries + 1 > MAX_RETRIES) {
    await db.delete(STORE, id)
  } else {
    await db.put(STORE, { ...entry, retries: entry.retries + 1 })
  }
}

export async function getPendingCount(): Promise<number> {
  const db = await getDb()
  return db.count(STORE)
}
