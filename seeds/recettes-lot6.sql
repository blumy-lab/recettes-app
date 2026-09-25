-- LOT 6 — Apéritifs du monde + Desserts du monde + Europe de l'Est + Nordique (50 recettes)

DO $$
DECLARE
  uid uuid := '97a98e5c-d29d-4a9f-9d84-0684eef75fe6'::uuid;
BEGIN

-- ═══════════════════════════════════════════════════
-- 🥂 APÉRITIFS DU MONDE
-- ═══════════════════════════════════════════════════

INSERT INTO recipes (user_id, title, source_url, servings, prep_time, cook_time, ingredients, steps, is_public, moderation_status, user_notes) VALUES

(uid, 'Chips de légumes maison', '', 4, 15, 20,
'["2 betteraves","2 carottes","1 patate douce","3 c. à soupe d''huile d''olive","Sel, poivre","Paprika, cumin (facultatif)"]',
'["Préchauffer le four à 180°C.","Éplucher et trancher les légumes très finement à la mandoline (2mm).","Sécher les tranches avec du papier absorbant.","Badigeonner légèrement d''huile d''olive.","Disposer en une seule couche sur des plaques.","Cuire 15-20 minutes en surveillant. Retourner à mi-cuisson.","Saler et assaisonner dès la sortie du four. Laisser refroidir pour que ça croustille."]',
true, 'approved', 'Chips healthy et colorées'),

(uid, 'Crostini au pesto et tomates séchées', '', 6, 15, 10,
'["1 baguette","4 c. à soupe de pesto","100g de tomates séchées","100g de mozzarella","Basilic frais","Huile d''olive","Poivre"]',
'["Couper la baguette en tranches de 1 cm.","Faire griller au four à 200°C pendant 5 minutes.","Badigeonner chaque tranche de pesto.","Déposer une tranche de mozzarella et des morceaux de tomates séchées.","Repasser au four 3 minutes pour faire fondre le fromage.","Parsemer de basilic frais ciselé.","Servir immédiatement avec un filet d''huile d''olive."]',
true, 'approved', 'Toast italien à l''apéritif'),

(uid, 'Tzatziki grec', '', 6, 15, 0,
'["400g de yaourt grec épais","1 concombre","3 gousses d''ail","2 c. à soupe d''huile d''olive","1 c. à soupe de jus de citron","Aneth ou menthe fraîche","Sel"]',
'["Râper le concombre, le saler et laisser dégorger 15 minutes.","Presser fortement le concombre dans un linge pour enlever le maximum d''eau.","Mélanger le yaourt grec avec l''ail écrasé.","Incorporer le concombre essoré.","Ajouter l''huile d''olive, le jus de citron et les herbes fraîches.","Saler et mélanger.","Servir frais avec du pain pita et des crudités."]',
true, 'approved', 'Sauce grecque au yaourt et concombre'),

(uid, 'Blinis au saumon fumé', '', 8, 20, 15,
'["200g de farine de sarrasin","100g de farine blanche","2 œufs","300ml de lait tiède","1 sachet de levure","1 pincée de sel","200g de saumon fumé","200g de crème fraîche épaisse","Aneth frais","Citron"]',
'["Dissoudre la levure dans le lait tiède. Laisser 10 minutes.","Mélanger les farines et le sel. Incorporer les œufs et le lait.","Laisser reposer la pâte 1 heure.","Cuire de petites crêpes épaisses dans une poêle beurrée (5 cm de diamètre).","Laisser refroidir les blinis.","Garnir de crème fraîche et d''une tranche de saumon fumé.","Décorer d''aneth frais et d''un filet de citron."]',
true, 'approved', 'Apéritif élégant au saumon'),

(uid, 'Dip de betterave au fromage frais', '', 6, 10, 0,
'["3 betteraves cuites","200g de fromage frais (type Philadelphia)","2 gousses d''ail","2 c. à soupe de jus de citron","2 c. à soupe d''huile d''olive","1 c. à café de cumin","Sel, poivre","Graines de sésame, aneth pour garnir"]',
'["Mixer les betteraves avec l''ail, le cumin et le jus de citron.","Incorporer le fromage frais et l''huile d''olive.","Mixer jusqu''à texture lisse et crémeuse.","Saler et poivrer.","Verser dans un bol de service.","Garnir d''un filet d''huile d''olive, de graines de sésame et d''aneth.","Servir avec des crackers ou du pain pita grillé."]',
true, 'approved', 'Dip betterave coloré'),

