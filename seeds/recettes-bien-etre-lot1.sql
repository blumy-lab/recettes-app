-- BIEN-ÊTRE — LOT 1 — Volailles & poissons légers (80 plats)
-- Nutrition estimée manuellement à la création (pas d'appel Gemini) : indicative.

DO $$
DECLARE
  uid uuid := '97a98e5c-d29d-4a9f-9d84-0684eef75fe6'::uuid;
BEGIN

-- ═══════════════════════════════════════════════════
-- 🍗 POULET & DINDE — grillés / au four (10)
-- ═══════════════════════════════════════════════════

INSERT INTO recipes (user_id, title, source_url, servings, prep_time, cook_time, ingredients, steps, tags, is_public, moderation_status, user_notes, nutrition_calories, nutrition_proteins, nutrition_fat, nutrition_carbs, nutrition_base) VALUES

(uid, 'Poulet grillé au citron et romarin', '', 4, 15, 25,
'[{"id":"1","name":"Filets de poulet","quantity":"4","unit":""},{"id":"2","name":"Citron","quantity":"1","unit":""},{"id":"3","name":"Romarin frais","quantity":"2","unit":"branches"},{"id":"4","name":"Gousses d''ail","quantity":"2","unit":""},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"6","name":"Haricots verts","quantity":"400","unit":"g"},{"id":"7","name":"Sel, poivre","quantity":"","unit":""}]',
'["Mariner les filets avec le jus de citron, l''ail écrasé, le romarin et l''huile pendant 20 minutes.","Faire cuire les haricots verts à la vapeur 8 minutes.","Griller le poulet 6 minutes de chaque côté jusqu''à cuisson complète.","Saler, poivrer.","Servir avec les haricots verts et un quartier de citron."]',
'{"plat","riche-proteines"}',
true, 'approved', 'Plat léger post-sport', 320, 38, 9, 12, 4),

(uid, 'Poulet au four à la moutarde et miel', '', 4, 10, 35,
'[{"id":"1","name":"Cuisses de poulet sans peau","quantity":"4","unit":""},{"id":"2","name":"Moutarde à l''ancienne","quantity":"2","unit":"c. à soupe"},{"id":"3","name":"Miel","quantity":"1","unit":"c. à soupe"},{"id":"4","name":"Thym","quantity":"1","unit":"c. à café"},{"id":"5","name":"Carottes","quantity":"3","unit":""},{"id":"6","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"7","name":"Sel, poivre","quantity":"","unit":""}]',
'["Préchauffer le four à 200°C.","Mélanger moutarde, miel, thym et huile.","Badigeonner les cuisses de poulet du mélange.","Disposer sur une plaque avec les carottes coupées en bâtonnets.","Cuire 35 minutes jusqu''à coloration dorée.","Servir chaud."]',
'{"plat"}',
true, 'approved', '', 360, 34, 14, 18, 4),

(uid, 'Escalopes de dinde à la provençale', '', 4, 10, 20,
'[{"id":"1","name":"Escalopes de dinde","quantity":"4","unit":""},{"id":"2","name":"Tomates","quantity":"3","unit":""},{"id":"3","name":"Herbes de Provence","quantity":"1","unit":"c. à café"},{"id":"4","name":"Gousses d''ail","quantity":"2","unit":""},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"6","name":"Courgettes","quantity":"2","unit":""},{"id":"7","name":"Sel, poivre","quantity":"","unit":""}]',
'["Faire dorer les escalopes 3 minutes de chaque côté dans l''huile.","Réserver. Faire revenir l''ail et les tomates concassées.","Ajouter les herbes de Provence.","Remettre les escalopes, laisser mijoter 10 minutes.","Faire poêler les courgettes en tranches à part.","Servir ensemble."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 290, 36, 8, 10, 4),

(uid, 'Poulet tandoori au four', '', 4, 20, 25,
'[{"id":"1","name":"Filets de poulet","quantity":"4","unit":""},{"id":"2","name":"Yaourt nature","quantity":"200","unit":"g"},{"id":"3","name":"Épices tandoori","quantity":"2","unit":"c. à soupe"},{"id":"4","name":"Jus de citron","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Riz basmati complet","quantity":"200","unit":"g"},{"id":"6","name":"Sel","quantity":"","unit":""}]',
'["Mariner le poulet dans le yaourt, les épices et le citron au moins 1 heure.","Préchauffer le four à 200°C.","Cuire le poulet 25 minutes en le retournant à mi-cuisson.","Cuire le riz basmati complet selon les instructions.","Servir le poulet tandoori avec le riz."]',
'{"plat","riche-proteines"}',
true, 'approved', 'Mariner la veille pour plus de goût', 380, 35, 9, 42, 4),

(uid, 'Brochettes de poulet aux légumes grillés', '', 4, 20, 15,
'[{"id":"1","name":"Blancs de poulet","quantity":"500","unit":"g"},{"id":"2","name":"Poivrons","quantity":"2","unit":""},{"id":"3","name":"Courgette","quantity":"1","unit":""},{"id":"4","name":"Oignon rouge","quantity":"1","unit":""},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"6","name":"Paprika","quantity":"1","unit":"c. à café"},{"id":"7","name":"Sel, poivre","quantity":"","unit":""}]',
'["Couper le poulet et les légumes en cubes.","Enfiler en alternance sur des piques à brochette.","Badigeonner d''huile et saupoudrer de paprika.","Griller 12-15 minutes en retournant régulièrement.","Servir chaud."]',
'{"plat"}',
true, 'approved', '', 280, 32, 8, 12, 4),

(uid, 'Poulet vapeur au gingembre', '', 4, 15, 20,
'[{"id":"1","name":"Filets de poulet","quantity":"4","unit":""},{"id":"2","name":"Gingembre frais","quantity":"1","unit":"morceau"},{"id":"3","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"},{"id":"4","name":"Ciboule","quantity":"2","unit":"tiges"},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"},{"id":"6","name":"Huile de sésame","quantity":"1","unit":"c. à café"}]',
'["Cuire le poulet à la vapeur 20 minutes avec le gingembre râpé.","Cuire le riz complet en parallèle.","Trancher le poulet, arroser de sauce soja et d''huile de sésame.","Parsemer de ciboule émincée.","Servir avec le riz."]',
'{"plat","ig-bas"}',
true, 'approved', '', 340, 34, 6, 38, 4),

(uid, 'Dinde à la coriandre et lait de coco léger', '', 4, 15, 25,
'[{"id":"1","name":"Escalopes de dinde","quantity":"500","unit":"g"},{"id":"2","name":"Lait de coco allégé","quantity":"200","unit":"ml"},{"id":"3","name":"Coriandre fraîche","quantity":"1","unit":"bouquet"},{"id":"4","name":"Curcuma","quantity":"1","unit":"c. à café"},{"id":"5","name":"Oignon","quantity":"1","unit":""},{"id":"6","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Faire revenir l''oignon émincé.","Ajouter la dinde coupée en lanières, faire dorer.","Verser le lait de coco et le curcuma.","Laisser mijoter 15 minutes.","Parsemer de coriandre fraîche.","Servir avec le riz complet."]',
'{"plat"}',
true, 'approved', '', 370, 33, 13, 30, 4),

(uid, 'Poulet grillé, purée de patate douce', '', 4, 20, 30,
'[{"id":"1","name":"Filets de poulet","quantity":"4","unit":""},{"id":"2","name":"Patates douces","quantity":"600","unit":"g"},{"id":"3","name":"Épinards frais","quantity":"200","unit":"g"},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Sel, poivre","quantity":"","unit":""}]',
'["Cuire les patates douces à l''eau 20 minutes puis les écraser en purée.","Griller le poulet 6 minutes de chaque côté.","Faire tomber les épinards à la poêle 3 minutes.","Assaisonner la purée avec l''huile d''olive.","Servir le poulet avec la purée et les épinards."]',
'{"plat","riche-fibres"}',
true, 'approved', '', 400, 36, 9, 45, 4),

(uid, 'Wrap de poulet grillé et crudités', '', 4, 15, 10,
'[{"id":"1","name":"Filets de poulet","quantity":"3","unit":""},{"id":"2","name":"Galettes de blé complet","quantity":"4","unit":""},{"id":"3","name":"Salade","quantity":"1","unit":""},{"id":"4","name":"Tomates","quantity":"2","unit":""},{"id":"5","name":"Yaourt nature","quantity":"3","unit":"c. à soupe"},{"id":"6","name":"Concombre","quantity":"1/2","unit":""}]',
'["Griller le poulet et le couper en lanières.","Préparer une sauce avec le yaourt et un peu de sel.","Garnir les galettes de salade, tomates, concombre et poulet.","Napper de sauce yaourt.","Rouler fermement et servir."]',
'{"plat"}',
true, 'approved', '', 350, 30, 8, 38, 4),

(uid, 'Poulet basquaise allégé', '', 4, 15, 35,
'[{"id":"1","name":"Cuisses de poulet sans peau","quantity":"4","unit":""},{"id":"2","name":"Poivrons rouges","quantity":"2","unit":""},{"id":"3","name":"Tomates","quantity":"3","unit":""},{"id":"4","name":"Oignon","quantity":"1","unit":""},{"id":"5","name":"Piment d''Espelette","quantity":"1","unit":"pincée"},{"id":"6","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Faire dorer le poulet dans l''huile, réserver.","Faire revenir l''oignon et les poivrons émincés.","Ajouter les tomates concassées et le piment.","Remettre le poulet, couvrir et mijoter 30 minutes.","Servir chaud."]',
'{"plat"}',
true, 'approved', '', 330, 34, 11, 15, 4),

-- ═══════════════════════════════════════════════════
-- 🍗 POULET & DINDE — poêlé / wok (10)
-- ═══════════════════════════════════════════════════

(uid, 'Wok de poulet aux légumes croquants', '', 4, 15, 12,
'[{"id":"1","name":"Filets de poulet","quantity":"400","unit":"g"},{"id":"2","name":"Brocolis","quantity":"200","unit":"g"},{"id":"3","name":"Carottes","quantity":"2","unit":""},{"id":"4","name":"Pousses de soja","quantity":"100","unit":"g"},{"id":"5","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"},{"id":"6","name":"Huile de sésame","quantity":"1","unit":"c. à café"}]',
'["Couper le poulet en lanières et les légumes en bâtonnets.","Faire chauffer le wok avec un peu d''huile de sésame.","Saisir le poulet 5 minutes.","Ajouter les légumes, sauter 5 minutes en remuant.","Arroser de sauce soja.","Servir immédiatement bien chaud."]',
'{"plat","ig-bas"}',
true, 'approved', '', 300, 32, 9, 18, 4),

(uid, 'Poêlée de dinde aux champignons', '', 4, 10, 20,
'[{"id":"1","name":"Escalopes de dinde","quantity":"500","unit":"g"},{"id":"2","name":"Champignons de Paris","quantity":"300","unit":"g"},{"id":"3","name":"Échalotes","quantity":"2","unit":""},{"id":"4","name":"Crème légère","quantity":"3","unit":"c. à soupe"},{"id":"5","name":"Persil","quantity":"","unit":""},{"id":"6","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Couper la dinde en morceaux et les champignons en lamelles.","Faire dorer la dinde dans l''huile, réserver.","Faire revenir échalotes et champignons.","Remettre la dinde, ajouter la crème légère.","Laisser mijoter 5 minutes, parsemer de persil.","Servir chaud."]',
'{"plat"}',
true, 'approved', '', 310, 34, 12, 8, 4),

(uid, 'Poulet sauté à l''ananas', '', 4, 15, 12,
'[{"id":"1","name":"Filets de poulet","quantity":"400","unit":"g"},{"id":"2","name":"Ananas frais","quantity":"200","unit":"g"},{"id":"3","name":"Poivron vert","quantity":"1","unit":""},{"id":"4","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Couper le poulet et le poivron en morceaux.","Faire sauter le poulet 5 minutes à feu vif.","Ajouter le poivron et l''ananas coupé en dés.","Arroser de sauce soja, cuire 5 minutes de plus.","Servir avec le riz complet."]',
'{"plat"}',
true, 'approved', '', 370, 30, 7, 48, 4),

(uid, 'Émincé de dinde au curry léger', '', 4, 10, 18,
'[{"id":"1","name":"Escalopes de dinde","quantity":"500","unit":"g"},{"id":"2","name":"Curry en poudre","quantity":"1","unit":"c. à soupe"},{"id":"3","name":"Yaourt nature","quantity":"150","unit":"g"},{"id":"4","name":"Oignon","quantity":"1","unit":""},{"id":"5","name":"Riz basmati","quantity":"200","unit":"g"}]',
'["Émincer la dinde et l''oignon.","Faire revenir l''oignon puis la dinde 5 minutes.","Saupoudrer de curry, bien enrober.","Hors du feu, incorporer le yaourt.","Servir avec le riz basmati."]',
'{"plat"}',
true, 'approved', '', 350, 33, 8, 40, 4),

(uid, 'Poulet sauté au brocoli et gingembre', '', 4, 15, 12,
'[{"id":"1","name":"Filets de poulet","quantity":"400","unit":"g"},{"id":"2","name":"Brocolis","quantity":"300","unit":"g"},{"id":"3","name":"Gingembre frais","quantity":"1","unit":"morceau"},{"id":"4","name":"Ail","quantity":"2","unit":"gousses"},{"id":"5","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"}]',
'["Couper le poulet en cubes et le brocoli en fleurettes.","Faire revenir l''ail et le gingembre râpés.","Ajouter le poulet, cuire 6 minutes.","Ajouter le brocoli et un peu d''eau, couvrir 5 minutes.","Arroser de sauce soja avant de servir."]',
'{"plat","riche-fibres"}',
true, 'approved', '', 270, 31, 7, 14, 4),

(uid, 'Poêlée de dinde, courgettes et menthe', '', 4, 10, 15,
'[{"id":"1","name":"Escalopes de dinde","quantity":"500","unit":"g"},{"id":"2","name":"Courgettes","quantity":"3","unit":""},{"id":"3","name":"Menthe fraîche","quantity":"","unit":"quelques feuilles"},{"id":"4","name":"Citron","quantity":"1/2","unit":""},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Couper la dinde en lanières et les courgettes en rubans.","Faire dorer la dinde dans l''huile.","Ajouter les courgettes, cuire 6-8 minutes.","Arroser de jus de citron.","Parsemer de menthe ciselée avant de servir."]',
'{"plat","sans-sel"}',
true, 'approved', '', 260, 33, 7, 8, 4),

(uid, 'Sauté de poulet, pois gourmands et sésame', '', 4, 15, 12,
'[{"id":"1","name":"Filets de poulet","quantity":"400","unit":"g"},{"id":"2","name":"Pois gourmands","quantity":"200","unit":"g"},{"id":"3","name":"Graines de sésame","quantity":"1","unit":"c. à soupe"},{"id":"4","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Couper le poulet en lanières.","Faire sauter le poulet 5 minutes à feu vif.","Ajouter les pois gourmands, cuire 4 minutes.","Arroser de sauce soja, parsemer de sésame.","Servir avec le riz complet."]',
'{"plat"}',
true, 'approved', '', 360, 32, 8, 42, 4),

(uid, 'Poulet à la citronnelle et vermicelles de riz', '', 4, 15, 15,
'[{"id":"1","name":"Filets de poulet","quantity":"400","unit":"g"},{"id":"2","name":"Citronnelle","quantity":"1","unit":"tige"},{"id":"3","name":"Vermicelles de riz","quantity":"150","unit":"g"},{"id":"4","name":"Carotte","quantity":"1","unit":""},{"id":"5","name":"Menthe et coriandre","quantity":"","unit":"quelques feuilles"}]',
'["Faire tremper les vermicelles dans l''eau chaude.","Faire revenir le poulet émincé avec la citronnelle écrasée.","Râper la carotte.","Dresser les vermicelles, le poulet et la carotte.","Parsemer d''herbes fraîches."]',
'{"plat","ig-bas"}',
true, 'approved', '', 340, 29, 6, 45, 4),

(uid, 'Dinde poêlée, sauce tomate-basilic', '', 4, 10, 18,
'[{"id":"1","name":"Escalopes de dinde","quantity":"500","unit":"g"},{"id":"2","name":"Tomates concassées","quantity":"400","unit":"g"},{"id":"3","name":"Basilic frais","quantity":"","unit":"quelques feuilles"},{"id":"4","name":"Ail","quantity":"1","unit":"gousse"},{"id":"5","name":"Pâtes complètes","quantity":"200","unit":"g"}]',
'["Cuire les pâtes complètes selon les instructions.","Faire dorer la dinde en morceaux.","Ajouter l''ail et les tomates concassées.","Mijoter 10 minutes.","Parsemer de basilic et servir avec les pâtes."]',
'{"plat","riche-fibres"}',
true, 'approved', '', 400, 34, 8, 50, 4),

(uid, 'Poulet croquant au four (sans friture)', '', 4, 15, 25,
'[{"id":"1","name":"Filets de poulet","quantity":"4","unit":""},{"id":"2","name":"Flocons d''avoine mixés","quantity":"80","unit":"g"},{"id":"3","name":"Œuf","quantity":"1","unit":""},{"id":"4","name":"Paprika","quantity":"1","unit":"c. à café"},{"id":"5","name":"Salade verte","quantity":"1","unit":""}]',
'["Préchauffer le four à 200°C.","Tremper le poulet dans l''œuf battu.","Enrober des flocons d''avoine mixés et du paprika.","Cuire sur une plaque 25 minutes en retournant à mi-cuisson.","Servir avec une salade verte."]',
'{"plat"}',
true, 'approved', 'Alternative saine au poulet pané frit', 350, 36, 8, 22, 4),

-- ═══════════════════════════════════════════════════
-- 🐟 SAUMON (10)
-- ═══════════════════════════════════════════════════

(uid, 'Saumon grillé, asperges vapeur', '', 4, 10, 15,
'[{"id":"1","name":"Pavés de saumon","quantity":"4","unit":""},{"id":"2","name":"Asperges vertes","quantity":"400","unit":"g"},{"id":"3","name":"Citron","quantity":"1","unit":""},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Sel, poivre","quantity":"","unit":""}]',
'["Cuire les asperges à la vapeur 8 minutes.","Griller le saumon 4 minutes de chaque côté.","Arroser de jus de citron et d''un filet d''huile.","Saler, poivrer.","Servir chaud."]',
'{"plat","riche-proteines"}',
true, 'approved', 'Riche en oméga-3', 420, 34, 26, 6, 4),

(uid, 'Saumon en papillote, légumes du jardin', '', 4, 15, 20,
'[{"id":"1","name":"Pavés de saumon","quantity":"4","unit":""},{"id":"2","name":"Courgette","quantity":"1","unit":""},{"id":"3","name":"Carotte","quantity":"1","unit":""},{"id":"4","name":"Aneth","quantity":"","unit":"quelques brins"},{"id":"5","name":"Citron","quantity":"1","unit":""}]',
'["Préchauffer le four à 190°C.","Couper les légumes en fines rondelles.","Disposer le saumon et les légumes dans du papier cuisson.","Ajouter aneth et jus de citron, refermer la papillote.","Cuire 20 minutes au four."]',
'{"plat"}',
true, 'approved', '', 400, 33, 24, 10, 4),

(uid, 'Saumon mariné teriyaki allégé', '', 4, 20, 12,
'[{"id":"1","name":"Pavés de saumon","quantity":"4","unit":""},{"id":"2","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"},{"id":"3","name":"Miel","quantity":"1","unit":"c. à café"},{"id":"4","name":"Gingembre","quantity":"1","unit":"morceau"},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Mélanger sauce soja, miel et gingembre râpé.","Mariner le saumon 15 minutes.","Cuire à la poêle 4 minutes de chaque côté en arrosant de marinade.","Cuire le riz complet.","Servir ensemble."]',
'{"plat"}',
true, 'approved', '', 450, 33, 22, 32, 4),

(uid, 'Tartare de saumon à l''avocat', '', 4, 20, 0,
'[{"id":"1","name":"Filet de saumon très frais","quantity":"400","unit":"g"},{"id":"2","name":"Avocat","quantity":"1","unit":""},{"id":"3","name":"Citron vert","quantity":"1","unit":""},{"id":"4","name":"Échalote","quantity":"1","unit":""},{"id":"5","name":"Coriandre fraîche","quantity":"","unit":"quelques feuilles"}]',
'["Couper le saumon en petits dés.","Couper l''avocat en dés également.","Mélanger avec le jus de citron vert, l''échalote ciselée et la coriandre.","Réserver au frais 10 minutes.","Servir bien frais."]',
'{"plat","riche-proteines"}',
true, 'approved', 'Sans cuisson — saumon impérativement très frais', 380, 28, 27, 6, 4),

(uid, 'Pavé de saumon, purée de brocoli', '', 4, 10, 20,
'[{"id":"1","name":"Pavés de saumon","quantity":"4","unit":""},{"id":"2","name":"Brocolis","quantity":"400","unit":"g"},{"id":"3","name":"Ail","quantity":"1","unit":"gousse"},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Sel, poivre","quantity":"","unit":""}]',
'["Cuire les brocolis à l''eau 10 minutes.","Mixer les brocolis avec l''ail, l''huile, sel et poivre.","Poêler le saumon 4 minutes de chaque côté.","Servir le saumon sur la purée de brocoli."]',
'{"plat","riche-fibres"}',
true, 'approved', '', 410, 33, 25, 10, 4),

(uid, 'Saumon fumé, salade de lentilles tièdes', '', 4, 15, 20,
'[{"id":"1","name":"Saumon fumé","quantity":"200","unit":"g"},{"id":"2","name":"Lentilles vertes","quantity":"200","unit":"g"},{"id":"3","name":"Échalote","quantity":"1","unit":""},{"id":"4","name":"Vinaigre de cidre","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Aneth","quantity":"","unit":"quelques brins"}]',
'["Cuire les lentilles 20 minutes à l''eau, égoutter.","Assaisonner tièdes avec échalote, vinaigre et huile.","Ajouter le saumon fumé émietté.","Parsemer d''aneth.","Servir tiède."]',
'{"plat","riche-fibres"}',
true, 'approved', '', 360, 26, 14, 32, 4),

(uid, 'Saumon croustillant, riz complet et edamame', '', 4, 15, 18,
'[{"id":"1","name":"Pavés de saumon","quantity":"4","unit":""},{"id":"2","name":"Riz complet","quantity":"200","unit":"g"},{"id":"3","name":"Edamame","quantity":"150","unit":"g"},{"id":"4","name":"Sauce soja légère","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Graines de sésame","quantity":"1","unit":"c. à café"}]',
'["Cuire le riz complet.","Cuire les edamame 5 minutes à l''eau bouillante salée.","Poêler le saumon côté peau 5 minutes puis 3 minutes de l''autre côté.","Dresser le riz, les edamame et le saumon.","Arroser de sauce soja et parsemer de sésame."]',
'{"plat"}',
true, 'approved', '', 470, 34, 24, 35, 4),

(uid, 'Saumon rôti à l''aneth et citron', '', 4, 10, 20,
'[{"id":"1","name":"Filet de saumon entier","quantity":"600","unit":"g"},{"id":"2","name":"Aneth frais","quantity":"","unit":"1 bouquet"},{"id":"3","name":"Citron","quantity":"1","unit":""},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Pommes de terre nouvelles","quantity":"400","unit":"g"}]',
'["Préchauffer le four à 190°C.","Cuire les pommes de terre à l''eau 15 minutes.","Disposer le saumon sur une plaque, couvrir d''aneth et de rondelles de citron.","Cuire 20 minutes au four.","Servir avec les pommes de terre."]',
'{"plat"}',
true, 'approved', '', 430, 32, 22, 28, 4),

(uid, 'Bol de saumon poché, quinoa et légumes croquants', '', 4, 15, 15,
'[{"id":"1","name":"Pavés de saumon","quantity":"4","unit":""},{"id":"2","name":"Quinoa","quantity":"180","unit":"g"},{"id":"3","name":"Concombre","quantity":"1","unit":""},{"id":"4","name":"Radis","quantity":"6","unit":""},{"id":"5","name":"Sauce soja légère","quantity":"1","unit":"c. à soupe"}]',
'["Cuire le quinoa selon les instructions.","Pocher le saumon 10 minutes dans un bouillon frémissant.","Couper concombre et radis en fines rondelles.","Dresser le quinoa, les légumes et le saumon émietté.","Arroser de sauce soja."]',
'{"plat","sans-gluten"}',
true, 'approved', '', 440, 33, 20, 34, 4),

(uid, 'Saumon laqué au miel et sésame', '', 4, 15, 12,
'[{"id":"1","name":"Pavés de saumon","quantity":"4","unit":""},{"id":"2","name":"Miel","quantity":"1","unit":"c. à soupe"},{"id":"3","name":"Sauce soja légère","quantity":"1","unit":"c. à soupe"},{"id":"4","name":"Graines de sésame","quantity":"1","unit":"c. à café"},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Mélanger miel et sauce soja.","Badigeonner le saumon du mélange.","Cuire à la poêle 4 minutes de chaque côté en laquant régulièrement.","Parsemer de sésame.","Servir avec le riz complet."]',
'{"plat"}',
true, 'approved', '', 460, 32, 23, 33, 4),

-- ═══════════════════════════════════════════════════
-- 🐟 POISSONS BLANCS & THON (15)
-- ═══════════════════════════════════════════════════

(uid, 'Cabillaud rôti à la tomate et olives', '', 4, 15, 20,
'[{"id":"1","name":"Filets de cabillaud","quantity":"4","unit":""},{"id":"2","name":"Tomates cerises","quantity":"250","unit":"g"},{"id":"3","name":"Olives noires","quantity":"50","unit":"g"},{"id":"4","name":"Ail","quantity":"2","unit":"gousses"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Préchauffer le four à 190°C.","Disposer le cabillaud dans un plat.","Ajouter tomates cerises, olives et ail émincé.","Arroser d''huile.","Cuire 20 minutes au four."]',
'{"plat","sans-lactose"}',
true, 'approved', '', 280, 30, 11, 8, 4),

(uid, 'Cabillaud vapeur, sauce yaourt-aneth', '', 4, 10, 15,
'[{"id":"1","name":"Filets de cabillaud","quantity":"4","unit":""},{"id":"2","name":"Yaourt nature","quantity":"150","unit":"g"},{"id":"3","name":"Aneth frais","quantity":"","unit":"quelques brins"},{"id":"4","name":"Citron","quantity":"1/2","unit":""},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Cuire le cabillaud à la vapeur 12 minutes.","Cuire le riz complet en parallèle.","Mélanger yaourt, aneth ciselé et jus de citron.","Napper le poisson de sauce.","Servir avec le riz."]',
'{"plat","ig-bas"}',
true, 'approved', '', 320, 31, 6, 40, 4),

(uid, 'Colin en papillote, julienne de légumes', '', 4, 15, 20,
'[{"id":"1","name":"Filets de colin","quantity":"4","unit":""},{"id":"2","name":"Poireau","quantity":"1","unit":""},{"id":"3","name":"Carotte","quantity":"1","unit":""},{"id":"4","name":"Vin blanc","quantity":"2","unit":"c. à soupe"},{"id":"5","name":"Sel, poivre","quantity":"","unit":""}]',
'["Préchauffer le four à 190°C.","Couper poireau et carotte en julienne fine.","Disposer le poisson et les légumes en papillote.","Arroser de vin blanc, saler et poivrer.","Cuire 20 minutes au four."]',
'{"plat","sans-lactose"}',
true, 'approved', '', 260, 29, 5, 12, 4),

(uid, 'Thon grillé mi-cuit, purée de pois cassés', '', 4, 15, 15,
'[{"id":"1","name":"Steaks de thon","quantity":"4","unit":""},{"id":"2","name":"Pois cassés","quantity":"200","unit":"g"},{"id":"3","name":"Ail","quantity":"1","unit":"gousse"},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Sel, poivre","quantity":"","unit":""}]',
'["Cuire les pois cassés 25 minutes à l''eau, puis mixer avec ail et huile.","Saisir le thon 1-2 minutes de chaque côté (mi-cuit).","Saler, poivrer.","Servir le thon sur la purée de pois cassés."]',
'{"plat","riche-fibres"}',
true, 'approved', '', 380, 38, 9, 30, 4),

(uid, 'Thon poêlé, salsa mangue-avocat', '', 4, 20, 8,
'[{"id":"1","name":"Steaks de thon","quantity":"4","unit":""},{"id":"2","name":"Mangue","quantity":"1","unit":""},{"id":"3","name":"Avocat","quantity":"1","unit":""},{"id":"4","name":"Citron vert","quantity":"1","unit":""},{"id":"5","name":"Coriandre fraîche","quantity":"","unit":"quelques feuilles"}]',
'["Couper mangue et avocat en petits dés.","Mélanger avec le jus de citron vert et la coriandre.","Saisir le thon 2 minutes de chaque côté.","Dresser le thon avec la salsa fraîche."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 390, 35, 18, 20, 4),

(uid, 'Merlu en cocotte, tomates et basilic', '', 4, 15, 20,
'[{"id":"1","name":"Filets de merlu","quantity":"4","unit":""},{"id":"2","name":"Tomates concassées","quantity":"400","unit":"g"},{"id":"3","name":"Basilic frais","quantity":"","unit":"quelques feuilles"},{"id":"4","name":"Ail","quantity":"1","unit":"gousse"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Faire revenir l''ail dans l''huile.","Ajouter les tomates concassées, mijoter 10 minutes.","Ajouter le merlu, couvrir et cuire 10 minutes.","Parsemer de basilic frais avant de servir."]',
'{"plat","sans-lactose"}',
true, 'approved', '', 260, 28, 7, 12, 4),

(uid, 'Dos de lieu noir, riz complet et épinards', '', 4, 15, 18,
'[{"id":"1","name":"Filets de lieu noir","quantity":"4","unit":""},{"id":"2","name":"Riz complet","quantity":"200","unit":"g"},{"id":"3","name":"Épinards frais","quantity":"250","unit":"g"},{"id":"4","name":"Ail","quantity":"1","unit":"gousse"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Cuire le riz complet.","Poêler le lieu 4 minutes de chaque côté.","Faire tomber les épinards avec l''ail dans l''huile.","Dresser le poisson sur le riz avec les épinards."]',
'{"plat","riche-fibres"}',
true, 'approved', '', 350, 32, 8, 38, 4),

(uid, 'Truite aux amandes et haricots verts', '', 4, 10, 15,
'[{"id":"1","name":"Filets de truite","quantity":"4","unit":""},{"id":"2","name":"Amandes effilées","quantity":"30","unit":"g"},{"id":"3","name":"Haricots verts","quantity":"400","unit":"g"},{"id":"4","name":"Beurre","quantity":"1","unit":"noisette"},{"id":"5","name":"Citron","quantity":"1/2","unit":""}]',
'["Cuire les haricots verts à la vapeur 10 minutes.","Poêler la truite 3 minutes de chaque côté.","Faire dorer les amandes dans le beurre.","Napper la truite d''amandes et de jus de citron.","Servir avec les haricots verts."]',
'{"plat"}',
true, 'approved', '', 380, 32, 22, 8, 4),

(uid, 'Maquereaux grillés, salade de pommes de terre', '', 4, 10, 12,
'[{"id":"1","name":"Maquereaux","quantity":"4","unit":""},{"id":"2","name":"Pommes de terre","quantity":"400","unit":"g"},{"id":"3","name":"Moutarde","quantity":"1","unit":"c. à café"},{"id":"4","name":"Vinaigre de cidre","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Ciboulette","quantity":"","unit":"quelques brins"}]',
'["Cuire les pommes de terre à l''eau, couper en dés.","Assaisonner avec moutarde, vinaigre et ciboulette.","Griller les maquereaux 4 minutes de chaque côté.","Servir chaud avec la salade tiède."]',
'{"plat","riche-proteines"}',
true, 'approved', 'Riche en oméga-3', 420, 28, 26, 22, 4),

(uid, 'Sardines grillées, tomates et origan', '', 4, 10, 10,
'[{"id":"1","name":"Sardines fraîches","quantity":"12","unit":""},{"id":"2","name":"Tomates","quantity":"3","unit":""},{"id":"3","name":"Origan","quantity":"1","unit":"c. à café"},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Citron","quantity":"1","unit":""}]',
'["Nettoyer les sardines.","Griller 3 minutes de chaque côté.","Couper les tomates en tranches, assaisonner d''huile et d''origan.","Servir les sardines avec les tomates et un quartier de citron."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 320, 27, 20, 6, 4),

(uid, 'Cabillaud croustillant au four, panure d''herbes', '', 4, 15, 20,
'[{"id":"1","name":"Filets de cabillaud","quantity":"4","unit":""},{"id":"2","name":"Chapelure complète","quantity":"60","unit":"g"},{"id":"3","name":"Persil","quantity":"","unit":"quelques brins"},{"id":"4","name":"Ail","quantity":"1","unit":"gousse"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Préchauffer le four à 200°C.","Mélanger chapelure, persil haché et ail.","Badigeonner le cabillaud d''huile puis enrober de panure.","Cuire 18-20 minutes au four.","Servir chaud."]',
'{"plat"}',
true, 'approved', '', 300, 30, 8, 22, 4),

(uid, 'Filet de bar, fenouil braisé', '', 4, 15, 25,
'[{"id":"1","name":"Filets de bar","quantity":"4","unit":""},{"id":"2","name":"Fenouil","quantity":"2","unit":"bulbes"},{"id":"3","name":"Vin blanc","quantity":"3","unit":"c. à soupe"},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Sel, poivre","quantity":"","unit":""}]',
'["Couper le fenouil en quartiers, faire braiser 20 minutes avec le vin blanc.","Poêler le bar 3 minutes de chaque côté.","Saler, poivrer.","Servir le poisson sur le fenouil braisé."]',
'{"plat","sans-lactose"}',
true, 'approved', '', 290, 29, 10, 10, 4),

(uid, 'Poisson blanc au curry vert léger', '', 4, 15, 15,
'[{"id":"1","name":"Filets de poisson blanc","quantity":"500","unit":"g"},{"id":"2","name":"Pâte de curry vert","quantity":"1","unit":"c. à soupe"},{"id":"3","name":"Lait de coco allégé","quantity":"200","unit":"ml"},{"id":"4","name":"Riz complet","quantity":"200","unit":"g"},{"id":"5","name":"Coriandre fraîche","quantity":"","unit":"quelques feuilles"}]',
'["Faire chauffer la pâte de curry.","Ajouter le lait de coco, porter à frémissement.","Ajouter le poisson coupé en morceaux, cuire 10 minutes.","Cuire le riz complet.","Parsemer de coriandre et servir."]',
'{"plat"}',
true, 'approved', '', 390, 30, 15, 35, 4),

(uid, 'Ceviche de poisson blanc au citron vert', '', 4, 25, 0,
'[{"id":"1","name":"Filets de poisson blanc très frais","quantity":"400","unit":"g"},{"id":"2","name":"Citron vert","quantity":"3","unit":""},{"id":"3","name":"Oignon rouge","quantity":"1/2","unit":""},{"id":"4","name":"Coriandre fraîche","quantity":"","unit":"quelques feuilles"},{"id":"5","name":"Piment doux","quantity":"1","unit":""}]',
'["Couper le poisson en petits dés.","Couvrir de jus de citron vert, laisser mariner 15 minutes au frais.","Ajouter oignon rouge émincé, coriandre et piment.","Mélanger délicatement.","Servir bien frais."]',
'{"plat","sans-lactose"}',
true, 'approved', 'Sans cuisson — poisson impérativement très frais', 220, 27, 4, 10, 4),

-- ═══════════════════════════════════════════════════
-- 🦐 FRUITS DE MER (15)
-- ═══════════════════════════════════════════════════

(uid, 'Crevettes sautées à l''ail et persil', '', 4, 10, 8,
'[{"id":"1","name":"Crevettes décortiquées","quantity":"500","unit":"g"},{"id":"2","name":"Ail","quantity":"3","unit":"gousses"},{"id":"3","name":"Persil","quantity":"","unit":"1 bouquet"},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Citron","quantity":"1","unit":""}]',
'["Faire chauffer l''huile avec l''ail émincé.","Ajouter les crevettes, cuire 4-5 minutes.","Parsemer de persil haché.","Arroser de jus de citron.","Servir immédiatement."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 220, 30, 8, 4, 4),

(uid, 'Crevettes au curry léger et riz complet', '', 4, 15, 15,
'[{"id":"1","name":"Crevettes décortiquées","quantity":"500","unit":"g"},{"id":"2","name":"Curry en poudre","quantity":"1","unit":"c. à soupe"},{"id":"3","name":"Lait de coco allégé","quantity":"200","unit":"ml"},{"id":"4","name":"Riz complet","quantity":"200","unit":"g"},{"id":"5","name":"Oignon","quantity":"1","unit":""}]',
'["Faire revenir l''oignon émincé.","Ajouter le curry, mélanger 1 minute.","Verser le lait de coco, laisser mijoter 5 minutes.","Ajouter les crevettes, cuire 5 minutes.","Servir avec le riz complet."]',
'{"plat"}',
true, 'approved', '', 380, 30, 14, 34, 4),

(uid, 'Moules marinière allégées', '', 4, 15, 15,
'[{"id":"1","name":"Moules","quantity":"1.5","unit":"kg"},{"id":"2","name":"Échalotes","quantity":"2","unit":""},{"id":"3","name":"Vin blanc","quantity":"150","unit":"ml"},{"id":"4","name":"Persil","quantity":"","unit":"quelques brins"},{"id":"5","name":"Sel, poivre","quantity":"","unit":""}]',
'["Nettoyer les moules soigneusement.","Faire revenir les échalotes émincées.","Ajouter le vin blanc et les moules, couvrir.","Cuire 6-8 minutes en remuant jusqu''à ouverture des moules.","Parsemer de persil et servir."]',
'{"plat","sans-lactose"}',
true, 'approved', '', 290, 26, 8, 12, 4),

(uid, 'Saint-Jacques poêlées, purée de céleri', '', 4, 15, 15,
'[{"id":"1","name":"Noix de Saint-Jacques","quantity":"16","unit":""},{"id":"2","name":"Céleri-rave","quantity":"400","unit":"g"},{"id":"3","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"4","name":"Sel, poivre","quantity":"","unit":""}]',
'["Cuire le céleri-rave à l''eau 15 minutes, mixer avec l''huile.","Saisir les Saint-Jacques 90 secondes de chaque côté.","Saler, poivrer.","Servir sur la purée de céleri."]',
'{"plat","sans-lactose"}',
true, 'approved', '', 260, 28, 8, 14, 4),

(uid, 'Wok de crevettes et légumes croquants', '', 4, 15, 10,
'[{"id":"1","name":"Crevettes décortiquées","quantity":"400","unit":"g"},{"id":"2","name":"Poivrons","quantity":"2","unit":""},{"id":"3","name":"Pousses de soja","quantity":"100","unit":"g"},{"id":"4","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"},{"id":"5","name":"Gingembre","quantity":"1","unit":"morceau"}]',
'["Couper les poivrons en lanières.","Faire sauter le gingembre puis les crevettes 3 minutes.","Ajouter les poivrons et pousses de soja, sauter 4 minutes.","Arroser de sauce soja.","Servir chaud."]',
'{"plat","ig-bas"}',
true, 'approved', '', 240, 28, 6, 16, 4),

(uid, 'Calamars grillés, salade de roquette', '', 4, 15, 8,
'[{"id":"1","name":"Calamars nettoyés","quantity":"500","unit":"g"},{"id":"2","name":"Roquette","quantity":"100","unit":"g"},{"id":"3","name":"Citron","quantity":"1","unit":""},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Ail","quantity":"1","unit":"gousse"}]',
'["Couper les calamars en anneaux.","Griller 2-3 minutes à feu vif avec l''ail émincé.","Arroser de jus de citron.","Servir sur un lit de roquette assaisonnée d''huile."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 240, 29, 9, 6, 4),

(uid, 'Brochettes de crevettes et légumes grillés', '', 4, 20, 10,
'[{"id":"1","name":"Grosses crevettes","quantity":"16","unit":""},{"id":"2","name":"Courgette","quantity":"1","unit":""},{"id":"3","name":"Poivron","quantity":"1","unit":""},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Paprika","quantity":"1","unit":"c. à café"}]',
'["Enfiler crevettes et légumes en alternance sur des piques.","Badigeonner d''huile et de paprika.","Griller 8-10 minutes en retournant.","Servir chaud."]',
'{"plat"}',
true, 'approved', '', 230, 26, 8, 10, 4),

(uid, 'Poêlée de fruits de mer, quinoa aux herbes', '', 4, 15, 15,
'[{"id":"1","name":"Mélange de fruits de mer","quantity":"500","unit":"g"},{"id":"2","name":"Quinoa","quantity":"180","unit":"g"},{"id":"3","name":"Persil","quantity":"","unit":"quelques brins"},{"id":"4","name":"Ail","quantity":"1","unit":"gousse"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Cuire le quinoa selon les instructions, ajouter le persil haché.","Faire revenir l''ail dans l''huile.","Ajouter les fruits de mer, cuire 5-6 minutes.","Servir sur le quinoa."]',
'{"plat","sans-gluten"}',
true, 'approved', '', 380, 32, 12, 36, 4),

(uid, 'Gambas grillées, sauce citron-persil', '', 4, 15, 8,
'[{"id":"1","name":"Gambas","quantity":"20","unit":""},{"id":"2","name":"Citron","quantity":"1","unit":""},{"id":"3","name":"Persil","quantity":"","unit":"1 bouquet"},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Ail","quantity":"1","unit":"gousse"}]',
'["Griller les gambas 3 minutes de chaque côté.","Mixer persil, ail, citron et huile en sauce.","Napper les gambas de sauce.","Servir immédiatement."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 210, 27, 8, 4, 4),

(uid, 'Paella légère aux fruits de mer', '', 4, 20, 30,
'[{"id":"1","name":"Riz complet","quantity":"250","unit":"g"},{"id":"2","name":"Mélange de fruits de mer","quantity":"400","unit":"g"},{"id":"3","name":"Poivron rouge","quantity":"1","unit":""},{"id":"4","name":"Safran","quantity":"1","unit":"pincée"},{"id":"5","name":"Bouillon de légumes","quantity":"600","unit":"ml"}]',
'["Faire revenir le poivron émincé.","Ajouter le riz, mélanger 2 minutes.","Verser le bouillon chaud et le safran, laisser cuire 20 minutes.","Ajouter les fruits de mer 8 minutes avant la fin.","Servir chaud."]',
'{"plat"}',
true, 'approved', '', 420, 26, 6, 62, 4),

(uid, 'Poulpe grillé, pommes de terre et paprika', '', 4, 20, 40,
'[{"id":"1","name":"Poulpe cuit","quantity":"600","unit":"g"},{"id":"2","name":"Pommes de terre","quantity":"400","unit":"g"},{"id":"3","name":"Paprika fumé","quantity":"1","unit":"c. à café"},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Sel","quantity":"","unit":""}]',
'["Cuire les pommes de terre à l''eau, couper en rondelles.","Griller le poulpe 2 minutes de chaque côté.","Saupoudrer de paprika fumé.","Servir avec les pommes de terre arrosées d''huile."]',
'{"plat","sans-lactose"}',
true, 'approved', '', 310, 28, 8, 30, 4),

(uid, 'Crevettes à la noix de coco et coriandre', '', 4, 15, 12,
'[{"id":"1","name":"Crevettes décortiquées","quantity":"500","unit":"g"},{"id":"2","name":"Lait de coco allégé","quantity":"150","unit":"ml"},{"id":"3","name":"Coriandre fraîche","quantity":"","unit":"quelques feuilles"},{"id":"4","name":"Citron vert","quantity":"1","unit":""},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Faire chauffer le lait de coco.","Ajouter les crevettes, cuire 5 minutes.","Arroser de jus de citron vert.","Parsemer de coriandre.","Servir avec le riz complet."]',
'{"plat"}',
true, 'approved', '', 370, 29, 13, 32, 4),

(uid, 'Salade tiède de poulpe et pois chiches', '', 4, 20, 10,
'[{"id":"1","name":"Poulpe cuit","quantity":"400","unit":"g"},{"id":"2","name":"Pois chiches cuits","quantity":"300","unit":"g"},{"id":"3","name":"Persil","quantity":"","unit":"quelques brins"},{"id":"4","name":"Citron","quantity":"1","unit":""},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Couper le poulpe en rondelles, réchauffer légèrement à la poêle.","Mélanger avec les pois chiches.","Assaisonner d''huile, de jus de citron et de persil.","Servir tiède."]',
'{"plat","riche-fibres"}',
true, 'approved', '', 390, 30, 11, 38, 4),

(uid, 'Coquilles Saint-Jacques à la vapeur, sauce agrumes', '', 4, 15, 10,
'[{"id":"1","name":"Noix de Saint-Jacques","quantity":"16","unit":""},{"id":"2","name":"Orange","quantity":"1","unit":""},{"id":"3","name":"Citron vert","quantity":"1","unit":""},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Ciboulette","quantity":"","unit":"quelques brins"}]',
'["Cuire les Saint-Jacques à la vapeur 4-5 minutes.","Mélanger jus d''orange, jus de citron vert et huile.","Napper les Saint-Jacques de sauce.","Parsemer de ciboulette ciselée."]',
'{"plat","sans-lactose"}',
true, 'approved', '', 220, 26, 7, 12, 4),

-- ═══════════════════════════════════════════════════
-- 🥗 BOWLS & SALADES-REPAS PROTÉINÉES (15)
-- ═══════════════════════════════════════════════════

(uid, 'Bowl de poulet grillé, quinoa et avocat', '', 4, 15, 15,
'[{"id":"1","name":"Filets de poulet","quantity":"3","unit":""},{"id":"2","name":"Quinoa","quantity":"180","unit":"g"},{"id":"3","name":"Avocat","quantity":"1","unit":""},{"id":"4","name":"Tomates cerises","quantity":"150","unit":"g"},{"id":"5","name":"Citron","quantity":"1/2","unit":""}]',
'["Cuire le quinoa selon les instructions.","Griller le poulet et le couper en lanières.","Couper l''avocat et les tomates cerises.","Dresser tous les éléments dans un bol.","Arroser de jus de citron."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 450, 35, 18, 38, 4),

(uid, 'Bowl de saumon fumé, riz complet et edamame', '', 4, 10, 15,
'[{"id":"1","name":"Saumon fumé","quantity":"200","unit":"g"},{"id":"2","name":"Riz complet","quantity":"200","unit":"g"},{"id":"3","name":"Edamame","quantity":"150","unit":"g"},{"id":"4","name":"Concombre","quantity":"1/2","unit":""},{"id":"5","name":"Sauce soja légère","quantity":"1","unit":"c. à soupe"}]',
'["Cuire le riz complet.","Cuire les edamame 5 minutes à l''eau bouillante.","Couper le concombre en rondelles et le saumon en lanières.","Dresser tous les éléments dans un bol.","Arroser de sauce soja."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 420, 27, 14, 42, 4),

(uid, 'Salade César allégée au poulet grillé', '', 4, 15, 12,
'[{"id":"1","name":"Filets de poulet","quantity":"3","unit":""},{"id":"2","name":"Salade romaine","quantity":"1","unit":""},{"id":"3","name":"Parmesan râpé","quantity":"30","unit":"g"},{"id":"4","name":"Yaourt nature","quantity":"3","unit":"c. à soupe"},{"id":"5","name":"Ail","quantity":"1","unit":"gousse"}]',
'["Griller le poulet et le couper en lanières.","Laver et couper la salade romaine.","Mélanger yaourt, ail écrasé et un peu de parmesan pour la sauce.","Dresser la salade avec le poulet.","Napper de sauce et parsemer de parmesan."]',
'{"plat","riche-proteines"}',
true, 'approved', 'Sauce allégée au yaourt au lieu de mayonnaise', 380, 38, 15, 12, 4),

(uid, 'Bowl méditerranéen au thon et boulgour', '', 4, 15, 12,
'[{"id":"1","name":"Thon au naturel","quantity":"200","unit":"g"},{"id":"2","name":"Boulgour","quantity":"180","unit":"g"},{"id":"3","name":"Concombre","quantity":"1","unit":""},{"id":"4","name":"Tomates","quantity":"2","unit":""},{"id":"5","name":"Olives noires","quantity":"40","unit":"g"}]',
'["Cuire le boulgour selon les instructions.","Couper concombre et tomates en dés.","Émietter le thon.","Mélanger tous les ingrédients avec les olives.","Servir frais ou tiède."]',
'{"plat","riche-fibres"}',
true, 'approved', '', 400, 28, 9, 52, 4),

(uid, 'Salade de crevettes, mangue et quinoa', '', 4, 20, 15,
'[{"id":"1","name":"Crevettes décortiquées","quantity":"400","unit":"g"},{"id":"2","name":"Quinoa","quantity":"150","unit":"g"},{"id":"3","name":"Mangue","quantity":"1","unit":""},{"id":"4","name":"Roquette","quantity":"80","unit":"g"},{"id":"5","name":"Citron vert","quantity":"1","unit":""}]',
'["Cuire le quinoa selon les instructions.","Poêler les crevettes 5 minutes.","Couper la mangue en dés.","Mélanger quinoa, roquette, mangue et crevettes.","Arroser de jus de citron vert."]',
'{"plat","sans-gluten"}',
true, 'approved', '', 380, 27, 7, 48, 4),

(uid, 'Bowl de dinde, patate douce rôtie et épinards', '', 4, 15, 25,
'[{"id":"1","name":"Escalopes de dinde","quantity":"400","unit":"g"},{"id":"2","name":"Patate douce","quantity":"1","unit":""},{"id":"3","name":"Épinards frais","quantity":"150","unit":"g"},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Graines de courge","quantity":"1","unit":"c. à soupe"}]',
'["Couper la patate douce en cubes, rôtir au four 25 minutes à 200°C.","Griller la dinde et la couper en tranches.","Faire tomber les épinards à la poêle.","Dresser tous les éléments dans un bol.","Parsemer de graines de courge."]',
'{"plat","riche-fibres"}',
true, 'approved', '', 410, 33, 12, 40, 4),

(uid, 'Salade grecque au poulet grillé', '', 4, 15, 12,
'[{"id":"1","name":"Filets de poulet","quantity":"3","unit":""},{"id":"2","name":"Concombre","quantity":"1","unit":""},{"id":"3","name":"Tomates","quantity":"2","unit":""},{"id":"4","name":"Feta","quantity":"80","unit":"g"},{"id":"5","name":"Olives noires","quantity":"40","unit":"g"}]',
'["Griller le poulet et le couper en morceaux.","Couper concombre et tomates.","Mélanger tous les légumes avec les olives.","Ajouter la feta émiettée et le poulet.","Arroser d''un filet d''huile d''olive."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 400, 36, 20, 12, 4),

(uid, 'Bowl végé-poisson, riz complet et légumes rôtis', '', 4, 15, 25,
'[{"id":"1","name":"Filets de poisson blanc","quantity":"400","unit":"g"},{"id":"2","name":"Riz complet","quantity":"200","unit":"g"},{"id":"3","name":"Courgette","quantity":"1","unit":""},{"id":"4","name":"Poivron","quantity":"1","unit":""},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Cuire le riz complet.","Rôtir courgette et poivron au four 20 minutes à 200°C.","Poêler le poisson 4 minutes de chaque côté.","Dresser riz, légumes et poisson dans un bol."]',
'{"plat"}',
true, 'approved', '', 400, 30, 9, 45, 4),

(uid, 'Bowl thaï au poulet et vermicelles de riz', '', 4, 20, 12,
'[{"id":"1","name":"Filets de poulet","quantity":"3","unit":""},{"id":"2","name":"Vermicelles de riz","quantity":"150","unit":"g"},{"id":"3","name":"Carotte","quantity":"1","unit":""},{"id":"4","name":"Cacahuètes concassées","quantity":"20","unit":"g"},{"id":"5","name":"Citron vert","quantity":"1","unit":""}]',
'["Faire tremper les vermicelles dans l''eau chaude.","Griller le poulet et le couper en lanières.","Râper la carotte.","Dresser vermicelles, carotte et poulet.","Parsemer de cacahuètes et arroser de citron vert."]',
'{"plat"}',
true, 'approved', '', 420, 32, 12, 45, 4),

(uid, 'Taboulé de quinoa au poulet et menthe', '', 4, 15, 12,
'[{"id":"1","name":"Filets de poulet","quantity":"3","unit":""},{"id":"2","name":"Quinoa","quantity":"180","unit":"g"},{"id":"3","name":"Menthe fraîche","quantity":"","unit":"1 bouquet"},{"id":"4","name":"Tomates","quantity":"2","unit":""},{"id":"5","name":"Citron","quantity":"1","unit":""}]',
'["Cuire le quinoa et laisser refroidir.","Griller le poulet et le couper en dés.","Couper les tomates en petits dés.","Mélanger quinoa, tomates, menthe ciselée et poulet.","Arroser de jus de citron."]',
'{"plat","sans-gluten"}',
true, 'approved', '', 400, 33, 9, 42, 4),

(uid, 'Bowl de thon mi-cuit, riz complet et sésame', '', 4, 20, 8,
'[{"id":"1","name":"Steaks de thon","quantity":"400","unit":"g"},{"id":"2","name":"Riz complet","quantity":"200","unit":"g"},{"id":"3","name":"Graines de sésame","quantity":"1","unit":"c. à soupe"},{"id":"4","name":"Avocat","quantity":"1","unit":""},{"id":"5","name":"Sauce soja légère","quantity":"1","unit":"c. à soupe"}]',
'["Cuire le riz complet.","Saisir le thon 1 minute de chaque côté, couper en tranches.","Couper l''avocat en lamelles.","Dresser riz, thon et avocat dans un bol.","Parsemer de sésame et arroser de sauce soja."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 460, 35, 18, 38, 4),

(uid, 'Salade de poulet, pomme et noix', '', 4, 15, 12,
'[{"id":"1","name":"Filets de poulet","quantity":"3","unit":""},{"id":"2","name":"Pomme","quantity":"1","unit":""},{"id":"3","name":"Noix","quantity":"40","unit":"g"},{"id":"4","name":"Mâche","quantity":"100","unit":"g"},{"id":"5","name":"Vinaigre balsamique","quantity":"1","unit":"c. à soupe"}]',
'["Griller le poulet et le couper en lanières.","Couper la pomme en fines tranches.","Mélanger mâche, pomme et noix.","Ajouter le poulet.","Arroser de vinaigre balsamique."]',
'{"plat","riche-proteines"}',
true, 'approved', '', 380, 32, 16, 20, 4),

(uid, 'Bowl de crevettes, riz complet et mangue', '', 4, 15, 10,
'[{"id":"1","name":"Crevettes décortiquées","quantity":"400","unit":"g"},{"id":"2","name":"Riz complet","quantity":"200","unit":"g"},{"id":"3","name":"Mangue","quantity":"1","unit":""},{"id":"4","name":"Coriandre fraîche","quantity":"","unit":"quelques feuilles"},{"id":"5","name":"Citron vert","quantity":"1","unit":""}]',
'["Cuire le riz complet.","Poêler les crevettes 5 minutes.","Couper la mangue en dés.","Dresser riz, crevettes et mangue dans un bol.","Parsemer de coriandre et arroser de citron vert."]',
'{"plat"}',
true, 'approved', '', 380, 26, 6, 50, 4),

(uid, 'Salade tiède de dinde, lentilles et épinards', '', 4, 15, 20,
'[{"id":"1","name":"Escalopes de dinde","quantity":"400","unit":"g"},{"id":"2","name":"Lentilles vertes","quantity":"180","unit":"g"},{"id":"3","name":"Épinards frais","quantity":"100","unit":"g"},{"id":"4","name":"Vinaigre de cidre","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Cuire les lentilles 20 minutes à l''eau.","Griller la dinde et la couper en tranches.","Mélanger lentilles tièdes, épinards et vinaigrette.","Ajouter la dinde.","Servir tiède."]',
'{"plat","riche-fibres"}',
true, 'approved', '', 420, 36, 10, 38, 4),

(uid, 'Bowl de poisson blanc, riz complet et chou rouge', '', 4, 15, 15,
'[{"id":"1","name":"Filets de poisson blanc","quantity":"400","unit":"g"},{"id":"2","name":"Riz complet","quantity":"200","unit":"g"},{"id":"3","name":"Chou rouge","quantity":"150","unit":"g"},{"id":"4","name":"Yaourt nature","quantity":"2","unit":"c. à soupe"},{"id":"5","name":"Citron","quantity":"1/2","unit":""}]',
'["Cuire le riz complet.","Poêler le poisson 4 minutes de chaque côté.","Émincer finement le chou rouge, assaisonner de yaourt et citron.","Dresser riz, poisson et chou rouge dans un bol."]',
'{"plat","riche-fibres"}',
true, 'approved', '', 390, 31, 6, 46, 4),

-- ═══════════════════════════════════════════════════
-- 🌍 VOLAILLE & POISSON DU MONDE, LÉGER (7)
-- ═══════════════════════════════════════════════════

(uid, 'Poulet yassa allégé', '', 4, 20, 30,
'[{"id":"1","name":"Filets de poulet","quantity":"4","unit":""},{"id":"2","name":"Oignons","quantity":"3","unit":""},{"id":"3","name":"Citron","quantity":"2","unit":""},{"id":"4","name":"Moutarde","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Mariner le poulet avec le jus de citron, la moutarde et un oignon émincé pendant 1 heure.","Faire dorer le poulet, réserver.","Faire caraméliser les oignons restants dans l''huile.","Remettre le poulet, mijoter 20 minutes.","Servir chaud."]',
'{"plat"}',
true, 'approved', 'Version allégée du classique sénégalais', 340, 34, 10, 16, 4),

(uid, 'Poisson blanc à la marocaine, chermoula', '', 4, 20, 20,
'[{"id":"1","name":"Filets de poisson blanc","quantity":"500","unit":"g"},{"id":"2","name":"Coriandre fraîche","quantity":"","unit":"1 bouquet"},{"id":"3","name":"Ail","quantity":"2","unit":"gousses"},{"id":"4","name":"Cumin","quantity":"1","unit":"c. à café"},{"id":"5","name":"Citron","quantity":"1","unit":""}]',
'["Mixer coriandre, ail, cumin, citron et un peu d''huile pour la chermoula.","Enduire le poisson de la moitié de la sauce, laisser mariner 15 minutes.","Cuire au four 20 minutes à 190°C.","Napper du reste de sauce avant de servir."]',
'{"plat","sans-lactose"}',
true, 'approved', '', 270, 29, 8, 8, 4),

(uid, 'Poulet tikka masala allégé', '', 4, 20, 25,
'[{"id":"1","name":"Filets de poulet","quantity":"4","unit":""},{"id":"2","name":"Yaourt nature","quantity":"150","unit":"g"},{"id":"3","name":"Épices tikka","quantity":"1","unit":"c. à soupe"},{"id":"4","name":"Tomates concassées","quantity":"300","unit":"g"},{"id":"5","name":"Riz basmati complet","quantity":"200","unit":"g"}]',
'["Mariner le poulet dans le yaourt et les épices 30 minutes.","Cuire le poulet à la poêle 8 minutes.","Ajouter les tomates concassées, mijoter 10 minutes.","Cuire le riz basmati complet.","Servir ensemble."]',
'{"plat"}',
true, 'approved', '', 390, 35, 9, 40, 4),

(uid, 'Dinde à la libanaise, sept épices et boulgour', '', 4, 15, 20,
'[{"id":"1","name":"Escalopes de dinde","quantity":"500","unit":"g"},{"id":"2","name":"Sept épices libanaises","quantity":"1","unit":"c. à café"},{"id":"3","name":"Boulgour","quantity":"200","unit":"g"},{"id":"4","name":"Persil","quantity":"","unit":"quelques brins"},{"id":"5","name":"Citron","quantity":"1/2","unit":""}]',
'["Cuire le boulgour selon les instructions.","Assaisonner la dinde des sept épices.","Griller la dinde 4 minutes de chaque côté.","Parsemer de persil et arroser de citron.","Servir avec le boulgour."]',
'{"plat","riche-fibres"}',
true, 'approved', '', 380, 34, 8, 42, 4),

(uid, 'Poisson à la vapeur façon cantonaise', '', 4, 15, 15,
'[{"id":"1","name":"Filet de poisson blanc entier","quantity":"600","unit":"g"},{"id":"2","name":"Gingembre frais","quantity":"1","unit":"morceau"},{"id":"3","name":"Ciboule","quantity":"3","unit":"tiges"},{"id":"4","name":"Sauce soja légère","quantity":"2","unit":"c. à soupe"},{"id":"5","name":"Huile de sésame","quantity":"1","unit":"c. à café"}]',
'["Disposer le poisson sur un lit de gingembre émincé.","Cuire à la vapeur 15 minutes.","Parsemer de ciboule fraîche.","Arroser de sauce soja chaude et d''huile de sésame.","Servir immédiatement."]',
'{"plat","ig-bas"}',
true, 'approved', '', 260, 32, 6, 6, 4),

(uid, 'Poulet à l''éthiopienne, berbéré léger', '', 4, 20, 30,
'[{"id":"1","name":"Cuisses de poulet sans peau","quantity":"4","unit":""},{"id":"2","name":"Épices berbéré","quantity":"1","unit":"c. à soupe"},{"id":"3","name":"Tomates","quantity":"2","unit":""},{"id":"4","name":"Oignon","quantity":"1","unit":""},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Faire revenir l''oignon dans l''huile.","Ajouter les épices berbéré, mélanger 1 minute.","Ajouter le poulet et les tomates concassées.","Couvrir et mijoter 25 minutes.","Servir chaud."]',
'{"plat"}',
true, 'approved', '', 320, 33, 11, 12, 4),

(uid, 'Crevettes à la créole allégées', '', 4, 15, 15,
'[{"id":"1","name":"Crevettes décortiquées","quantity":"500","unit":"g"},{"id":"2","name":"Tomates","quantity":"3","unit":""},{"id":"3","name":"Piment (facultatif)","quantity":"1","unit":""},{"id":"4","name":"Ail","quantity":"2","unit":"gousses"},{"id":"5","name":"Riz complet","quantity":"200","unit":"g"}]',
'["Faire revenir l''ail et le piment.","Ajouter les tomates concassées, mijoter 10 minutes.","Ajouter les crevettes, cuire 5 minutes.","Cuire le riz complet.","Servir ensemble."]',
'{"plat"}',
true, 'approved', '', 330, 28, 6, 40, 4);

END $$;
