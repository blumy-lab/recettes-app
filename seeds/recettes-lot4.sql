-- LOT 4 — Amériques, Afrique subsaharienne, Caraïbes (45 recettes)

DO $$
DECLARE
  uid uuid := '97a98e5c-d29d-4a9f-9d84-0684eef75fe6'::uuid;
BEGIN

-- ═══════════════════════════════════════════════════
-- 🇲🇽 CUISINE MEXICAINE
-- ═══════════════════════════════════════════════════

INSERT INTO recipes (user_id, title, source_url, servings, prep_time, cook_time, ingredients, steps, is_public, moderation_status, user_notes) VALUES

(uid, 'Tacos al pastor', '', 4, 30, 20,
'["600g de porc (épaule)","3 piments ancho séchés","2 piments guajillo","4 gousses d''ail","1 c. à café d''origan","1 c. à café de cumin","3 c. à soupe de vinaigre","1 tranche d''ananas","Tortillas de maïs","Coriandre, oignon, citron vert pour servir"]',
'["Faire tremper les piments séchés 20 minutes dans l''eau chaude.","Mixer piments, ail, épices et vinaigre en une marinade lisse.","Trancher le porc finement, mariner 4 heures minimum.","Faire griller les tranches à la poêle ou au grill.","Faire dorer des morceaux d''ananas à la poêle.","Réchauffer les tortillas sur une poêle sèche.","Garnir de porc, ananas, coriandre et oignon émincé. Servir avec citron vert."]',
true, 'approved', 'Tacos mexicains au porc mariné'),

(uid, 'Guacamole maison', '', 4, 10, 0,
'["3 avocats mûrs","1 tomate","1 oignon rouge","1 piment jalapeño","Jus de 2 citrons verts","Coriandre fraîche","Sel","Chips de maïs pour servir"]',
'["Couper les avocats en deux, retirer le noyau, récupérer la chair.","Écraser grossièrement à la fourchette (garder des morceaux).","Couper la tomate et l''oignon en petits dés.","Hacher finement le jalapeño (retirer les graines pour moins de piquant).","Incorporer tous les ingrédients aux avocats.","Ajouter le jus de citron vert et le sel.","Parsemer de coriandre. Servir immédiatement avec des chips."]',
true, 'approved', 'Sauce avocats mexicaine'),

(uid, 'Enchiladas au poulet', '', 4, 30, 25,
'["8 tortillas de maïs","400g de poulet effiloché","400ml de sauce enchilada (tomates, piments, épices)","200g de cheddar râpé","1 oignon","Crème sure","Coriandre fraîche"]',
'["Faire revenir l''oignon, ajouter le poulet effiloché et la moitié de la sauce enchilada.","Préchauffer le four à 190°C.","Ramollir les tortillas 10 secondes dans une poêle chaude.","Garnir chaque tortilla de poulet, rouler serré.","Disposer dans un plat, couvrir du reste de sauce enchilada.","Parsemer de cheddar râpé.","Cuire 20-25 minutes. Garnir de crème sure et coriandre."]',
true, 'approved', 'Rouleaux mexicains gratinés'),

(uid, 'Chili con carne', '', 6, 15, 60,
'["500g de bœuf haché","400g de haricots rouges cuits","400g de tomates concassées","1 oignon","4 gousses d''ail","2 c. à soupe de poudre de chili","1 c. à café de cumin","1 c. à café de paprika fumé","Sel, poivre","Cheddar, crème sure, coriandre pour servir"]',
'["Faire revenir l''oignon et l''ail dans l''huile.","Ajouter le bœuf haché, faire dorer.","Incorporer les épices, mélanger.","Ajouter les tomates et les haricots. Saler.","Mijoter 45 minutes à feu doux en remuant de temps en temps.","La sauce doit être épaisse et parfumée.","Servir avec du riz, du cheddar râpé et de la crème sure."]',
true, 'approved', 'Ragoût de bœuf mexicain'),

