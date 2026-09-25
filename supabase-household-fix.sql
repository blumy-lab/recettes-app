-- Drop old table and recreate with nullable user_id for pending invites
drop table if exists household_members cascade;

create table household_members (
  id uuid primary key default gen_random_uuid(),
  household_id uuid references households(id) on delete cascade not null,
  user_id uuid references auth.users(id) on delete cascade,
  role text not null default 'member',
  status text not null default 'pending',
  invited_email text,
  created_at timestamptz default now()
);

alter table household_members enable row level security;

create policy "members_select" on household_members for select
  using (
    household_id in (
      select household_id from household_members
      where user_id = auth.uid()
    )
    or user_id = auth.uid()
    or invited_email = (select email from auth.users where id = auth.uid())
  );

create policy "members_insert" on household_members for insert
  with check (
    household_id in (
      select id from households where created_by = auth.uid()
    )
  );

create policy "members_update" on household_members for update
  using (
    user_id = auth.uid()
    or invited_email = (select email from auth.users where id = auth.uid())
  );

create policy "members_delete" on household_members for delete
  using (
    user_id = auth.uid()
    or household_id in (
      select id from households where created_by = auth.uid()
    )
  );
