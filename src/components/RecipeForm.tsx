import { useState, useRef } from 'react'
import type { Recipe, Ingredient } from '../types'
import { generateId } from '../lib/uuid'
import { saveRecipe } from '../store'
import { TAG_DEFS, TAG_GROUPS } from '../tags'

interface Props {
  onBack: () => void
  onSuccess: (recipe: Recipe) => void
  initial?: Recipe
}

function emptyIngredient(): Ingredient {
  return { id: generateId(), quantity: '', unit: '', name: '' }
}

export default function RecipeForm({ onBack, onSuccess, initial }: Props) {
  const [title, setTitle] = useState(initial?.title || '')
  const [imageUrl, setImageUrl] = useState(initial?.image_url || '')
  const [servings, setServings] = useState(initial?.servings?.toString() || '')
  const [prepTime, setPrepTime] = useState(initial?.prep_time?.toString() || '')
  const [cookTime, setCookTime] = useState(initial?.cook_time?.toString() || '')
  const [ingredients, setIngredients] = useState<Ingredient[]>(
    initial?.ingredients?.length ? initial.ingredients : [emptyIngredient()]
  )
  const [steps, setSteps] = useState<string[]>(
    initial?.steps?.length ? initial.steps : ['']
  )
  const [selectedTags, setSelectedTags] = useState<string[]>(initial?.tags || [])
  const [error, setError] = useState('')
  const dragIngIdx = useRef<number | null>(null)
  const dragStepIdx = useRef<number | null>(null)

  /* ── Ingredients ── */
  const updateIngredient = (id: string, field: keyof Ingredient, value: string) => {
    setIngredients((prev) =>
      prev.map((ing) => (ing.id === id ? { ...ing, [field]: value } : ing))
    )
  }

  const addIngredient = () => setIngredients((prev) => [...prev, emptyIngredient()])

  const removeIngredient = (id: string) => {
    if (ingredients.length === 1) return
    setIngredients((prev) => prev.filter((i) => i.id !== id))
  }

  const moveIngredient = (fromIdx: number, toIdx: number) => {
    setIngredients((prev) => {
      const next = [...prev]
      const [moved] = next.splice(fromIdx, 1)
      next.splice(toIdx, 0, moved)
      return next
    })
  }

  /* ── Steps ── */
  const updateStep = (index: number, value: string) => {
    setSteps((prev) => prev.map((s, i) => (i === index ? value : s)))
  }

  const addStep = () => setSteps((prev) => [...prev, ''])

  const removeStep = (index: number) => {
    if (steps.length === 1) return
    setSteps((prev) => prev.filter((_, i) => i !== index))
  }

  const moveStep = (fromIdx: number, toIdx: number) => {
    setSteps((prev) => {
      const next = [...prev]
      const [moved] = next.splice(fromIdx, 1)
      next.splice(toIdx, 0, moved)
      return next
    })
  }

  const [saving, setSaving] = useState(false)

  /* ── Submit ── */
  const handleSubmit = async () => {
    if (!title.trim()) { setError('Le titre est obligatoire.'); return }
    const validIngredients = ingredients.filter((i) => i.name.trim())
    if (validIngredients.length === 0) { setError('Ajoutez au moins un ingrédient.'); return }

    const recipe: Recipe = {
      id: initial?.id || generateId(),
      title: title.trim(),
      source_url: initial?.source_url || '',
      image_url: imageUrl.trim() || undefined,
      servings: servings ? parseInt(servings) : undefined,
      prep_time: prepTime ? parseInt(prepTime) : undefined,
      cook_time: cookTime ? parseInt(cookTime) : undefined,
      ingredients: validIngredients,
      steps: steps.filter((s) => s.trim()),
      created_at: initial?.created_at || new Date().toISOString(),
      tags: selectedTags,
    }
    setSaving(true)
    try {
      await saveRecipe(recipe)
      onSuccess(recipe)
    } catch (e) {
      setError(e instanceof Error ? e.message : 'Erreur lors de la sauvegarde')
    } finally {
      setSaving(false)
    }
  }

  return (
    <div className="page">
      <header className="page-header">
        <button className="btn-icon" onClick={onBack}>←</button>
        <h1>{initial ? 'Modifier la recette' : 'Nouvelle recette'}</h1>
        <button className="btn-primary small" onClick={handleSubmit} disabled={saving}>
          {saving ? '…' : initial ? 'Enregistrer' : 'Créer'}
        </button>
      </header>

      <div className="form-content">
        {error && <p className="error-msg">{error}</p>}

        <section className="form-section">
          <label className="form-label">Titre *</label>
          <input
            className="form-input"
            type="text"
            placeholder="Ex : Quiche lorraine"
            value={title}
            onChange={(e) => setTitle(e.target.value)}
          />
        </section>

        <section className="form-section">
          <label className="form-label">Image (URL)</label>
          <input
            className="form-input"
            type="url"
            placeholder="https://..."
            value={imageUrl}
            onChange={(e) => setImageUrl(e.target.value)}
          />
          {imageUrl && (
            <img src={imageUrl} alt="Aperçu" className="image-preview" onError={(e) => (e.currentTarget.style.display = 'none')} />
          )}
        </section>

        <section className="form-section form-row">
          <div className="form-field">
            <label className="form-label">Personnes</label>
            <input className="form-input" type="number" min="1" placeholder="4" value={servings} onChange={(e) => setServings(e.target.value)} />
          </div>
          <div className="form-field">
            <label className="form-label">Prép. (min)</label>
            <input className="form-input" type="number" min="0" placeholder="15" value={prepTime} onChange={(e) => setPrepTime(e.target.value)} />
          </div>
          <div className="form-field">
            <label className="form-label">Cuisson (min)</label>
            <input className="form-input" type="number" min="0" placeholder="30" value={cookTime} onChange={(e) => setCookTime(e.target.value)} />
          </div>
        </section>

        <section className="form-section">
          <div className="section-header">
            <label className="form-label">Ingrédients *</label>
            <button className="btn-text" onClick={addIngredient}>+ Ajouter</button>
          </div>
          <div className="ingredient-form-header">
            <span style={{width: 64}}>Qté</span>
            <span style={{width: 72}}>Unité</span>
            <span style={{flex: 1}}>Ingrédient</span>
          </div>
          {ingredients.map((ing, idx) => (
            <div
              key={ing.id}
              className="ingredient-form-row"
              draggable
              onDragStart={() => { dragIngIdx.current = idx }}
              onDragOver={(e) => { e.preventDefault() }}
              onDrop={() => { if (dragIngIdx.current !== null && dragIngIdx.current !== idx) moveIngredient(dragIngIdx.current, idx); dragIngIdx.current = null }}
              style={{ cursor: 'grab' }}
            >
              <span style={{ fontSize: 14, color: 'var(--text-tertiary)', userSelect: 'none', paddingRight: 4 }}>⠿</span>
              <input
                className="form-input small"
                style={{width: 64}}
                type="text"
                placeholder="2"
                value={ing.quantity}
                onChange={(e) => updateIngredient(ing.id, 'quantity', e.target.value)}
              />
              <input
                className="form-input small"
                style={{width: 72}}
                type="text"
                placeholder="g"
                value={ing.unit}
                onChange={(e) => updateIngredient(ing.id, 'unit', e.target.value)}
              />
              <input
                className="form-input small"
                style={{flex: 1}}
                type="text"
                placeholder="farine"
                value={ing.name}
                onChange={(e) => updateIngredient(ing.id, 'name', e.target.value)}
              />
              <button
                className="btn-remove"
                onClick={() => removeIngredient(ing.id)}
                disabled={ingredients.length === 1}
              >×</button>
            </div>
          ))}
        </section>

        <section className="form-section">
          <div className="section-header">
            <label className="form-label">Étapes de préparation</label>
            <button className="btn-text" onClick={addStep}>+ Ajouter</button>
          </div>
          {steps.map((step, i) => (
            <div
              key={i}
              className="step-form-row"
              draggable
              onDragStart={() => { dragStepIdx.current = i }}
              onDragOver={(e) => { e.preventDefault() }}
              onDrop={() => { if (dragStepIdx.current !== null && dragStepIdx.current !== i) moveStep(dragStepIdx.current, i); dragStepIdx.current = null }}
              style={{ cursor: 'grab' }}
            >
              <span className="step-number">{i + 1}</span>
              <textarea
                className="form-textarea"
                placeholder={`Étape ${i + 1}…`}
                value={step}
                rows={2}
                onChange={(e) => updateStep(i, e.target.value)}
              />
              <button
                className="btn-remove"
                onClick={() => removeStep(i)}
                disabled={steps.length === 1}
              >×</button>
            </div>
          ))}
        </section>

        <section className="form-section">
          <label className="form-label">Caractéristiques</label>
          {TAG_GROUPS.map((group) => {
            const groupTags = TAG_DEFS.filter((t) => t.group === group.id)
            return (
              <div key={group.id} className="tag-group">
                <p className="tag-group-label">{group.label}</p>
                <div className="tag-chips">
                  {groupTags.map((tag) => {
                    const active = selectedTags.includes(tag.id)
                    return (
                      <button
                        key={tag.id}
                        type="button"
                        className={`tag-chip${active ? ' active' : ''}`}
                        onClick={() => setSelectedTags((prev) =>
                          active ? prev.filter((t) => t !== tag.id) : [...prev, tag.id]
                        )}
                      >
                        {tag.emoji} {tag.label}
                      </button>
                    )
                  })}
                </div>
              </div>
            )
          })}
        </section>

        <button className="btn-primary" onClick={handleSubmit} style={{margin: '0 0 24px'}} disabled={saving}>
          {saving ? 'Sauvegarde…' : initial ? 'Enregistrer les modifications' : 'Créer la recette'}
        </button>
      </div>
    </div>
  )
}
