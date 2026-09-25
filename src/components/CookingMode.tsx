import { useState, useEffect, useRef } from 'react'
import { createPortal } from 'react-dom'
import type { Recipe } from '../types'
import { parseStepDuration } from '../lib/parseStepDuration'

interface Props {
  recipe: Recipe
  onExit: () => void
}

type TimerState = 'idle' | 'running' | 'paused' | 'done'

function formatTime(seconds: number): string {
  const m = Math.floor(seconds / 60)
  const s = seconds % 60
  return `${String(m).padStart(2, '0')}:${String(s).padStart(2, '0')}`
}

export default function CookingMode({ recipe, onExit }: Props) {
  const steps = recipe.steps ?? []
  const totalSteps = steps.length

  const [currentStep, setCurrentStep] = useState(0)
  const [slideKey, setSlideKey] = useState(0)
  const [slideDir, setSlideDir] = useState<'forward' | 'back'>('forward')

  const [timerState, setTimerState] = useState<TimerState>('idle')
  const [timeLeft, setTimeLeft] = useState(0)

  const intervalRef = useRef<ReturnType<typeof setInterval> | null>(null)
  const wakeLockRef = useRef<WakeLockSentinel | null>(null)
  const touchStartRef = useRef<{ x: number; y: number } | null>(null)

  const stepDuration = parseStepDuration(steps[currentStep] ?? '')

  // ── Wake Lock ──────────────────────────────────────────────────────────────
  useEffect(() => {
    const acquire = async () => {
      if (!('wakeLock' in navigator)) return
      try { wakeLockRef.current = await navigator.wakeLock.request('screen') } catch { /* ignore */ }
    }
    acquire()
    const handleVisibility = () => { if (!document.hidden && !wakeLockRef.current) acquire() }
    document.addEventListener('visibilitychange', handleVisibility)
    return () => {
      document.removeEventListener('visibilitychange', handleVisibility)
      wakeLockRef.current?.release().catch(() => {})
    }
  }, [])

  // ── Reset timer when step changes ──────────────────────────────────────────
  useEffect(() => {
    if (intervalRef.current) clearInterval(intervalRef.current)
    intervalRef.current = null
    setTimerState('idle')
    setTimeLeft(stepDuration ?? 0)
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [currentStep])

  // ── Detect timer reaching zero ─────────────────────────────────────────────
  useEffect(() => {
    if (timeLeft === 0 && timerState === 'running') {
      if (intervalRef.current) clearInterval(intervalRef.current)
      intervalRef.current = null
      setTimerState('done')
      if (navigator.vibrate) navigator.vibrate([200, 100, 200])
    }
  }, [timeLeft, timerState])

  // ── Interval cleanup on unmount ────────────────────────────────────────────
  useEffect(() => {
    return () => { if (intervalRef.current) clearInterval(intervalRef.current) }
  }, [])

  // ── Timer controls ─────────────────────────────────────────────────────────
  const startTimer = (from?: number) => {
    if (intervalRef.current) clearInterval(intervalRef.current)
    const startFrom = from ?? stepDuration ?? 0
    setTimeLeft(startFrom)
    setTimerState('running')
    intervalRef.current = setInterval(() => {
      setTimeLeft(prev => Math.max(0, prev - 1))
    }, 1000)
  }

  const pauseTimer = () => {
    if (intervalRef.current) clearInterval(intervalRef.current)
    intervalRef.current = null
    setTimerState('paused')
  }

  const resumeTimer = () => {
    setTimerState('running')
    intervalRef.current = setInterval(() => {
      setTimeLeft(prev => Math.max(0, prev - 1))
    }, 1000)
  }

  // ── Step navigation ────────────────────────────────────────────────────────
  const navigate = (dir: 'forward' | 'back') => {
    if (dir === 'forward' && currentStep >= totalSteps - 1) return
    if (dir === 'back' && currentStep <= 0) return
    setSlideDir(dir)
    setSlideKey(k => k + 1)
    setCurrentStep(s => dir === 'forward' ? s + 1 : s - 1)
  }

  const handleTouchStart = (e: React.TouchEvent) => {
    touchStartRef.current = { x: e.touches[0].clientX, y: e.touches[0].clientY }
  }

  const handleTouchEnd = (e: React.TouchEvent) => {
    if (!touchStartRef.current) return
    const dx = touchStartRef.current.x - e.changedTouches[0].clientX
    const dy = Math.abs(touchStartRef.current.y - e.changedTouches[0].clientY)
    touchStartRef.current = null
    if (Math.abs(dx) > 50 && dy < 30) navigate(dx > 0 ? 'forward' : 'back')
  }

  const handleExit = async () => {
    if (intervalRef.current) clearInterval(intervalRef.current)
    try { await wakeLockRef.current?.release() } catch { /* ignore */ }
    wakeLockRef.current = null
    onExit()
  }

  const progress = ((currentStep + 1) / totalSteps) * 100

  return createPortal(
    <div
      className="cooking-mode"
      onTouchStart={handleTouchStart}
      onTouchEnd={handleTouchEnd}
      aria-label="Mode cuisine"
    >
      {/* Header */}
      <header className="cm-header">
        <span className="cm-step-count">Étape {currentStep + 1} / {totalSteps}</span>
        <button className="cm-exit" onClick={handleExit} aria-label="Quitter le mode cuisine">
          ✕ Quitter
        </button>
      </header>

      {/* Progress bar */}
      <div className="cm-progress" role="progressbar" aria-valuenow={currentStep + 1} aria-valuemax={totalSteps}>
        <div className="cm-progress-fill" style={{ width: `${progress}%` }} />
      </div>

      {/* Step content — keyed for slide animation */}
      <div key={slideKey} className={`cm-content cm-enter-${slideDir}`}>
        <p className="cm-step-text">{steps[currentStep]}</p>
      </div>

      {/* Timer — visible only if a duration was detected */}
      {stepDuration !== null && (
        <div className="cm-timer">
          {timerState === 'idle' && (
            <button className="cm-timer-btn" onClick={() => startTimer()}>
              ⏱ Lancer le minuteur ({formatTime(stepDuration)})
            </button>
          )}
          {timerState === 'running' && (
            <>
              <div className="cm-timer-display">{formatTime(timeLeft)}</div>
              <button className="cm-timer-btn" onClick={pauseTimer}>⏸ Pause</button>
            </>
          )}
          {timerState === 'paused' && (
            <>
              <div className="cm-timer-display">{formatTime(timeLeft)}</div>
              <button className="cm-timer-btn" onClick={resumeTimer}>▶ Reprendre</button>
            </>
          )}
          {timerState === 'done' && (
            <>
              <div className="cm-timer-display cm-timer-done">00:00</div>
              <p className="cm-timer-alert">⏰ Temps écoulé !</p>
              <button className="cm-timer-btn" onClick={() => startTimer(stepDuration)}>↺ Relancer</button>
            </>
          )}
        </div>
      )}

      {/* Navigation */}
      <nav className="cm-nav" aria-label="Navigation entre étapes">
        <button
          className="cm-nav-btn"
          onClick={() => navigate('back')}
          disabled={currentStep === 0}
        >← Précédent</button>
        <button
          className="cm-nav-btn cm-nav-next"
          onClick={() => navigate('forward')}
          disabled={currentStep === totalSteps - 1}
        >Suivant →</button>
      </nav>
    </div>,
    document.body
  )
}
