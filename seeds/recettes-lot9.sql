-- LOT 9 — Asie complémentaire (60 recettes : Chine, Japon, Inde, Thaïlande, Vietnam, Corée, Indonésie, Philippines)

DO $$
DECLARE
  uid uuid := '97a98e5c-d29d-4a9f-9d84-0684eef75fe6'::uuid;
BEGIN

INSERT INTO recipes (user_id, title, source_url, servings, prep_time, cook_time, ingredients, steps, is_public, moderation_status, user_notes) VALUES

-- 🇨🇳 CHINE (suite)
(uid, 'Dim sum bao au porc (baozi)', '', 8, 40, 20,
'["Pâte : 300g de farine, 1 sachet de levure, 150ml d''eau tiède, 1 c. à soupe de sucre","Farce : 300g de porc haché, 2 c. à soupe de sauce soja, 1 c. à soupe d''huile de sésame, 1 c. à soupe de gingembre râpé, oignons verts, sel"]',
'["Pâte : dissoudre levure et sucre dans l''eau tiède. Incorporer à la farine. Pétrir 10 minutes. Lever 1 heure.","Mélanger tous les ingrédients de la farce.","Diviser la pâte en 16 boules. Étaler chaque boule en cercle.","Déposer une cuillère de farce au centre.","Plisser et refermer en pinçant les bords. Laisser reposer 20 minutes.","Cuire à la vapeur 15-18 minutes sur du papier sulfurisé percé.","Servir immédiatement avec de la sauce soja et du gingembre."]',
true, 'approved', 'Brioches vapeur chinoises farcies'),

(uid, 'Mapo tofu du Sichuan', '', 4, 10, 20,
'["400g de tofu soyeux","200g de porc haché","3 c. à soupe de pâte de haricots fermentés (doubanjiang)","2 c. à soupe de sauce soja","1 c. à café de poivre du Sichuan","3 gousses d''ail","1 morceau de gingembre","Oignons verts","Bouillon de poulet","Maïzena"]',
'["Faire revenir le porc haché dans l''huile jusqu''à dorure.","Ajouter l''ail, le gingembre et le doubanjiang. Cuire 2 minutes.","Verser le bouillon (200ml).","Couper le tofu en cubes. Ajouter délicatement pour ne pas casser.","Lier avec un peu de maïzena diluée dans l''eau.","Parsemer de poivre du Sichuan et d''oignons verts.","Arroser d''huile de sésame et servir immédiatement avec du riz."]',
true, 'approved', 'Tofu épicé du Sichuan'),

(uid, 'Canard laqué à la pékinoise', '', 4, 60, 90,
'["1 canard entier","3 c. à soupe de miel","2 c. à soupe de sauce soja","1 c. à soupe de vinaigre de riz","1 c. à café de cinq-épices","Crêpes mandarin","Sauce hoisin","Concombre et oignons verts en julienne"]',
'["Blanchir le canard 5 minutes. Sécher soigneusement.","Badigeonner du mélange miel-soja-vinaigre-cinq-épices.","Laisser sécher 24h au réfrigérateur non couvert (peau qui se dessèche).","Cuire au four à 200°C pendant 1h30 en arrosant régulièrement.","La peau doit être laquée, croustillante et dorée.","Découper finement la peau croustillante et la chair.","Servir avec les crêpes, la sauce hoisin, le concombre et les oignons verts."]',
true, 'approved', 'Canard croustillant pékinois'),

(uid, 'Wonton soup', '', 4, 30, 15,
'["Wontons : 200g de crevettes, 100g de porc haché, gingembre, sauce soja, huile sésame, 20 feuilles de wonton","Bouillon : 1 litre de bouillon de poulet, 1 c. à soupe de sauce soja, huile de sésame, oignons verts"]',
'["Hacher finement les crevettes avec le porc, le gingembre, la sauce soja et l''huile de sésame.","Déposer une cuillère de farce au centre de chaque feuille de wonton.","Mouiller les bords d''eau. Plier en triangle ou en demi-lune. Souder.","Cuire les wontons dans l''eau bouillante 4-5 minutes (ils remontent à la surface).","Chauffer le bouillon avec la sauce soja.","Mettre les wontons dans les bols.","Verser le bouillon chaud. Garnir d''oignons verts et d''huile de sésame."]',
true, 'approved', 'Soupe chinoise aux dumplings'),

