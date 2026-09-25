import { useState, useEffect, useCallback } from 'react'
import { scrapeRecipe } from '../scraper'
import { saveRecipe } from '../store'
import { extractRecipeFromText } from '../lib/gemini'
import type { Recipe } from '../types'

interface Props {
  onBack: () => void
  onSuccess: (recipe: Recipe) => void
  onImportPhoto: () => void
}

// Sites with confirmed JSON-LD Recipe support
const KNOWN_SITES: { domain: string; name: string; emoji: string; blocked?: boolean }[] = [
  { domain: 'marmiton.org', name: 'Marmiton', emoji: '✅' },
  { domain: '750g.com', name: '750g', emoji: '⚠️', blocked: true },
  { domain: 'cuisineaz.com', name: 'CuisineAZ', emoji: '✅' },
  { domain: 'allrecipes.com', name: 'Allrecipes', emoji: '✅' },
  { domain: 'maangchi.com', name: 'Maangchi', emoji: '✅' },
  { domain: 'thespruceeats.com', name: 'The Spruce Eats', emoji: '✅' },
  { domain: 'simplyrecipes.com', name: 'Simply Recipes', emoji: '✅' },
  { domain: 'seriouseats.com', name: 'Serious Eats', emoji: '✅' },
  { domain: 'delicious.fr', name: 'Délicious', emoji: '✅' },
  { domain: 'aufeminin.com', name: 'aufeminin', emoji: '✅' },
  { domain: 'ptitchef.com', name: 'Ptitchef', emoji: '✅' },
  { domain: 'cuisine.journaldesfemmes.fr', name: 'Journal des Femmes', emoji: '✅' },
]

function detectSite(url: string): { name: string; emoji: string; known: boolean; blocked?: boolean } | null {
  try {
    const hostname = new URL(url).hostname.replace('www.', '')
    const match = KNOWN_SITES.find((s) => hostname.includes(s.domain))
    if (match) return { name: match.name, emoji: match.emoji, known: true, blocked: match.blocked }
    if (hostname) return { name: hostname, emoji: '⚠️', known: false }
  } catch {}
  return null
}

type Tab = 'url' | 'clipboard' | 'photo'

