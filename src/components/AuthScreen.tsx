import { useState } from 'react'
import { supabase } from '../lib/supabase'

export default function AuthScreen() {
  const [mode, setMode] = useState<'login' | 'register' | 'forgot'>('login')
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [loading, setLoading] = useState(false)
  const [oauthLoading, setOauthLoading] = useState<string | null>(null)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  const handleOAuth = async (provider: 'google' | 'facebook') => {
    setError('')
    setOauthLoading(provider)
    try {
      const { error } = await supabase.auth.signInWithOAuth({
        provider,
        options: {
          redirectTo: `${import.meta.env.VITE_APP_URL}/`,
        },
      })
      if (error) throw error
    } catch (e) {
      setError(e instanceof Error ? e.message : 'Erreur de connexion')
      setOauthLoading(null)
    }
  }

  const handleSubmit = async () => {
    setError('')
    setSuccess('')
    if (!email.trim() || (!password.trim() && mode !== 'forgot')) {
      setError('Merci de remplir tous les champs.')
      return
    }
    setLoading(true)
    try {
      if (mode === 'login') {
        const { error } = await supabase.auth.signInWithPassword({ email, password })
        if (error) throw error
      } else if (mode === 'register') {
        const { error } = await supabase.auth.signUp({ email, password })
        if (error) throw error
        setSuccess('Compte créé ! Vérifiez votre email pour confirmer votre inscription.')
      } else {
        const { error } = await supabase.auth.resetPasswordForEmail(email)
        if (error) throw error
        setSuccess('Email de réinitialisation envoyé.')
      }
    } catch (e: unknown) {
      const msg = e instanceof Error ? e.message : 'Erreur inconnue'
      if (msg.includes('Invalid login')) setError('Email ou mot de passe incorrect.')
      else if (msg.includes('already registered')) setError('Cet email est déjà utilisé.')
      else if (msg.includes('Password should')) setError('Le mot de passe doit contenir au moins 6 caractères.')
      else setError(msg)
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="auth-screen">
      <div className="auth-card">
        <div className="auth-logo">🍽️</div>
        <h1 className="auth-title">Mes Recettes</h1>
        <p className="auth-subtitle">
          {mode === 'login' && 'Connectez-vous pour accéder à vos recettes'}
          {mode === 'register' && 'Créez votre compte gratuitement'}
          {mode === 'forgot' && 'Réinitialiser votre mot de passe'}
        </p>

        <div className="auth-form">
          <div className="auth-field">
            <label className="form-label">Email</label>
            <input
              className="form-input"
              type="email"
              placeholder="votre@email.com"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              onKeyDown={(e) => e.key === 'Enter' && handleSubmit()}
              autoComplete="email"
            />
          </div>

          {mode !== 'forgot' && (
            <div className="auth-field">
              <label className="form-label">Mot de passe</label>
              <input
                className="form-input"
                type="password"
                placeholder={mode === 'register' ? 'Minimum 6 caractères' : '••••••••'}
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                onKeyDown={(e) => e.key === 'Enter' && handleSubmit()}
                autoComplete={mode === 'login' ? 'current-password' : 'new-password'}
              />
            </div>
          )}

          {error && <p className="error-msg">{error}</p>}
          {success && <p className="success-msg">{success}</p>}

          <button className="btn-terracotta" onClick={handleSubmit} disabled={loading}>
            {loading ? 'Chargement…' : mode === 'login' ? 'Se connecter' : mode === 'register' ? 'Créer mon compte' : 'Envoyer le lien'}
          </button>

          {mode !== 'forgot' && (
            <>
              <div className="auth-divider"><span>ou</span></div>
              <button
                className="btn-oauth btn-google"
                onClick={() => handleOAuth('google')}
                disabled={oauthLoading !== null}
              >
                <svg width="18" height="18" viewBox="0 0 18 18" fill="none">
                  <path d="M17.64 9.2c0-.637-.057-1.251-.164-1.84H9v3.481h4.844c-.209 1.125-.843 2.078-1.796 2.717v2.258h2.908c1.702-1.567 2.684-3.875 2.684-6.615z" fill="#4285F4"/>
                  <path d="M9 18c2.43 0 4.467-.806 5.956-2.18l-2.908-2.259c-.806.54-1.837.86-3.048.86-2.344 0-4.328-1.584-5.036-3.711H.957v2.332A8.997 8.997 0 009 18z" fill="#34A853"/>
                  <path d="M3.964 10.71A5.41 5.41 0 013.682 9c0-.593.102-1.17.282-1.71V4.958H.957A8.996 8.996 0 000 9c0 1.452.348 2.827.957 4.042l3.007-2.332z" fill="#FBBC05"/>
                  <path d="M9 3.58c1.321 0 2.508.454 3.44 1.345l2.582-2.58C13.463.891 11.426 0 9 0A8.997 8.997 0 00.957 4.958L3.964 7.29C4.672 5.163 6.656 3.58 9 3.58z" fill="#EA4335"/>
                </svg>
                {oauthLoading === 'google' ? 'Redirection…' : 'Continuer avec Google'}
              </button>
              <button
                className="btn-oauth btn-facebook"
                onClick={() => handleOAuth('facebook')}
                disabled={oauthLoading !== null}
              >
                <svg width="18" height="18" viewBox="0 0 24 24" fill="white">
                  <path d="M24 12.073C24 5.405 18.627 0 12 0S0 5.405 0 12.073c0 6.027 4.388 11.024 10.125 11.927v-8.437H7.078v-3.49h3.047V9.41c0-3.025 1.792-4.697 4.533-4.697 1.312 0 2.686.236 2.686.236v2.97h-1.513c-1.491 0-1.956.93-1.956 1.887v2.267h3.328l-.532 3.49h-2.796v8.437C19.612 23.097 24 18.1 24 12.073z"/>
                </svg>
                {oauthLoading === 'facebook' ? 'Redirection…' : 'Continuer avec Facebook'}
              </button>
            </>
          )}
        </div>

        <div className="auth-links">
          {mode === 'login' && (
            <>
              <button className="auth-link" onClick={() => { setMode('register'); setError(''); setSuccess('') }}>
                Pas encore de compte ? S'inscrire
              </button>
              <button className="auth-link muted" onClick={() => { setMode('forgot'); setError(''); setSuccess('') }}>
                Mot de passe oublié ?
              </button>
            </>
          )}
          {(mode === 'register' || mode === 'forgot') && (
            <button className="auth-link" onClick={() => { setMode('login'); setError(''); setSuccess('') }}>
              ← Retour à la connexion
            </button>
          )}
        </div>
      </div>
    </div>
  )
}
