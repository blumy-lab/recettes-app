-- LOT 3 — Cuisine Asiatique : Chine, Japon, Inde, Thaïlande, Vietnam, Corée (55 recettes)

DO $$
DECLARE
  uid uuid := '97a98e5c-d29d-4a9f-9d84-0684eef75fe6'::uuid;
BEGIN

-- ═══════════════════════════════════════════════════
-- 🇨🇳 CUISINE CHINOISE
-- ═══════════════════════════════════════════════════

INSERT INTO recipes (user_id, title, source_url, servings, prep_time, cook_time, ingredients, steps, is_public, moderation_status, user_notes) VALUES

(uid, 'Porc laqué à la cantonaise', '', 4, 20, 40,
'["600g de filet de porc","3 c. à soupe de sauce hoisin","2 c. à soupe de sauce soja","2 c. à soupe de miel","1 c. à soupe de vin de riz Shaoxing","1 c. à café d''huile de sésame","1 c. à café de cinq-épices","Colorant rouge (facultatif)"]',
'["Mélanger tous les ingrédients de la marinade.","Badigeonner le porc et laisser mariner 4 heures au réfrigérateur.","Préchauffer le four à 200°C. Placer le porc sur une grille avec un plat en dessous.","Cuire 20 minutes. Retourner, badigeonner de marinade.","Cuire encore 20 minutes en badigeonnant régulièrement.","Les dernières 5 minutes, passer sous le grill pour laquer.","Laisser reposer 10 minutes avant de trancher."]',
true, 'approved', 'Char siu cantonais'),

(uid, 'Ravioles chinoises vapeur (Dim Sum)', '', 4, 45, 15,
'["300g de porc haché","150g de crevettes hachées","2 c. à soupe de sauce soja","1 c. à soupe d''huile de sésame","1 morceau de gingembre râpé","2 oignons verts émincés","Sel, poivre","Feuilles de wonton"]',
'["Mélanger le porc haché, les crevettes, la sauce soja, l''huile de sésame, le gingembre et les oignons verts.","Assaisonner et bien mélanger.","Déposer une cuillère de farce au centre de chaque feuille de wonton.","Humidifier les bords, plier et pincer pour sceller.","Cuire à la vapeur 12-15 minutes.","Servir chaud avec de la sauce soja et du gingembre mariné."]',
true, 'approved', 'Dumplings vapeur cantonais'),

(uid, 'Canard à la pékinoise simplifié', '', 4, 30, 90,
'["1 canard entier","3 c. à soupe de miel","2 c. à soupe de sauce soja","1 c. à soupe de vinaigre de riz","Cinq-épices","Crêpes mandarin (ou galettes)","Sauce hoisin","Concombre, oignons verts"]',
'["Blanchir le canard 2 minutes à l''eau bouillante. Sécher soigneusement.","Mélanger miel, sauce soja, vinaigre et cinq-épices. Badigeonner le canard.","Laisser sécher à l''air 4 heures ou une nuit au réfrigérateur.","Cuire au four à 200°C pendant 1h30 en retournant à mi-cuisson.","Laisser reposer, puis trancher la peau croustillante et la viande.","Réchauffer les crêpes vapeur.","Servir avec sauce hoisin, concombre et oignons verts."]',
true, 'approved', 'Version simplifiée du canard laqué'),

(uid, 'Soupe wonton', '', 4, 30, 15,
'["200g de porc haché","100g de crevettes hachées","20 feuilles de wonton","1 litre de bouillon de poulet","2 c. à soupe de sauce soja","1 c. à café d''huile de sésame","Oignons verts","Gingembre frais","Sel, poivre"]',
'["Mélanger le porc, les crevettes, une partie de la sauce soja, le gingembre et le sésame.","Former les wontons : déposer la farce, humidifier les bords, replier en triangle puis joindre les coins.","Porter le bouillon à ébullition avec le reste de sauce soja.","Cuire les wontons dans le bouillon 5-7 minutes.","Ils sont prêts quand ils remontent à la surface.","Verser dans des bols avec le bouillon.","Garnir d''oignons verts et d''un filet d''huile de sésame."]',
true, 'approved', 'Soupe aux ravioles chinoises'),

