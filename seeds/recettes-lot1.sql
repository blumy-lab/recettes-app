-- LOT 1 — Cuisine Réunionnaise (30) + Française classique (20)

DO $$
DECLARE
  uid uuid := '97a98e5c-d29d-4a9f-9d84-0684eef75fe6'::uuid;
BEGIN

-- ═══════════════════════════════════════════════════
-- 🇷🇪 CUISINE RÉUNIONNAISE
-- ═══════════════════════════════════════════════════

INSERT INTO recipes (user_id, title, source_url, servings, prep_time, cook_time, ingredients, steps, is_public, moderation_status, user_notes) VALUES

(uid, 'Cari poulet à la réunionnaise', '', 4, 20, 45,
'["1 poulet coupé en morceaux","3 tomates","2 oignons","4 gousses d''ail","1 morceau de gingembre frais","2 c. à soupe de curcuma","1 c. à café de thym","2 c. à soupe d''huile","Sel, poivre"]',
'["Faire revenir les oignons émincés dans l''huile chaude jusqu''à dorure.","Ajouter l''ail et le gingembre râpés, faire revenir 2 minutes.","Incorporer le curcuma et le thym, mélanger.","Ajouter les morceaux de poulet, faire dorer sur toutes les faces.","Ajouter les tomates concassées, sel et poivre.","Couvrir et laisser mijoter 40 minutes à feu doux en remuant régulièrement.","Servir avec du riz blanc et des grains (lentilles)."]',
true, 'approved', 'Recette traditionnelle réunionnaise'),

(uid, 'Rougail saucisses', '', 4, 15, 35,
'["500g de saucisses fumées","4 tomates","2 oignons","3 gousses d''ail","1 piment oiseau (facultatif)","1 c. à soupe de curcuma","2 c. à soupe d''huile","Sel, poivre","Thym, persil"]',
'["Piquer les saucisses et les faire blanchir 10 minutes dans l''eau bouillante. Égoutter et couper en rondelles.","Faire revenir les oignons émincés dans l''huile.","Ajouter l''ail, le piment et le curcuma.","Ajouter les tomates concassées et laisser réduire 10 minutes.","Incorporer les saucisses, mélanger et laisser mijoter 20 minutes.","Rectifier l''assaisonnement. Parsemer de persil frais.","Servir avec du riz blanc."]',
true, 'approved', 'Plat emblématique de La Réunion'),

(uid, 'Grains de lentilles à la réunionnaise', '', 4, 10, 40,
'["300g de lentilles vertes","1 oignon","3 gousses d''ail","2 tomates","1 c. à soupe de curcuma","1 feuille de bois d''Inde (laurier indien)","2 c. à soupe d''huile","Sel, poivre","Persil frais"]',
'["Rincer les lentilles et les faire tremper 30 minutes.","Faire revenir l''oignon émincé dans l''huile avec l''ail.","Ajouter le curcuma, les tomates et la feuille de bois d''Inde.","Égoutter les lentilles et les ajouter dans la casserole.","Couvrir d''eau, saler et faire cuire 30 minutes à feu moyen.","Vérifier la cuisson, ajuster le sel. Parsemer de persil.","Servir en accompagnement d''un cari."]',
true, 'approved', 'Accompagnement incontournable'),

(uid, 'Achards de légumes', '', 6, 30, 15,
'["2 carottes","1 chou vert","2 courgettes","1 poivron","1 oignon","3 gousses d''ail","1 c. à soupe de curcuma","1 c. à café de moutarde en grains","2 c. à soupe de vinaigre","3 c. à soupe d''huile","Sel"]',
'["Émincer finement tous les légumes en julienne.","Faire blanchir les légumes 2 minutes à l''eau bouillante salée. Égoutter et sécher.","Faire chauffer l''huile, ajouter la moutarde en grains et l''ail émincé.","Incorporer le curcuma, mélanger.","Ajouter les légumes, faire revenir 5 minutes à feu vif.","Déglacer avec le vinaigre, saler.","Laisser refroidir avant de servir. Se conserve plusieurs jours."]',
true, 'approved', 'Condiment traditionnel réunionnais'),

