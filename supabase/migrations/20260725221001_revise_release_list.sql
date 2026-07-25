-- Replace the release calendar with the user-supplied 2024-2026 list.
-- Renames use UPDATE (by id) rather than delete+insert wherever a sighting references the
-- old name, since ON UPDATE CASCADE on costco_restock_sightings.set_name auto-follows renames
-- but a delete would null the link out permanently.
--
-- Kept deliberately: 'Scarlet & Violet: 151' (2023-09-22) is not in the new list (which starts
-- at 2024) but is referenced by a real sighting (the 151 mini tins), so it stays untouched.
--
-- Kept deliberately distinct: "Charizard ex special collection" appears twice in the supplied
-- list (Apr 7 2025 and Jun 27 2025) with identical text, which collides with the UNIQUE
-- constraint on name — kept the existing "(April 2025)" / "(June 2025)" disambiguation.

-- Renames of entries referenced by sightings (FK-critical — must be UPDATE, not delete+insert)
update public.known_releases set name = 'Scarlet & Violet - Prismatic Evolutions' where id = '94470765-eadc-4cb3-82fd-f6699a29ad53';
update public.known_releases set name = 'Scarlet & Violet - Surging Sparks' where id = '7d1c710c-67de-4077-9ff7-bd51e1f59cd0';
update public.known_releases set name = 'Holiday Calendar 2025' where id = '426ac6dd-bd7e-4f2c-85e3-f4e470c61c4c';
update public.known_releases set name = 'Mega Evolution - Phantasmal Flames' where id = '9c5b77e3-e989-4568-a51a-e464fb994e0e';
update public.known_releases set name = 'Scarlet & Violet - Black Bolt White Flare' where id = '88d8f811-d7bd-4343-a124-4d71f14c114c';
update public.known_releases set name = 'Scarlet & Violet - Prismatic Evolutions SPC' where id = 'a5eeca9d-42ad-45a6-ae4b-e4ca8dfbbd01';
update public.known_releases set name = 'Mega Evolution - Ascending Heroes booster bundle' where id = '4f426c5c-37f9-490d-a2ca-1322077f0286';

-- Renames / date corrections of entries not referenced by sightings (updated in place to
-- minimize churn, but a delete+insert would have been just as safe here)
update public.known_releases set name = 'Scarlet & Violet - Journey Together' where id = 'b6624418-c76b-4c1d-a3d4-cb74bc194aef';
update public.known_releases set name = 'Scarlet & Violet - Blooming Waters premium' where id = '0405b805-24aa-4ea8-a905-12eca4cd05f7';
update public.known_releases set name = 'Scarlet & Violet - Destined Rivals' where id = '2f27bf71-a3cf-416a-9537-d79dd1dea231';
update public.known_releases set name = 'Team Rocket''s Mewtwo ex box' where id = 'bca64719-843f-4bf4-b5f3-441413c13d56';
update public.known_releases set name = 'Cynthia''s Garchomp ex premium collection' where id = 'e6c336a6-5937-4463-abf9-7f630f3286aa';
update public.known_releases set name = 'Charizard ex special collection (April 2025)' where id = '273109b2-226b-436c-90f0-8dcb39de9ed4';
update public.known_releases set name = 'Charizard ex special collection (June 2025)' where id = '320eb98e-c001-4092-9027-fa653b65ad52';
update public.known_releases set name = 'Iono''s Bellibolt ex special collection' where id = 'ea036763-8158-4bce-aaff-63a9feee3a3b';
update public.known_releases set name = 'Slashing Legends tins' where id = '1d60a68c-1146-4e02-bb27-36febebf4789';
update public.known_releases set name = 'Team Rocket tins' where id = '92f6a960-5290-4f6b-927b-19f585d59647';
update public.known_releases set name = 'Mega Evolution', release_date = '2025-09-26' where id = 'ad6ca0cf-69da-442c-b7c6-f1296bfe4ad3';
update public.known_releases set name = 'Mega Evolution - Ascending Heroes booster box' where id = '84ba6a17-7173-43b4-9688-a363d108a04f';
update public.known_releases set name = 'Mega Evolution - Ascending Heroes ETB tins' where id = 'e5bbd002-7c3c-428c-8470-8e3ba88e8c90';
update public.known_releases set name = 'Mega Evolution - Perfect Order', release_date = '2026-03-27' where id = 'af741cf3-f460-4084-805e-289076c7bf69';
update public.known_releases set name = 'Mega Evolution - Chaos Rising' where id = '0064016f-87ca-4b33-bd80-4c88c4e87219';
update public.known_releases set name = 'Lumiose City mini tin' where id = '0b0714a7-0560-41c9-86bc-f22312af55ea';
update public.known_releases set name = 'Mega Evolution - Pitch Black' where id = 'c16853b0-c0ce-4979-a048-4bb3ea0c48c7';
update public.known_releases set name = '30th Celebration Anniversary Set' where id = '26fdcddd-18ff-4c80-8090-faf17aabcdd4';
update public.known_releases set name = '30th Celebration mini tin' where id = '759a8d27-7ec4-435e-824b-8acfb014f3ae';
update public.known_releases set name = '30th Celebration Espeon Umbreon battle decks' where id = '0adc028f-42c8-4489-bd0b-8e3c8641195d';
update public.known_releases set name = '30th Celebration premium collection' where id = '24d05bbd-1cd9-4aa2-ad74-977c4353c7f3';
update public.known_releases set name = 'Delta Reign' where id = 'a86698fb-5323-48cd-a9c2-ca494e4a0e04';
update public.known_releases set name = '30th Celebration tins' where id = '6239bc45-5706-4c7d-9f9c-c6df04a54ab7';

