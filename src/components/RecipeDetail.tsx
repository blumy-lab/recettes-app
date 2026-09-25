import { useState, useEffect, useRef } from 'react'
import type { Recipe } from '../types'
import { addIngredientsToShoppingList, deleteRecipe, saveRecipeNotes, publishRecipe, toggleFavorite, reportRecipe, savePublicRecipe, uploadRecipePhoto } from '../store'
import { useConfirm } from '../hooks/useConfirm'
import { moderateRecipe, estimateNutrition, type NutritionEstimate } from '../lib/gemini'
import { supabase } from '../lib/supabase'
import { getTagDef } from '../tags'
import CookingMode from './CookingMode'
import { printRecipe } from '../lib/printRecipe'

interface Props {
  recipe: Recipe
  onBack: () => void
  onEdit: () => void
  onRefresh: () => void
  isPublicView?: boolean
  onSaved?: () => void
}

function scaleQty(qty: string, ratio: number): string {
  if (!qty) return ''
  const num = parseFloat(qty.replace(',', '.'))
  if (isNaN(num)) return qty
  const result = num * ratio
  if (Math.abs(result - Math.round(result)) < 0.01) return String(Math.round(result))
  return String(Math.round(result * 10) / 10)
}

export default function RecipeDetail({ recipe, onBack, onEdit, onRefresh, isPublicView = false, onSaved }: Props) {
  const { confirm } = useConfirm()
  const [servings, setServings] = useState(recipe.servings || 4)
  const [adding, setAdding] = useState(false)
  const [notes, setNotes] = useState(recipe.user_notes || '')
  const [notesDirty, setNotesDirty] = useState(false)
  const [savingNotes, setSavingNotes] = useState(false)
  const [showNotes, setShowNotes] = useState(false)
  const [publishing, setPublishing] = useState(false)
  const [isPublic, setIsPublic] = useState(recipe.is_public || false)
  const [moderationStatus, setModerationStatus] = useState(recipe.moderation_status || 'private')
  const [isFavorite, setIsFavorite] = useState(recipe.is_favorite || false)
  const [showReport, setShowReport] = useState(false)
  const [reportReason, setReportReason] = useState('')
  const [reportSent, setReportSent] = useState(false)
  const [currentUserId, setCurrentUserId] = useState<string | null>(null)
  const [saving, setSaving] = useState(false)
  const [saved, setSaved] = useState(false)
  const [cookingMode, setCookingMode] = useState(false)
  const [photoUrl, setPhotoUrl] = useState<string | null>(recipe.user_photo_url || null)
  const [photoUploading, setPhotoUploading] = useState(false)
  const photoInputRef = useRef<HTMLInputElement>(null)
  const publishingRef = useRef(false)
  const [nutrition, setNutrition] = useState<NutritionEstimate | null>(null)
  const [nutritionBase, setNutritionBase] = useState<number>(recipe.servings || 4)
  const [estimating, setEstimating] = useState(false)
  const base = recipe.servings || 4
  const ratio = servings / base

  useEffect(() => {
    supabase.auth.getUser().then(({ data: { user } }) => {
      if (user) setCurrentUserId(user.id)
    })

  }, [])

  const isOwner = recipe.user_id === currentUserId
  const canDelete = isOwner

  const handleAddToShopping = async () => {
    setAdding(true)
    try {
      const scaled = {
        ...recipe,
        servings,
        ingredients: recipe.ingredients.map((ing) => ({
          ...ing,
          quantity: scaleQty(ing.quantity, ratio),
        })),
      }
      await addIngredientsToShoppingList(scaled)
      await confirm({ title: `${recipe.ingredients.length} ingrédients ajoutés à la liste de courses !` })
    } catch (e) {
      await confirm({ title: 'Erreur lors de l\'ajout', message: e instanceof Error ? e.message : JSON.stringify(e) })
    } finally {
      setAdding(false)
    }
  }

  const handleDelete = async () => {
    if (!await confirm({ title: 'Supprimer cette recette ?', confirmLabel: 'Supprimer', cancelLabel: 'Annuler', variant: 'danger' })) return
    await deleteRecipe(recipe.id)
    onRefresh()
    onBack()
  }

  const ALLOWED_IMAGE_TYPES = new Set(['image/jpeg', 'image/png', 'image/webp', 'image/gif'])

  const handleSaveNotes = async () => {
    setSavingNotes(true)
    try {
      await saveRecipeNotes(recipe.id, notes)
      setNotesDirty(false)
    } finally {
      setSavingNotes(false)
    }
  }

  const handlePhotoChange = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0]
    if (!file) return
    if (!file.type.startsWith('image/') || !ALLOWED_IMAGE_TYPES.has(file.type)) {
      await confirm({ title: 'Format non accepté (jpeg, png, webp ou gif uniquement)' })
      if (photoInputRef.current) photoInputRef.current.value = ''
      return
    }
    if (file.size > 5 * 1024 * 1024) {
      await confirm({ title: 'Image trop lourde (max 5 Mo)' })
      if (photoInputRef.current) photoInputRef.current.value = ''
      return
    }
    setPhotoUploading(true)
    try {
      const url = await uploadRecipePhoto(recipe.id, file)
      await saveRecipeNotes(recipe.id, notes, url)
      setPhotoUrl(url)
      onRefresh()
    } catch (e) {
      await confirm({ title: 'Erreur upload', message: e instanceof Error ? e.message : 'Erreur inconnue' })
    } finally {
      setPhotoUploading(false)
      if (photoInputRef.current) photoInputRef.current.value = ''
    }
  }

  const handleDeletePhoto = async () => {
    if (!await confirm({ title: 'Supprimer la photo ?', confirmLabel: 'Supprimer', cancelLabel: 'Annuler', variant: 'danger' })) return
    await saveRecipeNotes(recipe.id, notes, '')
    setPhotoUrl(null)
    onRefresh()
  }

  const handlePublish = async () => {
    if (publishingRef.current) return
    publishingRef.current = true
    setPublishing(true)
    try {
      if (isPublic) {
        await publishRecipe(recipe.id, 'private')
        setIsPublic(false)
        setModerationStatus('private')
      } else {
        const result = await moderateRecipe(recipe.title, recipe.ingredients.map(i => i.name))
        if (!result.ok) {
          await confirm({ title: 'Publication impossible', message: result.reason })
          return
        }
        await publishRecipe(recipe.id, 'approved')
        setIsPublic(true)
        setModerationStatus('approved')
      }
      onRefresh()
    } catch (e) {
      await confirm({ title: 'Erreur lors de la publication', message: e instanceof Error ? e.message : 'Erreur inconnue' })
    } finally {
      publishingRef.current = false
      setPublishing(false)
    }
  }

  const handleFavorite = async () => {
    await toggleFavorite(recipe.id, isFavorite)
    setIsFavorite(!isFavorite)
  }

  const handleShare = async () => {
    const totalTime = (recipe.prep_time || 0) + (recipe.cook_time || 0)
    const timeStr = totalTime ? `⏱ ${totalTime} min` : ''
    const servStr = recipe.servings ? `👥 ${recipe.servings} pers.` : ''
    const ingList = recipe.ingredients.map((i) => `• ${i.quantity} ${i.unit} ${i.name}`.trim()).join('\n')
    const text = [
      timeStr && servStr ? `${timeStr}  ${servStr}` : timeStr || servStr,
      '',
      '🥄 Ingrédients :',
      ingList,
      recipe.source_url ? `\n🔗 ${recipe.source_url}` : '',
    ].filter(Boolean).join('\n')

    const shareData = {
      title: recipe.title,
      text,
      url: recipe.source_url || window.location.href,
    }

    if (navigator.share) {
      try { await navigator.share(shareData) } catch { /* annulé par l'utilisateur */ }
    } else {
      await navigator.clipboard.writeText(`${recipe.title}\n\n${text}`)
      await confirm({ title: 'Recette copiée dans le presse-papiers !' })
    }
  }

  const handleSaveToCollection = async () => {
    setSaving(true)
    try {
      await savePublicRecipe(recipe.id)
      setSaved(true)
      setTimeout(() => onSaved?.(), 1200)
    } catch (e) {
      await confirm({ title: 'Erreur lors de la sauvegarde', message: e instanceof Error ? e.message : 'Erreur inconnue' })
    } finally {
      setSaving(false)
    }
  }

  const handleEstimateNutrition = async () => {
    setEstimating(true)
    try {
      const result = await estimateNutrition(recipe.title, recipe.ingredients, servings)
      setNutrition(result)
      setNutritionBase(servings)
    } catch {
      await confirm({ title: 'Estimation impossible, réessayez.' })
    } finally {
      setEstimating(false)
    }
  }

  const handleReport = async () => {
    if (!reportReason.trim()) return
    try {
      await reportRecipe(recipe.id, reportReason)
      setReportSent(true)
      setShowReport(false)
    } catch {
      await confirm({ title: 'Erreur lors du signalement' })
    }
  }

  return (
    <div className="page">
      <header className="page-header">
        <button className="btn-icon" onClick={onBack}>←</button>
        <h1 style={{ flex: 1, minWidth: 0, fontSize: '1rem', lineHeight: 1.3, margin: 0 }}>{recipe.title}</h1>
        {recipe.steps && recipe.steps.length > 0 && (
          <button
            className="btn-icon"
            onClick={() => setCookingMode(true)}
            title="Mode Cuisine"
            style={{ fontSize: 18 }}
          >🍳</button>
        )}
        <button className="btn-icon" onClick={() => printRecipe(recipe, servings)} title="Imprimer">🖨️</button>
        <button className="btn-icon" onClick={handleShare} title="Partager">📤</button>
        <button className="btn-icon" onClick={handleFavorite} title={isFavorite ? 'Retirer des favoris' : 'Ajouter aux favoris'}>
          {isFavorite ? '❤️' : '🤍'}
        </button>
        {isPublicView ? (
          <button
            className="btn-icon"
            onClick={handleSaveToCollection}
            disabled={saving || saved}
            title="Sauvegarder dans ma collection"
            style={{ fontSize: saved ? 16 : 18 }}
          >
            {saved ? '✅' : saving ? '…' : '🔖'}
          </button>
        ) : (
          <>
            {isOwner && <button className="btn-icon" onClick={onEdit} title="Modifier">✏️</button>}
            {canDelete && <button className="btn-icon delete" onClick={handleDelete} title="Supprimer">🗑</button>}
          </>
        )}
      </header>

      <div className="detail-content">
        {photoUrl ? (
          <div style={{ position: 'relative' }}>
            <img src={photoUrl} alt={recipe.title} className="detail-image" />
            {!isPublicView && (
              <button
                onClick={handleDeletePhoto}
                style={{
                  position: 'absolute', top: 8, right: 8,
                  background: 'rgba(0,0,0,0.55)', color: '#fff',
                  border: 'none', borderRadius: '50%',
                  width: 28, height: 28, fontSize: 14, cursor: 'pointer',
                  display: 'flex', alignItems: 'center', justifyContent: 'center',
                  lineHeight: 1,
                }}
                title="Supprimer ma photo"
              >✕</button>
            )}
          </div>
        ) : recipe.image_url ? (
          <img src={recipe.image_url} alt={recipe.title} className="detail-image" />
        ) : null}

        {(recipe.prep_time || recipe.cook_time || recipe.servings) && (
          <div className="detail-meta">
            {recipe.prep_time && <span>⏱ Préparation<em>{recipe.prep_time} min</em></span>}
            {recipe.cook_time && <span>🔥 Cuisson<em>{recipe.cook_time} min</em></span>}
            {recipe.servings && <span>👥 Personnes<em>{recipe.servings}</em></span>}
          </div>
        )}

        {/* Estimation calorique */}
        {nutrition ? (
          <div style={{ margin: '0 0 16px', padding: '12px 14px', background: 'var(--surface)', border: '1px solid var(--border)', borderRadius: 12 }}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 8 }}>
              <span style={{ fontWeight: 700, fontSize: 14 }}>
                🔥 {Math.round(nutrition.calories * (servings / nutritionBase))} kcal
                <span style={{ fontWeight: 400, color: 'var(--text-tertiary)', fontSize: 12 }}> /pers.</span>
              </span>
              <button style={{ background: 'none', border: 'none', fontSize: 11, color: 'var(--text-tertiary)', cursor: 'pointer', padding: 0 }}
                onClick={handleEstimateNutrition} disabled={estimating}>
                {estimating ? '…' : '↺ Recalculer'}
              </button>
            </div>
            <div style={{ display: 'flex', gap: 12, fontSize: 12, color: 'var(--text-secondary)' }}>
              <span>🥩 {Math.round(nutrition.proteins * (servings / nutritionBase))}g prot.</span>
              <span>🧈 {Math.round(nutrition.fat * (servings / nutritionBase))}g lip.</span>
              <span>🌾 {Math.round(nutrition.carbs * (servings / nutritionBase))}g gluc.</span>
            </div>
            <p style={{ margin: '6px 0 0', fontSize: 10, color: 'var(--text-tertiary)' }}>Estimation IA — à titre indicatif</p>
          </div>
        ) : (
          <button
            style={{ display: 'flex', alignItems: 'center', gap: 6, background: 'none', border: '1px dashed var(--border)', borderRadius: 10, padding: '8px 14px', fontSize: 13, color: 'var(--text-secondary)', cursor: 'pointer', width: '100%', marginBottom: 16 }}
            onClick={handleEstimateNutrition}
            disabled={estimating || recipe.ingredients.length === 0}
          >
            {estimating ? <><span className="spinner" style={{ width: 14, height: 14 }} /> Estimation en cours…</> : '⚡ Estimer les calories par portion'}
          </button>
        )}

        {recipe.tags && recipe.tags.length > 0 && (
          <div className="recipe-tags">
            {recipe.tags.map((tagId) => {
              const def = getTagDef(tagId)
              if (!def) return null
              return (
                <span key={tagId} className={`recipe-tag recipe-tag--${def.group}`}>
                  {def.emoji} {def.label}
                </span>
              )
            })}
          </div>
        )}

        <section className="detail-section">
          <div className="section-header">
            <h2>Ingrédients</h2>
            <button className="btn-primary small" onClick={handleAddToShopping} disabled={adding}>
              {adding ? '…' : '🛒 Ajouter aux courses'}
            </button>
          </div>

          <div className="portions-row">
            <span className="portions-label">Portions</span>
            <div className="portions-control">
              <button className="portions-btn" onClick={() => setServings((s) => Math.max(1, s - 1))}>−</button>
              <span className="portions-value">{servings}</span>
              <button className="portions-btn" onClick={() => setServings((s) => s + 1)}>+</button>
            </div>
            {ratio !== 1 && <span className="portions-hint">×{Math.round(ratio * 10) / 10}</span>}
          </div>

          <ul className="ingredient-list">
            {recipe.ingredients.map((ing) => (
              <li key={ing.id}>
                <span className="ing-qty">{scaleQty(ing.quantity, ratio)} {ing.unit}</span>
                <span className="ing-name">{ing.name}</span>
              </li>
            ))}
          </ul>
        </section>

        {recipe.steps.length > 0 && (
          <section className="detail-section">
            <h2>Préparation</h2>
            <ol className="steps-list">
              {recipe.steps.map((step, i) => (
                <li key={i}>{step}</li>
              ))}
            </ol>
          </section>
        )}

        <section className="detail-section">
          <div className="section-header" onClick={() => setShowNotes((v) => !v)} style={{ cursor: 'pointer' }}>
            <h2>📝 Mes notes {notes && !showNotes ? '•' : ''}</h2>
            <span style={{ fontSize: 18 }}>{showNotes ? '▲' : '▼'}</span>
          </div>
          {showNotes && (
            <>
              <textarea
                className="form-textarea"
                placeholder="Ajoutez vos notes personnelles, variantes, astuces…"
                value={notes}
                rows={4}
                onChange={(e) => { setNotes(e.target.value); setNotesDirty(true) }}
                style={{ width: '100%', marginTop: 8 }}
              />
              {notesDirty && (
                <button className="btn-primary small" onClick={handleSaveNotes} disabled={savingNotes} style={{ marginTop: 8 }}>
                  {savingNotes ? 'Sauvegarde…' : 'Sauvegarder les notes'}
                </button>
              )}
              {!photoUrl && !isPublicView && (
                <>
                  <button
                    className="btn-secondary small"
                    onClick={() => photoInputRef.current?.click()}
                    disabled={photoUploading}
                    style={{ marginTop: 8 }}
                  >
                    {photoUploading ? '…' : '📷 Ajouter ma photo'}
                  </button>
                  <input
                    ref={photoInputRef}
                    type="file"
                    accept="image/*"
                    capture="environment"
                    style={{ display: 'none' }}
                    onChange={handlePhotoChange}
                  />
                </>
              )}
            </>
          )}
        </section>

        {recipe.source_url && (
          <a href={recipe.source_url} target="_blank" rel="noreferrer" className="source-link">
            Voir la recette originale ↗
          </a>
        )}

        {/* Publier / dépublier — propriétaire uniquement */}
        {!isPublicView && (
          <section className="detail-section publish-section">
            <div className="publish-row">
              <div>
                <strong>{isPublic ? '🌍 Recette publique' : '🔒 Recette privée'}</strong>
                <p className="hint">
                  {isPublic
                    ? moderationStatus === 'approved' ? 'Visible dans Explorer par tous' : 'En cours de vérification…'
                    : 'Visible uniquement par votre foyer'}
                </p>
              </div>
              <button
                className={`btn-toggle ${isPublic ? 'active' : ''}`}
                onClick={handlePublish}
                disabled={publishing}
              >
                {publishing ? '…' : isPublic ? 'Rendre privée' : 'Publier'}
              </button>
            </div>
          </section>
        )}

        {/* Signaler — vue publique uniquement */}
        {isPublicView && (
          <div className="report-section">
            {reportSent ? (
              <p className="hint" style={{ textAlign: 'center' }}>✓ Signalement envoyé, merci.</p>
            ) : showReport ? (
              <div className="report-form">
                <p className="hint">Pourquoi signalez-vous cette recette ?</p>
                <select className="form-input" value={reportReason} onChange={(e) => setReportReason(e.target.value)}>
                  <option value="">Choisir une raison…</option>
                  <option value="not_recipe">Ce n'est pas une recette</option>
                  <option value="inappropriate">Contenu inapproprié</option>
                  <option value="spam">Spam</option>
                  <option value="other">Autre</option>
                </select>
                <div style={{ display: 'flex', gap: 8, marginTop: 8 }}>
                  <button className="btn-secondary small" onClick={() => setShowReport(false)}>Annuler</button>
                  <button className="btn-danger small" onClick={handleReport} disabled={!reportReason}>Signaler</button>
                </div>
              </div>
            ) : (
              <button className="btn-report" onClick={() => setShowReport(true)}>⚑ Signaler cette recette</button>
            )}
          </div>
        )}
      </div>

      {cookingMode && (
        <CookingMode recipe={recipe} onExit={() => setCookingMode(false)} />
      )}
    </div>
  )
}