(uid, 'Quesadillas au fromage et poulet', '', 4, 10, 15,
'["8 tortillas de blé","400g de poulet cuit effiloché","200g de cheddar ou mozzarella râpé","1 poivron rouge grillé","1 oignon rouge émincé","Guacamole, crème sure pour servir","Huile"]',
'["Garnir une tortilla de fromage, poulet, poivron et oignon.","Poser une seconde tortilla par-dessus.","Faire chauffer un peu d''huile dans une grande poêle.","Cuire la quesadilla 3 minutes jusqu''à dorure.","Retourner délicatement et cuire encore 2 minutes.","Couper en triangles comme une pizza.","Servir avec guacamole et crème sure."]',
true, 'approved', 'Sandwich mexicain au fromage fondu'),

(uid, 'Mole negro (sauce chocolat-piment)', '', 6, 40, 60,
'["600g de poulet","3 piments mulato séchés","2 piments ancho","2 piments pasilla","50g de chocolat noir","2 tomates","1 oignon","4 gousses d''ail","2 c. à soupe de sésame","Épices : cannelle, clou de girofle, cumin","Bouillon de poulet"]',
'["Faire griller et tremper les piments 20 minutes.","Faire griller les tomates et l''oignon à sec dans une poêle.","Mixer piments, tomates, oignon, ail et épices avec un peu de bouillon.","Faire revenir cette pâte dans l''huile 10 minutes.","Ajouter le bouillon de poulet progressivement.","Incorporer le chocolat noir râpé. Mijoter 30 minutes.","Ajouter le poulet cuit, chauffer 15 minutes. Servir avec du riz."]',
true, 'approved', 'Sauce mexicaine chocolat-piment'),

-- ═══════════════════════════════════════════════════
-- 🇧🇷 CUISINE BRÉSILIENNE
-- ═══════════════════════════════════════════════════

(uid, 'Feijoada brésilienne', '', 6, 30, 120,
'["400g de haricots noirs","300g de porc (épaule)","200g de saucisse fumée","200g de lardons","1 oignon","5 gousses d''ail","2 feuilles de laurier","1 orange","Sel, poivre","Riz blanc, chou émincé, farofa pour servir"]',
'["Faire tremper les haricots noirs une nuit. Égoutter.","Faire revenir les lardons et les viandes coupées en morceaux.","Ajouter l''oignon et l''ail. Faire revenir.","Incorporer les haricots, les feuilles de laurier et l''orange coupée en deux.","Couvrir d''eau, saler. Cuire 2 heures jusqu''à ce que les haricots soient fondants.","Retirer l''orange. Écraser quelques haricots pour épaissir.","Servir avec riz, chou sauté à l''ail et farofa (farine de manioc grillée)."]',
true, 'approved', 'Plat national brésilien'),

(uid, 'Coxinha (croquettes de poulet brésiliennes)', '', 8, 45, 20,
'["400g de poulet cuit effiloché","2 gousses d''ail","1 oignon","Fromage frais","Pâte : 500g farine, 500ml bouillon, sel","Chapelure","Œufs battus","Huile de friture"]',
'["Faire revenir l''oignon et l''ail, ajouter le poulet. Assaisonner. Laisser refroidir.","Mélanger avec le fromage frais.","Préparer la pâte : porter le bouillon à ébullition, verser la farine en pluie en remuant.","Pétrir jusqu''à une pâte homogène. Laisser tiédir.","Former des boules, aplatir, garnir de poulet, refermer en forme de cuisse de poulet.","Passer dans l''œuf battu puis la chapelure.","Frire dans l''huile à 180°C jusqu''à dorure."]',
true, 'approved', 'Croquettes brésiliennes en forme de cuisse'),

(uid, 'Caipirinha', '', 2, 5, 0,
'["1 citron vert","1 c. à soupe de sucre de canne","6 cl de cachaça","Glaçons pilés"]',
'["Couper le citron vert en 8 morceaux.","Placer dans un verre épais avec le sucre.","Écraser avec un pilon pour extraire le jus et les huiles essentielles.","Remplir de glaçons pilés.","Verser la cachaça.","Mélanger vigoureusement.","Servir immédiatement."]',
true, 'approved', 'Cocktail national brésilien'),

