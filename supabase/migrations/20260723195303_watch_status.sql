-- Single-row status table tracking when the Pokémon Center watch routine last ran
-- and when it last found something new (vs. just finding nothing changed).

create table public.pokemon_center_status (
  id boolean primary key default true,
  last_checked_at timestamptz,
  last_changed_at timestamptz,
  constraint single_row check (id)
);

insert into public.pokemon_center_status (id, last_checked_at, last_changed_at)
values (true, null, null);

alter table public.pokemon_center_status enable row level security;

create policy "public read access" on public.pokemon_center_status for select using (true);
