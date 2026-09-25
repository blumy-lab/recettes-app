-- Recipes table
create table recipes (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete cascade not null,
  title text not null,
  source_url text default '',
  image_url text,
  servings integer,
  prep_time integer,
  cook_time integer,
  ingredients jsonb default '[]'::jsonb,
  steps jsonb default '[]'::jsonb,
  created_at timestamptz default now()
);

-- Shopping items table
create table shopping_items (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete cascade not null,
  name text not null,
  quantity text default '',
  unit text default '',
  checked boolean default false,
  rayon text default 'Autre',
  recipe_id uuid,
  recipe_title text,
  created_at timestamptz default now()
);

-- Enable Row Level Security
alter table recipes enable row level security;
alter table shopping_items enable row level security;

-- RLS policies: each user sees only their own data
create policy "own_recipes" on recipes for all using (auth.uid() = user_id);
create policy "own_shopping" on shopping_items for all using (auth.uid() = user_id);
