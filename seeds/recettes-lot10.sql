-- LOT 10 — Apéritifs & tapas (40) + Rapide <30 min (30) = 70 recettes

DO $$
DECLARE
  uid uuid := '97a98e5c-d29d-4a9f-9d84-0684eef75fe6'::uuid;
BEGIN

-- ═══════════════════════════════════════════════════
-- 🥂 APÉRITIFS & TAPAS DU MONDE
-- ═══════════════════════════════════════════════════

INSERT INTO recipes (user_id, title, source_url, servings, prep_time, cook_time, ingredients, steps, is_public, moderation_status, user_notes) VALUES

(uid, 'Bruschette tomates-basilic', '', 6, 10, 5,
'["1 baguette","4 tomates mûres","2 gousses d''ail","Basilic frais","4 c. à soupe d''huile d''olive","Sel, poivre","Vinaigre balsamique"]',
'["Couper la baguette en tranches de 1 cm.","Faire griller au four à 200°C 5 minutes ou au grille-pain.","Frotter chaque tranche avec une gousse d''ail coupée.","Couper les tomates en petits dés. Saler.","Mélanger tomates, basilic ciselé, huile d''olive et vinaigre.","Garnir les toasts de la préparation aux tomates.","Servir immédiatement avant que le pain ne ramollisse."]',
true, 'approved', 'Toast italien à l''apéritif'),

(uid, 'Guacamole avocat-piment apéritif', '', 8, 10, 0,
'["3 avocats mûrs","1 citron vert","1 piment jalapeño","1 tomate","1 petit oignon rouge","Coriandre fraîche","Sel","Chips tortilla pour tremper"]',
'["Couper les avocats en deux. Retirer le noyau.","Récupérer la chair et l''écraser à la fourchette.","Ajouter le jus du citron vert pour éviter le noircissement.","Hacher finement le jalapeño, la tomate et l''oignon.","Incorporer au guacamole.","Parsemer de coriandre fraîche. Saler.","Servir avec des chips tortilla ou des crudités."]',
true, 'approved', 'Sauce avocats apéritif'),

(uid, 'Sauce tzatziki et crudités', '', 6, 15, 0,
'["500g de yaourt grec","1 concombre","3 gousses d''ail","3 c. à soupe d''huile d''olive","1 c. à soupe de jus de citron","Aneth ou menthe","Sel","Crudités et pain pita pour tremper"]',
'["Râper le concombre. Le saler. Laisser dégorger 15 minutes.","Essorer le concombre dans un torchon.","Mélanger yaourt grec, ail haché finement, huile d''olive et jus de citron.","Incorporer le concombre essoré.","Hacher les herbes fraîches et incorporer.","Saler et réfrigérer 30 minutes.","Servir avec des crudités, du pain pita et des chips."]',
true, 'approved', 'Dip grec rafraîchissant'),

(uid, 'Verrine de mousse de saumon', '', 8, 15, 0,
'["200g de saumon fumé","150g de fromage frais","100ml de crème entière","Jus de citron","Aneth frais","Sel, poivre","Caviar ou œufs de lump pour décorer"]',
'["Mixer le saumon fumé avec le fromage frais et le jus de citron.","Fouetter la crème en chantilly ferme.","Incorporer délicatement la chantilly au mélange saumon.","Ajouter l''aneth ciselé. Saler et poivrer.","Répartir dans des verrines à la poche à douille.","Réfrigérer 30 minutes.","Décorer d''un peu de caviar et d''une branche d''aneth."]',
true, 'approved', 'Verrine apéritif élégante au saumon'),

(uid, 'Champignons farcis au fromage', '', 6, 15, 20,
'["12 gros champignons de Paris","200g de fromage frais","50g de parmesan râpé","2 gousses d''ail","Persil frais","Huile d''olive","Sel, poivre","Chapelure"]',
'["Préchauffer le four à 200°C.","Retirer les pieds des champignons. Hacher finement les pieds.","Faire revenir les pieds hachés avec l''ail dans l''huile.","Mélanger avec le fromage frais, le parmesan et le persil.","Saler et poivrer.","Remplir généreusement chaque chapeau de champignon.","Parsemer de chapelure et faire cuire 15-20 minutes."]',
true, 'approved', 'Champignons farcis gratinés'),

