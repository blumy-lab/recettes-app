-- LOT 2 — Italie + Méditerranée + Maghreb + Moyen-Orient (55 recettes)

DO $$
DECLARE
  uid uuid := '97a98e5c-d29d-4a9f-9d84-0684eef75fe6'::uuid;
BEGIN

-- ═══════════════════════════════════════════════════
-- 🇮🇹 CUISINE ITALIENNE
-- ═══════════════════════════════════════════════════

INSERT INTO recipes (user_id, title, source_url, servings, prep_time, cook_time, ingredients, steps, is_public, moderation_status, user_notes) VALUES

(uid, 'Pasta carbonara authentique', '', 4, 10, 20,
'["400g de spaghetti","150g de guanciale (ou lardons)","4 jaunes d''œufs","100g de pecorino romano râpé","Poivre noir concassé","Sel"]',
'["Cuire les pâtes al dente dans une grande quantité d''eau salée.","Faire revenir le guanciale à sec jusqu''à ce qu''il soit croustillant.","Mélanger les jaunes d''œufs avec le pecorino et beaucoup de poivre noir.","Réserver une tasse d''eau de cuisson des pâtes.","Égoutter les pâtes, les ajouter au guanciale hors du feu.","Verser le mélange œuf-fromage, ajouter un peu d''eau de cuisson et mélanger vigoureusement.","Servir immédiatement avec du pecorino supplémentaire."]',
true, 'approved', 'La vraie carbonara sans crème'),

(uid, 'Risotto aux champignons', '', 4, 15, 30,
'["350g de riz Arborio","300g de champignons mélangés","1 oignon","2 gousses d''ail","150ml de vin blanc","1 litre de bouillon de légumes chaud","50g de parmesan râpé","40g de beurre","2 c. à soupe d''huile d''olive","Sel, poivre","Persil frais"]',
'["Faire revenir l''oignon et l''ail dans l''huile et la moitié du beurre.","Ajouter les champignons, faire sauter 5 minutes. Réserver.","Dans la même casserole, faire nacrer le riz 2 minutes.","Déglacer au vin blanc, laisser absorber.","Ajouter le bouillon chaud louche par louche en remuant constamment.","Après 18 minutes, incorporer les champignons, le reste du beurre et le parmesan.","Rectifier l''assaisonnement, parsemer de persil."]',
true, 'approved', 'Risotto crémeux aux champignons'),

(uid, 'Pizza margherita', '', 4, 30, 15,
'["500g de farine type 00","1 sachet de levure boulangère","300ml d''eau tiède","1 c. à café de sel","2 c. à soupe d''huile d''olive","400g de sauce tomate","250g de mozzarella","Basilic frais","Sel"]',
'["Dissoudre la levure dans l''eau tiède. Mélanger à la farine et au sel.","Pétrir 10 minutes, incorporer l''huile. Laisser lever 2 heures.","Préchauffer le four à 250°C (max) avec une plaque.","Étaler la pâte finement en disque.","Napper de sauce tomate, ajouter la mozzarella égouttée en morceaux.","Cuire 10-12 minutes jusqu''à ce que les bords soient dorés.","Garnir de basilic frais à la sortie du four."]',
true, 'approved', 'Pizza napolitaine classique'),

(uid, 'Tiramisu', '', 6, 30, 0,
'["500g de mascarpone","4 œufs","100g de sucre","300ml de café fort refroidi","2 c. à soupe de marsala (ou rhum)","200g de biscuits à la cuillère","Cacao en poudre non sucré","1 pincée de sel"]',
'["Séparer les blancs des jaunes. Battre les jaunes avec le sucre jusqu''à blanchiment.","Incorporer le mascarpone et le marsala.","Monter les blancs en neige avec le sel, les incorporer délicatement.","Mélanger le café et un peu de marsala dans un bol.","Tremper rapidement les biscuits et les disposer dans un plat.","Couvrir d''une couche de crème mascarpone. Alterner biscuits et crème.","Saupoudrer de cacao, réfrigérer au moins 4 heures."]',
true, 'approved', 'Dessert italien par excellence'),