(uid, 'Cari de thon frais', '', 4, 20, 30,
'["600g de thon frais","3 tomates","2 oignons","4 gousses d''ail","1 morceau de gingembre","2 c. à soupe de curcuma","1 tige de citronnelle","2 c. à soupe d''huile","Sel, poivre","Coriandre fraîche"]',
'["Couper le thon en cubes de 3 cm.","Faire revenir les oignons dans l''huile jusqu''à transparence.","Ajouter l''ail, le gingembre râpé et la citronnelle écrasée.","Incorporer le curcuma et les tomates concassées.","Laisser réduire la sauce 10 minutes.","Ajouter les cubes de thon délicatement. Cuire 15 minutes sans trop remuer.","Parsemer de coriandre fraîche. Servir avec du riz."]',
true, 'approved', 'Cari de poisson de La Réunion'),

(uid, 'Bouchons réunionnais', '', 4, 40, 20,
'["300g de porc haché","200g de crevettes décortiquées hachées","2 gousses d''ail","1 morceau de gingembre","2 c. à soupe de sauce soja","1 c. à soupe d''huile de sésame","Sel, poivre","Feuilles de chou (pour envelopper)","Feuilles de wonton ou pâte à ravioles"]',
'["Mélanger le porc haché, les crevettes, l''ail et le gingembre râpés.","Assaisonner avec la sauce soja, l''huile de sésame, sel et poivre.","Placer une cuillère de farce au centre de chaque feuille de wonton.","Replier et fermer en forme de petit baluchon.","Cuire à la vapeur 15-20 minutes.","Servir chaud avec une sauce piment-soja."]',
true, 'approved', 'Ravioles vapeur typiquement réunionnaises'),

(uid, 'Samossas réunionnais au bœuf', '', 6, 45, 20,
'["400g de bœuf haché","1 oignon","3 gousses d''ail","1 c. à soupe de curcuma","1 piment vert","Feuilles de brick","Sel, poivre","Huile de friture","Persil frais"]',
'["Faire revenir l''oignon et l''ail hachés dans un peu d''huile.","Ajouter le bœuf haché, cuire en émiettant.","Assaisonner avec curcuma, piment, sel et poivre.","Ajouter le persil haché, bien mélanger et laisser refroidir.","Couper les feuilles de brick en bandes.","Former des triangles en pliant et en garnissant de farce.","Sceller avec un peu d''eau. Faire frire dans l''huile chaude jusqu''à dorure."]',
true, 'approved', 'Apéritif incontournable de La Réunion'),

(uid, 'Riz cantonnais réunionnais', '', 4, 20, 15,
'["400g de riz cuit la veille","150g de porc char siu (ou jambon)","100g de crevettes décortiquées","3 œufs","100g de petits pois","3 c. à soupe de sauce soja","2 c. à soupe d''huile","2 gousses d''ail","Sel, poivre"]',
'["Faire chauffer l''huile dans un wok à feu vif.","Faire revenir l''ail haché, ajouter les crevettes et le porc coupé en dés.","Pousser sur le côté, battre les œufs et les brouiller dans le wok.","Ajouter le riz froid, mélanger vigoureusement.","Incorporer les petits pois et la sauce soja.","Mélanger à feu vif 3-4 minutes. Rectifier l''assaisonnement.","Servir immédiatement."]',
true, 'approved', 'Classique de la cuisine chinoise réunionnaise'),

(uid, 'Carry cabri (chèvre)', '', 4, 20, 90,
'["800g de cabri (chèvre) coupé en morceaux","3 tomates","2 oignons","5 gousses d''ail","1 morceau de gingembre","2 c. à soupe de curcuma","1 c. à café de thym","2 feuilles de bois d''Inde","2 c. à soupe d''huile","Sel, poivre"]',
'["Faire mariner la viande avec la moitié de l''ail, du curcuma et du sel pendant 1 heure.","Faire revenir les oignons dans l''huile.","Ajouter le reste de l''ail, le gingembre et le curcuma.","Faire dorer les morceaux de cabri sur toutes les faces.","Ajouter les tomates, le thym et les feuilles de bois d''Inde.","Couvrir d''un peu d''eau et mijoter 1h30 à feu doux.","La viande doit être très tendre et la sauce réduite."]',
true, 'approved', 'Plat de fête réunionnais'),

