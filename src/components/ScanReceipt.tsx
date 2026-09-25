import { useState, useRef } from 'react'
import type { ScannedItem } from '../types'
import { scanReceipt } from '../lib/gemini'
import { addItemsFromReceipt } from '../store'
import { detectRayon, type Rayon } from '../rayons'

interface Props {
  listId: string
  onClose: () => void
  onItemsAdded: (count: number) => void
}

interface EditableItem {
  id: string
  name: string
  quantity: number | null
  unit: string | null
  rayon: Rayon
  selected: boolean
}

const RAYON_EMOJI: Record<Rayon, string> = {
  'Fruits & légumes': '🥕',
  'Viandes & poissons': '🍖',
  'Crèmerie & œufs': '🥛',
  'Boulangerie': '🥖',
  'Épicerie salée': '🧂',
  'Épicerie sucrée': '🍫',
  'Surgelés': '🧊',
  'Boissons': '🥤',
  'Hygiène & beauté': '🧴',
  'Entretien': '🧽',
  'Autre': '📦',
}

const ALLOWED_IMAGE_TYPES = new Set(['image/jpeg', 'image/png', 'image/webp', 'image/gif'])

type Step = 'capture' | 'preview' | 'results' | 'done'

export default function ScanReceipt({ listId, onClose, onItemsAdded }: Props) {
  const [step, setStep] = useState<Step>('capture')
  const [preview, setPreview] = useState<string | null>(null)
  const [error, setError] = useState('')
  const [analyzing, setAnalyzing] = useState(false)
  const [scannedItems, setScannedItems] = useState<EditableItem[]>([])
  const [editingId, setEditingId] = useState<string | null>(null)
  const [submitting, setSubmitting] = useState(false)
  const [addedCount, setAddedCount] = useState(0)
  const cameraRef = useRef<HTMLInputElement>(null)
  const galleryRef = useRef<HTMLInputElement>(null)

  const handleFile = (file: File) => {
    if (!file.type.startsWith('image/') || !ALLOWED_IMAGE_TYPES.has(file.type)) {
      setError('Format non accepté (jpeg, png, webp ou gif uniquement)')
      return
    }
    if (file.size > 10 * 1024 * 1024) {
      setError('Image trop lourde (max 10 Mo)')
      return
    }
    setError('')
    const reader = new FileReader()
    reader.onload = (e) => {
      setPreview(e.target?.result as string)
      setStep('preview')
    }
    reader.readAsDataURL(file)
  }

  const handleAnalyze = async () => {
    if (!preview) return
    setAnalyzing(true)
    setError('')
    try {
      const base64 = preview.split(',')[1]
      const mimeType = preview.split(';')[0].split(':')[1]
      const { items, error: scanError } = await scanReceipt(base64, mimeType)
      if (scanError || items.length === 0) {
        setError(scanError || 'Aucun article détecté — réessaie avec une photo plus nette')
        setStep('preview')
        return
      }
      setScannedItems(items.map((item, i) => ({
        id: `scan-${i}-${Date.now()}`,
        name: item.name,
        quantity: item.quantity,
        unit: item.unit,
        rayon: detectRayon(item.name),
        selected: true,
      })))
      setStep('results')
    } catch (e) {
      setError(e instanceof Error ? e.message : 'Erreur lors de l\'analyse')
      setStep('preview')
    } finally {
      setAnalyzing(false)
    }
  }

  const toggleSelected = (id: string) => {
    setScannedItems((prev) => prev.map((it) => it.id === id ? { ...it, selected: !it.selected } : it))
  }

  const renameItem = (id: string, name: string) => {
    setScannedItems((prev) => prev.map((it) => it.id === id ? { ...it, name, rayon: detectRayon(name) } : it))
  }

  const selectedCount = scannedItems.filter((it) => it.selected).length

  const handleConfirm = async () => {
    const selected = scannedItems.filter((it) => it.selected)
    if (selected.length === 0) return
    setSubmitting(true)
    try {
      const items: ScannedItem[] = selected.map((it) => ({ name: it.name, quantity: it.quantity, unit: it.unit }))
      await addItemsFromReceipt(listId, items)
      setAddedCount(selected.length)
      setStep('done')
      onItemsAdded(selected.length)
      setTimeout(onClose, 1400)
    } catch (e) {
      setError(e instanceof Error ? e.message : 'Erreur lors de l\'ajout')
    } finally {
      setSubmitting(false)
    }
  }

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="modal-card" onClick={(e) => e.stopPropagation()} style={{ maxHeight: '85vh', overflowY: 'auto' }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 12 }}>
          <h2 style={{ margin: 0, fontSize: '1.05rem' }}>🧾 Scanner un ticket</h2>
          <button className="btn-icon" onClick={onClose}>✕</button>
        </div>

        {step === 'capture' && (
          <>
            <p className="hint" style={{ marginBottom: 12 }}>
              Prends en photo ton ticket de caisse. Les articles détectés seront ajoutés à ta liste comme déjà achetés.
            </p>
            <div className="photo-buttons">
              <button className="photo-option" onClick={() => cameraRef.current?.click()}>
                <span className="photo-icon">📷</span>
                <span className="photo-label">Prendre une photo</span>
                <span className="photo-hint">Appareil photo</span>
              </button>
              <button className="photo-option" onClick={() => galleryRef.current?.click()}>
                <span className="photo-icon">🖼️</span>
                <span className="photo-label">Choisir depuis la galerie</span>
                <span className="photo-hint">Galerie / fichier</span>
              </button>
              <input
                ref={cameraRef}
                type="file"
                accept="image/*"
                capture="environment"
                style={{ display: 'none' }}
                onChange={(e) => e.target.files?.[0] && handleFile(e.target.files[0])}
              />
              <input
                ref={galleryRef}
                type="file"
                accept="image/*"
                style={{ display: 'none' }}
                onChange={(e) => e.target.files?.[0] && handleFile(e.target.files[0])}
              />
            </div>
            {error && <p className="error-msg">{error}</p>}
          </>
        )}

        {step === 'preview' && (
          <>
            <div className="photo-preview-wrap">
              <img src={preview!} alt="Ticket" className="photo-preview" />
              <button className="btn-outline small" onClick={() => { setPreview(null); setError(''); setStep('capture') }}>
                Changer la photo
              </button>
            </div>
            {error && <p className="error-msg">{error}</p>}
            {analyzing ? (
              <div className="loading-hint">
                <div className="spinner" />
                <p>Analyse en cours…</p>
              </div>
            ) : (
              <button className="btn-primary" onClick={handleAnalyze} style={{ width: '100%', marginTop: 12 }}>
                Analyser le ticket
              </button>
            )}
          </>
        )}

        {step === 'results' && (
          <>
            <p className="hint" style={{ marginBottom: 8 }}>{scannedItems.length} article{scannedItems.length > 1 ? 's' : ''} détecté{scannedItems.length > 1 ? 's' : ''} — décoche ce que tu ne veux pas ajouter.</p>
            <ul className="shopping-list">
              {scannedItems.map((item) => (
                <li key={item.id} className="shopping-item">
                  <span
                    className={`checkbox ${item.selected ? 'checked-box' : ''}`}
                    onClick={() => toggleSelected(item.id)}
                  >{item.selected ? '✓' : ''}</span>
                  <span className="item-text" style={{ display: 'flex', alignItems: 'center', gap: 6, flex: 1 }}>
                    <span title={item.rayon} style={{ fontSize: 16 }}>{RAYON_EMOJI[item.rayon]}</span>
                    {editingId === item.id ? (
                      <input
                        className="form-input"
                        autoFocus
                        value={item.name}
                        onChange={(e) => renameItem(item.id, e.target.value)}
                        onBlur={() => setEditingId(null)}
                        onKeyDown={(e) => { if (e.key === 'Enter') setEditingId(null) }}
                        style={{ flex: 1, padding: '4px 8px', fontSize: 14 }}
                      />
                    ) : (
                      <span className="item-name" onClick={() => setEditingId(item.id)} style={{ cursor: 'text' }}>
                        {item.name}
                      </span>
                    )}
                    {(item.quantity || item.unit) && (
                      <span className="item-qty" style={{ flexShrink: 0 }}>{item.quantity} {item.unit}</span>
                    )}
                  </span>
                </li>
              ))}
            </ul>
            {error && <p className="error-msg">{error}</p>}
            <button
              className="btn-primary"
              onClick={handleConfirm}
              disabled={selectedCount === 0 || submitting}
              style={{ width: '100%', marginTop: 12 }}
            >
              {submitting ? '…' : `Ajouter ${selectedCount} article${selectedCount > 1 ? 's' : ''} à la liste`}
            </button>
          </>
        )}

        {step === 'done' && (
          <div className="toast" style={{ position: 'static', transform: 'none', textAlign: 'center' }}>
            {addedCount} article{addedCount > 1 ? 's' : ''} ajouté{addedCount > 1 ? 's' : ''} comme déjà acheté{addedCount > 1 ? 's' : ''} ✓
          </div>
        )}
      </div>
    </div>
  )
}