(uid, 'Açaï bowl brésilien', '', 2, 10, 0,
'["200g de pulpe d''açaï congelée","1 banane","100ml de lait de coco ou de lait d''amande","Toppings : granola, banane, mangue, noix de coco râpée, miel"]',
'["Sortir l''açaï du congélateur 5 minutes avant.","Mixer l''açaï avec la banane et le lait jusqu''à consistance épaisse de sorbet.","Ne pas trop mixer pour garder la texture.","Verser dans des bols.","Garnir de granola, tranches de banane, morceaux de mangue.","Saupoudrer de noix de coco râpée.","Arroser d''un filet de miel."]',
true, 'approved', 'Bol brésilien à l''açaï'),

-- ═══════════════════════════════════════════════════
-- 🇺🇸 CUISINE AMÉRICAINE
-- ═══════════════════════════════════════════════════

(uid, 'Burger américain maison', '', 4, 20, 15,
'["600g de bœuf haché (20% MG)","4 pains à burger","4 tranches de cheddar","Laitue, tomate, oignon rouge","Cornichons","Sauce : mayonnaise, ketchup, moutarde, relish","Sel, poivre"]',
'["Former 4 steaks de 150g. Saler et poivrer généreusement.","Cuire dans une poêle très chaude 3 minutes par face pour un résultat saignant-rosé.","Poser le cheddar sur le steak, couvrir 1 minute pour le faire fondre.","Toaster les pains à burger légèrement.","Mélanger les ingrédients de la sauce.","Assembler : pain, sauce, laitue, tomate, steak, oignons, cornichons, pain.","Servir immédiatement avec des frites."]',
true, 'approved', 'Burger maison juteux'),

(uid, 'Pancakes américains', '', 4, 10, 15,
'["300g de farine","2 œufs","300ml de lait","2 c. à soupe de sucre","1 c. à café de levure chimique","1 c. à café de bicarbonate","1 pincée de sel","50g de beurre fondu","Sirop d''érable, beurre pour servir"]',
'["Mélanger les ingrédients secs : farine, sucre, levure, bicarbonate et sel.","Dans un autre bol, battre les œufs avec le lait et le beurre fondu.","Incorporer rapidement les liquides aux secs sans trop mélanger (quelques grumeaux sont normaux).","Faire chauffer une poêle anti-adhésive à feu moyen. Beurrer légèrement.","Verser une louche de pâte. Cuire jusqu''aux bulles à la surface (2 min). Retourner, cuire 1 minute.","Répéter avec le reste de la pâte.","Servir en piles avec beurre et sirop d''érable."]',
true, 'approved', 'Pancakes moelleux du dimanche'),

(uid, 'Mac and cheese maison', '', 4, 10, 25,
'["400g de macaroni","500ml de lait","50g de beurre","50g de farine","200g de cheddar râpé","100g de gruyère râpé","Sel, poivre, paprika, moutarde en poudre","Chapelure pour gratiner"]',
'["Cuire les macaroni al dente. Égoutter.","Faire un roux : beurre fondu + farine, cuire 2 minutes.","Verser le lait progressivement en fouettant. Porter à ébullition.","Hors du feu, ajouter les fromages, la moutarde, le paprika. Bien mélanger.","Incorporer les macaroni à la sauce.","Verser dans un plat, parsemer de chapelure.","Gratiner 15 minutes à 200°C."]',
true, 'approved', 'Macaroni au fromage américain'),

(uid, 'Cheesecake new-yorkais', '', 8, 30, 60,
'["200g de biscuits Graham (ou spéculoos)","80g de beurre fondu","600g de cream cheese","200g de sucre","3 œufs","200ml de crème sure","1 c. à café de vanille","1 c. à soupe de farine","Coulis de fruits pour servir"]',
'["Mixer les biscuits en poudre, mélanger avec le beurre fondu. Tasser dans un moule à fond amovible.","Préchauffer le four à 160°C (cuisson douce).","Battre le cream cheese avec le sucre jusqu''à lisse.","Incorporer les œufs un à un, puis la crème sure, la farine et la vanille.","Verser sur la base biscuitée.","Cuire 55-60 minutes. Le centre doit être légèrement tremblotant.","Laisser refroidir dans le four éteint. Réfrigérer une nuit. Servir avec coulis."]',
true, 'approved', 'Cheesecake américain classique'),