(uid, 'Riz sauté aux légumes et œuf', '', 4, 10, 15,
'["400g de riz cuit refroidi","3 œufs","150g de petits pois","2 carottes en dés","3 oignons verts","3 c. à soupe de sauce soja","2 c. à soupe d''huile","2 gousses d''ail","Sel, poivre"]',
'["Chauffer l''huile dans un wok à feu très vif.","Faire sauter l''ail, ajouter les carottes et les petits pois.","Pousser les légumes sur le côté, brouiller les œufs dans le wok.","Ajouter le riz froid, mélanger vigoureusement à feu vif.","Assaisonner avec la sauce soja, sel et poivre.","Ajouter les oignons verts.","Servir immédiatement."]',
true, 'approved', 'Riz cantonais végétarien'),

(uid, 'Bœuf au brocoli sauce huître', '', 4, 15, 15,
'["400g de bœuf (rumsteck)","300g de brocoli","3 c. à soupe de sauce huître","2 c. à soupe de sauce soja","1 c. à café de maïzena","1 c. à café de sucre","2 gousses d''ail","Gingembre","Huile de sésame","Huile pour wok"]',
'["Trancher le bœuf finement contre le fil. Mariner avec sauce soja et maïzena 15 minutes.","Blanchir le brocoli 2 minutes à l''eau bouillante. Égoutter.","Mélanger sauce huître, sucre et un peu d''eau pour la sauce.","Faire saisir le bœuf à feu vif dans le wok. Réserver.","Dans le même wok, faire revenir l''ail et le gingembre.","Ajouter le brocoli et la sauce. Remettre le bœuf.","Mélanger rapidement. Servir avec du riz blanc."]',
true, 'approved', 'Classique sino-américain'),

(uid, 'Mapo tofu', '', 4, 10, 20,
'["400g de tofu soyeux","200g de porc haché","2 c. à soupe de pâte de piment douban","1 c. à soupe de sauce soja","1 c. à café de poivre du Sichuan","3 gousses d''ail","Gingembre","Bouillon","Maïzena","Huile","Oignons verts"]',
'["Couper le tofu en cubes de 2 cm. Blanchir délicatement dans l''eau salée 3 minutes.","Faire revenir le porc haché dans l''huile chaude.","Ajouter l''ail, le gingembre et la pâte de piment douban.","Verser le bouillon, porter à ébullition.","Ajouter le tofu délicatement.","Épaissir avec la maïzena délayée.","Servir parsemé de poivre du Sichuan et d''oignons verts."]',
true, 'approved', 'Tofu épicé du Sichuan'),

-- ═══════════════════════════════════════════════════
-- 🇯🇵 CUISINE JAPONAISE
-- ═══════════════════════════════════════════════════

(uid, 'Ramen au miso', '', 4, 20, 30,
'["4 portions de nouilles ramen","1 litre de bouillon de poulet","4 c. à soupe de pâte de miso","200g de porc chashu ou poulet effiloché","4 œufs mollets marinés","100g de maïs en grains","2 oignons verts","Algues nori","Gingembre","Sésame"]',
'["Porter le bouillon à ébullition. Incorporer le miso en fouettant (ne pas faire bouillir après).","Cuire les nouilles selon les instructions. Égoutter.","Préparer les garnitures : trancher le chashu, couper les œufs en deux.","Répartir les nouilles dans les bols.","Verser le bouillon miso chaud.","Garnir de chashu, œuf mollet, maïs, oignons verts et nori.","Parsemer de sésame et servir immédiatement."]',
true, 'approved', 'Bol de ramen japonais'),

(uid, 'Gyoza (ravioles japonaises)', '', 4, 40, 15,
'["300g de porc haché","200g de chou chinois","2 oignons verts","2 gousses d''ail","1 morceau de gingembre râpé","2 c. à soupe de sauce soja","1 c. à café d''huile de sésame","Sel, poivre","30 feuilles de gyoza","Huile pour cuisson"]',
'["Saler le chou émincé, laisser 10 minutes, essorer bien.","Mélanger porc, chou, oignons verts, ail, gingembre, sauce soja et sésame.","Déposer une cuillère de farce au centre de chaque feuille.","Humidifier le bord, plier en demi-lune et plisser pour sceller.","Chauffer l''huile dans une poêle, disposer les gyoza.","Faire dorer le fond 2 minutes, puis verser 100ml d''eau et couvrir.","Cuire 5 minutes jusqu''à évaporation. Servir avec sauce soja-vinaigre de riz."]',
true, 'approved', 'Ravioles japonaises croustillantes'),

