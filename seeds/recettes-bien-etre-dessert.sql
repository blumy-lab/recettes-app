-- BIEN-ÊTRE — Desserts (50 recettes)
-- Nutrition estimée manuellement à la création (pas d'appel Gemini) : indicative.
-- tags : colonne text[] Postgres (littéral '{"a","b"}'), pas du JSON.

DO $$
DECLARE
  uid uuid := '97a98e5c-d29d-4a9f-9d84-0684eef75fe6'::uuid;
BEGIN

-- ═══════════════════════════════════════════════════
-- 🍐 FRUITS POCHÉS, COMPOTES & SALADES DE FRUITS (13)
-- ═══════════════════════════════════════════════════

INSERT INTO recipes (user_id, title, source_url, servings, prep_time, cook_time, ingredients, steps, tags, is_public, moderation_status, user_notes, nutrition_calories, nutrition_proteins, nutrition_fat, nutrition_carbs, nutrition_base) VALUES

(uid, 'Poires pochées à la cannelle et vanille', '', 4, 10, 20,
'[{"id":"1","name":"Poires","quantity":"4","unit":""},{"id":"2","name":"Eau","quantity":"500","unit":"ml"},{"id":"3","name":"Bâton de cannelle","quantity":"1","unit":""},{"id":"4","name":"Gousse de vanille","quantity":"1","unit":""},{"id":"5","name":"Miel","quantity":"1","unit":"c. à soupe"}]',
'["Éplucher les poires en gardant la queue.","Porter l''eau à ébullition avec la cannelle, la vanille fendue et le miel.","Plonger les poires et pocher 20 minutes à feu doux.","Laisser refroidir les poires dans le sirop.","Servir tièdes ou froides, arrosées d''un peu de sirop."]',
'{"dessert","vegan","ig-bas"}',
true, 'approved', '', 120, 1, 0, 28, 4),

(uid, 'Compote pomme-poire sans sucre ajouté', '', 6, 10, 20,
'[{"id":"1","name":"Pommes","quantity":"4","unit":""},{"id":"2","name":"Poires","quantity":"2","unit":""},{"id":"3","name":"Cannelle","quantity":"1","unit":"c. à café"},{"id":"4","name":"Eau","quantity":"50","unit":"ml"}]',
'["Éplucher et couper les fruits en morceaux.","Cuire à feu doux avec l''eau et la cannelle 20 minutes.","Écraser à la fourchette ou mixer selon la texture désirée.","Laisser refroidir.","Conserver au réfrigérateur 3-4 jours."]',
'{"dessert","vegan","ig-bas"}',
true, 'approved', 'La douceur naturelle des fruits suffit, aucun sucre ajouté', 70, 0, 0, 17, 6),

(uid, 'Salade de fruits frais de saison et menthe', '', 4, 15, 0,
'[{"id":"1","name":"Fruits de saison variés","quantity":"600","unit":"g"},{"id":"2","name":"Menthe fraîche","quantity":"","unit":"quelques feuilles"},{"id":"3","name":"Citron","quantity":"1","unit":""}]',
'["Couper tous les fruits en morceaux.","Mélanger dans un saladier.","Arroser de jus de citron pour éviter l''oxydation.","Ciseler la menthe et l''ajouter.","Réserver au frais 30 minutes avant de servir."]',
'{"dessert","vegan","riche-fibres"}',
true, 'approved', '', 90, 1, 0, 21, 4),

(uid, 'Pêches rôties au four, miel et amandes', '', 4, 10, 15,
'[{"id":"1","name":"Pêches","quantity":"4","unit":""},{"id":"2","name":"Miel","quantity":"2","unit":"c. à soupe"},{"id":"3","name":"Amandes effilées","quantity":"20","unit":"g"},{"id":"4","name":"Cannelle","quantity":"1","unit":"pincée"}]',
'["Préchauffer le four à 190°C.","Couper les pêches en deux, retirer le noyau.","Disposer dans un plat, arroser de miel et saupoudrer de cannelle.","Cuire 15 minutes au four.","Parsemer d''amandes effilées avant de servir tiède."]',
'{"dessert","vegetarien"}',
true, 'approved', '', 140, 3, 5, 22, 4),

(uid, 'Ananas rôti à la vanille et citron vert', '', 4, 10, 15,
'[{"id":"1","name":"Ananas","quantity":"1","unit":""},{"id":"2","name":"Gousse de vanille","quantity":"1","unit":""},{"id":"3","name":"Citron vert","quantity":"1","unit":""},{"id":"4","name":"Sucre roux","quantity":"1","unit":"c. à soupe"}]',
'["Préchauffer le four à 200°C.","Couper l''ananas en tranches épaisses.","Disposer dans un plat, gratter les graines de vanille dessus.","Arroser de jus de citron vert et saupoudrer de sucre roux.","Cuire 15 minutes jusqu''à légère caramélisation."]',
'{"dessert","vegan","ig-bas"}',
true, 'approved', '', 100, 1, 0, 24, 4),

(uid, 'Compote de fruits rouges au chia (sans cuisson)', '', 4, 10, 0,
'[{"id":"1","name":"Fruits rouges frais ou surgelés","quantity":"300","unit":"g"},{"id":"2","name":"Graines de chia","quantity":"2","unit":"c. à soupe"},{"id":"3","name":"Miel","quantity":"1","unit":"c. à soupe"}]',
'["Écraser légèrement les fruits rouges à la fourchette.","Mélanger avec les graines de chia et le miel.","Laisser reposer au réfrigérateur au moins 30 minutes pour que les graines gonflent.","Mélanger à nouveau avant de servir.","Se conserve 3 jours au frigo."]',
'{"dessert","vegan","riche-fibres"}',
true, 'approved', '', 110, 3, 3, 18, 4),

(uid, 'Salade d''agrumes à la fleur d''oranger', '', 4, 15, 0,
'[{"id":"1","name":"Oranges","quantity":"3","unit":""},{"id":"2","name":"Pamplemousse","quantity":"1","unit":""},{"id":"3","name":"Eau de fleur d''oranger","quantity":"1","unit":"c. à café"},{"id":"4","name":"Menthe fraîche","quantity":"","unit":"quelques feuilles"}]',
'["Peler les agrumes à vif.","Détailler en suprêmes au-dessus d''un saladier pour récupérer le jus.","Arroser d''eau de fleur d''oranger.","Ciseler la menthe et l''ajouter.","Réserver au frais avant de servir."]',
'{"dessert","vegan","ig-bas"}',
true, 'approved', '', 90, 2, 0, 20, 4),

(uid, 'Figues rôties au miel et thym', '', 4, 10, 12,
'[{"id":"1","name":"Figues fraîches","quantity":"8","unit":""},{"id":"2","name":"Miel","quantity":"2","unit":"c. à soupe"},{"id":"3","name":"Thym frais","quantity":"","unit":"quelques branches"},{"id":"4","name":"Yaourt grec","quantity":"200","unit":"g"}]',
'["Préchauffer le four à 190°C.","Inciser les figues en croix sans les couper entièrement.","Disposer dans un plat, arroser de miel et parsemer de thym.","Cuire 12 minutes au four.","Servir tièdes avec une cuillère de yaourt grec."]',
'{"dessert","vegetarien"}',
true, 'approved', '', 140, 4, 2, 26, 4),

(uid, 'Pommes au four sans sucre, cannelle et noix', '', 4, 10, 25,
'[{"id":"1","name":"Pommes","quantity":"4","unit":""},{"id":"2","name":"Cannelle","quantity":"1","unit":"c. à café"},{"id":"3","name":"Cerneaux de noix","quantity":"30","unit":"g"},{"id":"4","name":"Raisins secs","quantity":"20","unit":"g"}]',
'["Préchauffer le four à 190°C.","Évider les pommes sans les percer entièrement.","Mélanger noix concassées, raisins secs et cannelle.","Farcir les pommes de ce mélange.","Cuire 25 minutes au four jusqu''à ce qu''elles soient tendres."]',
'{"dessert","vegan","riche-fibres"}',
true, 'approved', 'Aucun sucre ajouté, la pomme cuite développe naturellement sa douceur', 160, 3, 7, 24, 4),

(uid, 'Brochettes de fruits au chocolat noir fondu', '', 4, 15, 3,
'[{"id":"1","name":"Fruits variés (fraise, banane, ananas)","quantity":"400","unit":"g"},{"id":"2","name":"Chocolat noir 70%","quantity":"60","unit":"g"}]',
'["Couper les fruits en gros morceaux.","Enfiler sur des piques en bois en alternant.","Faire fondre le chocolat au bain-marie.","Arroser les brochettes de chocolat fondu ou servir en trempette.","Déguster aussitôt."]',
'{"dessert","vegetarien"}',
true, 'approved', '', 140, 2, 7, 18, 4),

(uid, 'Carpaccio de fraises au basilic et poivre', '', 4, 10, 0,
'[{"id":"1","name":"Fraises","quantity":"400","unit":"g"},{"id":"2","name":"Basilic frais","quantity":"","unit":"quelques feuilles"},{"id":"3","name":"Poivre noir","quantity":"1","unit":"pincée"},{"id":"4","name":"Sucre","quantity":"1","unit":"c. à café"}]',
'["Trancher les fraises très finement.","Disposer en rosace dans les assiettes.","Saupoudrer légèrement de sucre.","Ciseler le basilic par-dessus.","Ajouter une pincée de poivre noir fraîchement moulu avant de servir."]',
'{"dessert","vegan","ig-bas"}',
true, 'approved', 'Le poivre surprend et relève joliment le sucré de la fraise', 60, 1, 0, 14, 4),

(uid, 'Compote de mangue-passion', '', 4, 10, 10,
'[{"id":"1","name":"Mangues","quantity":"2","unit":""},{"id":"2","name":"Fruits de la passion","quantity":"2","unit":""}]',
'["Couper la mangue en morceaux.","Cuire à feu doux 10 minutes jusqu''à ce qu''elle soit fondante.","Écraser grossièrement à la fourchette.","Ajouter la pulpe des fruits de la passion.","Laisser refroidir avant de servir."]',
'{"dessert","vegan","ig-bas"}',
true, 'approved', '', 90, 1, 0, 22, 4),

(uid, 'Abricots rôtis, amandes et miel', '', 4, 10, 12,
'[{"id":"1","name":"Abricots","quantity":"8","unit":""},{"id":"2","name":"Miel","quantity":"2","unit":"c. à soupe"},{"id":"3","name":"Amandes effilées","quantity":"20","unit":"g"}]',
'["Préchauffer le four à 190°C.","Couper les abricots en deux, retirer le noyau.","Disposer dans un plat, arroser de miel.","Cuire 12 minutes au four.","Parsemer d''amandes effilées avant de servir tiède."]',
'{"dessert","vegetarien"}',
true, 'approved', '', 120, 2, 4, 20, 4),

-- ═══════════════════════════════════════════════════
-- 🍮 MOUSSES, CRÈMES & PUDDINGS LÉGERS (13)
-- ═══════════════════════════════════════════════════

(uid, 'Mousse au chocolat noir légère avocat-cacao', '', 4, 10, 0,
'[{"id":"1","name":"Avocats bien mûrs","quantity":"2","unit":""},{"id":"2","name":"Cacao en poudre non sucré","quantity":"3","unit":"c. à soupe"},{"id":"3","name":"Miel","quantity":"2","unit":"c. à soupe"},{"id":"4","name":"Lait végétal","quantity":"3","unit":"c. à soupe"}]',
'["Mixer la chair des avocats avec le cacao, le miel et le lait végétal.","Mixer jusqu''à obtenir une texture lisse et mousseuse.","Goûter et ajuster le miel si nécessaire.","Répartir dans des ramequins.","Réserver au réfrigérateur au moins 1 heure avant de servir."]',
'{"dessert","vegan"}',
true, 'approved', 'L''avocat donne l''onctuosité sans matière grasse ajoutée', 180, 3, 12, 18, 4),

(uid, 'Chia pudding vanille et fruits rouges', '', 4, 10, 0,
'[{"id":"1","name":"Graines de chia","quantity":"60","unit":"g"},{"id":"2","name":"Lait végétal","quantity":"400","unit":"ml"},{"id":"3","name":"Extrait de vanille","quantity":"1","unit":"c. à café"},{"id":"4","name":"Fruits rouges","quantity":"150","unit":"g"}]',
'["Mélanger les graines de chia, le lait végétal et la vanille.","Bien remuer pour éviter les grumeaux.","Réserver au réfrigérateur au moins 4 heures, idéalement toute la nuit.","Remuer à nouveau avant de servir.","Garnir de fruits rouges."]',
'{"dessert","vegan","riche-fibres"}',
true, 'approved', 'À préparer la veille au soir', 200, 6, 10, 22, 4),

(uid, 'Panna cotta légère au lait de coco et mangue', '', 4, 10, 5,
'[{"id":"1","name":"Lait de coco allégé","quantity":"400","unit":"ml"},{"id":"2","name":"Gélatine en feuilles","quantity":"4","unit":"g"},{"id":"3","name":"Miel","quantity":"2","unit":"c. à soupe"},{"id":"4","name":"Mangue","quantity":"1","unit":""}]',
'["Faire ramollir la gélatine dans l''eau froide.","Chauffer le lait de coco avec le miel sans faire bouillir.","Incorporer la gélatine essorée, bien mélanger.","Répartir dans des verrines, réserver au réfrigérateur au moins 3 heures.","Garnir de mangue coupée en dés avant de servir."]',
'{"dessert","vegan"}',
true, 'approved', '', 180, 3, 10, 22, 4),

(uid, 'Crème dessert au yaourt grec et citron', '', 4, 10, 5,
'[{"id":"1","name":"Yaourt grec 0%","quantity":"400","unit":"g"},{"id":"2","name":"Citron","quantity":"1","unit":""},{"id":"3","name":"Miel","quantity":"2","unit":"c. à soupe"},{"id":"4","name":"Maïzena","quantity":"1","unit":"c. à café"}]',
'["Mélanger le yaourt grec avec le zeste et le jus de citron.","Ajouter le miel et la maïzena, bien lisser.","Chauffer doucement 5 minutes en remuant pour épaissir légèrement.","Répartir dans des ramequins.","Réserver au réfrigérateur avant de servir."]',
'{"dessert","riche-proteines","ig-bas"}',
true, 'approved', '', 120, 10, 2, 16, 4),

(uid, 'Mousse légère à la framboise', '', 4, 15, 0,
'[{"id":"1","name":"Framboises","quantity":"250","unit":"g"},{"id":"2","name":"Blancs d''œufs","quantity":"3","unit":""},{"id":"3","name":"Sucre","quantity":"30","unit":"g"}]',
'["Mixer et passer les framboises au tamis pour retirer les pépins.","Monter les blancs en neige ferme en incorporant le sucre petit à petit.","Incorporer délicatement la purée de framboises aux blancs montés.","Répartir dans des verrines.","Réserver au réfrigérateur au moins 1 heure."]',
'{"dessert","ig-bas"}',
true, 'approved', '', 90, 4, 0, 17, 4),

(uid, 'Riz au lait léger à la vanille', '', 4, 10, 25,
'[{"id":"1","name":"Riz rond","quantity":"100","unit":"g"},{"id":"2","name":"Lait demi-écrémé","quantity":"600","unit":"ml"},{"id":"3","name":"Gousse de vanille","quantity":"1","unit":""},{"id":"4","name":"Sucre","quantity":"40","unit":"g"}]',
'["Porter le lait à ébullition avec la vanille fendue.","Ajouter le riz, cuire à feu doux 25 minutes en remuant régulièrement.","Ajouter le sucre en fin de cuisson.","Retirer la gousse de vanille.","Servir tiède ou froid."]',
'{"dessert","vegetarien"}',
true, 'approved', '', 200, 7, 3, 36, 4),

(uid, 'Chia pudding chocolat-noisette', '', 4, 10, 0,
'[{"id":"1","name":"Graines de chia","quantity":"60","unit":"g"},{"id":"2","name":"Lait végétal","quantity":"400","unit":"ml"},{"id":"3","name":"Cacao en poudre non sucré","quantity":"2","unit":"c. à soupe"},{"id":"4","name":"Noisettes concassées","quantity":"30","unit":"g"}]',
'["Mélanger les graines de chia, le lait végétal et le cacao.","Bien remuer.","Réserver au réfrigérateur au moins 4 heures.","Remuer avant de servir.","Parsemer de noisettes concassées."]',
'{"dessert","vegan","riche-fibres"}',
true, 'approved', 'À préparer la veille au soir', 220, 7, 12, 22, 4),

(uid, 'Crème caramel légère sans crème', '', 4, 10, 30,
'[{"id":"1","name":"Lait demi-écrémé","quantity":"500","unit":"ml"},{"id":"2","name":"Œufs","quantity":"4","unit":""},{"id":"3","name":"Sucre pour le caramel","quantity":"80","unit":"g"},{"id":"4","name":"Gousse de vanille","quantity":"1","unit":""}]',
'["Préparer un caramel avec le sucre et un peu d''eau, verser dans les ramequins.","Chauffer le lait avec la vanille fendue.","Battre les œufs, incorporer le lait chaud petit à petit.","Verser dans les ramequins sur le caramel.","Cuire au bain-marie 30 minutes à 160°C, laisser refroidir avant de démouler."]',
'{"dessert","vegetarien"}',
true, 'approved', '', 160, 7, 4, 24, 4),

(uid, 'Verrine yaourt-spéculoos allégée', '', 4, 10, 0,
'[{"id":"1","name":"Yaourt grec 0%","quantity":"300","unit":"g"},{"id":"2","name":"Spéculoos","quantity":"8","unit":""},{"id":"3","name":"Compote de pomme sans sucre ajouté","quantity":"150","unit":"g"}]',
'["Émietter grossièrement les spéculoos.","Alterner en couches dans des verrines : compote, yaourt, spéculoos.","Répéter les couches.","Réserver au frais.","Servir dans les 2 heures pour garder le croquant des biscuits."]',
'{"dessert","riche-proteines"}',
true, 'approved', '', 180, 10, 5, 26, 4),

(uid, 'Mousse au yaourt et fruits de la passion', '', 4, 15, 0,
'[{"id":"1","name":"Yaourt grec 0%","quantity":"200","unit":"g"},{"id":"2","name":"Fruits de la passion","quantity":"3","unit":""},{"id":"3","name":"Miel","quantity":"1","unit":"c. à soupe"},{"id":"4","name":"Blanc d''œuf","quantity":"1","unit":""}]',
'["Mélanger le yaourt avec le miel et la pulpe de deux fruits de la passion.","Monter le blanc d''œuf en neige ferme.","Incorporer délicatement le blanc monté au mélange yaourt.","Répartir dans des verrines.","Garnir de la pulpe du fruit de la passion restant."]',
'{"dessert","riche-proteines","ig-bas"}',
true, 'approved', '', 130, 8, 2, 20, 4),

(uid, 'Flan léger à la vanille sans crème', '', 4, 10, 30,
'[{"id":"1","name":"Lait demi-écrémé","quantity":"500","unit":"ml"},{"id":"2","name":"Œufs","quantity":"3","unit":""},{"id":"3","name":"Gousse de vanille","quantity":"1","unit":""},{"id":"4","name":"Sucre","quantity":"50","unit":"g"}]',
'["Préchauffer le four à 160°C.","Chauffer le lait avec la vanille fendue.","Battre les œufs avec le sucre, incorporer le lait chaud petit à petit.","Verser dans un plat, cuire au bain-marie 30 minutes.","Laisser refroidir avant de servir."]',
'{"dessert","vegetarien"}',
true, 'approved', '', 140, 7, 4, 20, 4),

(uid, 'Tiramisu léger au fromage blanc et café', '', 4, 20, 0,
'[{"id":"1","name":"Fromage blanc 0%","quantity":"300","unit":"g"},{"id":"2","name":"Café fort refroidi","quantity":"150","unit":"ml"},{"id":"3","name":"Biscuits à la cuillère","quantity":"8","unit":""},{"id":"4","name":"Cacao en poudre non sucré","quantity":"1","unit":"c. à soupe"},{"id":"5","name":"Sucre","quantity":"30","unit":"g"}]',
'["Mélanger le fromage blanc avec le sucre.","Tremper rapidement les biscuits dans le café.","Alterner en couches dans un plat : biscuits imbibés, crème au fromage blanc.","Répéter les couches, terminer par la crème.","Saupoudrer de cacao et réserver au frais au moins 2 heures."]',
'{"dessert","vegetarien"}',
true, 'approved', 'Version allégée au fromage blanc plutôt qu''au mascarpone', 220, 9, 6, 32, 4),

(uid, 'Crème brûlée légère au lait', '', 4, 10, 30,
'[{"id":"1","name":"Lait demi-écrémé","quantity":"400","unit":"ml"},{"id":"2","name":"Jaunes d''œufs","quantity":"4","unit":""},{"id":"3","name":"Gousse de vanille","quantity":"1","unit":""},{"id":"4","name":"Sucre","quantity":"30","unit":"g"},{"id":"5","name":"Cassonade pour caraméliser","quantity":"4","unit":"c. à café"}]',
'["Préchauffer le four à 150°C.","Chauffer le lait avec la vanille fendue.","Battre les jaunes avec le sucre, incorporer le lait chaud.","Verser dans des ramequins, cuire au bain-marie 30 minutes.","Laisser refroidir, saupoudrer de cassonade et caraméliser au chalumeau ou sous le gril juste avant de servir."]',
'{"dessert","vegetarien"}',
true, 'approved', '', 180, 6, 8, 22, 4),

-- ═══════════════════════════════════════════════════
-- 🧁 GÂTEAUX & MUFFINS ALLÉGÉS (12)
-- ═══════════════════════════════════════════════════

(uid, 'Gâteau au yaourt allégé et citron', '', 8, 10, 30,
'[{"id":"1","name":"Farine","quantity":"200","unit":"g"},{"id":"2","name":"Yaourt nature","quantity":"1","unit":"pot"},{"id":"3","name":"Sucre","quantity":"100","unit":"g"},{"id":"4","name":"Œufs","quantity":"2","unit":""},{"id":"5","name":"Huile neutre","quantity":"60","unit":"ml"},{"id":"6","name":"Citron","quantity":"1","unit":""},{"id":"7","name":"Levure chimique","quantity":"1","unit":"sachet"}]',
'["Préchauffer le four à 180°C.","Mélanger le yaourt, le sucre, les œufs et l''huile.","Ajouter le zeste de citron, la farine et la levure.","Verser dans un moule huilé.","Cuire 30 minutes, vérifier la cuisson avec la pointe d''un couteau."]',
'{"dessert","vegetarien"}',
true, 'approved', 'Recette classique avec un tiers de sucre en moins', 180, 4, 7, 26, 8),

(uid, 'Muffins banane-avoine sans sucre ajouté', '', 12, 10, 20,
'[{"id":"1","name":"Bananes bien mûres","quantity":"3","unit":""},{"id":"2","name":"Flocons d''avoine","quantity":"200","unit":"g"},{"id":"3","name":"Œufs","quantity":"2","unit":""},{"id":"4","name":"Levure chimique","quantity":"1","unit":"c. à café"},{"id":"5","name":"Cannelle","quantity":"1","unit":"c. à café"}]',
'["Préchauffer le four à 180°C.","Écraser les bananes à la fourchette.","Mélanger avec les œufs, l''avoine, la levure et la cannelle.","Répartir dans des moules à muffins.","Cuire 20 minutes."]',
'{"dessert","riche-fibres"}',
true, 'approved', 'La banane bien mûre remplace le sucre', 110, 3, 3, 18, 12),

(uid, 'Brownie léger aux haricots noirs (sans farine)', '', 12, 10, 25,
'[{"id":"1","name":"Haricots noirs cuits égouttés","quantity":"400","unit":"g"},{"id":"2","name":"Cacao en poudre non sucré","quantity":"50","unit":"g"},{"id":"3","name":"Œufs","quantity":"3","unit":""},{"id":"4","name":"Miel","quantity":"80","unit":"g"},{"id":"5","name":"Huile neutre","quantity":"30","unit":"ml"},{"id":"6","name":"Levure chimique","quantity":"1","unit":"c. à café"}]',
'["Préchauffer le four à 180°C.","Mixer les haricots noirs avec les œufs, le miel et l''huile jusqu''à texture lisse.","Ajouter le cacao et la levure, mixer à nouveau.","Verser dans un moule carré tapissé de papier cuisson.","Cuire 25 minutes, laisser refroidir avant de découper en carrés."]',
'{"dessert","sans-gluten"}',
true, 'approved', 'On ne devine pas les haricots noirs, ils apportent moelleux et protéines', 130, 4, 5, 17, 12),

(uid, 'Cake aux pommes et compote sans sucre ajouté', '', 8, 10, 35,
'[{"id":"1","name":"Farine","quantity":"200","unit":"g"},{"id":"2","name":"Compote de pomme sans sucre ajouté","quantity":"200","unit":"g"},{"id":"3","name":"Œufs","quantity":"2","unit":""},{"id":"4","name":"Pomme","quantity":"1","unit":""},{"id":"5","name":"Levure chimique","quantity":"1","unit":"sachet"},{"id":"6","name":"Cannelle","quantity":"1","unit":"c. à café"}]',
'["Préchauffer le four à 180°C.","Mélanger la compote, les œufs, la farine, la levure et la cannelle.","Couper la pomme en dés, l''incorporer à la pâte.","Verser dans un moule à cake huilé.","Cuire 35 minutes."]',
'{"dessert","vegetarien"}',
true, 'approved', 'La compote remplace le sucre et la matière grasse', 160, 4, 4, 28, 8),

(uid, 'Muffins choco-courgette allégés', '', 12, 15, 20,
'[{"id":"1","name":"Courgette râpée","quantity":"200","unit":"g"},{"id":"2","name":"Farine","quantity":"180","unit":"g"},{"id":"3","name":"Cacao en poudre non sucré","quantity":"30","unit":"g"},{"id":"4","name":"Œuf","quantity":"1","unit":""},{"id":"5","name":"Miel","quantity":"60","unit":"g"},{"id":"6","name":"Levure chimique","quantity":"1","unit":"c. à café"}]',
'["Préchauffer le four à 180°C.","Presser la courgette râpée pour retirer l''excès d''eau.","Mélanger tous les ingrédients jusqu''à pâte homogène.","Répartir dans des moules à muffins.","Cuire 20 minutes."]',
'{"dessert"}',
true, 'approved', 'On ne sent pas la courgette, elle apporte juste du moelleux', 130, 3, 5, 19, 12),

(uid, 'Gâteau renversé à l''ananas allégé', '', 8, 15, 30,
'[{"id":"1","name":"Ananas frais ou en tranches","quantity":"6","unit":"tranches"},{"id":"2","name":"Farine","quantity":"180","unit":"g"},{"id":"3","name":"Œufs","quantity":"3","unit":""},{"id":"4","name":"Sucre","quantity":"80","unit":"g"},{"id":"5","name":"Huile neutre","quantity":"50","unit":"ml"},{"id":"6","name":"Levure chimique","quantity":"1","unit":"sachet"}]',
'["Préchauffer le four à 180°C.","Disposer les tranches d''ananas au fond d''un moule huilé.","Battre les œufs avec le sucre, ajouter l''huile puis la farine et la levure.","Verser la pâte sur l''ananas.","Cuire 30 minutes, démouler tiède en retournant le moule."]',
'{"dessert"}',
true, 'approved', '', 200, 4, 6, 32, 8),

(uid, 'Cookies à l''avoine et pépites de chocolat noir', '', 16, 15, 12,
'[{"id":"1","name":"Flocons d''avoine","quantity":"150","unit":"g"},{"id":"2","name":"Bananes bien mûres","quantity":"2","unit":""},{"id":"3","name":"Pépites de chocolat noir 70%","quantity":"60","unit":"g"},{"id":"4","name":"Huile neutre","quantity":"20","unit":"ml"}]',
'["Préchauffer le four à 180°C.","Écraser les bananes à la fourchette.","Mélanger avec l''avoine, l''huile et les pépites de chocolat.","Former des petits tas sur une plaque tapissée de papier cuisson.","Cuire 12 minutes jusqu''à légère coloration."]',
'{"dessert","riche-fibres"}',
true, 'approved', 'Sans sucre ajouté, la banane sucre naturellement', 90, 2, 4, 12, 16),

(uid, 'Muffins myrtilles-citron allégés', '', 12, 10, 20,
'[{"id":"1","name":"Farine","quantity":"200","unit":"g"},{"id":"2","name":"Myrtilles fraîches","quantity":"150","unit":"g"},{"id":"3","name":"Citron","quantity":"1","unit":""},{"id":"4","name":"Yaourt nature","quantity":"100","unit":"g"},{"id":"5","name":"Œufs","quantity":"2","unit":""},{"id":"6","name":"Sucre","quantity":"60","unit":"g"},{"id":"7","name":"Levure chimique","quantity":"1","unit":"c. à café"}]',
'["Préchauffer le four à 180°C.","Mélanger le yaourt, les œufs, le sucre et le zeste de citron.","Ajouter la farine et la levure, bien mélanger.","Incorporer délicatement les myrtilles.","Répartir dans des moules à muffins, cuire 20 minutes."]',
'{"dessert"}',
true, 'approved', '', 140, 4, 4, 22, 12),

(uid, 'Financiers légers aux amandes', '', 12, 10, 15,
'[{"id":"1","name":"Poudre d''amandes","quantity":"100","unit":"g"},{"id":"2","name":"Blancs d''œufs","quantity":"4","unit":""},{"id":"3","name":"Sucre glace","quantity":"80","unit":"g"},{"id":"4","name":"Farine","quantity":"30","unit":"g"},{"id":"5","name":"Beurre fondu","quantity":"40","unit":"g"}]',
'["Préchauffer le four à 180°C.","Mélanger la poudre d''amandes, le sucre glace et la farine.","Incorporer les blancs d''œufs non battus puis le beurre fondu.","Répartir dans des petits moules à financiers.","Cuire 12-15 minutes jusqu''à coloration dorée."]',
'{"dessert","sans-gluten"}',
true, 'approved', 'Moitié moins de beurre qu''une recette classique', 90, 3, 5, 9, 12),

(uid, 'Gâteau au chocolat sans beurre à l''huile d''olive', '', 8, 10, 30,
'[{"id":"1","name":"Chocolat noir 70%","quantity":"150","unit":"g"},{"id":"2","name":"Huile d''olive douce","quantity":"60","unit":"ml"},{"id":"3","name":"Œufs","quantity":"3","unit":""},{"id":"4","name":"Sucre","quantity":"80","unit":"g"},{"id":"5","name":"Farine","quantity":"60","unit":"g"}]',
'["Préchauffer le four à 180°C.","Faire fondre le chocolat au bain-marie, incorporer l''huile d''olive.","Battre les œufs avec le sucre jusqu''à blanchiment.","Incorporer le chocolat fondu puis la farine.","Verser dans un moule, cuire 25-30 minutes."]',
'{"dessert","vegetarien"}',
true, 'approved', 'L''huile d''olive remplace le beurre, apporte des graisses insaturées', 220, 5, 12, 24, 8),

(uid, 'Carrot cake léger, glaçage allégé', '', 10, 20, 35,
'[{"id":"1","name":"Carottes râpées","quantity":"250","unit":"g"},{"id":"2","name":"Farine complète","quantity":"200","unit":"g"},{"id":"3","name":"Œufs","quantity":"3","unit":""},{"id":"4","name":"Huile neutre","quantity":"60","unit":"ml"},{"id":"5","name":"Cannelle, muscade","quantity":"1","unit":"c. à café chacune"},{"id":"6","name":"Fromage frais léger","quantity":"150","unit":"g"},{"id":"7","name":"Miel","quantity":"2","unit":"c. à soupe"}]',
'["Préchauffer le four à 180°C.","Mélanger carottes râpées, œufs, huile et épices.","Ajouter la farine complète et la levure, bien mélanger.","Verser dans un moule, cuire 35 minutes.","Une fois refroidi, napper d''un glaçage fromage frais-miel."]',
'{"dessert","riche-fibres"}',
true, 'approved', 'Glaçage allégé au fromage frais plutôt qu''au cream cheese classique', 200, 5, 8, 28, 10),

(uid, 'Madeleines allégées au miel', '', 20, 15, 10,
'[{"id":"1","name":"Farine","quantity":"150","unit":"g"},{"id":"2","name":"Miel","quantity":"80","unit":"g"},{"id":"3","name":"Œufs","quantity":"2","unit":""},{"id":"4","name":"Beurre fondu","quantity":"40","unit":"g"},{"id":"5","name":"Levure chimique","quantity":"1","unit":"c. à café"}]',
'["Battre les œufs avec le miel jusqu''à blanchiment.","Ajouter la farine et la levure, mélanger.","Incorporer le beurre fondu tiède.","Réserver la pâte 30 minutes au frais.","Cuire dans des moules à madeleines beurrés 10 minutes à 200°C."]',
'{"dessert"}',
true, 'approved', 'Miel à la place du sucre, deux fois moins de beurre', 70, 2, 2, 11, 20),

-- ═══════════════════════════════════════════════════
-- 🍨 BOUCHÉES, BOULES ÉNERGÉTIQUES & GLACES MAISON (12)
-- ═══════════════════════════════════════════════════

(uid, 'Boules énergétiques dattes-cacao-coco', '', 16, 15, 0,
'[{"id":"1","name":"Dattes Medjool dénoyautées","quantity":"200","unit":"g"},{"id":"2","name":"Cacao en poudre non sucré","quantity":"2","unit":"c. à soupe"},{"id":"3","name":"Noix de coco râpée","quantity":"40","unit":"g"},{"id":"4","name":"Amandes","quantity":"60","unit":"g"}]',
'["Mixer les dattes et les amandes jusqu''à obtenir une pâte.","Ajouter le cacao, mixer à nouveau.","Former des petites boules avec les mains.","Rouler dans la noix de coco râpée.","Réserver au réfrigérateur au moins 30 minutes."]',
'{"dessert","vegan"}',
true, 'approved', 'Se conservent 1 semaine au frigo', 80, 2, 4, 10, 16),

(uid, 'Nice cream banane (glace sans sucre)', '', 4, 10, 0,
'[{"id":"1","name":"Bananes congelées","quantity":"4","unit":""},{"id":"2","name":"Lait végétal","quantity":"3","unit":"c. à soupe"}]',
'["Couper les bananes en rondelles avant de les congeler à l''avance.","Mixer les bananes congelées avec le lait végétal jusqu''à obtenir une texture glacée crémeuse.","Racler les bords et mixer à nouveau si nécessaire.","Servir immédiatement pour une texture façon glace italienne.","Ou réserver au congélateur pour une texture plus ferme."]',
'{"dessert","vegan","ig-bas"}',
true, 'approved', 'Glace 100% fruit, sans sucre ni crème ajoutés', 110, 1, 0, 27, 4),

(uid, 'Sorbet mangue-citron vert maison', '', 6, 10, 0,
'[{"id":"1","name":"Mangue congelée","quantity":"500","unit":"g"},{"id":"2","name":"Citron vert","quantity":"1","unit":""},{"id":"3","name":"Miel","quantity":"1","unit":"c. à soupe"}]',
'["Mixer la mangue congelée avec le jus de citron vert et le miel.","Mixer jusqu''à obtenir une texture de sorbet lisse.","Servir immédiatement pour une texture crémeuse.","Ou réserver au congélateur 1 heure pour un sorbet plus ferme."]',
'{"dessert","vegan","ig-bas"}',
true, 'approved', '', 90, 1, 0, 22, 6),

(uid, 'Truffes chocolat noir-avocat', '', 16, 15, 0,
'[{"id":"1","name":"Avocat bien mûr","quantity":"1","unit":""},{"id":"2","name":"Cacao en poudre non sucré","quantity":"3","unit":"c. à soupe"},{"id":"3","name":"Dattes dénoyautées","quantity":"100","unit":"g"},{"id":"4","name":"Extrait de vanille","quantity":"0.5","unit":"c. à café"}]',
'["Mixer l''avocat, les dattes et la vanille jusqu''à obtenir une pâte lisse.","Ajouter le cacao, mixer à nouveau.","Former des petites boules avec les mains.","Rouler éventuellement dans un peu de cacao.","Réserver au réfrigérateur au moins 1 heure avant de servir."]',
'{"dessert","vegan"}',
true, 'approved', 'Se conservent 4-5 jours au frigo', 60, 1, 3, 7, 16),

(uid, 'Barres énergétiques amande-datte (no-bake)', '', 12, 15, 0,
'[{"id":"1","name":"Dattes dénoyautées","quantity":"200","unit":"g"},{"id":"2","name":"Amandes","quantity":"100","unit":"g"},{"id":"3","name":"Flocons d''avoine","quantity":"60","unit":"g"},{"id":"4","name":"Cacao en poudre non sucré","quantity":"1","unit":"c. à soupe"}]',
'["Mixer les dattes et les amandes jusqu''à obtenir une pâte collante.","Ajouter l''avoine et le cacao, mixer à nouveau.","Tasser fermement dans un plat rectangulaire tapissé de papier cuisson.","Réserver au réfrigérateur au moins 1 heure.","Découper en barres avant de servir."]',
'{"dessert","riche-fibres"}',
true, 'approved', 'Se conservent 1 semaine au frigo', 130, 3, 6, 17, 12),

(uid, 'Popsicles fruits rouges et yaourt', '', 6, 10, 0,
'[{"id":"1","name":"Fruits rouges frais ou surgelés","quantity":"200","unit":"g"},{"id":"2","name":"Yaourt grec","quantity":"250","unit":"g"},{"id":"3","name":"Miel","quantity":"1","unit":"c. à soupe"}]',
'["Mixer les fruits rouges avec le yaourt et le miel.","Verser dans des moules à glace à l''eau.","Insérer les bâtonnets.","Congeler au moins 4 heures.","Démouler en passant rapidement les moules sous l''eau tiède."]',
'{"dessert","riche-proteines"}',
true, 'approved', '', 70, 4, 1, 11, 6),

(uid, 'Bouchées coco-citron vert (no-bake)', '', 16, 15, 0,
'[{"id":"1","name":"Noix de coco râpée","quantity":"150","unit":"g"},{"id":"2","name":"Dattes dénoyautées","quantity":"100","unit":"g"},{"id":"3","name":"Citron vert","quantity":"1","unit":""},{"id":"4","name":"Miel","quantity":"1","unit":"c. à soupe"}]',
'["Mixer les dattes avec le zeste et le jus de citron vert.","Ajouter la noix de coco râpée et le miel, mixer à nouveau.","Former des petites boules avec les mains.","Rouler éventuellement dans un peu de noix de coco.","Réserver au réfrigérateur au moins 30 minutes."]',
'{"dessert","vegan"}',
true, 'approved', 'Se conservent 1 semaine au frigo', 70, 1, 4, 9, 16),

(uid, 'Granita à la pastèque et menthe', '', 6, 10, 0,
'[{"id":"1","name":"Pastèque","quantity":"600","unit":"g"},{"id":"2","name":"Menthe fraîche","quantity":"","unit":"quelques feuilles"},{"id":"3","name":"Citron","quantity":"1","unit":""}]',
'["Mixer la pastèque épépinée avec la menthe et le jus de citron.","Verser dans un plat peu profond.","Placer au congélateur, gratter à la fourchette toutes les 30 minutes pendant 2-3 heures.","Répéter jusqu''à obtenir une texture granuleuse.","Servir aussitôt dans des verres bien frais."]',
'{"dessert","vegan","ig-bas"}',
true, 'approved', '', 50, 1, 0, 12, 6),

(uid, 'Boules protéinées cacahuète-chocolat', '', 16, 15, 0,
'[{"id":"1","name":"Beurre de cacahuète","quantity":"120","unit":"g"},{"id":"2","name":"Protéine en poudre chocolat","quantity":"40","unit":"g"},{"id":"3","name":"Flocons d''avoine","quantity":"80","unit":"g"},{"id":"4","name":"Miel","quantity":"2","unit":"c. à soupe"}]',
'["Mélanger le beurre de cacahuète et le miel.","Ajouter la protéine en poudre et l''avoine.","Bien mélanger jusqu''à obtenir une pâte homogène (ajouter un peu d''eau si trop sec).","Former des petites boules avec les mains.","Réserver au réfrigérateur au moins 30 minutes."]',
'{"dessert","riche-proteines"}',
true, 'approved', 'Se conservent 1 semaine au frigo', 100, 5, 5, 9, 16),

(uid, 'Popsicles smoothie mangue-coco', '', 6, 10, 0,
'[{"id":"1","name":"Mangue","quantity":"300","unit":"g"},{"id":"2","name":"Lait de coco allégé","quantity":"200","unit":"ml"},{"id":"3","name":"Miel","quantity":"1","unit":"c. à soupe"}]',
'["Mixer la mangue avec le lait de coco et le miel.","Verser dans des moules à glace à l''eau.","Insérer les bâtonnets.","Congeler au moins 4 heures.","Démouler en passant rapidement les moules sous l''eau tiède."]',
'{"dessert","vegan"}',
true, 'approved', '', 90, 1, 3, 16, 6),

(uid, 'Bouchées de dattes fourrées aux amandes', '', 16, 15, 0,
'[{"id":"1","name":"Dattes Medjool","quantity":"16","unit":""},{"id":"2","name":"Amandes entières","quantity":"16","unit":""},{"id":"3","name":"Cacao en poudre non sucré","quantity":"1","unit":"c. à soupe"}]',
'["Dénoyauter les dattes en les incisant sur le côté.","Insérer une amande entière dans chaque datte.","Refermer délicatement.","Rouler chaque datte dans le cacao en poudre.","Réserver au frais avant de servir."]',
'{"dessert","vegan"}',
true, 'approved', 'Se conservent facilement plusieurs jours à température ambiante', 70, 1, 2, 12, 16),

(uid, 'Yaourt glacé maison aux fruits rouges', '', 6, 10, 0,
'[{"id":"1","name":"Yaourt grec","quantity":"400","unit":"g"},{"id":"2","name":"Fruits rouges congelés","quantity":"200","unit":"g"},{"id":"3","name":"Miel","quantity":"2","unit":"c. à soupe"}]',
'["Mixer les fruits rouges congelés avec le yaourt et le miel.","Mixer jusqu''à obtenir une texture lisse et glacée.","Servir immédiatement pour une texture crémeuse façon soft.","Ou réserver 1 heure au congélateur pour une texture plus ferme.","Se conserve 1 semaine au congélateur (laisser tempérer 10 minutes avant de servir)."]',
'{"dessert","riche-proteines"}',
true, 'approved', 'Sans sorbetière, prêt en 10 minutes', 110, 6, 2, 17, 6);

END $$;