(uid, 'Pulled pork (effiloché de porc)', '', 6, 20, 240,
'["1,5 kg d''épaule de porc","2 c. à soupe de paprika fumé","1 c. à soupe de cassonade","1 c. à café de cumin","1 c. à café d''ail en poudre","1 c. à café d''oignon en poudre","Sel, poivre","Sauce BBQ","Pains à burger"]',
'["Mélanger toutes les épices. Enduire généreusement le porc.","Filmer et réfrigérer une nuit.","Cuire au four à 140°C pendant 4 heures (ou en cocotte mijoteuse 8h).","La viande doit être très tendre et se défaire.","Effilocher avec deux fourchettes.","Mélanger avec la sauce BBQ.","Servir dans des pains à burger avec coleslaw."]',
true, 'approved', 'Porc effiloché américain'),

-- ═══════════════════════════════════════════════════
-- 🌴 CUISINE CARIBÉENNE
-- ═══════════════════════════════════════════════════

(uid, 'Poulet jerk jamaïcain', '', 4, 20, 45,
'["1 poulet coupé en morceaux","3 piments scotch bonnet (ou habanero)","4 gousses d''ail","2 oignons verts","1 c. à soupe de sauce soja","1 c. à soupe de vinaigre","Thym frais","Cannelle, noix de muscade, allspice","Jus de citron vert","Huile"]',
'["Mixer tous les ingrédients de la marinade.","Entailler profondément la viande, enduire généreusement de marinade.","Mariner au minimum 4 heures, idéalement une nuit.","Préchauffer le four à 200°C ou préparer le grill.","Cuire 40-45 minutes au four ou 30 minutes au grill en retournant.","La peau doit être bien colorée et légèrement carbonisée.","Servir avec du riz aux pois et des tranches d''ananas grillées."]',
true, 'approved', 'Poulet épicé jamaïcain'),

(uid, 'Riz aux pois (Rice and Peas)', '', 4, 10, 30,
'["300g de riz long","400g de haricots rouges cuits","400ml de lait de coco","400ml d''eau","3 gousses d''ail","2 oignons verts","1 branche de thym","1 piment scotch bonnet entier (ne pas percer)","Sel"]',
'["Mettre le riz, les haricots, le lait de coco et l''eau dans une casserole.","Ajouter l''ail émincé, les oignons verts, le thym et le piment entier.","Saler et porter à ébullition.","Réduire le feu, couvrir et cuire 20 minutes.","Retirer le piment entier (il donne le parfum sans la chaleur).","Mélanger délicatement à la fourchette.","Servir en accompagnement du poulet jerk."]',
true, 'approved', 'Riz jamaïcain au lait de coco'),

(uid, 'Accras de morue', '', 6, 30, 20,
'["300g de morue salée dessalée","200g de farine","2 œufs","150ml de lait","1 oignon","2 gousses d''ail","Piment vert","Persil, ciboulette","Levure chimique","Huile de friture"]',
'["Dessaler la morue 24h à l''eau froide. Effilocher.","Préparer la pâte : mélanger farine, œufs et lait jusqu''à consistance lisse.","Ajouter l''oignon, l''ail et les herbes finement hachés.","Incorporer la morue effilochée et le piment.","Ajouter la levure. La pâte doit être épaisse.","Faire frire des cuillères de pâte dans l''huile chaude 3-4 minutes.","Égoutter sur papier absorbant. Servir chaud."]',
true, 'approved', 'Beignets de morue antillais'),

(uid, 'Colombo de poulet antillais', '', 4, 20, 50,
'["1 poulet coupé en morceaux","2 c. à soupe de poudre de colombo","1 aubergine","2 courgettes","3 tomates","2 oignons","4 gousses d''ail","1 morceau de gingembre","1 piment antillais","2 c. à soupe d''huile","Sel"]',
'["Faire mariner le poulet avec la poudre de colombo, l''ail et le gingembre râpé.","Faire dorer les morceaux de poulet dans l''huile.","Ajouter les oignons émincés et le piment.","Incorporer les tomates concassées.","Ajouter l''aubergine et les courgettes coupées en cubes.","Couvrir d''un peu d''eau et mijoter 35 minutes.","Servir avec du riz blanc ou des légumes racines."]',
true, 'approved', 'Curry antillais parfumé'),

