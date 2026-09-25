import type { Recipe } from '../types'

function esc(s: string): string {
  return s
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
}

function scaleQty(qty: string, ratio: number): string {
  if (!qty) return ''
  const num = parseFloat(qty.replace(',', '.'))
  if (isNaN(num)) return qty
  const result = num * ratio
  if (Math.abs(result - Math.round(result)) < 0.01) return String(Math.round(result))
  return String(Math.round(result * 10) / 10)
}

export function printRecipe(recipe: Recipe, currentServings: number): void {
  const base = recipe.servings || 4
  const ratio = currentServings / base

  // Métadonnées — uniquement les champs présents
  const meta: string[] = []
  if (recipe.prep_time) meta.push(`⏱ Préparation : ${recipe.prep_time} min`)
  if (recipe.cook_time) meta.push(`🍳 Cuisson : ${recipe.cook_time} min`)
  meta.push(`👤 ${currentServings} personne${currentServings > 1 ? 's' : ''}`)

  // Ingrédients
  const twoCol = recipe.ingredients.length > 8
  const ingItems = recipe.ingredients
    .map(ing => {
      const qty = scaleQty(ing.quantity, ratio)
      const label = [qty, esc(ing.unit), esc(ing.name)].filter(Boolean).join(' ').trim()
      return `<li>${label}</li>`
    })
    .join('\n      ')

  // Étapes
  const stepsHtml = recipe.steps
    .map(step => `<li class="step">${esc(step)}</li>`)
    .join('\n      ')

  // Notes (optionnelles)
  const notesSection = recipe.user_notes?.trim()
    ? `<section class="notes">
      <h2>Mes notes</h2>
      <p>${esc(recipe.user_notes).replace(/\n/g, '<br>')}</p>
    </section>`
    : ''

  // Image (optionnelle)
  const imageHtml = recipe.image_url
    ? `<img class="recipe-image" src="${esc(recipe.image_url)}" alt="${esc(recipe.title)}" onerror="this.style.display='none'">`
    : ''

  const appUrl = (import.meta.env.VITE_APP_URL as string | undefined) ?? 'https://recettes.pharmaciepitondesgoyaves.re'

  const html = `<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>${esc(recipe.title)}</title>
  <style>
    @page { margin: 15mm; }
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body {
      font-family: Georgia, 'Times New Roman', serif;
      font-size: 11pt;
      color: #000;
      background: #fff;
      line-height: 1.65;
    }
    h1, h2 { font-family: Arial, Helvetica, sans-serif; }
    .header {
      display: flex;
      align-items: baseline;
      gap: 14px;
      margin-bottom: 6pt;
    }
    .brand {
      font-family: Arial, Helvetica, sans-serif;
      font-size: 9pt;
      color: #888;
      text-transform: uppercase;
      letter-spacing: 0.1em;
      white-space: nowrap;
      flex-shrink: 0;
    }
    h1 {
      font-size: 20pt;
      font-weight: bold;
      line-height: 1.2;
      color: #111;
    }
    .meta {
      font-size: 10pt;
      color: #555;
      margin: 8pt 0;
      font-family: Arial, Helvetica, sans-serif;
    }
    .meta span { margin-right: 14pt; }
    hr { border: none; border-top: 1px solid #ccc; margin: 10pt 0; }
    .recipe-image {
      float: right;
      max-height: 200px;
      max-width: 240px;
      width: auto;
      border-radius: 8px;
      margin: 0 0 12pt 16pt;
      display: block;
    }
    h2 {
      font-size: 12pt;
      font-weight: bold;
      margin-bottom: 6pt;
      color: #333;
      text-transform: uppercase;
      letter-spacing: 0.06em;
    }
    section { margin-bottom: 14pt; }
    .ingredients-list {
      list-style: disc;
      padding-left: 18pt;
      font-size: 11pt;
    }
    .ingredients-list.two-col {
      column-count: 2;
      column-gap: 20pt;
    }
    .ingredients-list li { margin-bottom: 3pt; break-inside: avoid; }
    .steps-list { list-style: decimal; padding-left: 18pt; }
    .step { margin-bottom: 8pt; page-break-inside: avoid; break-inside: avoid; }
    .notes {
      padding: 10pt;
      border: 1px solid #ddd;
      border-radius: 4px;
    }
    .notes p { font-size: 10pt; color: #444; margin-top: 4pt; }
    footer {
      margin-top: 20pt;
      padding-top: 8pt;
      border-top: 1px solid #ddd;
      font-size: 9pt;
      color: #aaa;
      font-family: Arial, Helvetica, sans-serif;
      text-align: center;
    }
    @media print {
      body { -webkit-print-color-adjust: exact; print-color-adjust: exact; }
    }
  </style>
</head>
<body>
  <div class="header">
    <span class="brand">Mes Recettes</span>
    <h1>${esc(recipe.title)}</h1>
  </div>
  <div class="meta">
    ${meta.map(m => `<span>${m}</span>`).join('')}
  </div>
  <hr>
  ${imageHtml}
  <section>
    <h2>Ingrédients</h2>
    <ul class="ingredients-list${twoCol ? ' two-col' : ''}">
      ${ingItems}
    </ul>
  </section>
  <section>
    <h2>Préparation</h2>
    <ol class="steps-list">
      ${stepsHtml}
    </ol>
  </section>
  ${notesSection}
  <footer>Imprimé depuis ${esc(appUrl)}</footer>
</body>
</html>`

  const win = window.open('', '_blank')
  if (!win) return
  win.document.write(html)
  win.document.close()
  win.addEventListener('afterprint', () => win.close())
  setTimeout(() => win.print(), 200)
}