(uid, 'Osso buco à la milanaise', '', 4, 20, 90,
'["4 tranches de jarret de veau","2 oignons","2 carottes","2 branches de céleri","400g de tomates concassées","200ml de vin blanc","500ml de bouillon","Zeste de citron, ail, persil (gremolata)","Farine","Huile d''olive","Sel, poivre"]',
'["Fariner les tranches de jarret, les faire dorer dans l''huile. Réserver.","Faire revenir les légumes émincés dans la même cocotte.","Remettre la viande, déglacer au vin blanc.","Ajouter les tomates et le bouillon. Saler, poivrer.","Couvrir et mijoter 1h30 à feu doux.","Préparer la gremolata : mélanger zeste de citron, ail et persil hachés.","Servir avec de la polenta ou du risotto, parsemer de gremolata."]',
true, 'approved', 'Classique de la cuisine milanaise'),

(uid, 'Panna cotta à la vanille', '', 4, 10, 15,
'["500ml de crème entière","60g de sucre","2 feuilles de gélatine","1 gousse de vanille","Coulis de fruits rouges pour servir"]',
'["Faire tremper la gélatine dans l''eau froide 5 minutes.","Porter la crème à ébullition avec le sucre et la vanille fendue.","Hors du feu, incorporer la gélatine essorée en fouettant.","Retirer la gousse de vanille.","Verser dans des ramequins ou verrines.","Réfrigérer au moins 4 heures jusqu''à prise complète.","Démouler et servir avec un coulis de fruits rouges."]',
true, 'approved', 'Dessert italien crémeux'),

(uid, 'Gnocchi à la romaine', '', 4, 20, 30,
'["500g de pommes de terre farineuses","150g de farine","1 œuf","Sel, poix de muscade","Sauce tomate ou beurre-sauge","Parmesan râpé"]',
'["Cuire les pommes de terre en robe des champs. Éplucher et écraser en purée chaude.","Incorporer la farine, l''œuf, le sel et la muscade. Pétrir rapidement.","Diviser la pâte en boudins, couper en tronçons de 2 cm.","Rouler sur une fourchette pour les strier.","Cuire dans l''eau bouillante salée. Égoutter dès qu''ils remontent à la surface.","Faire revenir dans du beurre avec des feuilles de sauge.","Servir avec du parmesan râpé."]',
true, 'approved', 'Gnocchi maison moelleux'),

(uid, 'Lasagnes bolognaise', '', 6, 30, 60,
'["400g de bœuf haché","200g de porc haché","12 feuilles de lasagne","1 oignon","2 carottes","2 branches de céleri","400g de tomates concassées","150ml de vin rouge","500ml de béchamel","100g de parmesan","Huile d''olive","Sel, poivre"]',
'["Faire revenir les légumes émincés dans l''huile.","Ajouter les viandes, faire dorer.","Déglacer au vin rouge, ajouter les tomates. Mijoter 30 minutes.","Préchauffer le four à 190°C.","Alterner dans un plat : béchamel, lasagne, bolognaise, parmesan.","Terminer par béchamel et parmesan.","Cuire 40 minutes jusqu''à dorure."]',
true, 'approved', 'Lasagnes à la bolognaise maison'),

(uid, 'Bruschetta tomates basilic', '', 4, 10, 5,
'["8 tranches de pain de campagne","4 tomates mûres","2 gousses d''ail","Basilic frais","4 c. à soupe d''huile d''olive","Sel, poivre"]',
'["Faire griller les tranches de pain.","Frotter chaque tranche avec une gousse d''ail coupée.","Couper les tomates en petits dés, saler et laisser dégorger 5 minutes.","Égoutter les tomates, ajouter l''huile d''olive et le basilic ciselé.","Poivrer et mélanger.","Déposer la préparation sur les tranches de pain.","Servir immédiatement."]',
true, 'approved', 'Apéritif italien classique'),