(uid, 'Gougères au gruyère', '', 20, 15, 25,
'["150ml d''eau","60g de beurre","90g de farine","3 œufs","100g de gruyère râpé","Sel, poivre, muscade"]',
'["Porter à ébullition l''eau et le beurre avec le sel.","Hors du feu, incorporer la farine d''un coup. Mélanger vigoureusement.","Remettre sur le feu et dessécher la pâte 2 minutes.","Hors du feu, incorporer les œufs un à un. La pâte doit être lisse et brillante.","Incorporer le gruyère, le poivre et la muscade.","Pocher de petits choux sur une plaque.","Cuire à 200°C 20-25 minutes. Ne pas ouvrir le four."]',
true, 'approved', 'Choux apéritifs au fromage'),

(uid, 'Tartinade de lentilles corail', '', 8, 10, 20,
'["300g de lentilles corail","1 oignon","3 gousses d''ail","2 c. à soupe de tahini","Jus de citron","1 c. à café de cumin","Huile d''olive","Sel, paprika fumé"]',
'["Cuire les lentilles corail dans deux fois leur volume d''eau 15-20 minutes.","Faire revenir l''oignon et l''ail.","Mixer les lentilles cuites avec l''oignon, l''ail, le tahini et le jus de citron.","Assaisonner avec le cumin, le sel et un filet d''huile d''olive.","La texture doit être lisse comme un houmous.","Verser dans un plat. Garnir d''huile d''olive et de paprika fumé.","Servir avec des crackers, du pain pita ou des crudités."]',
true, 'approved', 'Houmous de lentilles apéritif'),

(uid, 'Mini-pizzas apéritives', '', 6, 15, 12,
'["2 pâtes à pizza (ou pain naan)","150ml de sauce tomate","150g de mozzarella","Garnitures au choix : jambon, champignons, olives, poivrons, anchois","Origan séché","Huile d''olive"]',
'["Préchauffer le four à 220°C.","Découper des cercles de 8 cm dans la pâte à l''aide d''un verre.","Étaler une cuillerée de sauce tomate sur chaque disque.","Disposer la mozzarella et les garnitures au choix.","Saupoudrer d''origan.","Cuire 10-12 minutes jusqu''à ce que la pâte soit dorée et le fromage fondu.","Servir immédiatement à l''apéritif."]',
true, 'approved', 'Mini-pizzas à l''apéro'),

(uid, 'Houmous aux poivrons rôtis', '', 8, 10, 0,
'["400g de pois chiches cuits","2 poivrons rouges rôtis (bocal ou faits maison)","3 c. à soupe de tahini","Jus de 1 citron","3 gousses d''ail","4 c. à soupe d''huile d''olive","1 c. à café de cumin","Sel, piment de Cayenne"]',
'["Égoutter les pois chiches (garder le liquide).","Mixer les pois chiches avec les poivrons rôtis, le tahini, le jus de citron et l''ail.","Ajouter l''huile d''olive en continuant de mixer.","Assaisonner avec le cumin, le sel et le piment.","Si trop épais, ajouter un peu de liquide des pois chiches.","Verser dans un bol. Garnir d''un filet d''huile et de paprika.","Servir avec du pain pita grillé."]',
true, 'approved', 'Houmous coloré aux poivrons'),

(uid, 'Pissaladière niçoise', '', 6, 20, 50,
'["1 pâte à pain ou brisée","1 kg d''oignons","12 filets d''anchois","100g d''olives de Nice","Thym, laurier","Huile d''olive","Sel, poivre"]',
'["Préchauffer le four à 180°C.","Faire confire les oignons dans l''huile d''olive à feu très doux 40 minutes. Assaisonner.","Étaler la pâte sur une plaque huilée.","Garnir des oignons confits.","Disposer les filets d''anchois en croisillons.","Placer les olives dans les losanges formés.","Cuire 25-30 minutes jusqu''à dorure. Servir tiède ou froid."]',
true, 'approved', 'Tarte provençale aux oignons'),