export default function ImportRecipe({ onBack, onSuccess, onImportPhoto }: Props) {
  const [tab, setTab] = useState<Tab>('clipboard')
  const [url, setUrl] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [site, setSite] = useState<{ name: string; emoji: string; known: boolean; blocked?: boolean } | null>(null)
  const [clipText, setClipText] = useState('')
  const [clipPasted, setClipPasted] = useState(false)

  useEffect(() => {
    const shared = sessionStorage.getItem('shared_url')
    if (shared) {
      sessionStorage.removeItem('shared_url')
      setTab('url')
      setUrl(shared)
      setSite(detectSite(shared))
      handleImportUrl(shared)
    }
  }, [])

  const handleUrlChange = (val: string) => {
    setUrl(val)
    setError('')
    setSite(val.trim() ? detectSite(val.trim()) : null)
  }

  const handleImportUrl = useCallback(async (targetUrl: string) => {
    const u = targetUrl.trim()
    if (!u) return
    setLoading(true)
    setError('')
    try {
      const recipe = await scrapeRecipe(u)
      await saveRecipe(recipe)
      onSuccess(recipe)
    } catch (e) {
      setError(e instanceof Error ? e.message : 'Erreur inconnue')
    } finally {
      setLoading(false)
    }
  }, [onSuccess])

  const handlePasteClipboard = async () => {
    try {
      const text = await navigator.clipboard.readText()
      setClipText(text)
      setClipPasted(true)
      setError('')
    } catch {
      setError('Impossible de lire le presse-papier. Collez le texte manuellement.')
    }
  }

  const handleImportClipboard = async () => {
    if (!clipText.trim()) return
    setLoading(true)
    setError('')
    try {
      const recipe = await extractRecipeFromText(clipText)
      await saveRecipe(recipe)
      onSuccess(recipe)
    } catch (e) {
      setError(e instanceof Error ? e.message : 'Erreur inconnue')
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="page">
      <header className="page-header">
        <button className="btn-icon" onClick={onBack}>←</button>
        <h1>Importer une recette</h1>
      </header>

      <div className="import-content">
        {/* Onglets */}
        <div className="import-tabs">
          <button className={`import-tab ${tab === 'clipboard' ? 'active' : ''}`} onClick={() => { setTab('clipboard'); setError('') }}>
            📋 Presse-papier
          </button>
          <button className={`import-tab ${tab === 'photo' ? 'active' : ''}`} onClick={() => { setTab('photo'); onImportPhoto() }}>
            📷 Photo
          </button>
          <button className={`import-tab ${tab === 'url' ? 'active' : ''}`} onClick={() => { setTab('url'); setError('') }}>
            🔗 URL
          </button>
        </div>

        {/* Onglet Presse-papier */}
        {tab === 'clipboard' && (
          <div className="tab-content">
            <p className="hint">
              Copiez le texte d'une recette (depuis Claude, une page web, un PDF…) puis collez-le ici. Gemini extrait automatiquement les ingrédients et les étapes.
            </p>

            {!clipPasted ? (
              <button className="btn-paste" onClick={handlePasteClipboard}>
                📋 Coller depuis le presse-papier
              </button>
            ) : (
              <div className="clip-preview">
                <div className="clip-preview-header">
                  <span className="clip-ok">✓ Texte collé ({clipText.length} caractères)</span>
                  <button className="btn-link" onClick={() => { setClipText(''); setClipPasted(false); setError('') }}>
                    Effacer
                  </button>
                </div>
                <p className="clip-excerpt">{clipText.slice(0, 200)}{clipText.length > 200 ? '…' : ''}</p>
              </div>
            )}

            <p className="hint" style={{ marginTop: 8 }}>
              Ou collez directement dans la zone ci-dessous :
            </p>
            <textarea
              className="clip-textarea"
              placeholder="Collez ici le texte de la recette…"
              value={clipText}
              onChange={(e) => { setClipText(e.target.value); setClipPasted(e.target.value.length > 0); setError('') }}
              rows={6}
            />

            {error && <p className="error-msg">{error}</p>}

            {loading ? (
              <div className="loading-hint">
                <div className="spinner" />
                <p>Analyse du texte en cours…</p>
              </div>
            ) : (
              <button
                className="btn-primary"
                onClick={handleImportClipboard}
                disabled={!clipText.trim()}
              >
                ✨ Extraire la recette
              </button>
            )}
          </div>
        )}

        {/* Onglet URL */}
        {tab === 'url' && (
          <div className="tab-content">
            <p className="hint">
              Colle l'URL d'une page de recette. Sur Android, tu peux aussi partager
              directement depuis ton navigateur.
            </p>

            <div className="input-row">
              <input
                type="url"
                placeholder="https://www.marmiton.org/..."
                value={url}
                onChange={(e) => handleUrlChange(e.target.value)}
                onKeyDown={(e) => e.key === 'Enter' && handleImportUrl(url)}
                disabled={loading}
              />
            </div>

            {site && (
              <div className={`site-badge ${site.known && !site.blocked ? 'compatible' : 'unknown'}`}>
                <span>{site.emoji}</span>
                <div>
                  <strong>{site.name}</strong>
                  <p>
                    {site.blocked
                      ? 'Ce site bloque l\'import automatique — utilisez l\'import photo'
                      : site.known
                      ? 'Site compatible — extraction automatique'
                      : 'Site inconnu — le résultat peut varier'}
                  </p>
                </div>
              </div>
            )}

            {!site && (
              <div className="compatible-sites">
                <p className="compatible-title">Sites compatibles</p>
                <div className="compatible-list">
                  {KNOWN_SITES.slice(0, 6).map((s) => (
                    <span key={s.domain} className="compatible-chip">{s.name}</span>
                  ))}
                </div>
              </div>
            )}

            {error && (
              <div className="error-block">
                <p className="error-msg">{error}</p>
                <button className="btn-secondary" onClick={onImportPhoto}>
                  📷 Essayer l'import depuis une photo
                </button>
              </div>
            )}

            {loading ? (
              <div className="loading-hint">
                <div className="spinner" />
                <p>Extraction des ingrédients en cours…</p>
              </div>
            ) : (
              <button
                className="btn-primary"
                onClick={() => handleImportUrl(url)}
                disabled={!url.trim()}
              >
                Importer la recette
              </button>
            )}
          </div>
        )}
      </div>
    </div>
  )
}