(uid, 'Saltimbocca alla romana', '', 4, 15, 15,
'["8 fines escalopes de veau","8 tranches de jambon de Parme","8 feuilles de sauge","100ml de vin blanc","50g de beurre","Sel, poivre","Farine"]',
'["Placer sur chaque escalope une tranche de jambon et une feuille de sauge. Fixer avec un cure-dent.","Fariner légèrement côté veau.","Faire fondre le beurre dans une poêle.","Cuire les escalopes côté jambon 3 minutes, retourner 2 minutes.","Retirer la viande, déglacer avec le vin blanc.","Laisser réduire la sauce 2 minutes.","Napper les escalopes et servir immédiatement."]',
true, 'approved', 'Classique romain'),

-- ═══════════════════════════════════════════════════
-- 🫒 CUISINE MÉDITERRANÉENNE (Grèce, Espagne, Liban)
-- ═══════════════════════════════════════════════════

(uid, 'Moussaka grecque', '', 6, 40, 60,
'["2 aubergines","500g de bœuf haché","2 oignons","400g de tomates concassées","150ml de vin rouge","500ml de béchamel","100g de fromage kefalotyri (ou gruyère)","2 c. à café de cannelle","Huile d''olive","Sel, poivre"]',
'["Trancher les aubergines, saler et laisser dégorger 20 minutes. Rincer, sécher et faire griller à l''huile.","Faire revenir les oignons, ajouter la viande et la cannelle. Déglacer au vin, ajouter les tomates. Mijoter 20 minutes.","Préchauffer le four à 180°C.","Dans un plat, alterner : aubergines, bolognaise à la cannelle, aubergines.","Couvrir de béchamel et de fromage râpé.","Cuire 45 minutes jusqu''à dorure.","Laisser reposer 15 minutes avant de couper."]',
true, 'approved', 'Gratin grec à l''aubergine'),

(uid, 'Houmous maison', '', 6, 15, 0,
'["400g de pois chiches cuits","4 c. à soupe de tahini","3 c. à soupe de jus de citron","2 gousses d''ail","4 c. à soupe d''huile d''olive","1 c. à café de cumin","Sel","Paprika et persil pour garnir"]',
'["Égoutter les pois chiches, en réserver quelques-uns pour la garniture.","Mixer les pois chiches avec le tahini, le citron, l''ail et le cumin.","Ajouter l''huile d''olive et mixer jusqu''à texture lisse.","Ajouter de l''eau si nécessaire pour fluidifier.","Rectifier le sel et le citron.","Verser dans un plat creux, creuser un puits au centre.","Garnir d''huile d''olive, de paprika et de persil."]',
true, 'approved', 'Purée de pois chiches libanaise'),

(uid, 'Paella valenciana', '', 6, 30, 45,
'["400g de riz à paella","300g de poulet en morceaux","200g de lapin","150g de haricots verts","100g de haricots blancs","4 tomates","1 c. à café de paprika fumé","1 pincée de safran","1 litre de bouillon chaud","4 c. à soupe d''huile d''olive","Sel"]',
'["Faire chauffer l''huile dans une grande paellera.","Faire dorer les viandes. Ajouter les haricots verts et blancs.","Incorporer les tomates et le paprika. Cuire 5 minutes.","Ajouter le safran dans le bouillon chaud, verser sur la paella.","Porter à ébullition, ajouter le riz uniformément.","Cuire à feu moyen 20 minutes sans remuer.","Laisser reposer 5 minutes sous un linge avant de servir."]',
true, 'approved', 'Paella traditionnelle de Valence'),

(uid, 'Taboulé libanais', '', 4, 20, 0,
'["200g de persil plat","100g de menthe fraîche","150g de tomates","50g de boulgour fin","3 c. à soupe de jus de citron","4 c. à soupe d''huile d''olive","Sel, poivre"]',
'["Faire tremper le boulgour 15 minutes dans l''eau froide. Égoutter et essorer.","Hacher très finement le persil et la menthe.","Couper les tomates en très petits dés.","Mélanger tous les ingrédients dans un saladier.","Assaisonner avec le jus de citron, l''huile, le sel et le poivre.","Bien mélanger et goûter pour rectifier.","Servir frais, idéalement après 30 minutes de repos."]',
true, 'approved', 'Salade libanaise fraîche'),

