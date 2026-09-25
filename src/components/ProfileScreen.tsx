import { useState, useEffect, useRef } from 'react'
import type { Profile, Household } from '../types'
import { getProfile, saveProfile, isDisplayNameAvailable, uploadAvatar, updatePassword, saveDietaryFilters } from '../store'
import { supabase } from '../lib/supabase'
import { useHouseholds } from '../hooks/useHouseholds'
import { useConfirm } from '../hooks/useConfirm'

const DIETARY_OPTIONS = [
  { value: 'vegetarien', label: '🌿 Végétarien' },
  { value: 'vegan', label: '🌱 Vegan' },
  { value: 'sans-porc', label: '🚫🐷 Sans porc' },
  { value: 'sans-gluten', label: '🌾 Sans gluten' },
  { value: 'sans-lactose', label: '🥛 Sans lactose' },
]

interface Props {
  onBack?: () => void
  onSignOut?: () => void
  isPasswordRecovery?: boolean
  onPasswordRecoveryDone?: () => void
  onDietaryFiltersChange?: (filters: string[]) => void
}

const PSEUDO_RE = /^[a-zA-Z0-9_\-.]+$/

function applyTheme(dark: boolean) {
  document.documentElement.setAttribute('data-theme', dark ? 'dark' : 'light')
}

