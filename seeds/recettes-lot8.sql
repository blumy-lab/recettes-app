-- LOT 8 — Française (20) + Italienne/Méd (20) + Afrique (20) = 60 recettes

DO $$
DECLARE
  uid uuid := '97a98e5c-d29d-4a9f-9d84-0684eef75fe6'::uuid;
BEGIN

-- ═══════════════════════════════════════════════════
-- 🥐 CUISINE FRANÇAISE (fin)
-- ═══════════════════════════════════════════════════

INSERT INTO recipes (user_id, title, source_url, servings, prep_time, cook_time, ingredients, steps, is_public, moderation_status, user_notes) VALUES

(uid, 'Ratatouille niçoise', '', 4, 20, 50,
'["2 courgettes","2 aubergines","2 poivrons","4 tomates","2 oignons","4 gousses d''ail","Herbes de Provence","Huile d''olive","Sel, poivre"]',
'["Couper tous les légumes en cubes réguliers de 2 cm.","Faire revenir séparément chaque légume dans l''huile d''olive. Réserver.","Dans la même cocotte, faire revenir les oignons et l''ail.","Ajouter les tomates pelées et coupées. Cuire 10 minutes.","Incorporer tous les légumes revenus.","Assaisonner avec les herbes de Provence, sel et poivre.","Mijoter 30 minutes à feu doux à couvert. La ratatouille est meilleure réchauffée le lendemain."]',
true, 'approved', 'Légumes mijotés provençaux'),

(uid, 'Lapin à la moutarde', '', 4, 15, 60,
'["1 lapin coupé en morceaux","3 c. à soupe de moutarde de Dijon","200ml de crème fraîche","200ml de vin blanc","2 échalotes","Thym, laurier","Huile, beurre","Sel, poivre"]',
'["Badigeonner généreusement les morceaux de lapin de moutarde.","Faire dorer dans le beurre et l''huile sur toutes les faces.","Faire revenir les échalotes dans la même cocotte.","Déglacer au vin blanc. Ajouter les herbes.","Remettre le lapin. Couvrir et mijoter 45 minutes.","En fin de cuisson, incorporer la crème fraîche.","Rectifier l''assaisonnement et servir avec des tagliatelles."]',
true, 'approved', 'Lapin crémeux à la moutarde'),

(uid, 'Tarte au citron meringuée', '', 8, 30, 30,
'["Pâte sablée cuite à blanc","Crème citron : 4 citrons, 4 œufs, 150g de sucre, 100g de beurre, 20g de maïzena","Meringue italienne : 3 blancs, 200g de sucre, 60ml d''eau"]',
'["Préparer la crème : chauffer jus de citron, sucre, maïzena. Ajouter les œufs battus. Cuire en remuant.","Hors du feu, incorporer le beurre en morceaux. Laisser refroidir.","Verser la crème citron sur le fond de tarte cuit. Réfrigérer.","Meringue : cuire le sucre et l''eau à 121°C. Verser en filet sur les blancs montés.","Fouetter jusqu''à refroidissement. La meringue est lisse et brillante.","Garnir la tarte de meringue à la poche ou à la cuillère.","Dorer au chalumeau ou sous le gril du four."]',
true, 'approved', 'Tarte acidulée et meringuée'),

(uid, 'Andouillette lyonnaise à la moutarde', '', 4, 5, 20,
'["4 andouillettes","2 c. à soupe de moutarde à l''ancienne","100ml de vin blanc","2 échalotes","200ml de crème fraîche","Beurre","Persil","Sel, poivre"]',
'["Faire griller les andouillettes dans une poêle beurrée 8 minutes en les retournant.","Réserver au chaud.","Dans la même poêle, faire fondre les échalotes hachées.","Déglacer au vin blanc. Réduire de moitié.","Incorporer la moutarde et la crème fraîche.","Laisser réduire jusqu''à sauce nappante.","Napper les andouillettes de sauce. Parsemer de persil. Servir avec des frites."]',
true, 'approved', 'Spécialité lyonnaise'),