(uid, 'Rillettes de sardines maison', '', 6, 10, 0,
'["3 boîtes de sardines à l''huile d''olive","100g de fromage frais","1 c. à soupe de moutarde","Jus de citron","Ciboulette","Sel, poivre","Pain grillé pour servir"]',
'["Égoutter les sardines. Retirer les arêtes si nécessaire.","Écraser les sardines à la fourchette.","Incorporer le fromage frais et la moutarde.","Ajouter le jus de citron et la ciboulette ciselée.","Saler, poivrer et bien mélanger.","Mettre en pot. Réfrigérer au moins 30 minutes.","Servir sur des tranches de pain grillé."]',
true, 'approved', 'Tartinade sardines à l''apéro'),

(uid, 'Pintxos basques (montaditos)', '', 6, 20, 0,
'["1 baguette","6 tranches de jambon ibérique","100g de fromage manchego","2 poivrons piquillo","6 crevettes","Anchois en bocal","Sauce : huile d''olive, ail, piment"]',
'["Couper la baguette en tranches de 2 cm.","Préparer des garnitures variées pour 6 personnes.","Pintxo jambon-manchego : poser une tranche de jambon et du fromage.","Pintxo poivron-anchois : demi-poivron piquillo avec 1 filet d''anchois.","Pintxo crevette-ail : crevette sautée à l''ail pimenté.","Piquer chaque pintxo d''un cure-dent pour maintenir la garniture.","Servir sur un grand plateau avec de la bière ou du txakoli."]',
true, 'approved', 'Tapas basques sur toast'),

(uid, 'Edamame sel et citron', '', 4, 5, 5,
'["500g d''edamame surgelés","Sel de mer","Jus de citron","Zeste de citron","Flocons de piment"]',
'["Faire bouillir une grande casserole d''eau salée.","Ajouter les edamame surgelés. Cuire 4-5 minutes.","Égoutter et rincer rapidement à l''eau froide.","Disposer dans un bol.","Assaisonner de sel de mer, jus et zeste de citron.","Parsemer de flocons de piment selon le goût.","Servir immédiatement en entrée ou apéritif. On mange les fèves en pressant les gousses."]',
true, 'approved', 'Fèves de soja japonaises à l''apéro'),

(uid, 'Brochettes de mozzarella et tomates cerises', '', 6, 10, 0,
'["250g de mozzarella (petites boules)","250g de tomates cerises","Feuilles de basilic frais","Huile d''olive","Vinaigre balsamique réduit","Sel, poivre","Piques à brochette"]',
'["Alterner sur des piques : 1 tomate cerise, 1 feuille de basilic, 1 boule de mozzarella.","Répéter une fois et terminer par une tomate.","Disposer sur un plat.","Arroser d''huile d''olive.","Napper de réduction de balsamique.","Saler et poivrer.","Servir frais."]',
true, 'approved', 'Brochettes caprese apéritives'),

(uid, 'Chips de parmesan', '', 4, 5, 10,
'["200g de parmesan râpé","Romarin frais ou séché","Poivre noir"]',
'["Préchauffer le four à 200°C.","Sur une plaque recouverte de papier sulfurisé, déposer des petits tas de parmesan (2 c. à soupe chacun).","Aplatir légèrement.","Parsemer de romarin et de poivre.","Cuire 5-7 minutes jusqu''à dorure.","Laisser refroidir sur la plaque (elles croustillent en refroidissant).","Servir immédiatement ou conserver dans une boîte hermétique."]',
true, 'approved', 'Tuiles croustillantes au parmesan'),

(uid, 'Mini-burgers apéritifs', '', 8, 20, 15,
'["400g de bœuf haché","8 petits pains briochés","Cheddar","Tomates cerises","Cornichons","Moutarde, ketchup","Salade verte","Sel, poivre"]',
'["Assaisonner le bœuf haché. Former 8 petits steaks de 50g.","Cuire 2-3 minutes de chaque côté dans une poêle chaude.","Poser une tranche de cheddar sur chaque steak. Couvrir 1 minute.","Couper les petits pains en deux. Faire griller légèrement.","Garnir de moutarde et ketchup.","Assembler avec une feuille de salade, le steak, une rondelle de tomate cerise et un cornichon.","Maintenir avec un cure-dent décoratif."]',
true, 'approved', 'Mini burgers pour l''apéro'),

