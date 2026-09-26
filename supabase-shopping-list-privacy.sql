-- Listes de courses privées / rattachées à un foyer au choix
--
-- Avant cette migration, shopping_lists n'avait pas de colonne household_id/
-- is_private (contrairement à ce que src/types.ts laissait croire) : une
-- policy RLS partageait automatiquement TOUTES les listes d'un utilisateur
-- avec tous les membres de ses foyers, sans exception possible. Cette
-- migration ajoute les colonnes et remplace les policies SELECT par une
-- règle explicite : une liste n'est visible par les autres membres d'un
-- foyer que si elle lui est explicitement rattachée (household_id) et non
-- marquée privée.

alter table shopping_lists add column household_id uuid references households(id) on delete set null;
alter table shopping_lists add column is_private boolean not null default false;

drop policy if exists "Users can view household shopping lists" on shopping_lists;
drop policy if exists "lists_select" on shopping_lists;
drop policy if exists "shopping_lists_shared_read" on shopping_lists;
drop policy if exists "lists_insert" on shopping_lists;
drop policy if exists "lists_update" on shopping_lists;

create policy "lists_select" on shopping_lists for select
  using (
    auth.uid() = user_id
    or (
      household_id is not null
      and not is_private
      and household_id in (
        select household_id from household_members
        where user_id = auth.uid() and status = 'accepted'
      )
    )
    or id in (
      select list_id from shopping_list_shares where invited_user_id = auth.uid()
    )
  );

-- Un utilisateur ne peut rattacher une liste qu'à un foyer dont il est
-- membre accepté (défense en profondeur : la policy select l'empêcherait
-- déjà de tirer parti d'un rattachement arbitraire, mais autant l'interdire
-- dès l'écriture).
create policy "lists_insert" on shopping_lists for insert
  with check (
    auth.uid() = user_id
    and (
      household_id is null
      or household_id in (
        select household_id from household_members
        where user_id = auth.uid() and status = 'accepted'
      )
    )
  );

create policy "lists_update" on shopping_lists for update
  using (auth.uid() = user_id)
  with check (
    auth.uid() = user_id
    and (
      household_id is null
      or household_id in (
        select household_id from household_members
        where user_id = auth.uid() and status = 'accepted'
      )
    )
  );

-- lists_delete (auth.uid() = user_id) reste inchangée.