(uid, 'Profiteroles au chocolat', '', 4, 30, 30,
'["Pâte à choux : 125ml eau, 50g beurre, 75g farine, 2 œufs","Glace vanille","Sauce chocolat chaude : 200g chocolat noir, 200ml crème"]',
'["Préparer la pâte à choux : bouillir eau et beurre, incorporer la farine, dessécher. Incorporer les œufs un à un.","Pocher des petits choux sur une plaque. Cuire à 200°C 25 minutes. Ne pas ouvrir le four.","Laisser refroidir complètement.","Sauce : faire chauffer la crème, verser sur le chocolat haché. Mélanger.","Couper les choux en deux. Garnir de glace vanille.","Dresser en pyramide dans des assiettes.","Napper généreusement de sauce chocolat chaude. Servir immédiatement."]',
true, 'approved', 'Choux fourrés à la crème glacée'),

(uid, 'Bœuf bourguignon', '', 6, 30, 180,
'["1 kg de bœuf (gîte ou paleron)","750ml de bourgogne rouge","200g de lardons","200g de champignons de Paris","20 oignons grelots","3 carottes","Bouquet garni","Farine","Beurre, huile","Sel, poivre"]',
'["Faire mariner le bœuf en cubes avec le vin, les carottes et le bouquet garni. Minimum 4 heures.","Faire dorer les lardons. Réserver. Faire dorer les oignons. Réserver.","Égoutter la viande, la fariner légèrement. Faire dorer dans l''huile.","Verser la marinade. Porter à ébullition. Écumer.","Ajouter lardons et oignons. Mijoter 2h30 à feu doux.","Faire sauter les champignons au beurre. Ajouter en fin de cuisson.","La sauce doit être nappante. Servir avec des pommes de terre ou des pâtes."]',
true, 'approved', 'Le grand classique bourguignon'),

(uid, 'Crème brûlée à la vanille', '', 4, 15, 45,
'["500ml de crème entière","5 jaunes d''œufs","100g de sucre","2 gousses de vanille","Sucre cassonade pour caraméliser"]',
'["Préchauffer le four à 150°C.","Porter la crème à frémissement avec la vanille fendue. Laisser infuser 10 minutes.","Fouetter les jaunes avec le sucre jusqu''à blanchiment.","Verser la crème chaude progressivement en fouettant.","Filtrer et répartir dans des ramequins.","Cuire au bain-marie 40-45 minutes. La crème doit trembler légèrement au centre.","Réfrigérer. Avant de servir, saupoudrer de cassonade et caraméliser au chalumeau."]',
true, 'approved', 'Dessert français emblématique'),

(uid, 'Salade lyonnaise aux lardons', '', 4, 10, 15,
'["2 salades frisée","200g de lardons fumés","4 œufs","3 tranches de pain de campagne","2 gousses d''ail","Vinaigrette : vinaigre de vin, huile, moutarde, sel, poivre"]',
'["Frotter les tranches de pain avec l''ail. Les couper en cubes (croûtons).","Faire dorer les croûtons dans l''huile. Réserver.","Faire dorer les lardons. Réserver.","Pocher les œufs dans de l''eau frémissante vinaigrée 3 minutes.","Préparer la vinaigrette avec la graisse des lardons et le vinaigre.","Dresser la salade frisée avec les lardons et les croûtons.","Poser un œuf poché par assiette. Arroser de vinaigrette chaude."]',
true, 'approved', 'Salade bouchon lyonnais'),