(uid, 'Tartelettes au chèvre et miel', '', 12, 15, 15,
'["2 rouleaux de pâte feuilletée","200g de fromage de chèvre frais","4 c. à soupe de miel liquide","Thym frais","Noix concassées","Poivre"]',
'["Préchauffer le four à 190°C.","Découper des cercles de pâte feuilletée (8 cm de diamètre).","Foncer de petits moules à tartelettes.","Piquer le fond.","Déposer une tranche de chèvre sur chaque fond de tarte.","Arroser de miel, parsemer de noix et thym.","Cuire 12-15 minutes jusqu''à dorure du feuilleté. Servir tiède."]',
true, 'approved', 'Tartelettes sucrées-salées au chèvre'),

(uid, 'Œufs mimosa', '', 6, 15, 10,
'["6 œufs","3 c. à soupe de mayonnaise","1 c. à café de moutarde","Paprika","Ciboulette ou aneth","Sel, poivre"]',
'["Faire cuire les œufs durs 10 minutes dans l''eau bouillante.","Refroidir immédiatement dans l''eau glacée. Écaler.","Couper chaque œuf en deux dans la longueur.","Sortir délicatement les jaunes.","Écraser les jaunes avec la mayonnaise, la moutarde, sel et poivre.","Remplir les blancs à la poche à douille ou à la cuillère.","Saupoudrer de paprika et décorer de ciboulette."]',
true, 'approved', 'Classique de l''apéritif français'),

(uid, 'Gressins maison au sésame', '', 6, 20, 20,
'["300g de farine","1 sachet de levure","150ml d''eau tiède","3 c. à soupe d''huile d''olive","1 c. à café de sel","Sésame, nigelle, graines de pavot pour enrober"]',
'["Mélanger farine, levure, sel. Ajouter l''eau tiède et l''huile.","Pétrir jusqu''à pâte lisse. Laisser lever 30 minutes.","Préchauffer le four à 200°C.","Diviser la pâte en 20 morceaux. Rouler en longs bâtons fins.","Rouler dans les graines au choix.","Disposer sur une plaque. Cuire 15-20 minutes jusqu''à dorure.","Laisser refroidir sur une grille. Croustillants en refroidissant."]',
true, 'approved', 'Bâtonnets croustillants maison'),

(uid, 'Soupe froide de concombre et menthe', '', 4, 10, 0,
'["2 concombres","200g de yaourt grec","1 gousse d''ail","Menthe fraîche","Jus de citron","Huile d''olive","Sel, poivre","Glaçons"]',
'["Éplucher et couper les concombres en morceaux.","Mixer avec le yaourt, l''ail et le jus de citron.","Ajouter la menthe fraîche.","Saler et poivrer. Mixer jusqu''à consistance lisse.","Ajouter de l''eau si trop épais.","Servir très frais dans des verrines avec de la glace.","Décorer d''un filet d''huile d''olive et d''une feuille de menthe."]',
true, 'approved', 'Verrine froide apéritive à la menthe'),

-- ═══════════════════════════════════════════════════
-- ⚡ RAPIDE < 30 MINUTES
-- ═══════════════════════════════════════════════════

(uid, 'Pâtes carbonara rapides (15 min)', '', 4, 5, 10,
'["400g de spaghetti","200g de lardons ou pancetta","4 jaunes d''œufs","100g de parmesan râpé","Poivre noir concassé","Sel"]',
'["Cuire les pâtes dans une grande eau bouillante salée.","Faire dorer les lardons dans une poêle à sec.","Mélanger les jaunes d''œufs avec le parmesan et le poivre.","Égoutter les pâtes en conservant 2 louches d''eau de cuisson.","Hors du feu, mélanger les pâtes chaudes avec les lardons.","Verser le mélange œufs-parmesan. Mélanger rapidement en ajoutant de l''eau de cuisson.","La sauce doit être crémeuse sans être cuite. Servir immédiatement."]',
true, 'approved', 'Pâtes romaines en 15 minutes'),

(uid, 'Omelette aux herbes fraîches (10 min)', '', 2, 3, 7,
'["4 œufs","Ciboulette, persil, cerfeuil frais","Beurre","Sel, poivre","Fromage râpé (facultatif)"]',
'["Battre les œufs à la fourchette avec le sel et le poivre.","Hacher les herbes fraîches. Incorporer aux œufs.","Faire fondre le beurre dans une poêle à feu moyen-vif.","Verser les œufs. Agiter la poêle en secouant.","Avec une spatule, ramener les bords vers le centre.","L''omelette doit être baveuse à l''intérieur (30 secondes max).","Rouler et servir immédiatement."]',
true, 'approved', 'Omelette française en 10 minutes'),