(uid, 'Plantain frit (banane plantain)', '', 4, 5, 10,
'["2 bananes plantains mûres (peau jaune-noire)","3 c. à soupe d''huile","Sel (facultatif)"]',
'["Éplucher les bananes plantains.","Couper en tranches diagonales de 1 cm.","Faire chauffer l''huile dans une poêle à feu moyen.","Faire dorer les tranches 2-3 minutes par face jusqu''à caramélisation.","Les plantains doivent être dorés et fondants à l''intérieur.","Égoutter sur papier absorbant.","Servir chaud en accompagnement ou en apéritif avec une sauce pimentée."]',
true, 'approved', 'Banane plantain caramélisée'),

-- ═══════════════════════════════════════════════════
-- 🌍 AFRIQUE SUBSAHARIENNE
-- ═══════════════════════════════════════════════════

(uid, 'Poulet yassa sénégalais', '', 4, 30, 50,
'["1 poulet coupé en morceaux","4 oignons","4 citrons (jus)","3 gousses d''ail","2 c. à soupe de moutarde","2 piments","Thym, laurier","3 c. à soupe d''huile","Sel, poivre"]',
'["Faire mariner le poulet dans le jus de citron, ail, moutarde, thym et piment pendant 2 heures.","Égoutter le poulet, faire griller au four ou à la poêle pour colorer.","Faire caraméliser les oignons émincés dans l''huile à feu doux 20 minutes.","Ajouter la marinade aux oignons. Cuire 5 minutes.","Remettre le poulet dans la cocotte.","Couvrir et mijoter 25 minutes.","Servir avec du riz blanc."]',
true, 'approved', 'Poulet au citron sénégalais'),

(uid, 'Thieboudienne (riz au poisson sénégalais)', '', 6, 40, 60,
'["600g de poisson ferme (capitaine ou mérou)","400g de riz","3 tomates","1 oignon","3 gousses d''ail","Piment","Concentré de tomate","Carottes, aubergine, chou","Persil, coriandre","Huile d''arachide","Sel, poivre"]',
'["Farcir le poisson de persil, ail et piment. Faire dorer dans l''huile.","Faire revenir les oignons, ajouter les tomates et le concentré.","Ajouter les légumes coupés et le poisson. Couvrir d''eau, saler.","Cuire 30 minutes. Retirer poisson et légumes.","Cuire le riz dans le bouillon de cuisson.","Laisser le riz accrocher légèrement en fin de cuisson (la croûte est appréciée).","Dresser le riz, poser le poisson et les légumes par-dessus."]',
true, 'approved', 'Plat national sénégalais'),

(uid, 'Mafé (ragoût d''arachide)', '', 4, 20, 60,
'["600g de bœuf ou agneau","200g de pâte d''arachide (beurre de cacahuète)","400g de tomates concassées","2 oignons","3 gousses d''ail","2 carottes","2 patates douces","1 piment","Sel, poivre","Huile d''arachide"]',
'["Faire dorer la viande dans l''huile. Réserver.","Faire revenir les oignons et l''ail.","Ajouter les tomates, cuire 5 minutes.","Délayer le beurre de cacahuète dans 500ml d''eau chaude, verser sur la sauce.","Remettre la viande, ajouter carottes, patates douces et piment.","Mijoter 45 minutes en remuant régulièrement pour éviter que ça n''accroche.","Servir avec du riz blanc."]',
true, 'approved', 'Ragoût africain à la cacahuète'),

