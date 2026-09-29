-- Zone de saisonnalité choisie par l'utilisateur (Réunion / Métropole)
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS season_zone text NOT NULL DEFAULT 'reunion'
  CHECK (season_zone IN ('reunion', 'metropole'));