(uid, 'Teriyaki de poulet', '', 4, 10, 20,
'["4 filets de poulet","4 c. à soupe de sauce soja","2 c. à soupe de mirin","2 c. à soupe de saké (ou vin blanc)","2 c. à soupe de sucre","Huile","Sésame et oignons verts pour garnir"]',
'["Mélanger sauce soja, mirin, saké et sucre pour la sauce teriyaki.","Faire chauffer l''huile dans une poêle.","Cuire les filets de poulet côté peau 5 minutes jusqu''à dorure.","Retourner et cuire encore 5 minutes.","Vider l''excès de gras. Verser la sauce teriyaki dans la poêle.","Laisser réduire et napper le poulet pendant 3-4 minutes en retournant.","Trancher, parsemer de sésame et servir avec du riz."]',
true, 'approved', 'Poulet teriyaki japonais'),

(uid, 'Miso soup', '', 4, 5, 10,
'["800ml de dashi (ou bouillon de légumes)","3 c. à soupe de pâte de miso","150g de tofu soyeux","2 c. à soupe d''algues wakame séchées","2 oignons verts"]',
'["Réhydrater les algues wakame dans l''eau froide 5 minutes.","Porter le dashi à frémissement (pas à ébullition).","Couper le tofu en petits cubes.","Délayer le miso dans une petite louche de dashi chaud.","Incorporer le miso délayé dans le dashi sans faire bouillir.","Ajouter les algues et le tofu.","Servir immédiatement dans des bols, garnir d''oignons verts."]',
true, 'approved', 'Soupe miso traditionnelle'),

(uid, 'Katsu curry japonais', '', 4, 20, 30,
'["4 filets de porc ou poulet","100g de chapelure panko","2 œufs","Farine","Huile de friture","2 blocs de curry japonais (S&B ou Vermont)","2 pommes de terre","2 carottes","1 oignon","600ml d''eau","Riz japonais cuit"]',
'["Paner les filets : farine, œuf battu, panko. Réfrigérer 15 minutes.","Faire revenir l''oignon en dés. Ajouter pommes de terre et carottes.","Verser l''eau, cuire 15 minutes. Dissoudre les blocs de curry. Mijoter 10 minutes.","Faire frire les escalopes panées 4 minutes par face. Égoutter.","Trancher les escalopes en lanières.","Servir le riz dans un bol, napper de curry, poser le katsu.","Accompagner de chou émincé."]',
true, 'approved', 'Curry japonais au porc pané'),

(uid, 'Onigiri (boulettes de riz)', '', 4, 20, 0,
'["400g de riz japonais cuit chaud","1 c. à café de sel","Garnitures : thon mayo, saumon, prune umeboshi","Algues nori en bandes"]',
'["Saler légèrement le riz encore chaud et mélanger.","Humidifier les mains avec de l''eau salée pour éviter que le riz colle.","Prendre une poignée de riz dans la paume.","Creuser un nid au centre et déposer la garniture.","Refermer le riz par-dessus et façonner en triangle ou boule.","Serrer fermement pour que l''onigiri tienne.","Entourer de bandes de nori. Servir aussitôt ou emballer pour emporter."]',
true, 'approved', 'Boulettes de riz japonaises'),

-- ═══════════════════════════════════════════════════
-- 🇮🇳 CUISINE INDIENNE
-- ═══════════════════════════════════════════════════

(uid, 'Butter chicken (murgh makhani)', '', 4, 20, 40,
'["600g de poulet","200ml de yaourt","200ml de crème","400g de tomates concassées","2 oignons","4 gousses d''ail","1 morceau de gingembre","2 c. à soupe de beurre","Garam masala","Cumin","Curcuma","Paprika","Sel"]',
'["Mariner le poulet dans le yaourt avec les épices, l''ail et le gingembre. 2 heures minimum.","Faire dorer le poulet. Réserver.","Faire revenir les oignons dans le beurre jusqu''à brun doré.","Ajouter l''ail, le gingembre et les tomates. Mijoter 15 minutes.","Mixer la sauce pour la lisser.","Remettre sur le feu, ajouter le poulet et la crème.","Mijoter 15 minutes. Servir avec du naan ou du riz basmati."]',
true, 'approved', 'Curry indien au beurre'),