(uid, 'Jollof rice nigérian', '', 6, 20, 50,
'["400g de riz long","400g de tomates concassées","2 poivrons rouges","2 oignons","4 gousses d''ail","1 morceau de gingembre","1 piment","1 litre de bouillon de poulet","Curry en poudre","Thym","Sel, huile"]',
'["Mixer tomates, poivrons, oignons, ail, gingembre et piment.","Faire revenir cette purée dans l''huile 20 minutes jusqu''à épaississement.","Ajouter le curry, le thym et le bouillon.","Porter à ébullition, ajouter le riz.","Cuire à feu doux couvert 30 minutes.","Le riz doit absorber tout le liquide et légèrement accrocher au fond (la fumée party).","Mélanger délicatement et servir avec du poulet grillé."]',
true, 'approved', 'Riz tomate emblématique d''Afrique de l''Ouest'),

(uid, 'Injera et doro wot éthiopien', '', 4, 30, 60,
'["Pour le doro wot : 1 poulet, 6 œufs durs, 4 oignons, 4 c. à soupe de berbéré, beurre niter kibbeh, ail, gingembre","Pour l''injera (simplifié) : 300g de farine de tef ou blé, 300ml d''eau gazeuse, sel"]',
'["Injera : mélanger la farine avec l''eau gazeuse et le sel. Cuire des grandes crêpes très fines dans une poêle chaude. Elles doivent avoir des petits trous (texture éponge).","Doro wot : caraméliser les oignons à sec 20 minutes sans huile. Ajouter le beurre épicé, l''ail et le gingembre.","Incorporer le berbéré (mélange d''épices éthiopiennes).","Ajouter le poulet en morceaux. Verser un peu d''eau.","Mijoter 40 minutes. Ajouter les œufs durs les 10 dernières minutes.","Servir le doro wot sur les injeras.","Manger avec les doigts en utilisant l''injera pour saisir le ragoût."]',
true, 'approved', 'Ragoût de poulet éthiopien'),

(uid, 'Alloco (bananes plantains frites ivoiriennes)', '', 4, 10, 15,
'["3 bananes plantains très mûres","Huile de palme ou huile végétale","1 piment","1 oignon","Sel"]',
'["Éplucher les bananes plantains très mûres (peau noire).","Couper en tronçons ou en lamelles.","Faire chauffer l''huile à 180°C.","Faire frire les bananes jusqu''à caramélisation dorée.","Égoutter sur du papier absorbant.","Faire revenir l''oignon et le piment haché séparément.","Servir l''alloco avec la sauce oignon-piment et du poulet grillé."]',
true, 'approved', 'Street food ivoirien incontournable'),

(uid, 'Egusi soup (soupe aux graines de courge)', '', 4, 20, 40,
'["200g de graines d''egusi (ou courge)","300g de viande de bœuf ou de poulet","200g de feuilles de légumes (épinards ou amarante)","2 tomates","1 oignon","2 c. à soupe d''huile de palme","Piment","Sel","Cube de bouillon"]',
'["Mixer les graines d''egusi en poudre grossière.","Faire revenir l''oignon dans l''huile de palme.","Ajouter les tomates mixées et le piment. Cuire 10 minutes.","Incorporer la viande préalablement cuite, le bouillon et l''egusi.","Mélanger en continu pour éviter les grumeaux.","Cuire 20 minutes à feu moyen.","Ajouter les feuilles de légumes les 5 dernières minutes. Servir avec du gari ou de l''eba."]',
true, 'approved', 'Soupe nigériane aux graines de courge'),

(uid, 'Bobotie sud-africain', '', 4, 20, 50,
'["500g de bœuf ou agneau haché","1 oignon","2 gousses d''ail","2 c. à soupe de curry","1 c. à soupe de curcuma","2 c. à soupe de chutney de mangue","50g de raisins secs","50g d''amandes effilées","Appareil : 3 œufs, 300ml de lait","Sel, poivre","Feuilles de laurier"]',
'["Faire revenir l''oignon et l''ail. Ajouter la viande hachée.","Incorporer curry, curcuma, chutney, raisins et amandes. Saler.","Préchauffer le four à 180°C.","Verser la viande dans un plat à gratin.","Battre les œufs avec le lait, saler.","Verser l''appareil sur la viande. Poser les feuilles de laurier.","Cuire 40 minutes jusqu''à prise et dorure. Servir avec du riz au curcuma."]',
true, 'approved', 'Gratin de viande épicé sud-africain');

END $$;
