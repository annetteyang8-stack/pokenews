-- Costco Canada Pokémon restock sightings — broader "someone saw this in stock" evidence,
-- distinct from the user's personal purchases table (a sighting isn't necessarily a purchase,
-- and can come from any region, e.g. tracking BC vs ON lag). Feeds the likelihood model.

create table public.costco_restock_sightings (
  id uuid primary key default gen_random_uuid(),
  sighted_date date not null,
  item text not null,
  region text,
  location_type text,
  set_name text references public.known_releases (name) on update cascade on delete set null,
  notes text,
  created_at timestamptz not null default now()
);

alter table public.costco_restock_sightings enable row level security;

create policy "public read access" on public.costco_restock_sightings for select using (true);
create policy "public write access" on public.costco_restock_sightings
  for insert to anon with check (true);
create policy "public update access" on public.costco_restock_sightings
  for update to anon using (true) with check (true);
create policy "public delete access" on public.costco_restock_sightings
  for delete to anon using (true);

insert into public.costco_restock_sightings (sighted_date, item, region, location_type, set_name) values
  ('2025-03-28', 'Pokemon 151 mini tins', 'BC', 'in-warehouse', 'Scarlet & Violet: 151'),
  ('2025-06-21', 'Pokemon Prismatic Evolution bundle', 'ON', 'in-warehouse', 'Scarlet & Violet: Prismatic Evolutions'),
  ('2025-09-03', 'Pokemon Holiday Calendar', 'ON', 'in-warehouse', 'Pokemon TCG: Holiday Calendar 2025'),
  ('2025-09-09', 'Pokemon Holiday Calendar', 'BC', 'in-warehouse', 'Pokemon TCG: Holiday Calendar 2025');