(uid, 'Madeleine de Commercy', '', 20, 15, 12,
'["3 œufs","150g de sucre","200g de farine","1 sachet de levure","150g de beurre fondu","1 c. à café de vanille","Zeste de citron","1 pincée de sel"]',
'["Battre les œufs avec le sucre jusqu''à mélange mousseux.","Incorporer la farine et la levure tamisées.","Ajouter le beurre fondu refroidi, la vanille, le zeste et le sel.","Réfrigérer la pâte 1 heure (indispensable pour la bosse).","Préchauffer le four à 220°C.","Beurrer et fariner des moules à madeleines. Remplir aux 3/4.","Cuire 5 minutes à 220°C puis 7 minutes à 180°C. Servir tiède."]',
true, 'approved', 'Petits gâteaux dorés en forme de coquillage'),

(uid, 'Dauphinois de cèpes', '', 4, 20, 50,
'["800g de pommes de terre","300g de cèpes frais ou reconstitués","2 gousses d''ail","300ml de crème","100ml de lait","50g de gruyère","Persil frais","Huile d''olive","Sel, poivre"]',
'["Nettoyer et trancher les cèpes. Les faire sauter à l''huile d''olive avec l''ail.","Saler, poivrer et parsemer de persil.","Trancher finement les pommes de terre.","Alterner couches de pommes de terre et de cèpes dans un plat beurré.","Mélanger crème et lait. Verser sur les pommes de terre.","Parsemer de gruyère.","Cuire à 180°C pendant 45-50 minutes."]',
true, 'approved', 'Gratin de pommes de terre aux champignons'),

-- ═══════════════════════════════════════════════════
-- 🇮🇹 CUISINE ITALIENNE / MÉDITERRANÉENNE (suite)
-- ═══════════════════════════════════════════════════

(uid, 'Osso buco à la milanaise', '', 4, 15, 90,
'["4 tranches de jarret de veau","2 oignons","2 carottes","2 branches de céleri","400g de tomates","200ml de vin blanc","300ml de bouillon de veau","Farine","Gremolata : zeste de citron, persil, ail","Huile d''olive, beurre","Sel, poivre"]',
'["Fariner les jarrets. Faire dorer dans le beurre et l''huile.","Faire revenir oignons, carottes et céleri dans la même cocotte.","Déglacer au vin blanc. Ajouter les tomates et le bouillon.","Remettre les jarrets. Couvrir.","Mijoter 1h30 jusqu''à ce que la viande se détache de l''os.","Préparer la gremolata : mélanger zeste de citron, persil et ail hachés.","Servir nappé de sauce, saupoudré de gremolata. Accompagner de risotto safran."]',
true, 'approved', 'Jarret de veau braisé milanais'),

(uid, 'Arancini di riso siciliani', '', 6, 30, 20,
'["400g de riz arborio","1 litre de bouillon","1 oignon","1 sachet de safran","100g de parmesan","Farce : 200g de bœuf haché, 100g de petits pois, sauce tomate","100g de mozzarella en dés","Chapelure, farine, œuf pour paner","Huile de friture"]',
'["Préparer un risotto safran : faire revenir l''oignon, ajouter le riz et le bouillon progressivement avec le safran.","Incorporer le parmesan. Laisser refroidir.","Préparer la farce : faire revenir le bœuf avec les petits pois et la sauce tomate.","Former des boules de riz. Creuser le centre, garnir de farce et mozzarella. Refermer.","Paner : farine, œuf battu, chapelure.","Faire frire à 180°C jusqu''à dorure.","Égoutter et servir chaud."]',
true, 'approved', 'Boulettes de riz farcies siciliennes'),

(uid, 'Pappardelle au sanglier', '', 4, 20, 120,
'["400g de pappardelle","500g de sanglier (ou bœuf) en morceaux","1 oignon","3 gousses d''ail","2 carottes","400g de tomates concassées","200ml de vin rouge","Romarin, sauge","Parmesan","Huile d''olive, sel, poivre"]',
'["Faire mariner le sanglier avec le vin, les herbes et les légumes 12 heures.","Faire dorer les morceaux dans l''huile d''olive.","Ajouter les légumes de la marinade et les tomates.","Verser la marinade filtrée.","Mijoter 1h30 à 2 heures jusqu''à tendreté.","Effilocher grossièrement la viande dans la sauce.","Cuire les pappardelle al dente. Mélanger avec le ragù. Parsemer de parmesan."]',
true, 'approved', 'Pâtes larges au ragù de sanglier'),