-- Entries not in the new list and not referenced by any sighting — safe to delete
delete from public.known_releases where id in (
  'ab25d412-206b-430c-98ad-0505767e9422', -- Azure Legends Tin Cases
  'bd020e3f-aa9f-40e8-a89c-d190001b1c8b', -- Stacking Tin Displays
  '936a0ea5-ecf9-4dc3-8a95-cb7cfcc9fa7b', -- 2024 World Championship Decks
  '0196dff7-9525-4960-a2bf-862f8e409fb8', -- Hop's Zacian ex Box
  '1bf9d47e-af5d-415c-b819-63efae469209', -- Lillie Premium Tournament Collection
  'bcd7ecf8-b0d4-4e02-a4a6-d09a3de949db', -- Dragapult ex League Battle Deck
  '90b8c18a-8d28-42fe-89a2-e8e767170c05', -- Masks of Ogerpon ex Premium Collection
  '84126936-129b-4534-b3fc-0fe124c2426f', -- Pokemon TCG: Rival Battle Decks
  'c052effd-0c3e-454e-8dae-1767e2aacf40', -- Scarlet & Violet: White Flare (merged into Black Bolt White Flare)
  '55d7c398-9369-408b-a689-1586c07a76bc', -- Pokemon Day 2026 Collection
  '34726796-2d74-422b-879b-5d9d62d90f91', -- Mega Charizard ex Tins
  'e2c968af-cbca-4bc8-8d93-422511fcbb5e', -- Mega Evolution: Ascended Heroes Premium Poster Collection
  '935cf313-4613-43c3-b5e6-b5c18b4decdb', -- 2025 World Championships Decks
  '9752d71e-9a0f-4e51-84ee-8993ad470ef6', -- Pokemon TCG: First Partner Collection, Series 2
  'adbffb5a-9429-4c11-8172-bf54ab4aa1ff', -- Mega Zygarde ex Premium Collection
  '7e1ad947-efca-40b2-8fa6-f5dc38edb841', -- Mega Lucario ex League Battle Deck
  '88c348be-831d-4de4-bfd6-696479b3e5e6', -- Mega Greninja ex Premium Collection
  '8f46b5d5-a457-4381-9fd9-2f90ccc3810d', -- Pokemon TCG: First Partner Collection, Series 3
  '48cb2f4f-a373-4f8e-8940-cbdc4d0d8f31', -- Pokemon TCG: Mega Forces Tins
  '0dbc527d-c827-44ec-b1d0-4213592c922a', -- 30th Celebration: Elite Trainer Box
  'f2b5bf3f-d8f8-4a11-b6b8-f07f46f6900c', -- 30th Celebration: Sylveon & Greninja ex Boxes
  'b646d24a-7e36-431c-88b8-0b5a991b8c66', -- 30th Celebration: Poster Collection
  '99b7b435-72b2-4cd3-b06a-21d47ebc3518', -- 30th Celebration: Tech Sticker Collections
  '872af02f-24dc-4b4c-92f3-d49dff83c855', -- 30th Celebration: Eevee 2-Pack Blister
  '73a94e71-5de1-49dd-a55a-b243af9961eb', -- 30th Celebration: Knockout Collection
  '01c5d771-61fa-47a7-8361-7c8a0ea307be', -- 30th Celebration: Booster Bundle
  '60024b45-be7f-4047-a5ab-86037970a13e', -- 30th Celebration: Binder Collection
  '5b3311c9-49f0-4bf4-a3e1-ea88de1fe1c5', -- 30th Celebration: Mew & Mewtwo Figure Collections
  'e004b394-8b77-48d0-8234-8ce5c15f7b67'  -- 30th Celebration: Day & Night Ultra-Premium Collections
);

-- New entries from the supplied list not previously present
insert into public.known_releases (name, release_date) values
  ('Scarlet & Violet - Paldean Fates', '2024-01-26'),
  ('Combined Powers Premium Collection', '2024-02-23'),
  ('Scarlet & Violet - Paldea Adventure Chest & Tin', '2024-03-01'),
  ('Scarlet & Violet - Temporal Forces', '2024-03-22'),
  ('Scarlet & Violet - Paradox Clash Tin', '2024-05-24'),
  ('Scarlet & Violet - Palafin ex box', '2024-06-21'),
  ('Scarlet & Violet - Shrouded Fable', '2024-08-02'),
  ('Dark Powers ex Special Collection', '2024-08-30'),
  ('Scarlet & Violet - Paradox Destinies tin', '2024-09-06'),
  ('Scarlet & Violet - Stellar Crown', '2024-09-13'),
  ('Charizard ex SPC', '2024-10-04'),
  ('Terapagos ex UPC', '2024-11-01'),
  ('Mega Moonlit tin', '2026-06-05'),
  ('Mega Evolution - Storm Emerald', '2026-09-01');