(uid, 'Rougail mangue verte', '', 4, 15, 0,
'["2 mangues vertes","1 piment oiseau","2 gousses d''ail","1 c. à soupe de jus de citron vert","Sel","Coriandre fraîche"]',
'["Éplucher et râper grossièrement les mangues vertes.","Écraser le piment et l''ail au pilon avec une pincée de sel.","Mélanger la mangue râpée avec la pâte piment-ail.","Ajouter le jus de citron vert.","Parsemer de coriandre fraîche hachée.","Laisser reposer 15 minutes avant de servir comme condiment."]',
true, 'approved', 'Condiment frais et piquant réunionnais'),

(uid, 'Gâteau patate douce', '', 8, 20, 45,
'["500g de patates douces","200g de sucre","3 œufs","100g de beurre","1 c. à café de vanille","1 c. à café de cannelle","200g de farine","1 sachet de levure","Zeste de citron vert"]',
'["Cuire les patates douces à l''eau, les éplucher et les écraser en purée.","Mélanger la purée avec le sucre, le beurre fondu et les œufs.","Incorporer la vanille, la cannelle et le zeste de citron.","Ajouter la farine et la levure tamisées.","Verser dans un moule beurré.","Cuire 45 minutes à 180°C.","Vérifier la cuisson avec un couteau. Laisser refroidir avant de démouler."]',
true, 'approved', 'Dessert traditionnel réunionnais'),

(uid, 'Cari porc au jacquier', '', 4, 25, 60,
'["500g de porc","300g de jeune jacquier (en conserve ou frais)","2 tomates","2 oignons","4 gousses d''ail","1 morceau de gingembre","2 c. à soupe de curcuma","2 c. à soupe d''huile","Sel, poivre","Thym"]',
'["Couper le porc en morceaux et le jacquier en cubes.","Faire revenir les oignons et l''ail dans l''huile.","Ajouter le gingembre râpé, le curcuma et le thym.","Faire dorer les morceaux de porc.","Ajouter le jacquier et les tomates concassées.","Couvrir d''un peu d''eau, saler et mijoter 45 minutes.","Servir avec du riz blanc."]',
true, 'approved', 'Cari original au jacquier'),

(uid, 'Daube de porc réunionnaise', '', 4, 20, 90,
'["700g de porc (épaule ou jarret)","3 tomates","2 oignons","4 gousses d''ail","1 verre de vin rouge","2 clous de girofle","1 bâton de cannelle","Thym, laurier","2 c. à soupe d''huile","Sel, poivre"]',
'["Couper le porc en gros cubes. Faire mariner avec le vin, l''ail et les épices une nuit.","Égoutter la viande et la faire dorer dans l''huile.","Ajouter les oignons émincés, faire revenir.","Déglacer avec la marinade et ajouter les tomates.","Ajouter le thym, le laurier, les clous de girofle et la cannelle.","Mijoter à feu doux 1h30 jusqu''à ce que la viande soit fondante.","Servir avec du riz ou des pommes de terre."]',
true, 'approved', 'Daube réunionnaise parfumée'),

(uid, 'Soupe de bichiques', '', 4, 20, 30,
'["200g de bichiques (ou civelles)","2 oignons","3 gousses d''ail","2 tomates","1 morceau de gingembre","1 c. à soupe de curcuma","1 litre de bouillon","2 c. à soupe d''huile","Sel, poivre","Coriandre"]',
'["Rincer délicatement les bichiques.","Faire revenir les oignons et l''ail dans l''huile.","Ajouter le gingembre, le curcuma et les tomates.","Verser le bouillon et porter à ébullition.","Ajouter les bichiques délicatement, cuire 5-10 minutes à feu doux.","Rectifier l''assaisonnement.","Servir avec de la coriandre fraîche."]',
true, 'approved', 'Spécialité de poisson réunionnaise'),

(uid, 'Gâteau coco réunionnais', '', 8, 20, 40,
'["200g de noix de coco râpée","200g de sucre","4 œufs","100g de farine","100g de beurre fondu","1 c. à café de vanille","1 sachet de levure","Zeste de citron vert"]',
'["Préchauffer le four à 180°C.","Mélanger les œufs et le sucre jusqu''à blanchiment.","Incorporer le beurre fondu et la vanille.","Ajouter la noix de coco, la farine et la levure.","Ajouter le zeste de citron vert.","Verser dans un moule beurré et fariné.","Cuire 35-40 minutes. Laisser refroidir avant de démouler."]',
true, 'approved', 'Gâteau coco traditionnel'),