(uid, 'Riz frit cantonnais aux œufs', '', 4, 10, 15,
'["400g de riz cuit (de la veille)","3 œufs","150g de crevettes décortiquées","100g de petits pois","2 oignons verts","2 c. à soupe de sauce soja","1 c. à soupe d''huile de sésame","Huile"]',
'["Faire chauffer le wok à feu très vif avec l''huile.","Faire sauter les crevettes 2 minutes. Réserver.","Casser les œufs dans le wok, brouiller rapidement.","Ajouter le riz froid. Faire sauter à feu vif en cassant les grumeaux.","Incorporer les petits pois, les crevettes et les oignons verts.","Assaisonner avec la sauce soja et l''huile de sésame.","Mélanger vigoureusement et servir immédiatement."]',
true, 'approved', 'Riz sauté cantonais classique'),

-- 🇯🇵 JAPON (suite)
(uid, 'Gyoza japonais', '', 4, 30, 15,
'["20 feuilles de gyoza","250g de porc haché","1/4 de chou","2 oignons verts","2 gousses d''ail","1 c. à soupe de gingembre","2 c. à soupe de sauce soja","1 c. à soupe d''huile de sésame","Sauce : sauce soja, vinaigre de riz, huile de piment"]',
'["Hacher finement le chou. Le saler et laisser dégorger 10 minutes. Essorer.","Mélanger porc, chou, oignons, ail, gingembre, sauce soja et huile de sésame.","Déposer une cuillère de farce au centre de chaque feuille. Mouiller le bord.","Plier et plisser pour fermer hermétiquement.","Faire chauffer l''huile dans une poêle. Faire dorer les gyoza à plat 3 minutes.","Verser 3 c. d''eau, couvrir immédiatement. Cuire à la vapeur 5 minutes.","Découvrir et laisser croustiller. Servir avec la sauce."]',
true, 'approved', 'Ravioles japonaises dorées-vapeur'),

(uid, 'Curry japonais katsu', '', 4, 20, 30,
'["4 côtelettes de porc ou escalopes de poulet","Panure : farine, œufs, chapelure panko","Curry : 1 bloc de curry japonais (S&B), 2 carottes, 2 pommes de terre, 1 oignon, 800ml d''eau","Riz japonais cuit"]',
'["Préparer le curry : faire revenir l''oignon, carottes et pommes de terre en cubes.","Ajouter l''eau. Cuire 15 minutes. Incorporer le bloc de curry. Remuer jusqu''à dissolution.","Mijoter 10 minutes jusqu''à épaississement.","Paner les côtelettes : farine, œuf battu, panko.","Faire frire dans l''huile à 180°C 4-5 minutes jusqu''à dorure.","Couper en tranches.","Servir le katsu sur le riz avec le curry."]',
true, 'approved', 'Curry japonais avec côtelette panée'),

(uid, 'Okonomiyaki (crêpe japonaise)', '', 4, 15, 15,
'["200g de farine","200ml de dashi (bouillon japonais)","2 œufs","400g de chou finement émincé","200g de crevettes ou porc","Sauce okonomiyaki (ou worcestershire + ketchup)","Mayonnaise japonaise","Flocons de bonite, algue aonori"]',
'["Mélanger farine, dashi et œufs. Ajouter le chou et la viande. Bien mélanger.","Faire chauffer l''huile dans une poêle.","Verser la pâte et former un disque épais (2 cm).","Cuire 5-6 minutes à feu moyen jusqu''à dorure.","Retourner délicatement. Cuire encore 5 minutes.","Napper de sauce okonomiyaki et de mayonnaise en zigzag.","Garnir de flocons de bonite et d''aonori. Servir immédiatement."]',
true, 'approved', 'Crêpe épaisse japonaise aux légumes'),

