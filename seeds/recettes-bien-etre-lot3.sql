-- BIEN-ÊTRE — LOT 3 — Viandes maigres, plats du monde & bowls équilibrés (80 plats)
-- Nutrition estimée manuellement à la création (pas d'appel Gemini) : indicative.

DO $$
DECLARE
  uid uuid := '97a98e5c-d29d-4a9f-9d84-0684eef75fe6'::uuid;
BEGIN

-- ═══════════════════════════════════════════════════
-- 🥩 VIANDES MAIGRES — bœuf, veau, porc (20)
-- ═══════════════════════════════════════════════════

INSERT INTO recipes (user_id, title, source_url, servings, prep_time, cook_time, ingredients, steps, tags, is_public, moderation_status, user_notes, nutrition_calories, nutrition_proteins, nutrition_fat, nutrition_carbs, nutrition_base) VALUES

(uid, 'Bœuf sauté aux brocolis façon wok', '', 4, 15, 12,
'[{"id":"1","name":"Filet de bœuf","quantity":"400","unit":"g"},{"id":"2","name":"Brocolis","quantity":"300","unit":"g"},{"id":"3","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"},{"id":"4","name":"Gingembre","quantity":"1","unit":"morceau"},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Couper le bœuf en fines lanières.","Faire sauter le bœuf 3 minutes à feu vif.","Ajouter le brocoli et le gingembre, sauter 6 minutes.","Arroser de sauce soja.","Servir avec le riz complet."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 400, 35, 15, 32, 4),

(uid, 'Filet mignon de porc aux pommes', '', 4, 15, 25,
'[{"id":"1","name":"Filet mignon de porc","quantity":"500","unit":"g"},{"id":"2","name":"Pommes","quantity":"2","unit":""},{"id":"3","name":"Thym","quantity":"1","unit":"c. à café"},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Haricots verts","quantity":"300","unit":"g"}]',
'["Saisir le filet mignon sur toutes les faces.","Ajouter les pommes en quartiers et le thym.","Cuire au four 20 minutes à 180°C.","Cuire les haricots verts à la vapeur.","Servir ensemble."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 340, 34, 10, 22, 4),

(uid, 'Bœuf bourguignon allégé', '', 4, 20, 90,
'[{"id":"1","name":"Bœuf à braiser maigre","quantity":"600","unit":"g"},{"id":"2","name":"Carottes","quantity":"3","unit":""},{"id":"3","name":"Champignons de Paris","quantity":"200","unit":"g"},{"id":"4","name":"Vin rouge","quantity":"200","unit":"ml"},{"id":"5","name":"Bouillon de bœuf","quantity":"300","unit":"ml"}]',
'["Faire dorer la viande.","Ajouter carottes et champignons.","Verser le vin rouge et le bouillon.","Couvrir et mijoter 1h30 à feu doux.","Servir chaud."]',
'{"plat","riche-proteines"}',
true, 'approved', 'Version dégraissée, moins de matière grasse que l''original', 380, 36, 14, 14, 4),

(uid, 'Escalopes de veau au citron', '', 4, 10, 12,
'[{"id":"1","name":"Escalopes de veau","quantity":"4","unit":""},{"id":"2","name":"Citron","quantity":"1","unit":""},{"id":"3","name":"Persil","quantity":"","unit":"quelques brins"},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Courgettes","quantity":"2","unit":""}]',
'["Poêler les escalopes 2 minutes de chaque côté.","Arroser de jus de citron.","Poêler les courgettes en tranches à part.","Parsemer de persil.","Servir ensemble."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 300, 34, 12, 8, 4),

(uid, 'Rôti de porc aux herbes et légumes racines', '', 4, 15, 45,
'[{"id":"1","name":"Rôti de porc","quantity":"600","unit":"g"},{"id":"2","name":"Carottes","quantity":"3","unit":""},{"id":"3","name":"Panais","quantity":"2","unit":""},{"id":"4","name":"Thym, romarin","quantity":"","unit":"quelques brins"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Préchauffer le four à 180°C.","Frotter le rôti d''herbes.","Disposer avec les légumes coupés en morceaux.","Cuire 45 minutes en arrosant régulièrement.","Servir chaud."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 360, 38, 12, 20, 4),

(uid, 'Bœuf mariné à la coréenne, riz complet', '', 4, 25, 10,
'[{"id":"1","name":"Bavette de bœuf","quantity":"500","unit":"g"},{"id":"2","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"},{"id":"3","name":"Ail","quantity":"2","unit":"gousses"},{"id":"4","name":"Poire","quantity":"1/2","unit":""},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Mixer sauce soja, ail et poire pour la marinade.","Mariner le bœuf 20 minutes.","Griller 2-3 minutes de chaque côté.","Trancher finement.","Servir avec le riz complet."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 380, 33, 12, 34, 4),

(uid, 'Sauté de porc aux poivrons et ananas', '', 4, 15, 12,
'[{"id":"1","name":"Filet de porc","quantity":"400","unit":"g"},{"id":"2","name":"Poivrons","quantity":"2","unit":""},{"id":"3","name":"Ananas frais","quantity":"150","unit":"g"},{"id":"4","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Couper le porc et les poivrons en lanières.","Sauter le porc 5 minutes.","Ajouter poivrons et ananas, cuire 5 minutes.","Arroser de sauce soja.","Servir avec le riz complet."]',
'{"plat"}',
true, 'approved', '', 380, 30, 10, 42, 4),

(uid, 'Veau marengo léger', '', 4, 20, 45,
'[{"id":"1","name":"Épaule de veau","quantity":"600","unit":"g"},{"id":"2","name":"Tomates concassées","quantity":"400","unit":"g"},{"id":"3","name":"Champignons de Paris","quantity":"200","unit":"g"},{"id":"4","name":"Vin blanc","quantity":"150","unit":"ml"},{"id":"5","name":"Ail","quantity":"2","unit":"gousses"}]',
'["Faire dorer la viande.","Ajouter l''ail, les tomates et le vin blanc.","Couvrir et mijoter 35 minutes.","Ajouter les champignons, cuire 10 minutes de plus.","Servir chaud."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 340, 35, 11, 14, 4),

(uid, 'Brochettes de bœuf, poivrons et oignons', '', 4, 20, 12,
'[{"id":"1","name":"Rumsteck","quantity":"500","unit":"g"},{"id":"2","name":"Poivrons","quantity":"2","unit":""},{"id":"3","name":"Oignon rouge","quantity":"1","unit":""},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Paprika","quantity":"1","unit":"c. à café"}]',
'["Couper viande et légumes en cubes.","Enfiler en alternance sur des piques.","Badigeonner d''huile et de paprika.","Griller 10-12 minutes en retournant.","Servir chaud."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 320, 34, 14, 10, 4),

(uid, 'Porc à la moutarde et champignons', '', 4, 10, 20,
'[{"id":"1","name":"Filet de porc","quantity":"500","unit":"g"},{"id":"2","name":"Moutarde à l''ancienne","quantity":"2","unit":"c. à soupe"},{"id":"3","name":"Champignons de Paris","quantity":"250","unit":"g"},{"id":"4","name":"Crème légère","quantity":"3","unit":"c. à soupe"},{"id":"5","name":"Sel, poivre","quantity":"","unit":""}]',
'["Poêler le porc en tranches 4 minutes de chaque côté.","Réserver. Faire revenir les champignons.","Ajouter la moutarde et la crème légère.","Remettre le porc, réchauffer 3 minutes.","Servir chaud."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 330, 32, 15, 8, 4),

(uid, 'Steak grillé, salade de roquette et parmesan', '', 4, 10, 8,
'[{"id":"1","name":"Steaks de bœuf maigre","quantity":"4","unit":""},{"id":"2","name":"Roquette","quantity":"100","unit":"g"},{"id":"3","name":"Parmesan en copeaux","quantity":"30","unit":"g"},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Citron","quantity":"1/2","unit":""}]',
'["Griller les steaks selon la cuisson désirée.","Laisser reposer 3 minutes.","Assaisonner la roquette d''huile et de citron.","Trancher les steaks.","Dresser sur la roquette, parsemer de parmesan."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 340, 36, 18, 4, 4),

(uid, 'Sauté de veau, petits pois et carottes', '', 4, 15, 30,
'[{"id":"1","name":"Épaule de veau","quantity":"500","unit":"g"},{"id":"2","name":"Petits pois","quantity":"250","unit":"g"},{"id":"3","name":"Carottes","quantity":"2","unit":""},{"id":"4","name":"Oignon","quantity":"1","unit":""},{"id":"5","name":"Bouillon de volaille","quantity":"300","unit":"ml"}]',
'["Faire dorer la viande et l''oignon.","Ajouter les carottes et le bouillon.","Mijoter 20 minutes.","Ajouter les petits pois, cuire 8 minutes de plus.","Servir chaud."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 340, 34, 11, 20, 4),

(uid, 'Porc satay, sauce cacahuète légère', '', 4, 25, 12,
'[{"id":"1","name":"Filet de porc","quantity":"400","unit":"g"},{"id":"2","name":"Beurre de cacahuète","quantity":"1","unit":"c. à soupe"},{"id":"3","name":"Lait de coco allégé","quantity":"100","unit":"ml"},{"id":"4","name":"Curry en poudre","quantity":"1","unit":"c. à café"},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Couper le porc en lanières, enfiler sur piques.","Griller 8-10 minutes en retournant.","Mélanger beurre de cacahuète, lait de coco et curry pour la sauce.","Chauffer la sauce 3 minutes.","Servir avec le riz complet et la sauce."]',
'{"plat"}',
true, 'approved', '', 420, 31, 18, 34, 4),

(uid, 'Bœuf haché, courgettes farcies', '', 4, 20, 30,
'[{"id":"1","name":"Bœuf haché 5% MG","quantity":"400","unit":"g"},{"id":"2","name":"Courgettes","quantity":"4","unit":""},{"id":"3","name":"Oignon","quantity":"1","unit":""},{"id":"4","name":"Tomates concassées","quantity":"200","unit":"g"},{"id":"5","name":"Persil","quantity":"","unit":"quelques brins"}]',
'["Préchauffer le four à 190°C.","Évider les courgettes, hacher la chair.","Faire revenir oignon, bœuf haché et chair de courgette.","Ajouter les tomates, farcir les courgettes.","Cuire 25 minutes au four."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 300, 28, 14, 12, 4),

(uid, 'Veau à la crème légère et champignons', '', 4, 15, 25,
'[{"id":"1","name":"Escalopes de veau","quantity":"4","unit":""},{"id":"2","name":"Champignons de Paris","quantity":"250","unit":"g"},{"id":"3","name":"Crème légère","quantity":"4","unit":"c. à soupe"},{"id":"4","name":"Échalote","quantity":"1","unit":""},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Poêler les escalopes, réserver.","Faire revenir échalote et champignons.","Ajouter la crème légère.","Remettre les escalopes, réchauffer.","Servir avec le riz complet."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 400, 35, 14, 34, 4),

(uid, 'Porc grillé façon banh mi léger', '', 4, 25, 10,
'[{"id":"1","name":"Filet de porc","quantity":"400","unit":"g"},{"id":"2","name":"Carotte","quantity":"1","unit":""},{"id":"3","name":"Pain complet","quantity":"4","unit":"tranches"},{"id":"4","name":"Coriandre fraîche","quantity":"","unit":"quelques feuilles"},{"id":"5","name":"Vinaigre de riz","quantity":"1","unit":"c. à soupe"}]',
'["Griller le porc en tranches fines.","Faire mariner la carotte râpée dans le vinaigre.","Garnir le pain complet de porc, carotte marinée et coriandre.","Servir immédiatement."]',
'{"plat"}',
true, 'approved', '', 360, 28, 10, 38, 4),

(uid, 'Bœuf effiloché aux épices, riz complet', '', 4, 15, 90,
'[{"id":"1","name":"Paleron de bœuf","quantity":"600","unit":"g"},{"id":"2","name":"Cumin","quantity":"1","unit":"c. à café"},{"id":"3","name":"Paprika","quantity":"1","unit":"c. à café"},{"id":"4","name":"Bouillon de bœuf","quantity":"400","unit":"ml"},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Saisir la viande avec les épices.","Ajouter le bouillon, couvrir.","Mijoter 1h30 à feu doux jusqu''à ce que la viande s''effiloche.","Effilocher à la fourchette.","Servir avec le riz complet."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 400, 38, 13, 32, 4),

(uid, 'Escalopes de porc panées au four', '', 4, 15, 20,
'[{"id":"1","name":"Escalopes de porc","quantity":"4","unit":""},{"id":"2","name":"Chapelure complète","quantity":"60","unit":"g"},{"id":"3","name":"Œuf","quantity":"1","unit":""},{"id":"4","name":"Herbes de Provence","quantity":"1","unit":"c. à café"},{"id":"5","name":"Salade verte","quantity":"1","unit":""}]',
'["Préchauffer le four à 200°C.","Tremper les escalopes dans l''œuf battu.","Enrober de chapelure aux herbes.","Cuire 18-20 minutes au four en retournant à mi-cuisson.","Servir avec une salade verte."]',
'{"plat"}',
true, 'approved', 'Alternative saine à la panure frite', 360, 33, 12, 26, 4),

(uid, 'Tajine de bœuf aux abricots secs', '', 4, 20, 60,
'[{"id":"1","name":"Bœuf à braiser maigre","quantity":"500","unit":"g"},{"id":"2","name":"Abricots secs","quantity":"80","unit":"g"},{"id":"3","name":"Cannelle","quantity":"1","unit":"c. à café"},{"id":"4","name":"Oignon","quantity":"1","unit":""},{"id":"5","name":"Amandes effilées","quantity":"20","unit":"g"}]',
'["Faire dorer la viande et l''oignon.","Ajouter la cannelle et couvrir d''eau.","Mijoter 45 minutes.","Ajouter les abricots secs, cuire 15 minutes de plus.","Parsemer d''amandes avant de servir."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 380, 33, 12, 28, 4),

-- ═══════════════════════════════════════════════════
-- 🌍 PLATS DU MONDE LÉGERS (20)
-- ═══════════════════════════════════════════════════

(uid, 'Poke bowl saumon et riz vinaigré', '', 4, 20, 15,
'[{"id":"1","name":"Saumon très frais","quantity":"350","unit":"g"},{"id":"2","name":"Riz complet","quantity":"200","unit":"g"},{"id":"3","name":"Vinaigre de riz","quantity":"1","unit":"c. à soupe"},{"id":"4","name":"Avocat","quantity":"1","unit":""},{"id":"5","name":"Edamame","quantity":"100","unit":"g"}]',
'["Cuire le riz complet, assaisonner de vinaigre de riz.","Couper le saumon en cubes.","Cuire les edamame 5 minutes.","Dresser riz, saumon, avocat et edamame dans un bol.","Servir frais."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 440, 28, 17, 42, 4),

(uid, 'Bibimbap de bœuf et légumes', '', 4, 25, 15,
'[{"id":"1","name":"Bœuf haché maigre","quantity":"300","unit":"g"},{"id":"2","name":"Riz complet","quantity":"200","unit":"g"},{"id":"3","name":"Carotte","quantity":"1","unit":""},{"id":"4","name":"Épinards frais","quantity":"150","unit":"g"},{"id":"5","name":"Œuf","quantity":"4","unit":""}]',
'["Cuire le riz complet.","Faire sauter le bœuf haché.","Faire sauter séparément carotte et épinards.","Cuire les œufs au plat.","Dresser en bol avec un œuf sur le dessus."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 420, 30, 18, 32, 4),

(uid, 'Pho de bœuf léger', '', 4, 20, 30,
'[{"id":"1","name":"Bœuf maigre en tranches fines","quantity":"300","unit":"g"},{"id":"2","name":"Nouilles de riz","quantity":"200","unit":"g"},{"id":"3","name":"Bouillon de bœuf","quantity":"1","unit":"litre"},{"id":"4","name":"Anis étoilé","quantity":"1","unit":""},{"id":"5","name":"Coriandre, ciboule","quantity":"","unit":"quelques feuilles"}]',
'["Faire infuser l''anis dans le bouillon chaud 15 minutes.","Cuire les nouilles de riz selon les instructions.","Répartir les nouilles dans les bols.","Disposer les fines tranches de bœuf cru dessus, le bouillon bouillant cuit la viande.","Parsemer d''herbes fraîches."]',
'{"plat"}',
true, 'approved', '', 400, 26, 6, 55, 4),

(uid, 'Poulet shawarma maison et légumes', '', 4, 25, 20,
'[{"id":"1","name":"Filets de poulet","quantity":"4","unit":""},{"id":"2","name":"Cumin, paprika, curcuma","quantity":"1","unit":"c. à café chacun"},{"id":"3","name":"Yaourt nature","quantity":"100","unit":"g"},{"id":"4","name":"Tomates","quantity":"2","unit":""},{"id":"5","name":"Pain pita complet","quantity":"4","unit":""}]',
'["Mariner le poulet dans les épices et le yaourt 30 minutes.","Griller 6 minutes de chaque côté.","Trancher finement.","Garnir les pains pita de poulet et tomates.","Servir chaud."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 400, 35, 9, 42, 4),

(uid, 'Riz cantonnais léger au poulet', '', 4, 15, 15,
'[{"id":"1","name":"Riz complet cuit la veille","quantity":"400","unit":"g"},{"id":"2","name":"Filets de poulet","quantity":"2","unit":""},{"id":"3","name":"Petits pois","quantity":"100","unit":"g"},{"id":"4","name":"Œufs","quantity":"2","unit":""},{"id":"5","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"}]',
'["Faire sauter le poulet en dés.","Pousser sur le côté, brouiller les œufs.","Ajouter le riz froid et les petits pois.","Mélanger vigoureusement à feu vif.","Arroser de sauce soja."]',
'{"plat"}',
true, 'approved', '', 400, 28, 10, 48, 4),

(uid, 'Curry vert thaï au poulet et légumes', '', 4, 15, 20,
'[{"id":"1","name":"Filets de poulet","quantity":"400","unit":"g"},{"id":"2","name":"Pâte de curry vert","quantity":"1","unit":"c. à soupe"},{"id":"3","name":"Lait de coco allégé","quantity":"200","unit":"ml"},{"id":"4","name":"Aubergine thaï ou courgette","quantity":"1","unit":""},{"id":"5","name":"Basilic thaï","quantity":"","unit":"quelques feuilles"}]',
'["Faire chauffer la pâte de curry.","Ajouter le lait de coco.","Ajouter le poulet et les légumes, mijoter 15 minutes.","Parsemer de basilic thaï.","Servir chaud (avec riz complet si désiré)."]',
'{"plat"}',
true, 'approved', '', 340, 32, 16, 12, 4),

(uid, 'Fajitas de poulet aux poivrons', '', 4, 20, 12,
'[{"id":"1","name":"Filets de poulet","quantity":"400","unit":"g"},{"id":"2","name":"Poivrons","quantity":"2","unit":""},{"id":"3","name":"Oignon","quantity":"1","unit":""},{"id":"4","name":"Tortillas de blé complet","quantity":"8","unit":""},{"id":"5","name":"Cumin, paprika","quantity":"1","unit":"c. à café chacun"}]',
'["Couper le poulet et les légumes en lanières.","Faire sauter le poulet avec les épices 6 minutes.","Ajouter poivrons et oignon, sauter 5 minutes.","Réchauffer les tortillas.","Garnir et servir."]',
'{"plat"}',
true, 'approved', '', 400, 32, 10, 45, 4),

(uid, 'Ramen léger au poulet et légumes', '', 4, 15, 25,
'[{"id":"1","name":"Filets de poulet","quantity":"300","unit":"g"},{"id":"2","name":"Nouilles de blé complet","quantity":"200","unit":"g"},{"id":"3","name":"Bouillon de volaille","quantity":"1","unit":"litre"},{"id":"4","name":"Champignons shiitake","quantity":"100","unit":"g"},{"id":"5","name":"Œuf","quantity":"2","unit":""}]',
'["Pocher le poulet dans le bouillon 15 minutes, retirer et trancher.","Cuire les nouilles selon les instructions.","Cuire les œufs mollets 6 minutes.","Ajouter les shiitakes au bouillon 5 minutes.","Dresser nouilles, bouillon, poulet et œuf."]',
'{"plat"}',
true, 'approved', '', 400, 30, 9, 48, 4),

(uid, 'Kefta d''agneau maigre, salade de boulgour', '', 4, 20, 12,
'[{"id":"1","name":"Agneau haché maigre","quantity":"400","unit":"g"},{"id":"2","name":"Cumin, coriandre en poudre","quantity":"1","unit":"c. à café chacun"},{"id":"3","name":"Persil","quantity":"","unit":"quelques brins"},{"id":"4","name":"Boulgour","quantity":"180","unit":"g"},{"id":"5","name":"Tomates","quantity":"2","unit":""}]',
'["Mélanger agneau haché, épices et persil.","Former des boulettes allongées.","Griller 8-10 minutes en retournant.","Cuire le boulgour, mélanger avec les tomates en dés.","Servir ensemble."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 420, 28, 18, 35, 4),

(uid, 'Poulet General Tso allégé au four', '', 4, 20, 20,
'[{"id":"1","name":"Filets de poulet","quantity":"400","unit":"g"},{"id":"2","name":"Fécule de maïs","quantity":"2","unit":"c. à soupe"},{"id":"3","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"},{"id":"4","name":"Miel","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Couper le poulet en cubes, enrober de fécule.","Cuire au four 20 minutes à 200°C.","Mélanger sauce soja et miel, chauffer 2 minutes.","Napper le poulet de sauce.","Servir avec le riz complet."]',
'{"plat"}',
true, 'approved', 'Cuit au four plutôt que frit', 400, 33, 8, 45, 4),

(uid, 'Chawarma de dinde et légumes marinés', '', 4, 25, 15,
'[{"id":"1","name":"Escalopes de dinde","quantity":"400","unit":"g"},{"id":"2","name":"Cumin, paprika","quantity":"1","unit":"c. à café chacun"},{"id":"3","name":"Concombre","quantity":"1","unit":""},{"id":"4","name":"Yaourt nature","quantity":"100","unit":"g"},{"id":"5","name":"Pain pita complet","quantity":"4","unit":""}]',
'["Mariner la dinde dans les épices 20 minutes.","Griller 4 minutes de chaque côté, trancher.","Préparer une sauce concombre-yaourt.","Garnir les pitas de dinde et sauce.","Servir chaud."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 380, 33, 8, 42, 4),

(uid, 'Poulet katsu allégé, chou émincé', '', 4, 20, 20,
'[{"id":"1","name":"Filets de poulet","quantity":"4","unit":""},{"id":"2","name":"Chapelure complète","quantity":"60","unit":"g"},{"id":"3","name":"Œuf","quantity":"1","unit":""},{"id":"4","name":"Chou blanc","quantity":"200","unit":"g"},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Préchauffer le four à 200°C.","Tremper le poulet dans l''œuf puis la chapelure.","Cuire 20 minutes au four.","Émincer finement le chou.","Servir avec le riz complet et le chou."]',
'{"plat"}',
true, 'approved', '', 400, 35, 8, 42, 4),

(uid, 'Curry massaman de bœuf léger', '', 4, 20, 60,
'[{"id":"1","name":"Bœuf à braiser maigre","quantity":"500","unit":"g"},{"id":"2","name":"Pâte de curry massaman","quantity":"1","unit":"c. à soupe"},{"id":"3","name":"Lait de coco allégé","quantity":"250","unit":"ml"},{"id":"4","name":"Pommes de terre","quantity":"2","unit":""},{"id":"5","name":"Cacahuètes concassées","quantity":"20","unit":"g"}]',
'["Faire dorer la viande avec la pâte de curry.","Ajouter le lait de coco et les pommes de terre en morceaux.","Mijoter 50 minutes à couvert.","Parsemer de cacahuètes.","Servir chaud."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 420, 32, 18, 30, 4),

(uid, 'Poulet piccata, citron et câpres', '', 4, 10, 15,
'[{"id":"1","name":"Filets de poulet","quantity":"4","unit":""},{"id":"2","name":"Citron","quantity":"1","unit":""},{"id":"3","name":"Câpres","quantity":"1","unit":"c. à soupe"},{"id":"4","name":"Bouillon de volaille","quantity":"100","unit":"ml"},{"id":"5","name":"Persil","quantity":"","unit":"quelques brins"}]',
'["Poêler le poulet 5 minutes de chaque côté.","Réserver. Déglacer avec le bouillon et le jus de citron.","Ajouter les câpres, réduire 3 minutes.","Napper le poulet de sauce.","Parsemer de persil."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 300, 35, 8, 6, 4),

(uid, 'Riz complet façon jambalaya léger', '', 4, 15, 30,
'[{"id":"1","name":"Filets de poulet","quantity":"300","unit":"g"},{"id":"2","name":"Crevettes décortiquées","quantity":"200","unit":"g"},{"id":"3","name":"Riz complet","quantity":"200","unit":"g"},{"id":"4","name":"Tomates concassées","quantity":"300","unit":"g"},{"id":"5","name":"Paprika, thym","quantity":"1","unit":"c. à café chacun"}]',
'["Faire dorer le poulet en morceaux.","Ajouter le riz, les tomates et les épices.","Couvrir d''eau, cuire 20 minutes.","Ajouter les crevettes 5 minutes avant la fin.","Servir chaud."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 420, 32, 8, 52, 4),

(uid, 'Bo bun de bœuf léger', '', 4, 25, 8,
'[{"id":"1","name":"Bœuf maigre en lanières","quantity":"300","unit":"g"},{"id":"2","name":"Vermicelles de riz","quantity":"150","unit":"g"},{"id":"3","name":"Carotte","quantity":"1","unit":""},{"id":"4","name":"Menthe, coriandre","quantity":"","unit":"quelques feuilles"},{"id":"5","name":"Cacahuètes concassées","quantity":"20","unit":"g"}]',
'["Faire tremper les vermicelles dans l''eau chaude.","Faire sauter le bœuf 3-4 minutes à feu vif.","Râper la carotte.","Dresser vermicelles, carotte, bœuf et herbes.","Parsemer de cacahuètes."]',
'{"plat"}',
true, 'approved', '', 400, 28, 10, 48, 4),

(uid, 'Poulet à l''orange, brocolis vapeur', '', 4, 15, 15,
'[{"id":"1","name":"Filets de poulet","quantity":"400","unit":"g"},{"id":"2","name":"Orange","quantity":"1","unit":""},{"id":"3","name":"Sauce soja légère","quantity":"1","unit":"c. à soupe"},{"id":"4","name":"Brocolis","quantity":"300","unit":"g"},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Poêler le poulet en cubes.","Ajouter le jus d''orange et la sauce soja.","Laisser réduire 5 minutes.","Cuire les brocolis à la vapeur.","Servir avec le riz complet."]',
'{"plat"}',
true, 'approved', '', 400, 32, 8, 48, 4),

(uid, 'Chili con carne allégé', '', 4, 15, 35,
'[{"id":"1","name":"Bœuf haché 5% MG","quantity":"400","unit":"g"},{"id":"2","name":"Haricots rouges cuits","quantity":"300","unit":"g"},{"id":"3","name":"Tomates concassées","quantity":"400","unit":"g"},{"id":"4","name":"Cumin, piment doux","quantity":"1","unit":"c. à café chacun"},{"id":"5","name":"Oignon","quantity":"1","unit":""}]',
'["Faire revenir oignon et bœuf haché.","Ajouter les épices, mélanger.","Ajouter tomates et haricots rouges.","Laisser mijoter 25 minutes.","Servir chaud."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 380, 30, 14, 30, 4),

-- ═══════════════════════════════════════════════════
-- 🥗 BOWLS ÉQUILIBRÉS & SALADES-REPAS FINALES (20)
-- ═══════════════════════════════════════════════════

(uid, 'Bowl de bœuf grillé, riz complet et légumes croquants', '', 4, 15, 12,
'[{"id":"1","name":"Bavette de bœuf","quantity":"400","unit":"g"},{"id":"2","name":"Riz complet","quantity":"200","unit":"g"},{"id":"3","name":"Carotte","quantity":"1","unit":""},{"id":"4","name":"Chou rouge","quantity":"100","unit":"g"},{"id":"5","name":"Sauce soja légère","quantity":"1","unit":"c. à soupe"}]',
'["Cuire le riz complet.","Griller la bavette 3 minutes de chaque côté, trancher.","Râper carotte et chou rouge.","Dresser tous les éléments dans un bol.","Arroser de sauce soja."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 420, 32, 14, 42, 4),

(uid, 'Salade de poulet grillé, quinoa et grenade', '', 4, 15, 15,
'[{"id":"1","name":"Filets de poulet","quantity":"3","unit":""},{"id":"2","name":"Quinoa","quantity":"180","unit":"g"},{"id":"3","name":"Grenade","quantity":"1/2","unit":""},{"id":"4","name":"Roquette","quantity":"80","unit":"g"},{"id":"5","name":"Citron","quantity":"1","unit":""}]',
'["Cuire le quinoa selon les instructions.","Griller le poulet et le couper en dés.","Égrainer la grenade.","Mélanger quinoa, roquette, grenade et poulet.","Arroser de jus de citron."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 420, 35, 10, 42, 4),

(uid, 'Bowl de porc mariné, riz complet et concombre', '', 4, 20, 15,
'[{"id":"1","name":"Filet de porc","quantity":"400","unit":"g"},{"id":"2","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"},{"id":"3","name":"Riz complet","quantity":"200","unit":"g"},{"id":"4","name":"Concombre","quantity":"1","unit":""},{"id":"5","name":"Graines de sésame","quantity":"1","unit":"c. à café"}]',
'["Mariner le porc dans la sauce soja 15 minutes.","Cuire le riz complet.","Griller le porc et trancher.","Couper le concombre en rondelles.","Dresser tous les éléments, parsemer de sésame."]',
'{"plat"}',
true, 'approved', '', 400, 30, 12, 42, 4),

(uid, 'Salade de bœuf thaï épicée', '', 4, 20, 8,
'[{"id":"1","name":"Bavette de bœuf","quantity":"350","unit":"g"},{"id":"2","name":"Concombre","quantity":"1","unit":""},{"id":"3","name":"Menthe, coriandre","quantity":"","unit":"quelques feuilles"},{"id":"4","name":"Citron vert","quantity":"1","unit":""},{"id":"5","name":"Piment doux","quantity":"1","unit":"c. à café"}]',
'["Griller la bavette 3 minutes de chaque côté, trancher finement.","Couper le concombre en rubans.","Mélanger avec les herbes fraîches.","Assaisonner de citron vert et de piment.","Ajouter le bœuf et servir."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 320, 32, 14, 8, 4),

(uid, 'Bowl de crevettes et poulet, riz complet caribéen', '', 4, 20, 15,
'[{"id":"1","name":"Filets de poulet","quantity":"2","unit":""},{"id":"2","name":"Crevettes décortiquées","quantity":"200","unit":"g"},{"id":"3","name":"Riz complet","quantity":"200","unit":"g"},{"id":"4","name":"Mangue","quantity":"1","unit":""},{"id":"5","name":"Citron vert","quantity":"1","unit":""}]',
'["Cuire le riz complet.","Griller le poulet en dés puis les crevettes.","Couper la mangue en dés.","Dresser tous les éléments dans un bol.","Arroser de citron vert."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 420, 33, 8, 48, 4),

(uid, 'Salade de dinde fumée, pomme et noix', '', 4, 15, 0,
'[{"id":"1","name":"Blanc de dinde fumé","quantity":"200","unit":"g"},{"id":"2","name":"Pomme","quantity":"1","unit":""},{"id":"3","name":"Noix","quantity":"30","unit":"g"},{"id":"4","name":"Mâche","quantity":"100","unit":"g"},{"id":"5","name":"Vinaigre balsamique","quantity":"1","unit":"c. à soupe"}]',
'["Couper la dinde fumée en lanières.","Couper la pomme en fines tranches.","Mélanger mâche, pomme et noix.","Ajouter la dinde.","Arroser de vinaigre balsamique."]',
'{"plat","riche-proteines"}',
true, 'approved', 'Sans cuisson, rapide', 320, 24, 16, 18, 4),

(uid, 'Bowl de saumon teriyaki et riz complet', '', 4, 15, 12,
'[{"id":"1","name":"Pavés de saumon","quantity":"4","unit":""},{"id":"2","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"},{"id":"3","name":"Miel","quantity":"1","unit":"c. à café"},{"id":"4","name":"Riz complet","quantity":"200","unit":"g"},{"id":"5","name":"Brocolis","quantity":"150","unit":"g"}]',
'["Mélanger sauce soja et miel.","Cuire le saumon à la poêle en arrosant de marinade.","Cuire le riz complet.","Cuire les brocolis à la vapeur.","Dresser tous les éléments dans un bol."]',
'{"plat"}',
true, 'approved', '', 450, 33, 20, 35, 4),

(uid, 'Bowl de dinde teriyaki, riz complet et edamame', '', 4, 15, 15,
'[{"id":"1","name":"Escalopes de dinde","quantity":"400","unit":"g"},{"id":"2","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"},{"id":"3","name":"Riz complet","quantity":"200","unit":"g"},{"id":"4","name":"Edamame","quantity":"150","unit":"g"},{"id":"5","name":"Graines de sésame","quantity":"1","unit":"c. à café"}]',
'["Couper la dinde en lanières, mariner dans la sauce soja.","Poêler 6 minutes.","Cuire le riz complet et les edamame.","Dresser tous les éléments.","Parsemer de sésame."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 400, 34, 9, 42, 4),

(uid, 'Salade de poulet, quinoa et légumes croquants', '', 4, 15, 15,
'[{"id":"1","name":"Filets de poulet","quantity":"3","unit":""},{"id":"2","name":"Quinoa","quantity":"180","unit":"g"},{"id":"3","name":"Concombre","quantity":"1","unit":""},{"id":"4","name":"Radis","quantity":"6","unit":""},{"id":"5","name":"Citron","quantity":"1","unit":""}]',
'["Cuire le quinoa selon les instructions.","Griller le poulet et le couper en dés.","Couper concombre et radis en rondelles.","Mélanger tous les ingrédients.","Arroser de jus de citron."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 420, 35, 9, 42, 4),

(uid, 'Bowl de bœuf et légumes racines rôtis', '', 4, 15, 30,
'[{"id":"1","name":"Rumsteck","quantity":"400","unit":"g"},{"id":"2","name":"Panais","quantity":"1","unit":""},{"id":"3","name":"Carotte","quantity":"2","unit":""},{"id":"4","name":"Betterave","quantity":"1","unit":""},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Rôtir les légumes racines coupés en cubes 25 minutes à 200°C.","Griller le bœuf 3 minutes de chaque côté, trancher.","Dresser légumes et bœuf dans un bol.","Arroser d''huile d''olive."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 400, 32, 15, 32, 4),

(uid, 'Salade de crevettes, avocat et pamplemousse', '', 4, 20, 8,
'[{"id":"1","name":"Crevettes décortiquées","quantity":"400","unit":"g"},{"id":"2","name":"Avocat","quantity":"1","unit":""},{"id":"3","name":"Pamplemousse","quantity":"1","unit":""},{"id":"4","name":"Mâche","quantity":"80","unit":"g"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Poêler les crevettes 5 minutes.","Peler le pamplemousse à vif, couper en quartiers.","Couper l''avocat en tranches.","Mélanger mâche, pamplemousse et avocat.","Ajouter les crevettes, arroser d''huile."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 340, 27, 16, 20, 4),

(uid, 'Bowl de porc grillé, riz complet et chou pak-choï', '', 4, 15, 15,
'[{"id":"1","name":"Filet de porc","quantity":"400","unit":"g"},{"id":"2","name":"Riz complet","quantity":"200","unit":"g"},{"id":"3","name":"Pak-choï","quantity":"200","unit":"g"},{"id":"4","name":"Sauce soja légère","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Gingembre","quantity":"1","unit":"morceau"}]',
'["Cuire le riz complet.","Griller le porc 4 minutes de chaque côté, trancher.","Sauter le pak-choï avec le gingembre.","Dresser tous les éléments dans un bol.","Arroser de sauce soja."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 400, 32, 11, 42, 4),

(uid, 'Salade tiède de dinde, patate douce et épinards', '', 4, 15, 25,
'[{"id":"1","name":"Escalopes de dinde","quantity":"400","unit":"g"},{"id":"2","name":"Patate douce","quantity":"1","unit":""},{"id":"3","name":"Épinards frais","quantity":"150","unit":"g"},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Vinaigre balsamique","quantity":"1","unit":"c. à soupe"}]',
'["Rôtir la patate douce en cubes 25 minutes à 200°C.","Griller la dinde et trancher.","Faire tomber les épinards.","Mélanger tous les éléments tièdes.","Arroser d''huile et de vinaigre."]',
'{"plat","riche-fibres"}',
true, 'approved', '', 400, 33, 10, 42, 4),

(uid, 'Bowl de thon grillé, riz complet et wakamé', '', 4, 20, 8,
'[{"id":"1","name":"Steaks de thon","quantity":"400","unit":"g"},{"id":"2","name":"Riz complet","quantity":"200","unit":"g"},{"id":"3","name":"Salade de wakamé","quantity":"80","unit":"g"},{"id":"4","name":"Avocat","quantity":"1","unit":""},{"id":"5","name":"Sauce soja légère","quantity":"1","unit":"c. à soupe"}]',
'["Cuire le riz complet.","Saisir le thon 1 minute de chaque côté, trancher.","Couper l''avocat.","Dresser riz, thon, wakamé et avocat.","Arroser de sauce soja."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 440, 34, 17, 38, 4),

(uid, 'Salade de bœuf grillé, tomates et roquefort léger', '', 4, 15, 8,
'[{"id":"1","name":"Steaks de bœuf maigre","quantity":"400","unit":"g"},{"id":"2","name":"Tomates","quantity":"2","unit":""},{"id":"3","name":"Roquefort","quantity":"40","unit":"g"},{"id":"4","name":"Roquette","quantity":"80","unit":"g"},{"id":"5","name":"Vinaigre balsamique","quantity":"1","unit":"c. à soupe"}]',
'["Griller le bœuf selon la cuisson désirée, trancher.","Couper les tomates.","Mélanger roquette et tomates.","Émietter le roquefort dessus.","Ajouter le bœuf et arroser de vinaigre."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 380, 34, 20, 8, 4),

(uid, 'Bowl de poulet, riz complet et sauce arachide', '', 4, 20, 15,
'[{"id":"1","name":"Filets de poulet","quantity":"3","unit":""},{"id":"2","name":"Riz complet","quantity":"200","unit":"g"},{"id":"3","name":"Beurre de cacahuète","quantity":"1","unit":"c. à soupe"},{"id":"4","name":"Carotte","quantity":"1","unit":""},{"id":"5","name":"Citron vert","quantity":"1","unit":""}]',
'["Cuire le riz complet.","Griller le poulet et trancher.","Râper la carotte.","Mélanger beurre de cacahuète, citron vert et un peu d''eau chaude.","Dresser et napper de sauce."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 440, 34, 15, 45, 4),

(uid, 'Salade de lentilles, poulet et grenade', '', 4, 15, 20,
'[{"id":"1","name":"Filets de poulet","quantity":"2","unit":""},{"id":"2","name":"Lentilles vertes","quantity":"200","unit":"g"},{"id":"3","name":"Grenade","quantity":"1/2","unit":""},{"id":"4","name":"Menthe fraîche","quantity":"","unit":"quelques feuilles"},{"id":"5","name":"Citron","quantity":"1","unit":""}]',
'["Cuire les lentilles 20 minutes à l''eau.","Griller le poulet et le couper en dés.","Égrainer la grenade.","Mélanger lentilles tièdes, poulet et grenade.","Parsemer de menthe et arroser de citron."]',
'{"plat","riche-fibres"}',
true, 'approved', '', 400, 33, 8, 42, 4),

(uid, 'Bowl de crevettes cajun, riz complet et maïs', '', 4, 15, 12,
'[{"id":"1","name":"Crevettes décortiquées","quantity":"400","unit":"g"},{"id":"2","name":"Épices cajun","quantity":"1","unit":"c. à soupe"},{"id":"3","name":"Riz complet","quantity":"200","unit":"g"},{"id":"4","name":"Maïs","quantity":"150","unit":"g"},{"id":"5","name":"Citron vert","quantity":"1","unit":""}]',
'["Assaisonner les crevettes des épices cajun.","Poêler 5 minutes.","Cuire le riz complet, ajouter le maïs.","Dresser riz-maïs et crevettes.","Arroser de citron vert."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 380, 28, 6, 55, 4),

-- ═══════════════════════════════════════════════════
-- ➕ COMPLÉMENTS — viandes, monde & bowls (25)
-- ═══════════════════════════════════════════════════

(uid, 'Rôti de bœuf froid, salade de haricots verts', '', 4, 15, 20,
'[{"id":"1","name":"Rôti de bœuf","quantity":"500","unit":"g"},{"id":"2","name":"Haricots verts","quantity":"300","unit":"g"},{"id":"3","name":"Échalote","quantity":"1","unit":""},{"id":"4","name":"Moutarde","quantity":"1","unit":"c. à café"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Rôtir le bœuf 20 minutes à 200°C, laisser refroidir.","Cuire les haricots verts à la vapeur.","Préparer une vinaigrette à la moutarde.","Trancher le rôti finement.","Servir froid avec les haricots assaisonnés."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 320, 34, 14, 8, 4),

(uid, 'Porc au caramel léger, riz complet', '', 4, 15, 20,
'[{"id":"1","name":"Filet de porc","quantity":"400","unit":"g"},{"id":"2","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"},{"id":"3","name":"Miel","quantity":"1","unit":"c. à soupe"},{"id":"4","name":"Gingembre","quantity":"1","unit":"morceau"},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Couper le porc en cubes.","Saisir 5 minutes à feu vif.","Ajouter sauce soja, miel et gingembre.","Laisser caraméliser 5 minutes en remuant.","Servir avec le riz complet."]',
'{"plat"}',
true, 'approved', '', 400, 30, 10, 45, 4),

(uid, 'Salade César au poulet allégée', '', 4, 15, 12,
'[{"id":"1","name":"Filets de poulet","quantity":"3","unit":""},{"id":"2","name":"Laitue romaine","quantity":"200","unit":"g"},{"id":"3","name":"Parmesan","quantity":"30","unit":"g"},{"id":"4","name":"Yaourt nature","quantity":"3","unit":"c. à soupe"},{"id":"5","name":"Croûtons complets","quantity":"40","unit":"g"}]',
'["Griller le poulet et le trancher.","Préparer une sauce César avec le yaourt et un peu de parmesan.","Mélanger la romaine avec la sauce.","Ajouter poulet, croûtons et parmesan restant.","Servir immédiatement."]',
'{"plat","riche-proteines"}',
true, 'approved', 'Sauce allégée au yaourt plutôt qu''à la mayonnaise', 380, 33, 14, 24, 4),

(uid, 'Veau sauté, poivrons et riz complet', '', 4, 15, 20,
'[{"id":"1","name":"Épaule de veau","quantity":"400","unit":"g"},{"id":"2","name":"Poivrons","quantity":"2","unit":""},{"id":"3","name":"Oignon","quantity":"1","unit":""},{"id":"4","name":"Tomates concassées","quantity":"200","unit":"g"},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Faire dorer le veau et l''oignon.","Ajouter les poivrons, cuire 5 minutes.","Ajouter les tomates concassées.","Mijoter 15 minutes.","Servir avec le riz complet."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 400, 32, 11, 40, 4),

(uid, 'Poulet tikka masala léger', '', 4, 25, 20,
'[{"id":"1","name":"Filets de poulet","quantity":"400","unit":"g"},{"id":"2","name":"Yaourt nature","quantity":"100","unit":"g"},{"id":"3","name":"Curry, garam masala","quantity":"1","unit":"c. à soupe"},{"id":"4","name":"Tomates concassées","quantity":"300","unit":"g"},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Mariner le poulet dans le yaourt et les épices 20 minutes.","Griller le poulet 8 minutes.","Ajouter les tomates concassées, mijoter 12 minutes.","Servir avec le riz complet."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 420, 34, 10, 46, 4),

(uid, 'Bœuf aux champignons et riz complet', '', 4, 15, 20,
'[{"id":"1","name":"Bavette de bœuf","quantity":"400","unit":"g"},{"id":"2","name":"Champignons de Paris","quantity":"250","unit":"g"},{"id":"3","name":"Échalote","quantity":"1","unit":""},{"id":"4","name":"Bouillon de bœuf","quantity":"150","unit":"ml"},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Griller le bœuf, réserver.","Faire revenir échalote et champignons.","Déglacer au bouillon, réduire 5 minutes.","Trancher le bœuf et napper de sauce.","Servir avec le riz complet."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 400, 33, 12, 38, 4),

(uid, 'Porc grillé, purée de patate douce', '', 4, 15, 25,
'[{"id":"1","name":"Filet de porc","quantity":"400","unit":"g"},{"id":"2","name":"Patate douce","quantity":"2","unit":""},{"id":"3","name":"Lait demi-écrémé","quantity":"50","unit":"ml"},{"id":"4","name":"Thym","quantity":"1","unit":"c. à café"},{"id":"5","name":"Épinards frais","quantity":"150","unit":"g"}]',
'["Cuire la patate douce à l''eau 20 minutes, écraser avec le lait.","Griller le porc avec le thym.","Faire tomber les épinards.","Trancher le porc.","Servir avec la purée et les épinards."]',
'{"plat","riche-fibres"}',
true, 'approved', '', 380, 30, 9, 42, 4),

(uid, 'Salade grecque au poulet grillé', '', 4, 15, 12,
'[{"id":"1","name":"Filets de poulet","quantity":"3","unit":""},{"id":"2","name":"Concombre","quantity":"1","unit":""},{"id":"3","name":"Tomates","quantity":"2","unit":""},{"id":"4","name":"Feta","quantity":"60","unit":"g"},{"id":"5","name":"Olives noires","quantity":"12","unit":""}]',
'["Griller le poulet et le trancher.","Couper concombre et tomates en dés.","Mélanger avec la feta émiettée et les olives.","Ajouter le poulet.","Arroser d''huile d''olive avant de servir."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 360, 33, 16, 10, 4),

(uid, 'Bœuf Stroganoff allégé', '', 4, 15, 20,
'[{"id":"1","name":"Filet de bœuf","quantity":"400","unit":"g"},{"id":"2","name":"Champignons de Paris","quantity":"200","unit":"g"},{"id":"3","name":"Oignon","quantity":"1","unit":""},{"id":"4","name":"Crème légère","quantity":"4","unit":"c. à soupe"},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Faire sauter le bœuf en lanières, réserver.","Faire revenir oignon et champignons.","Ajouter la crème légère.","Remettre le bœuf, réchauffer 2 minutes.","Servir avec le riz complet."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 420, 33, 15, 38, 4),

(uid, 'Dinde rôtie, légumes de saison', '', 4, 15, 40,
'[{"id":"1","name":"Blanc de dinde","quantity":"600","unit":"g"},{"id":"2","name":"Carottes","quantity":"2","unit":""},{"id":"3","name":"Courgettes","quantity":"2","unit":""},{"id":"4","name":"Thym, romarin","quantity":"","unit":"quelques brins"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Préchauffer le four à 180°C.","Disposer la dinde et les légumes coupés en morceaux.","Arroser d''huile et parsemer d''herbes.","Cuire 35-40 minutes.","Servir chaud."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 320, 38, 9, 14, 4),

(uid, 'Bowl de bœuf haché épicé façon taco', '', 4, 15, 15,
'[{"id":"1","name":"Bœuf haché 5% MG","quantity":"400","unit":"g"},{"id":"2","name":"Haricots noirs cuits","quantity":"200","unit":"g"},{"id":"3","name":"Riz complet","quantity":"200","unit":"g"},{"id":"4","name":"Maïs","quantity":"100","unit":"g"},{"id":"5","name":"Épices tex-mex","quantity":"1","unit":"c. à soupe"}]',
'["Faire revenir le bœuf haché avec les épices.","Cuire le riz complet.","Réchauffer haricots noirs et maïs.","Dresser tous les éléments dans un bol.","Servir chaud."]',
'{"plat","riche-fibres"}',
true, 'approved', '', 440, 30, 14, 48, 4),

(uid, 'Poulet grillé, sauce yaourt-concombre, boulgour', '', 4, 15, 15,
'[{"id":"1","name":"Filets de poulet","quantity":"4","unit":""},{"id":"2","name":"Yaourt nature","quantity":"100","unit":"g"},{"id":"3","name":"Concombre","quantity":"1/2","unit":""},{"id":"4","name":"Boulgour","quantity":"180","unit":"g"},{"id":"5","name":"Menthe fraîche","quantity":"","unit":"quelques feuilles"}]',
'["Griller le poulet.","Cuire le boulgour selon les instructions.","Râper le concombre, mélanger au yaourt et à la menthe.","Trancher le poulet.","Servir avec le boulgour et la sauce."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 400, 35, 8, 42, 4),

(uid, 'Sauté de porc au brocoli et gingembre', '', 4, 15, 12,
'[{"id":"1","name":"Filet de porc","quantity":"400","unit":"g"},{"id":"2","name":"Brocolis","quantity":"300","unit":"g"},{"id":"3","name":"Gingembre","quantity":"1","unit":"morceau"},{"id":"4","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Couper le porc en lanières.","Sauter avec le gingembre 5 minutes.","Ajouter le brocoli, cuire 6 minutes.","Arroser de sauce soja.","Servir avec le riz complet."]',
'{"plat"}',
true, 'approved', '', 380, 29, 10, 42, 4),

(uid, 'Salade de bœuf, agrumes et roquette', '', 4, 15, 8,
'[{"id":"1","name":"Steaks de bœuf maigre","quantity":"400","unit":"g"},{"id":"2","name":"Orange","quantity":"1","unit":""},{"id":"3","name":"Roquette","quantity":"100","unit":"g"},{"id":"4","name":"Parmesan","quantity":"20","unit":"g"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Griller le bœuf, trancher finement.","Peler l''orange à vif, couper en quartiers.","Mélanger roquette et orange.","Ajouter le bœuf.","Parsemer de copeaux de parmesan et arroser d''huile."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 340, 33, 16, 12, 4),

(uid, 'Poulet basquaise léger', '', 4, 20, 35,
'[{"id":"1","name":"Cuisses de poulet sans peau","quantity":"4","unit":""},{"id":"2","name":"Poivrons","quantity":"3","unit":""},{"id":"3","name":"Tomates concassées","quantity":"400","unit":"g"},{"id":"4","name":"Oignon","quantity":"1","unit":""},{"id":"5","name":"Piment d''Espelette","quantity":"1","unit":"pincée"}]',
'["Faire dorer le poulet, réserver.","Faire revenir oignon et poivrons.","Ajouter les tomates et le piment.","Remettre le poulet, mijoter 30 minutes.","Servir chaud."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 360, 34, 14, 16, 4),

(uid, 'Bowl de dinde, patate douce et chou kale', '', 4, 15, 25,
'[{"id":"1","name":"Escalopes de dinde","quantity":"400","unit":"g"},{"id":"2","name":"Patate douce","quantity":"1","unit":""},{"id":"3","name":"Chou kale","quantity":"100","unit":"g"},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Citron","quantity":"1/2","unit":""}]',
'["Rôtir la patate douce en cubes 25 minutes à 200°C.","Griller la dinde et trancher.","Masser le chou kale avec l''huile et le citron.","Dresser tous les éléments dans un bol.","Servir."]',
'{"plat","riche-fibres"}',
true, 'approved', '', 380, 33, 9, 40, 4),

(uid, 'Porc à l''ananas façon antillaise', '', 4, 20, 20,
'[{"id":"1","name":"Filet de porc","quantity":"400","unit":"g"},{"id":"2","name":"Ananas frais","quantity":"200","unit":"g"},{"id":"3","name":"Oignon","quantity":"1","unit":""},{"id":"4","name":"Thym","quantity":"1","unit":"c. à café"},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Couper le porc en cubes, dorer avec l''oignon.","Ajouter l''ananas en morceaux et le thym.","Mijoter 15 minutes à couvert.","Servir avec le riz complet."]',
'{"plat"}',
true, 'approved', '', 400, 29, 10, 46, 4),

(uid, 'Salade de poulet fumé, pomme et noix de pécan', '', 4, 15, 0,
'[{"id":"1","name":"Blanc de poulet fumé","quantity":"250","unit":"g"},{"id":"2","name":"Pomme","quantity":"1","unit":""},{"id":"3","name":"Noix de pécan","quantity":"30","unit":"g"},{"id":"4","name":"Mâche","quantity":"100","unit":"g"},{"id":"5","name":"Vinaigre balsamique","quantity":"1","unit":"c. à soupe"}]',
'["Couper le poulet fumé en lanières.","Trancher la pomme finement.","Mélanger mâche, pomme et noix de pécan.","Ajouter le poulet.","Arroser de vinaigre balsamique."]',
'{"plat","riche-proteines"}',
true, 'approved', 'Sans cuisson, idéal pour un repas rapide', 360, 26, 18, 20, 4),

(uid, 'Veau printanier, petits légumes nouveaux', '', 4, 20, 35,
'[{"id":"1","name":"Épaule de veau","quantity":"500","unit":"g"},{"id":"2","name":"Carottes nouvelles","quantity":"200","unit":"g"},{"id":"3","name":"Petits pois","quantity":"150","unit":"g"},{"id":"4","name":"Oignons grelots","quantity":"150","unit":"g"},{"id":"5","name":"Bouillon de volaille","quantity":"300","unit":"ml"}]',
'["Faire dorer la viande.","Ajouter les oignons grelots et les carottes.","Couvrir de bouillon, mijoter 25 minutes.","Ajouter les petits pois, cuire 8 minutes de plus.","Servir chaud."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 340, 34, 11, 18, 4),

(uid, 'Bœuf teriyaki, riz complet et pak-choï', '', 4, 15, 12,
'[{"id":"1","name":"Bavette de bœuf","quantity":"400","unit":"g"},{"id":"2","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"},{"id":"3","name":"Miel","quantity":"1","unit":"c. à café"},{"id":"4","name":"Pak-choï","quantity":"200","unit":"g"},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Griller le bœuf, trancher.","Mélanger sauce soja et miel, chauffer 2 minutes.","Sauter le pak-choï.","Napper le bœuf de sauce.","Servir avec le riz complet et le pak-choï."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 420, 33, 14, 38, 4),

(uid, 'Poulet à la marocaine, semoule complète', '', 4, 20, 35,
'[{"id":"1","name":"Cuisses de poulet sans peau","quantity":"4","unit":""},{"id":"2","name":"Cannelle, cumin","quantity":"1","unit":"c. à café chacun"},{"id":"3","name":"Abricots secs","quantity":"60","unit":"g"},{"id":"4","name":"Semoule complète","quantity":"180","unit":"g"},{"id":"5","name":"Oignon","quantity":"1","unit":""}]',
'["Faire dorer le poulet et l''oignon avec les épices.","Couvrir d''eau, ajouter les abricots.","Mijoter 30 minutes.","Préparer la semoule complète selon les instructions.","Servir ensemble."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 420, 33, 10, 46, 4),

(uid, 'Filet de porc aux pruneaux', '', 4, 15, 30,
'[{"id":"1","name":"Filet mignon de porc","quantity":"500","unit":"g"},{"id":"2","name":"Pruneaux dénoyautés","quantity":"80","unit":"g"},{"id":"3","name":"Échalote","quantity":"1","unit":""},{"id":"4","name":"Bouillon de volaille","quantity":"150","unit":"ml"},{"id":"5","name":"Crème légère","quantity":"2","unit":"c. à soupe"}]',
'["Saisir le filet mignon, réserver.","Faire revenir l''échalote.","Ajouter le bouillon et les pruneaux, réduire.","Ajouter la crème légère.","Trancher le porc et napper de sauce."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 360, 32, 12, 24, 4),

(uid, 'Bowl méditerranéen au poulet et houmous', '', 4, 20, 12,
'[{"id":"1","name":"Filets de poulet","quantity":"3","unit":""},{"id":"2","name":"Houmous","quantity":"100","unit":"g"},{"id":"3","name":"Tomates cerises","quantity":"150","unit":"g"},{"id":"4","name":"Concombre","quantity":"1","unit":""},{"id":"5","name":"Boulgour","quantity":"150","unit":"g"}]',
'["Cuire le boulgour selon les instructions.","Griller le poulet et trancher.","Couper tomates et concombre.","Dresser boulgour, légumes et poulet dans un bol.","Ajouter une cuillère de houmous."]',
'{"plat","riche-fibres"}',
true, 'approved', '', 420, 34, 12, 42, 4),

(uid, 'Émincé de veau au paprika, riz complet', '', 4, 15, 20,
'[{"id":"1","name":"Émincé de veau","quantity":"400","unit":"g"},{"id":"2","name":"Paprika","quantity":"1","unit":"c. à soupe"},{"id":"3","name":"Oignon","quantity":"1","unit":""},{"id":"4","name":"Crème légère","quantity":"3","unit":"c. à soupe"},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Faire revenir l''oignon avec le paprika.","Ajouter le veau, saisir 5 minutes.","Ajouter la crème légère, réchauffer 2 minutes.","Servir avec le riz complet."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 400, 32, 14, 36, 4),

(uid, 'Bowl de poulet rôti, courge et epinards', '', 4, 15, 30,
'[{"id":"1","name":"Filets de poulet","quantity":"3","unit":""},{"id":"2","name":"Courge butternut","quantity":"300","unit":"g"},{"id":"3","name":"Épinards frais","quantity":"150","unit":"g"},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Graines de courge","quantity":"15","unit":"g"}]',
'["Rôtir la courge en cubes 25 minutes à 200°C.","Griller le poulet et trancher.","Faire tomber les épinards.","Dresser courge, épinards et poulet dans un bol.","Parsemer de graines de courge."]',
'{"plat","riche-fibres"}',
true, 'approved', '', 360, 32, 11, 32, 4);

END $$;