(uid, 'Rougail tomates frais', '', 4, 10, 0,
'["4 tomates bien mûres","1 oignon rouge","2 gousses d''ail","1 piment oiseau","Jus d''un citron vert","Sel","Huile d''olive","Coriandre fraîche ou persil"]',
'["Éplucher et épépiner les tomates, les couper en petits dés.","Émincer finement l''oignon rouge et l''ail.","Écraser le piment finement.","Mélanger tous les ingrédients dans un bol.","Ajouter le jus de citron vert et un filet d''huile d''olive.","Saler et mélanger. Parsemer de coriandre.","Laisser reposer 10 minutes avant de servir."]',
true, 'approved', 'Condiment de base réunionnais'),

(uid, 'Cari crevettes à la réunionnaise', '', 4, 20, 25,
'["500g de grosses crevettes décortiquées","3 tomates","2 oignons","4 gousses d''ail","1 morceau de gingembre","2 c. à soupe de curcuma","1 tige de citronnelle","2 c. à soupe d''huile","Sel, poivre","Coriandre fraîche"]',
'["Faire revenir les oignons dans l''huile.","Ajouter l''ail, le gingembre râpé, la citronnelle et le curcuma.","Incorporer les tomates concassées, laisser réduire 10 minutes.","Ajouter les crevettes, mélanger délicatement.","Cuire 8-10 minutes à feu moyen.","Parsemer de coriandre fraîche.","Servir immédiatement avec du riz blanc."]',
true, 'approved', 'Cari de crevettes parfumé'),

(uid, 'Massalé de poulet', '', 4, 20, 50,
'["1 poulet coupé en morceaux","2 oignons","4 gousses d''ail","1 morceau de gingembre","2 c. à soupe de pâte de massalé","2 tomates","200ml de lait de coco","2 c. à soupe d''huile","Sel","Coriandre fraîche"]',
'["Faire revenir les oignons dans l''huile.","Ajouter l''ail, le gingembre et la pâte de massalé. Cuire 2 minutes.","Faire dorer les morceaux de poulet.","Ajouter les tomates concassées et le lait de coco.","Saler, couvrir et mijoter 40 minutes à feu doux.","La sauce doit être crémeuse et parfumée.","Parsemer de coriandre et servir avec du riz."]',
true, 'approved', 'Curry réunionnais au lait de coco'),

(uid, 'Vindaye poisson', '', 4, 20, 20,
'["600g de poisson ferme (thon, marlin)","1 c. à soupe de curcuma","1 c. à café de moutarde en grains","3 gousses d''ail","1 morceau de gingembre","2 c. à soupe de vinaigre","2 c. à soupe d''huile","Sel","Piment (facultatif)"]',
'["Couper le poisson en cubes, saler et enrober de curcuma.","Faire frire les cubes de poisson jusqu''à dorure. Réserver.","Dans la même poêle, faire revenir l''ail, le gingembre et la moutarde.","Ajouter le vinaigre et le piment.","Remettre le poisson, mélanger délicatement.","Cuire 5 minutes supplémentaires.","Servir chaud ou froid — meilleur le lendemain."]',
true, 'approved', 'Vindaye traditionnel de La Réunion'),

(uid, 'Ti punch réunionnais', '', 2, 5, 0,
'["10cl de rhum agricole réunionnais","2 c. à café de sucre de canne","1 citron vert","Glaçons"]',
'["Presser la moitié d''un citron vert directement dans le verre.","Frotter le bord du verre avec le zeste.","Ajouter le sucre de canne et mélanger légèrement.","Verser le rhum.","Ajouter des glaçons ou servir sans glace selon la tradition.","Mélanger délicatement et déguster."]',
true, 'approved', 'Cocktail traditionnel réunionnais'),

(uid, 'Piment confit réunionnais', '', 1, 15, 0,
'["10 piments oiseaux","4 gousses d''ail","1 c. à café de sel","1 c. à soupe de vinaigre","2 c. à soupe d''huile","Curcuma (pincée)"]',
'["Laver et sécher les piments.","Écraser l''ail et les piments au pilon avec le sel.","Ajouter le curcuma, le vinaigre et l''huile.","Bien mélanger jusqu''à obtenir une pâte.","Mettre en pot hermétique.","Se conserve plusieurs semaines au réfrigérateur.","Utiliser en petite quantité pour relever les plats."]',
true, 'approved', 'Condiment piment maison'),