(uid, 'Focaccia aux olives et romarin', '', 6, 20, 25,
'["500g de farine","1 sachet de levure","300ml d''eau tiède","8 c. à soupe d''huile d''olive","100g d''olives noires","Romarin frais","Fleur de sel","1 c. à café de sel"]',
'["Mélanger farine, levure, sel. Ajouter l''eau et 4 c. d''huile. Pétrir 10 minutes.","Laisser lever 1h30 dans un endroit chaud.","Étaler dans une plaque huilée de manière épaisse (2 cm).","Laisser lever encore 30 minutes.","Creuser des trous profonds avec les doigts.","Badigeonner d''huile d''olive. Déposer olives et romarin dans les trous.","Parsemer de fleur de sel. Cuire à 220°C pendant 20-25 minutes."]',
true, 'approved', 'Pain plat italien aux olives'),

(uid, 'Vitello tonnato', '', 6, 20, 60,
'["600g de rôti de veau","Sauce : 200g de thon en boîte, 3 filets d''anchois, 50g de câpres, 2 jaunes d''œufs, 150ml d''huile d''olive, jus de citron"]',
'["Faire cuire le rôti de veau dans un bouillon court (eau, vin blanc, céleri, carotte) 45 minutes.","Laisser refroidir complètement dans le bouillon.","Préparer la sauce tonnato : mixer thon, anchois, câpres et jaunes d''œufs.","Monter en ajoutant l''huile en filet. Ajouter le jus de citron.","La sauce doit être lisse et crémeuse. Ajuster sel si nécessaire.","Trancher le veau très finement.","Disposer sur un plat. Napper de sauce tonnato. Décorer de câpres."]',
true, 'approved', 'Veau froid sauce thon-câpres'),

(uid, 'Panzanella toscane', '', 4, 15, 0,
'["400g de pain rassis","4 tomates mûres","1 concombre","1 oignon rouge","Basilic frais","4 c. à soupe d''huile d''olive","2 c. à soupe de vinaigre de vin rouge","Sel, poivre"]',
'["Tremper le pain rassis dans l''eau 5 minutes. Essorer.","Couper les tomates en quartiers.","Éplucher et couper le concombre en dés.","Émincer finement l''oignon rouge.","Émietter le pain essoré dans un saladier.","Ajouter tous les légumes, le basilic et assaisonner.","Laisser reposer 30 minutes avant de servir pour que les saveurs se mélangent."]',
true, 'approved', 'Salade de pain toscan'),

(uid, 'Saltimbocca alla romana', '', 4, 15, 15,
'["8 escalopes de veau fines","8 tranches de jambon de Parme","8 feuilles de sauge","100ml de marsala ou vin blanc","Beurre","Farine","Sel, poivre"]',
'["Poser sur chaque escalope une tranche de jambon et une feuille de sauge. Fixer avec un cure-dent.","Fariner légèrement les escalopes côté veau.","Faire fondre le beurre dans une poêle chaude.","Faire dorer les escalopes côté jambon 2 minutes, puis retourner 1 minute.","Retirer et réserver au chaud.","Déglacer avec le marsala. Réduire 2 minutes.","Napper les saltimbocca de sauce. Servir immédiatement."]',
true, 'approved', 'Escalopes romaines au jambon et sauge'),

