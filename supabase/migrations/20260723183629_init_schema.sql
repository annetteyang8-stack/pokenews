-- Pokémon Command Centre schema: purchases, known releases, and Pokémon Center watch findings.
-- All tables are public-readable (anon SELECT) since this is hobby stock/price data, not sensitive.
-- Writes are restricted to the service role (used by GitHub Actions / trusted scripts only).

create table public.known_releases (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  release_date date not null,
  created_at timestamptz not null default now()
);

create table public.purchases (
  id uuid primary key default gen_random_uuid(),
  supplier text not null,
  item text not null,
  set_name text references public.known_releases (name) on update cascade on delete set null,
  type text not null check (type in ('preorder', 'restock')),
  transaction_date date not null,
  price numeric,
  created_at timestamptz not null default now()
);

create table public.pokemon_center_findings (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  url text not null,
  source text,
  snippet text,
  detected_at timestamptz not null default now(),
  created_at timestamptz not null default now()
);

alter table public.known_releases enable row level security;
alter table public.purchases enable row level security;
alter table public.pokemon_center_findings enable row level security;

create policy "public read access" on public.known_releases for select using (true);
create policy "public read access" on public.purchases for select using (true);
create policy "public read access" on public.pokemon_center_findings for select using (true);