(uid, 'Boulettes de falafels apéritives', '', 8, 20, 15,
'["400g de pois chiches secs trempés","1 oignon","4 gousses d''ail","Persil et coriandre frais","1 c. à café de cumin","1 c. à café de coriandre en poudre","Sel, poivre","Huile de friture","Sauce tahini pour tremper"]',
'["Mixer grossièrement les pois chiches avec l''oignon, l''ail et les herbes.","Ajouter les épices et le sel. La texture doit être granuleuse.","Réfrigérer 1 heure.","Former de petites boulettes de la taille d''une noix.","Faire frire dans l''huile à 180°C 3-4 minutes jusqu''à dorure.","Égoutter sur du papier absorbant.","Servir avec la sauce tahini pour tremper."]',
true, 'approved', 'Mini falafels pour l''apéro'),

(uid, 'Canapés avocat-crevettes', '', 6, 15, 0,
'["2 avocats mûrs","200g de crevettes cuites décortiquées","1 citron vert","1 piment","Coriandre fraîche","Sel","12 tranches de pain de mie grillé ou blinis"]',
'["Écraser les avocats avec le jus de citron vert et le sel.","Hacher finement le piment (sans graines pour moins de piquant).","Mélanger l''avocat avec le piment et la coriandre.","Étaler le guacamole sur les tranches de pain grillé.","Disposer 2-3 crevettes sur chaque canapé.","Décorer d''une feuille de coriandre et d''un trait de citron.","Servir immédiatement."]',
true, 'approved', 'Canapés frais avocat-crevettes'),

(uid, 'Velouté de potiron en verrines', '', 8, 15, 25,
'["500g de potiron","1 oignon","2 gousses d''ail","400ml de lait de coco","300ml de bouillon de légumes","1 c. à café de gingembre","1 c. à café de curcuma","Sel, poivre","Crème fraîche et graines de courge pour garnir"]',
'["Faire revenir l''oignon et l''ail dans un peu d''huile.","Ajouter le potiron en cubes, le gingembre et le curcuma.","Verser le bouillon. Cuire 20 minutes jusqu''à tendresse.","Ajouter le lait de coco et mixer finement.","Saler et poivrer. Ajuster la consistance avec du bouillon si nécessaire.","Laisser refroidir et verser dans des verrines.","Garnir d''une cuillère de crème fraîche et de graines de courge grillées."]',
true, 'approved', 'Soupe froide ou chaude en verrine'),

(uid, 'Tapas espagnoles : patatas bravas', '', 4, 10, 30,
'["600g de pommes de terre","4 c. à soupe d''huile d''olive","Sel","Sauce brava : 200g de tomates concassées, 1 c. à café de paprika fumé, 1 piment, 1 gousse d''ail, vinaigre","Aioli : 2 gousses d''ail, 1 jaune d''œuf, huile, jus de citron"]',
'["Couper les pommes de terre en cubes de 3 cm. Les faire rôtir au four à 220°C avec l''huile et le sel pendant 25 minutes.","Préparer la sauce brava : faire revenir l''ail, ajouter les tomates, le paprika et le piment. Cuire 10 minutes. Mixer et ajouter un trait de vinaigre.","Préparer l''aioli : mixer l''ail, le jaune d''œuf, monter à l''huile comme une mayonnaise. Ajouter le citron.","Sortir les pommes de terre bien dorées.","Napper de sauce brava.","Ajouter des points d''aioli.","Servir immédiatement comme tapas."]',
true, 'approved', 'Tapas espagnoles incontournables'),

(uid, 'Mini-quiches aux légumes', '', 12, 20, 20,
'["2 rouleaux de pâte brisée","3 œufs","200ml de crème fraîche","100g de gruyère râpé","1 courgette","1 poivron rouge","1 oignon","Sel, poivre, herbes de Provence"]',
'["Préchauffer le four à 180°C.","Faire revenir les légumes coupés en petits dés.","Découper des cercles de pâte et foncer des moules à muffins.","Battre les œufs avec la crème, saler, poivrer.","Répartir les légumes dans les fonds de tarte.","Verser l''appareil et parsemer de gruyère.","Cuire 18-20 minutes jusqu''à dorure."]',
true, 'approved', 'Mini quiches pour l''apéritif'),