(uid, 'Dal (lentilles indiennes)', '', 4, 10, 30,
'["300g de lentilles corail","1 oignon","3 gousses d''ail","1 morceau de gingembre","400g de tomates concassées","1 c. à café de cumin","1 c. à café de curcuma","1 c. à café de garam masala","1 c. à café de graines de moutarde","Huile","Sel","Coriandre fraîche"]',
'["Cuire les lentilles dans l''eau salée 20 minutes jusqu''à fondantes.","Faire chauffer l''huile, faire sauter les graines de moutarde jusqu''à sautillement.","Ajouter l''oignon, l''ail et le gingembre râpé.","Incorporer le cumin, curcuma et garam masala.","Ajouter les tomates, cuire 10 minutes.","Incorporer les lentilles cuites, mélanger et chauffer.","Servir avec du riz ou du naan, parsemer de coriandre."]',
true, 'approved', 'Soupe de lentilles indienne'),

(uid, 'Naan au beurre', '', 6, 20, 15,
'["500g de farine","1 sachet de levure","250ml de lait tiède","150g de yaourt","2 c. à soupe d''huile","1 c. à café de sel","Beurre et ail pour garnir"]',
'["Dissoudre la levure dans le lait tiède avec une pincée de sucre.","Mélanger farine, sel, yaourt, huile et le lait avec levure.","Pétrir 8 minutes. Laisser lever 1h30.","Diviser en 6 boules. Étaler en ovale.","Cuire dans une poêle très chaude (ou un tawa) 2 minutes par face.","Le naan doit gonfler et avoir des taches brunes.","Badigeonner de beurre à l''ail fondu à la sortie."]',
true, 'approved', 'Pain indien à la poêle'),

(uid, 'Saag paneer (épinards fromage)', '', 4, 15, 30,
'["300g de paneer (ou fromage à griller)","500g d''épinards frais","1 oignon","3 gousses d''ail","1 morceau de gingembre","200ml de crème","1 c. à café de cumin","1 c. à café de garam masala","Beurre","Sel"]',
'["Faire dorer les cubes de paneer dans le beurre. Réserver.","Faire revenir l''oignon, l''ail et le gingembre.","Ajouter le cumin et le garam masala.","Incorporer les épinards, cuire jusqu''à wilting complet.","Mixer la sauce aux épinards.","Remettre sur feu doux, ajouter le paneer et la crème.","Mijoter 10 minutes. Servir avec du riz ou du naan."]',
true, 'approved', 'Curry indien épinards-fromage'),

(uid, 'Samosa au bœuf', '', 6, 40, 20,
'["400g de bœuf haché","2 pommes de terre cuites en dés","1 oignon","3 gousses d''ail","1 c. à café de cumin","1 c. à café de coriandre en poudre","Piment","Coriandre fraîche","Pâte : 300g farine, eau, sel, huile","Huile de friture"]',
'["Préparer la pâte : mélanger farine, sel, huile et eau. Reposer 30 minutes.","Faire revenir l''oignon, l''ail et le bœuf avec toutes les épices.","Ajouter les pommes de terre et la coriandre fraîche. Refroidir.","Diviser la pâte, étaler en disques. Couper en demi-cercles.","Former des cônes, remplir de farce, sceller avec de l''eau.","Frire dans l''huile chaude jusqu''à dorure.","Servir avec du chutney à la menthe."]',
true, 'approved', 'Chaussons indiens frits'),

(uid, 'Biryani de poulet', '', 6, 30, 60,
'["600g de poulet","400g de riz basmati","2 oignons","4 gousses d''ail","1 morceau de gingembre","200ml de yaourt","1 pincée de safran","1 c. à café de garam masala","Cannelle, cardamome, clou de girofle","Huile ou ghee","Sel","Menthe fraîche"]',
'["Mariner le poulet avec yaourt, ail, gingembre et épices 2 heures.","Faire dorer les oignons jusqu''à caramélisation profonde. Réserver la moitié.","Faire dorer le poulet mariné avec la moitié des oignons.","Cuire le riz basmati aux 3/4. Égoutter.","Dans une grande casserole, alterner riz et poulet en couches.","Dissoudre le safran dans un peu d''eau chaude, arroser le riz.","Couvrir hermétiquement et cuire à feu très doux 25 minutes (dum). Garnir de menthe et oignons frits."]',
true, 'approved', 'Riz parfumé indien'),