(uid, 'Spanakopita (feuilletés épinards feta)', '', 8, 30, 35,
'["500g d''épinards frais","300g de feta","2 œufs","1 oignon","2 gousses d''ail","10 feuilles de pâte filo","50g de beurre fondu","Noix de muscade","Sel, poivre"]',
'["Faire revenir l''oignon et l''ail, ajouter les épinards et faire réduire.","Laisser refroidir, presser pour enlever l''excès d''eau.","Mélanger les épinards avec la feta émiettée, les œufs et la muscade.","Préchauffer le four à 180°C.","Badigeonner les feuilles de filo de beurre fondu, les superposer.","Répartir la farce, plier en triangle ou rouler.","Cuire 30-35 minutes jusqu''à dorure."]',
true, 'approved', 'Feuilleté grec aux épinards'),

(uid, 'Gaspacho andalou', '', 4, 20, 0,
'["800g de tomates très mûres","1 concombre","1 poivron rouge","1 oignon rouge","2 gousses d''ail","4 c. à soupe d''huile d''olive","2 c. à soupe de vinaigre de xérès","Sel, poivre","Pain rassis (50g)"]',
'["Faire tremper le pain dans un peu d''eau.","Mixer les tomates, le concombre épépiné, le poivron, l''oignon et l''ail.","Ajouter le pain essoré, l''huile et le vinaigre.","Mixer finement jusqu''à texture lisse.","Passer au tamis pour un résultat très fin.","Saler, poivrer, réfrigérer au moins 2 heures.","Servir très froid avec des dés de légumes en garniture."]',
true, 'approved', 'Soupe froide espagnole'),

(uid, 'Fattoush (salade libanaise au pain)', '', 4, 15, 10,
'["2 pains pitas","4 tomates","1 concombre","4 radis","Menthe et persil frais","Jus de 2 citrons","4 c. à soupe d''huile d''olive","1 c. à café de sumac","Sel, poivre"]',
'["Couper les pains pitas en morceaux et les faire dorer au four ou frire.","Couper les tomates, le concombre et les radis en morceaux.","Ciseler la menthe et le persil.","Mélanger tous les légumes dans un saladier.","Préparer la vinaigrette : citron, huile, sumac, sel, poivre.","Assaisonner la salade.","Ajouter les morceaux de pain juste avant de servir pour garder le croustillant."]',
true, 'approved', 'Salade libanaise au pain grillé'),

-- ═══════════════════════════════════════════════════
-- 🇲🇦 CUISINE MAGHRÉBINE
-- ═══════════════════════════════════════════════════

(uid, 'Tajine poulet citron confit olives', '', 4, 20, 60,
'["1 poulet coupé en morceaux","2 citrons confits","150g d''olives vertes","2 oignons","3 gousses d''ail","1 c. à café de gingembre en poudre","1 c. à café de curcuma","1 c. à café de cumin","1 c. à café de cannelle","Coriandre fraîche","3 c. à soupe d''huile d''olive","Sel, poivre"]',
'["Faire mariner le poulet avec les épices, l''ail et la moitié de l''huile pendant 1 heure.","Faire dorer le poulet dans l''huile restante. Réserver.","Faire revenir les oignons dans la même cocotte.","Remettre le poulet, ajouter un peu d''eau.","Couvrir et cuire 40 minutes à feu doux.","Ajouter les citrons confits coupés et les olives. Cuire encore 15 minutes.","Parsemer de coriandre fraîche et servir avec de la semoule."]',
true, 'approved', 'Tajine marocain parfumé'),