-- ═══════════════════════════════════════════════════
-- 🍰 DESSERTS DU MONDE
-- ═══════════════════════════════════════════════════

(uid, 'Mochi japonais à la fraise', '', 8, 30, 10,
'["200g de farine de riz gluant","150g de sucre","250ml d''eau","Maïzena pour le plan de travail","8 fraises","200g de pâte d''anko (haricots rouges sucrés, en conserve)"]',
'["Mélanger la farine de riz gluant, le sucre et l''eau dans un bol allant au micro-ondes.","Cuire 2 minutes au micro-ondes, mélanger. Cuire encore 1 minute.","Laisser tiédir. La pâte doit être élastique et collante.","Saupoudrer généreusement le plan de travail de maïzena.","Diviser la pâte en 8 portions. Étaler chaque portion.","Entourer chaque fraise d''un peu d''anko, puis envelopper dans la pâte mochi.","Sceller et réfrigérer 30 minutes."]',
true, 'approved', 'Gâteaux de riz gluant japonais'),

(uid, 'Churros espagnols avec sauce chocolat', '', 4, 15, 15,
'["250ml d''eau","250g de farine","1 pincée de sel","1 c. à soupe de sucre","Huile de friture","Sucre et cannelle pour enrober","Sauce : 200g de chocolat noir, 200ml de crème"]',
'["Porter l''eau à ébullition avec le sel et le sucre.","Verser la farine d''un coup et mélanger vigoureusement hors du feu.","Laisser refroidir 5 minutes. Mettre dans une poche à douille étoilée.","Faire chauffer l''huile à 180°C.","Pocher des bâtons de 15 cm directement dans l''huile chaude.","Faire dorer 3-4 minutes. Égoutter et rouler dans le mélange sucre-cannelle.","Préparer la sauce : faire chauffer la crème, verser sur le chocolat. Servir pour tremper."]',
true, 'approved', 'Beignets espagnols croustillants'),

(uid, 'Cannelés bordelais', '', 12, 20, 60,
'["500ml de lait entier","250g de sucre","125g de farine","2 œufs entiers + 2 jaunes","50g de beurre","2 c. à soupe de rhum","1 gousse de vanille"]',
'["Faire chauffer le lait avec le beurre et la vanille. Laisser tiédir.","Mélanger sucre et farine. Incorporer les œufs.","Verser le lait progressivement en fouettant.","Ajouter le rhum. Mélanger jusqu''à pâte lisse.","Réfrigérer la pâte 24 heures (indispensable).","Beurrer et sucrer les moules à cannelés. Remplir aux 3/4.","Cuire à 250°C pendant 10 minutes, puis 200°C pendant 50 minutes. L''extérieur doit être très foncé et croustillant."]',
true, 'approved', 'Pâtisserie bordelaise emblématique'),

(uid, 'Pudding anglais au pain', '', 6, 15, 45,
'["400g de pain rassis","500ml de lait","200ml de crème","4 œufs","150g de sucre","100g de raisins secs","1 c. à café de cannelle","1 c. à café de vanille","50g de beurre","Sucre glace pour servir"]',
'["Couper le pain en cubes. Faire tremper dans le mélange lait-crème 15 minutes.","Battre les œufs avec le sucre, la cannelle et la vanille.","Mélanger avec le pain imbibé.","Ajouter les raisins secs.","Verser dans un plat beurré.","Cuire au bain-marie au four à 180°C pendant 40-45 minutes.","Servir tiède saupoudré de sucre glace avec une crème anglaise."]',
true, 'approved', 'Dessert anglais réconfortant'),

(uid, 'Flan pâtissier parisien', '', 8, 20, 50,
'["1 pâte brisée","1 litre de lait entier","200g de sucre","100g de maïzena","4 œufs","1 gousse de vanille","50g de beurre"]',
'["Préchauffer le four à 180°C. Foncer un grand moule avec la pâte. Réfrigérer.","Porter le lait à ébullition avec la vanille.","Fouetter les œufs avec le sucre et la maïzena.","Verser le lait chaud progressivement en fouettant.","Remettre sur le feu et cuire en remuant jusqu''à épaississement.","Hors du feu, incorporer le beurre. Verser sur le fond de tarte.","Cuire 45-50 minutes jusqu''à ce que le dessus soit bien doré et cloqué. Laisser refroidir avant de démouler."]',
true, 'approved', 'Flan parisien épais et crémeux'),