-- ═══════════════════════════════════════════════════
-- 🇹🇭 CUISINE THAÏLANDAISE
-- ═══════════════════════════════════════════════════

(uid, 'Pad thaï', '', 4, 20, 15,
'["300g de nouilles de riz larges","300g de crevettes ou poulet","3 œufs","100g de germes de soja","3 c. à soupe de sauce fish (nuoc-mâm)","2 c. à soupe de sauce tamarin","1 c. à soupe de sucre de palme","3 oignons verts","50g de cacahuètes grillées","Citron vert","Piment"]',
'["Faire tremper les nouilles dans l''eau chaude 20 minutes. Égoutter.","Mélanger la sauce tamarin, le fish sauce et le sucre de palme.","Faire sauter les crevettes ou le poulet à feu vif. Réserver.","Brouiller les œufs dans le wok.","Ajouter les nouilles et la sauce, mélanger vigoureusement.","Incorporer les germes de soja et les protéines réservées.","Servir avec cacahuètes, oignons verts, citron vert et piment."]',
true, 'approved', 'Plat thaïlandais incontournable'),

(uid, 'Curry vert thaïlandais', '', 4, 15, 25,
'["600g de poulet","400ml de lait de coco","2 c. à soupe de pâte de curry vert","200g d''aubergines thaï","100g de haricots verts","Feuilles de basilic thaï","2 c. à soupe de fish sauce","1 c. à soupe de sucre de palme","Feuilles de combava"]',
'["Faire chauffer une cuillère de lait de coco dans un wok.","Ajouter la pâte de curry vert, faire revenir 2 minutes.","Verser le reste du lait de coco. Porter à ébullition.","Ajouter le poulet en morceaux, les aubergines et les haricots.","Assaisonner avec le fish sauce et le sucre de palme.","Cuire 15-20 minutes à feu moyen.","Terminer avec les feuilles de basilic et de combava. Servir avec du jasmin."]',
true, 'approved', 'Curry vert au lait de coco'),

(uid, 'Tom kha gaï (soupe lait de coco poulet)', '', 4, 15, 20,
'["600g de cuisses de poulet désossées","400ml de lait de coco","500ml de bouillon de poulet","3 tiges de citronnelle","4 feuilles de combava","1 morceau de galangal","200g de champignons","3 c. à soupe de jus de citron vert","2 c. à soupe de fish sauce","Piment","Coriandre fraîche"]',
'["Couper le poulet en morceaux. Écraser la citronnelle et le galangal.","Porter le bouillon avec le lait de coco, la citronnelle, le galangal et les feuilles de combava à frémissement.","Ajouter le poulet et les champignons.","Cuire 15 minutes à feu doux.","Assaisonner avec le fish sauce et le jus de citron vert.","Ajuster le piment selon le goût.","Servir parsemé de coriandre fraîche."]',
true, 'approved', 'Soupe thaïe au lait de coco'),

(uid, 'Larb de porc thaïlandais', '', 4, 15, 15,
'["500g de porc haché","4 c. à soupe de jus de citron vert","3 c. à soupe de fish sauce","2 c. à soupe de riz grillé en poudre","1 c. à café de piment rouge séché","Menthe fraîche","Coriandre fraîche","Oignons verts","Échalotes"]',
'["Faire griller une cuillère à soupe de riz à sec dans une poêle jusqu''à doré. Mixer en poudre.","Cuire le porc haché à sec dans une poêle jusqu''à cuit. Laisser tiédir.","Mélanger le porc avec le jus de citron vert et le fish sauce.","Ajouter le piment, le riz en poudre et les échalotes émincées.","Incorporer la menthe et la coriandre fraîches.","Ajuster l''assaisonnement.","Servir tiède avec du riz gluant ou des feuilles de laitue."]',
true, 'approved', 'Salade de viande hachée thaïe'),

