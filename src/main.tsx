import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.tsx'
import { expireStalePersisted } from './lib/persistedState'

// L'appli rouvre là où on l'avait laissée, sauf après plus de 24 h d'inactivité
expireStalePersisted(24 * 60 * 60 * 1000)

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <App />
  </StrictMode>,
)
