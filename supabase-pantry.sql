CREATE TABLE pantry_items (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  household_id uuid REFERENCES households(id) ON DELETE CASCADE,
  name text NOT NULL,
  quantity numeric,
  unit text DEFAULT '',
  rayon text DEFAULT '',
  expires_at date,
  created_at timestamptz DEFAULT now()
);

-- RLS
ALTER TABLE pantry_items ENABLE ROW LEVEL SECURITY;

CREATE POLICY "pantry_select" ON pantry_items
  FOR SELECT USING (
    user_id = auth.uid() OR
    household_id IN (
      SELECT household_id FROM household_members
      WHERE user_id = auth.uid() AND status = 'accepted'
    )
  );

CREATE POLICY "pantry_insert" ON pantry_items
  FOR INSERT WITH CHECK (user_id = auth.uid());

CREATE POLICY "pantry_update" ON pantry_items
  FOR UPDATE USING (user_id = auth.uid());

CREATE POLICY "pantry_delete" ON pantry_items
  FOR DELETE USING (user_id = auth.uid());

-- Index
CREATE INDEX pantry_items_user_id_idx ON pantry_items(user_id);
CREATE INDEX pantry_items_household_id_idx ON pantry_items(household_id);