(uid, 'Matcha latte et gâteau matcha', '', 4, 15, 30,
'["Gâteau : 200g de farine, 150g de sucre, 2 œufs, 100ml d''huile, 100ml de lait, 2 c. à soupe de matcha, 1 sachet de levure","Glaçage : 150g de fromage frais, 50g de sucre glace, 1 c. à café de matcha"]',
'["Fouetter œufs et sucre. Incorporer l''huile et le lait.","Tamiser farine, matcha et levure. Incorporer au mélange liquide.","Verser dans un moule beurré. Cuire à 175°C pendant 25-30 minutes.","Laisser refroidir complètement.","Préparer le glaçage : battre fromage frais avec sucre glace et matcha.","Glacer le gâteau refroidi.","Décorer de poudre de matcha."]',
true, 'approved', 'Gâteau au thé vert japonais'),

(uid, 'Tonkatsu sauce', '', 4, 15, 20,
'["4 escalopes de porc","Farine, œuf, chapelure panko","Huile de friture","Sauce tonkatsu (ou worcestershire + sucre + sauce soja)","Chou finement émincé","Riz japonais","Moutarde japonaise"]',
'["Attendrir les escalopes au rouleau à pâtisserie.","Assaisonner de sel et poivre.","Paner : farine, œuf battu, panko. Bien presser pour adhérer.","Faire frire dans l''huile à 170°C pendant 5 minutes de chaque côté.","La panure doit être bien dorée. Égoutter.","Couper en tranches avec un couteau bien aiguisé.","Servir sur un lit de chou émincé avec la sauce tonkatsu et le riz."]',
true, 'approved', 'Côtelette de porc panée japonaise'),

-- 🇮🇳 INDE (suite)
(uid, 'Palak paneer (épinards au fromage)', '', 4, 15, 25,
'["300g de paneer (fromage indien)","500g d''épinards frais","2 oignons","4 gousses d''ail","1 c. à soupe de gingembre","400g de tomates","1 c. à café de cumin","1 c. à café de garam masala","Crème fraîche","Ghee ou huile","Sel"]',
'["Blanchir les épinards 2 minutes. Mixer en purée lisse.","Faire revenir l''oignon, l''ail et le gingembre dans le ghee.","Ajouter le cumin et les tomates. Cuire 10 minutes.","Incorporer la purée d''épinards et le garam masala.","Couper le paneer en cubes. Faire dorer à la poêle.","Incorporer le paneer à la sauce épinards.","Finir avec un filet de crème fraîche. Servir avec du naan."]',
true, 'approved', 'Curry indien épinards-fromage'),

(uid, 'Dal makhani', '', 4, 15, 90,
'["200g de lentilles noires (urad dal)","50g de haricots rouges","1 oignon","4 tomates","4 gousses d''ail","Gingembre","2 c. à soupe de ghee","1 c. à café de cumin","1 c. à café de garam masala","200ml de crème","Sel"]',
'["Cuire les lentilles noires et haricots rouges à l''eau 30 minutes (ou autocuiseur 20 min).","Faire revenir l''oignon dans le ghee avec le cumin.","Ajouter l''ail, le gingembre et les tomates. Cuire 10 minutes.","Incorporer les légumineuses cuites à la sauce.","Ajouter le garam masala. Mijoter 45 minutes à feu très doux.","Incorporer la crème. Mijoter encore 15 minutes.","Plus il mijote, meilleur c''est. Servir avec des chapatis."]',
true, 'approved', 'Lentilles noires crémeuses du Pendjab'),

(uid, 'Samosas au four', '', 12, 30, 25,
'["Pâte : 300g de farine, 60g de beurre, eau, sel","Farce : 400g de pommes de terre, petits pois, oignon, 1 c. cumin, 1 c. coriandre, 1 c. garam masala, piment, gingembre, sel"]',
'["Pâte : mélanger farine, beurre et sel. Ajouter l''eau progressivement. Pétrir. Reposer 20 min.","Farce : cuire les pommes de terre. Écraser grossièrement. Mélanger avec tous les autres ingrédients.","Diviser la pâte en boules. Étaler en ovales fins.","Couper chaque ovale en deux. Former un cône, remplir de farce, souder.","Disposer sur une plaque huilée.","Badigeonner d''huile ou de dorure.","Cuire à 200°C pendant 20-25 minutes jusqu''à dorure."]',
true, 'approved', 'Chaussons épicés indiens au four'),