(uid, 'Gelato à la pistache', '', 6, 20, 0,
'["500ml de lait entier","200ml de crème","150g de sucre","4 jaunes d''œufs","100g de pâte de pistache","50g de pistaches concassées"]',
'["Faire chauffer le lait et la crème.","Fouetter les jaunes avec le sucre jusqu''à blanchiment.","Verser le lait chaud progressivement en fouettant.","Cuire à feu doux en remuant jusqu''à 82°C (nappage cuillère).","Hors du feu, incorporer la pâte de pistache.","Laisser refroidir complètement, puis passer en sorbetière.","Ajouter les pistaches concassées en fin de turbinage."]',
true, 'approved', 'Crème glacée italienne à la pistache'),

(uid, 'Brigadeiro brésilien', '', 20, 15, 15,
'["400g de lait concentré sucré","2 c. à soupe de cacao en poudre","1 c. à soupe de beurre","Vermicelles de chocolat pour enrober"]',
'["Mélanger le lait concentré, le cacao et le beurre dans une casserole.","Cuire à feu moyen en remuant constamment jusqu''à ce que la préparation se détache du fond.","Verser dans un plat beurré. Laisser refroidir complètement.","Beurrer légèrement les mains.","Former de petites boules de la taille d''une noix.","Rouler chaque boule dans les vermicelles de chocolat.","Placer dans des caissettes à chocolat. Réfrigérer jusqu''au service."]',
true, 'approved', 'Truffes brésiliennes au chocolat'),

(uid, 'Sticky toffee pudding', '', 6, 20, 35,
'["200g de dattes dénoyautées","200ml d''eau bouillante","1 c. à café de bicarbonate","175g de farine","150g de sucre brun","2 œufs","75g de beurre","1 c. à café de vanille","Sauce toffee : 150g de beurre, 200g de sucre brun, 200ml de crème"]',
'["Verser l''eau bouillante sur les dattes avec le bicarbonate. Laisser ramollir 10 minutes. Mixer.","Crémer le beurre et le sucre. Incorporer les œufs et la vanille.","Ajouter la purée de dattes et la farine.","Verser dans des ramequins beurrés. Cuire à 180°C 25-30 minutes.","Sauce : faire fondre beurre et sucre, ajouter la crème. Porter à ébullition 3 minutes.","Démouler les puddings chauds.","Napper généreusement de sauce toffee chaude. Servir avec de la glace vanille."]',
true, 'approved', 'Pudding collant anglais aux dattes'),

(uid, 'Halwa de semoule (dessert indien)', '', 6, 5, 15,
'["200g de semoule fine","150g de sucre","500ml d''eau","75g de beurre ou ghee","1 c. à café de cardamome","50g de raisins secs","50g d''amandes effilées","1 pincée de safran"]',
'["Faire chauffer le ghee dans une casserole.","Faire dorer la semoule en remuant constamment jusqu''à couleur dorée et odeur noisette (8 min).","Dissoudre le safran dans l''eau chaude avec le sucre.","Verser le sirop sur la semoule (attention aux éclaboussures).","Remuer vigoureusement pour éviter les grumeaux.","Cuire 5 minutes jusqu''à absorption complète.","Garnir de cardamome, raisins secs et amandes dorées."]',
true, 'approved', 'Gâteau de semoule indien parfumé'),

(uid, 'Pavlova aux fruits exotiques', '', 8, 30, 90,
'["6 blancs d''œufs","300g de sucre","1 c. à café de vinaigre blanc","1 c. à café de maïzena","500ml de crème entière","2 c. à soupe de sucre glace","Mangue, fruit de la passion, kiwi, fraises"]',
'["Monter les blancs en neige ferme. Incorporer le sucre progressivement jusqu''à meringue brillante.","Incorporer le vinaigre et la maïzena.","Former un grand disque sur papier sulfurisé (creux au centre).","Cuire à 120°C pendant 1h30. Éteindre le four, laisser sécher.","Fouetter la crème avec le sucre glace.","Garnir le centre de la meringue refroidie de chantilly.","Disposer les fruits exotiques coupés. Servir immédiatement."]',
true, 'approved', 'Meringue australienne aux fruits'),