(uid, 'Salade grecque classique', '', 4, 10, 0,
'["4 tomates","1 concombre","1 poivron vert","1 oignon rouge","200g de feta","100g d''olives de Kalamata","Origan séché","Huile d''olive","Sel, poivre"]',
'["Couper les tomates en quartiers et le concombre en rondelles épaisses.","Émincer le poivron vert et l''oignon rouge en rondelles.","Disposer tous les légumes dans un saladier.","Poser la feta en bloc ou émiettée par-dessus.","Ajouter les olives.","Saupoudrer d''origan séché.","Assaisonner avec l''huile d''olive, le sel et le poivre."]',
true, 'approved', 'Salade grecque traditionnelle'),

(uid, 'Moussaka grecque', '', 6, 30, 60,
'["3 aubergines","500g de bœuf ou agneau haché","400g de tomates concassées","1 oignon","3 gousses d''ail","Cannelle, origan","Béchamel : 50g beurre, 50g farine, 500ml lait, 2 jaunes d''œufs, parmesan","Sel, poivre, huile d''olive"]',
'["Trancher les aubergines. Faire griller à l''huile d''olive.","Préparer la farce : faire revenir oignon, ail, viande. Ajouter tomates, cannelle, origan. Mijoter 20 minutes.","Préparer la béchamel. Hors du feu, incorporer les jaunes et le parmesan.","Monter la moussaka : couche d''aubergines, farce à la viande, aubergines, béchamel.","Parsemer de parmesan.","Cuire à 180°C pendant 45 minutes.","Laisser reposer 15 minutes avant de couper."]',
true, 'approved', 'Gratin d''aubergines grec'),

(uid, 'Paella valenciana', '', 4, 20, 40,
'["300g de riz rond (bomba)","400g de poulet","300g de lapin","200g de haricots verts","200g de haricots plats","4 tomates","1 c. à café de paprika","Safran","800ml de bouillon de volaille","Huile d''olive","Sel"]',
'["Faire chauffer l''huile dans une paellera (ou grande poêle plate).","Faire dorer les morceaux de poulet et de lapin sur toutes les faces.","Ajouter les haricots et faire revenir.","Incorporer les tomates râpées et le paprika. Cuire 5 minutes.","Verser le bouillon chaud avec le safran. Porter à ébullition.","Ajouter le riz uniformément. Cuire 18-20 minutes sans remuer.","Laisser reposer 5 minutes couvert. Le fond doit former le socarrat (croûte dorée)."]',
true, 'approved', 'Paella valencienne au poulet et lapin'),

-- ═══════════════════════════════════════════════════
-- 🌍 AFRIQUE SUBSAHARIENNE + MAGHREB (suite)
-- ═══════════════════════════════════════════════════

(uid, 'Tajine de poulet aux olives et citrons confits', '', 4, 20, 60,
'["1 poulet coupé en morceaux","2 oignons","4 gousses d''ail","1 citron confit","100g d''olives vertes","1 c. à café de curcuma","1 c. à café de gingembre","1 c. à café de cumin","Coriandre et persil","Huile d''olive","Sel, poivre"]',
'["Faire revenir les oignons et l''ail dans l''huile d''olive.","Ajouter le poulet et faire dorer sur toutes les faces.","Incorporer les épices : curcuma, gingembre, cumin.","Ajouter le citron confit coupé en quartiers et les olives.","Verser un verre d''eau. Couvrir le tajine.","Cuire à feu doux 45-60 minutes.","Parsemer de coriandre et persil frais. Servir avec du pain khobz."]',
true, 'approved', 'Tajine marocain classique'),

(uid, 'Mafé sénégalais (ragoût à l''arachide)', '', 4, 20, 60,
'["500g de bœuf ou poulet","3 c. à soupe de pâte d''arachide (cacahuète)","400g de tomates concassées","1 oignon","3 gousses d''ail","2 carottes","2 patates douces","1 piment","Huile, sel, poivre","Riz pour servir"]',
'["Faire dorer la viande dans l''huile. Réserver.","Faire revenir l''oignon et l''ail.","Ajouter les tomates. Cuire 10 minutes.","Incorporer la pâte d''arachide diluée dans un peu d''eau.","Remettre la viande avec les légumes et le piment.","Couvrir d''eau à hauteur. Mijoter 40 minutes.","Servir avec du riz blanc. La sauce doit être épaisse et parfumée."]',
true, 'approved', 'Ragoût sénégalais à la sauce arachide'),