(uid, 'Biryani au poulet', '', 6, 30, 60,
'["600g de poulet en morceaux","400g de riz basmati","2 oignons","400g de yaourt","4 gousses d''ail","Gingembre","2 c. à soupe de biryani masala","Safran dans du lait chaud","Menthe fraîche","Ghee","Sel"]',
'["Mariner le poulet dans le yaourt, l''ail, le gingembre et le biryani masala. 2 heures.","Faire dorer les oignons en friture jusqu''à brun croustillant (beresta).","Faire dorer le poulet mariné dans le ghee. Réserver.","Cuire le riz basmati à 70%. Égoutter.","Dans une cocotte : alterner couches de riz et de poulet.","Arroser de safran au lait et parsemer d''oignons frits et menthe.","Sceller et cuire à feu très doux 25 minutes (dum). Servir en soulevant le couvercle devant les convives."]',
true, 'approved', 'Riz parfumé au poulet moghol'),

(uid, 'Lassi à la mangue', '', 4, 5, 0,
'["2 mangues mûres","400g de yaourt nature","200ml de lait","4 c. à soupe de sucre","1/2 c. à café de cardamome","Quelques pistaches pour garnir","Glaçons"]',
'["Éplucher et couper les mangues en morceaux.","Mixer les mangues avec le yaourt, le lait et le sucre.","Ajouter la cardamome.","Mixer jusqu''à consistance lisse et onctueuse.","Goûter et ajuster le sucre.","Verser dans des verres avec des glaçons.","Garnir de pistaches concassées."]',
true, 'approved', 'Boisson indienne à la mangue'),

-- 🇹🇭 THAÏLANDE (suite)
(uid, 'Tom kha gaï (soupe coco-galanga)', '', 4, 15, 20,
'["400g de poulet","400ml de lait de coco","300ml de bouillon de poulet","3 tiges de citronnelle","5 rondelles de galanga","5 feuilles de kaffir lime","2 piments oiseaux","3 c. à soupe de jus de citron vert","2 c. à soupe de sauce de poisson","Champignons","Coriandre"]',
'["Écraser légèrement la citronnelle et le galanga pour libérer les arômes.","Faire chauffer le bouillon avec la citronnelle, le galanga et les feuilles de kaffir lime.","Ajouter le lait de coco. Chauffer sans bouillir.","Incorporer les champignons et le poulet en morceaux.","Cuire 10 minutes à feu doux.","Assaisonner avec la sauce de poisson et le jus de citron vert.","Parsemer de coriandre et de piments. Servir immédiatement."]',
true, 'approved', 'Soupe thaïe au lait de coco'),

(uid, 'Pad see ew (nouilles sautées)', '', 4, 10, 15,
'["400g de nouilles de riz larges","400g de poulet ou bœuf","200g de brocoli chinois","3 œufs","3 c. à soupe de sauce soja noire","2 c. à soupe de sauce soja légère","1 c. à soupe de sucre","Huile","Ail"]',
'["Faire tremper les nouilles selon les instructions. Égoutter.","Faire sauter l''ail dans l''huile très chaude (wok).","Ajouter la viande. Cuire à feu vif 3 minutes.","Pousser la viande sur le côté. Casser les œufs. Brouiller rapidement.","Ajouter les nouilles et le brocoli.","Assaisonner avec les deux sauces soja et le sucre.","Mélanger vigoureusement à feu vif. Servir immédiatement."]',
true, 'approved', 'Nouilles sautées thaïes à la sauce soja'),

(uid, 'Mango sticky rice', '', 4, 15, 30,
'["300g de riz gluant","400ml de lait de coco","4 c. à soupe de sucre","1 c. à café de sel","2 mangues mûres","Graines de sésame grillées"]',
'["Faire tremper le riz gluant 4 heures. Cuire à la vapeur 20-25 minutes.","Chauffer le lait de coco avec le sucre et le sel jusqu''à dissolution.","Verser les 3/4 du lait de coco sur le riz chaud. Mélanger.","Couvrir et laisser absorber 20 minutes.","Éplucher et trancher les mangues.","Dresser le riz collant en boule dans l''assiette avec les tranches de mangue.","Arroser du reste de lait de coco et parsemer de sésame."]',
true, 'approved', 'Dessert thaï riz collant-mangue'),