export default function ProfileScreen({ onBack, onSignOut, isPasswordRecovery = false, onPasswordRecoveryDone, onDietaryFiltersChange }: Props) {
  const { confirm } = useConfirm()
  const { households, isLoading: householdsLoading, createHousehold, joinHousehold, leaveHousehold, removeMember, renameHousehold, regenerateCode, deleteHousehold, shareCode } = useHouseholds()

  // Household UI state
  const [showJoin, setShowJoin] = useState(false)
  const [showCreate, setShowCreate] = useState(false)
  const [joinCode, setJoinCode] = useState('')
  const [createName, setCreateName] = useState('')
  const [householdLoading, setHouseholdLoading] = useState(false)
  const [householdError, setHouseholdError] = useState('')
  const [householdToast, setHouseholdToast] = useState('')
  const [renamingId, setRenamingId] = useState<string | null>(null)
  const [renameValue, setRenameValue] = useState('')

  const showHToast = (msg: string) => { setHouseholdToast(msg); setTimeout(() => setHouseholdToast(''), 2500) }

  const handleCreate = async () => {
    if (!createName.trim()) return
    setHouseholdLoading(true); setHouseholdError('')
    try {
      await createHousehold(createName.trim())
      setCreateName(''); setShowCreate(false)
      showHToast('Foyer créé !')
      if (!localStorage.getItem('household_migration_banner_dismissed')) {
        localStorage.setItem('household_migration_banner_shown', '1')
      }
    } catch (e) { setHouseholdError(e instanceof Error ? e.message : 'Erreur') }
    finally { setHouseholdLoading(false) }
  }

  const handleJoin = async () => {
    if (!joinCode.trim()) return
    setHouseholdLoading(true); setHouseholdError('')
    try {
      await joinHousehold(joinCode.trim())
      setJoinCode(''); setShowJoin(false)
      showHToast('Foyer rejoint !')
      if (!localStorage.getItem('household_migration_banner_dismissed')) {
        localStorage.setItem('household_migration_banner_shown', '1')
      }
    } catch (e) { setHouseholdError(e instanceof Error ? e.message : 'Code invalide') }
    finally { setHouseholdLoading(false) }
  }

  const handleLeave = async (h: Household) => {
    if (!await confirm({ title: `Quitter "${h.name}" ?`, message: 'Vos listes et menus partagés resteront visibles par les membres du foyer.', confirmLabel: 'Quitter', cancelLabel: 'Annuler', variant: 'danger' })) return
    try { await leaveHousehold(h.id); showHToast('Foyer quitté') } catch (e) { showHToast(e instanceof Error ? e.message : 'Erreur') }
  }

  const handleDelete = async (h: Household) => {
    if (!await confirm({ title: `Supprimer "${h.name}" ?`, message: "Cette action est irréversible. Les listes et menus partagés deviendront privés.", confirmLabel: 'Supprimer', cancelLabel: 'Annuler', variant: 'danger' })) return
    try { await deleteHousehold(h.id); showHToast('Foyer supprimé') } catch (e) { showHToast(e instanceof Error ? e.message : 'Erreur') }
  }

  const handleRegenerate = async (h: Household) => {
    if (!await confirm({ title: 'Regénérer le code ?', message: "L'ancien code ne fonctionnera plus.", confirmLabel: 'Regénérer', cancelLabel: 'Annuler' })) return
    try { const code = await regenerateCode(h.id); showHToast(`Nouveau code : ${code}`) } catch (e) { showHToast(e instanceof Error ? e.message : 'Erreur') }
  }

  const handleRename = async (h: Household) => {
    if (!renameValue.trim()) return
    try { await renameHousehold(h.id, renameValue.trim()); setRenamingId(null); showHToast('Renommé !') } catch (e) { showHToast(e instanceof Error ? e.message : 'Erreur') }
  }

  const [profile, setProfile] = useState<Profile | null>(null)
  const [editing, setEditing] = useState(false)
  const [input, setInput] = useState('')
  const [checking, setChecking] = useState(false)
  const [available, setAvailable] = useState<boolean | null>(null)
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState('')
  const [toast, setToast] = useState('')
  const [stats, setStats] = useState({ recipes: 0, favorites: 0, public: 0, menus: 0 })
  const [loading, setLoading] = useState(true)
  const [isDark, setIsDark] = useState(() => {
    const saved = localStorage.getItem('theme')
    return saved ? saved === 'dark' : true
  })
  const [dietaryFilters, setDietaryFiltersState] = useState<string[]>([])

  // Avatar
  const [avatarUploading, setAvatarUploading] = useState(false)
  const fileInputRef = useRef<HTMLInputElement>(null)

  // Password change
  const [showPwd, setShowPwd] = useState(false)
  const [pwdCurrent, setPwdCurrent] = useState('')
  const [pwdNew, setPwdNew] = useState('')
  const [pwdConfirm, setPwdConfirm] = useState('')
  const [pwdError, setPwdError] = useState('')
  const [pwdSaving, setPwdSaving] = useState(false)

  const toggleDietaryFilter = async (value: string) => {
    const next = dietaryFilters.includes(value)
      ? dietaryFilters.filter((f) => f !== value)
      : [...dietaryFilters, value]
    setDietaryFiltersState(next)
    onDietaryFiltersChange?.(next)
    try { await saveDietaryFilters(next) } catch { /* ignore */ }
  }

  const toggleTheme = () => {
    const next = !isDark
    setIsDark(next)
    localStorage.setItem('theme', next ? 'dark' : 'light')
    applyTheme(next)
  }

  useEffect(() => { loadAll() }, [])

  // En mode récupération de mot de passe, ouvrir directement le formulaire
  useEffect(() => {
    if (isPasswordRecovery) setShowPwd(true)
  }, [isPasswordRecovery])

  const loadAll = async () => {
    setLoading(true)
    const [p, { data: { user } }] = await Promise.all([
      getProfile(),
      supabase.auth.getUser(),
    ])
    setProfile(p)
    if (p?.dietary_filters) setDietaryFiltersState(p.dietary_filters)
    if (!p) setEditing(true)
    if (user) {
      const [{ count: recipes }, { count: favorites }, { count: pub }, { count: menus }] = await Promise.all([
        supabase.from('recipes').select('id', { count: 'exact', head: true }).eq('user_id', user.id),
        supabase.from('recipe_favorites').select('id', { count: 'exact', head: true }).eq('user_id', user.id),
        supabase.from('recipes').select('id', { count: 'exact', head: true }).eq('user_id', user.id).eq('is_public', true),
        supabase.from('menus').select('id', { count: 'exact', head: true }).eq('user_id', user.id),
      ])
      setStats({ recipes: recipes || 0, favorites: favorites || 0, public: pub || 0, menus: menus || 0 })
    }
    setLoading(false)
  }

  useEffect(() => {
    if (!input || input === profile?.display_name) { setAvailable(null); return }
    if (input.length < 3 || !PSEUDO_RE.test(input)) { setAvailable(null); return }
    setChecking(true)
    const timer = setTimeout(async () => {
      const ok = await isDisplayNameAvailable(input)
      setAvailable(ok)
      setChecking(false)
    }, 500)
    return () => clearTimeout(timer)
  }, [input])

  const handleSave = async () => {
    setError('')
    const name = input.trim()
    if (name.length < 3) { setError('Minimum 3 caractères'); return }
    if (name.length > 20) { setError('Maximum 20 caractères'); return }
    if (!PSEUDO_RE.test(name)) { setError('Lettres, chiffres, _ - . uniquement'); return }
    if (available === false) { setError('Ce pseudo est déjà pris'); return }
    setSaving(true)
    try {
      await saveProfile(name)
      const updated = await getProfile()
      setProfile(updated)
      setEditing(false)
      showToast('Pseudo sauvegardé !')
    } catch (e) {
      setError(e instanceof Error ? e.message : 'Erreur')
    } finally {
      setSaving(false)
    }
  }

  const ALLOWED_IMAGE_TYPES = new Set(['image/jpeg', 'image/png', 'image/webp', 'image/gif'])

  const handleAvatarChange = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0]
    if (!file) return
    if (!file.type.startsWith('image/') || !ALLOWED_IMAGE_TYPES.has(file.type)) {
      showToast('Format non accepté (jpeg, png, webp ou gif uniquement)')
      if (fileInputRef.current) fileInputRef.current.value = ''
      return
    }
    if (file.size > 5 * 1024 * 1024) { showToast('Image trop lourde (max 5 Mo)'); return }
    setAvatarUploading(true)
    try {
      const url = await uploadAvatar(file)
      await saveProfile(profile?.display_name || '', url)
      const updated = await getProfile()
      setProfile(updated)
      showToast('Photo mise à jour !')
    } catch (e) {
      showToast(e instanceof Error ? e.message : 'Erreur upload')
    } finally {
      setAvatarUploading(false)
      if (fileInputRef.current) fileInputRef.current.value = ''
    }
  }

  const handlePasswordSave = async () => {
    setPwdError('')
    if (!isPasswordRecovery && !pwdCurrent) { setPwdError('Saisissez le mot de passe actuel'); return }
    if (pwdNew.length < 8) { setPwdError('Nouveau mot de passe : 8 caractères min.'); return }
    if (pwdNew !== pwdConfirm) { setPwdError('Les mots de passe ne correspondent pas'); return }
    setPwdSaving(true)
    try {
      await updatePassword(isPasswordRecovery ? null : pwdCurrent, pwdNew)
      setPwdCurrent(''); setPwdNew(''); setPwdConfirm('')
      setShowPwd(false)
      onPasswordRecoveryDone?.()
      showToast('Mot de passe modifié !')
    } catch (e) {
      setPwdError(e instanceof Error ? e.message : 'Erreur')
    } finally {
      setPwdSaving(false)
    }
  }

  const showToast = (msg: string) => {
    setToast(msg)
    setTimeout(() => setToast(''), 2500)
  }

  const badges = [
    { id: 'chef', emoji: '👨‍🍳', label: 'Cuisinier', desc: '5 recettes créées', done: stats.recipes >= 5 },
    { id: 'world', emoji: '🌍', label: 'Explorateur', desc: '10 favoris', done: stats.favorites >= 10 },
    { id: 'star', emoji: '⭐', label: 'Chef reconnu', desc: '3 recettes publiées', done: stats.public >= 3 },
    { id: 'plan', emoji: '📅', label: 'Planificateur', desc: 'Menu généré', done: stats.menus >= 1 },
    { id: 'org', emoji: '🛒', label: 'Organisé', desc: 'Liste de courses', done: stats.recipes >= 1 },
  ]

  if (loading) return (
    <div className="page">
      <header className="page-header">
        {onBack && <button className="btn-icon" onClick={onBack}>←</button>}
        <h1>Paramètres</h1>
      </header>
      <div className="empty-state"><div className="spinner" /></div>
    </div>
  )

  return (
    <div className="page">
      <header className="page-header">
        {onBack && <button className="btn-icon" onClick={onBack}>←</button>}
        <h1>Paramètres</h1>
      </header>

      <div className="detail-content" style={{ display: 'flex', flexDirection: 'column', gap: 24 }}>

        {/* Avatar + pseudo */}
        <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', gap: 12, paddingTop: 8 }}>

          {/* Avatar cliquable */}
          <div style={{ position: 'relative', cursor: 'pointer' }} onClick={() => !avatarUploading && fileInputRef.current?.click()}>
            {profile?.avatar_url ? (
              <img
                src={profile.avatar_url}
                alt="avatar"
                style={{ width: 80, height: 80, borderRadius: '50%', objectFit: 'cover', border: '3px solid var(--primary)' }}
              />
            ) : (
              <div style={{
                width: 80, height: 80, borderRadius: '50%',
                background: 'var(--primary)', color: '#fff',
                display: 'flex', alignItems: 'center', justifyContent: 'center',
                fontSize: 30, fontWeight: 700, border: '3px solid var(--primary)',
              }}>
                {profile?.display_name?.[0]?.toUpperCase() || '?'}
              </div>
            )}
            <div style={{
              position: 'absolute', bottom: 2, right: 2,
              width: 24, height: 24, borderRadius: '50%',
              background: 'var(--primary)', color: '#fff',
              display: 'flex', alignItems: 'center', justifyContent: 'center',
              fontSize: 13, border: '2px solid var(--bg)',
            }}>
              {avatarUploading ? <span style={{ fontSize: 10 }}>…</span> : '📷'}
            </div>
          </div>
          <input ref={fileInputRef} type="file" accept="image/jpeg,image/png,image/webp" style={{ display: 'none' }} onChange={handleAvatarChange} />

          {editing ? (
            <div style={{ width: '100%', maxWidth: 320 }}>
              <div style={{ position: 'relative' }}>
                <span style={{ position: 'absolute', left: 12, top: '50%', transform: 'translateY(-50%)', color: 'var(--text-tertiary)', fontSize: 15 }}>@</span>
                <input
                  className="form-input"
                  style={{ paddingLeft: 26 }}
                  placeholder="votre_pseudo"
                  value={input}
                  onChange={e => { setInput(e.target.value); setError('') }}
                  maxLength={20}
                  autoFocus
                />
              </div>
              <div style={{ display: 'flex', alignItems: 'center', gap: 6, marginTop: 6, fontSize: 12, minHeight: 18 }}>
                {checking && <span style={{ color: 'var(--text-tertiary)' }}>Vérification…</span>}
                {!checking && available === true && input.length >= 3 && <span style={{ color: 'var(--success, #22c55e)' }}>✓ Disponible</span>}
                {!checking && available === false && <span style={{ color: 'var(--error)' }}>✗ Déjà pris</span>}
                {error && <span style={{ color: 'var(--error)' }}>{error}</span>}
              </div>
              <div style={{ fontSize: 11, color: 'var(--text-tertiary)', marginTop: 4 }}>3–20 caractères · lettres, chiffres, _ - .</div>
              <div style={{ display: 'flex', gap: 8, marginTop: 12 }}>
                <button className="btn-primary" style={{ flex: 1 }} onClick={handleSave} disabled={saving || available === false}>
                  {saving ? 'Sauvegarde…' : 'Valider'}
                </button>
                {profile && (
                  <button className="btn-outline" style={{ flex: 1 }} onClick={() => { setEditing(false); setError('') }}>Annuler</button>
                )}
              </div>
            </div>
          ) : (
            <div style={{ textAlign: 'center' }}>
              <div style={{ fontSize: 20, fontWeight: 700 }}>@{profile?.display_name}</div>
              <button className="btn-outline small" style={{ marginTop: 8 }} onClick={() => { setInput(profile?.display_name || ''); setEditing(true) }}>
                Modifier le pseudo
              </button>
            </div>
          )}
        </div>

        {/* Stats */}
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: 10 }}>
          {[
            { label: 'Recettes', value: stats.recipes, emoji: '🍽️' },
            { label: 'Favoris', value: stats.favorites, emoji: '❤️' },
            { label: 'Publiées', value: stats.public, emoji: '🌍' },
          ].map(s => (
            <div key={s.label} style={{ background: 'var(--surface)', border: '1px solid var(--border)', borderRadius: 12, padding: '14px 8px', textAlign: 'center' }}>
              <div style={{ fontSize: 22 }}>{s.emoji}</div>
              <div style={{ fontSize: 22, fontWeight: 700, lineHeight: 1.2 }}>{s.value}</div>
              <div style={{ fontSize: 11, color: 'var(--text-tertiary)', marginTop: 2 }}>{s.label}</div>
            </div>
          ))}
        </div>

        {/* Badges */}
        <div>
          <div style={{ fontWeight: 700, fontSize: 15, marginBottom: 12 }}>Badges</div>
          <div style={{ display: 'flex', flexDirection: 'column', gap: 10 }}>
            {badges.map(b => (
              <div key={b.id} style={{
                display: 'flex', alignItems: 'center', gap: 14,
                padding: '12px 14px',
                background: 'var(--surface)', border: '1px solid var(--border)', borderRadius: 12,
                opacity: b.done ? 1 : 0.45,
              }}>
                <span style={{ fontSize: 28, width: 36, textAlign: 'center' }}>{b.emoji}</span>
                <div style={{ flex: 1 }}>
                  <div style={{ fontWeight: 600, fontSize: 14 }}>{b.label}</div>
                  <div style={{ fontSize: 12, color: 'var(--text-tertiary)' }}>{b.desc}</div>
                </div>
                {b.done && <span style={{ fontSize: 18 }}>✅</span>}
              </div>
            ))}
          </div>
        </div>

        {/* Préférences alimentaires */}
        <div>
          <div style={{ fontWeight: 700, fontSize: 15, marginBottom: 4 }}>Préférences alimentaires</div>
          <p style={{ fontSize: 12, color: 'var(--text-tertiary)', marginBottom: 12 }}>
            Appliquées automatiquement dans le planificateur et l'Explorer.
          </p>
          <div style={{ display: 'flex', flexDirection: 'column', gap: 2, background: 'var(--surface)', border: '1px solid var(--border)', borderRadius: 12, overflow: 'hidden' }}>
            {DIETARY_OPTIONS.map((opt, i) => {
              const active = dietaryFilters.includes(opt.value)
              return (
                <button
                  key={opt.value}
                  onClick={() => toggleDietaryFilter(opt.value)}
                  style={{
                    display: 'flex', alignItems: 'center', justifyContent: 'space-between',
                    padding: '13px 16px', background: 'none', border: 'none', cursor: 'pointer',
                    color: 'var(--text)', textAlign: 'left',
                    borderTop: i > 0 ? '1px solid var(--border)' : 'none',
                  }}
                >
                  <span style={{ fontSize: 14, fontWeight: 500 }}>{opt.label}</span>
                  <div style={{
                    width: 44, height: 24, borderRadius: 12, border: 'none', cursor: 'pointer',
                    background: active ? 'var(--primary)' : 'var(--border)',
                    position: 'relative', transition: 'background 0.2s', flexShrink: 0,
                  }}>
                    <span style={{
                      position: 'absolute', top: 3, left: active ? 22 : 3,
                      width: 18, height: 18, borderRadius: '50%',
                      background: '#fff', transition: 'left 0.2s', display: 'block',
                    }} />
                  </div>
                </button>
              )
            })}
          </div>
        </div>

        {/* Foyers */}
        <div>
          <div style={{ fontWeight: 700, fontSize: 15, marginBottom: 12 }}>Mes Foyers</div>

          {householdsLoading ? (
            <div style={{ textAlign: 'center', padding: 16 }}><div className="spinner" style={{ width: 24, height: 24, margin: '0 auto' }} /></div>
          ) : households.length === 0 ? (
            <div style={{ background: 'var(--surface)', border: '1px solid var(--border)', borderRadius: 12, padding: '20px 16px', textAlign: 'center' }}>
              <div style={{ fontSize: 28, marginBottom: 8 }}>👨‍👩‍👧</div>
              <div style={{ fontSize: 14, fontWeight: 500, marginBottom: 4 }}>Partagez listes, menus et recettes</div>
              <div style={{ fontSize: 12, color: 'var(--text-tertiary)', marginBottom: 16 }}>avec votre famille ou vos colocataires</div>
              <div style={{ display: 'flex', gap: 8 }}>
                <button className="btn-primary small" style={{ flex: 1 }} onClick={() => { setShowCreate(true); setShowJoin(false); setHouseholdError('') }}>+ Créer un foyer</button>
                <button className="btn-outline small" style={{ flex: 1 }} onClick={() => { setShowJoin(true); setShowCreate(false); setHouseholdError('') }}>Rejoindre</button>
              </div>
            </div>
          ) : (
            <div style={{ display: 'flex', flexDirection: 'column', gap: 12 }}>
              {households.map(h => (
                <div key={h.id} style={{ borderRadius: 12, border: '1px solid var(--border)', overflow: 'hidden', borderLeft: `4px solid ${h.color}` }}>
                  <div style={{ padding: '12px 14px', background: 'var(--surface)' }}>
                    <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: 8 }}>
                      {renamingId === h.id ? (
                        <div style={{ display: 'flex', gap: 6, flex: 1 }}>
                          <input className="form-input" style={{ flex: 1, margin: 0, fontSize: 14 }} value={renameValue} onChange={e => setRenameValue(e.target.value)} onKeyDown={e => e.key === 'Enter' && handleRename(h)} autoFocus />
                          <button className="btn-primary small" onClick={() => handleRename(h)}>OK</button>
                          <button className="btn-outline small" onClick={() => setRenamingId(null)}>✕</button>
                        </div>
                      ) : (
                        <>
                          <span style={{ fontWeight: 700, fontSize: 15 }}>{h.name}</span>
                          <span style={{ fontSize: 11, color: 'var(--text-tertiary)', background: 'var(--surface-2,var(--border))', padding: '2px 8px', borderRadius: 99 }}>
                            {h.role === 'owner' ? 'Propriétaire' : 'Membre'}
                          </span>
                        </>
                      )}
                    </div>

                    {/* Code d'invitation (owner uniquement) */}
                    {h.role === 'owner' && (
                      <div style={{ display: 'flex', gap: 6, alignItems: 'center', marginBottom: 10, flexWrap: 'wrap' }}>
                        <span style={{ fontSize: 13, color: 'var(--text-secondary)' }}>Code :</span>
                        <code style={{ fontSize: 14, fontWeight: 700, letterSpacing: 2, background: 'var(--surface-2,var(--border))', padding: '2px 8px', borderRadius: 6 }}>{h.invite_code}</code>
                        <button className="btn-icon small" title="Copier" onClick={() => { navigator.clipboard.writeText(h.invite_code); showHToast('Code copié !') }}>📋</button>
                        <button className="btn-icon small" title="Regénérer" onClick={() => handleRegenerate(h)}>🔄</button>
                        <button className="btn-outline small" onClick={() => shareCode(h)}>📤 Partager</button>
                      </div>
                    )}

                    {/* Membres */}
                    <div style={{ fontSize: 12, color: 'var(--text-tertiary)', marginBottom: 8 }}>Membres ({h.members.length})</div>
                    <div style={{ display: 'flex', flexDirection: 'column', gap: 4 }}>
                      {h.members.map(m => (
                        <div key={m.user_id} style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
                          <span style={{ fontSize: 13 }}>
                            👤 {m.pseudo} {m.role === 'owner' ? '· Propriétaire' : '· Membre'}
                          </span>
                          {h.role === 'owner' && m.role !== 'owner' && (
                            <button className="btn-icon small delete" title="Retirer" onClick={() => removeMember(h.id, m.user_id)}>✕</button>
                          )}
                        </div>
                      ))}
                    </div>

                    {/* Actions */}
                    <div style={{ display: 'flex', gap: 8, marginTop: 12, flexWrap: 'wrap' }}>
                      {h.role === 'owner' && (
                        <>
                          <button className="btn-outline small" onClick={() => { setRenamingId(h.id); setRenameValue(h.name) }}>Renommer</button>
                          <button className="btn-outline small" style={{ color: 'var(--error)' }} onClick={() => handleDelete(h)}>Supprimer</button>
                        </>
                      )}
                      {h.role === 'member' && (
                        <button className="btn-outline small" style={{ color: 'var(--error)' }} onClick={() => handleLeave(h)}>Quitter ce foyer</button>
                      )}
                    </div>
                  </div>
                </div>
              ))}
            </div>
          )}

          {/* Formulaires créer / rejoindre */}
          {showCreate && (
            <div style={{ marginTop: 12, background: 'var(--surface)', border: '1px solid var(--border)', borderRadius: 12, padding: 16 }}>
              <div style={{ fontWeight: 600, fontSize: 14, marginBottom: 8 }}>Créer un foyer</div>
              <input className="form-input" placeholder="ex : Famille Blum, Coloc Saint-Pierre…" value={createName} onChange={e => setCreateName(e.target.value)} onKeyDown={e => e.key === 'Enter' && handleCreate()} autoFocus />
              {householdError && <p style={{ fontSize: 12, color: 'var(--error)', margin: '6px 0 0' }}>{householdError}</p>}
              <div style={{ display: 'flex', gap: 8, marginTop: 10 }}>
                <button className="btn-primary small" style={{ flex: 1 }} onClick={handleCreate} disabled={householdLoading || !createName.trim()}>{householdLoading ? '…' : 'Créer'}</button>
                <button className="btn-outline small" style={{ flex: 1 }} onClick={() => { setShowCreate(false); setHouseholdError('') }}>Annuler</button>
              </div>
            </div>
          )}

          {showJoin && (
            <div style={{ marginTop: 12, background: 'var(--surface)', border: '1px solid var(--border)', borderRadius: 12, padding: 16 }}>
              <div style={{ fontWeight: 600, fontSize: 14, marginBottom: 8 }}>Rejoindre un foyer</div>
              <input className="form-input" placeholder="Code à 8 caractères (ex : FAMI4287)" value={joinCode} onChange={e => setJoinCode(e.target.value.toUpperCase())} onKeyDown={e => e.key === 'Enter' && handleJoin()} maxLength={8} autoFocus style={{ letterSpacing: 2, textTransform: 'uppercase' }} />
              {householdError && <p style={{ fontSize: 12, color: 'var(--error)', margin: '6px 0 0' }}>{householdError}</p>}
              <div style={{ display: 'flex', gap: 8, marginTop: 10 }}>
                <button className="btn-primary small" style={{ flex: 1 }} onClick={handleJoin} disabled={householdLoading || joinCode.length < 8}>{householdLoading ? '…' : 'Rejoindre'}</button>
                <button className="btn-outline small" style={{ flex: 1 }} onClick={() => { setShowJoin(false); setHouseholdError('') }}>Annuler</button>
              </div>
            </div>
          )}

          {households.length > 0 && (
            <div style={{ display: 'flex', gap: 8, marginTop: 12 }}>
              <button className="btn-outline small" style={{ flex: 1 }} onClick={() => { setShowCreate(v => !v); setShowJoin(false); setHouseholdError('') }}>+ Créer un nouveau foyer</button>
              <button className="btn-outline small" style={{ flex: 1 }} onClick={() => { setShowJoin(v => !v); setShowCreate(false); setHouseholdError('') }}>+ Rejoindre</button>
            </div>
          )}

          {householdToast && <div className="toast" style={{ position: 'static', marginTop: 10, textAlign: 'center' }}>{householdToast}</div>}
        </div>

        {/* Préférences */}
        <div>
          <div style={{ fontWeight: 700, fontSize: 15, marginBottom: 12 }}>Préférences</div>
          <div style={{ background: 'var(--surface)', border: '1px solid var(--border)', borderRadius: 12, overflow: 'hidden' }}>
            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: '14px 16px' }}>
              <div style={{ display: 'flex', alignItems: 'center', gap: 12 }}>
                <span style={{ fontSize: 20 }}>{isDark ? '🌙' : '☀️'}</span>
                <div>
                  <div style={{ fontWeight: 600, fontSize: 14 }}>Thème</div>
                  <div style={{ fontSize: 12, color: 'var(--text-tertiary)' }}>{isDark ? 'Mode sombre' : 'Mode clair'}</div>
                </div>
              </div>
              <button onClick={toggleTheme} style={{
                width: 44, height: 24, borderRadius: 12, border: 'none', cursor: 'pointer',
                background: isDark ? 'var(--primary)' : 'var(--border)',
                position: 'relative', transition: 'background 0.2s',
              }}>
                <span style={{
                  position: 'absolute', top: 3, left: isDark ? 22 : 3,
                  width: 18, height: 18, borderRadius: '50%',
                  background: '#fff', transition: 'left 0.2s', display: 'block',
                }} />
              </button>
            </div>
          </div>
        </div>

        {/* Sécurité — changement de mot de passe */}
        <div>
          <div style={{ fontWeight: 700, fontSize: 15, marginBottom: 12 }}>Sécurité</div>
          <div style={{ background: 'var(--surface)', border: '1px solid var(--border)', borderRadius: 12, overflow: 'hidden' }}>
            <button
              onClick={() => { setShowPwd(v => !v); setPwdError('') }}
              style={{
                width: '100%', display: 'flex', alignItems: 'center', justifyContent: 'space-between',
                padding: '14px 16px', background: 'none', border: 'none', cursor: 'pointer', textAlign: 'left',
                color: 'var(--text)',
              }}
            >
              <div style={{ display: 'flex', alignItems: 'center', gap: 12 }}>
                <span style={{ fontSize: 20 }}>🔑</span>
                <div style={{ fontWeight: 600, fontSize: 14 }}>Modifier le mot de passe</div>
              </div>
              <span style={{ fontSize: 14, color: 'var(--text-tertiary)' }}>{showPwd ? '▲' : '▼'}</span>
            </button>

            {showPwd && (
              <div style={{ padding: '0 16px 16px', display: 'flex', flexDirection: 'column', gap: 10, borderTop: '1px solid var(--border)' }}>
                {isPasswordRecovery && (
                  <div style={{ marginTop: 12, padding: '10px 12px', background: 'var(--primary)', color: '#fff', borderRadius: 8, fontSize: 13 }}>
                    🔑 Définissez votre nouveau mot de passe ci-dessous.
                  </div>
                )}
                {!isPasswordRecovery && (
                  <input
                    className="form-input"
                    type="password"
                    placeholder="Mot de passe actuel"
                    value={pwdCurrent}
                    onChange={e => { setPwdCurrent(e.target.value); setPwdError('') }}
                    style={{ marginTop: 12 }}
                  />
                )}
                <input
                  className="form-input"
                  type="password"
                  placeholder="Nouveau mot de passe (8 car. min.)"
                  value={pwdNew}
                  onChange={e => { setPwdNew(e.target.value); setPwdError('') }}
                  autoFocus={isPasswordRecovery}
                  style={isPasswordRecovery ? { marginTop: 0 } : {}}
                />
                <input
                  className="form-input"
                  type="password"
                  placeholder="Confirmer le nouveau mot de passe"
                  value={pwdConfirm}
                  onChange={e => { setPwdConfirm(e.target.value); setPwdError('') }}
                />
                {pwdError && <div style={{ fontSize: 12, color: 'var(--error)' }}>{pwdError}</div>}
                <div style={{ display: 'flex', gap: 8 }}>
                  <button className="btn-primary" style={{ flex: 1 }} onClick={handlePasswordSave} disabled={pwdSaving}>
                    {pwdSaving ? 'Enregistrement…' : 'Enregistrer'}
                  </button>
                  {!isPasswordRecovery && (
                    <button className="btn-outline" style={{ flex: 1 }} onClick={() => { setShowPwd(false); setPwdError(''); setPwdCurrent(''); setPwdNew(''); setPwdConfirm('') }}>
                      Annuler
                    </button>
                  )}
                </div>
              </div>
            )}
          </div>
        </div>

        {/* Compte */}
        {onSignOut && (
          <div>
            <div style={{ fontWeight: 700, fontSize: 15, marginBottom: 12 }}>Compte</div>
            <div style={{ background: 'var(--surface)', border: '1px solid var(--border)', borderRadius: 12, overflow: 'hidden' }}>
              <button
                onClick={onSignOut}
                style={{
                  width: '100%', display: 'flex', alignItems: 'center', gap: 12,
                  padding: '14px 16px', background: 'none', border: 'none',
                  cursor: 'pointer', textAlign: 'left', color: 'var(--error)',
                }}
              >
                <span style={{ fontSize: 20 }}>⎋</span>
                <div style={{ fontWeight: 600, fontSize: 14 }}>Se déconnecter</div>
              </button>
            </div>
          </div>
        )}

      </div>

      {toast && <div className="toast">{toast}</div>}
    </div>
  )
}