-- ═══════════════════════════════════════════════════
-- 🇷🇺 🇵🇱 EUROPE DE L''EST
-- ═══════════════════════════════════════════════════

(uid, 'Bortsch ukrainien', '', 6, 25, 50,
'["3 betteraves","2 carottes","1 chou","3 pommes de terre","1 oignon","3 gousses d''ail","400g de bœuf","1 litre de bouillon","2 c. à soupe de concentré de tomate","2 c. à soupe de vinaigre","Aneth frais","Crème sure pour servir","Sel, poivre"]',
'["Faire cuire le bœuf 30 minutes dans le bouillon.","Râper les betteraves et les faire revenir avec l''oignon dans l''huile.","Ajouter le concentré de tomate et le vinaigre (conserve la couleur).","Ajouter carottes et chou émincé dans le bouillon.","Incorporer les betteraves et les pommes de terre en cubes.","Cuire 20 minutes. Ajouter l''ail haché en fin de cuisson.","Servir garni d''aneth et d''une cuillère de crème sure."]',
true, 'approved', 'Soupe de betterave d''Europe de l''Est'),

(uid, 'Pierogi (ravioles polonaises)', '', 4, 45, 20,
'["Pâte : 400g de farine, 1 œuf, 200ml d''eau tiède, sel","Farce : 400g de pommes de terre cuites, 200g de fromage blanc, 1 oignon, sel, poivre","Beurre et crème sure pour servir"]',
'["Préparer la pâte : mélanger farine, œuf, eau et sel. Pétrir 10 minutes. Reposer 30 minutes.","Écraser les pommes de terre avec le fromage blanc et l''oignon caramélisé.","Étaler la pâte finement. Découper des cercles de 8 cm.","Déposer une cuillère de farce. Plier en demi-lune et pincer les bords.","Cuire dans l''eau bouillante salée 4-5 minutes (ils remontent à la surface).","Égoutter et faire dorer dans le beurre.","Servir avec de la crème sure et des oignons caramélisés."]',
true, 'approved', 'Ravioles polonaises classiques'),

(uid, 'Beef stroganoff russe', '', 4, 15, 25,
'["600g de filet de bœuf","300g de champignons","1 oignon","200ml de crème fraîche","1 c. à soupe de moutarde de Dijon","1 c. à soupe de sauce Worcestershire","Beurre","Sel, poivre","Persil frais","Pâtes ou riz pour servir"]',
'["Couper le bœuf en lanières fines de 5 cm.","Faire sauter à feu très vif dans le beurre chaud 2 minutes. Réserver.","Dans la même poêle, faire revenir l''oignon et les champignons.","Ajouter la moutarde et le Worcestershire.","Incorporer la crème fraîche. Laisser réduire 5 minutes.","Remettre le bœuf dans la sauce. Chauffer sans faire bouillir.","Parsemer de persil. Servir sur des pâtes ou du riz."]',
true, 'approved', 'Classique russe à la crème'),

(uid, 'Blinis russes au sarrasin', '', 4, 20, 15,
'["150g de farine de sarrasin","100g de farine blanche","1 sachet de levure","300ml de lait tiède","2 œufs","1 pincée de sel","Beurre pour cuisson","Caviar, saumon fumé, crème sure pour garnir"]',
'["Mélanger les farines avec la levure et le sel.","Incorporer les jaunes d''œufs et le lait tiède progressivement.","Laisser reposer 1 heure.","Monter les blancs en neige et les incorporer délicatement.","Cuire de petites crêpes épaisses (8 cm) dans une poêle beurrée.","Retourner quand des bulles apparaissent à la surface.","Servir avec crème sure, saumon fumé ou caviar."]',
true, 'approved', 'Petites crêpes russes traditionnelles'),

(uid, 'Goulash hongrois', '', 4, 20, 90,
'["700g de bœuf (paleron)","3 oignons","3 gousses d''ail","2 c. à soupe de paprika doux","1 c. à café de paprika fumé","400g de tomates concassées","300ml de bouillon de bœuf","2 poivrons rouges","Carvi","Sel, poivre","Huile","Crème sure pour servir"]',
'["Couper le bœuf en cubes de 3 cm.","Faire revenir les oignons dans l''huile jusqu''à brun doré.","Hors du feu, ajouter le paprika et l''ail. Mélanger rapidement.","Remettre sur le feu, ajouter le bœuf et faire dorer.","Incorporer les tomates, le bouillon, les poivrons et le carvi.","Mijoter 1h30 à feu doux en ajoutant du bouillon si nécessaire.","Servir avec des spätzle ou des pâtes, et une cuillère de crème sure."]',
true, 'approved', 'Ragoût épicé hongrois'),