(uid, 'Som tam (salade de papaye verte)', '', 4, 20, 0,
'["1 petite papaye verte","2 tomates","50g de haricots longs","30g de cacahuètes grillées","2 gousses d''ail","2 piments oiseaux","3 c. à soupe de jus de citron vert","2 c. à soupe de sauce de poisson","1 c. à soupe de sucre de palme","Crevettes séchées (facultatif)"]',
'["Râper la papaye verte en longs filaments (râpe à julienne ou épluche-légumes).","Dans un mortier : piler l''ail et les piments.","Ajouter les haricots coupés et les tomates. Piler grossièrement.","Ajouter la papaye râpée.","Assaisonner avec citron vert, sauce de poisson et sucre de palme.","Mélanger en écrasant légèrement.","Dresser avec les cacahuètes et les crevettes séchées."]',
true, 'approved', 'Salade thaïe pimentée'),

-- 🇻🇳 VIETNAM (suite)
(uid, 'Bánh mì (sandwich vietnamien)', '', 4, 20, 0,
'["4 baguettes vietnamiennes (ou pain de mie)","300g de porc rôti ou pâté de foie","Pickles : carotte et daikon marinés au vinaigre","Concombre en bâtons","Coriandre fraîche","Piment frais","Mayonnaise","Sauce soja ou maggi"]',
'["Préparer les pickles : râper carottes et daikon. Mariner dans vinaigre, sucre et sel 30 minutes.","Couper les baguettes en deux dans la longueur.","Badigeonner de mayonnaise.","Garnir de porc rôti tranché ou de pâté.","Ajouter les pickles égouttés, le concombre et la coriandre.","Assaisonner d''une goutte de sauce soja.","Ajouter quelques rondelles de piment. Refermer et servir immédiatement."]',
true, 'approved', 'Sandwich vietnamien garni'),

(uid, 'Gỏi cuốn (rouleaux de printemps frais)', '', 4, 30, 0,
'["12 galettes de riz","300g de crevettes cuites","200g de porc cuit en tranches","100g de vermicelles de riz cuits","Salade verte","Menthe fraîche","Coriandre","Sauce : beurre de cacahuète, hoisin, eau chaude, piment"]',
'["Tremper chaque galette de riz dans l''eau tiède 10 secondes.","Poser sur un plan de travail humide.","Disposer au centre : une feuille de salade, quelques crevettes et porc, vermicelles, herbes fraîches.","Rouler serré en repliant d''abord les côtés, puis en roulant.","Répéter avec toutes les galettes.","Préparer la sauce : mélanger beurre de cacahuète, hoisin, eau chaude et piment.","Servir les rouleaux frais avec la sauce."]',
true, 'approved', 'Rouleaux frais vietnamiens non frits'),

(uid, 'Bún bò Huế (soupe de bœuf épicée)', '', 4, 30, 60,
'["400g de vermicelles de riz ronds","400g de bœuf (jarret)","200g de porc","2 litres de bouillon de bœuf","Épices : citronnelle, crevettes fermentées (mắm ruốc), piment, ail","Garnitures : germes de soja, basilic thaï, citron vert, coriandre, oignon émincé"]',
'["Cuire le jarret de bœuf et le porc dans le bouillon avec la citronnelle 45 minutes.","Assaisonner le bouillon avec le mắm ruốc et le piment. Ajuster sel.","Cuire les vermicelles selon les instructions. Égoutter.","Trancher finement la viande.","Répartir les vermicelles dans les bols.","Disposer la viande tranchée par-dessus.","Verser le bouillon bouillant. Servir avec les garnitures fraîches."]',
true, 'approved', 'Soupe de bœuf épicée du centre Vietnam'),

-- 🇰🇷 CORÉE (suite)
(uid, 'Japchae (nouilles de verre aux légumes)', '', 4, 30, 15,
'["200g de vermicelles de patate douce (dangmyeon)","200g de bœuf en lanières","1 carotte","1 poivron rouge","100g d''épinards","100g de champignons shiitake","3 c. à soupe de sauce soja","1 c. à soupe de sucre","2 c. à soupe d''huile de sésame","Sel, poivre, sésame grillé"]',
'["Faire tremper les vermicelles 20 minutes. Cuire 6 minutes. Égoutter.","Faire mariner le bœuf avec 1 c. sauce soja, 1 c. sucre, huile de sésame.","Faire sauter séparément chaque légume.","Faire dorer le bœuf mariné.","Mélanger vermicelles, bœuf et légumes dans un grand wok.","Assaisonner avec le reste de sauce soja, sucre et huile de sésame.","Parsemer de sésame grillé. Servir chaud ou à température ambiante."]',
true, 'approved', 'Nouilles de verre coréennes sautées'),