-- ═══════════════════════════════════════════════════
-- 🇻🇳 CUISINE VIETNAMIENNE
-- ═══════════════════════════════════════════════════

(uid, 'Pho bo (soupe de bœuf)', '', 4, 30, 180,
'["500g de bœuf (gîte ou paleron)","200g de bœuf dans le filet (cru, tranché fin)","1 kg d''os à moelle","3 oignons","1 morceau de gingembre","5 étoiles de badiane","3 clous de girofle","1 bâton de cannelle","400g de nouilles de riz","Fish sauce","Germes de soja, basilic thaï, citron vert, piment pour servir"]',
'["Faire griller les oignons et le gingembre directement sur la flamme jusqu''à noircir. Rincer.","Blanchir les os 10 minutes, rincer soigneusement.","Cuire les os dans 2 litres d''eau avec les oignons, gingembre et épices pendant 2-3 heures.","Filtrer le bouillon, assaisonner avec le fish sauce.","Cuire le bœuf gîte dans le bouillon, trancher finement.","Cuire les nouilles. Répartir dans les bols avec les viandes.","Verser le bouillon bouillant. Servir avec les garnitures fraîches."]',
true, 'approved', 'Soupe nationale vietnamienne'),

(uid, 'Rouleaux de printemps frais', '', 4, 30, 0,
'["8 galettes de riz","100g de vermicelles de riz","200g de crevettes cuites","100g de porc char siu","1 carotte râpée","1 concombre en julienne","Laitue, menthe, coriandre","Sauce : 3 c. hoisin, 1 c. beurre de cacahuète, eau, piment"]',
'["Cuire les vermicelles selon les instructions. Refroidir.","Préparer toutes les garnitures.","Préparer la sauce en mélangeant tous les ingrédients.","Tremper une galette de riz dans l''eau tiède 30 secondes.","La poser sur un plan de travail, disposer les garnitures dans le bas.","Rouler en serrant bien, replier les côtés à mi-chemin.","Servir immédiatement avec la sauce."]',
true, 'approved', 'Rouleaux vietnamiens frais'),

(uid, 'Bun bo hue (soupe épicée)', '', 4, 30, 60,
'["400g de bœuf en tranches","200g de porc","400g de nouilles rondes","1 tige de citronnelle","1 morceau de galangal","2 c. à soupe de pâte de crevette","1 c. à soupe de piment","Fish sauce","Oignons verts, coriandre","Germes de soja, citron vert"]',
'["Porter 1,5 litre d''eau à ébullition avec la citronnelle et le galangal.","Ajouter le bœuf et le porc. Cuire 30 minutes.","Retirer les viandes, trancher finement. Filtrer le bouillon.","Assaisonner le bouillon avec la pâte de crevette, le piment et le fish sauce.","Cuire les nouilles séparément. Égoutter.","Répartir nouilles et viandes dans les bols.","Verser le bouillon chaud et garnir d''herbes fraîches."]',
true, 'approved', 'Soupe épicée de Hué'),

(uid, 'Bánh mì', '', 4, 20, 15,
'["4 baguettes vietnamiennes","300g de porc rôti ou pâté de foie","100g de jambon","Carottes et daikon marinés au vinaigre","Concombre en lamelles","Piment frais","Coriandre fraîche","Mayonnaise","Sauce soja ou Maggi"]',
'["Préparer les carottes et daikon marinés : râper, saler 10 min, rincer, mariner dans vinaigre-sucre 30 min.","Couper les baguettes en deux. Tartiner de mayonnaise.","Ajouter quelques gouttes de sauce soja ou Maggi.","Garnir de pâté de foie, jambon et porc rôti en tranches.","Ajouter les carottes-daikon marinés, le concombre et le piment.","Terminer par la coriandre fraîche.","Servir immédiatement pendant que la baguette est croustillante."]',
true, 'approved', 'Sandwich vietnamien fusion'),

-- ═══════════════════════════════════════════════════
-- 🇰🇷 CUISINE CORÉENNE
-- ═══════════════════════════════════════════════════