(uid, 'Cari z''oreilles cochon', '', 4, 20, 60,
'["500g d''oreilles de cochon","2 oignons","4 gousses d''ail","2 tomates","1 morceau de gingembre","2 c. à soupe de curcuma","2 c. à soupe d''huile","Sel, poivre","Thym"]',
'["Blanchir les oreilles de cochon 20 minutes à l''eau bouillante salée. Égoutter et couper en lanières.","Faire revenir les oignons dans l''huile.","Ajouter l''ail, le gingembre et le curcuma.","Incorporer les lanières d''oreilles, faire dorer.","Ajouter les tomates et le thym, saler.","Mijoter 30 minutes à feu doux.","Servir avec du riz blanc."]',
true, 'approved', 'Abats cuisinés à la réunionnaise'),

(uid, 'Gâteau manioc', '', 8, 25, 50,
'["500g de manioc râpé","200g de sucre","3 œufs","100g de beurre fondu","200ml de lait de coco","1 c. à café de vanille","Noix de coco râpée pour garnir"]',
'["Préchauffer le four à 180°C.","Mélanger le manioc râpé avec le sucre, les œufs battus et le beurre fondu.","Ajouter le lait de coco et la vanille, bien mélanger.","Verser dans un moule beurré.","Parsemer de noix de coco râpée.","Cuire 45-50 minutes jusqu''à dorure.","Laisser refroidir complètement avant de déguster."]',
true, 'approved', 'Gâteau traditionnel au manioc'),

(uid, 'Soupe joumou réunionnaise', '', 6, 30, 60,
'["500g de courge butternut","300g de bœuf en cubes","2 pommes de terre","2 carottes","1 oignon","3 gousses d''ail","1 branche de thym","1 litre de bouillon de bœuf","Sel, poivre","Persil frais"]',
'["Faire dorer les cubes de bœuf dans une cocotte.","Ajouter les oignons et l''ail émincés, faire revenir.","Incorporer la courge, les carottes et les pommes de terre en cubes.","Verser le bouillon, ajouter le thym.","Saler, poivrer et cuire 45 minutes à feu moyen.","Mixer partiellement pour épaissir la soupe.","Servir parsemé de persil frais."]',
true, 'approved', 'Soupe réconfortante à la courge'),

(uid, 'Cari lotte', '', 4, 20, 30,
'["600g de lotte coupée en morceaux","3 tomates","2 oignons","4 gousses d''ail","1 morceau de gingembre","2 c. à soupe de curcuma","200ml de lait de coco","2 c. à soupe d''huile","Sel","Coriandre fraîche"]',
'["Faire revenir les oignons dans l''huile.","Ajouter l''ail, le gingembre et le curcuma.","Incorporer les tomates concassées et laisser réduire.","Ajouter les morceaux de lotte délicatement.","Verser le lait de coco, saler.","Cuire 20 minutes à feu doux sans remuer trop.","Parsemer de coriandre et servir avec du riz."]',
true, 'approved', 'Cari de lotte au lait de coco'),

(uid, 'Bonbon coco', '', 20, 20, 30,
'["200g de noix de coco râpée","200g de sucre","50ml d''eau","1 c. à café de vanille","Colorant alimentaire (facultatif)"]',
'["Faire un sirop en portant l''eau et le sucre à ébullition.","Ajouter la noix de coco râpée et la vanille.","Mélanger à feu moyen jusqu''à ce que le mélange soit sec et se détache de la casserole.","Ajouter le colorant si souhaité.","Former des petites boules avec les mains légèrement humides.","Laisser durcir sur du papier sulfurisé.","Conserver dans une boîte hermétique."]',
true, 'approved', 'Confiserie traditionnelle réunionnaise'),

