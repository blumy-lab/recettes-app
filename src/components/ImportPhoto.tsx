import { useState, useRef } from 'react'
import { extractRecipeFromImage } from '../lib/gemini'
import { saveRecipe } from '../store'
import type { Recipe } from '../types'

interface Props {
  onBack: () => void
  onSuccess: (recipe: Recipe) => void
}

export default function ImportPhoto({ onBack, onSuccess }: Props) {
  const [preview, setPreview] = useState<string | null>(null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const fileRef = useRef<HTMLInputElement>(null)
  const cameraRef = useRef<HTMLInputElement>(null)

  const handleFile = (file: File) => {
    if (!file.type.startsWith('image/')) {
      setError('Veuillez sélectionner une image.')
      return
    }
    const reader = new FileReader()
    reader.onload = (e) => setPreview(e.target?.result as string)
    reader.readAsDataURL(file)
    setError('')
  }

  const handleAnalyze = async () => {
    if (!preview) return
    setLoading(true)
    setError('')
    try {
      const base64 = preview.split(',')[1]
      const mimeType = preview.split(';')[0].split(':')[1]
      const recipe = await extractRecipeFromImage(base64, mimeType)
      await saveRecipe(recipe)
      onSuccess(recipe)
    } catch (e) {
      setError(e instanceof Error ? e.message : 'Erreur lors de l\'analyse')
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="page">
      <header className="page-header">
        <button className="btn-icon" onClick={onBack}>←</button>
        <h1>Importer depuis photo</h1>
      </header>

      <div className="import-content">
        <p className="hint">
          Prends en photo une page de livre de cuisine ou d'un magazine. Gemini AI extrait automatiquement la recette.
        </p>

        {!preview ? (
          <div className="photo-buttons">
            <button className="photo-option" onClick={() => cameraRef.current?.click()}>
              <span className="photo-icon">📷</span>
              <span className="photo-label">Prendre une photo</span>
              <span className="photo-hint">Appareil photo</span>
            </button>
            <button className="photo-option" onClick={() => fileRef.current?.click()}>
              <span className="photo-icon">🖼️</span>
              <span className="photo-label">Choisir une image</span>
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
              ref={fileRef}
              type="file"
              accept="image/*"
              style={{ display: 'none' }}
              onChange={(e) => e.target.files?.[0] && handleFile(e.target.files[0])}
            />
          </div>
        ) : (
          <div className="photo-preview-wrap">
            <img src={preview} alt="Aperçu" className="photo-preview" />
            <button className="btn-outline small" onClick={() => { setPreview(null); setError('') }}>
              Changer la photo
            </button>
          </div>
        )}

        {error && <p className="error-msg">{error}</p>}

        {preview && (
          loading ? (
            <div className="loading-hint">
              <div className="spinner" />
              <p>Analyse en cours…</p>
              <p className="hint">Gemini lit votre recette, cela prend quelques secondes</p>
            </div>
          ) : (
            <button className="btn-primary" onClick={handleAnalyze}>
              ✨ Extraire la recette
            </button>
          )
        )}

        <div className="photo-info">
          <p>💡 <strong>Conseils pour une bonne extraction :</strong></p>
          <ul>
            <li>Photo nette et bien éclairée</li>
            <li>Texte lisible, sans reflets</li>
            <li>Inclure titre + ingrédients + étapes</li>
          </ul>
        </div>
      </div>
    </div>
  )
}
