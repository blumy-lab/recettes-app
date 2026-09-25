-- Households
create table households (
  id uuid primary key default gen_random_uuid(),
  name text not null default 'Mon foyer',
  created_by uuid references auth.users(id) on delete cascade not null,
  created_at timestamptz default now()
);

-- Household members
create table household_members (
  id uuid primary key default gen_random_uuid(),
  household_id uuid references households(id) on delete cascade not null,
  user_id uuid references auth.users(id) on delete cascade not null,
  role text not null default 'member', -- 'admin' | 'member'
  status text not null default 'pending', -- 'pending' | 'accepted'
  invited_email text,
  created_at timestamptz default now(),
  unique(household_id, user_id)
);

-- Add household_id to recipes
alter table recipes add column household_id uuid references households(id) on delete set null;

-- Add household_id to shopping_items
alter table shopping_items add column household_id uuid references households(id) on delete set null;

-- RLS
alter table households enable row level security;
alter table household_members enable row level security;

-- Households: visible aux membres
create policy "household_select" on households for select
  using (
    id in (
      select household_id from household_members
      where user_id = auth.uid() and status = 'accepted'
    )
    or created_by = auth.uid()
  );

-- Households: créé par l'utilisateur connecté
create policy "household_insert" on households for insert
  with check (created_by = auth.uid());

-- Households: modifiable par le créateur
create policy "household_update" on households for update
  using (created_by = auth.uid());

-- Households: supprimable par le créateur
create policy "household_delete" on households for delete
  using (created_by = auth.uid());

-- Members: visibles par les membres du foyer
create policy "members_select" on household_members for select
  using (
    household_id in (
      select household_id from household_members
      where user_id = auth.uid()
    )
    or user_id = auth.uid()
  );

-- Members: l'admin peut inviter
create policy "members_insert" on household_members for insert
  with check (
    household_id in (
      select id from households where created_by = auth.uid()
    )
  );

-- Members: l'utilisateur peut accepter son invitation
create policy "members_update" on household_members for update
  using (user_id = auth.uid());

-- Members: l'admin peut retirer un membre
create policy "members_delete" on household_members for delete
  using (
    user_id = auth.uid()
    or household_id in (
      select id from households where created_by = auth.uid()
    )
  );

-- Recettes: visibles si dans le foyer de l'utilisateur OU propriétaire
drop policy if exists "own_recipes" on recipes;
create policy "recipes_select" on recipes for select
  using (
    user_id = auth.uid()
    or household_id in (
      select household_id from household_members
      where user_id = auth.uid() and status = 'accepted'
    )
  );

create policy "recipes_insert" on recipes for insert
  with check (user_id = auth.uid());

create policy "recipes_update" on recipes for update
  using (user_id = auth.uid());

-- Seul le créateur peut supprimer
create policy "recipes_delete" on recipes for delete
  using (user_id = auth.uid());

-- Courses: visibles si dans le foyer OU propriétaire
drop policy if exists "own_shopping" on shopping_items;
create policy "shopping_select" on shopping_items for select
  using (
    user_id = auth.uid()
    or household_id in (
      select household_id from household_members
      where user_id = auth.uid() and status = 'accepted'
    )
  );

create policy "shopping_insert" on shopping_items for insert
  with check (user_id = auth.uid());

create policy "shopping_update" on shopping_items for update
  using (
    user_id = auth.uid()
    or household_id in (
      select household_id from household_members
      where user_id = auth.uid() and status = 'accepted'
    )
  );

create policy "shopping_delete" on shopping_items for delete
  using (
    user_id = auth.uid()
    or household_id in (
      select household_id from household_members
      where user_id = auth.uid() and status = 'accepted'
    )
  );