(uid, 'Roti réunionnais', '', 6, 30, 20,
'["500g de farine","1 sachet de levure boulangère","1 c. à café de sel","300ml d''eau tiède","2 c. à soupe d''huile","Beurre pour finition"]',
'["Dissoudre la levure dans l''eau tiède avec une pincée de sucre. Laisser activer 10 minutes.","Mélanger la farine et le sel, former un puits.","Incorporer l''eau avec la levure et l''huile.","Pétrir 10 minutes jusqu''à obtenir une pâte lisse.","Laisser lever 1 heure sous un linge.","Diviser en boules, étaler finement et cuire à la poêle sèche chaude 2 minutes par face.","Badigeonner de beurre à la sortie."]',
true, 'approved', 'Pain plat traditionnel réunionnais'),

(uid, 'Lasagne réunionnaise au bœuf et curcuma', '', 6, 30, 45,
'["400g de bœuf haché","12 feuilles de lasagne","2 oignons","3 tomates","3 gousses d''ail","1 c. à soupe de curcuma","500ml de béchamel","100g de gruyère râpé","2 c. à soupe d''huile","Sel, poivre"]',
'["Faire revenir les oignons et l''ail, ajouter le bœuf haché et le curcuma.","Incorporer les tomates concassées, saler, poivrer et mijoter 20 minutes.","Préchauffer le four à 200°C.","Alterner dans un plat à gratin : béchamel, lasagne, bolognaise au curcuma.","Terminer par une couche de béchamel et de gruyère.","Cuire 35-40 minutes jusqu''à dorure.","Laisser reposer 10 minutes avant de servir."]',
true, 'approved', 'Lasagne fusion réunionnaise'),

(uid, 'Brèdes mafane sautées', '', 4, 10, 10,
'["300g de brèdes mafane (ou épinards)","3 gousses d''ail","1 oignon","2 c. à soupe d''huile","Sel","1 pincée de curcuma"]',
'["Laver soigneusement les brèdes et les égoutter.","Faire revenir l''oignon et l''ail dans l''huile.","Ajouter les brèdes et le curcuma.","Faire sauter à feu vif 5-7 minutes en remuant.","Saler et mélanger.","Servir chaud en accompagnement d''un cari."]',
true, 'approved', 'Légumes verts sautés réunionnais');

-- ═══════════════════════════════════════════════════
-- 🇫🇷 CUISINE FRANÇAISE CLASSIQUE
-- ═══════════════════════════════════════════════════

INSERT INTO recipes (user_id, title, source_url, servings, prep_time, cook_time, ingredients, steps, is_public, moderation_status, user_notes) VALUES

(uid, 'Bœuf bourguignon', '', 6, 30, 180,
'["1,5 kg de bœuf (gîte ou paleron)","750ml de vin rouge Bourgogne","200g de lardons","300g de champignons","2 carottes","2 oignons","3 gousses d''ail","2 c. à soupe de farine","Thym, laurier, persil","2 c. à soupe d''huile","Sel, poivre"]',
'["Couper le bœuf en gros cubes. Faire mariner 12h dans le vin avec les légumes et les herbes.","Égoutter la viande et faire dorer dans l''huile chaude.","Faire revenir les lardons, les carottes et les oignons.","Singer avec la farine, mélanger.","Ajouter la marinade, l''ail et les herbes. Porter à ébullition.","Mijoter au four à 160°C pendant 3 heures.","Ajouter les champignons 30 minutes avant la fin. Rectifier l''assaisonnement."]',
true, 'approved', 'Grand classique de la cuisine française'),

(uid, 'Quiche lorraine', '', 6, 20, 35,
'["1 pâte brisée","200g de lardons fumés","3 œufs","200ml de crème fraîche","100ml de lait","100g de gruyère râpé","Sel, poivre, noix de muscade"]',
'["Préchauffer le four à 180°C.","Foncer un moule à tarte avec la pâte brisée. Piquer le fond.","Faire revenir les lardons à sec. Laisser refroidir.","Battre les œufs avec la crème et le lait. Saler, poivrer, muscade.","Répartir les lardons sur le fond de tarte.","Verser l''appareil, parsemer de gruyère.","Cuire 35 minutes jusqu''à dorure et prise de l''appareil."]',
true, 'approved', 'Tarte salée alsacienne-lorraine'),