(uid, 'Couscous royal', '', 6, 40, 90,
'["500g de semoule de couscous","300g d''agneau","2 merguez","2 cuisses de poulet","3 carottes","2 courgettes","400g de pois chiches","2 tomates","1 oignon","Ras-el-hanout","Harissa","Bouillon","Beurre","Sel"]',
'["Faire dorer les viandes dans une cocotte. Ajouter les oignons et les épices.","Couvrir de bouillon, ajouter les carottes et les pois chiches. Mijoter 45 minutes.","Ajouter les courgettes et les tomates 15 minutes avant la fin.","Préparer la semoule : verser le bouillon chaud dessus, couvrir 10 minutes.","Égrainer la semoule avec du beurre et du sel.","Griller les merguez à part.","Servir la semoule avec les légumes, les viandes et la harissa."]',
true, 'approved', 'Couscous traditionnel festif'),

(uid, 'Harira (soupe marocaine)', '', 6, 20, 60,
'["200g de pois chiches cuits","100g de lentilles vertes","400g de tomates concassées","200g d''agneau haché","1 oignon","3 gousses d''ail","1 c. à café de gingembre","1 c. à café de cumin","1 c. à café de curcuma","Coriandre et persil frais","2 c. à soupe de concentré de tomate","Jus de citron","Sel, poivre"]',
'["Faire revenir l''oignon, l''ail et l''agneau avec les épices.","Ajouter les tomates, le concentré et 1,5 litre d''eau.","Porter à ébullition, ajouter les pois chiches et les lentilles.","Mijoter 40 minutes à feu moyen.","Délayer 2 c. à soupe de farine dans un peu d''eau, verser dans la soupe pour épaissir.","Cuire encore 10 minutes en remuant.","Ajouter le jus de citron, la coriandre et le persil. Servir chaud."]',
true, 'approved', 'Soupe du Ramadan marocaine'),

(uid, 'Pastilla au poulet', '', 6, 45, 45,
'["1 poulet cuit et effiloché","1 oignon","3 œufs","100g d''amandes grillées","2 c. à soupe de sucre glace","Cannelle","Ras-el-hanout","10 feuilles de brick","Beurre fondu","Sel, poivre"]',
'["Faire revenir l''oignon avec le poulet effiloché et les épices.","Brouiller les œufs dans la préparation. Laisser refroidir.","Concasser les amandes grossièrement, mélanger avec le sucre et la cannelle.","Beurrer un moule, chemiser de feuilles de brick beurrées.","Alterner : couche de poulet, couche d''amandes sucrées.","Replier les feuilles pour fermer. Badigeonner de beurre.","Cuire 30 minutes à 190°C. Décorer de sucre glace et cannelle."]',
true, 'approved', 'Tourte marocaine sucrée-salée'),

(uid, 'Méchoui d''agneau', '', 6, 20, 180,
'["1 épaule d''agneau","4 gousses d''ail","2 c. à café de cumin","2 c. à café de paprika","1 c. à café de ras-el-hanout","4 c. à soupe de beurre","Sel","Coriandre fraîche"]',
'["Mélanger le beurre ramolli avec l''ail écrasé et toutes les épices.","Faire des entailles dans la viande et insérer le mélange d''épices.","Enduire toute la surface de la pâte de beurre épicée.","Envelopper dans du papier aluminium.","Cuire au four à 160°C pendant 3 heures.","Ouvrir le papier et passer sous le grill 15 minutes pour dorer.","Servir effiloché avec de la semoule et de la coriandre."]',
true, 'approved', 'Agneau rôti aux épices du Maghreb'),

(uid, 'Briouates au fromage', '', 6, 30, 15,
'["200g de fromage frais (kiri ou fromage blanc épais)","100g de feta","2 œufs","Persil frais","Menthe fraîche","10 feuilles de brick","Huile de friture","Sel, poivre"]',
'["Mélanger le fromage frais, la feta émiettée, les œufs, le persil et la menthe hachés.","Saler et poivrer.","Couper les feuilles de brick en bandes.","Déposer une cuillère de farce au bout de chaque bande.","Plier en triangle en repliant les bords.","Faire frire dans l''huile chaude jusqu''à dorure.","Égoutter sur du papier absorbant et servir chaud."]',
true, 'approved', 'Feuilletés marocains au fromage'),

