-- BIEN-ÊTRE — Entrées (50 recettes)
-- Nutrition estimée manuellement à la création (pas d'appel Gemini) : indicative.
-- tags : colonne text[] Postgres (littéral '{"a","b"}'), pas du JSON.

DO $$
DECLARE
  uid uuid := '97a98e5c-d29d-4a9f-9d84-0684eef75fe6'::uuid;
BEGIN

-- ═══════════════════════════════════════════════════
-- 🥗 SALADES COMPOSÉES & CRUDITÉS (13)
-- ═══════════════════════════════════════════════════

INSERT INTO recipes (user_id, title, source_url, servings, prep_time, cook_time, ingredients, steps, tags, is_public, moderation_status, user_notes, nutrition_calories, nutrition_proteins, nutrition_fat, nutrition_carbs, nutrition_base) VALUES

(uid, 'Salade de quinoa, concombre et menthe', '', 4, 15, 0,
'[{"id":"1","name":"Quinoa cuit","quantity":"200","unit":"g"},{"id":"2","name":"Concombre","quantity":"1","unit":""},{"id":"3","name":"Feta","quantity":"80","unit":"g"},{"id":"4","name":"Menthe fraîche","quantity":"","unit":"quelques feuilles"},{"id":"5","name":"Citron","quantity":"1","unit":""},{"id":"6","name":"Huile d''olive","quantity":"2","unit":"c. à soupe"}]',
'["Couper le concombre en petits dés.","Mélanger le quinoa cuit refroidi avec le concombre.","Émietter la feta par-dessus.","Ciseler la menthe et l''ajouter.","Arroser de jus de citron et d''huile d''olive avant de servir."]',
'{"entree","riche-fibres"}',
true, 'approved', '', 220, 7, 10, 26, 4),

(uid, 'Salade de betteraves, chèvre et noix', '', 4, 10, 0,
'[{"id":"1","name":"Betteraves cuites","quantity":"300","unit":"g"},{"id":"2","name":"Fromage de chèvre frais","quantity":"100","unit":"g"},{"id":"3","name":"Cerneaux de noix","quantity":"40","unit":"g"},{"id":"4","name":"Roquette","quantity":"60","unit":"g"},{"id":"5","name":"Vinaigre balsamique","quantity":"1","unit":"c. à soupe"},{"id":"6","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Couper les betteraves en cubes.","Disposer la roquette dans les assiettes.","Ajouter les betteraves et émietter le chèvre par-dessus.","Parsemer de noix concassées.","Arroser de vinaigre balsamique et d''huile d''olive."]',
'{"entree"}',
true, 'approved', '', 220, 8, 16, 12, 4),

(uid, 'Carpaccio de courgettes au parmesan', '', 4, 10, 0,
'[{"id":"1","name":"Courgettes crues fermes","quantity":"2","unit":""},{"id":"2","name":"Parmesan en copeaux","quantity":"40","unit":"g"},{"id":"3","name":"Pignons de pin","quantity":"20","unit":"g"},{"id":"4","name":"Citron","quantity":"1","unit":""},{"id":"5","name":"Huile d''olive","quantity":"2","unit":"c. à soupe"},{"id":"6","name":"Sel, poivre","quantity":"","unit":""}]',
'["Trancher les courgettes très finement à la mandoline.","Disposer en rosace dans les assiettes.","Arroser de jus de citron et d''huile d''olive.","Parsemer de copeaux de parmesan et de pignons.","Saler légèrement, poivrer."]',
'{"entree","sans-gluten"}',
true, 'approved', '', 140, 5, 11, 4, 4),

(uid, 'Salade de lentilles, feta et tomates séchées', '', 4, 10, 0,
'[{"id":"1","name":"Lentilles vertes cuites","quantity":"250","unit":"g"},{"id":"2","name":"Feta","quantity":"80","unit":"g"},{"id":"3","name":"Tomates séchées","quantity":"40","unit":"g"},{"id":"4","name":"Persil plat","quantity":"","unit":"quelques brins"},{"id":"5","name":"Huile d''olive","quantity":"2","unit":"c. à soupe"},{"id":"6","name":"Vinaigre de vin","quantity":"1","unit":"c. à soupe"}]',
'["Mélanger les lentilles avec les tomates séchées coupées en lanières.","Émietter la feta par-dessus.","Ciseler le persil et l''ajouter.","Arroser d''huile d''olive et de vinaigre.","Mélanger délicatement avant de servir."]',
'{"entree","riche-fibres","riche-proteines"}',
true, 'approved', '', 260, 12, 14, 22, 4),

(uid, 'Salade César allégée au poulet grillé', '', 4, 15, 10,
'[{"id":"1","name":"Laitue romaine","quantity":"1","unit":""},{"id":"2","name":"Filets de poulet","quantity":"2","unit":""},{"id":"3","name":"Parmesan râpé","quantity":"30","unit":"g"},{"id":"4","name":"Yaourt grec 0%","quantity":"3","unit":"c. à soupe"},{"id":"5","name":"Citron","quantity":"1","unit":""},{"id":"6","name":"Ail","quantity":"1","unit":"gousse"}]',
'["Griller le poulet 6 minutes de chaque côté, laisser reposer puis trancher.","Laver et couper la romaine.","Mélanger le yaourt, le jus de citron et l''ail pressé pour la sauce.","Disposer la salade, ajouter le poulet tranché.","Napper de sauce et parsemer de parmesan."]',
'{"entree","riche-proteines"}',
true, 'approved', 'Sauce César allégée au yaourt plutôt qu''à la mayonnaise', 220, 20, 10, 10, 4),

(uid, 'Taboulé de chou-fleur sans céréales', '', 4, 15, 0,
'[{"id":"1","name":"Chou-fleur","quantity":"400","unit":"g"},{"id":"2","name":"Persil plat","quantity":"","unit":"1 bouquet"},{"id":"3","name":"Menthe fraîche","quantity":"","unit":"quelques feuilles"},{"id":"4","name":"Tomate","quantity":"2","unit":""},{"id":"5","name":"Citron","quantity":"1","unit":""},{"id":"6","name":"Huile d''olive","quantity":"2","unit":"c. à soupe"}]',
'["Mixer le chou-fleur cru par impulsions jusqu''à obtenir une texture semoule.","Couper la tomate en petits dés.","Ciseler finement le persil et la menthe.","Mélanger tous les ingrédients.","Assaisonner de jus de citron et d''huile d''olive."]',
'{"entree","ig-bas","vegan"}',
true, 'approved', 'Alternative légère au taboulé traditionnel au boulgour', 110, 3, 8, 8, 4),

(uid, 'Salade d''endives, pommes et noix', '', 4, 10, 0,
'[{"id":"1","name":"Endives","quantity":"3","unit":""},{"id":"2","name":"Pomme","quantity":"1","unit":""},{"id":"3","name":"Cerneaux de noix","quantity":"40","unit":"g"},{"id":"4","name":"Roquefort léger","quantity":"50","unit":"g"},{"id":"5","name":"Vinaigre de cidre","quantity":"1","unit":"c. à soupe"},{"id":"6","name":"Huile de noix","quantity":"1","unit":"c. à soupe"}]',
'["Émincer les endives.","Couper la pomme en fines tranches.","Mélanger endives et pomme.","Émietter le roquefort et parsemer de noix concassées.","Arroser de vinaigre et d''huile de noix."]',
'{"entree"}',
true, 'approved', '', 180, 6, 13, 12, 4),

(uid, 'Salade de pois chiches, poivrons et coriandre', '', 4, 10, 0,
'[{"id":"1","name":"Pois chiches cuits","quantity":"300","unit":"g"},{"id":"2","name":"Poivron rouge","quantity":"1","unit":""},{"id":"3","name":"Oignon rouge","quantity":"0.5","unit":""},{"id":"4","name":"Coriandre fraîche","quantity":"","unit":"quelques brins"},{"id":"5","name":"Citron","quantity":"1","unit":""},{"id":"6","name":"Cumin","quantity":"1","unit":"c. à café"},{"id":"7","name":"Huile d''olive","quantity":"2","unit":"c. à soupe"}]',
'["Couper le poivron et l''oignon rouge en petits dés.","Mélanger avec les pois chiches.","Ciseler la coriandre et l''ajouter.","Assaisonner de jus de citron, cumin et huile d''olive.","Laisser reposer 10 minutes avant de servir pour que les saveurs se mêlent."]',
'{"entree","vegan","riche-fibres"}',
true, 'approved', '', 220, 9, 10, 26, 4),

(uid, 'Salade grecque légère', '', 4, 10, 0,
'[{"id":"1","name":"Tomates","quantity":"4","unit":""},{"id":"2","name":"Concombre","quantity":"1","unit":""},{"id":"3","name":"Poivron vert","quantity":"1","unit":""},{"id":"4","name":"Feta","quantity":"100","unit":"g"},{"id":"5","name":"Olives noires","quantity":"40","unit":"g"},{"id":"6","name":"Origan séché","quantity":"1","unit":"c. à café"},{"id":"7","name":"Huile d''olive","quantity":"2","unit":"c. à soupe"}]',
'["Couper tomates, concombre et poivron en gros morceaux.","Mélanger dans un saladier.","Ajouter les olives et la feta en tranches.","Parsemer d''origan.","Arroser d''huile d''olive avant de servir."]',
'{"entree","ig-bas"}',
true, 'approved', '', 180, 6, 14, 8, 4),

(uid, 'Salade de riz complet, edamame et carotte', '', 4, 10, 0,
'[{"id":"1","name":"Riz complet cuit","quantity":"250","unit":"g"},{"id":"2","name":"Edamame","quantity":"150","unit":"g"},{"id":"3","name":"Carotte","quantity":"1","unit":""},{"id":"4","name":"Graines de sésame","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"},{"id":"6","name":"Huile de sésame","quantity":"1","unit":"c. à café"}]',
'["Râper la carotte.","Mélanger le riz complet froid avec la carotte et les edamame.","Arroser de sauce soja et d''huile de sésame.","Parsemer de graines de sésame.","Mélanger avant de servir."]',
'{"entree","vegan","riche-fibres"}',
true, 'approved', '', 260, 9, 8, 40, 4),

(uid, 'Salade de pousses d''épinards, fraises et amandes', '', 4, 10, 0,
'[{"id":"1","name":"Pousses d''épinards","quantity":"150","unit":"g"},{"id":"2","name":"Fraises","quantity":"200","unit":"g"},{"id":"3","name":"Amandes effilées","quantity":"30","unit":"g"},{"id":"4","name":"Vinaigre balsamique","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Laver les pousses d''épinards.","Couper les fraises en quartiers.","Mélanger épinards et fraises.","Parsemer d''amandes effilées.","Arroser de vinaigre balsamique et d''huile d''olive."]',
'{"entree","riche-fibres"}',
true, 'approved', '', 140, 4, 10, 10, 4),

(uid, 'Salade de haricots verts, tomates et œuf mollet', '', 4, 15, 8,
'[{"id":"1","name":"Haricots verts","quantity":"300","unit":"g"},{"id":"2","name":"Tomates cerises","quantity":"150","unit":"g"},{"id":"3","name":"Œufs","quantity":"4","unit":""},{"id":"4","name":"Échalote","quantity":"1","unit":""},{"id":"5","name":"Moutarde","quantity":"1","unit":"c. à café"},{"id":"6","name":"Huile d''olive","quantity":"2","unit":"c. à soupe"}]',
'["Cuire les haricots verts à l''eau bouillante salée 8 minutes, puis rafraîchir.","Cuire les œufs mollets 6 minutes, écaler.","Mélanger haricots verts, tomates cerises coupées et échalote émincée.","Préparer une vinaigrette avec la moutarde et l''huile d''olive.","Dresser avec l''œuf mollet coupé en deux, arroser de vinaigrette."]',
'{"entree","ig-bas"}',
true, 'approved', '', 160, 8, 10, 10, 4),

(uid, 'Salade de boulgour, courgette grillée et feta', '', 4, 15, 8,
'[{"id":"1","name":"Boulgour cuit","quantity":"200","unit":"g"},{"id":"2","name":"Courgette","quantity":"1","unit":""},{"id":"3","name":"Feta","quantity":"80","unit":"g"},{"id":"4","name":"Menthe fraîche","quantity":"","unit":"quelques feuilles"},{"id":"5","name":"Citron","quantity":"1","unit":""},{"id":"6","name":"Huile d''olive","quantity":"2","unit":"c. à soupe"}]',
'["Griller les tranches de courgette 3 minutes de chaque côté.","Mélanger le boulgour cuit avec la courgette grillée coupée en dés.","Émietter la feta par-dessus.","Ciseler la menthe et l''ajouter.","Arroser de jus de citron et d''huile d''olive."]',
'{"entree","riche-fibres"}',
true, 'approved', '', 240, 8, 10, 30, 4),

-- ═══════════════════════════════════════════════════
-- 🍲 SOUPES FROIDES, VELOUTÉS LÉGERS & GASPACHOS (12)
-- ═══════════════════════════════════════════════════

(uid, 'Gaspacho de tomates et basilic', '', 4, 15, 0,
'[{"id":"1","name":"Tomates bien mûres","quantity":"800","unit":"g"},{"id":"2","name":"Concombre","quantity":"0.5","unit":""},{"id":"3","name":"Poivron rouge","quantity":"0.5","unit":""},{"id":"4","name":"Ail","quantity":"1","unit":"gousse"},{"id":"5","name":"Basilic frais","quantity":"","unit":"quelques feuilles"},{"id":"6","name":"Huile d''olive","quantity":"2","unit":"c. à soupe"},{"id":"7","name":"Vinaigre de vin","quantity":"1","unit":"c. à soupe"}]',
'["Couper grossièrement tous les légumes.","Mixer avec l''ail, le basilic, l''huile et le vinaigre jusqu''à consistance lisse.","Filtrer si désiré pour une texture plus fine.","Réserver au réfrigérateur au moins 2 heures.","Servir bien frais."]',
'{"entree","vegan","ig-bas"}',
true, 'approved', '', 120, 3, 8, 10, 4),

(uid, 'Velouté de courgettes léger', '', 4, 10, 15,
'[{"id":"1","name":"Courgettes","quantity":"600","unit":"g"},{"id":"2","name":"Oignon","quantity":"1","unit":""},{"id":"3","name":"Bouillon de légumes léger","quantity":"600","unit":"ml"},{"id":"4","name":"Crème légère","quantity":"2","unit":"c. à soupe"},{"id":"5","name":"Sel, poivre","quantity":"","unit":""}]',
'["Faire revenir l''oignon émincé sans matière grasse.","Ajouter les courgettes coupées en morceaux et le bouillon.","Cuire 15 minutes jusqu''à ce que les courgettes soient tendres.","Mixer jusqu''à consistance lisse.","Incorporer la crème légère, saler et poivrer."]',
'{"entree","ig-bas","vegan"}',
true, 'approved', '', 90, 4, 4, 10, 4),

(uid, 'Soupe froide de concombre et yaourt', '', 4, 10, 0,
'[{"id":"1","name":"Concombre","quantity":"2","unit":""},{"id":"2","name":"Yaourt grec 0%","quantity":"300","unit":"g"},{"id":"3","name":"Ail","quantity":"1","unit":"gousse"},{"id":"4","name":"Menthe fraîche","quantity":"","unit":"quelques feuilles"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Peler et épépiner le concombre.","Mixer le concombre avec le yaourt et l''ail.","Ajouter la menthe ciselée.","Réserver au réfrigérateur au moins 1 heure.","Arroser d''un filet d''huile d''olive avant de servir."]',
'{"entree","ig-bas","riche-proteines"}',
true, 'approved', 'Version liquide et rafraîchissante du tzatziki', 90, 6, 4, 8, 4),

(uid, 'Velouté de petits pois à la menthe', '', 4, 10, 12,
'[{"id":"1","name":"Petits pois surgelés","quantity":"400","unit":"g"},{"id":"2","name":"Oignon","quantity":"1","unit":""},{"id":"3","name":"Bouillon de légumes léger","quantity":"500","unit":"ml"},{"id":"4","name":"Menthe fraîche","quantity":"","unit":"quelques feuilles"}]',
'["Faire revenir l''oignon émincé sans matière grasse.","Ajouter les petits pois et le bouillon.","Cuire 10 minutes.","Mixer avec la menthe jusqu''à consistance lisse.","Servir chaud ou froid selon la saison."]',
'{"entree","riche-fibres","vegan"}',
true, 'approved', '', 130, 7, 3, 18, 4),

(uid, 'Velouté de carottes au gingembre léger', '', 4, 10, 15,
'[{"id":"1","name":"Carottes","quantity":"500","unit":"g"},{"id":"2","name":"Gingembre frais","quantity":"1","unit":"morceau"},{"id":"3","name":"Oignon","quantity":"1","unit":""},{"id":"4","name":"Bouillon de légumes léger","quantity":"600","unit":"ml"}]',
'["Faire revenir l''oignon émincé sans matière grasse.","Ajouter les carottes en rondelles, le gingembre râpé et le bouillon.","Cuire 15 minutes jusqu''à ce que les carottes soient tendres.","Mixer jusqu''à consistance lisse.","Servir chaud."]',
'{"entree","vegan","ig-bas"}',
true, 'approved', '', 100, 2, 3, 16, 4),

(uid, 'Gaspacho de melon et menthe', '', 4, 10, 0,
'[{"id":"1","name":"Melon","quantity":"600","unit":"g"},{"id":"2","name":"Concombre","quantity":"0.5","unit":""},{"id":"3","name":"Menthe fraîche","quantity":"","unit":"quelques feuilles"},{"id":"4","name":"Citron vert","quantity":"1","unit":""}]',
'["Couper le melon et le concombre en morceaux, épépiner le melon.","Mixer avec la menthe et le jus de citron vert.","Filtrer si désiré.","Réserver au réfrigérateur au moins 2 heures.","Servir très frais."]',
'{"entree","vegan","ig-bas"}',
true, 'approved', '', 90, 2, 0, 20, 4),

(uid, 'Velouté de champignons léger', '', 4, 10, 15,
'[{"id":"1","name":"Champignons de Paris","quantity":"400","unit":"g"},{"id":"2","name":"Oignon","quantity":"1","unit":""},{"id":"3","name":"Bouillon de légumes léger","quantity":"500","unit":"ml"},{"id":"4","name":"Crème légère","quantity":"2","unit":"c. à soupe"},{"id":"5","name":"Persil","quantity":"","unit":"quelques brins"}]',
'["Faire revenir l''oignon émincé sans matière grasse.","Ajouter les champignons émincés et le bouillon.","Cuire 12 minutes.","Mixer jusqu''à consistance lisse.","Incorporer la crème légère, parsemer de persil."]',
'{"entree","ig-bas"}',
true, 'approved', '', 100, 5, 4, 10, 4),

(uid, 'Soupe froide d''avocat et citron vert', '', 4, 10, 0,
'[{"id":"1","name":"Avocats","quantity":"2","unit":""},{"id":"2","name":"Bouillon de légumes léger froid","quantity":"400","unit":"ml"},{"id":"3","name":"Citron vert","quantity":"1","unit":""},{"id":"4","name":"Coriandre fraîche","quantity":"","unit":"quelques brins"}]',
'["Mixer la chair des avocats avec le bouillon froid.","Ajouter le jus de citron vert.","Mixer jusqu''à consistance lisse et onctueuse.","Réserver au réfrigérateur.","Parsemer de coriandre ciselée avant de servir."]',
'{"entree","vegan"}',
true, 'approved', '', 180, 4, 15, 8, 4),

(uid, 'Velouté de brocoli léger', '', 4, 10, 15,
'[{"id":"1","name":"Brocoli","quantity":"400","unit":"g"},{"id":"2","name":"Oignon","quantity":"1","unit":""},{"id":"3","name":"Bouillon de légumes léger","quantity":"600","unit":"ml"},{"id":"4","name":"Crème légère","quantity":"2","unit":"c. à soupe"}]',
'["Faire revenir l''oignon émincé sans matière grasse.","Ajouter le brocoli coupé en bouquets et le bouillon.","Cuire 15 minutes.","Mixer jusqu''à consistance lisse.","Incorporer la crème légère."]',
'{"entree","riche-fibres","ig-bas"}',
true, 'approved', '', 100, 6, 4, 10, 4),

(uid, 'Gaspacho de betterave et pomme', '', 4, 10, 0,
'[{"id":"1","name":"Betteraves cuites","quantity":"300","unit":"g"},{"id":"2","name":"Pomme","quantity":"1","unit":""},{"id":"3","name":"Concombre","quantity":"0.5","unit":""},{"id":"4","name":"Yaourt nature","quantity":"100","unit":"g"},{"id":"5","name":"Citron","quantity":"1","unit":""}]',
'["Couper la betterave, la pomme et le concombre en morceaux.","Mixer avec le yaourt et le jus de citron.","Ajouter un peu d''eau si nécessaire pour la consistance.","Réserver au réfrigérateur.","Servir bien frais."]',
'{"entree","vegan","riche-fibres"}',
true, 'approved', '', 110, 4, 2, 20, 4),

(uid, 'Velouté de potiron léger à la muscade', '', 4, 10, 18,
'[{"id":"1","name":"Potiron","quantity":"500","unit":"g"},{"id":"2","name":"Oignon","quantity":"1","unit":""},{"id":"3","name":"Bouillon de légumes léger","quantity":"600","unit":"ml"},{"id":"4","name":"Noix de muscade","quantity":"1","unit":"pincée"}]',
'["Faire revenir l''oignon émincé sans matière grasse.","Ajouter le potiron coupé en cubes et le bouillon.","Cuire 18 minutes jusqu''à ce que le potiron soit tendre.","Mixer avec la muscade jusqu''à consistance lisse.","Servir chaud."]',
'{"entree","vegan","ig-bas"}',
true, 'approved', '', 110, 3, 3, 18, 4),

(uid, 'Soupe froide de petits pois et menthe express', '', 4, 8, 8,
'[{"id":"1","name":"Petits pois surgelés","quantity":"400","unit":"g"},{"id":"2","name":"Bouillon de légumes léger","quantity":"400","unit":"ml"},{"id":"3","name":"Menthe fraîche","quantity":"","unit":"quelques feuilles"},{"id":"4","name":"Citron","quantity":"1","unit":""}]',
'["Cuire les petits pois 5 minutes dans le bouillon chaud.","Mixer avec la menthe et le jus de citron.","Réserver au réfrigérateur au moins 1 heure.","Servir bien frais."]',
'{"entree","riche-fibres","vegan"}',
true, 'approved', '', 120, 7, 3, 16, 4),

-- ═══════════════════════════════════════════════════
-- 🥄 VERRINES, TARTARES & CARPACCIOS (13)
-- ═══════════════════════════════════════════════════

(uid, 'Verrine avocat-crevettes légère', '', 4, 15, 0,
'[{"id":"1","name":"Avocat","quantity":"1","unit":""},{"id":"2","name":"Crevettes cuites décortiquées","quantity":"200","unit":"g"},{"id":"3","name":"Citron","quantity":"1","unit":""},{"id":"4","name":"Coriandre fraîche","quantity":"","unit":"quelques brins"}]',
'["Couper l''avocat en petits dés, arroser de jus de citron.","Répartir dans des verrines.","Ajouter les crevettes par-dessus.","Parsemer de coriandre ciselée.","Servir bien frais."]',
'{"entree","riche-proteines"}',
true, 'approved', '', 180, 14, 11, 6, 4),

(uid, 'Tartare de saumon à l''avocat et citron vert', '', 4, 15, 0,
'[{"id":"1","name":"Saumon frais très frais","quantity":"300","unit":"g"},{"id":"2","name":"Avocat","quantity":"1","unit":""},{"id":"3","name":"Citron vert","quantity":"1","unit":""},{"id":"4","name":"Échalote","quantity":"1","unit":""},{"id":"5","name":"Coriandre fraîche","quantity":"","unit":"quelques brins"}]',
'["Couper le saumon en petits dés.","Couper l''avocat en dés également.","Mélanger avec l''échalote ciselée, le jus de citron vert et la coriandre.","Réserver au frais 10 minutes.","Dresser en cercle et servir bien frais."]',
'{"entree","riche-proteines"}',
true, 'approved', 'Saumon impérativement très frais, qualité tartare', 220, 18, 15, 4, 4),

(uid, 'Carpaccio de bœuf, roquette et parmesan', '', 4, 15, 0,
'[{"id":"1","name":"Filet de bœuf","quantity":"300","unit":"g"},{"id":"2","name":"Roquette","quantity":"60","unit":"g"},{"id":"3","name":"Parmesan en copeaux","quantity":"30","unit":"g"},{"id":"4","name":"Citron","quantity":"1","unit":""},{"id":"5","name":"Huile d''olive","quantity":"2","unit":"c. à soupe"}]',
'["Trancher le bœuf très finement (le placer 30 minutes au congélateur facilite la découpe).","Disposer les tranches sur des assiettes.","Parsemer de roquette et de copeaux de parmesan.","Arroser de jus de citron et d''huile d''olive.","Servir aussitôt."]',
'{"entree","riche-proteines"}',
true, 'approved', '', 180, 22, 9, 1, 4),

(uid, 'Verrine de concombre, fromage frais et saumon fumé', '', 4, 15, 0,
'[{"id":"1","name":"Concombre","quantity":"1","unit":""},{"id":"2","name":"Fromage frais allégé","quantity":"100","unit":"g"},{"id":"3","name":"Saumon fumé","quantity":"100","unit":"g"},{"id":"4","name":"Aneth frais","quantity":"","unit":"quelques brins"}]',
'["Couper le concombre en petits dés.","Répartir le fromage frais dans le fond des verrines.","Ajouter le concombre.","Garnir de saumon fumé coupé en lanières.","Parsemer d''aneth avant de servir."]',
'{"entree","riche-proteines"}',
true, 'approved', '', 140, 10, 8, 4, 4),

(uid, 'Tartare de thon à l''asiatique', '', 4, 15, 0,
'[{"id":"1","name":"Thon rouge très frais","quantity":"300","unit":"g"},{"id":"2","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"},{"id":"3","name":"Huile de sésame","quantity":"1","unit":"c. à café"},{"id":"4","name":"Gingembre frais","quantity":"1","unit":"morceau"},{"id":"5","name":"Oignon vert","quantity":"1","unit":""}]',
'["Couper le thon en petits dés.","Mélanger avec la sauce soja, l''huile de sésame et le gingembre râpé.","Ajouter l''oignon vert émincé.","Réserver au frais 10 minutes.","Dresser en cercle et servir bien frais."]',
'{"entree","riche-proteines"}',
true, 'approved', 'Thon impérativement très frais, qualité tartare', 200, 24, 9, 4, 4),

(uid, 'Carpaccio de betteraves et chèvre frais', '', 4, 15, 0,
'[{"id":"1","name":"Betteraves cuites","quantity":"300","unit":"g"},{"id":"2","name":"Fromage de chèvre frais","quantity":"80","unit":"g"},{"id":"3","name":"Noisettes concassées","quantity":"20","unit":"g"},{"id":"4","name":"Vinaigre balsamique","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Trancher les betteraves très finement.","Disposer en rosace dans les assiettes.","Émietter le chèvre frais par-dessus.","Parsemer de noisettes concassées.","Arroser de vinaigre balsamique et d''huile d''olive."]',
'{"entree"}',
true, 'approved', '', 160, 6, 11, 10, 4),

(uid, 'Verrine de petits pois, menthe et chèvre frais', '', 4, 15, 5,
'[{"id":"1","name":"Petits pois cuits","quantity":"200","unit":"g"},{"id":"2","name":"Fromage de chèvre frais","quantity":"80","unit":"g"},{"id":"3","name":"Menthe fraîche","quantity":"","unit":"quelques feuilles"}]',
'["Mixer les petits pois avec un peu de menthe jusqu''à obtenir une purée grossière.","Répartir dans des verrines.","Ajouter le chèvre frais émietté par-dessus.","Décorer de feuilles de menthe.","Servir frais."]',
'{"entree","riche-fibres"}',
true, 'approved', '', 140, 7, 8, 10, 4),

(uid, 'Tartare de courgette crue, tomate et basilic', '', 4, 15, 0,
'[{"id":"1","name":"Courgette","quantity":"1","unit":""},{"id":"2","name":"Tomate","quantity":"2","unit":""},{"id":"3","name":"Basilic frais","quantity":"","unit":"quelques feuilles"},{"id":"4","name":"Citron","quantity":"1","unit":""},{"id":"5","name":"Huile d''olive","quantity":"2","unit":"c. à soupe"}]',
'["Couper la courgette et la tomate en très petits dés.","Ciseler le basilic.","Mélanger tous les ingrédients.","Assaisonner de jus de citron et d''huile d''olive.","Réserver au frais avant de servir."]',
'{"entree","vegan","ig-bas"}',
true, 'approved', '', 90, 2, 7, 6, 4),

(uid, 'Carpaccio de saumon mariné aux agrumes', '', 4, 15, 0,
'[{"id":"1","name":"Saumon frais très frais","quantity":"300","unit":"g"},{"id":"2","name":"Orange","quantity":"1","unit":""},{"id":"3","name":"Citron","quantity":"1","unit":""},{"id":"4","name":"Aneth frais","quantity":"","unit":"quelques brins"},{"id":"5","name":"Huile d''olive","quantity":"2","unit":"c. à soupe"}]',
'["Trancher le saumon très finement.","Disposer sur des assiettes.","Arroser de jus d''orange et de citron, laisser mariner 10 minutes au frais.","Arroser d''huile d''olive.","Parsemer d''aneth avant de servir."]',
'{"entree","riche-proteines"}',
true, 'approved', 'Saumon impérativement très frais', 220, 18, 15, 4, 4),

(uid, 'Verrine tomate-mozzarella-basilic', '', 4, 15, 0,
'[{"id":"1","name":"Tomate","quantity":"2","unit":""},{"id":"2","name":"Mozzarella allégée","quantity":"150","unit":"g"},{"id":"3","name":"Basilic frais","quantity":"","unit":"quelques feuilles"},{"id":"4","name":"Vinaigre balsamique","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Couper la tomate et la mozzarella en petits dés.","Alterner en couches dans des verrines.","Ciseler le basilic et l''ajouter.","Arroser de vinaigre balsamique et d''huile d''olive.","Servir frais."]',
'{"entree","riche-proteines"}',
true, 'approved', '', 160, 10, 11, 6, 4),

(uid, 'Tartare de tomates et concombre à la feta', '', 4, 15, 0,
'[{"id":"1","name":"Tomate","quantity":"3","unit":""},{"id":"2","name":"Concombre","quantity":"0.5","unit":""},{"id":"3","name":"Feta","quantity":"60","unit":"g"},{"id":"4","name":"Menthe fraîche","quantity":"","unit":"quelques feuilles"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Couper la tomate et le concombre en petits dés.","Émietter la feta.","Mélanger tous les ingrédients avec la menthe ciselée.","Arroser d''huile d''olive.","Réserver au frais avant de servir."]',
'{"entree","ig-bas"}',
true, 'approved', '', 140, 6, 10, 8, 4),

(uid, 'Verrine d''houmous et crudités croquantes', '', 4, 15, 0,
'[{"id":"1","name":"Houmous","quantity":"200","unit":"g"},{"id":"2","name":"Carotte","quantity":"1","unit":""},{"id":"3","name":"Concombre","quantity":"0.5","unit":""},{"id":"4","name":"Radis","quantity":"4","unit":""}]',
'["Répartir l''houmous dans le fond des verrines.","Couper les légumes en très petits bâtonnets ou dés.","Disposer les légumes par-dessus l''houmous.","Servir frais avec une petite cuillère."]',
'{"entree","vegan","riche-fibres"}',
true, 'approved', '', 160, 6, 9, 15, 4),

(uid, 'Carpaccio d''ananas au poivre et menthe', '', 4, 10, 0,
'[{"id":"1","name":"Ananas frais","quantity":"400","unit":"g"},{"id":"2","name":"Poivre noir","quantity":"1","unit":"pincée"},{"id":"3","name":"Menthe fraîche","quantity":"","unit":"quelques feuilles"},{"id":"4","name":"Citron vert","quantity":"1","unit":""}]',
'["Trancher l''ananas très finement.","Disposer en rosace dans les assiettes.","Arroser de jus de citron vert.","Parsemer de poivre noir fraîchement moulu et de menthe ciselée.","Servir frais en entrée surprenante."]',
'{"entree","vegan","ig-bas"}',
true, 'approved', 'Entrée fraîcheur, le poivre relève le sucré de l''ananas', 70, 1, 0, 17, 4),

-- ═══════════════════════════════════════════════════
-- 🍆 LÉGUMES FARCIS, TIANS & BOUCHÉES LÉGÈRES (12)
-- ═══════════════════════════════════════════════════

(uid, 'Tomates farcies légères au thon', '', 4, 15, 0,
'[{"id":"1","name":"Tomates","quantity":"4","unit":""},{"id":"2","name":"Thon au naturel","quantity":"150","unit":"g"},{"id":"3","name":"Yaourt grec 0%","quantity":"2","unit":"c. à soupe"},{"id":"4","name":"Échalote","quantity":"1","unit":""},{"id":"5","name":"Persil","quantity":"","unit":"quelques brins"}]',
'["Couper le chapeau des tomates et évider délicatement.","Égoutter le thon, l''émietter.","Mélanger avec le yaourt, l''échalote ciselée et le persil.","Garnir les tomates de cette préparation.","Réserver au frais avant de servir."]',
'{"entree","riche-proteines"}',
true, 'approved', '', 160, 14, 7, 10, 4),

(uid, 'Champignons farcis aux herbes et fromage frais', '', 4, 15, 12,
'[{"id":"1","name":"Gros champignons de Paris","quantity":"8","unit":""},{"id":"2","name":"Fromage frais léger","quantity":"100","unit":"g"},{"id":"3","name":"Ail","quantity":"1","unit":"gousse"},{"id":"4","name":"Persil","quantity":"","unit":"quelques brins"},{"id":"5","name":"Chapelure","quantity":"2","unit":"c. à soupe"}]',
'["Préchauffer le four à 190°C.","Retirer les pieds des champignons, les hacher finement.","Mélanger les pieds hachés avec le fromage frais, l''ail et le persil.","Garnir les chapeaux de champignons, parsemer de chapelure.","Cuire 12 minutes au four."]',
'{"entree"}',
true, 'approved', '', 120, 6, 7, 8, 4),

(uid, 'Tian de légumes provençal en portions individuelles', '', 4, 15, 30,
'[{"id":"1","name":"Courgette","quantity":"1","unit":""},{"id":"2","name":"Aubergine","quantity":"1","unit":""},{"id":"3","name":"Tomate","quantity":"2","unit":""},{"id":"4","name":"Oignon","quantity":"1","unit":""},{"id":"5","name":"Thym","quantity":"","unit":"quelques branches"},{"id":"6","name":"Huile d''olive","quantity":"2","unit":"c. à soupe"}]',
'["Préchauffer le four à 180°C.","Couper tous les légumes en fines rondelles.","Faire revenir l''oignon émincé au fond de petits plats individuels.","Disposer les rondelles de légumes en les intercalant, arroser d''huile d''olive.","Parsemer de thym, cuire 25-30 minutes au four."]',
'{"entree","vegan","ig-bas"}',
true, 'approved', '', 110, 3, 7, 10, 4),

(uid, 'Asperges vertes, vinaigrette légère aux œufs mimosa', '', 4, 10, 8,
'[{"id":"1","name":"Asperges vertes","quantity":"500","unit":"g"},{"id":"2","name":"Œuf","quantity":"1","unit":""},{"id":"3","name":"Moutarde","quantity":"1","unit":"c. à café"},{"id":"4","name":"Huile d''olive","quantity":"2","unit":"c. à soupe"},{"id":"5","name":"Vinaigre de vin","quantity":"1","unit":"c. à soupe"}]',
'["Cuire les asperges à la vapeur 8 minutes.","Cuire l''œuf dur, l''écaler et le hacher finement.","Préparer une vinaigrette avec la moutarde, le vinaigre et l''huile.","Dresser les asperges, parsemer d''œuf mimosa.","Napper de vinaigrette."]',
'{"entree","ig-bas"}',
true, 'approved', '', 130, 6, 9, 6, 4),

(uid, 'Poireaux vinaigrette légers', '', 4, 10, 15,
'[{"id":"1","name":"Poireaux","quantity":"4","unit":""},{"id":"2","name":"Moutarde","quantity":"1","unit":"c. à café"},{"id":"3","name":"Vinaigre de vin","quantity":"1","unit":"c. à soupe"},{"id":"4","name":"Échalote","quantity":"1","unit":""},{"id":"5","name":"Huile d''olive","quantity":"2","unit":"c. à soupe"}]',
'["Cuire les poireaux (partie blanche) à l''eau bouillante salée 15 minutes.","Égoutter et laisser refroidir.","Préparer une vinaigrette avec la moutarde, le vinaigre et l''huile.","Ajouter l''échalote ciselée à la vinaigrette.","Napper les poireaux de vinaigrette avant de servir."]',
'{"entree","vegan","ig-bas"}',
true, 'approved', '', 110, 3, 8, 8, 4),

(uid, 'Artichauts vapeur, sauce yaourt-citron', '', 4, 15, 30,
'[{"id":"1","name":"Artichauts","quantity":"4","unit":""},{"id":"2","name":"Yaourt grec 0%","quantity":"150","unit":"g"},{"id":"3","name":"Citron","quantity":"1","unit":""},{"id":"4","name":"Ciboulette","quantity":"","unit":"quelques brins"}]',
'["Cuire les artichauts à la vapeur 30 minutes jusqu''à ce qu''une feuille se détache facilement.","Préparer la sauce en mélangeant le yaourt, le jus de citron et la ciboulette ciselée.","Laisser tiédir les artichauts.","Servir avec la sauce à part pour tremper les feuilles."]',
'{"entree","ig-bas","riche-fibres"}',
true, 'approved', '', 90, 5, 2, 14, 4),

(uid, 'Involtini de courgettes au chèvre et menthe', '', 4, 15, 8,
'[{"id":"1","name":"Courgette","quantity":"2","unit":""},{"id":"2","name":"Fromage de chèvre frais","quantity":"100","unit":"g"},{"id":"3","name":"Menthe fraîche","quantity":"","unit":"quelques feuilles"},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Couper les courgettes en fines lanières dans le sens de la longueur.","Griller les lanières 2 minutes de chaque côté dans une poêle légèrement huilée.","Tartiner de chèvre frais et déposer une feuille de menthe.","Rouler chaque lanière sur elle-même.","Maintenir avec un pique et servir tiède ou froid."]',
'{"entree"}',
true, 'approved', '', 140, 8, 10, 4, 4),

(uid, 'Rouleaux de printemps légers aux crevettes', '', 4, 25, 0,
'[{"id":"1","name":"Galettes de riz","quantity":"8","unit":""},{"id":"2","name":"Crevettes cuites décortiquées","quantity":"200","unit":"g"},{"id":"3","name":"Vermicelles de riz cuits","quantity":"80","unit":"g"},{"id":"4","name":"Carotte","quantity":"1","unit":""},{"id":"5","name":"Menthe fraîche","quantity":"","unit":"quelques feuilles"}]',
'["Râper la carotte en fine julienne.","Tremper une galette de riz dans l''eau tiède quelques secondes.","Garnir de vermicelles, carotte, menthe et crevettes.","Rouler fermement en repliant les côtés.","Répéter pour les autres rouleaux et servir frais."]',
'{"entree","riche-proteines"}',
true, 'approved', '', 180, 12, 3, 28, 4),

(uid, 'Brochettes de melon et jambon cru', '', 4, 10, 0,
'[{"id":"1","name":"Melon","quantity":"400","unit":"g"},{"id":"2","name":"Jambon cru dégraissé","quantity":"8","unit":"tranches"}]',
'["Couper le melon en cubes.","Retirer le gras du jambon cru et couper en lanières.","Enrouler chaque cube de melon dans une lanière de jambon.","Enfiler sur des piques en bois.","Servir bien frais."]',
'{"entree","ig-bas"}',
true, 'approved', '', 90, 7, 3, 8, 4),

(uid, 'Mini-poivrons farcis au fromage frais et herbes', '', 4, 15, 0,
'[{"id":"1","name":"Mini poivrons","quantity":"12","unit":""},{"id":"2","name":"Fromage frais léger","quantity":"120","unit":"g"},{"id":"3","name":"Ciboulette","quantity":"","unit":"quelques brins"},{"id":"4","name":"Ail","quantity":"1","unit":"gousse"}]',
'["Couper les mini poivrons en deux, épépiner.","Mélanger le fromage frais avec la ciboulette ciselée et l''ail pressé.","Garnir chaque moitié de poivron avec cette préparation à la poche à douille ou à la cuillère.","Réserver au frais avant de servir."]',
'{"entree"}',
true, 'approved', '', 110, 6, 7, 6, 4),

(uid, 'Œufs mimosa légers au yaourt', '', 4, 15, 8,
'[{"id":"1","name":"Œufs","quantity":"6","unit":""},{"id":"2","name":"Yaourt grec 0%","quantity":"3","unit":"c. à soupe"},{"id":"3","name":"Moutarde","quantity":"1","unit":"c. à café"},{"id":"4","name":"Ciboulette","quantity":"","unit":"quelques brins"}]',
'["Cuire les œufs durs 9 minutes, les rafraîchir et écaler.","Couper en deux, retirer les jaunes.","Écraser les jaunes avec le yaourt et la moutarde.","Garnir les blancs de cette préparation à la cuillère.","Parsemer de ciboulette ciselée."]',
'{"entree","riche-proteines"}',
true, 'approved', 'Sauce allégée au yaourt plutôt qu''à la mayonnaise', 120, 10, 8, 2, 4),

(uid, 'Salade de crevettes, pamplemousse et avocat', '', 4, 20, 0,
'[{"id":"1","name":"Crevettes cuites décortiquées","quantity":"300","unit":"g"},{"id":"2","name":"Pamplemousse","quantity":"1","unit":""},{"id":"3","name":"Avocat","quantity":"1","unit":""},{"id":"4","name":"Mâche","quantity":"80","unit":"g"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Peler le pamplemousse à vif et détailler en suprêmes.","Couper l''avocat en tranches.","Disposer la mâche dans les assiettes.","Ajouter pamplemousse, avocat et crevettes.","Arroser d''un filet d''huile d''olive avant de servir."]',
'{"entree","riche-proteines"}',
true, 'approved', '', 200, 16, 13, 10, 4);

END $$;
