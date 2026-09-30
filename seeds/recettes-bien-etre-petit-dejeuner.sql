-- BIEN-ÊTRE — Petits-déjeuners (50 recettes)
-- Nutrition estimée manuellement à la création (pas d'appel Gemini) : indicative.
-- tags : colonne text[] Postgres (littéral '{"a","b"}'), pas du JSON.

DO $$
DECLARE
  uid uuid := '97a98e5c-d29d-4a9f-9d84-0684eef75fe6'::uuid;
BEGIN

-- ═══════════════════════════════════════════════════
-- 🍳 ŒUFS & VERSIONS SALÉES (13)
-- ═══════════════════════════════════════════════════

INSERT INTO recipes (user_id, title, source_url, servings, prep_time, cook_time, ingredients, steps, tags, is_public, moderation_status, user_notes, nutrition_calories, nutrition_proteins, nutrition_fat, nutrition_carbs, nutrition_base) VALUES

(uid, 'Omelette aux épinards et feta', '', 1, 5, 5,
'[{"id":"1","name":"Œufs","quantity":"3","unit":""},{"id":"2","name":"Épinards frais","quantity":"50","unit":"g"},{"id":"3","name":"Feta","quantity":"30","unit":"g"},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à café"},{"id":"5","name":"Sel, poivre","quantity":"","unit":""}]',
'["Battre les œufs avec sel et poivre.","Faire tomber les épinards 1 minute dans une poêle huilée.","Verser les œufs battus, cuire 2 minutes à feu doux.","Parsemer de feta émiettée, plier l''omelette.","Servir chaud."]',
'{"petit-dejeuner","riche-proteines"}',
true, 'approved', '', 280, 20, 20, 4, 1),

(uid, 'Œufs brouillés à l''avocat et tomates cerises', '', 1, 5, 5,
'[{"id":"1","name":"Œufs","quantity":"2","unit":""},{"id":"2","name":"Avocat","quantity":"0.5","unit":""},{"id":"3","name":"Tomates cerises","quantity":"80","unit":"g"},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à café"},{"id":"5","name":"Sel, poivre","quantity":"","unit":""}]',
'["Battre les œufs, saler, poivrer.","Cuire à feu doux en remuant jusqu''à consistance crémeuse.","Couper l''avocat et les tomates cerises.","Dresser les œufs brouillés avec l''avocat et les tomates.","Arroser d''un filet d''huile d''olive."]',
'{"petit-dejeuner","riche-fibres"}',
true, 'approved', '', 320, 14, 24, 10, 1),

(uid, 'Shakshuka minute pour un', '', 1, 5, 10,
'[{"id":"1","name":"Œufs","quantity":"2","unit":""},{"id":"2","name":"Tomates concassées","quantity":"150","unit":"g"},{"id":"3","name":"Oignon","quantity":"0.25","unit":""},{"id":"4","name":"Cumin","quantity":"1","unit":"pincée"},{"id":"5","name":"Paprika","quantity":"1","unit":"pincée"},{"id":"6","name":"Huile d''olive","quantity":"1","unit":"c. à café"}]',
'["Faire revenir l''oignon émincé dans l''huile.","Ajouter les tomates et les épices, mijoter 5 minutes.","Creuser deux puits et y casser les œufs.","Couvrir et cuire 4 minutes jusqu''à ce que les blancs soient pris.","Servir directement dans la poêle."]',
'{"petit-dejeuner","ig-bas"}',
true, 'approved', '', 220, 13, 14, 10, 1),

(uid, 'Muffins aux œufs et légumes (batch 6)', '', 6, 10, 20,
'[{"id":"1","name":"Œufs","quantity":"6","unit":""},{"id":"2","name":"Poivron","quantity":"1","unit":""},{"id":"3","name":"Épinards frais","quantity":"50","unit":"g"},{"id":"4","name":"Oignon","quantity":"0.5","unit":""},{"id":"5","name":"Fromage râpé allégé","quantity":"40","unit":"g"},{"id":"6","name":"Sel, poivre","quantity":"","unit":""}]',
'["Préchauffer le four à 180°C.","Battre les œufs, saler, poivrer.","Répartir les légumes coupés en dés dans un moule à muffins huilé.","Verser les œufs battus par-dessus, parsemer de fromage.","Cuire 18-20 minutes jusqu''à ce que les muffins soient pris."]',
'{"petit-dejeuner","riche-proteines"}',
true, 'approved', 'Se conservent 3 jours au frigo, à réchauffer', 110, 9, 7, 3, 6),

(uid, 'Omelette au saumon fumé et ciboulette', '', 1, 5, 5,
'[{"id":"1","name":"Œufs","quantity":"2","unit":""},{"id":"2","name":"Saumon fumé","quantity":"40","unit":"g"},{"id":"3","name":"Ciboulette fraîche","quantity":"","unit":"quelques brins"},{"id":"4","name":"Huile d''olive","quantity":"1","unit":"c. à café"},{"id":"5","name":"Poivre","quantity":"","unit":""}]',
'["Battre les œufs avec la ciboulette ciselée et le poivre.","Chauffer l''huile dans une poêle.","Verser les œufs, cuire 2 minutes à feu doux.","Ajouter le saumon fumé coupé en lanières sur une moitié.","Plier l''omelette et servir aussitôt."]',
'{"petit-dejeuner","riche-proteines"}',
true, 'approved', '', 260, 20, 18, 2, 1),

(uid, 'Œuf poché sur toast complet et avocat', '', 1, 5, 5,
'[{"id":"1","name":"Œuf","quantity":"1","unit":""},{"id":"2","name":"Pain complet","quantity":"1","unit":"tranche"},{"id":"3","name":"Avocat","quantity":"0.5","unit":""},{"id":"4","name":"Jus de citron","quantity":"1","unit":"filet"},{"id":"5","name":"Sel, poivre","quantity":"","unit":""}]',
'["Porter une casserole d''eau frémissante avec un filet de vinaigre.","Casser l''œuf dans un ramequin puis le glisser délicatement dans l''eau, pocher 3 minutes.","Griller la tranche de pain.","Écraser l''avocat avec le jus de citron, tartiner sur le pain.","Déposer l''œuf poché dessus, saler et poivrer."]',
'{"petit-dejeuner","riche-fibres"}',
true, 'approved', '', 320, 13, 18, 28, 1),

(uid, 'Tofu scramble aux légumes (vegan)', '', 1, 5, 8,
'[{"id":"1","name":"Tofu ferme","quantity":"150","unit":"g"},{"id":"2","name":"Poivron","quantity":"0.5","unit":""},{"id":"3","name":"Curcuma","quantity":"0.5","unit":"c. à café"},{"id":"4","name":"Oignon","quantity":"0.25","unit":""},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à café"},{"id":"6","name":"Sel, poivre","quantity":"","unit":""}]',
'["Émietter le tofu à la fourchette.","Faire revenir l''oignon et le poivron dans l''huile.","Ajouter le tofu émietté et le curcuma.","Cuire 5 minutes en remuant jusqu''à coloration dorée.","Saler, poivrer et servir chaud."]',
'{"petit-dejeuner","vegan","riche-proteines"}',
true, 'approved', '', 220, 16, 14, 8, 1),

(uid, 'Frittata légère au chèvre et courgette', '', 4, 10, 20,
'[{"id":"1","name":"Œufs","quantity":"6","unit":""},{"id":"2","name":"Courgette","quantity":"1","unit":""},{"id":"3","name":"Fromage de chèvre frais","quantity":"60","unit":"g"},{"id":"4","name":"Lait demi-écrémé","quantity":"50","unit":"ml"},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"},{"id":"6","name":"Sel, poivre","quantity":"","unit":""}]',
'["Préchauffer le four à 180°C.","Faire revenir la courgette en fines rondelles dans l''huile.","Battre les œufs avec le lait, saler et poivrer.","Verser dans un plat avec la courgette, parsemer de chèvre émietté.","Cuire 18 minutes jusqu''à ce que la frittata soit prise."]',
'{"petit-dejeuner","riche-proteines"}',
true, 'approved', '', 180, 14, 12, 4, 4),

(uid, 'Œufs cocotte au jambon et champignons', '', 1, 5, 10,
'[{"id":"1","name":"Œufs","quantity":"2","unit":""},{"id":"2","name":"Jambon blanc","quantity":"1","unit":"tranche"},{"id":"3","name":"Champignons de Paris","quantity":"50","unit":"g"},{"id":"4","name":"Crème légère","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Sel, poivre","quantity":"","unit":""}]',
'["Préchauffer le four à 180°C.","Faire revenir les champignons émincés 3 minutes.","Répartir jambon coupé et champignons dans un ramequin.","Casser les œufs par-dessus, napper de crème légère.","Cuire au bain-marie 10 minutes au four."]',
'{"petit-dejeuner","riche-proteines"}',
true, 'approved', '', 260, 20, 18, 4, 1),

(uid, 'Wrap petit-déjeuner œuf-avocat', '', 1, 8, 5,
'[{"id":"1","name":"Tortilla complète","quantity":"1","unit":""},{"id":"2","name":"Œufs","quantity":"2","unit":""},{"id":"3","name":"Avocat","quantity":"0.5","unit":""},{"id":"4","name":"Tomate","quantity":"0.5","unit":""},{"id":"5","name":"Épinards frais","quantity":"20","unit":"g"},{"id":"6","name":"Sel, poivre","quantity":"","unit":""}]',
'["Brouiller les œufs à la poêle, saler et poivrer.","Réchauffer légèrement la tortilla.","Écraser l''avocat, tartiner sur la tortilla.","Garnir d''œufs brouillés, tomate en dés et épinards.","Rouler le wrap et couper en deux."]',
'{"petit-dejeuner","riche-fibres"}',
true, 'approved', '', 380, 18, 20, 32, 1),

(uid, 'Omelette blanche aux blancs d''œufs et légumes', '', 1, 5, 6,
'[{"id":"1","name":"Blancs d''œufs","quantity":"4","unit":""},{"id":"2","name":"Poivron","quantity":"0.5","unit":""},{"id":"3","name":"Épinards frais","quantity":"30","unit":"g"},{"id":"4","name":"Oignon","quantity":"0.25","unit":""},{"id":"5","name":"Huile en spray ou 1 c. à café","quantity":"","unit":""}]',
'["Faire revenir légumes émincés 3 minutes dans une poêle légèrement huilée.","Battre les blancs d''œufs.","Verser sur les légumes, cuire à feu doux 3 minutes.","Plier l''omelette en deux.","Servir chaud."]',
'{"petit-dejeuner","ig-bas","riche-proteines"}',
true, 'approved', 'Idéal pour un petit-déjeuner très pauvre en matières grasses', 160, 20, 5, 6, 1),

(uid, 'Shakshuka verte aux épinards et feta', '', 2, 8, 12,
'[{"id":"1","name":"Œufs","quantity":"4","unit":""},{"id":"2","name":"Épinards frais","quantity":"200","unit":"g"},{"id":"3","name":"Feta","quantity":"50","unit":"g"},{"id":"4","name":"Oignon","quantity":"0.5","unit":""},{"id":"5","name":"Ail","quantity":"1","unit":"gousse"},{"id":"6","name":"Huile d''olive","quantity":"1","unit":"c. à soupe"}]',
'["Faire revenir oignon et ail dans l''huile.","Ajouter les épinards, faire tomber 2 minutes.","Creuser des puits et y casser les œufs.","Parsemer de feta émiettée, couvrir 4 minutes.","Servir dès que les blancs sont pris."]',
'{"petit-dejeuner","riche-fibres"}',
true, 'approved', '', 260, 17, 18, 8, 2),

(uid, 'Petit-déjeuner protéiné œufs-quinoa', '', 1, 5, 10,
'[{"id":"1","name":"Œufs","quantity":"2","unit":""},{"id":"2","name":"Quinoa cuit","quantity":"80","unit":"g"},{"id":"3","name":"Épinards frais","quantity":"30","unit":"g"},{"id":"4","name":"Tomate","quantity":"0.5","unit":""},{"id":"5","name":"Huile d''olive","quantity":"1","unit":"c. à café"}]',
'["Réchauffer le quinoa cuit à la poêle avec un peu d''huile.","Ajouter les épinards, faire tomber 1 minute.","Pousser sur le côté et cuire les œufs au plat dans la même poêle.","Dresser le quinoa-épinards avec les œufs et la tomate en dés.","Saler, poivrer et servir chaud."]',
'{"petit-dejeuner","riche-proteines"}',
true, 'approved', '', 340, 18, 16, 30, 1),

-- ═══════════════════════════════════════════════════
-- 🥣 AVOINE, PORRIDGE, PANCAKES & GAUFRES (13)
-- ═══════════════════════════════════════════════════

(uid, 'Porridge classique flocons d''avoine et fruits rouges', '', 1, 3, 5,
'[{"id":"1","name":"Flocons d''avoine","quantity":"50","unit":"g"},{"id":"2","name":"Lait demi-écrémé","quantity":"200","unit":"ml"},{"id":"3","name":"Fruits rouges (frais ou surgelés)","quantity":"80","unit":"g"},{"id":"4","name":"Miel","quantity":"1","unit":"c. à café"}]',
'["Verser les flocons d''avoine et le lait dans une casserole.","Cuire à feu doux 5 minutes en remuant jusqu''à épaississement.","Verser dans un bol.","Garnir de fruits rouges.","Arroser de miel."]',
'{"petit-dejeuner","riche-fibres"}',
true, 'approved', '', 320, 12, 7, 54, 1),

(uid, 'Overnight oats banane-cacao', '', 1, 5, 0,
'[{"id":"1","name":"Flocons d''avoine","quantity":"50","unit":"g"},{"id":"2","name":"Lait végétal","quantity":"150","unit":"ml"},{"id":"3","name":"Banane","quantity":"0.5","unit":""},{"id":"4","name":"Cacao en poudre non sucré","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Graines de chia","quantity":"1","unit":"c. à soupe"}]',
'["Mélanger flocons d''avoine, lait végétal, cacao et chia dans un bocal.","Ajouter la demi-banane écrasée.","Bien mélanger, fermer le bocal.","Réserver au réfrigérateur toute la nuit.","Déguster froid, éventuellement garni de banane en tranches."]',
'{"petit-dejeuner","riche-fibres"}',
true, 'approved', 'À préparer la veille au soir', 340, 10, 9, 54, 1),

(uid, 'Porridge protéiné au beurre de cacahuète', '', 1, 3, 5,
'[{"id":"1","name":"Flocons d''avoine","quantity":"50","unit":"g"},{"id":"2","name":"Lait demi-écrémé","quantity":"200","unit":"ml"},{"id":"3","name":"Beurre de cacahuète","quantity":"1","unit":"c. à soupe"},{"id":"4","name":"Banane","quantity":"0.5","unit":""}]',
'["Cuire les flocons d''avoine dans le lait 5 minutes à feu doux.","Incorporer le beurre de cacahuète hors du feu.","Verser dans un bol.","Garnir de rondelles de banane.","Servir tiède."]',
'{"petit-dejeuner","riche-proteines"}',
true, 'approved', '', 380, 18, 14, 48, 1),

(uid, 'Pancakes à la banane sans sucre ajouté', '', 2, 5, 10,
'[{"id":"1","name":"Bananes bien mûres","quantity":"2","unit":""},{"id":"2","name":"Œufs","quantity":"2","unit":""},{"id":"3","name":"Flocons d''avoine mixés","quantity":"60","unit":"g"},{"id":"4","name":"Levure chimique","quantity":"0.5","unit":"c. à café"}]',
'["Écraser les bananes à la fourchette.","Mélanger avec les œufs battus, l''avoine mixée et la levure.","Cuire des petites louches de pâte 2 minutes de chaque côté dans une poêle légèrement huilée.","Empiler les pancakes.","Servir tel quel ou avec un peu de fruits frais."]',
'{"petit-dejeuner","riche-fibres"}',
true, 'approved', 'Sans sucre ajouté, la banane suffit à sucrer', 260, 10, 7, 38, 2),

(uid, 'Pancakes protéinés à l''avoine', '', 2, 5, 10,
'[{"id":"1","name":"Flocons d''avoine mixés","quantity":"80","unit":"g"},{"id":"2","name":"Œufs","quantity":"2","unit":""},{"id":"3","name":"Fromage blanc ou cottage cheese","quantity":"100","unit":"g"},{"id":"4","name":"Levure chimique","quantity":"0.5","unit":"c. à café"}]',
'["Mixer tous les ingrédients ensemble jusqu''à obtenir une pâte lisse.","Laisser reposer 5 minutes.","Cuire des petites louches 2 minutes de chaque côté dans une poêle légèrement huilée.","Empiler les pancakes.","Servir chaud."]',
'{"petit-dejeuner","riche-proteines"}',
true, 'approved', '', 320, 20, 9, 38, 2),

(uid, 'Gaufres légères à la banane et cannelle', '', 4, 10, 15,
'[{"id":"1","name":"Farine d''avoine","quantity":"150","unit":"g"},{"id":"2","name":"Bananes","quantity":"2","unit":""},{"id":"3","name":"Œufs","quantity":"2","unit":""},{"id":"4","name":"Lait demi-écrémé","quantity":"150","unit":"ml"},{"id":"5","name":"Cannelle","quantity":"1","unit":"c. à café"},{"id":"6","name":"Levure chimique","quantity":"1","unit":"c. à café"}]',
'["Écraser les bananes, mélanger avec les œufs et le lait.","Ajouter la farine d''avoine, la cannelle et la levure.","Bien mélanger jusqu''à obtenir une pâte homogène.","Cuire dans un gaufrier chaud légèrement huilé, 4 minutes par gaufre.","Servir tiède."]',
'{"petit-dejeuner","riche-fibres"}',
true, 'approved', '', 220, 7, 6, 34, 4),

(uid, 'Porridge coco-mangue', '', 1, 3, 5,
'[{"id":"1","name":"Flocons d''avoine","quantity":"50","unit":"g"},{"id":"2","name":"Lait de coco allégé","quantity":"150","unit":"ml"},{"id":"3","name":"Mangue","quantity":"80","unit":"g"}]',
'["Cuire les flocons d''avoine dans le lait de coco 5 minutes à feu doux.","Verser dans un bol.","Couper la mangue en dés.","Garnir le porridge de mangue.","Servir tiède ou froid."]',
'{"petit-dejeuner"}',
true, 'approved', '', 360, 8, 12, 54, 1),

(uid, 'Bircher muesli aux pommes', '', 1, 8, 0,
'[{"id":"1","name":"Flocons d''avoine","quantity":"50","unit":"g"},{"id":"2","name":"Pomme","quantity":"1","unit":""},{"id":"3","name":"Yaourt nature","quantity":"100","unit":"g"},{"id":"4","name":"Amandes effilées","quantity":"15","unit":"g"},{"id":"5","name":"Jus de citron","quantity":"1","unit":"filet"}]',
'["Râper la pomme, arroser de jus de citron pour éviter qu''elle noircisse.","Mélanger avec les flocons d''avoine et le yaourt.","Couvrir et réserver au réfrigérateur, idéalement toute une nuit.","Parsemer d''amandes effilées avant de servir.","Déguster frais."]',
'{"petit-dejeuner","riche-fibres"}',
true, 'approved', 'Recette suisse traditionnelle, à préparer la veille', 360, 14, 10, 54, 1),

(uid, 'Porridge au quinoa et fruits secs', '', 1, 5, 5,
'[{"id":"1","name":"Quinoa cuit","quantity":"100","unit":"g"},{"id":"2","name":"Lait demi-écrémé","quantity":"150","unit":"ml"},{"id":"3","name":"Raisins secs","quantity":"20","unit":"g"},{"id":"4","name":"Cannelle","quantity":"1","unit":"pincée"},{"id":"5","name":"Amandes effilées","quantity":"10","unit":"g"}]',
'["Réchauffer le quinoa cuit avec le lait à feu doux.","Ajouter la cannelle, mélanger.","Verser dans un bol.","Garnir de raisins secs et d''amandes effilées.","Servir tiède."]',
'{"petit-dejeuner","sans-gluten"}',
true, 'approved', '', 340, 12, 10, 50, 1),

(uid, 'Crêpes de sarrasin healthy sans sucre', '', 4, 10, 15,
'[{"id":"1","name":"Farine de sarrasin","quantity":"200","unit":"g"},{"id":"2","name":"Œufs","quantity":"2","unit":""},{"id":"3","name":"Lait demi-écrémé","quantity":"400","unit":"ml"},{"id":"4","name":"Sel","quantity":"1","unit":"pincée"}]',
'["Mélanger la farine de sarrasin et le sel.","Incorporer les œufs puis le lait petit à petit en fouettant.","Laisser reposer la pâte 20 minutes.","Cuire les crêpes dans une poêle chaude légèrement huilée, 1-2 minutes par face.","Servir nature ou garnies au choix."]',
'{"petit-dejeuner","sans-gluten"}',
true, 'approved', '', 180, 7, 3, 30, 4),

(uid, 'Porridge express au micro-ondes', '', 1, 2, 3,
'[{"id":"1","name":"Flocons d''avoine","quantity":"40","unit":"g"},{"id":"2","name":"Lait demi-écrémé","quantity":"180","unit":"ml"},{"id":"3","name":"Miel","quantity":"1","unit":"c. à café"}]',
'["Mélanger les flocons d''avoine et le lait dans un bol adapté au micro-ondes.","Cuire 2 minutes à puissance moyenne, en surveillant.","Remuer à mi-cuisson.","Laisser reposer 1 minute.","Arroser de miel avant de servir."]',
'{"petit-dejeuner"}',
true, 'approved', 'Prêt en 5 minutes chrono', 260, 10, 5, 44, 1),

(uid, 'Muesli maison croquant (batch)', '', 10, 10, 20,
'[{"id":"1","name":"Flocons d''avoine","quantity":"400","unit":"g"},{"id":"2","name":"Amandes concassées","quantity":"60","unit":"g"},{"id":"3","name":"Miel","quantity":"60","unit":"g"},{"id":"4","name":"Huile neutre","quantity":"30","unit":"ml"},{"id":"5","name":"Cranberries séchées","quantity":"60","unit":"g"}]',
'["Préchauffer le four à 160°C.","Mélanger flocons d''avoine, amandes, miel et huile.","Étaler sur une plaque, cuire 18-20 minutes en remuant à mi-cuisson.","Laisser refroidir complètement (le mélange devient croquant en refroidissant).","Ajouter les cranberries et conserver dans un bocal hermétique."]',
'{"petit-dejeuner","riche-fibres"}',
true, 'approved', 'Se conserve 3 semaines dans un bocal hermétique', 220, 6, 9, 30, 10),

(uid, 'Pancakes aux flocons d''avoine et myrtilles', '', 2, 5, 10,
'[{"id":"1","name":"Flocons d''avoine mixés","quantity":"80","unit":"g"},{"id":"2","name":"Œufs","quantity":"2","unit":""},{"id":"3","name":"Myrtilles fraîches","quantity":"100","unit":"g"},{"id":"4","name":"Lait demi-écrémé","quantity":"60","unit":"ml"},{"id":"5","name":"Levure chimique","quantity":"0.5","unit":"c. à café"}]',
'["Mélanger l''avoine mixée, les œufs, le lait et la levure jusqu''à pâte homogène.","Incorporer délicatement la moitié des myrtilles.","Cuire des petites louches 2 minutes de chaque côté dans une poêle légèrement huilée.","Empiler les pancakes.","Garnir des myrtilles restantes avant de servir."]',
'{"petit-dejeuner","riche-fibres"}',
true, 'approved', '', 300, 14, 8, 42, 2),

-- ═══════════════════════════════════════════════════
-- 🥣 YAOURT, SKYR, FROMAGE BLANC & BOWLS FRUITÉS (12)
-- ═══════════════════════════════════════════════════

(uid, 'Bowl skyr, granola et fruits rouges', '', 1, 5, 0,
'[{"id":"1","name":"Skyr nature","quantity":"150","unit":"g"},{"id":"2","name":"Granola léger","quantity":"30","unit":"g"},{"id":"3","name":"Fruits rouges (frais ou surgelés)","quantity":"80","unit":"g"}]',
'["Verser le skyr dans un bol.","Disposer les fruits rouges par-dessus.","Parsemer de granola juste avant de servir pour garder son croquant.","Déguster aussitôt."]',
'{"petit-dejeuner","riche-proteines"}',
true, 'approved', '', 280, 20, 6, 36, 1),

(uid, 'Smoothie bowl banane-fraise', '', 1, 8, 0,
'[{"id":"1","name":"Banane congelée","quantity":"1","unit":""},{"id":"2","name":"Fraises","quantity":"100","unit":"g"},{"id":"3","name":"Yaourt nature","quantity":"100","unit":"g"},{"id":"4","name":"Granola léger","quantity":"20","unit":"g"}]',
'["Mixer la banane congelée, les fraises et le yaourt jusqu''à consistance épaisse et lisse.","Verser dans un bol.","Garnir de granola et de quelques fraises fraîches en tranches.","Déguster à la cuillère aussitôt."]',
'{"petit-dejeuner","riche-fibres"}',
true, 'approved', '', 320, 10, 5, 60, 1),

(uid, 'Chia pudding vanille et fruits', '', 1, 5, 0,
'[{"id":"1","name":"Graines de chia","quantity":"30","unit":"g"},{"id":"2","name":"Lait végétal","quantity":"200","unit":"ml"},{"id":"3","name":"Extrait de vanille","quantity":"0.5","unit":"c. à café"},{"id":"4","name":"Kiwi","quantity":"1","unit":""}]',
'["Mélanger les graines de chia, le lait végétal et la vanille dans un bocal.","Bien remuer pour éviter les grumeaux.","Réserver au réfrigérateur au moins 4 heures, idéalement toute la nuit.","Remuer à nouveau avant de servir.","Garnir de kiwi coupé en dés."]',
'{"petit-dejeuner","vegan","riche-fibres"}',
true, 'approved', 'À préparer la veille au soir', 260, 8, 12, 28, 1),

(uid, 'Bowl fromage blanc, miel et noix', '', 1, 3, 0,
'[{"id":"1","name":"Fromage blanc 0%","quantity":"150","unit":"g"},{"id":"2","name":"Miel","quantity":"1","unit":"c. à café"},{"id":"3","name":"Cerneaux de noix","quantity":"15","unit":"g"}]',
'["Verser le fromage blanc dans un bol.","Arroser de miel.","Concasser grossièrement les noix par-dessus.","Servir aussitôt."]',
'{"petit-dejeuner","riche-proteines"}',
true, 'approved', '', 220, 16, 10, 16, 1),

(uid, 'Smoothie bowl mangue-passion', '', 1, 8, 0,
'[{"id":"1","name":"Mangue congelée","quantity":"150","unit":"g"},{"id":"2","name":"Fruit de la passion","quantity":"1","unit":""},{"id":"3","name":"Yaourt nature","quantity":"80","unit":"g"},{"id":"4","name":"Noix de coco râpée","quantity":"10","unit":"g"}]',
'["Mixer la mangue congelée avec le yaourt jusqu''à consistance épaisse.","Verser dans un bol.","Ajouter la pulpe du fruit de la passion par-dessus.","Parsemer de noix de coco râpée.","Servir aussitôt."]',
'{"petit-dejeuner"}',
true, 'approved', '', 300, 8, 6, 56, 1),

(uid, 'Yaourt grec, compote pomme-cannelle maison', '', 1, 10, 8,
'[{"id":"1","name":"Yaourt grec 0%","quantity":"150","unit":"g"},{"id":"2","name":"Pomme","quantity":"1","unit":""},{"id":"3","name":"Cannelle","quantity":"1","unit":"pincée"},{"id":"4","name":"Eau","quantity":"2","unit":"c. à soupe"}]',
'["Couper la pomme en petits dés.","Cuire à feu doux avec l''eau et la cannelle 8 minutes jusqu''à consistance de compote.","Laisser tiédir.","Verser le yaourt grec dans un bol.","Napper de compote tiède ou froide."]',
'{"petit-dejeuner","ig-bas","riche-proteines"}',
true, 'approved', '', 180, 14, 3, 22, 1),

(uid, 'Bowl exotique ananas-coco-graines de chia', '', 1, 5, 0,
'[{"id":"1","name":"Ananas frais","quantity":"100","unit":"g"},{"id":"2","name":"Lait de coco allégé","quantity":"100","unit":"ml"},{"id":"3","name":"Graines de chia","quantity":"1","unit":"c. à soupe"}]',
'["Couper l''ananas en petits dés.","Mélanger le lait de coco avec les graines de chia.","Laisser reposer 5 minutes pour que les graines gonflent légèrement.","Verser dans un bol, garnir d''ananas.","Servir frais."]',
'{"petit-dejeuner","vegan"}',
true, 'approved', '', 220, 4, 8, 34, 1),

(uid, 'Chia pudding chocolat-banane', '', 1, 5, 0,
'[{"id":"1","name":"Graines de chia","quantity":"30","unit":"g"},{"id":"2","name":"Lait végétal","quantity":"200","unit":"ml"},{"id":"3","name":"Cacao en poudre non sucré","quantity":"1","unit":"c. à soupe"},{"id":"4","name":"Banane","quantity":"0.5","unit":""}]',
'["Mélanger les graines de chia, le lait végétal et le cacao dans un bocal.","Bien remuer.","Réserver au réfrigérateur au moins 4 heures.","Remuer avant de servir.","Garnir de rondelles de banane."]',
'{"petit-dejeuner","vegan","riche-fibres"}',
true, 'approved', 'À préparer la veille au soir', 280, 9, 13, 32, 1),

(uid, 'Skyr protéiné aux fruits de saison', '', 1, 3, 0,
'[{"id":"1","name":"Skyr nature","quantity":"200","unit":"g"},{"id":"2","name":"Fruit de saison au choix","quantity":"100","unit":"g"}]',
'["Verser le skyr dans un bol.","Couper le fruit de saison en morceaux.","Disposer par-dessus.","Servir aussitôt."]',
'{"petit-dejeuner","riche-proteines"}',
true, 'approved', '', 220, 24, 2, 26, 1),

(uid, 'Bowl fromage blanc-avoine-fruits (overnight)', '', 1, 5, 0,
'[{"id":"1","name":"Fromage blanc","quantity":"100","unit":"g"},{"id":"2","name":"Flocons d''avoine","quantity":"30","unit":"g"},{"id":"3","name":"Fruits rouges (frais ou surgelés)","quantity":"60","unit":"g"}]',
'["Mélanger le fromage blanc et les flocons d''avoine dans un bocal.","Ajouter les fruits rouges.","Fermer et réserver au réfrigérateur toute la nuit.","Mélanger avant de servir.","Déguster frais."]',
'{"petit-dejeuner","riche-fibres"}',
true, 'approved', 'À préparer la veille au soir', 280, 16, 6, 40, 1),

(uid, 'Verrine yaourt, muesli et fruits de saison', '', 1, 5, 0,
'[{"id":"1","name":"Yaourt nature","quantity":"120","unit":"g"},{"id":"2","name":"Muesli","quantity":"30","unit":"g"},{"id":"3","name":"Fruit de saison au choix","quantity":"80","unit":"g"}]',
'["Couper le fruit en petits morceaux.","Alterner dans une verrine : yaourt, muesli, fruits.","Répéter les couches.","Servir aussitôt pour garder le croquant du muesli."]',
'{"petit-dejeuner"}',
true, 'approved', '', 260, 10, 7, 40, 1),

(uid, 'Lassi mangue protéiné', '', 1, 5, 0,
'[{"id":"1","name":"Mangue","quantity":"100","unit":"g"},{"id":"2","name":"Yaourt nature","quantity":"150","unit":"g"},{"id":"3","name":"Lait demi-écrémé","quantity":"50","unit":"ml"}]',
'["Couper la mangue en morceaux.","Mixer avec le yaourt et le lait jusqu''à consistance lisse.","Ajouter des glaçons si désiré.","Servir frais dans un grand verre."]',
'{"petit-dejeuner"}',
true, 'approved', '', 220, 10, 3, 38, 1),

-- ═══════════════════════════════════════════════════
-- 🍞 TARTINES, TOASTS, GRANOLA & ALTERNATIVES (12)
-- ═══════════════════════════════════════════════════

(uid, 'Toast à l''avocat et graines de sésame', '', 1, 5, 3,
'[{"id":"1","name":"Pain complet","quantity":"1","unit":"tranche"},{"id":"2","name":"Avocat","quantity":"0.5","unit":""},{"id":"3","name":"Graines de sésame","quantity":"1","unit":"c. à café"},{"id":"4","name":"Jus de citron","quantity":"1","unit":"filet"},{"id":"5","name":"Sel, poivre","quantity":"","unit":""}]',
'["Griller la tranche de pain complet.","Écraser l''avocat avec le jus de citron, sel et poivre.","Tartiner sur le pain grillé.","Parsemer de graines de sésame.","Servir aussitôt."]',
'{"petit-dejeuner","riche-fibres"}',
true, 'approved', '', 260, 7, 16, 24, 1),

(uid, 'Tartine ricotta, miel et figues', '', 1, 5, 3,
'[{"id":"1","name":"Pain complet","quantity":"1","unit":"tranche"},{"id":"2","name":"Ricotta allégée","quantity":"50","unit":"g"},{"id":"3","name":"Miel","quantity":"1","unit":"c. à café"},{"id":"4","name":"Figue fraîche","quantity":"1","unit":""}]',
'["Griller la tranche de pain complet.","Tartiner de ricotta.","Couper la figue en quartiers, disposer sur la ricotta.","Arroser de miel.","Servir aussitôt."]',
'{"petit-dejeuner"}',
true, 'approved', '', 280, 10, 9, 40, 1),

(uid, 'Tartine fromage frais, saumon fumé et aneth', '', 1, 5, 3,
'[{"id":"1","name":"Pain complet","quantity":"1","unit":"tranche"},{"id":"2","name":"Fromage frais allégé","quantity":"30","unit":"g"},{"id":"3","name":"Saumon fumé","quantity":"40","unit":"g"},{"id":"4","name":"Aneth frais","quantity":"","unit":"quelques brins"},{"id":"5","name":"Poivre","quantity":"","unit":""}]',
'["Griller la tranche de pain complet.","Tartiner de fromage frais.","Déposer le saumon fumé par-dessus.","Parsemer d''aneth et de poivre.","Servir aussitôt."]',
'{"petit-dejeuner","riche-proteines"}',
true, 'approved', '', 260, 15, 10, 26, 1),

(uid, 'Toast houmous, tomates cerises et graines', '', 1, 5, 3,
'[{"id":"1","name":"Pain complet","quantity":"1","unit":"tranche"},{"id":"2","name":"Houmous","quantity":"40","unit":"g"},{"id":"3","name":"Tomates cerises","quantity":"50","unit":"g"},{"id":"4","name":"Graines de courge","quantity":"1","unit":"c. à café"}]',
'["Griller la tranche de pain complet.","Tartiner d''houmous.","Couper les tomates cerises en deux, disposer par-dessus.","Parsemer de graines de courge.","Servir aussitôt."]',
'{"petit-dejeuner","vegan","riche-fibres"}',
true, 'approved', '', 280, 10, 12, 32, 1),

(uid, 'Tartine beurre de cacahuète et banane', '', 1, 5, 3,
'[{"id":"1","name":"Pain complet","quantity":"1","unit":"tranche"},{"id":"2","name":"Beurre de cacahuète","quantity":"1","unit":"c. à soupe"},{"id":"3","name":"Banane","quantity":"0.5","unit":""}]',
'["Griller la tranche de pain complet.","Tartiner de beurre de cacahuète.","Couper la banane en rondelles, disposer par-dessus.","Servir aussitôt."]',
'{"petit-dejeuner"}',
true, 'approved', '', 320, 10, 13, 42, 1),

(uid, 'Pain perdu healthy à la banane', '', 2, 5, 8,
'[{"id":"1","name":"Pain complet rassis","quantity":"4","unit":"tranches"},{"id":"2","name":"Œuf","quantity":"1","unit":""},{"id":"3","name":"Lait demi-écrémé","quantity":"100","unit":"ml"},{"id":"4","name":"Banane","quantity":"1","unit":""}]',
'["Écraser la banane, mélanger avec l''œuf battu et le lait.","Tremper les tranches de pain dans ce mélange.","Cuire 2 minutes de chaque côté dans une poêle légèrement huilée jusqu''à coloration dorée.","Servir chaud, nature ou avec quelques fruits frais."]',
'{"petit-dejeuner"}',
true, 'approved', 'Sans sucre ajouté', 260, 10, 7, 38, 2),

(uid, 'Granola maison protéiné (batch)', '', 12, 10, 20,
'[{"id":"1","name":"Flocons d''avoine","quantity":"400","unit":"g"},{"id":"2","name":"Protéine en poudre neutre ou vanille","quantity":"60","unit":"g"},{"id":"3","name":"Amandes concassées","quantity":"60","unit":"g"},{"id":"4","name":"Miel","quantity":"60","unit":"g"},{"id":"5","name":"Huile neutre","quantity":"30","unit":"ml"}]',
'["Préchauffer le four à 160°C.","Mélanger tous les ingrédients secs, puis incorporer le miel et l''huile.","Étaler sur une plaque de cuisson.","Cuire 18-20 minutes en remuant à mi-cuisson.","Laisser refroidir complètement avant de conserver dans un bocal hermétique."]',
'{"petit-dejeuner","riche-proteines"}',
true, 'approved', 'Se conserve 3 semaines dans un bocal hermétique', 200, 8, 9, 22, 12),

(uid, 'Muesli bircher chocolat-noisette', '', 1, 8, 0,
'[{"id":"1","name":"Flocons d''avoine","quantity":"50","unit":"g"},{"id":"2","name":"Cacao en poudre non sucré","quantity":"1","unit":"c. à soupe"},{"id":"3","name":"Noisettes concassées","quantity":"15","unit":"g"},{"id":"4","name":"Yaourt nature","quantity":"80","unit":"g"},{"id":"5","name":"Lait demi-écrémé","quantity":"80","unit":"ml"}]',
'["Mélanger les flocons d''avoine, le cacao, le yaourt et le lait.","Bien remuer.","Réserver au réfrigérateur, idéalement toute la nuit.","Parsemer de noisettes concassées avant de servir.","Déguster frais."]',
'{"petit-dejeuner","riche-fibres"}',
true, 'approved', 'À préparer la veille au soir', 360, 12, 14, 46, 1),

(uid, 'Boules d''énergie petit-déjeuner dattes-avoine (batch)', '', 12, 15, 0,
'[{"id":"1","name":"Dattes Medjool dénoyautées","quantity":"200","unit":"g"},{"id":"2","name":"Flocons d''avoine","quantity":"100","unit":"g"},{"id":"3","name":"Beurre d''amande","quantity":"2","unit":"c. à soupe"},{"id":"4","name":"Cacao en poudre non sucré","quantity":"1","unit":"c. à soupe"}]',
'["Mixer les dattes jusqu''à obtenir une pâte.","Ajouter les flocons d''avoine, le beurre d''amande et le cacao.","Mixer à nouveau jusqu''à obtenir une pâte homogène.","Former des petites boules avec les mains.","Réserver au réfrigérateur au moins 30 minutes avant de déguster."]',
'{"petit-dejeuner","vegan"}',
true, 'approved', 'Se conservent 1 semaine au frigo', 90, 2, 4, 12, 12),

(uid, 'Smoothie vert énergisant épinards-banane-pomme', '', 1, 5, 0,
'[{"id":"1","name":"Épinards frais","quantity":"30","unit":"g"},{"id":"2","name":"Banane","quantity":"1","unit":""},{"id":"3","name":"Pomme","quantity":"1","unit":""},{"id":"4","name":"Lait végétal","quantity":"150","unit":"ml"}]',
'["Laver les épinards.","Couper la pomme en morceaux.","Mixer tous les ingrédients ensemble jusqu''à obtenir une texture lisse.","Verser dans un grand verre.","Servir frais."]',
'{"petit-dejeuner","vegan","riche-fibres"}',
true, 'approved', '', 220, 4, 3, 44, 1),

(uid, 'Barres de céréales maison petit-déjeuner (batch)', '', 12, 15, 20,
'[{"id":"1","name":"Flocons d''avoine","quantity":"250","unit":"g"},{"id":"2","name":"Miel","quantity":"100","unit":"g"},{"id":"3","name":"Fruits secs mélangés","quantity":"80","unit":"g"},{"id":"4","name":"Graines de tournesol","quantity":"40","unit":"g"},{"id":"5","name":"Huile neutre","quantity":"40","unit":"ml"}]',
'["Préchauffer le four à 160°C.","Chauffer légèrement le miel avec l''huile pour les liquéfier.","Mélanger avec les flocons d''avoine, fruits secs et graines.","Tasser fermement le mélange dans un plat rectangulaire tapissé de papier cuisson.","Cuire 20 minutes, laisser refroidir complètement avant de découper en barres."]',
'{"petit-dejeuner","riche-fibres"}',
true, 'approved', 'Se conservent 1 semaine dans une boîte hermétique', 140, 3, 5, 20, 12),

(uid, 'Cottage cheese toast, radis et graines de courge', '', 1, 5, 3,
'[{"id":"1","name":"Pain complet","quantity":"1","unit":"tranche"},{"id":"2","name":"Cottage cheese","quantity":"60","unit":"g"},{"id":"3","name":"Radis","quantity":"3","unit":""},{"id":"4","name":"Graines de courge","quantity":"1","unit":"c. à café"},{"id":"5","name":"Sel, poivre","quantity":"","unit":""}]',
'["Griller la tranche de pain complet.","Tartiner de cottage cheese.","Couper les radis en fines rondelles, disposer par-dessus.","Parsemer de graines de courge, saler et poivrer.","Servir aussitôt."]',
'{"petit-dejeuner","riche-proteines"}',
true, 'approved', '', 240, 14, 8, 28, 1);

END $$;