(uid, 'Doenjang jjigae (soupe miso coréenne)', '', 4, 10, 20,
'["3 c. à soupe de pâte de soja coréenne (doenjang)","400g de tofu ferme","1 courgette","200g de champignons","1 oignon","3 gousses d''ail","1 litre de bouillon d''anchois","Piment rouge en poudre","Oignons verts"]',
'["Préparer le bouillon d''anchois : faire bouillir 15 anchois séchés dans 1 litre d''eau 15 minutes. Filtrer.","Diluer le doenjang dans un peu de bouillon.","Porter le bouillon à ébullition.","Ajouter l''oignon et l''ail hachés.","Incorporer la courgette, les champignons et le tofu en cubes.","Verser le doenjang dilué. Ajouter le piment.","Mijoter 10 minutes. Garnir d''oignons verts."]',
true, 'approved', 'Soupe de miso coréen au tofu'),

(uid, 'Tteokbokki (gâteaux de riz épicés)', '', 4, 5, 20,
'["500g de tteok (cylindres de riz)","3 c. à soupe de gochujang (pâte de piment)","1 c. à soupe de sauce soja","1 c. à soupe de sucre","500ml de bouillon d''anchois","Oignons verts","Sésame grillé","Galettes de poisson (odeng) en option"]',
'["Préparer le bouillon ou utiliser de l''eau.","Mélanger le gochujang, la sauce soja et le sucre dans le bouillon.","Porter à ébullition.","Ajouter les tteok (s''ils sont durs, les faire tremper 20 min avant).","Cuire à feu moyen 10-15 minutes en remuant régulièrement.","Les tteok doivent être tendres et la sauce nappante.","Garnir d''oignons verts et de sésame. Servir chaud."]',
true, 'approved', 'Street food coréenne aux gâteaux de riz épicés'),

-- 🇮🇩 INDONÉSIE
(uid, 'Rendang de bœuf indonésien', '', 4, 20, 180,
'["800g de bœuf (macreuse)","2 boîtes de lait de coco","4 tiges de citronnelle","5 feuilles de kaffir lime","3 feuilles de laurier","Pâte : 6 échalotes, 4 gousses d''ail, 4 piments, 3 cm de galanga, 2 cm de curcuma, 2 cm de gingembre"]',
'["Mixer tous les ingrédients de la pâte en une pâte lisse.","Faire revenir la pâte à sec 3 minutes jusqu''à parfum libéré.","Ajouter le bœuf coupé en cubes. Enrober de pâte.","Verser le lait de coco. Ajouter citronnelle, kaffir lime et laurier.","Porter à ébullition, puis réduire à feu très doux.","Cuire 2h30 à 3 heures sans couvercle en remuant de temps en temps.","Le rendang est prêt quand le liquide est évaporé et la viande enrobée d''huile de coco foncée."]',
true, 'approved', 'Bœuf sec épicé au lait de coco indonésien'),

(uid, 'Satay au beurre de cacahuète', '', 4, 30, 15,
'["400g de poulet ou bœuf","Marinade : sauce soja, huile, curcuma, sucre, ail, coriandre","Sauce cacahuète : 200g de beurre de cacahuète, 200ml de lait de coco, 2 c. sauce soja, 1 c. sucre, 1 c. jus citron, piment"]',
'["Couper la viande en lanières. Faire mariner 1 heure.","Enfiler sur des brochettes en bambou.","Faire griller sur le gril ou au four à haute température.","Retourner régulièrement jusqu''à légère carbonisation.","Préparer la sauce : chauffer lait de coco et beurre de cacahuète en mélangeant.","Ajouter sauce soja, sucre, jus de citron et piment.","Servir les brochettes avec la sauce cacahuète et du riz."]',
true, 'approved', 'Brochettes asiatiques sauce cacahuète'),