(uid, 'Shakshuka', '', 4, 10, 25,
'["6 œufs","400g de tomates concassées","2 poivrons rouges","1 oignon","3 gousses d''ail","1 c. à café de cumin","1 c. à café de paprika","1 pincée de piment de Cayenne","2 c. à soupe d''huile d''olive","Sel","Coriandre fraîche","Pain pita pour servir"]',
'["Faire revenir l''oignon et les poivrons émincés dans l''huile.","Ajouter l''ail et les épices, cuire 2 minutes.","Incorporer les tomates, saler. Laisser mijoter 15 minutes.","Creuser des nids dans la sauce et casser les œufs dedans.","Couvrir et cuire à feu doux 8-10 minutes jusqu''à ce que les blancs soient pris.","Parsemer de coriandre fraîche.","Servir directement dans la poêle avec du pain pita."]',
true, 'approved', 'Œufs en sauce tomate épicée'),

(uid, 'Makrout aux dattes', '', 20, 40, 30,
'["500g de semoule fine","200g de beurre fondu","200g de dattes dénoyautées","1 c. à café de cannelle","1 c. à café de fleur d''oranger","Huile de friture","Miel pour enrober"]',
'["Mélanger la semoule avec le beurre fondu et la fleur d''oranger. Laisser reposer 30 minutes.","Mixer les dattes avec la cannelle pour obtenir une pâte.","Façonner la pâte de semoule en boudin. Faire un creux au centre.","Insérer un boudin de pâte de dattes, refermer.","Couper en losanges avec une roulette.","Faire frire dans l''huile chaude jusqu''à dorure.","Égoutter et tremper dans le miel chaud."]',
true, 'approved', 'Gâteaux tunisiens aux dattes'),

-- ═══════════════════════════════════════════════════
-- 🕌 CUISINE DU MOYEN-ORIENT
-- ═══════════════════════════════════════════════════

(uid, 'Falafel maison', '', 4, 20, 15,
'["400g de pois chiches secs (trempés 12h)","1 oignon","4 gousses d''ail","Persil frais","Coriandre fraîche","1 c. à café de cumin","1 c. à café de coriandre en poudre","Sel, poivre","Huile de friture"]',
'["NE PAS utiliser des pois chiches cuits — les pois chiches trempés crus donnent la bonne texture.","Mixer grossièrement les pois chiches avec l''oignon, l''ail, les herbes et les épices.","La pâte doit être granuleuse, pas lisse. Saler et poivrer.","Laisser reposer 1 heure au réfrigérateur.","Former des boulettes ou galettes.","Faire frire dans l''huile à 180°C, 3-4 minutes jusqu''à dorure.","Servir dans un pain pita avec de la salade, du houmous et de la sauce tahini."]',
true, 'approved', 'Croquettes de pois chiches du Moyen-Orient'),

(uid, 'Kebab d''agneau', '', 4, 20, 15,
'["600g d''agneau haché","1 oignon râpé","3 gousses d''ail","Persil frais haché","1 c. à café de cumin","1 c. à café de coriandre","1 c. à café de paprika","Sel, poivre","Pain pita, tomates, salade pour servir"]',
'["Mélanger l''agneau haché avec l''oignon râpé, l''ail et toutes les épices.","Bien malaxer 5 minutes pour que les épices s''incorporent.","Former des boudins autour de brochettes métalliques.","Faire cuire sur un grill chaud ou à la poêle 6-8 minutes en tournant.","Pendant ce temps, réchauffer les pains pita.","Retirer la viande des brochettes.","Garnir les pitas de kebab, tomates, oignon, salade et sauce yaourt-menthe."]',
true, 'approved', 'Kebab oriental maison'),