(uid, 'Ratatouille provençale', '', 4, 30, 45,
'["2 courgettes","1 aubergine","2 poivrons (rouge et vert)","4 tomates","2 oignons","4 gousses d''ail","Herbes de Provence","4 c. à soupe d''huile d''olive","Sel, poivre","Basilic frais"]',
'["Couper tous les légumes en cubes de 2 cm.","Faire revenir séparément chaque légume dans l''huile d''olive. Réserver.","Dans la même casserole, faire revenir les oignons et l''ail.","Ajouter les tomates concassées et les herbes de Provence.","Incorporer tous les légumes réservés, mélanger délicatement.","Mijoter 30 minutes à feu doux à couvert.","Rectifier l''assaisonnement. Parsemer de basilic frais."]',
true, 'approved', 'Classique provençal'),

(uid, 'Pot-au-feu', '', 6, 30, 180,
'["1 kg de bœuf (gîte, paleron)","1 os à moelle","3 carottes","3 navets","2 poireaux","4 pommes de terre","1 oignon piqué de clous de girofle","Bouquet garni","Gros sel, poivre en grains","Moutarde et cornichons pour servir"]',
'["Mettre la viande et l''os dans une grande marmite, couvrir d''eau froide.","Porter à ébullition, écumer soigneusement.","Ajouter l''oignon, le bouquet garni, le poivre et le gros sel.","Mijoter 2 heures à feu doux.","Ajouter les légumes pelés et coupés, cuire encore 45 minutes.","Servir le bouillon en entrée avec des croûtons.","Dresser la viande et les légumes, accompagner de moutarde et cornichons."]',
true, 'approved', 'Plat traditionnel français par excellence'),

(uid, 'Soupe à l''oignon gratinée', '', 4, 20, 45,
'["1 kg d''oignons","50g de beurre","1 verre de vin blanc","1 litre de bouillon de bœuf","Tranches de pain rassis","150g de gruyère râpé","Sel, poivre","Thym, laurier"]',
'["Émincer finement les oignons. Les faire fondre dans le beurre à feu très doux 30 minutes en remuant souvent jusqu''à caramélisation.","Déglacer au vin blanc, laisser évaporer.","Verser le bouillon, ajouter thym et laurier. Mijoter 20 minutes.","Rectifier l''assaisonnement.","Verser dans des bols allant au four. Placer les croûtons.","Couvrir généreusement de gruyère râpé.","Gratiner sous le grill 5 minutes jusqu''à dorure."]',
true, 'approved', 'Soupe à l''oignon parisienne'),

(uid, 'Gratin dauphinois', '', 6, 20, 60,
'["1,2 kg de pommes de terre","500ml de crème fraîche","200ml de lait","2 gousses d''ail","Noix de muscade","Sel, poivre","Beurre pour le plat"]',
'["Préchauffer le four à 170°C.","Éplucher et trancher finement les pommes de terre (2mm).","Frotter le plat à gratin avec l''ail, puis le beurrer.","Mélanger la crème, le lait, la muscade, le sel et le poivre.","Disposer les pommes de terre en couches, verser le mélange crème à chaque couche.","Terminer par une couche bien nappée de crème.","Cuire 60 minutes jusqu''à ce que les pommes de terre soient fondantes et le dessus doré."]',
true, 'approved', 'Gratin dauphinois authentique'),

(uid, 'Crêpes bretonnes', '', 4, 15, 20,
'["250g de farine","3 œufs","500ml de lait","1 c. à soupe de sucre","1 pincée de sel","2 c. à soupe de beurre fondu","1 c. à soupe de rhum ou fleur d''oranger (facultatif)"]',
'["Mélanger la farine, le sucre et le sel dans un grand bol.","Creuser un puits, ajouter les œufs un à un en fouettant.","Incorporer progressivement le lait pour éviter les grumeaux.","Ajouter le beurre fondu et le rhum. Laisser reposer 1 heure.","Faire chauffer une poêle légèrement beurrée.","Verser une louche de pâte, faire tourner la poêle pour étaler.","Cuire 1 minute par face. Servir avec du sucre, confiture ou Nutella."]',
true, 'approved', 'Crêpes de la Chandeleur'),

(uid, 'Tarte tatin', '', 6, 20, 40,
'["1 pâte feuilletée","6 pommes (Golden ou Reinette)","100g de beurre","150g de sucre","1 c. à café de vanille","Crème fraîche pour servir"]',
'["Éplucher et couper les pommes en quartiers.","Dans une poêle allant au four, faire fondre le beurre et le sucre jusqu''à caramel doré.","Disposer les quartiers de pommes serrés dans le caramel, côté bombé vers le bas.","Cuire 15 minutes à feu moyen.","Préchauffer le four à 200°C.","Poser la pâte feuilletée sur les pommes, rentrer les bords.","Cuire 25 minutes. Démouler à chaud en retournant d''un coup vif."]',
true, 'approved', 'Dessert classique français'),