(uid, 'Soupe tomate basilic express (20 min)', '', 4, 5, 15,
'["800g de tomates concassées en boîte","1 oignon","3 gousses d''ail","500ml de bouillon de légumes","100ml de crème fraîche","Basilic frais","Huile d''olive","Sel, poivre, sucre"]',
'["Faire revenir l''oignon et l''ail dans l''huile d''olive 3 minutes.","Ajouter les tomates concassées et le bouillon.","Porter à ébullition et cuire 10 minutes.","Mixer finement.","Incorporer la crème fraîche.","Saler, poivrer. Ajouter une pincée de sucre pour l''acidité.","Servir avec des feuilles de basilic frais et un filet d''huile d''olive."]',
true, 'approved', 'Soupe de tomate crémeuse rapide'),

(uid, 'Quesadillas express au fromage (15 min)', '', 4, 5, 10,
'["8 tortillas de blé","300g de mozzarella ou cheddar râpé","1 poivron","Oignon rouge","Épinards frais","Guacamole et crème sure pour servir"]',
'["Émincer finement le poivron et l''oignon rouge.","Garnir une tortilla de fromage râpé, poivron, oignon et épinards.","Couvrir d''une seconde tortilla.","Cuire dans une poêle sèche 2-3 minutes jusqu''à dorure.","Retourner délicatement et cuire encore 2 minutes.","Couper en 4 triangles.","Servir avec guacamole et crème sure."]',
true, 'approved', 'Sandwich mexicain express'),

(uid, 'Saumon en papillote citron-aneth (20 min)', '', 4, 5, 15,
'["4 pavés de saumon","2 citrons","Aneth frais","2 c. à soupe d''huile d''olive","Sel, poivre","4 feuilles d''aluminium"]',
'["Préchauffer le four à 200°C.","Placer chaque pavé sur une feuille d''aluminium.","Assaisonner de sel et poivre.","Arroser d''huile d''olive et de jus de citron.","Déposer des rondelles de citron et de l''aneth frais.","Fermer hermétiquement les papillotes.","Cuire 12-15 minutes. Ouvrir devant les convives."]',
true, 'approved', 'Poisson en papillote rapide'),

(uid, 'Soupe ramen au miso express (20 min)', '', 4, 5, 15,
'["4 portions de nouilles ramen","1 litre de bouillon de poulet","4 c. à soupe de pâte de miso","200g de tofu","2 œufs","100g de champignons","Oignons verts","Huile de sésame"]',
'["Porter le bouillon à frémissement.","Faire cuire les œufs mollets 6 minutes. Éplucher. Couper en deux.","Cuire les nouilles dans le bouillon selon les instructions.","Diluer le miso dans une louche de bouillon. Incorporer sans faire bouillir.","Ajouter les champignons et le tofu en cubes. Chauffer 2 minutes.","Répartir dans des bols. Déposer l''œuf mollet.","Garnir d''oignons verts et d''huile de sésame."]',
true, 'approved', 'Ramen express maison'),

(uid, 'Steak haché sauce poivre (15 min)', '', 4, 5, 10,
'["4 steaks hachés","2 échalotes","100ml de cognac","200ml de crème fraîche","1 c. à soupe de poivre concassé","Beurre","Sel"]',
'["Faire chauffer une poêle à feu très vif avec un peu de beurre.","Cuire les steaks selon la cuisson désirée (2-3 min de chaque côté pour saignant).","Réserver au chaud.","Dans la même poêle, faire revenir les échalotes.","Déglacer au cognac et flamber.","Ajouter la crème et le poivre. Laisser réduire 3 minutes.","Napper les steaks de sauce. Servir avec des frites."]',
true, 'approved', 'Steak brasserie en 15 minutes'),

(uid, 'Pâtes au pesto maison (15 min)', '', 4, 5, 10,
'["400g de trofie ou linguine","Pesto : 1 bouquet de basilic, 50g de parmesan, 30g de pignons, 1 gousse d''ail, 100ml d''huile d''olive, sel"]',
'["Cuire les pâtes dans l''eau salée.","Préparer le pesto : mixer basilic, parmesan, pignons et ail.","Verser l''huile en filet en continuant de mixer.","Assaisonner de sel.","Égoutter les pâtes en conservant un peu d''eau de cuisson.","Mélanger les pâtes chaudes avec le pesto et un peu d''eau de cuisson pour lier.","Servir immédiatement avec du parmesan râpé supplémentaire."]',
true, 'approved', 'Pâtes au basilic en 15 minutes'),