(uid, 'Mujaddara (lentilles et riz)', '', 4, 10, 40,
'["300g de lentilles vertes","200g de riz","3 gros oignons","4 c. à soupe d''huile d''olive","1 c. à café de cumin","Sel, poivre","Yaourt pour servir"]',
'["Rincer les lentilles et les cuire 20 minutes dans l''eau salée. Égoutter.","Émincer les oignons finement. En réserver la moitié.","Faire caraméliser la première moitié des oignons dans l''huile à feu doux 25 minutes jusqu''à brun doré.","Faire frire la deuxième moitié à feu vif jusqu''à croustillante. Égoutter.","Mélanger les lentilles, le riz cuit, les oignons caramélisés et le cumin.","Assaisonner, réchauffer si nécessaire.","Garnir d''oignons frits croustillants. Servir avec du yaourt."]',
true, 'approved', 'Plat libanais lentilles-riz'),

(uid, 'Baklava aux pistaches', '', 20, 45, 30,
'["500g de pâte filo","300g de pistaches non salées hachées","200g de beurre fondu","300g de sucre","200ml d''eau","2 c. à soupe de jus de citron","2 c. à soupe d''eau de fleur d''oranger"]',
'["Préchauffer le four à 170°C. Beurrer un grand plat rectangulaire.","Superposer 10 feuilles de filo en badigeonnant chacune de beurre.","Étaler la moitié des pistaches hachées.","Superposer encore 5 feuilles de filo beurrées, ajouter le reste des pistaches.","Terminer par 10 feuilles de filo beurrées.","Couper en losanges avant cuisson. Cuire 25-30 minutes.","Faire un sirop : sucre, eau, citron, fleur d''oranger. Verser sur le baklava chaud."]',
true, 'approved', 'Pâtisserie orientale aux pistaches'),

(uid, 'Kibbeh au four', '', 6, 40, 40,
'["500g d''agneau haché","200g de boulgour fin","1 oignon râpé","1 c. à café de cannelle","1 c. à café d''allspice","Sel, poivre","Pour la farce : 200g d''agneau haché, oignon, pignons, cannelle"]',
'["Faire tremper le boulgour 20 minutes. Égoutter et essorer.","Mélanger le boulgour avec l''agneau haché, l''oignon râpé et les épices. Malaxer.","Préparer la farce : faire revenir l''oignon, ajouter l''agneau, les pignons et la cannelle.","Préchauffer le four à 180°C. Huiler un plat.","Étaler la moitié de la pâte de boulgour dans le plat.","Couvrir de la farce, puis de la seconde moitié de pâte.","Quadriller avec un couteau, arroser d''huile. Cuire 35-40 minutes."]',
true, 'approved', 'Terrine libanaise boulgour-agneau'),

(uid, 'Loubia (haricots blancs en sauce)', '', 4, 10, 40,
'["400g de haricots blancs cuits","400g de tomates concassées","1 oignon","4 gousses d''ail","1 c. à café de cumin","1 c. à café de paprika","1 piment","3 c. à soupe d''huile d''olive","Persil frais","Sel"]',
'["Faire revenir l''oignon et l''ail dans l''huile.","Ajouter le cumin, le paprika et le piment.","Incorporer les tomates, laisser réduire 10 minutes.","Ajouter les haricots blancs, mélanger.","Couvrir d''un peu d''eau, saler et mijoter 25 minutes.","Les haricots doivent être fondants et la sauce épaisse.","Parsemer de persil frais. Servir avec du pain."]',
true, 'approved', 'Haricots blancs en sauce tomate épicée'),

-- ═══════════════════════════════════════════════════
-- 🇹🇷 CUISINE TURQUE
-- ═══════════════════════════════════════════════════

(uid, 'Doner kebab maison', '', 4, 30, 20,
'["600g de bœuf haché ou agneau haché","1 oignon râpé","3 gousses d''ail","1 c. à café de cumin","1 c. à café de paprika fumé","1 c. à café d''origan","Sel, poivre","Pain pita","Tomates, oignons, laitue, sauce yaourt"]',
'["Mélanger la viande avec l''oignon râpé, l''ail et toutes les épices. Bien malaxer.","Former un grand pain de viande oblong. Réfrigérer 2 heures pour compacter.","Préchauffer le four à 200°C.","Cuire le pain de viande 20 minutes au four.","Trancher finement avec un grand couteau.","Faire dorer les tranches à la poêle.","Servir dans les pitas avec tomates, laitue, oignons et sauce yaourt-menthe."]',
true, 'approved', 'Kebab turc fait maison'),