-- ═══════════════════════════════════════════════════
-- 🇸🇪 🇳🇴 CUISINE NORDIQUE
-- ═══════════════════════════════════════════════════

(uid, 'Saumon à la suédoise (gravad lax)', '', 6, 20, 0,
'["600g de filet de saumon frais","3 c. à soupe de gros sel","2 c. à soupe de sucre","1 c. à café de poivre blanc concassé","Aneth frais abondant","Sauce moutarde-aneth : 2 c. moutarde, 1 c. sucre, 1 c. vinaigre, huile, aneth"]',
'["Mélanger sel, sucre et poivre.","Couvrir généreusement le saumon d''aneth frais.","Enduire du mélange sel-sucre.","Emballer dans du film, placer sous un poids.","Réfrigérer 48 heures en retournant toutes les 12 heures.","Rincer, sécher et trancher finement.","Préparer la sauce en fouettant tous les ingrédients. Servir avec du pain noir."]',
true, 'approved', 'Saumon mariné nordique'),

(uid, 'Köttbullar (boulettes suédoises)', '', 4, 20, 20,
'["400g de bœuf haché","200g de porc haché","1 oignon râpé","1 œuf","50g de chapelure","100ml de lait","1 c. à café d''allspice","Sel, poivre","Beurre","Sauce : 300ml de bouillon, 200ml de crème, 1 c. sauce soja"]',
'["Faire tremper la chapelure dans le lait 5 minutes.","Mélanger les viandes, l''oignon, l''œuf, la chapelure, l''allspice, sel et poivre.","Former de petites boulettes de 3 cm.","Faire dorer dans le beurre sur toutes les faces.","Réserver les boulettes. Déglacer avec le bouillon.","Ajouter la crème et la sauce soja. Laisser réduire.","Remettre les boulettes dans la sauce. Servir avec de la purée et de la confiture d''airelles."]',
true, 'approved', 'Boulettes suédoises IKEA maison'),

(uid, 'Smørrebrød danois', '', 4, 20, 0,
'["8 tranches de pain de seigle noir","200g de hareng mariné","200g de saumon fumé","4 œufs durs","Crevettes grises","Avocat","Aneth, ciboulette","Mayonnaise, crème sure","Radis, concombre pour garnir"]',
'["Préparer les garnitures : trancher les œufs, l''avocat, le concombre.","Garnir 2 tranches de pain de hareng mariné avec des rondelles d''oignon et d''aneth.","Garnir 2 tranches de saumon fumé avec de la crème sure et des câpres.","Garnir 2 tranches de crevettes avec de la mayonnaise et des tranches d''œuf.","Garnir 2 tranches d''avocat et de crevettes avec du citron.","Décorer chaque tartine avec des herbes fraîches et des légumes.","Servir immédiatement — les smørrebrød ne se gardent pas."]',
true, 'approved', 'Tartines ouvertes danoises'),

-- ═══════════════════════════════════════════════════
-- 🌿 VÉGÉTARIEN & TENDANCES
-- ═══════════════════════════════════════════════════

(uid, 'Buddha bowl avocat-quinoa', '', 2, 20, 15,
'["150g de quinoa","1 avocat","100g de pois chiches rôtis","1 carotte râpée","1 concombre","Edamame","Graines de sésame","Vinaigrette : sauce soja, gingembre, sésame, citron vert, miel"]',
'["Cuire le quinoa selon les instructions. Laisser refroidir.","Faire rôtir les pois chiches au four avec huile, sel et paprika 20 minutes.","Préparer la vinaigrette en mélangeant tous les ingrédients.","Diviser le quinoa dans deux bols.","Disposer les légumes en sections : avocat tranché, carotte râpée, concombre, edamame.","Ajouter les pois chiches croustillants.","Arroser de vinaigrette et parsemer de sésame."]',
true, 'approved', 'Bol complet et coloré'),