(uid, 'Wrap poulet avocat (10 min)', '', 4, 10, 0,
'["4 tortillas larges","400g de poulet cuit effiloché","2 avocats","1 tomate","Salade","Sauce : yaourt, citron, coriandre, sel"]',
'["Préparer la sauce : mélanger yaourt, jus de citron, coriandre et sel.","Trancher les avocats et la tomate.","Réchauffer légèrement les tortillas au micro-ondes.","Étaler la sauce sur chaque tortilla.","Garnir de salade, poulet, avocat et tomate.","Rouler serré et couper en diagonale.","Servir immédiatement ou emballer pour le transport."]',
true, 'approved', 'Wrap frais poulet-avocat'),

(uid, 'Tacos de poulet minute (20 min)', '', 4, 10, 10,
'["400g de blancs de poulet","Épices taco : cumin, paprika, ail en poudre, origan, piment","8 petites tortillas maïs","Salade","Tomate","Oignon rouge","Crème sure","Coriandre"]',
'["Couper le poulet en lanières.","Assaisonner généreusement avec les épices taco et du sel.","Faire sauter à feu vif dans l''huile 6-8 minutes.","Réchauffer les tortillas dans une poêle sèche.","Garnir chaque tortilla de quelques lanières de poulet.","Ajouter les crudités, la crème sure et la coriandre.","Servir immédiatement avec des quartiers de citron vert."]',
true, 'approved', 'Tacos au poulet en 20 minutes'),

(uid, 'Salade niçoise complète (15 min)', '', 4, 15, 0,
'["4 œufs durs","400g de thon en boîte","300g de haricots verts cuits","4 tomates","12 olives noires","8 anchois","1 poivron","Basilic","Vinaigrette : huile, vinaigre, moutarde, sel, poivre"]',
'["Cuire les œufs durs (préfabriqués ou 10 min si pas cuits).","Égoutter le thon.","Disposer tous les ingrédients dans un grand plat en sections séparées.","Trancher les œufs en deux.","Disposer anchois, olives et basilic.","Préparer la vinaigrette. Émulsionner.","Arroser au moment de servir. Ne pas mélanger avant."]',
true, 'approved', 'Salade complète méditerranéenne'),

(uid, 'Curry de pois chiches express (20 min)', '', 4, 5, 15,
'["2 boîtes de pois chiches","400g de tomates concassées","400ml de lait de coco","1 oignon","2 gousses d''ail","1 c. à soupe de curry en poudre","1 c. à café de curcuma","Coriandre fraîche","Riz pour servir"]',
'["Faire revenir l''oignon et l''ail dans l''huile.","Ajouter le curry et le curcuma. Cuire 1 minute.","Incorporer les tomates et le lait de coco.","Ajouter les pois chiches égouttés.","Mijoter 10-12 minutes jusqu''à sauce épaisse.","Rectifier l''assaisonnement.","Parsemer de coriandre fraîche. Servir avec du riz."]',
true, 'approved', 'Curry végétarien en 20 minutes'),

(uid, 'Croque-monsieur gratiné (10 min)', '', 4, 5, 5,
'["8 tranches de pain de mie","4 tranches de jambon","200g de gruyère râpé","Beurre","Moutarde","Béchamel rapide : 20g beurre, 20g farine, 200ml lait, sel, muscade"]',
'["Préparer la béchamel rapide : faire un roux, ajouter le lait chaud, cuire jusqu''à épaississement.","Beurrer les tranches de pain. Tartiner de moutarde.","Garnir de jambon et gruyère. Fermer le sandwich.","Enduire le dessus de béchamel.","Parsemer de gruyère.","Cuire au four à 200°C 5-7 minutes jusqu''à gratinage.","Servir chaud avec une salade verte."]',
true, 'approved', 'Sandwich chaud gratiné classique'),