(uid, 'Injera éthiopien avec doro wat', '', 4, 30, 60,
'["Injera : 300g de farine de teff, 300ml d''eau, levain naturel (fermenté 24h)","Doro wat : 1 poulet, 3 oignons, 4 gousses d''ail, 3 c. berbéré (épices), 2 c. beurre clarifié, 4 œufs durs"]',
'["Injera : mélanger farine de teff, eau et levain. Laisser fermenter 24h.","Cuire comme des crêpes épaisses et légèrement spongieuses dans une poêle sèche chaude.","Doro wat : caraméliser lentement les oignons 30 minutes sans huile.","Ajouter le beurre clarifié, l''ail et le berbéré. Cuire 5 minutes.","Ajouter le poulet en morceaux et un peu d''eau.","Mijoter 30 minutes. Ajouter les œufs durs entiers en fin de cuisson.","Servir le doro wat sur l''injera. On mange avec les doigts, en déchirant l''injera."]',
true, 'approved', 'Plat national éthiopien'),

(uid, 'Poulet yassa sénégalais', '', 4, 30, 40,
'["1 poulet coupé en morceaux","4 oignons","4 gousses d''ail","Jus de 3 citrons","2 c. à soupe de moutarde","1 piment","Huile","Sel, poivre","Riz pour servir"]',
'["Faire mariner le poulet avec les oignons émincés, l''ail, le jus de citron, la moutarde et le piment. 2 heures minimum.","Séparer le poulet de la marinade.","Faire griller le poulet au four ou à la poêle jusqu''à dorure.","Faire revenir les oignons de la marinade dans l''huile jusqu''à caramélisation.","Ajouter le reste de la marinade. Cuire 10 minutes.","Remettre le poulet dans la sauce. Mijoter 15 minutes.","Servir avec du riz blanc."]',
true, 'approved', 'Poulet mariné citron-oignon sénégalais'),

(uid, 'Couscous royal maghrébin', '', 6, 30, 90,
'["500g de couscous","300g d''agneau en morceaux","2 merguez","2 blancs de poulet","3 carottes","2 navets","2 courgettes","400g de pois chiches","Bouillon épicé : curcuma, cannelle, cumin, paprika, concentré de tomate","Harissa pour servir"]',
'["Faire revenir les viandes dans l''huile. Réserver.","Préparer le bouillon : faire revenir les légumes, ajouter les épices et le concentré.","Ajouter les viandes et les pois chiches. Couvrir d''eau.","Mijoter 1 heure.","Cuire le couscous selon les instructions en le gonflant à la vapeur ou à l''eau bouillante.","Égrener le couscous avec un peu de beurre et de sel.","Servir le couscous surmonté des légumes et viandes, arrosé de bouillon. Harissa à part."]',
true, 'approved', 'Couscous complet aux trois viandes'),

(uid, 'Akara (beignets de niébé nigérians)', '', 6, 20, 15,
'["400g de niébé (haricots à œil noir) trempés","1 oignon","1 piment rouge","Sel","Huile de friture"]',
'["Tremper les niébés toute une nuit. Les frotter entre les paumes pour ôter les peaux.","Rincer abondamment pour enlever toutes les peaux qui flottent.","Mixer les haricots pelés avec l''oignon et le piment. Texture doit être lisse et épaisse.","Saler. Battre vigoureusement pour incorporer de l''air (texture légère).","Faire chauffer l''huile à 180°C.","Déposer des cuillerées de pâte dans l''huile. Frire 3-4 minutes jusqu''à dorure.","Égoutter. Servir comme en-cas ou petit déjeuner."]',
true, 'approved', 'Beignets de haricots nigérians'),