(uid, 'Bibimbap', '', 4, 30, 20,
'["400g de riz japonais cuit","200g de bœuf haché","100g d''épinards blanchis","100g de carottes en julienne sautées","100g de courgette sautée","100g de champignons shiitake","4 œufs","4 c. à soupe de gochujang (pâte de piment)","Sauce soja, huile de sésame, sésame grillé","Ail, sucre"]',
'["Assaisonner chaque légume séparément avec sauce soja, sésame et ail.","Faire revenir le bœuf haché avec sauce soja, sucre et sésame.","Cuire les œufs au plat ou au miroir.","Répartir le riz chaud dans des bols.","Disposer joliment les légumes et la viande par sections.","Poser l''œuf au centre.","Ajouter une cuillère de gochujang. Mélanger avant de manger."]',
true, 'approved', 'Bol coréen coloré'),

(uid, 'Kimchi maison', '', 8, 40, 0,
'["1 chou chinois","4 c. à soupe de gros sel","4 gousses d''ail","1 morceau de gingembre","3 c. à soupe de gochugaru (piment coréen en flocons)","2 c. à soupe de fish sauce","1 c. à café de sucre","3 oignons verts","1 carotte"]',
'["Couper le chou en quartiers, saler généreusement et laisser dégorger 2 heures.","Rincer le chou abondamment et essorer.","Mixer l''ail, le gingembre, le fish sauce et le sucre.","Mélanger avec le gochugaru.","Incorporer les oignons verts et la carotte en julienne.","Enduire chaque feuille de chou de cette pâte (porter des gants).","Placer dans un pot hermétique. Fermenter à température ambiante 1-2 jours, puis réfrigérer."]',
true, 'approved', 'Chou fermenté coréen'),

(uid, 'Bulgogi de bœuf', '', 4, 20, 15,
'["500g de bœuf (faux-filet) tranché très fin","4 c. à soupe de sauce soja","2 c. à soupe de sucre","1 c. à soupe d''huile de sésame","4 gousses d''ail","1 morceau de gingembre","1 poire asiatique (ou pomme) râpée","Oignons verts","Sésame grillé"]',
'["Mélanger tous les ingrédients de la marinade avec la poire râpée (attendrissant naturel).","Mariner le bœuf tranché fin 30 minutes minimum.","Faire chauffer une poêle ou grill à feu très vif.","Cuire le bœuf en petites portions 2-3 minutes par face.","Ne pas surcharger la poêle pour que la viande grille plutôt que cuise à l''eau.","Parsemer de sésame grillé et d''oignons verts.","Servir avec du riz blanc et du kimchi."]',
true, 'approved', 'Bœuf mariné coréen grillé'),

(uid, 'Japchae (nouilles de patate douce)', '', 4, 20, 20,
'["200g de nouilles de patate douce (dangmyeon)","150g de bœuf en lanières","100g d''épinards","1 carotte en julienne","1 poivron rouge","4 champignons shiitake","3 c. à soupe de sauce soja","2 c. à soupe de sucre","1 c. à soupe d''huile de sésame","Sésame grillé","Huile"]',
'["Faire tremper les nouilles 30 minutes dans l''eau froide. Cuire 5 minutes. Égoutter.","Assaisonner les nouilles avec sauce soja, sucre et sésame.","Blanchir les épinards, assaisonner avec sauce soja et sésame.","Faire sauter séparément le bœuf, la carotte, le poivron et les champignons.","Assaisonner chaque ingrédient avec sauce soja.","Mélanger doucement tous les ingrédients dans un grand bol.","Servir tiède ou à température ambiante, parsemer de sésame."]',
true, 'approved', 'Sauté de nouilles coréen'),

(uid, 'Tteokbokki (gâteaux de riz épicés)', '', 4, 10, 20,
'["400g de tteok (gâteaux de riz cylindriques)","3 c. à soupe de gochujang","1 c. à soupe de sauce soja","1 c. à soupe de sucre","500ml de bouillon d''anchois (ou eau)","2 oignons verts","1 œuf dur par personne","Sésame"]',
'["Porter le bouillon à ébullition.","Ajouter le gochujang, la sauce soja et le sucre. Mélanger.","Incorporer les tteok. Cuire à feu moyen 10-15 minutes en remuant.","La sauce doit épaissir et enrober les gâteaux de riz.","Ajouter les oignons verts.","Rectifier le piment selon le goût.","Servir avec les œufs durs et parsemer de sésame."]',
true, 'approved', 'Street food coréen épicé');

END $$;
