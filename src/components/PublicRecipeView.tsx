import { useEffect, useState } from 'react'
import type { Recipe } from '../types'
import { getPublicRecipeById } from '../store'

interface Props {
  recipeId: string
}

function TopBanner() {
  return (
    <div style={{
      display: 'flex', alignItems: 'center', justifyContent: 'space-between',
      padding: '10px 16px', background: 'var(--surface)', borderBottom: '1px solid var(--border-light)',
    }}>
      <strong style={{ color: 'var(--primary-dark)' }}>🍽️ Mes Recettes</strong>
      <a href="/" className="btn-primary small" style={{ textDecoration: 'none' }}>Créer un compte gratuit</a>
    </div>
  )
}

export default function PublicRecipeView({ recipeId }: Props) {
  const [recipe, setRecipe] = useState<Recipe | null | undefined>(undefined)

  useEffect(() => {
    getPublicRecipeById(recipeId).then(setRecipe).catch(() => setRecipe(null))
  }, [recipeId])

  if (recipe === undefined) {
    return (
      <div className="page" style={{ alignItems: 'center', justifyContent: 'center' }}>
        <span className="spinner" style={{ width: 32, height: 32 }} />
      </div>
    )
  }

  if (recipe === null) {
    return (
      <div className="page">
        <TopBanner />
        <p style={{ textAlign: 'center', padding: '48px 16px', color: 'var(--text-secondary)' }}>
          Cette recette n'est plus disponible.
        </p>
      </div>
    )
  }

  const photoUrl = recipe.user_photo_url || recipe.image_url

  return (
    <div className="page">
      <TopBanner />
      <header className="page-header">
        <h1 style={{ fontSize: '1.2rem' }}>{recipe.title}</h1>
      </header>

      <div className="detail-content">
        {photoUrl && <img src={photoUrl} alt={recipe.title} className="detail-image" />}

        {(recipe.prep_time || recipe.cook_time || recipe.servings) && (
          <div className="detail-meta">
            {recipe.prep_time && <span>⏱ Préparation<em>{recipe.prep_time} min</em></span>}
            {recipe.cook_time && <span>🔥 Cuisson<em>{recipe.cook_time} min</em></span>}
            {recipe.servings && <span>👥 Personnes<em>{recipe.servings}</em></span>}
          </div>
        )}

        {recipe.nutrition_calories != null && (
          <div style={{ margin: '0 0 16px', padding: '12px 14px', background: 'var(--surface)', border: '1px solid var(--border)', borderRadius: 12 }}>
            <span style={{ fontWeight: 700, fontSize: 14 }}>
              🔥 {Math.round(recipe.nutrition_calories)} kcal
              <span style={{ fontWeight: 400, color: 'var(--text-tertiary)', fontSize: 12 }}> /pers.</span>
            </span>
            <div style={{ display: 'flex', gap: 12, fontSize: 12, color: 'var(--text-secondary)', marginTop: 8 }}>
              <span>🥩 {Math.round(recipe.nutrition_proteins ?? 0)}g prot.</span>
              <span>🧈 {Math.round(recipe.nutrition_fat ?? 0)}g lip.</span>
              <span>🌾 {Math.round(recipe.nutrition_carbs ?? 0)}g gluc.</span>
            </div>
            <p style={{ margin: '6px 0 0', fontSize: 10, color: 'var(--text-tertiary)' }}>Estimation IA — à titre indicatif</p>
          </div>
        )}

        <section className="detail-section">
          <h2>Ingrédients</h2>
          <ul className="ingredient-list">
            {recipe.ingredients.map((ing) => (
              <li key={ing.id}>
                <span className="ing-qty">{ing.quantity} {ing.unit}</span>
                <span className="ing-name">{ing.name}</span>
              </li>
            ))}
          </ul>
        </section>

        {recipe.steps.length > 0 && (
          <section className="detail-section">
            <h2>Préparation</h2>
            <ol className="steps-list">
              {recipe.steps.map((step, i) => <li key={i}>{step}</li>)}
            </ol>
          </section>
        )}

        {recipe.source_url && (
          <a href={recipe.source_url} target="_blank" rel="noreferrer" className="source-link">
            Voir la recette originale ↗
          </a>
        )}
      </div>
    </div>
  )
}