(uid, 'Nasi goreng indonésien', '', 4, 10, 15,
'["400g de riz cuit (de la veille)","2 œufs","200g de crevettes","2 c. à soupe de kecap manis (sauce soja sucrée)","1 c. à soupe de sauce soja","2 échalotes","3 gousses d''ail","Piment rouge","Oignons verts","Chips de crevettes (krupuk)"]',
'["Faire sauter les échalotes, l''ail et le piment dans l''huile chaude.","Ajouter les crevettes. Cuire 2 minutes.","Pousser sur le côté. Brouiller les œufs.","Ajouter le riz froid. Faire sauter à feu vif.","Assaisonner avec kecap manis et sauce soja.","Bien mélanger jusqu''à riz bien enrobé et chaud.","Servir avec les chips de crevettes et les oignons verts."]',
true, 'approved', 'Riz frit indonésien classique'),

-- 🇵🇭 PHILIPPINES
(uid, 'Adobo poulet-porc filippino', '', 4, 10, 45,
'["400g de poulet en morceaux","400g de porc en cubes","100ml de vinaigre blanc","100ml de sauce soja","6 gousses d''ail","3 feuilles de laurier","1 c. à café de grains de poivre noir","Huile","Riz pour servir"]',
'["Mélanger vinaigre, sauce soja, ail et épices dans une cocotte.","Ajouter le poulet et le porc. Laisser mariner 30 minutes.","Porter à ébullition sans couvercle 10 minutes.","Couvrir et mijoter 25 minutes.","Retirer les viandes. Faire réduire la sauce.","Faire dorer rapidement les viandes dans l''huile.","Remettre dans la sauce réduite. Servir avec du riz blanc."]',
true, 'approved', 'Plat national philippin viande braisée au vinaigre'),

(uid, 'Sinigang (soupe aigre philippine)', '', 4, 20, 30,
'["400g de porc ou crevettes","1 litre de bouillon","2 tomates","1 oignon","200g de kangkong (ou épinards)","2 radis blancs","200g de haricots verts","3 c. à soupe de soupe en poudre sinigang ou jus de tamarin","Piment long vert","Sel, sauce de poisson"]',
'["Porter le bouillon à ébullition avec les tomates et l''oignon.","Ajouter la viande ou les crevettes.","Cuire 15 minutes.","Incorporer les légumes (radis, haricots).","Assaisonner avec le tamarin ou la poudre sinigang.","Ajouter le kangkong ou les épinards en dernier (2 minutes).","Servir très chaud avec du riz. L''acidité doit être prononcée."]',
true, 'approved', 'Soupe aigre philippine au tamarin'),

(uid, 'Lumpia (rouleaux de printemps philippins frits)', '', 6, 30, 15,
'["20 feuilles de lumpia","300g de porc haché","100g de crevettes","2 carottes","200g de chou","2 oignons verts","2 gousses d''ail","2 c. à soupe de sauce soja","Huile de friture","Sauce aigre-douce pour tremper"]',
'["Faire sauter l''ail et l''oignon. Ajouter le porc haché et les crevettes.","Incorporer les légumes coupés finement. Cuire 5 minutes.","Assaisonner avec la sauce soja. Laisser refroidir.","Déposer une cuillère de farce sur le bord d''une feuille de lumpia.","Rouler serré en repliant les côtés.","Sceller le bord avec de l''eau.","Faire frire à 180°C jusqu''à dorure croustillante. Servir avec la sauce aigre-douce."]',
true, 'approved', 'Rouleaux frits philippins croustillants'),

-- Bonus
(uid, 'Khao niao mamuang (riz gluant mangue)', '', 4, 10, 25,
'["300g de riz gluant","400ml de lait de coco","80g de sucre de palme ou sucre brun","1 c. à café de sel","2 mangues mûres","Graines de sésame"]',
'["Faire tremper le riz gluant 4 heures. Cuire à la vapeur 20-25 minutes.","Chauffer le lait de coco avec le sucre et le sel jusqu''à dissolution.","Verser les 3/4 du lait de coco sur le riz chaud.","Couvrir et laisser absorber 20 minutes.","Éplucher et trancher les mangues.","Dresser le riz en boule dans l''assiette avec les tranches de mangue.","Arroser du reste de lait de coco salé et parsemer de sésame."]',
true, 'approved', 'Riz gluant à la mangue version thaïe');

END $$;