(uid, 'Börek aux épinards et feta', '', 6, 30, 30,
'["400g d''épinards frais","250g de feta","2 œufs","10 feuilles de pâte filo","100g de beurre fondu","Sel, poivre, noix de muscade"]',
'["Faire wilter les épinards à la poêle. Égoutter, presser et hacher.","Mélanger les épinards avec la feta émiettée, les œufs, muscade, sel et poivre.","Préchauffer le four à 180°C.","Badigeonner une feuille de filo de beurre, poser la deuxième, etc. (5 feuilles).","Étaler la farce sur toute la surface.","Superposer les 5 feuilles restantes beurrées.","Couper en carrés, cuire 25-30 minutes jusqu''à dorure."]',
true, 'approved', 'Feuilleté turc aux épinards'),

(uid, 'Ayran (yaourt salé à boire)', '', 4, 5, 0,
'["400g de yaourt grec","300ml d''eau froide","1 pincée de sel","Menthe séchée (facultatif)","Glaçons"]',
'["Placer le yaourt dans un blender.","Ajouter l''eau froide et le sel.","Mixer 30 secondes jusqu''à mousse.","Goûter et ajuster le sel.","Verser dans des verres avec des glaçons.","Saupoudrer de menthe séchée.","Servir immédiatement comme boisson fraîche."]',
true, 'approved', 'Boisson turque au yaourt'),

-- ═══════════════════════════════════════════════════
-- 🇱🇧 SPÉCIALITÉS LEVANTINES
-- ═══════════════════════════════════════════════════

(uid, 'Manakish za''atar', '', 4, 20, 15,
'["500g de pâte à pain","4 c. à soupe de za''atar","4 c. à soupe d''huile d''olive","Tomates, concombre pour servir"]',
'["Préparer ou acheter la pâte à pain.","Mélanger le za''atar avec l''huile d''olive pour former une pâte.","Diviser la pâte en 4 boules. Étaler finement.","Étaler généreusement le mélange za''atar sur chaque galette.","Cuire dans un four très chaud (250°C) ou à la poêle sèche 5-7 minutes.","Servir chaud avec des tomates et du concombre.","Peut se manger au petit-déjeuner ou en collation."]',
true, 'approved', 'Galette libanaise au za''atar'),

(uid, 'Warak dawali (feuilles de vigne farcies)', '', 6, 60, 60,
'["40 feuilles de vigne en saumure","300g de riz","200g d''agneau haché","2 tomates","Persil, menthe frais","1 citron","Huile d''olive","Sel, poivre","Cannelle"]',
'["Rincer les feuilles de vigne, les blanchir 2 minutes.","Mélanger le riz cru avec l''agneau, les herbes hachées, les tomates en dés, cannelle, sel et poivre.","Déposer une cuillère de farce sur chaque feuille et rouler serré.","Disposer en couches serrées dans une cocotte.","Couvrir d''eau, ajouter le jus de citron et l''huile d''olive.","Poser une assiette dessus pour maintenir. Cuire 45-60 minutes à feu doux.","Servir avec du yaourt et des quartiers de citron."]',
true, 'approved', 'Dolmas libanaises maison'),

(uid, 'Muhallabia (crème de lait à la rose)', '', 4, 10, 15,
'["1 litre de lait","100g de sucre","60g de maïzena","2 c. à soupe d''eau de rose","Pistaches concassées","Noix de coco râpée"]',
'["Délayer la maïzena dans un peu de lait froid.","Porter le reste du lait avec le sucre à ébullition.","Verser la maïzena délayée en fouettant constamment.","Cuire à feu doux 5 minutes en remuant jusqu''à épaississement.","Retirer du feu, ajouter l''eau de rose.","Verser dans des ramequins. Laisser refroidir puis réfrigérer 2 heures.","Garnir de pistaches et de noix de coco."]',
true, 'approved', 'Dessert lacté parfumé à la rose');

END $$;