(uid, 'Chermoula (marinade nord-africaine) avec poisson', '', 4, 20, 20,
'["600g de filets de poisson (dorade ou bar)","Chermoula : 1 bouquet de coriandre, 1 bouquet de persil, 4 gousses d''ail, 1 c. à café de cumin, 1 c. à café de paprika, jus de citron, huile d''olive, sel"]',
'["Préparer la chermoula : mixer coriandre, persil, ail, cumin, paprika, jus de citron et huile.","Badigeonner généreusement les filets de chermoula.","Laisser mariner 30 minutes minimum.","Faire cuire les filets dans une poêle huilée 3 minutes de chaque côté.","Ou cuire au four à 200°C pendant 15 minutes.","Servir avec du couscous ou du riz.","Le reste de chermoula peut être servi comme sauce d''accompagnement."]',
true, 'approved', 'Poisson mariné aux herbes nord-africaines'),

(uid, 'Bobotie sud-africain', '', 4, 20, 45,
'["500g de bœuf haché","1 oignon","2 gousses d''ail","2 c. à soupe de curry en poudre","1 c. à soupe de curcuma","50g de raisins secs","2 c. à soupe de chutney de mangue","2 tranches de pain trempées dans du lait","Garniture : 2 œufs, 200ml de lait","Feuilles de laurier"]',
'["Faire revenir l''oignon et l''ail dans l''huile.","Ajouter le bœuf haché. Faire dorer.","Incorporer les épices, les raisins secs et le chutney.","Essorer le pain, l''émietter dans la viande. Bien mélanger.","Verser dans un plat beurré. Planter 2 feuilles de laurier.","Battre les œufs avec le lait. Verser sur la viande.","Cuire à 180°C pendant 35-40 minutes jusqu''à la garniture dorée."]',
true, 'approved', 'Plat national sud-africain épicé'),

(uid, 'Thiéboudienne sénégalais (riz au poisson)', '', 6, 30, 60,
'["600g de poisson (thiof ou daurade)","400g de riz long","400g de tomates concassées","3 oignons","4 gousses d''ail","2 carottes","1 chou","Yassah (aubergines africaines)","Piment, curcuma, cumin","Huile","Sel","Bisap (oseille) ou tamarin"]',
'["Farcir le poisson de piment, ail et sel. Faire dorer dans l''huile.","Dans la même marmite, faire revenir les oignons.","Ajouter les tomates et les épices. Cuire 10 minutes.","Ajouter les légumes coupés en gros morceaux.","Couvrir d''eau. Mijoter 20 minutes.","Retirer les légumes et le poisson. Mesurer le bouillon.","Cuire le riz dans le bouillon. Dresser avec le poisson et les légumes par-dessus."]',
true, 'approved', 'Plat national sénégalais riz-poisson'),

(uid, 'Tagine kefta tomate-œuf marocain', '', 4, 20, 30,
'["400g de bœuf ou agneau haché","1 oignon râpé","Persil, coriandre","1 c. à café de cumin","1 c. à café de paprika","Sauce : 400g de tomates, 1 oignon, ail, cumin, paprika, cannelle","4 œufs","Huile d''olive, sel, poivre"]',
'["Mélanger la viande hachée avec l''oignon râpé, les herbes et les épices.","Former de petites boulettes de 3 cm.","Préparer la sauce tomate : faire revenir oignon et ail, ajouter tomates et épices. Cuire 15 minutes.","Déposer les kefta dans la sauce.","Cuire à couvert 15 minutes.","Casser les œufs dans la sauce entre les kefta.","Cuire encore 5 minutes (blancs pris, jaunes coulants). Servir avec du pain khobz."]',
true, 'approved', 'Tagine de boulettes aux œufs marocain');

END $$;
