import { useState, useEffect } from 'react'
import type { ShoppingList } from '../types'
import { shareListWithPseudo, getListShares, removeListShare, createInviteLink } from '../store'

interface Props {
  list: ShoppingList | undefined
  isOpen: boolean
  onClose: () => void
}

export default function ShareListModal({ list, isOpen, onClose }: Props) {
  const [shareInput, setShareInput] = useState('')
  const [shareError, setShareError] = useState('')
  const [shareLoading, setShareLoading] = useState(false)
  const [shareToast, setShareToast] = useState('')
  const [sharedWith, setSharedWith] = useState<{ user_id: string; display_name: string }[]>([])
  const [inviteLink, setInviteLink] = useState('')
  const [inviteLinkLoading, setInviteLinkLoading] = useState(false)

  const isMobile = /iPhone|iPad|iPod|Android/i.test(navigator.userAgent)

  useEffect(() => {
    if (!isOpen || !list) return
    setShareInput('')
    setShareError('')
    setInviteLink('')
    setShareToast('')
    getListShares(list.id).then(setSharedWith).catch(console.error)
    setInviteLinkLoading(true)
    createInviteLink(list.id)
      .then(setInviteLink)
      .catch(console.error)
      .finally(() => setInviteLinkLoading(false))
  }, [isOpen, list?.id])

  if (!isOpen || !list) return null

  const getInviteText = () =>
    `🛒 ${list.name} — rejoins ma liste sur Mes Recettes !\n${inviteLink}`

  const showToast = (msg: string) => {
    setShareToast(msg)
    setTimeout(() => setShareToast(''), 2500)
  }

  const handleNativeShare = async () => {
    if (!inviteLink) return
    if (navigator.share) {
      try {
        await navigator.share({ title: list.name, text: `Rejoins ma liste "${list.name}" sur Mes Recettes !`, url: inviteLink })
      } catch { /* annulé */ }
    } else {
      try { await navigator.clipboard.writeText(inviteLink) } catch { /* ignore */ }
      showToast('Lien copié !')
    }
  }

  const handleCopyLink = async () => {
    if (!inviteLink) return
    try { await navigator.clipboard.writeText(inviteLink) } catch { /* ignore */ }
    showToast('Lien copié !')
  }

  const handleShareWhatsApp = () => {
    if (!inviteLink) return
    window.open(`https://wa.me/?text=${encodeURIComponent(getInviteText())}`, '_blank', 'noopener')
  }

  const handleShareSMS = () => {
    if (!inviteLink) return
    const sep = /iPhone|iPad|iPod/.test(navigator.userAgent) ? '&' : '?'
    window.location.href = `sms:${sep}body=${encodeURIComponent(getInviteText())}`
  }

  const handleShareMessenger = () => {
    if (!inviteLink) return
    if (isMobile) {
      window.location.href = `fb-messenger://share/?link=${encodeURIComponent(inviteLink)}`
    } else {
      window.open(`https://www.facebook.com/dialog/send?link=${encodeURIComponent(inviteLink)}&redirect_uri=${encodeURIComponent(inviteLink)}`, '_blank', 'noopener')
    }
  }

  const handleShare = async () => {
    if (!shareInput.trim()) return
    setShareLoading(true)
    setShareError('')
    try {
      await shareListWithPseudo(list.id, shareInput.trim())
      const updated = await getListShares(list.id)
      setSharedWith(updated)
      const pseudo = shareInput.trim()
      setShareInput('')
      showToast(`Partagé avec @${pseudo} !`)
    } catch (e) {
      setShareError(e instanceof Error ? e.message : 'Erreur')
    } finally {
      setShareLoading(false)
    }
  }

  const handleRemoveShare = async (userId: string) => {
    await removeListShare(list.id, userId)
    setSharedWith(prev => prev.filter(s => s.user_id !== userId))
  }

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="modal-card" onClick={e => e.stopPropagation()} style={{ maxHeight: '85vh', overflowY: 'auto' }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 16 }}>
          <h2 style={{ margin: 0, fontSize: 18 }}>Partager la liste</h2>
          <button className="btn-icon" onClick={onClose}>×</button>
        </div>

        {/* Section 1 : lien d'invitation */}
        <div style={{ marginBottom: 20 }}>
          <div style={{ fontWeight: 700, fontSize: 13, color: 'var(--text-tertiary)', textTransform: 'uppercase', letterSpacing: '0.05em', marginBottom: 12 }}>
            Lien d'invitation
          </div>
          <p style={{ fontSize: 12, color: 'var(--text-tertiary)', marginBottom: 10 }}>
            Partagez ce lien — la personne sera guidée vers l'app et la liste sera automatiquement partagée.
          </p>

          <div style={{ display: 'flex', gap: 8, marginBottom: 12 }}>
            <div style={{ flex: 1, background: 'var(--surface)', border: '1px solid var(--border)', borderRadius: 8, padding: '9px 12px', fontSize: 12, color: 'var(--text-secondary)', overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>
              {inviteLinkLoading ? '⏳ Génération du lien…' : inviteLink || '—'}
            </div>
            <button
              onClick={handleCopyLink}
              disabled={!inviteLink}
              style={{ padding: '9px 14px', background: 'var(--primary)', color: '#fff', border: 'none', borderRadius: 8, cursor: inviteLink ? 'pointer' : 'not-allowed', fontSize: 13, fontWeight: 600, opacity: inviteLink ? 1 : 0.5, whiteSpace: 'nowrap' }}
            >
              📋 Copier
            </button>
          </div>

          <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 8 }}>
            <button onClick={handleShareWhatsApp} disabled={!inviteLink} style={{
              display: 'flex', alignItems: 'center', gap: 10, padding: '11px 14px',
              background: '#25D366', color: '#fff', border: 'none', borderRadius: 10, cursor: inviteLink ? 'pointer' : 'not-allowed', fontSize: 14, fontWeight: 600, opacity: inviteLink ? 1 : 0.5,
            }}>
              <svg width="20" height="20" viewBox="0 0 24 24" fill="white"><path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413z"/></svg>
              WhatsApp
            </button>
            <button onClick={handleShareSMS} disabled={!inviteLink} style={{
              display: 'flex', alignItems: 'center', gap: 10, padding: '11px 14px',
              background: '#34C759', color: '#fff', border: 'none', borderRadius: 10, cursor: inviteLink ? 'pointer' : 'not-allowed', fontSize: 14, fontWeight: 600, opacity: inviteLink ? 1 : 0.5,
            }}>
              <svg width="20" height="20" viewBox="0 0 24 24" fill="white"><path d="M20 2H4c-1.1 0-2 .9-2 2v18l4-4h14c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm-2 12H6v-2h12v2zm0-3H6V9h12v2zm0-3H6V6h12v2z"/></svg>
              SMS
            </button>
            <button onClick={handleShareMessenger} disabled={!inviteLink} style={{
              display: 'flex', alignItems: 'center', gap: 10, padding: '11px 14px',
              background: '#0084FF', color: '#fff', border: 'none', borderRadius: 10, cursor: inviteLink ? 'pointer' : 'not-allowed', fontSize: 14, fontWeight: 600, opacity: inviteLink ? 1 : 0.5,
            }}>
              <svg width="20" height="20" viewBox="0 0 24 24" fill="white"><path d="M12 0C5.373 0 0 4.974 0 11.111c0 3.498 1.744 6.614 4.469 8.652V24l4.088-2.242c1.092.3 2.246.464 3.443.464 6.627 0 12-4.975 12-11.111C24 4.974 18.627 0 12 0zm1.191 14.963l-3.055-3.26-5.963 3.26L10.732 8l3.131 3.259L19.752 8l-6.561 6.963z"/></svg>
              Messenger
            </button>
            <button onClick={handleNativeShare} disabled={!inviteLink} style={{
              display: 'flex', alignItems: 'center', gap: 10, padding: '11px 14px',
              background: 'var(--surface)', color: 'var(--text)', border: '1px solid var(--border)', borderRadius: 10, cursor: inviteLink ? 'pointer' : 'not-allowed', fontSize: 14, fontWeight: 600, opacity: inviteLink ? 1 : 0.5,
            }}>
              <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M18 16.08c-.76 0-1.44.3-1.96.77L8.91 12.7c.05-.23.09-.46.09-.7s-.04-.47-.09-.7l7.05-4.11c.54.5 1.25.81 2.04.81 1.66 0 3-1.34 3-3s-1.34-3-3-3-3 1.34-3 3c0 .24.04.47.09.7L8.04 9.81C7.5 9.31 6.79 9 6 9c-1.66 0-3 1.34-3 3s1.34 3 3 3c.79 0 1.5-.31 2.04-.81l7.12 4.16c-.05.21-.08.43-.08.65 0 1.61 1.31 2.92 2.92 2.92s2.92-1.31 2.92-2.92-1.31-2.92-2.92-2.92z"/></svg>
              {typeof navigator !== 'undefined' && 'share' in navigator ? 'Partager' : 'Copier'}
            </button>
          </div>
          {shareToast && <p style={{ color: 'var(--success, #22c55e)', fontSize: 13, marginTop: 8, textAlign: 'center' }}>{shareToast}</p>}
        </div>

        <div style={{ borderTop: '1px solid var(--border)', marginBottom: 16 }} />

        {/* Section 2 : partage par pseudo */}
        <div>
          <div style={{ fontWeight: 700, fontSize: 13, color: 'var(--text-tertiary)', textTransform: 'uppercase', letterSpacing: '0.05em', marginBottom: 12 }}>
            Partager avec un membre de l'app
          </div>
          <p style={{ fontSize: 12, color: 'var(--text-tertiary)', marginBottom: 10 }}>
            La personne invitée pourra voir et modifier cette liste.
          </p>
          <div style={{ display: 'flex', gap: 8 }}>
            <div style={{ position: 'relative', flex: 1 }}>
              <span style={{ position: 'absolute', left: 10, top: '50%', transform: 'translateY(-50%)', color: 'var(--text-tertiary)' }}>@</span>
              <input
                className="form-input"
                style={{ paddingLeft: 22, margin: 0 }}
                placeholder="pseudo"
                value={shareInput}
                onChange={e => { setShareInput(e.target.value); setShareError('') }}
                onKeyDown={e => e.key === 'Enter' && handleShare()}
              />
            </div>
            <button className="btn-primary" onClick={handleShare} disabled={shareLoading || !shareInput.trim()}>
              {shareLoading ? '…' : 'Inviter'}
            </button>
          </div>
          {shareError && <p style={{ color: 'var(--error)', fontSize: 13, marginTop: 8 }}>{shareError}</p>}

          {sharedWith.length > 0 && (
            <div style={{ marginTop: 16 }}>
              <div style={{ fontWeight: 600, fontSize: 13, marginBottom: 8 }}>Partagé avec</div>
              {sharedWith.map(s => (
                <div key={s.user_id} style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: '8px 0', borderBottom: '1px solid var(--border)' }}>
                  <span style={{ fontSize: 14 }}>@{s.display_name}</span>
                  <button className="btn-icon small delete" onClick={() => handleRemoveShare(s.user_id)}>×</button>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