(uid, 'Soupe miso aux légumes', '', 4, 10, 15,
'["1 litre de bouillon de légumes","3 c. à soupe de miso blanc","150g de tofu ferme","2 c. à soupe d''algues wakame","100g de shiitake","2 oignons verts","1 c. à café d''huile de sésame","Gingembre râpé"]',
'["Réhydrater les algues wakame 5 minutes.","Faire chauffer le bouillon avec le gingembre. Ne pas bouillir.","Ajouter les champignons shiitake tranchés.","Cuire 5 minutes à feu doux.","Couper le tofu en cubes, ajouter à la soupe.","Délayer le miso dans une louche de bouillon, incorporer sans faire bouillir.","Servir avec les algues, les oignons verts et l''huile de sésame."]',
true, 'approved', 'Soupe japonaise végétarienne'),

(uid, 'Shakshuka aux poivrons grillés', '', 4, 15, 25,
'["6 œufs","2 poivrons rouges grillés pelés","400g de tomates concassées","1 oignon","3 gousses d''ail","1 c. à café de cumin","1 c. à café de paprika fumé","Piment de Cayenne","Feta émiettée","Coriandre fraîche","Pain pita"]',
'["Faire revenir l''oignon et l''ail dans l''huile d''olive.","Ajouter les poivrons grillés en lanières et les épices.","Incorporer les tomates. Mijoter 15 minutes jusqu''à sauce épaisse.","Saler et rectifier les épices.","Creuser 6 nids dans la sauce et y casser les œufs.","Couvrir et cuire à feu doux 8 minutes (blancs pris, jaunes coulants).","Parsemer de feta et coriandre. Servir avec du pain pita."]',
true, 'approved', 'Œufs pochés dans la sauce tomate épicée'),

(uid, 'Curry de légumes au lait de coco', '', 4, 15, 25,
'["1 patate douce","1 poivron rouge","200g de pois chiches cuits","200g d''épinards","400ml de lait de coco","2 c. à soupe de pâte de curry rouge","1 oignon","3 gousses d''ail","Gingembre","Coriandre fraîche","Riz basmati"]',
'["Faire revenir l''oignon, l''ail et le gingembre.","Ajouter la pâte de curry rouge. Cuire 2 minutes.","Incorporer la patate douce en cubes et le poivron.","Verser le lait de coco. Porter à ébullition.","Ajouter les pois chiches. Mijoter 15 minutes.","Incorporer les épinards en fin de cuisson.","Parsemer de coriandre fraîche. Servir avec du riz basmati."]',
true, 'approved', 'Curry végétarien crémeux'),

(uid, 'Poke bowl hawaïen au thon', '', 2, 20, 0,
'["200g de thon frais qualité sashimi","400g de riz à sushi cuit","1 avocat","1 mangue","Edamame","Concombre","Oignon rouge","3 c. à soupe de sauce soja","1 c. à café d''huile de sésame","Sésame grillé","Gingembre mariné"]',
'["Couper le thon en cubes de 2 cm.","Mariner le thon avec la sauce soja et l''huile de sésame 10 minutes.","Assaisonner le riz à sushi avec vinaigre de riz, sel et sucre.","Diviser le riz dans deux bols.","Disposer le thon, l''avocat tranché, la mangue, l''edamame et le concombre.","Garnir d''oignon rouge émincé et de gingembre mariné.","Parsemer de sésame grillé et servir immédiatement."]',
true, 'approved', 'Bol hawaïen frais au thon'),

(uid, 'Soupe pho végétarienne', '', 4, 20, 30,
'["400g de nouilles de riz","1,5 litre de bouillon de légumes","4 étoiles de badiane","1 bâton de cannelle","3 clous de girofle","1 morceau de gingembre grillé","200g de tofu","100g de champignons","Germes de soja, basilic thaï, citron vert, piment pour garnir","Sauce soja, hoisin"]',
'["Faire griller le gingembre directement sur la flamme.","Faire infuser le bouillon avec le gingembre, la badiane, la cannelle et les clous de girofle 20 minutes.","Filtrer le bouillon. Assaisonner avec la sauce soja.","Faire dorer le tofu coupé en cubes.","Cuire les nouilles séparément. Égoutter.","Répartir les nouilles dans les bols avec le tofu et les champignons.","Verser le bouillon bouillant. Servir avec les garnitures fraîches."]',
true, 'approved', 'Pho végétarien parfumé');

END $$;
