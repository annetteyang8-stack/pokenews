-- Additional Costco Canada restock sightings supplied by the user.
-- Two rows from the supplied list (Mar 28 2025 BC "151 mini tins" and Sep 3 2025 ON
-- "Holiday Calendar") already exist from the original seed and are intentionally omitted here.

insert into public.costco_restock_sightings (sighted_date, item, region, location_type, set_name) values
  ('2024-04-05', 'Scarlet & Violet Paldea Friends Mini Tins', 'BC', 'in-warehouse', null),
  ('2025-09-09', '2026 Holiday Calendar', 'ON', 'in-warehouse', 'Pokemon TCG: Holiday Calendar 2025'),
  ('2026-09-12', '2025 Holiday Calendar', 'BC', 'in-warehouse', 'Pokemon TCG: Holiday Calendar 2025'),
  ('2025-09-18', 'Surging Sparks Bundle', null, 'in-warehouse', 'Surging Sparks'),
  ('2025-09-19', 'Surging Sparks Bundle', null, 'in-warehouse', 'Surging Sparks'),
  ('2025-09-20', 'Surging Sparks Bundle', null, 'in-warehouse', 'Surging Sparks'),
  ('2025-09-21', 'Surging Sparks Bundle', null, 'in-warehouse', 'Surging Sparks'),
  ('2025-09-22', 'Surging Sparks Bundle', null, 'in-warehouse', 'Surging Sparks'),
  ('2025-09-23', 'Surging Sparks Bundle', null, 'in-warehouse', 'Surging Sparks'),
  ('2025-10-14', 'Prismatic Evolutions Mini Tins', null, 'in-warehouse', 'Scarlet & Violet: Prismatic Evolutions'),
  ('2025-11-27', 'Prismatic Evolutions Bundle', null, 'in-warehouse', 'Scarlet & Violet: Prismatic Evolutions'),
  ('2026-02-21', 'Unova Heavy Hitters Collection', 'ON', 'in-warehouse', 'Scarlet & Violet: Black Bolt'),
  ('2026-02-24', 'Unova Heavy Hitters Collection', 'BC', 'in-warehouse', 'Scarlet & Violet: Black Bolt'),
  ('2026-02-26', 'Mega Charizard UPC', null, 'in-warehouse', 'Phantasmal Flames'),
  ('2026-03-11', 'Pokemon', 'ON', 'in-warehouse', null),
  ('2026-03-24', 'Pokeball Tins', 'BC', 'in-warehouse', null),
  ('2026-03-27', 'Pokeball Tins', 'BC', 'in-warehouse', null),
  ('2026-04-10', 'Prismatic Evolutions SPC', 'ON', 'in-warehouse', 'Scarlet & Violet: Prismatic Evolutions Super-Premium Collection'),
  ('2026-04-12', 'Prismatic Evolutions SPC', 'BC', 'in-warehouse', 'Scarlet & Violet: Prismatic Evolutions Super-Premium Collection'),
  ('2026-04-24', 'Ascended Heroes ex Box Bundle', null, 'in-warehouse', 'Mega Evolution: Ascended Heroes Booster Bundle');
