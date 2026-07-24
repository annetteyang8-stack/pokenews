-- Allow the public dashboard (using the anon key) to add/edit/delete its own
-- purchases and known_releases data directly from the browser.
--
-- Security tradeoff, chosen deliberately: this is low-stakes hobby data (a
-- personal Pokémon purchase/prediction tracker, not sensitive information),
-- and the previous version of this tool was a local file with zero
-- authentication at all. Opening write access via the anon key preserves
-- that same no-login experience. The anon key is public once this page is
-- deployed, so anyone who finds the URL and inspects the source could in
-- theory write bogus rows here — acceptable for this use case, but do not
-- reuse this pattern for anything sensitive (see pokemon_center_findings,
-- which stays write-restricted to the service_role key used by the
-- scheduled monitoring job, since that's fed by an automated process, not
-- a human using the dashboard).

create policy "public write access" on public.purchases
  for insert to anon with check (true);
create policy "public update access" on public.purchases
  for update to anon using (true) with check (true);
create policy "public delete access" on public.purchases
  for delete to anon using (true);

create policy "public write access" on public.known_releases
  for insert to anon with check (true);
create policy "public update access" on public.known_releases
  for update to anon using (true) with check (true);
create policy "public delete access" on public.known_releases
  for delete to anon using (true);