(uid, 'Blanquette de veau', '', 4, 30, 90,
'["800g de veau (épaule)","2 carottes","1 oignon","200g de champignons","200ml de crème fraîche","2 jaunes d''œufs","50g de beurre","50g de farine","Bouquet garni","Sel, poivre","Jus de citron"]',
'["Mettre le veau dans une casserole, couvrir d''eau froide. Porter à ébullition, écumer.","Ajouter carottes, oignon, bouquet garni, sel. Cuire 1h à feu doux.","Retirer la viande. Faire un roux avec le beurre et la farine, mouiller avec le bouillon filtré.","Ajouter les champignons, cuire 15 minutes.","Mélanger crème et jaunes d''œufs. Incorporer hors du feu dans la sauce.","Remettre le veau, chauffer sans bouillir.","Corriger l''assaisonnement, ajouter le citron. Servir avec du riz."]',
true, 'approved', 'Classique de la cuisine familiale française'),

(uid, 'Mousse au chocolat', '', 6, 20, 0,
'["200g de chocolat noir","6 œufs","40g de sucre","1 pincée de sel"]',
'["Faire fondre le chocolat au bain-marie. Laisser tiédir.","Séparer les blancs des jaunes.","Battre les jaunes avec le sucre jusqu''à blanchiment, incorporer le chocolat fondu.","Monter les blancs en neige ferme avec la pincée de sel.","Incorporer délicatement les blancs en neige au mélange chocolaté en 3 fois.","Répartir dans des coupes ou verres.","Réfrigérer au moins 4 heures avant de servir."]',
true, 'approved', 'Dessert incontournable français'),

(uid, 'Coq au vin', '', 4, 30, 90,
'["1 poulet coupé en morceaux","750ml de vin rouge","150g de lardons","200g de champignons","2 oignons","3 gousses d''ail","2 c. à soupe de farine","Bouquet garni","2 c. à soupe d''huile","Sel, poivre"]',
'["Faire mariner le poulet dans le vin avec les herbes et l''ail 12 heures.","Égoutter et faire dorer les morceaux dans l''huile. Réserver.","Faire revenir les lardons et les oignons.","Singer avec la farine, mélanger.","Remettre le poulet, verser la marinade. Porter à ébullition.","Mijoter 1h à feu doux.","Ajouter les champignons 15 minutes avant la fin. Rectifier l''assaisonnement."]',
true, 'approved', 'Classique du terroir français'),

(uid, 'Crème brûlée', '', 4, 15, 45,
'["500ml de crème entière","6 jaunes d''œufs","100g de sucre","1 gousse de vanille","Cassonade pour caraméliser"]',
'["Préchauffer le four à 150°C.","Faire chauffer la crème avec la vanille fendue.","Fouetter les jaunes avec le sucre jusqu''à blanchiment.","Verser la crème chaude progressivement sur les jaunes en fouettant.","Répartir dans des ramequins.","Cuire au bain-marie 40-45 minutes. La crème doit être légèrement tremblotante.","Réfrigérer 2 heures. Saupoudrer de cassonade et brûler au chalumeau."]',
true, 'approved', 'Dessert français élégant'),

(uid, 'Clafoutis aux cerises', '', 6, 15, 45,
'["500g de cerises","3 œufs","100g de sucre","75g de farine","300ml de lait","50g de beurre fondu","1 c. à café de vanille","Sucre glace pour servir"]',
'["Préchauffer le four à 180°C. Beurrer un plat à gratin.","Disposer les cerises (avec noyaux pour la tradition) dans le plat.","Battre les œufs avec le sucre.","Incorporer la farine, le lait, le beurre fondu et la vanille.","Verser l''appareil sur les cerises.","Cuire 40-45 minutes jusqu''à ce que le clafoutis soit doré et gonflé.","Saupoudrer de sucre glace. Servir tiède ou froid."]',
true, 'approved', 'Dessert rustique français');

END $$;
