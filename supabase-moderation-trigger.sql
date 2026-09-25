-- Trigger bloquant toute modification directe de moderation_status
-- vers 'approved' ou 'rejected' par un client authentifié.
-- Le service_role (auth.uid() = NULL) contourne ce trigger.

CREATE OR REPLACE FUNCTION recipes_block_moderation_override()
RETURNS trigger LANGUAGE plpgsql SECURITY DEFINER AS $$
BEGIN
  IF auth.uid() IS NOT NULL
     AND NEW.moderation_status IS DISTINCT FROM OLD.moderation_status
     AND NEW.moderation_status IN ('approved', 'rejected') THEN
    RAISE EXCEPTION 'La modération doit passer par le serveur';
  END IF;
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS recipes_enforce_moderation ON recipes;

CREATE TRIGGER recipes_enforce_moderation
  BEFORE UPDATE ON recipes
  FOR EACH ROW EXECUTE FUNCTION recipes_block_moderation_override();
