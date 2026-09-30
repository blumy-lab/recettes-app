-- BIEN-ÊTRE — LOT 2 — Végétarien, légumineuses & céréales complètes (80 plats)
-- Nutrition estimée manuellement à la création (pas d'appel Gemini) : indicative.

DO $$
DECLARE
  uid uuid := '97a98e5c-d29d-4a9f-9d84-0684eef75fe6'::uuid;
BEGIN

-- ═══════════════════════════════════════════════════
-- 🫘 LÉGUMINEUSES (20)
-- ═══════════════════════════════════════════════════

INSERT INTO recipes (user_id, title, source_url, servings, prep_time, cook_time, ingredients, steps, tags, is_public, moderation_status, user_notes, nutrition_calories, nutrition_proteins, nutrition_fat, nutrition_carbs, nutrition_base) VALUES

(uid, 'Curry de pois chiches et épinards', '', 4, 15, 25,
'[{"id":"1","name":"Pois chiches cuits","quantity":"400","unit":"g"},{"id":"2","name":"Épinards frais","quantity":"200","unit":"g"},{"id":"3","name":"Lait de coco allégé","quantity":"200","unit":"ml"},{"id":"4","name":"Curry en poudre","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Oignon","quantity":"1","unit":""},{"id":"6","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Faire revenir l''oignon émincé.","Ajouter le curry, mélanger 1 minute.","Ajouter les pois chiches et le lait de coco.","Laisser mijoter 15 minutes.","Ajouter les épinards, cuire 3 minutes.","Servir avec le riz complet."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 420, 16, 12, 62, 4),

(uid, 'Dahl de lentilles corail', '', 4, 10, 25,
'[{"id":"1","name":"Lentilles corail","quantity":"250","unit":"g"},{"id":"2","name":"Lait de coco allégé","quantity":"200","unit":"ml"},{"id":"3","name":"Curcuma","quantity":"1","unit":"c. à café"},{"id":"4","name":"Cumin","quantity":"1","unit":"c. à café"},{"id":"5","name":"Oignon","quantity":"1","unit":""},{"id":"6","name":"Coriandre fraîche","quantity":"","unit":"quelques feuilles"}]',
'["Faire revenir l''oignon avec cumin et curcuma.","Ajouter les lentilles rincées et couvrir d''eau.","Cuire 20 minutes à couvert.","Ajouter le lait de coco, mijoter 5 minutes.","Parsemer de coriandre avant de servir."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 380, 18, 10, 55, 4),

(uid, 'Chili sin carne aux haricots rouges', '', 4, 15, 30,
'[{"id":"1","name":"Haricots rouges cuits","quantity":"400","unit":"g"},{"id":"2","name":"Tomates concassées","quantity":"400","unit":"g"},{"id":"3","name":"Poivron","quantity":"1","unit":""},{"id":"4","name":"Oignon","quantity":"1","unit":""},{"id":"5","name":"Cumin","quantity":"1","unit":"c. à café"},{"id":"6","name":"Piment doux","quantity":"1","unit":"c. à café"}]',
'["Faire revenir oignon et poivron émincés.","Ajouter les épices, mélanger 1 minute.","Ajouter les tomates et les haricots rouges.","Laisser mijoter 25 minutes.","Servir chaud."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 340, 16, 6, 55, 4),

(uid, 'Salade tiède de lentilles vertes et feta', '', 4, 15, 20,
'[{"id":"1","name":"Lentilles vertes","quantity":"250","unit":"g"},{"id":"2","name":"Feta","quantity":"100","unit":"g"},{"id":"3","name":"Tomates cerises","quantity":"150","unit":"g"},{"id":"4","name":"Persil","quantity":"","unit":"quelques brins"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Cuire les lentilles 20 minutes à l''eau, égoutter.","Couper les tomates cerises en deux.","Mélanger lentilles tièdes, tomates et huile.","Émietter la feta dessus.","Parsemer de persil avant de servir."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 380, 20, 15, 42, 4),

(uid, 'Falafels au four, sauce yaourt-tahin', '', 4, 25, 20,
'[{"id":"1","name":"Pois chiches cuits","quantity":"400","unit":"g"},{"id":"2","name":"Ail","quantity":"2","unit":"gousses"},{"id":"3","name":"Coriandre fraîche","quantity":"","unit":"1 bouquet"},{"id":"4","name":"Cumin","quantity":"1","unit":"c. à café"},{"id":"5","name":"Yaourt nature","quantity":"100","unit":"g"},{"id":"6","name":"Tahin","quantity":"1","unit":"c. à soupe"}]',
'["Mixer pois chiches, ail, coriandre et cumin.","Former des boulettes.","Cuire au four 20 minutes à 200°C en retournant à mi-cuisson.","Mélanger yaourt et tahin pour la sauce.","Servir les falafels avec la sauce."]',
'["plat", "riche-fibres"]',
true, 'approved', 'Cuits au four, pas frits', 360, 17, 12, 45, 4),

(uid, 'Ragoût de haricots blancs aux légumes', '', 4, 15, 30,
'[{"id":"1","name":"Haricots blancs cuits","quantity":"400","unit":"g"},{"id":"2","name":"Carotte","quantity":"2","unit":""},{"id":"3","name":"Céleri","quantity":"1","unit":"branche"},{"id":"4","name":"Tomates concassées","quantity":"300","unit":"g"},{"id":"5","name":"Thym","quantity":"1","unit":"c. à café"}]',
'["Faire revenir carotte et céleri en dés.","Ajouter les tomates et le thym.","Ajouter les haricots blancs.","Laisser mijoter 25 minutes.","Servir chaud."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 320, 15, 4, 55, 4),

(uid, 'Bowl de pois chiches rôtis et légumes croquants', '', 4, 15, 20,
'[{"id":"1","name":"Pois chiches cuits","quantity":"400","unit":"g"},{"id":"2","name":"Paprika fumé","quantity":"1","unit":"c. à café"},{"id":"3","name":"Concombre","quantity":"1","unit":""},{"id":"4","name":"Tomates","quantity":"2","unit":""},{"id":"5","name":"Yaourt nature","quantity":"3","unit":"c. à soupe"}]',
'["Préchauffer le four à 200°C.","Enrober les pois chiches de paprika et d''un filet d''huile.","Rôtir 20 minutes jusqu''à croustillant.","Couper concombre et tomates.","Dresser avec le yaourt en sauce."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 350, 16, 9, 50, 4),

(uid, 'Curry de lentilles et patate douce', '', 4, 15, 25,
'[{"id":"1","name":"Lentilles vertes","quantity":"200","unit":"g"},{"id":"2","name":"Patate douce","quantity":"1","unit":""},{"id":"3","name":"Lait de coco allégé","quantity":"200","unit":"ml"},{"id":"4","name":"Curry en poudre","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Oignon","quantity":"1","unit":""}]',
'["Faire revenir l''oignon avec le curry.","Ajouter la patate douce en cubes et les lentilles.","Couvrir d''eau et de lait de coco.","Laisser mijoter 25 minutes.","Servir chaud."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 400, 15, 11, 60, 4),

(uid, 'Salade de haricots noirs, maïs et avocat', '', 4, 15, 0,
'[{"id":"1","name":"Haricots noirs cuits","quantity":"350","unit":"g"},{"id":"2","name":"Maïs","quantity":"150","unit":"g"},{"id":"3","name":"Avocat","quantity":"1","unit":""},{"id":"4","name":"Citron vert","quantity":"1","unit":""},{"id":"5","name":"Coriandre fraîche","quantity":"","unit":"quelques feuilles"}]',
'["Mélanger haricots noirs et maïs.","Couper l''avocat en dés.","Ajouter à la salade.","Arroser de jus de citron vert.","Parsemer de coriandre."]',
'["plat", "riche-fibres"]',
true, 'approved', 'Sans cuisson, rapide', 380, 15, 14, 48, 4),

(uid, 'Pois chiches à la tomate et paprika', '', 4, 10, 20,
'[{"id":"1","name":"Pois chiches cuits","quantity":"400","unit":"g"},{"id":"2","name":"Tomates concassées","quantity":"400","unit":"g"},{"id":"3","name":"Paprika","quantity":"1","unit":"c. à café"},{"id":"4","name":"Ail","quantity":"2","unit":"gousses"},{"id":"5","name":"Persil","quantity":"","unit":"quelques brins"}]',
'["Faire revenir l''ail dans un peu d''huile.","Ajouter le paprika et les tomates.","Ajouter les pois chiches.","Laisser mijoter 15 minutes.","Parsemer de persil."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 330, 15, 6, 52, 4),

(uid, 'Galettes de lentilles et carotte', '', 4, 20, 15,
'[{"id":"1","name":"Lentilles corail cuites","quantity":"300","unit":"g"},{"id":"2","name":"Carotte râpée","quantity":"1","unit":""},{"id":"3","name":"Œuf","quantity":"1","unit":""},{"id":"4","name":"Chapelure complète","quantity":"40","unit":"g"},{"id":"5","name":"Cumin","quantity":"1","unit":"c. à café"}]',
'["Mixer les lentilles avec la carotte, l''œuf, la chapelure et le cumin.","Former des galettes.","Cuire à la poêle 4 minutes de chaque côté.","Servir chaud avec une salade."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 320, 17, 9, 42, 4),

(uid, 'Cocotte de haricots blancs façon cassoulet léger', '', 4, 15, 30,
'[{"id":"1","name":"Haricots blancs cuits","quantity":"400","unit":"g"},{"id":"2","name":"Saucisse de volaille","quantity":"2","unit":""},{"id":"3","name":"Tomates concassées","quantity":"300","unit":"g"},{"id":"4","name":"Ail","quantity":"2","unit":"gousses"},{"id":"5","name":"Thym","quantity":"1","unit":"c. à café"}]',
'["Faire dorer la saucisse coupée en tranches.","Ajouter l''ail et les tomates.","Ajouter les haricots blancs et le thym.","Laisser mijoter 25 minutes.","Servir chaud."]',
'["plat", "riche-fibres"]',
true, 'approved', 'Version allégée avec saucisse de volaille', 380, 22, 11, 45, 4),

(uid, 'Curry de pois cassés jaunes', '', 4, 10, 30,
'[{"id":"1","name":"Pois cassés jaunes","quantity":"250","unit":"g"},{"id":"2","name":"Curcuma","quantity":"1","unit":"c. à café"},{"id":"3","name":"Gingembre","quantity":"1","unit":"morceau"},{"id":"4","name":"Oignon","quantity":"1","unit":""},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Faire revenir l''oignon et le gingembre.","Ajouter le curcuma et les pois cassés rincés.","Couvrir d''eau, cuire 30 minutes.","Cuire le riz complet.","Servir ensemble."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 390, 17, 4, 68, 4),

(uid, 'Poêlée de haricots verts et pois chiches à l''ail', '', 4, 10, 15,
'[{"id":"1","name":"Haricots verts","quantity":"300","unit":"g"},{"id":"2","name":"Pois chiches cuits","quantity":"300","unit":"g"},{"id":"3","name":"Ail","quantity":"2","unit":"gousses"},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Amandes effilées","quantity":"20","unit":"g"}]',
'["Cuire les haricots verts à la vapeur 8 minutes.","Faire revenir l''ail dans l''huile.","Ajouter les pois chiches et les haricots verts.","Sauter 5 minutes.","Parsemer d''amandes effilées."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 340, 15, 14, 38, 4),

(uid, 'Lentilles béluga, betterave et noix', '', 4, 15, 20,
'[{"id":"1","name":"Lentilles béluga","quantity":"200","unit":"g"},{"id":"2","name":"Betterave cuite","quantity":"200","unit":"g"},{"id":"3","name":"Noix","quantity":"30","unit":"g"},{"id":"4","name":"Vinaigre balsamique","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Mâche","quantity":"60","unit":"g"}]',
'["Cuire les lentilles 20 minutes à l''eau.","Couper la betterave en dés.","Mélanger lentilles, betterave et mâche.","Parsemer de noix concassées.","Arroser de vinaigre balsamique."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 360, 16, 14, 42, 4),

(uid, 'Curry de haricots rouges et épinards', '', 4, 15, 25,
'[{"id":"1","name":"Haricots rouges cuits","quantity":"400","unit":"g"},{"id":"2","name":"Épinards frais","quantity":"200","unit":"g"},{"id":"3","name":"Lait de coco allégé","quantity":"200","unit":"ml"},{"id":"4","name":"Curry en poudre","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Faire chauffer le curry avec un peu d''huile.","Ajouter le lait de coco et les haricots.","Mijoter 15 minutes.","Ajouter les épinards, cuire 3 minutes.","Servir avec le riz complet."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 420, 17, 12, 62, 4),

(uid, 'Salade de pois chiches, feta et menthe', '', 4, 15, 0,
'[{"id":"1","name":"Pois chiches cuits","quantity":"400","unit":"g"},{"id":"2","name":"Feta","quantity":"100","unit":"g"},{"id":"3","name":"Menthe fraîche","quantity":"","unit":"quelques feuilles"},{"id":"4","name":"Concombre","quantity":"1","unit":""},{"id":"5","name":"Citron","quantity":"1","unit":""}]',
'["Mélanger pois chiches et concombre en dés.","Émietter la feta.","Ajouter la menthe ciselée.","Arroser de jus de citron.","Servir frais."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 380, 19, 16, 40, 4),

(uid, 'Mijoté de lentilles et légumes racines', '', 4, 15, 30,
'[{"id":"1","name":"Lentilles vertes","quantity":"250","unit":"g"},{"id":"2","name":"Carotte","quantity":"2","unit":""},{"id":"3","name":"Panais","quantity":"1","unit":""},{"id":"4","name":"Bouillon de légumes","quantity":"600","unit":"ml"},{"id":"5","name":"Thym","quantity":"1","unit":"c. à café"}]',
'["Couper carotte et panais en dés.","Faire revenir les légumes 5 minutes.","Ajouter les lentilles et le bouillon.","Laisser mijoter 25 minutes.","Servir chaud."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 350, 17, 3, 62, 4),

(uid, 'Tacos de haricots noirs et avocat', '', 4, 15, 10,
'[{"id":"1","name":"Haricots noirs cuits","quantity":"350","unit":"g"},{"id":"2","name":"Tortillas de blé complet","quantity":"8","unit":""},{"id":"3","name":"Avocat","quantity":"1","unit":""},{"id":"4","name":"Tomates","quantity":"2","unit":""},{"id":"5","name":"Citron vert","quantity":"1","unit":""}]',
'["Réchauffer les haricots noirs écrasés grossièrement.","Couper avocat et tomates en dés.","Garnir les tortillas de haricots, avocat et tomates.","Arroser de jus de citron vert.","Servir chaud."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 400, 16, 13, 55, 4),

(uid, 'Soupe-repas de pois cassés et lardons de dinde', '', 4, 15, 35,
'[{"id":"1","name":"Pois cassés verts","quantity":"250","unit":"g"},{"id":"2","name":"Lardons de dinde","quantity":"80","unit":"g"},{"id":"3","name":"Carotte","quantity":"1","unit":""},{"id":"4","name":"Oignon","quantity":"1","unit":""},{"id":"5","name":"Bouillon de légumes","quantity":"800","unit":"ml"}]',
'["Faire revenir oignon, carotte et lardons de dinde.","Ajouter les pois cassés et le bouillon.","Laisser mijoter 30 minutes.","Mixer partiellement pour une texture épaisse.","Servir chaud."]',
'["plat", "riche-fibres"]',
true, 'approved', 'Une soupe assez épaisse pour constituer un plat', 340, 20, 6, 50, 4),

-- ═══════════════════════════════════════════════════
-- 🌾 CÉRÉALES COMPLÈTES & QUINOA (20)
-- ═══════════════════════════════════════════════════

(uid, 'Bowl de quinoa, pois chiches et légumes rôtis', '', 4, 15, 25,
'[{"id":"1","name":"Quinoa","quantity":"200","unit":"g"},{"id":"2","name":"Pois chiches cuits","quantity":"250","unit":"g"},{"id":"3","name":"Courgette","quantity":"1","unit":""},{"id":"4","name":"Poivron","quantity":"1","unit":""},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Cuire le quinoa selon les instructions.","Couper courgette et poivron, rôtir au four 20 minutes à 200°C.","Mélanger quinoa, pois chiches et légumes rôtis.","Arroser d''huile d''olive.","Servir tiède ou froid."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 420, 16, 11, 62, 4),

(uid, 'Risotto d''orge aux champignons', '', 4, 15, 30,
'[{"id":"1","name":"Orge perlé","quantity":"200","unit":"g"},{"id":"2","name":"Champignons de Paris","quantity":"300","unit":"g"},{"id":"3","name":"Bouillon de légumes","quantity":"700","unit":"ml"},{"id":"4","name":"Parmesan râpé","quantity":"30","unit":"g"},{"id":"5","name":"Persil","quantity":"","unit":"quelques brins"}]',
'["Faire revenir les champignons émincés.","Ajouter l''orge, mélanger.","Verser le bouillon louche par louche en remuant.","Cuire 25-30 minutes jusqu''à absorption.","Ajouter le parmesan et le persil."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 380, 12, 8, 65, 4),

(uid, 'Bol de boulgour, pois chiches et grenade', '', 4, 15, 12,
'[{"id":"1","name":"Boulgour","quantity":"200","unit":"g"},{"id":"2","name":"Pois chiches cuits","quantity":"200","unit":"g"},{"id":"3","name":"Grenade","quantity":"1/2","unit":""},{"id":"4","name":"Menthe fraîche","quantity":"","unit":"quelques feuilles"},{"id":"5","name":"Citron","quantity":"1","unit":""}]',
'["Cuire le boulgour selon les instructions.","Égrainer la grenade.","Mélanger boulgour, pois chiches et grenade.","Ajouter la menthe ciselée.","Arroser de jus de citron."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 380, 14, 6, 68, 4),

(uid, 'Riz complet sauté aux légumes et œuf', '', 4, 15, 15,
'[{"id":"1","name":"Riz complet cuit","quantity":"400","unit":"g"},{"id":"2","name":"Œufs","quantity":"2","unit":""},{"id":"3","name":"Petits pois","quantity":"150","unit":"g"},{"id":"4","name":"Carotte","quantity":"1","unit":""},{"id":"5","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"}]',
'["Faire revenir la carotte en dés.","Ajouter le riz, sauter 3 minutes.","Pousser sur le côté, brouiller les œufs.","Ajouter les petits pois et mélanger.","Arroser de sauce soja."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 380, 15, 10, 58, 4),

(uid, 'Quinoa aux légumes méditerranéens et olives', '', 4, 15, 15,
'[{"id":"1","name":"Quinoa","quantity":"200","unit":"g"},{"id":"2","name":"Courgette","quantity":"1","unit":""},{"id":"3","name":"Tomates cerises","quantity":"150","unit":"g"},{"id":"4","name":"Olives noires","quantity":"40","unit":"g"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Cuire le quinoa selon les instructions.","Poêler la courgette en dés.","Mélanger quinoa, courgette, tomates et olives.","Arroser d''huile d''olive.","Servir tiède."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 390, 12, 13, 55, 4),

(uid, 'Pilaf de riz complet aux amandes et raisins secs', '', 4, 10, 30,
'[{"id":"1","name":"Riz complet","quantity":"250","unit":"g"},{"id":"2","name":"Amandes effilées","quantity":"30","unit":"g"},{"id":"3","name":"Raisins secs","quantity":"30","unit":"g"},{"id":"4","name":"Oignon","quantity":"1","unit":""},{"id":"5","name":"Bouillon de légumes","quantity":"500","unit":"ml"}]',
'["Faire revenir l''oignon émincé.","Ajouter le riz, mélanger 2 minutes.","Verser le bouillon, cuire 25 minutes à couvert.","Ajouter amandes et raisins secs en fin de cuisson.","Servir chaud."]',
'["plat"]',
true, 'approved', '', 400, 9, 9, 72, 4),

(uid, 'Buddha bowl quinoa, patate douce et tofu', '', 4, 20, 25,
'[{"id":"1","name":"Quinoa","quantity":"180","unit":"g"},{"id":"2","name":"Tofu ferme","quantity":"250","unit":"g"},{"id":"3","name":"Patate douce","quantity":"1","unit":""},{"id":"4","name":"Épinards frais","quantity":"100","unit":"g"},{"id":"5","name":"Sauce soja légère","quantity":"1","unit":"c. à soupe"}]',
'["Cuire le quinoa selon les instructions.","Rôtir la patate douce en cubes 20 minutes au four à 200°C.","Poêler le tofu en dés jusqu''à doré, arroser de sauce soja.","Faire tomber les épinards.","Dresser tous les éléments dans un bol."]',
'["plat", "riche-proteines"]',
true, 'approved', '', 420, 20, 14, 55, 4),

(uid, 'Riz complet au tofu sauté et brocolis', '', 4, 15, 15,
'[{"id":"1","name":"Riz complet","quantity":"200","unit":"g"},{"id":"2","name":"Tofu ferme","quantity":"250","unit":"g"},{"id":"3","name":"Brocolis","quantity":"250","unit":"g"},{"id":"4","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"},{"id":"5","name":"Gingembre","quantity":"1","unit":"morceau"}]',
'["Cuire le riz complet.","Poêler le tofu en dés jusqu''à doré.","Ajouter le brocoli et le gingembre râpé, sauter 6 minutes.","Arroser de sauce soja.","Servir avec le riz."]',
'["plat", "riche-proteines"]',
true, 'approved', '', 400, 19, 12, 52, 4),

(uid, 'Semoule complète aux légumes du couscous', '', 4, 15, 30,
'[{"id":"1","name":"Semoule complète","quantity":"200","unit":"g"},{"id":"2","name":"Carotte","quantity":"2","unit":""},{"id":"3","name":"Courgette","quantity":"1","unit":""},{"id":"4","name":"Pois chiches cuits","quantity":"200","unit":"g"},{"id":"5","name":"Bouillon de légumes","quantity":"600","unit":"ml"}]',
'["Cuire les légumes et les pois chiches dans le bouillon 25 minutes.","Préparer la semoule complète selon les instructions.","Servir la semoule avec les légumes et un peu de bouillon."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 380, 13, 4, 72, 4),

(uid, 'Riz sauvage, champignons et noisettes', '', 4, 10, 35,
'[{"id":"1","name":"Riz sauvage","quantity":"200","unit":"g"},{"id":"2","name":"Champignons de Paris","quantity":"250","unit":"g"},{"id":"3","name":"Noisettes","quantity":"30","unit":"g"},{"id":"4","name":"Persil","quantity":"","unit":"quelques brins"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Cuire le riz sauvage 35 minutes.","Poêler les champignons dans l''huile.","Mélanger riz et champignons.","Parsemer de noisettes concassées et de persil."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 370, 11, 12, 55, 4),

(uid, 'Bowl de sarrasin, légumes rôtis et tahin', '', 4, 15, 20,
'[{"id":"1","name":"Sarrasin","quantity":"180","unit":"g"},{"id":"2","name":"Chou-fleur","quantity":"300","unit":"g"},{"id":"3","name":"Carotte","quantity":"2","unit":""},{"id":"4","name":"Tahin","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Citron","quantity":"1/2","unit":""}]',
'["Cuire le sarrasin selon les instructions.","Rôtir chou-fleur et carotte au four 20 minutes à 200°C.","Mélanger tahin et citron pour la sauce.","Dresser sarrasin et légumes.","Napper de sauce tahin-citron."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 400, 13, 12, 58, 4),

(uid, 'Épeautre aux légumes d''été', '', 4, 15, 30,
'[{"id":"1","name":"Épeautre","quantity":"200","unit":"g"},{"id":"2","name":"Courgette","quantity":"1","unit":""},{"id":"3","name":"Aubergine","quantity":"1","unit":""},{"id":"4","name":"Tomates","quantity":"2","unit":""},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Cuire l''épeautre 25-30 minutes à l''eau.","Poêler courgette et aubergine en dés.","Ajouter les tomates concassées.","Mélanger avec l''épeautre cuit.","Arroser d''huile d''olive."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 370, 11, 8, 65, 4),

(uid, 'Riz complet, tofu mariné et edamame', '', 4, 20, 15,
'[{"id":"1","name":"Riz complet","quantity":"200","unit":"g"},{"id":"2","name":"Tofu ferme","quantity":"250","unit":"g"},{"id":"3","name":"Edamame","quantity":"150","unit":"g"},{"id":"4","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"},{"id":"5","name":"Gingembre","quantity":"1","unit":"morceau"}]',
'["Mariner le tofu en dés dans la sauce soja et le gingembre 15 minutes.","Cuire le riz complet.","Poêler le tofu mariné jusqu''à doré.","Cuire les edamame 5 minutes à l''eau.","Dresser tous les éléments dans un bol."]',
'["plat", "riche-proteines"]',
true, 'approved', '', 410, 21, 13, 50, 4),

(uid, 'Polenta crémeuse aux champignons', '', 4, 10, 20,
'[{"id":"1","name":"Polenta","quantity":"200","unit":"g"},{"id":"2","name":"Champignons mélangés","quantity":"300","unit":"g"},{"id":"3","name":"Bouillon de légumes","quantity":"800","unit":"ml"},{"id":"4","name":"Parmesan râpé","quantity":"30","unit":"g"},{"id":"5","name":"Persil","quantity":"","unit":"quelques brins"}]',
'["Porter le bouillon à ébullition, verser la polenta en pluie.","Cuire 5-8 minutes en remuant.","Poêler les champignons à part.","Ajouter le parmesan à la polenta.","Servir la polenta nappée de champignons."]',
'["plat"]',
true, 'approved', '', 350, 10, 8, 58, 4),

(uid, 'Quinoa aux poivrons farcis végétariens', '', 4, 20, 30,
'[{"id":"1","name":"Poivrons","quantity":"4","unit":""},{"id":"2","name":"Quinoa cuit","quantity":"250","unit":"g"},{"id":"3","name":"Pois chiches cuits","quantity":"150","unit":"g"},{"id":"4","name":"Tomates concassées","quantity":"150","unit":"g"},{"id":"5","name":"Cumin","quantity":"1","unit":"c. à café"}]',
'["Préchauffer le four à 190°C.","Couper le chapeau des poivrons, évider.","Mélanger quinoa, pois chiches, tomates et cumin.","Farcir les poivrons de ce mélange.","Cuire 30 minutes au four."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 360, 14, 5, 62, 4),

(uid, 'Riz complet, curry de légumes et cajou', '', 4, 15, 25,
'[{"id":"1","name":"Riz complet","quantity":"200","unit":"g"},{"id":"2","name":"Chou-fleur","quantity":"250","unit":"g"},{"id":"3","name":"Carotte","quantity":"2","unit":""},{"id":"4","name":"Lait de coco allégé","quantity":"200","unit":"ml"},{"id":"5","name":"Noix de cajou","quantity":"30","unit":"g"}]',
'["Cuire le riz complet.","Faire revenir chou-fleur et carotte.","Ajouter le curry et le lait de coco, mijoter 15 minutes.","Parsemer de noix de cajou concassées.","Servir avec le riz."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 430, 11, 16, 62, 4),

(uid, 'Taboulé de quinoa, pois chiches et grenade', '', 4, 15, 12,
'[{"id":"1","name":"Quinoa","quantity":"180","unit":"g"},{"id":"2","name":"Pois chiches cuits","quantity":"200","unit":"g"},{"id":"3","name":"Persil","quantity":"","unit":"1 bouquet"},{"id":"4","name":"Grenade","quantity":"1/2","unit":""},{"id":"5","name":"Citron","quantity":"1","unit":""}]',
'["Cuire le quinoa et laisser refroidir.","Égrainer la grenade.","Mélanger quinoa, pois chiches, persil haché et grenade.","Arroser de jus de citron.","Servir frais."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 400, 16, 6, 65, 4),

(uid, 'Bowl de millet, légumes rôtis et houmous', '', 4, 15, 25,
'[{"id":"1","name":"Millet","quantity":"180","unit":"g"},{"id":"2","name":"Houmous","quantity":"100","unit":"g"},{"id":"3","name":"Courgette","quantity":"1","unit":""},{"id":"4","name":"Poivron","quantity":"1","unit":""},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Cuire le millet selon les instructions.","Rôtir courgette et poivron au four 20 minutes à 200°C.","Dresser millet et légumes dans un bol.","Ajouter une quenelle de houmous.","Arroser d''huile d''olive."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 400, 13, 12, 58, 4),

(uid, 'Riz complet aux lentilles et oignons confits', '', 4, 15, 30,
'[{"id":"1","name":"Riz complet","quantity":"150","unit":"g"},{"id":"2","name":"Lentilles vertes","quantity":"150","unit":"g"},{"id":"3","name":"Oignons","quantity":"3","unit":""},{"id":"4","name":"Cumin","quantity":"1","unit":"c. à café"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Cuire riz et lentilles séparément.","Faire caraméliser les oignons émincés doucement 20 minutes.","Mélanger riz, lentilles et cumin.","Dresser avec les oignons confits dessus."]',
'["plat", "riche-fibres"]',
true, 'approved', 'Version simplifiée du mujadara libanais', 400, 14, 9, 68, 4),

-- ═══════════════════════════════════════════════════
-- 🥦 TOFU, TEMPEH & ŒUFS (20)
-- ═══════════════════════════════════════════════════

(uid, 'Tofu sauté au sésame et brocolis', '', 4, 15, 12,
'[{"id":"1","name":"Tofu ferme","quantity":"400","unit":"g"},{"id":"2","name":"Brocolis","quantity":"300","unit":"g"},{"id":"3","name":"Graines de sésame","quantity":"1","unit":"c. à soupe"},{"id":"4","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Couper le tofu en cubes, poêler jusqu''à doré.","Ajouter le brocoli, sauter 6 minutes.","Arroser de sauce soja.","Parsemer de sésame.","Servir avec le riz complet."]',
'["plat", "riche-proteines"]',
true, 'approved', '', 380, 20, 14, 40, 4),

(uid, 'Tempeh mariné, riz complet et légumes vapeur', '', 4, 20, 15,
'[{"id":"1","name":"Tempeh","quantity":"300","unit":"g"},{"id":"2","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"},{"id":"3","name":"Gingembre","quantity":"1","unit":"morceau"},{"id":"4","name":"Riz complet","quantity":"200","unit":"g"},{"id":"5","name":"Brocolis","quantity":"200","unit":"g"}]',
'["Mariner le tempeh dans la sauce soja et le gingembre 15 minutes.","Cuire le riz complet.","Cuire les brocolis à la vapeur.","Poêler le tempeh mariné jusqu''à doré.","Servir ensemble."]',
'["plat", "riche-proteines"]',
true, 'approved', '', 400, 24, 15, 42, 4),

(uid, 'Omelette aux légumes et fines herbes', '', 4, 10, 12,
'[{"id":"1","name":"Œufs","quantity":"6","unit":""},{"id":"2","name":"Courgette","quantity":"1","unit":""},{"id":"3","name":"Poivron","quantity":"1","unit":""},{"id":"4","name":"Ciboulette","quantity":"","unit":"quelques brins"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à café"}]',
'["Battre les œufs avec la ciboulette.","Poêler courgette et poivron en dés.","Verser les œufs battus dessus.","Cuire à couvert à feu doux 8 minutes.","Servir chaud."]',
'["plat", "riche-proteines"]',
true, 'approved', '', 260, 18, 17, 8, 4),

(uid, 'Tofu grillé mariné au miso', '', 4, 20, 10,
'[{"id":"1","name":"Tofu ferme","quantity":"400","unit":"g"},{"id":"2","name":"Pâte de miso","quantity":"1","unit":"c. à soupe"},{"id":"3","name":"Miel","quantity":"1","unit":"c. à café"},{"id":"4","name":"Riz complet","quantity":"200","unit":"g"},{"id":"5","name":"Ciboule","quantity":"2","unit":"tiges"}]',
'["Mélanger miso et miel, badigeonner le tofu tranché.","Laisser mariner 15 minutes.","Griller le tofu 4 minutes de chaque côté.","Cuire le riz complet.","Parsemer de ciboule et servir."]',
'["plat", "riche-proteines"]',
true, 'approved', '', 390, 19, 12, 48, 4),

(uid, 'Shakshuka aux œufs et poivrons', '', 4, 10, 25,
'[{"id":"1","name":"Œufs","quantity":"4","unit":""},{"id":"2","name":"Tomates concassées","quantity":"500","unit":"g"},{"id":"3","name":"Poivrons","quantity":"2","unit":""},{"id":"4","name":"Cumin","quantity":"1","unit":"c. à café"},{"id":"5","name":"Paprika","quantity":"1","unit":"c. à café"}]',
'["Faire revenir les poivrons émincés.","Ajouter les tomates, cumin et paprika.","Laisser mijoter 15 minutes.","Creuser des puits et y casser les œufs.","Couvrir et cuire 8 minutes jusqu''à ce que les blancs soient pris."]',
'["plat", "riche-proteines"]',
true, 'approved', '', 280, 16, 14, 18, 4),

(uid, 'Tofu croustillant au four, sauce cacahuète légère', '', 4, 20, 20,
'[{"id":"1","name":"Tofu ferme","quantity":"400","unit":"g"},{"id":"2","name":"Fécule de maïs","quantity":"2","unit":"c. à soupe"},{"id":"3","name":"Beurre de cacahuète","quantity":"1","unit":"c. à soupe"},{"id":"4","name":"Sauce soja légère","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Couper le tofu en cubes, enrober de fécule.","Cuire au four 20 minutes à 200°C jusqu''à croustillant.","Mélanger beurre de cacahuète, sauce soja et un peu d''eau chaude.","Cuire le riz complet.","Napper le tofu de sauce et servir."]',
'["plat", "riche-proteines"]',
true, 'approved', '', 420, 21, 17, 45, 4),

(uid, 'Œufs pochés, lentilles et épinards', '', 4, 10, 20,
'[{"id":"1","name":"Œufs","quantity":"4","unit":""},{"id":"2","name":"Lentilles vertes cuites","quantity":"300","unit":"g"},{"id":"3","name":"Épinards frais","quantity":"150","unit":"g"},{"id":"4","name":"Vinaigre blanc","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Faire tomber les épinards à la poêle.","Réchauffer les lentilles avec l''huile.","Pocher les œufs 3 minutes dans l''eau vinaigrée frémissante.","Dresser lentilles et épinards, déposer un œuf poché dessus."]',
'["plat", "riche-proteines"]',
true, 'approved', '', 340, 22, 12, 32, 4),

(uid, 'Curry de tofu et légumes verts', '', 4, 15, 20,
'[{"id":"1","name":"Tofu ferme","quantity":"350","unit":"g"},{"id":"2","name":"Brocolis","quantity":"200","unit":"g"},{"id":"3","name":"Haricots verts","quantity":"150","unit":"g"},{"id":"4","name":"Lait de coco allégé","quantity":"200","unit":"ml"},{"id":"5","name":"Curry en poudre","quantity":"1","unit":"c. à soupe"}]',
'["Poêler le tofu jusqu''à doré, réserver.","Faire chauffer le curry avec le lait de coco.","Ajouter brocolis et haricots verts, cuire 8 minutes.","Remettre le tofu, mijoter 5 minutes.","Servir chaud."]',
'["plat", "riche-proteines"]',
true, 'approved', '', 380, 19, 20, 24, 4),

(uid, 'Frittata aux courgettes et parmesan', '', 4, 15, 20,
'[{"id":"1","name":"Œufs","quantity":"6","unit":""},{"id":"2","name":"Courgettes","quantity":"2","unit":""},{"id":"3","name":"Parmesan râpé","quantity":"30","unit":"g"},{"id":"4","name":"Oignon","quantity":"1","unit":""},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Préchauffer le four à 180°C.","Faire revenir oignon et courgettes en tranches.","Battre les œufs avec le parmesan.","Verser sur les légumes dans une poêle allant au four.","Cuire au four 15 minutes jusqu''à pris."]',
'["plat", "riche-proteines"]',
true, 'approved', '', 300, 19, 20, 8, 4),

(uid, 'Tofu au wok, légumes croquants et cacahuètes', '', 4, 15, 12,
'[{"id":"1","name":"Tofu ferme","quantity":"400","unit":"g"},{"id":"2","name":"Poivrons","quantity":"2","unit":""},{"id":"3","name":"Pousses de soja","quantity":"100","unit":"g"},{"id":"4","name":"Cacahuètes concassées","quantity":"20","unit":"g"},{"id":"5","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"}]',
'["Poêler le tofu en cubes jusqu''à doré.","Ajouter les poivrons émincés, sauter 5 minutes.","Ajouter les pousses de soja, cuire 2 minutes.","Arroser de sauce soja.","Parsemer de cacahuètes."]',
'["plat", "riche-proteines"]',
true, 'approved', '', 370, 20, 18, 28, 4),

(uid, 'Œufs brouillés aux champignons et ciboulette', '', 4, 10, 10,
'[{"id":"1","name":"Œufs","quantity":"6","unit":""},{"id":"2","name":"Champignons de Paris","quantity":"200","unit":"g"},{"id":"3","name":"Ciboulette","quantity":"","unit":"quelques brins"},{"id":"4","name":"Pain complet","quantity":"4","unit":"tranches"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à café"}]',
'["Poêler les champignons émincés dans l''huile.","Battre les œufs, verser dans la poêle.","Cuire en remuant doucement à feu doux.","Parsemer de ciboulette.","Servir avec le pain complet grillé."]',
'["plat", "riche-proteines"]',
true, 'approved', '', 320, 20, 16, 22, 4),

(uid, 'Tempeh sauté à l''ananas et poivrons', '', 4, 20, 12,
'[{"id":"1","name":"Tempeh","quantity":"300","unit":"g"},{"id":"2","name":"Ananas frais","quantity":"150","unit":"g"},{"id":"3","name":"Poivron","quantity":"1","unit":""},{"id":"4","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Couper le tempeh en lanières, poêler jusqu''à doré.","Ajouter le poivron émincé.","Ajouter l''ananas en dés, sauter 5 minutes.","Arroser de sauce soja.","Servir avec le riz complet."]',
'["plat", "riche-proteines"]',
true, 'approved', '', 400, 22, 13, 48, 4),

(uid, 'Tortilla espagnole légère aux pommes de terre', '', 4, 15, 25,
'[{"id":"1","name":"Œufs","quantity":"6","unit":""},{"id":"2","name":"Pommes de terre","quantity":"400","unit":"g"},{"id":"3","name":"Oignon","quantity":"1","unit":""},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Sel, poivre","quantity":"","unit":""}]',
'["Cuire les pommes de terre en fines tranches à la vapeur 10 minutes.","Faire revenir l''oignon dans l''huile.","Battre les œufs, ajouter pommes de terre et oignon.","Verser dans une poêle et cuire à couvert 8 minutes.","Retourner et cuire 5 minutes de plus."]',
'["plat", "riche-proteines"]',
true, 'approved', 'Cuite à la poêle plutôt qu''à la friture', 340, 17, 15, 32, 4),

(uid, 'Bowl de tofu, riz complet et légumes marinés', '', 4, 20, 15,
'[{"id":"1","name":"Tofu ferme","quantity":"350","unit":"g"},{"id":"2","name":"Riz complet","quantity":"200","unit":"g"},{"id":"3","name":"Carotte","quantity":"1","unit":""},{"id":"4","name":"Concombre","quantity":"1","unit":""},{"id":"5","name":"Vinaigre de riz","quantity":"1","unit":"c. à soupe"}]',
'["Cuire le riz complet.","Poêler le tofu en cubes jusqu''à doré.","Mariner carotte et concombre râpés dans le vinaigre de riz.","Dresser riz, tofu et légumes marinés dans un bol."]',
'["plat", "riche-proteines"]',
true, 'approved', '', 380, 18, 12, 48, 4),

(uid, 'Curry d''œufs durs à l''indienne', '', 4, 15, 20,
'[{"id":"1","name":"Œufs","quantity":"6","unit":""},{"id":"2","name":"Tomates concassées","quantity":"300","unit":"g"},{"id":"3","name":"Curry en poudre","quantity":"1","unit":"c. à soupe"},{"id":"4","name":"Oignon","quantity":"1","unit":""},{"id":"5","name":"Riz basmati complet","quantity":"200","unit":"g"}]',
'["Faire cuire les œufs durs, écaler.","Faire revenir l''oignon avec le curry.","Ajouter les tomates, mijoter 10 minutes.","Ajouter les œufs entiers, réchauffer 5 minutes.","Servir avec le riz basmati complet."]',
'["plat", "riche-proteines"]',
true, 'approved', '', 380, 20, 16, 35, 4),

(uid, 'Tofu laqué au tamari et graines de courge', '', 4, 20, 12,
'[{"id":"1","name":"Tofu ferme","quantity":"400","unit":"g"},{"id":"2","name":"Sauce tamari","quantity":"2","unit":"c. à soupe"},{"id":"3","name":"Graines de courge","quantity":"20","unit":"g"},{"id":"4","name":"Riz complet","quantity":"200","unit":"g"},{"id":"5","name":"Épinards frais","quantity":"100","unit":"g"}]',
'["Couper le tofu en tranches, mariner dans le tamari 15 minutes.","Cuire le riz complet.","Poêler le tofu jusqu''à caramélisé.","Faire tomber les épinards.","Dresser et parsemer de graines de courge."]',
'["plat", "riche-proteines", "sans-gluten"]',
true, 'approved', '', 390, 20, 15, 42, 4),

(uid, 'Œufs cocotte aux épinards et fromage frais', '', 4, 10, 15,
'[{"id":"1","name":"Œufs","quantity":"4","unit":""},{"id":"2","name":"Épinards frais","quantity":"200","unit":"g"},{"id":"3","name":"Fromage frais léger","quantity":"60","unit":"g"},{"id":"4","name":"Pain complet","quantity":"4","unit":"tranches"},{"id":"5","name":"Sel, poivre","quantity":"","unit":""}]',
'["Préchauffer le four à 180°C.","Faire tomber les épinards, répartir dans des ramequins.","Ajouter le fromage frais puis casser un œuf par ramequin.","Cuire 12-15 minutes au four.","Servir avec le pain complet."]',
'["plat", "riche-proteines"]',
true, 'approved', '', 280, 18, 15, 18, 4),

-- ═══════════════════════════════════════════════════
-- 🥗 SALADES-REPAS & BOWLS VÉGÉTARIENS (20)
-- ═══════════════════════════════════════════════════

(uid, 'Salade de quinoa, feta et légumes croquants', '', 4, 15, 12,
'[{"id":"1","name":"Quinoa","quantity":"180","unit":"g"},{"id":"2","name":"Feta","quantity":"100","unit":"g"},{"id":"3","name":"Concombre","quantity":"1","unit":""},{"id":"4","name":"Tomates cerises","quantity":"150","unit":"g"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Cuire le quinoa et laisser refroidir.","Couper concombre et tomates.","Émietter la feta.","Mélanger tous les ingrédients.","Arroser d''huile d''olive."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 400, 15, 17, 42, 4),

(uid, 'Bowl bouddha aux légumes rôtis et houmous', '', 4, 20, 25,
'[{"id":"1","name":"Pois chiches cuits","quantity":"200","unit":"g"},{"id":"2","name":"Patate douce","quantity":"1","unit":""},{"id":"3","name":"Chou kale","quantity":"100","unit":"g"},{"id":"4","name":"Houmous","quantity":"100","unit":"g"},{"id":"5","name":"Graines de tournesol","quantity":"20","unit":"g"}]',
'["Rôtir la patate douce et les pois chiches au four 25 minutes à 200°C.","Masser le kale avec un peu d''huile.","Dresser tous les éléments dans un bol.","Ajouter une quenelle de houmous.","Parsemer de graines de tournesol."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 420, 15, 16, 55, 4),

(uid, 'Salade de lentilles, chèvre et betterave', '', 4, 15, 20,
'[{"id":"1","name":"Lentilles vertes","quantity":"200","unit":"g"},{"id":"2","name":"Fromage de chèvre","quantity":"80","unit":"g"},{"id":"3","name":"Betterave cuite","quantity":"150","unit":"g"},{"id":"4","name":"Noix","quantity":"30","unit":"g"},{"id":"5","name":"Vinaigre balsamique","quantity":"1","unit":"c. à soupe"}]',
'["Cuire les lentilles 20 minutes à l''eau.","Couper la betterave en dés.","Mélanger lentilles tièdes et betterave.","Émietter le chèvre et ajouter les noix.","Arroser de vinaigre balsamique."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 420, 20, 18, 40, 4),

(uid, 'Bowl de riz complet, avocat et edamame', '', 4, 15, 15,
'[{"id":"1","name":"Riz complet","quantity":"200","unit":"g"},{"id":"2","name":"Avocat","quantity":"1","unit":""},{"id":"3","name":"Edamame","quantity":"150","unit":"g"},{"id":"4","name":"Carotte","quantity":"1","unit":""},{"id":"5","name":"Sauce soja légère","quantity":"1","unit":"c. à soupe"}]',
'["Cuire le riz complet.","Cuire les edamame 5 minutes à l''eau.","Couper avocat et carotte.","Dresser tous les éléments dans un bol.","Arroser de sauce soja."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 420, 14, 18, 52, 4),

(uid, 'Salade César végétarienne aux pois chiches croustillants', '', 4, 15, 20,
'[{"id":"1","name":"Pois chiches cuits","quantity":"300","unit":"g"},{"id":"2","name":"Salade romaine","quantity":"1","unit":""},{"id":"3","name":"Parmesan râpé","quantity":"30","unit":"g"},{"id":"4","name":"Yaourt nature","quantity":"3","unit":"c. à soupe"},{"id":"5","name":"Ail","quantity":"1","unit":"gousse"}]',
'["Rôtir les pois chiches au four 20 minutes à 200°C jusqu''à croustillant.","Laver et couper la salade.","Mélanger yaourt, ail écrasé et parmesan pour la sauce.","Dresser la salade avec les pois chiches.","Napper de sauce."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 380, 18, 13, 45, 4),

(uid, 'Bowl mexicain haricots noirs, maïs et riz', '', 4, 15, 15,
'[{"id":"1","name":"Riz complet","quantity":"180","unit":"g"},{"id":"2","name":"Haricots noirs cuits","quantity":"250","unit":"g"},{"id":"3","name":"Maïs","quantity":"100","unit":"g"},{"id":"4","name":"Avocat","quantity":"1","unit":""},{"id":"5","name":"Citron vert","quantity":"1","unit":""}]',
'["Cuire le riz complet.","Réchauffer haricots noirs et maïs.","Couper l''avocat en tranches.","Dresser tous les éléments dans un bol.","Arroser de jus de citron vert."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 430, 16, 12, 65, 4),

(uid, 'Salade de pâtes complètes, tomates et mozzarella', '', 4, 15, 12,
'[{"id":"1","name":"Pâtes complètes","quantity":"250","unit":"g"},{"id":"2","name":"Mozzarella légère","quantity":"125","unit":"g"},{"id":"3","name":"Tomates cerises","quantity":"200","unit":"g"},{"id":"4","name":"Basilic frais","quantity":"","unit":"quelques feuilles"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Cuire les pâtes complètes selon les instructions, refroidir.","Couper tomates et mozzarella en dés.","Mélanger avec les pâtes.","Ajouter le basilic ciselé.","Arroser d''huile d''olive."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 420, 18, 14, 55, 4),

(uid, 'Bowl de patate douce farcie au chili végétarien', '', 4, 15, 35,
'[{"id":"1","name":"Patates douces","quantity":"4","unit":""},{"id":"2","name":"Haricots rouges cuits","quantity":"300","unit":"g"},{"id":"3","name":"Tomates concassées","quantity":"200","unit":"g"},{"id":"4","name":"Cumin","quantity":"1","unit":"c. à café"},{"id":"5","name":"Yaourt nature","quantity":"3","unit":"c. à soupe"}]',
'["Cuire les patates douces entières au four 35 minutes à 200°C.","Préparer un chili avec haricots rouges, tomates et cumin, 15 minutes de mijotage.","Fendre les patates douces.","Garnir de chili.","Napper de yaourt."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 400, 15, 4, 78, 4),

(uid, 'Salade grecque de haricots blancs', '', 4, 15, 0,
'[{"id":"1","name":"Haricots blancs cuits","quantity":"350","unit":"g"},{"id":"2","name":"Concombre","quantity":"1","unit":""},{"id":"3","name":"Tomates","quantity":"2","unit":""},{"id":"4","name":"Feta","quantity":"80","unit":"g"},{"id":"5","name":"Olives noires","quantity":"40","unit":"g"}]',
'["Couper concombre et tomates.","Mélanger avec les haricots blancs.","Émietter la feta et ajouter les olives.","Arroser d''un filet d''huile d''olive.","Servir frais."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 380, 19, 15, 40, 4),

(uid, 'Bowl de riz complet, tofu fumé et petits légumes', '', 4, 15, 15,
'[{"id":"1","name":"Riz complet","quantity":"200","unit":"g"},{"id":"2","name":"Tofu fumé","quantity":"250","unit":"g"},{"id":"3","name":"Carotte","quantity":"1","unit":""},{"id":"4","name":"Chou rouge","quantity":"100","unit":"g"},{"id":"5","name":"Sauce soja légère","quantity":"1","unit":"c. à soupe"}]',
'["Cuire le riz complet.","Couper le tofu fumé en dés, poêler légèrement.","Râper carotte et chou rouge.","Dresser tous les éléments dans un bol.","Arroser de sauce soja."]',
'["plat", "riche-proteines"]',
true, 'approved', '', 390, 20, 12, 48, 4),

(uid, 'Salade de boulgour, halloumi grillé et menthe', '', 4, 15, 10,
'[{"id":"1","name":"Boulgour","quantity":"180","unit":"g"},{"id":"2","name":"Halloumi","quantity":"150","unit":"g"},{"id":"3","name":"Menthe fraîche","quantity":"","unit":"quelques feuilles"},{"id":"4","name":"Tomates","quantity":"2","unit":""},{"id":"5","name":"Citron","quantity":"1","unit":""}]',
'["Cuire le boulgour selon les instructions.","Griller l''halloumi 2 minutes de chaque côté.","Couper les tomates en dés.","Mélanger boulgour, tomates et menthe.","Dresser avec l''halloumi grillé et un filet de citron."]',
'["plat", "riche-proteines"]',
true, 'approved', '', 420, 19, 18, 45, 4),

(uid, 'Bowl detox quinoa, chou kale et grenade', '', 4, 15, 12,
'[{"id":"1","name":"Quinoa","quantity":"180","unit":"g"},{"id":"2","name":"Chou kale","quantity":"100","unit":"g"},{"id":"3","name":"Grenade","quantity":"1/2","unit":""},{"id":"4","name":"Amandes effilées","quantity":"20","unit":"g"},{"id":"5","name":"Citron","quantity":"1","unit":""}]',
'["Cuire le quinoa selon les instructions.","Masser le kale avec un peu d''huile et de citron.","Égrainer la grenade.","Mélanger tous les ingrédients.","Parsemer d''amandes effilées."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 390, 13, 13, 55, 4),

(uid, 'Salade de riz complet, mangue et cacahuètes', '', 4, 15, 15,
'[{"id":"1","name":"Riz complet","quantity":"200","unit":"g"},{"id":"2","name":"Mangue","quantity":"1","unit":""},{"id":"3","name":"Cacahuètes concassées","quantity":"30","unit":"g"},{"id":"4","name":"Menthe fraîche","quantity":"","unit":"quelques feuilles"},{"id":"5","name":"Citron vert","quantity":"1","unit":""}]',
'["Cuire le riz complet et laisser refroidir.","Couper la mangue en dés.","Mélanger riz, mangue et menthe.","Parsemer de cacahuètes.","Arroser de citron vert."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 400, 10, 12, 65, 4),

(uid, 'Bowl de courge butternut rôtie et quinoa', '', 4, 15, 30,
'[{"id":"1","name":"Courge butternut","quantity":"400","unit":"g"},{"id":"2","name":"Quinoa","quantity":"180","unit":"g"},{"id":"3","name":"Feta","quantity":"60","unit":"g"},{"id":"4","name":"Graines de courge","quantity":"20","unit":"g"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Rôtir la courge en cubes au four 25 minutes à 200°C.","Cuire le quinoa selon les instructions.","Mélanger quinoa et courge rôtie.","Émietter la feta et parsemer de graines de courge.","Arroser d''huile d''olive."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 400, 14, 15, 52, 4),

(uid, 'Salade de pois chiches, roquette et parmesan', '', 4, 15, 0,
'[{"id":"1","name":"Pois chiches cuits","quantity":"350","unit":"g"},{"id":"2","name":"Roquette","quantity":"100","unit":"g"},{"id":"3","name":"Parmesan en copeaux","quantity":"30","unit":"g"},{"id":"4","name":"Citron","quantity":"1","unit":""},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Mélanger pois chiches et roquette.","Arroser de jus de citron et d''huile d''olive.","Parsemer de copeaux de parmesan.","Servir frais."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 380, 17, 16, 40, 4),

(uid, 'Bowl asiatique tofu, riz complet et légumes croquants', '', 4, 20, 15,
'[{"id":"1","name":"Tofu ferme","quantity":"300","unit":"g"},{"id":"2","name":"Riz complet","quantity":"180","unit":"g"},{"id":"3","name":"Chou rouge","quantity":"100","unit":"g"},{"id":"4","name":"Carotte","quantity":"1","unit":""},{"id":"5","name":"Sauce soja légère","quantity":"1","unit":"c. à soupe"}]',
'["Cuire le riz complet.","Poêler le tofu en cubes jusqu''à doré.","Râper chou rouge et carotte.","Dresser tous les éléments dans un bol.","Arroser de sauce soja."]',
'["plat", "riche-proteines"]',
true, 'approved', '', 390, 19, 13, 48, 4),

(uid, 'Salade de lentilles, orange et fenouil', '', 4, 15, 20,
'[{"id":"1","name":"Lentilles vertes","quantity":"200","unit":"g"},{"id":"2","name":"Orange","quantity":"1","unit":""},{"id":"3","name":"Fenouil","quantity":"1","unit":"bulbe"},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Menthe fraîche","quantity":"","unit":"quelques feuilles"}]',
'["Cuire les lentilles 20 minutes à l''eau.","Émincer finement le fenouil.","Peler l''orange à vif et couper en quartiers.","Mélanger lentilles, fenouil et orange.","Parsemer de menthe et arroser d''huile."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 350, 16, 6, 55, 4),

(uid, 'Bowl de patate douce, pois chiches épicés et tahin', '', 4, 15, 25,
'[{"id":"1","name":"Patate douce","quantity":"1","unit":""},{"id":"2","name":"Pois chiches cuits","quantity":"250","unit":"g"},{"id":"3","name":"Paprika fumé","quantity":"1","unit":"c. à café"},{"id":"4","name":"Tahin","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Citron","quantity":"1/2","unit":""}]',
'["Rôtir patate douce en cubes et pois chiches au four 25 minutes à 200°C avec le paprika.","Mélanger tahin et citron pour la sauce.","Dresser dans un bol.","Napper de sauce tahin-citron."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 400, 15, 12, 60, 4),

-- ═══════════════════════════════════════════════════
-- 🌿 COMPLÉMENTS VÉGÉTARIENS (6)
-- ═══════════════════════════════════════════════════

(uid, 'Curry rouge de légumes et pois chiches', '', 4, 15, 20,
'[{"id":"1","name":"Pois chiches cuits","quantity":"300","unit":"g"},{"id":"2","name":"Pâte de curry rouge","quantity":"1","unit":"c. à soupe"},{"id":"3","name":"Lait de coco allégé","quantity":"200","unit":"ml"},{"id":"4","name":"Poivron","quantity":"1","unit":""},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Faire chauffer la pâte de curry.","Ajouter le lait de coco et le poivron émincé.","Ajouter les pois chiches, mijoter 15 minutes.","Cuire le riz complet.","Servir ensemble."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 410, 15, 13, 58, 4),

(uid, 'Salade de haricots verts, œuf mollet et parmesan', '', 4, 15, 12,
'[{"id":"1","name":"Haricots verts","quantity":"350","unit":"g"},{"id":"2","name":"Œufs","quantity":"4","unit":""},{"id":"3","name":"Parmesan en copeaux","quantity":"30","unit":"g"},{"id":"4","name":"Amandes effilées","quantity":"20","unit":"g"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Cuire les haricots verts à la vapeur 8 minutes.","Cuire les œufs mollets 6 minutes, écaler.","Dresser haricots verts et œufs coupés en deux.","Parsemer de parmesan et d''amandes.","Arroser d''huile d''olive."]',
'["plat", "riche-proteines"]',
true, 'approved', '', 320, 18, 20, 12, 4),

(uid, 'Bowl de riz complet, tofu épicé et chou pak-choï', '', 4, 15, 15,
'[{"id":"1","name":"Tofu ferme","quantity":"300","unit":"g"},{"id":"2","name":"Riz complet","quantity":"200","unit":"g"},{"id":"3","name":"Pak-choï","quantity":"200","unit":"g"},{"id":"4","name":"Piment doux","quantity":"1","unit":"c. à café"},{"id":"5","name":"Sauce soja légère","quantity":"1","unit":"c. à soupe"}]',
'["Cuire le riz complet.","Poêler le tofu en cubes avec le piment doux.","Faire sauter le pak-choï 3 minutes.","Dresser tous les éléments dans un bol.","Arroser de sauce soja."]',
'["plat", "riche-proteines"]',
true, 'approved', '', 390, 19, 13, 48, 4),

(uid, 'Velouté-repas de lentilles corail et carotte', '', 4, 10, 25,
'[{"id":"1","name":"Lentilles corail","quantity":"250","unit":"g"},{"id":"2","name":"Carotte","quantity":"3","unit":""},{"id":"3","name":"Oignon","quantity":"1","unit":""},{"id":"4","name":"Cumin","quantity":"1","unit":"c. à café"},{"id":"5","name":"Bouillon de légumes","quantity":"800","unit":"ml"}]',
'["Faire revenir oignon et carotte.","Ajouter les lentilles, le cumin et le bouillon.","Laisser mijoter 20 minutes.","Mixer jusqu''à consistance lisse.","Servir bien chaud, en plat consistant."]',
'["plat", "riche-fibres"]',
true, 'approved', 'Velouté épais servi comme plat complet', 320, 16, 3, 55, 4),

(uid, 'Galettes de pois chiches et courgette au four', '', 4, 20, 20,
'[{"id":"1","name":"Pois chiches cuits","quantity":"300","unit":"g"},{"id":"2","name":"Courgette râpée","quantity":"1","unit":""},{"id":"3","name":"Œuf","quantity":"1","unit":""},{"id":"4","name":"Cumin","quantity":"1","unit":"c. à café"},{"id":"5","name":"Yaourt nature","quantity":"3","unit":"c. à soupe"}]',
'["Mixer pois chiches, courgette, œuf et cumin.","Former des galettes.","Cuire au four 20 minutes à 200°C en retournant à mi-cuisson.","Servir avec le yaourt nature."]',
'["plat", "riche-fibres"]',
true, 'approved', '', 320, 17, 8, 42, 4),

(uid, 'Bowl de quinoa, œuf mollet et avocat', '', 4, 15, 12,
'[{"id":"1","name":"Quinoa","quantity":"180","unit":"g"},{"id":"2","name":"Œufs","quantity":"4","unit":""},{"id":"3","name":"Avocat","quantity":"1","unit":""},{"id":"4","name":"Tomates cerises","quantity":"150","unit":"g"},{"id":"5","name":"Sauce soja légère","quantity":"1","unit":"c. à soupe"}]',
'["Cuire le quinoa selon les instructions.","Cuire les œufs mollets 6 minutes, écaler.","Couper avocat et tomates cerises.","Dresser tous les éléments dans un bol.","Arroser de sauce soja."]',
'["plat", "riche-proteines"]',
true, 'approved', '', 420, 18, 18, 45, 4);

END $$;