(uid, 'Frittata aux légumes (20 min)', '', 4, 5, 15,
'["6 œufs","1 courgette","1 poivron","100g de fromage de chèvre","Basilic","Huile d''olive","Sel, poivre"]',
'["Préchauffer le four à 180°C.","Faire revenir les légumes coupés en dés dans une poêle allant au four.","Battre les œufs avec le sel, le poivre et le basilic.","Verser sur les légumes.","Émietter le fromage de chèvre par-dessus.","Cuire sur le feu 3 minutes puis enfourner 10 minutes.","Couper en parts et servir tiède ou froid."]',
true, 'approved', 'Omelette italienne au four rapide'),

(uid, 'Buddha bowl express (15 min)', '', 2, 10, 5,
'["200g de riz cuit (surgelé ou de la veille)","2 œufs","1 avocat","100g d''edamame","1 carotte","Sauce : sauce soja, huile de sésame, gingembre, miel"]',
'["Réchauffer le riz au micro-ondes.","Faire cuire les œufs mollets 6 minutes.","Râper la carotte.","Trancher l''avocat.","Préparer la sauce en mélangeant tous les ingrédients.","Diviser le riz dans deux bols.","Disposer avocat, carotte, edamame et œuf mollet. Arroser de sauce."]',
true, 'approved', 'Bol complet en 15 minutes'),

(uid, 'Pâtes arrabiata express (15 min)', '', 4, 2, 13,
'["400g de penne","400g de tomates concassées","4 gousses d''ail","1 c. à café de piment rouge","Huile d''olive","Persil plat","Sel"]',
'["Cuire les pâtes dans l''eau salée.","Dans une poêle, faire sauter l''ail émincé dans l''huile d''olive.","Ajouter le piment. Cuire 30 secondes.","Verser les tomates concassées. Saler.","Cuire à feu vif 8 minutes en écrasant les tomates.","Égoutter les pâtes. Mélanger avec la sauce.","Parsemer de persil haché et servir."]',
true, 'approved', 'Pâtes pimentées à l''arrabiata'),

(uid, 'Velouté de légumes du frigo (20 min)', '', 4, 5, 15,
'["4-5 légumes de saison (courgette, carotte, brocoli, épinards, poireaux)","1 litre de bouillon","1 oignon","1 pomme de terre","100ml de crème fraîche","Huile d''olive","Sel, poivre, noix de muscade"]',
'["Couper tous les légumes en morceaux.","Faire revenir l''oignon dans l''huile d''olive.","Ajouter tous les légumes et la pomme de terre.","Verser le bouillon. Porter à ébullition.","Cuire 15 minutes jusqu''à tendreté complète.","Mixer finement. Incorporer la crème fraîche.","Assaisonner. Servir avec du pain grillé."]',
true, 'approved', 'Soupe express anti-gaspillage'),

(uid, 'Riz cantonnais express (15 min)', '', 4, 5, 10,
'["400g de riz cuit (de la veille)","3 œufs","150g de petits pois surgelés","150g de jambon","2 c. à soupe de sauce soja","Huile","Oignons verts"]',
'["Faire chauffer un wok ou grande poêle à feu très vif avec l''huile.","Faire sauter les petits pois et le jambon en dés 2 minutes.","Ajouter le riz froid. Faire sauter en remuant constamment.","Pousser sur le côté. Brouiller les œufs dans l''espace vide.","Mélanger avec le riz quand les œufs sont mi-cuits.","Assaisonner avec la sauce soja.","Parsemer d''oignons verts. Servir immédiatement."]',
true, 'approved', 'Riz sauté rapide style cantonnais'),

(uid, 'Soupe de lentilles express (25 min)', '', 4, 5, 20,
'["300g de lentilles corail","1 oignon","3 gousses d''ail","1 carotte","1 c. à café de cumin","1 c. à café de curcuma","1 litre de bouillon","Jus de citron","Huile d''olive","Coriandre"]',
'["Faire revenir l''oignon, l''ail et la carotte dans l''huile.","Ajouter le cumin et le curcuma. Cuire 1 minute.","Incorporer les lentilles et verser le bouillon.","Cuire 15-18 minutes. Les lentilles fondent d''elles-mêmes.","Mixer partiellement selon la texture souhaitée.","Ajouter le jus de citron. Rectifier l''assaisonnement.","Garnir de coriandre et d''un filet d''huile d''olive."]',
true, 'approved', 'Soupe de lentilles épicée rapide');

END $$;
