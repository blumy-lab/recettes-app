-- LOT PLATS MIJOTÉS — 50 recettes de plats mijotés, braisés et confits

DO $$
DECLARE
  uid uuid := '97a98e5c-d29d-4a9f-9d84-0684eef75fe6'::uuid;
BEGIN

-- ═══════════════════════════════════════════════════
-- 🥩 BŒUF MIJOTÉ
-- ═══════════════════════════════════════════════════

INSERT INTO recipes (user_id, title, source_url, servings, prep_time, cook_time, ingredients, steps, is_public, moderation_status, user_notes) VALUES

(uid, 'Bœuf bourguignon classique', '', 6, 30, 150,
'["1,2 kg de bœuf à braiser (paleron ou joue) en gros cubes","200g de lardons fumés","250g de champignons de Paris","3 carottes","2 oignons","4 gousses d''ail","1 bouteille de vin rouge de Bourgogne","300ml de bouillon de bœuf","2 c. à soupe de concentré de tomate","Farine, bouquet garni, beurre, huile","Sel, poivre"]',
'["Faire mariner le bœuf dans le vin rouge avec carottes, oignons, ail et bouquet garni toute une nuit.","Égoutter et sécher la viande. Filtrer la marinade et la réserver.","Faire dorer les lardons et les réserver. Dans la même cocotte, faire dorer les morceaux de bœuf sur toutes les faces.","Saupoudrer de farine, mélanger. Ajouter la marinade et le bouillon.","Incorporer le concentré de tomate. Porter à frémissement. Cuire à couvert 2h30 à feu très doux.","Faire sauter les champignons au beurre. Ajouter lardons et champignons dans la cocotte 20 minutes avant la fin.","Rectifier l''assaisonnement. Servir avec des pommes de terre vapeur ou des pâtes fraîches."]',
true, 'approved', 'La marinade overnight est le secret du bœuf bourguignon profond'),

(uid, 'Joue de bœuf braisée au vin rouge et carottes', '', 4, 20, 180,
'["1,2 kg de joues de bœuf","4 carottes","2 oignons","3 gousses d''ail","1 bouteille de vin rouge","200ml de bouillon de bœuf","2 branches de thym","2 feuilles de laurier","Huile, sel, poivre","Persil pour servir"]',
'["Préchauffer le four à 150°C.","Saler et poivrer les joues. Les faire dorer à l''huile dans une cocotte sur toutes les faces.","Réserver la viande. Faire revenir oignons, ail et carottes dans la même cocotte.","Remettre les joues. Verser le vin rouge et le bouillon. Ajouter thym et laurier.","Couvrir hermétiquement. Cuire au four 3 heures.","Sortir les joues. Réduire le jus de cuisson à feu vif si nécessaire pour le concentrer.","Remettre les joues dans la sauce. Parsemer de persil. Servir avec purée."]',
true, 'approved', 'La joue de bœuf est le morceau idéal pour braiser — collagène exceptionnel'),

(uid, 'Daube provençale aux olives et orange', '', 6, 25, 180,
'["1,2 kg de bœuf à braiser (gîte ou paleron) en gros cubes","150g d''olives noires","1 orange (zeste et jus)","2 boîtes de tomates concassées","2 oignons","4 gousses d''ail","500ml de vin blanc sec ou rosé de Provence","Thym, romarin, laurier, herbes de Provence","Huile d''olive, sel, poivre"]',
'["La veille : mariner le bœuf avec le vin, ail, oignons, herbes et zeste d''orange.","Égoutter et sécher la viande. Réserver la marinade.","Faire dorer la viande dans l''huile d''olive. Réserver.","Faire revenir oignons et ail. Ajouter tomates et marinade filtrée.","Remettre la viande, ajouter le jus d''orange. Couvrir et cuire à feu très doux 2h30-3h.","Ajouter les olives 30 minutes avant la fin. Retirer les aromates.","Rectifier l''assaisonnement. Servir avec des pâtes fraîches ou de la polenta."]',
true, 'approved', 'L''orange est la signature de la daube provençale — ne pas l''omettre'),

(uid, 'Carbonade flamande (bœuf à la bière brune)', '', 6, 20, 150,
'["1,2 kg de bœuf à braiser (paleron) en tranches","2 oignons","50cl de bière brune belge","2 c. à soupe de cassonade","2 c. à soupe de vinaigre de vin rouge","2 c. à soupe de moutarde de Dijon","2 tranches de pain d''épices","Thym, laurier, beurre, sel, poivre"]',
'["Faire dorer les tranches de bœuf dans le beurre. Réserver.","Faire caraméliser les oignons émincés dans la même cocotte 15 minutes.","Ajouter la cassonade et le vinaigre. Déglacer.","Remettre le bœuf. Verser la bière.","Tartiner les tranches de pain d''épices de moutarde et les déposer sur la viande (elles vont se dissoudre et épaissir la sauce).","Ajouter thym et laurier. Couvrir et mijoter 2h30 à feu doux.","Retirer le laurier, rectifier l''assaisonnement. Servir avec des frites ou de la purée."]',
true, 'approved', 'Le pain d''épices à la moutarde = épaississant naturel et goût unique'),

(uid, 'Goulash hongrois (pörkölt)', '', 6, 20, 120,
'["1,2 kg de bœuf à braiser en gros cubes","3 oignons","4 gousses d''ail","3 c. à soupe de paprika doux hongrois","1 c. à café de paprika fumé","1 c. à café de cumin","2 boîtes de tomates concassées","400ml de bouillon de bœuf","2 poivrons rouges","Huile, sel, poivre","Crème fraîche pour servir"]',
'["Faire revenir les oignons dans l''huile à feu moyen jusqu''à dorure.","Hors du feu, incorporer le paprika (évite l''amertume). Mélanger rapidement.","Remettre sur feu doux, ajouter l''ail et cuire 1 minute.","Ajouter le bœuf et faire dorer.","Incorporer tomates, bouillon, poivrons et épices.","Couvrir et mijoter 1h30 à 2h à feu doux en remuant régulièrement.","Servir avec des spätzle ou nouilles, une cuillère de crème fraîche."]',
true, 'approved', 'Le paprika doit être incorporé HORS du feu pour ne pas brûler et devenir amer'),

(uid, 'Bœuf aux carottes façon grand-mère', '', 6, 20, 150,
'["1,2 kg de paleron ou gîte en gros morceaux","600g de carottes","3 oignons","4 gousses d''ail","250ml de vin blanc sec","300ml de bouillon de bœuf","2 c. à soupe de concentré de tomate","Thym, laurier, persil","Farine, huile, beurre, sel, poivre"]',
'["Fariner légèrement les morceaux de bœuf et les faire dorer dans le beurre et l''huile.","Réserver. Faire revenir oignons et ail dans la même cocotte.","Déglacer au vin blanc. Laisser réduire 5 minutes.","Remettre la viande. Ajouter bouillon, concentré de tomate et aromates.","Cuire 1h30 à couvert. Ajouter les carottes coupées en grosses rondelles.","Poursuivre la cuisson 30 minutes. Retirer les aromates.","Rectifier l''assaisonnement. Parsemer de persil haché."]',
true, 'approved', 'Plat emblématique de la cuisine ménagère française'),

(uid, 'Queue de bœuf braisée au vin rouge', '', 4, 20, 240,
'["1,5 kg de queue de bœuf coupée en tronçons","1 bouteille de vin rouge","3 carottes","2 oignons","4 gousses d''ail","2 branches de céleri","Bouquet garni","2 c. à soupe de concentré de tomate","Huile, sel, poivre","Zeste d''orange optionnel"]',
'["La veille : mariner la queue de bœuf dans le vin avec légumes et bouquet garni.","Égoutter et sécher les morceaux. Réserver la marinade.","Faire dorer les tronçons dans l''huile sur toutes les faces. Réserver.","Faire revenir les légumes de la marinade. Ajouter le concentré de tomate.","Remettre la viande. Verser la marinade filtrée. Couvrir d''eau si nécessaire.","Cuire à couvert à feu très doux pendant 3h30 à 4h.","Désosser si souhaité. Dégraisser la sauce et la réduire. Servir avec gnocchi ou polenta."]',
true, 'approved', 'La queue de bœuf nécessite 4h minimum — patience récompensée'),

(uid, 'Pot-au-feu traditionnel', '', 8, 30, 180,
'["1 kg de plat de côtes","500g de paleron","500g d''os à moelle","4 carottes","3 poireaux","4 navets","4 branches de céleri","1 chou vert","2 oignons","Clous de girofle","Bouquet garni, gros sel, poivre en grains","Cornichons, moutarde et gros sel pour servir"]',
'["Mettre les viandes et os dans une grande marmite. Couvrir d''eau froide.","Porter lentement à ébullition. Écumer abondamment pendant 15 minutes.","Ajouter les oignons piqués de clous de girofle, le bouquet garni, sel et poivre.","Cuire à feu doux 1h30. Ajouter carottes, poireaux, navets et céleri.","Cuire encore 1h. Ajouter le chou blanchi 20 minutes avant la fin.","Cuire les os à moelle séparément dans le bouillon 20 minutes avant de servir.","Servir le bouillon en entrée, puis viandes et légumes avec condiments."]',
true, 'approved', 'Écumer soigneusement au début = bouillon limpide et goûteux'),

(uid, 'Blanquette de veau à l''ancienne', '', 6, 25, 90,
'["1,2 kg d''épaule de veau en morceaux","3 carottes","2 poireaux","1 oignon","2 gousses d''ail","250g de champignons de Paris","Bouquet garni, clous de girofle","Sauce : 50g de beurre, 50g de farine, 200ml de crème fraîche, 2 jaunes d''œuf, jus de citron","Sel, poivre blanc, muscade"]',
'["Couvrir le veau d''eau froide. Porter à ébullition et blanchir 5 minutes. Rincer.","Remettre dans la cocotte avec eau fraîche, carottes, poireaux, oignon, ail et bouquet garni.","Cuire à frémissement 1h30.","Filtrer le bouillon. Réserver viande et légumes.","Préparer le roux avec beurre et farine. Incorporer 600ml de bouillon chaud en fouettant.","Hors du feu, incorporer crème et jaunes d''œuf. Ajouter citron. Ne plus faire bouillir.","Remettre viande et champignons sautés dans la sauce. Servir avec riz ou pommes de terre."]',
true, 'approved', 'Ne jamais faire bouillir la sauce après les jaunes d''œuf — elle trancherait'),

(uid, 'Bœuf stroganoff', '', 4, 15, 20,
'["600g de filet de bœuf ou rumsteck en lanières","2 oignons","250g de champignons","300ml de crème fraîche épaisse","2 c. à soupe de moutarde de Dijon","1 c. à soupe de paprika doux","Bouillon de bœuf","Beurre, sel, poivre","Persil pour servir"]',
'["Faire sauter les oignons émincés dans le beurre à feu moyen.","Ajouter les champignons et cuire jusqu''à évaporation.","Faire dorer les lanières de bœuf à feu très vif en plusieurs fois. Réserver.","Dans la même poêle, ajouter bouillon, moutarde et paprika. Réduire 5 minutes.","Incorporer la crème fraîche. Cuire 5 minutes à feu moyen.","Remettre le bœuf et les légumes. Chauffer 2 minutes sans bouillir.","Parsemer de persil. Servir avec des nouilles larges."]',
true, 'approved', 'Saisir le bœuf à feu très vif en petites quantités pour le dorer sans le cuire'),

-- ═══════════════════════════════════════════════════
-- 🐑 AGNEAU MIJOTÉ
-- ═══════════════════════════════════════════════════

(uid, 'Navarin d''agneau printanier', '', 6, 30, 90,
'["1,2 kg d''épaule d''agneau en morceaux","200g de petits pois","200g de haricots verts","4 carottes nouvelles","8 petits navets","1 botte de radis (optionnel)","2 oignons nouveaux","3 gousses d''ail","250ml de vin blanc","300ml de bouillon d''agneau","Thym, romarin, laurier","Farine, huile, sel, poivre, sucre"]',
'["Faire dorer les morceaux d''agneau dans l''huile. Saupoudrer de farine.","Ajouter une pincée de sucre pour la caramélisation.","Incorporer oignons, ail, vin blanc et bouillon. Ajouter les herbes.","Mijoter à couvert 45 minutes.","Ajouter carottes et navets. Cuire encore 20 minutes.","Ajouter petits pois et haricots verts les 10 dernières minutes.","Rectifier l''assaisonnement. Parsemer de persil. Servir en cocotte."]',
true, 'approved', 'La pincée de sucre caramélise la viande — secret des bouchers'),

(uid, 'Épaule d''agneau confite 7 heures', '', 6, 15, 420,
'["1 épaule d''agneau entière (1,8 kg)","2 têtes d''ail entières","4 branches de romarin","4 branches de thym","200ml de vin blanc","200ml de bouillon","Huile d''olive généreuse","Gros sel, poivre"]',
'["Préchauffer le four à 120°C.","Piquer l''épaule de gousses d''ail et de brins de romarin.","Frotter généreusement d''huile d''olive, gros sel et poivre.","Déposer sur un lit de thym et romarin dans un plat à four.","Verser vin blanc et bouillon. Couvrir hermétiquement de deux couches d''aluminium.","Cuire 7 heures à 120°C. La viande doit se détacher à la fourchette.","Retirer l''aluminium. Passer au gril 5 minutes pour dorer. Effilocher et servir avec le jus."]',
true, 'approved', 'Cuisson basse température 7h = viande qui fond sans couteau'),

(uid, 'Irish stew (ragoût irlandais)', '', 6, 20, 120,
'["1,2 kg de collier ou épaule d''agneau en morceaux","600g de pommes de terre","3 oignons","4 carottes","4 branches de céleri","750ml de bouillon d''agneau","Thym, persil","Sel, poivre"]',
'["Dans une grande cocotte, alterner couches de viande, légumes et herbes.","Assaisonner chaque couche.","Verser le bouillon jusqu''à hauteur des ingrédients.","Porter à frémissement, écumer.","Cuire à couvert à feu doux pendant 1h30 à 2h.","Retirer les herbes. Rectifier l''assaisonnement.","Parsemer de persil frais. Servir directement dans la cocotte."]',
true, 'approved', 'Recette ultra-simple — la cuisson lente fait tout le travail'),

(uid, 'Tajine d''agneau aux légumes et épices', '', 4, 20, 90,
'["800g d''épaule d''agneau en morceaux","2 oignons","3 carottes","2 courgettes","2 tomates","1 aubergine","4 gousses d''ail","1 c. à café de ras-el-hanout","1 c. à café de curcuma","1 c. à café de cumin","1 c. à café de gingembre","Coriandre fraîche, huile d''olive","Sel, poivre"]',
'["Faire revenir les oignons et l''ail dans l''huile d''olive dans le tajine ou cocotte.","Ajouter les morceaux d''agneau et faire dorer.","Incorporer toutes les épices et cuire 2 minutes en remuant.","Ajouter les tomates coupées. Couvrir et cuire 40 minutes à feu doux.","Ajouter carottes, aubergine et courgettes. Mélanger délicatement.","Cuire encore 30 minutes à couvert jusqu''à ce que les légumes soient tendres.","Parsemer de coriandre fraîche. Servir avec du couscous."]',
true, 'approved', 'Respecter l''ordre d''ajout des légumes selon leur temps de cuisson'),

(uid, 'Agneau korma (curry doux à la crème et aux noix)', '', 4, 20, 70,
'["800g d''épaule d''agneau en cubes","2 oignons","50g d''amandes mondées","50g de noix de cajou","200ml de yaourt entier","200ml de crème de coco","2 c. à café de garam masala","1 c. à café de coriandre moulue","1 c. à café de cardamome","1 c. à café de curcuma","Safran, huile, sel","Coriandre fraîche"]',
'["Mixer oignons, amandes, noix de cajou en pâte fine avec un peu d''eau.","Faire revenir cette pâte dans l''huile 8-10 minutes à feu moyen.","Ajouter les épices. Cuire 2 minutes.","Incorporer le yaourt cuillère par cuillère en remuant constamment.","Ajouter l''agneau et faire dorer dans la sauce.","Verser la crème de coco et le safran. Couvrir et cuire 50-60 minutes.","Rectifier sel. Parsemer de coriandre. Servir avec riz basmati."]',
true, 'approved', 'Incorporer le yaourt progressivement évite qu''il tranche à la chaleur'),

(uid, 'Agneau à la grecque (stifado)', '', 6, 20, 120,
'["1,2 kg d''épaule d''agneau en morceaux","500g de petits oignons grelots","3 gousses d''ail","400ml de vin rouge","400g de tomates concassées","3 c. à soupe de vinaigre de vin rouge","2 c. à soupe de concentré de tomate","2 bâtons de cannelle","5 clous de girofle","2 feuilles de laurier","Huile d''olive, sel, poivre"]',
'["Faire dorer les morceaux d''agneau dans l''huile. Réserver.","Faire dorer les oignons grelots entiers.","Remettre l''agneau. Ajouter ail, vin rouge, vinaigre et concentré.","Incorporer tomates, cannelle, clous de girofle et laurier.","Couvrir et cuire à feu doux 1h45 à 2h.","La sauce doit réduire et devenir riche et foncée.","Retirer la cannelle et les clous. Rectifier l''assaisonnement. Servir avec riz ou pain pita."]',
true, 'approved', 'La cannelle dans les plats salés est la signature de la cuisine grecque'),

(uid, 'Agneau aux flageolets et romarin', '', 6, 20, 120,
'["1,2 kg d''épaule d''agneau en morceaux","500g de flageolets cuits (ou 2 boîtes)","3 carottes","2 oignons","4 gousses d''ail","300ml de vin blanc","400ml de bouillon","3 branches de romarin frais","2 feuilles de laurier","Thym, huile, sel, poivre"]',
'["Faire dorer l''agneau dans l''huile sur toutes les faces. Réserver.","Faire revenir oignons, ail et carottes dans la même cocotte.","Déglacer au vin blanc. Laisser réduire 5 minutes.","Remettre l''agneau. Ajouter bouillon, romarin, thym et laurier.","Couvrir et cuire 1 heure à feu doux.","Ajouter les flageolets égouttés. Cuire encore 20 minutes.","Retirer les herbes. Rectifier l''assaisonnement. Servir directement en cocotte."]',
true, 'approved', 'Plat de fête français classique — agneau et flageolets sont faits l''un pour l''autre'),

-- ═══════════════════════════════════════════════════
-- 🐷 PORC MIJOTÉ
-- ═══════════════════════════════════════════════════

(uid, 'Porc au cidre et aux pommes (Normandie)', '', 6, 20, 90,
'["1,2 kg d''échine de porc en morceaux","3 pommes (type Boskoop)","2 oignons","3 gousses d''ail","500ml de cidre brut","200ml de crème fraîche","2 branches de thym","2 feuilles de laurier","Beurre, huile, sel, poivre","Moutarde de Dijon"]',
'["Faire dorer les morceaux de porc dans le beurre et l''huile. Réserver.","Faire revenir oignons et ail dans la même cocotte.","Déglacer avec le cidre. Laisser réduire 5 minutes.","Remettre le porc. Ajouter thym, laurier et un peu de moutarde.","Couvrir et mijoter 1 heure à feu doux.","Peler les pommes et les couper en quartiers. Faire dorer au beurre.","Ajouter les pommes et la crème dans la cocotte. Chauffer 10 minutes. Servir avec des pommes de terre."]',
true, 'approved', 'Le cidre brut plutôt que doux pour équilibrer le gras du porc'),

(uid, 'Cassoulet maison (version simplifiée)', '', 8, 30, 120,
'["500g de haricots blancs (trempés et précuits)","400g de saucisses de Toulouse","300g de lard fumé en tranches épaisses","4 cuisses de canard confites (ou 400g de porc)","1 boîte de tomates concassées","4 gousses d''ail","2 oignons","Thym, laurier, clous de girofle","Chapelure, huile, sel, poivre"]',
'["Préchauffer le four à 160°C.","Faire revenir oignons et ail dans une grande cocotte allant au four.","Ajouter lard et faire dorer. Ajouter les saucisses de Toulouse entières.","Incorporer tomates, haricots précuits, herbes et épices. Couvrir de bouillon.","Poser les cuisses de canard par-dessus. Saupoudrer de chapelure.","Cuire 1h30 au four. Enfoncer la croûte et saupoudrer à nouveau à mi-cuisson.","Servir directement dans la cocotte. Le cassoulet est meilleur réchauffé le lendemain."]',
true, 'approved', 'Casser la croûte et la reformer 2 fois = cœur du savoir-faire du cassoulet'),

(uid, 'Porc aux lentilles à l''alsacienne', '', 6, 15, 75,
'["800g de sauté de porc en morceaux","400g de lentilles vertes","200g de lard fumé en dés","3 carottes","2 oignons","4 gousses d''ail","1 bouteille de bière blonde","400ml de bouillon","Thym, laurier, cumin","Moutarde, crème fraîche, sel, poivre"]',
'["Faire revenir le lard dans une cocotte. Ajouter et faire dorer le porc.","Faire suer oignons et ail dans les sucs de cuisson.","Déglacer à la bière. Laisser réduire 5 minutes.","Ajouter carottes, lentilles (rincées), bouillon et herbes.","Couvrir et cuire 45-50 minutes à feu doux jusqu''à tendreté des lentilles.","Ajouter 2 c. à soupe de moutarde et un peu de crème fraîche.","Rectifier l''assaisonnement. Parsemer de persil. Servir en cocotte."]',
true, 'approved', 'Ne pas saler les lentilles en début de cuisson'),

(uid, 'Échine de porc aux pruneaux et cognac', '', 6, 15, 90,
'["1,2 kg d''échine de porc en morceaux","200g de pruneaux dénoyautés","2 oignons","3 gousses d''ail","200ml de cognac ou armagnac","300ml de bouillon de poulet","200ml de crème fraîche","Thym, laurier","Beurre, sel, poivre"]',
'["Faire mariner les pruneaux dans le cognac pendant 30 minutes.","Faire dorer le porc dans le beurre. Réserver.","Faire revenir oignons et ail. Flamber au cognac de la marinade.","Remettre le porc. Ajouter bouillon, thym et laurier.","Mijoter à couvert 1 heure.","Ajouter les pruneaux égouttés. Cuire 20 minutes.","Incorporer la crème. Réduire 5 minutes. Rectifier l''assaisonnement."]',
true, 'approved', 'Le flambé n''est pas obligatoire mais ajoute de la profondeur'),

(uid, 'Sauté de porc à la moutarde et estragon', '', 4, 15, 60,
'["800g de sauté de porc en cubes","2 c. à soupe de moutarde à l''ancienne","200ml de vin blanc sec","300ml de crème fraîche épaisse","2 oignons","3 gousses d''ail","1 bouquet d''estragon frais","Beurre, huile, sel, poivre"]',
'["Faire dorer le porc dans beurre et huile. Réserver.","Faire revenir oignons et ail dans la même cocotte.","Déglacer au vin blanc. Laisser réduire de moitié.","Remettre le porc. Couvrir et cuire 40 minutes à feu doux.","Incorporer la moutarde à l''ancienne et la crème fraîche.","Laisser mijoter à découvert 10 minutes pour épaissir la sauce.","Ajouter l''estragon ciselé. Rectifier l''assaisonnement."]',
true, 'approved', 'L''estragon est l''herbe naturelle du porc — ne pas substituer'),

(uid, 'Potée auvergnate (porc et choux)', '', 8, 30, 150,
'["500g de palette de porc demi-sel","500g de jarret de porc","4 saucisses de Morteau ou Montbéliard","1 chou vert","4 carottes","4 navets","4 pommes de terre","2 poireaux","2 oignons","Clous de girofle, bouquet garni, poivre en grains","Moutarde pour servir"]',
'["Faire dessaler la palette 2h dans l''eau froide si très salée.","Mettre porc et jarret dans une grande marmite. Couvrir d''eau froide.","Porter à ébullition. Écumer. Ajouter oignons piqués, bouquet garni et poivre.","Cuire 1h30. Ajouter carottes, navets et poireaux.","Blanchir le chou 5 minutes à part. L''ajouter dans la marmite.","Ajouter pommes de terre 30 minutes avant la fin.","Cuire les saucisses piquées dans le bouillon 20 minutes avant de servir. Servir avec moutarde forte."]',
true, 'approved', 'Ne pas saler — la palette demi-sel sale naturellement le bouillon'),

(uid, 'Côtes de porc braisées aux champignons forestiers', '', 4, 15, 60,
'["4 côtes de porc échine épaisses","300g de champignons mélangés (cèpes, girolles, shiitake)","2 oignons","3 gousses d''ail","200ml de vin blanc","300ml de bouillon de veau","200ml de crème","Thym, laurier","Beurre, huile, sel, poivre, persil"]',
'["Faire dorer les côtes de porc dans beurre et huile. Réserver.","Faire sauter les champignons à feu vif. Réserver.","Dans la même cocotte, faire revenir oignons et ail.","Déglacer au vin blanc. Réduire.","Remettre les côtes. Ajouter bouillon, thym et laurier.","Braiser à couvert à feu doux 40 minutes.","Ajouter champignons et crème. Cuire 10 minutes découvert. Parsemer de persil."]',
true, 'approved', 'Champignons séchés réhydratés intensifient encore plus la sauce'),

-- ═══════════════════════════════════════════════════
-- 🍗 POULET MIJOTÉ
-- ═══════════════════════════════════════════════════

(uid, 'Coq au vin classique', '', 6, 30, 120,
'["1 poulet fermier de 2 kg coupé en morceaux","200g de lardons fumés","250g de champignons de Paris","24 oignons grelots","1 bouteille de vin rouge","300ml de bouillon de poulet","3 gousses d''ail","Bouquet garni, farine","Beurre, huile, sel, poivre","Cognac pour flamber (optionnel)"]',
'["Faire dorer les lardons et les oignons grelots. Réserver.","Faire dorer les morceaux de poulet sur toutes les faces. Flamber au cognac.","Saupoudrer de farine. Mélanger.","Verser le vin rouge et le bouillon. Ajouter ail et bouquet garni.","Couvrir et cuire à feu doux 45 minutes.","Faire sauter les champignons au beurre.","Ajouter champignons, lardons et oignons. Cuire 20 minutes. Retirer bouquet garni."]',
true, 'approved', 'Utiliser un vin qu''on boirait — jamais un vin médiocre pour cuisiner'),

(uid, 'Poulet basquaise (sauce tomate-poivrons)', '', 4, 20, 60,
'["1 poulet coupé en morceaux","3 poivrons (rouge, vert, jaune)","3 tomates bien mûres","2 oignons","4 gousses d''ail","200ml de vin blanc sec","1 bouquet de thym et laurier","Piment d''Espelette ou paprika piquant","Huile d''olive, sel, poivre"]',
'["Faire dorer les morceaux de poulet dans l''huile. Réserver.","Faire revenir les oignons et poivrons en lanières jusqu''à tendreté.","Ajouter l''ail et les tomates concassées. Cuire 10 minutes.","Déglacer au vin blanc. Réduire.","Remettre le poulet dans la sauce. Ajouter herbes et piment d''Espelette.","Couvrir et mijoter 35-40 minutes à feu doux.","Rectifier l''assaisonnement. Servir avec riz basque ou piperade."]',
true, 'approved', 'Le piment d''Espelette est l''âme du plat — ne pas substituer par du piment fort'),

(uid, 'Poulet chasseur (tomates, champignons, vin blanc)', '', 4, 20, 50,
'["1 poulet coupé en morceaux","300g de champignons de Paris","2 tomates","2 échalotes","3 gousses d''ail","200ml de vin blanc","200ml de bouillon de poulet","3 c. à soupe de concentré de tomate","Thym, estragon frais","Beurre, huile, sel, poivre"]',
'["Faire dorer les morceaux de poulet sur toutes les faces. Réserver.","Faire revenir échalotes et champignons dans la même cocotte.","Déglacer au vin blanc. Réduire de moitié.","Ajouter tomates concassées, concentré, bouillon et thym.","Remettre le poulet. Couvrir et cuire 35-40 minutes.","Retirer les morceaux de poulet. Réduire la sauce si nécessaire.","Incorporer l''estragon ciselé. Remettre le poulet. Rectifier l''assaisonnement."]',
true, 'approved', 'Recette bistrot française intemporelle — estragon indispensable en finition'),

(uid, 'Poulet à la crème et aux champignons', '', 4, 15, 45,
'["4 cuisses-pilons de poulet","300g de champignons de Paris","2 échalotes","2 gousses d''ail","200ml de vin blanc","300ml de crème fraîche épaisse","200ml de bouillon","1 c. à soupe de moutarde à l''ancienne","Thym, persil","Beurre, sel, poivre"]',
'["Faire dorer les morceaux de poulet dans le beurre. Réserver.","Faire revenir échalotes et champignons jusqu''à évaporation de l''eau.","Déglacer au vin blanc. Réduire.","Remettre le poulet. Ajouter bouillon et thym.","Couvrir et cuire 30 minutes à feu doux.","Retirer le poulet. Ajouter crème et moutarde dans la sauce. Réduire 5 minutes.","Remettre le poulet. Parsemer de persil. Servir avec des pâtes fraîches."]',
true, 'approved', 'Sauce réduite avant de servir = texture nappante sans fécule'),

(uid, 'Poulet yassa (Sénégal — poulet au citron et oignons)', '', 4, 20, 60,
'["1 poulet coupé en morceaux","6 oignons","4 citrons (jus)","4 gousses d''ail","2 c. à soupe de moutarde","2 piments verts ou 1 c. à café de piment","Bouillon de poulet","Huile d''arachide, sel, poivre","Riz blanc pour accompagner"]',
'["Mariner le poulet dans citron, ail, moutarde, piment, sel et poivre pendant 2h minimum.","Égoutter le poulet (réserver la marinade). Faire griller les morceaux au four ou à la poêle.","Dans une grande cocotte, faire caraméliser les oignons en lamelles dans l''huile d''arachide (30 minutes).","Ajouter la marinade réservée et le bouillon dans les oignons.","Remettre le poulet grillé dans la sauce aux oignons.","Couvrir et mijoter 25-30 minutes.","Rectifier l''assaisonnement. Servir sur riz blanc."]',
true, 'approved', 'Caraméliser les oignons lentement est la clé — ne pas précipiter cette étape'),

(uid, 'Fricassée de poulet à l''ancienne (sauce velouté)', '', 4, 20, 50,
'["1 poulet coupé en morceaux","2 carottes","2 branches de céleri","1 oignon","250g de champignons","200ml de vin blanc","600ml de bouillon de poulet","Sauce : 40g beurre, 40g farine, 200ml crème, 2 jaunes d''œuf","Bouquet garni, citron","Sel, poivre blanc, muscade"]',
'["Faire revenir le poulet sans coloration dans le beurre (différent du coq au vin).","Ajouter légumes et bouquet garni. Couvrir de vin blanc et bouillon.","Cuire à frémissement 35-40 minutes. Filtrer le bouillon.","Préparer le roux avec beurre-farine. Incorporer le bouillon chaud.","Lier hors du feu avec crème et jaunes d''œuf. Citronner.","Remettre le poulet et les champignons sautés dans la sauce.","Servir avec du riz blanc ou des pommes de terre vapeur."]',
true, 'approved', 'La fricassée ne dore pas la viande — sauce blanche et poulet pâle sont normaux'),

(uid, 'Poulet à la provençale (tomates, olives, anchois)', '', 4, 15, 55,
'["1 poulet coupé en morceaux","150g d''olives noires","4 anchois à l''huile","3 tomates","2 poivrons","2 oignons","4 gousses d''ail","200ml de vin blanc","Thym, romarin, herbes de Provence","Huile d''olive, sel, poivre"]',
'["Faire dorer les morceaux de poulet dans l''huile d''olive. Réserver.","Faire revenir oignons et poivrons. Ajouter les anchois écrasés.","Ajouter ail, tomates et vin blanc. Laisser réduire 5 minutes.","Remettre le poulet. Ajouter herbes et olives noires.","Couvrir et mijoter 35-40 minutes.","Retirer le couvercle les 10 dernières minutes pour concentrer la sauce.","Rectifier l''assaisonnement. Servir avec du riz ou de la polenta."]',
true, 'approved', 'Les anchois fondent dans la sauce et donnent de la profondeur sans goût de poisson'),

-- ═══════════════════════════════════════════════════
-- 🥕 PLATS MIJOTÉS VÉGÉTARIENS
-- ═══════════════════════════════════════════════════

(uid, 'Ratatouille niçoise (version mijotée longtemps)', '', 6, 30, 70,
'["2 aubergines","3 courgettes","3 poivrons (rouge, jaune, vert)","4 tomates","2 oignons","4 gousses d''ail","Huile d''olive généreuse","Thym, romarin, basilic frais","Sel, poivre, sucre"]',
'["Couper tous les légumes en cubes réguliers de 2 cm. Faire dégorger les aubergines salées 20 minutes.","Cuire chaque légume SÉPARÉMENT dans l''huile d''olive (10-12 min chacun). Réserver.","Faire revenir oignons et ail. Ajouter les tomates.","Mijoter 15 minutes. Réunir tous les légumes dans la cocotte.","Ajouter herbes, sel et une pincée de sucre.","Couvrir et cuire à feu très doux 30-40 minutes.","Retirer le couvercle 10 minutes pour concentrer. Finir avec du basilic frais."]',
true, 'approved', 'Cuire chaque légume séparément = la vraie méthode pour que rien ne soit pâteux'),

(uid, 'Dhal de lentilles corail au lait de coco', '', 6, 15, 30,
'["400g de lentilles corail","400ml de lait de coco","1 boîte de tomates concassées","2 oignons","4 gousses d''ail","3 cm de gingembre frais","2 c. à café de curry doux","1 c. à café de curcuma","1 c. à café de cumin","1 c. à café de coriandre moulue","Huile, sel, citron, coriandre fraîche"]',
'["Faire revenir les oignons à feu moyen 10 minutes jusqu''à coloration légère.","Ajouter ail, gingembre et toutes les épices. Cuire 2 minutes.","Incorporer les tomates. Cuire 5 minutes.","Ajouter les lentilles corail rincées. Couvrir d''eau (500ml).","Cuire 15 minutes à feu moyen en remuant régulièrement.","Incorporer le lait de coco. Cuire encore 5 minutes.","Assaisonner avec citron et sel. Parsemer de coriandre fraîche."]',
true, 'approved', 'Les lentilles corail n''ont pas besoin de trempage — cuisson ultra-rapide'),

(uid, 'Caponata sicilienne (aubergines sucrées-acides)', '', 6, 20, 40,
'["3 grosses aubergines","4 branches de céleri","1 oignon","3 tomates","2 c. à soupe de câpres","100g d''olives vertes","4 c. à soupe de vinaigre de vin rouge","2 c. à soupe de sucre","Huile d''olive généreuse","Pignons de pin, basilic frais","Sel"]',
'["Couper les aubergines en cubes. Saler et faire dégorger 20 minutes. Rincer et sécher.","Faire frire les aubergines dans l''huile d''olive jusqu''à dorure. Égoutter sur papier.","Dans la même poêle, faire revenir oignon et céleri en dés.","Ajouter tomates concassées. Cuire 10 minutes.","Incorporer câpres, olives, vinaigre et sucre (agrodolce).","Ajouter les aubergines frites. Mélanger délicatement.","Servir à température ambiante avec basilic et pignons. Meilleure le lendemain."]',
true, 'approved', 'Plat sicilien toujours servi froid ou à température ambiante — jamais chaud'),

(uid, 'Chili végétarien aux 3 haricots et cacao', '', 8, 20, 60,
'["300g de haricots rouges cuits","300g de haricots noirs cuits","300g de pois chiches cuits","2 boîtes de tomates concassées","2 oignons","4 gousses d''ail","2 poivrons rouges","2 c. à café de cumin","2 c. à café de paprika fumé","1 c. à café de piment","2 carrés de chocolat noir 70%","Huile, sel, coriandre fraîche"]',
'["Faire revenir oignons, ail et poivrons dans l''huile.","Ajouter toutes les épices. Cuire 1 minute.","Incorporer les tomates concassées. Mijoter 15 minutes.","Ajouter les 3 variétés de haricots et légumineuses.","Couvrir et mijoter 30 minutes à feu doux.","Ajouter le chocolat noir et mélanger jusqu''à dissolution.","Rectifier l''assaisonnement. Parsemer de coriandre fraîche. Servir avec riz et crème fraîche."]',
true, 'approved', 'Le chocolat noir enrichit la sauce sans goût sucré — secret des chilis mexicains'),

(uid, 'Tajine de légumes aux abricots et épices (végétarien)', '', 4, 20, 45,
'["2 courgettes","2 carottes","1 aubergine","1 poivron","200g de pois chiches cuits","100g d''abricots secs","2 oignons","3 gousses d''ail","1 c. à café de ras-el-hanout","1 c. à café de curcuma","1 c. à café de cannelle","Coriandre, menthe, huile d''olive","Amandes grillées, miel"]',
'["Faire revenir les oignons et l''ail dans l''huile d''olive.","Ajouter les épices. Cuire 1 minute.","Incorporer les légumes coupés en morceaux et les abricots.","Ajouter les pois chiches et 200ml d''eau.","Couvrir et cuire à feu doux 30-35 minutes.","Ajouter une cuillère de miel si désiré.","Parsemer de coriandre fraîche, menthe et amandes grillées. Servir avec couscous."]',
true, 'approved', 'Sucré-salé avec les abricots = tajine végétarien aussi satisfaisant que la version à viande'),

(uid, 'Potée de légumes d''hiver au bouillon fumé', '', 6, 20, 50,
'["3 pommes de terre","3 carottes","2 navets","2 panais","1 chou vert","2 poireaux","1 oignon","3 gousses d''ail","1 litre de bouillon de légumes fumé (ou ajouter du paprika fumé)","Thym, laurier","Huile d''olive, sel, poivre","Crème ou moutarde pour servir"]',
'["Couper tous les légumes en morceaux réguliers.","Faire revenir l''oignon et l''ail dans l''huile d''olive.","Ajouter les légumes racinaires (carottes, navets, panais). Faire revenir 5 minutes.","Verser le bouillon. Ajouter thym et laurier.","Porter à frémissement. Cuire 20 minutes.","Ajouter pommes de terre, poireaux et chou. Cuire encore 15 minutes.","Rectifier l''assaisonnement. Servir avec pain de campagne et moutarde."]',
true, 'approved', 'Le paprika fumé dans le bouillon remplace très bien les viandes fumées'),

(uid, 'Shakshuka épicée (œufs pochés en sauce tomate)', '', 4, 10, 25,
'["8 œufs","2 boîtes de tomates concassées","2 oignons","3 poivrons rouges","4 gousses d''ail","1 c. à café de cumin","1 c. à café de paprika doux","1 c. à café de harissa","1 c. à café de coriandre moulue","Huile d''olive, sel, poivre","Feta émiettée, coriandre ou persil frais, pain pita"]',
'["Faire revenir oignons et poivrons dans l''huile d''olive 8 minutes.","Ajouter l''ail et les épices. Cuire 2 minutes.","Incorporer les tomates et la harissa. Saler et mijoter 10 minutes.","Goûter et rectifier l''assaisonnement — la sauce doit être bien épicée.","Creuser 8 petits creux dans la sauce. Casser un œuf dans chaque creux.","Couvrir et cuire 5-7 minutes selon la cuisson des œufs souhaitée.","Parsemer de feta émiettée et d''herbes fraîches. Servir directement avec pain pita."]',
true, 'approved', 'Les œufs continuent de cuire dans la sauce chaude — retirer légèrement avant la cuisson voulue'),

-- ═══════════════════════════════════════════════════
-- 🐟 POISSON ET FRUITS DE MER MIJOTÉS
-- ═══════════════════════════════════════════════════

(uid, 'Soupe de poisson marseillaise (bouillabaisse simplifiée)', '', 6, 30, 45,
'["1,2 kg de poissons à chair ferme (rouget, grondin, lotte, cabillaud)","300g de crevettes","2 boîtes de tomates concassées","2 oignons","4 gousses d''ail","200ml de vin blanc","Safran, fenouil, thym, laurier, zeste d''orange","Huile d''olive, sel, poivre","Rouille et croûtons pour servir"]',
'["Faire revenir oignons, ail et fenouil dans l''huile d''olive.","Ajouter les tomates, vin blanc, herbes, safran et zeste d''orange.","Verser 1,5 litre d''eau chaude. Mijoter 20 minutes.","Ajouter les poissons à chair ferme (lotte, cabillaud) en premier. Cuire 5 minutes.","Ajouter les poissons plus délicats (rouget, grondin) et les crevettes. Cuire 5 minutes.","Rectifier l''assaisonnement. Servir immédiatement.","Accompagner de croûtons frottés à l''ail et de rouille."]',
true, 'approved', 'Ajouter les poissons selon leur densité — les délicats en dernier'),

(uid, 'Moules marinières à la crème et persil', '', 4, 15, 10,
'["2 kg de moules de bouchot","2 échalotes","4 gousses d''ail","200ml de vin blanc sec","200ml de crème fraîche","1 gros bouquet de persil plat","50g de beurre","Poivre (pas de sel — moules naturellement salées)"]',
'["Nettoyer et gratter les moules. Éliminer celles ouvertes qui ne se referment pas.","Faire revenir les échalotes et l''ail dans le beurre.","Ajouter le vin blanc. Porter à ébullition.","Verser les moules. Couvrir et cuire à feu vif 3-4 minutes en secouant régulièrement.","Retirer les moules ouvertes. Jeter celles restées fermées.","Filtrer le jus. Ajouter la crème et le persil haché. Faire bouillir 1 minute.","Verser la sauce sur les moules. Servir immédiatement avec du pain croustillant."]',
true, 'approved', 'Cuisson express — les moules sont prêtes quand elles sont ouvertes'),

(uid, 'Chaudrée de poisson aux légumes (chowder)', '', 6, 20, 30,
'["600g de cabillaud ou lieu en morceaux","300g de crevettes décortiquées","3 pommes de terre","2 carottes","2 branches de céleri","1 oignon","2 gousses d''ail","500ml de bouillon de poisson ou légumes","400ml de crème légère","200ml de lait","Thym, laurier, aneth frais","Beurre, sel, poivre"]',
'["Faire revenir oignon, céleri et ail dans le beurre.","Ajouter les pommes de terre et carottes en dés. Faire revenir 3 minutes.","Verser le bouillon et le lait. Ajouter thym et laurier.","Cuire à frémissement 15 minutes jusqu''à tendreté des légumes.","Ajouter les morceaux de poisson. Cuire 5 minutes à feu doux.","Ajouter les crevettes et la crème. Chauffer 3 minutes sans bouillir.","Parsemer d''aneth frais. Rectifier l''assaisonnement."]',
true, 'approved', 'Ne pas faire bouillir après l''ajout de la crème pour éviter la séparation'),

(uid, 'Ragoût de poulpe aux tomates et câpres', '', 4, 20, 90,
'["1 poulpe de 1,5 kg (nettoyé, tendu au congélateur 24h)","2 boîtes de tomates concassées","2 oignons","4 gousses d''ail","100ml de vin blanc","50g de câpres","100g d''olives noires","Huile d''olive, thym, romarin, laurier","Sel, poivre, persil"]',
'["Couper le poulpe en tronçons de 3 cm (avoir été congelé le rend tendre).","Faire revenir les oignons et l''ail dans l''huile d''olive.","Ajouter le poulpe et faire sauter 5 minutes.","Déglacer au vin blanc. Ajouter les tomates et les herbes.","Couvrir et mijoter à feu doux 1h à 1h15 jusqu''à tendreté.","Ajouter câpres et olives en fin de cuisson. Cuire encore 10 minutes.","Parsemer de persil. Servir avec du pain croustillant ou des pâtes."]',
true, 'approved', 'Congeler le poulpe 24h avant = attendrissant naturel sans effort'),

-- ═══════════════════════════════════════════════════
-- 🐰 LAPIN ET VOLAILLES MIJOTÉES
-- ═══════════════════════════════════════════════════

(uid, 'Civet de lapin au vin rouge', '', 4, 20, 90,
'["1 lapin coupé en morceaux","1 bouteille de vin rouge","200g de lardons","2 oignons","4 gousses d''ail","250g de champignons","3 carottes","Bouquet garni, farine","Sang du lapin ou foie mixé pour lier (optionnel)","Beurre, huile, sel, poivre"]',
'["La veille : mariner le lapin dans le vin avec oignons, ail, herbes et carottes.","Égoutter et sécher. Filtrer et réserver la marinade.","Faire revenir lardons et oignons. Réserver.","Fariner et faire dorer les morceaux de lapin. Déglacer avec la marinade.","Ajouter carottes, bouquet garni. Cuire à couvert 1h15 à feu doux.","Ajouter les champignons sautés. Cuire encore 15 minutes.","Lier avec le foie mixé si souhaité. Rectifier l''assaisonnement."]',
true, 'approved', 'La marinade overnight fond en saveur dans la sauce — étape incontournable'),

(uid, 'Lapin à la moutarde et crème (recette familiale)', '', 4, 15, 60,
'["1 lapin coupé en morceaux","4 c. à soupe de moutarde de Dijon","3 gousses d''ail","2 échalotes","200ml de vin blanc sec","300ml de crème fraîche épaisse","Thym frais","Beurre, sel, poivre","Persil pour finir"]',
'["Enduire généreusement les morceaux de lapin de moutarde. Laisser mariner 30 minutes.","Faire dorer les morceaux dans le beurre sur toutes les faces.","Réserver. Faire revenir échalotes et ail dans les sucs.","Déglacer au vin blanc. Réduire de moitié.","Remettre le lapin. Ajouter le thym. Couvrir et cuire 40 minutes.","Retirer le lapin. Incorporer la crème dans la sauce. Réduire 5 minutes.","Remettre le lapin. Parsemer de persil. Servir avec des tagliatelles."]',
true, 'approved', 'Mariner dans la moutarde avant cuisson = pénètre la chair et forme une croûte'),

(uid, 'Pintade braisée aux lentilles et lardons', '', 4, 20, 90,
'["1 pintade coupée en morceaux","300g de lentilles vertes","150g de lardons fumés","3 carottes","2 oignons","4 gousses d''ail","300ml de vin blanc","600ml de bouillon","Thym, laurier","Beurre, huile, moutarde, sel, poivre"]',
'["Faire dorer les morceaux de pintade dans beurre et huile. Réserver.","Faire revenir lardons, oignons et ail dans la même cocotte.","Déglacer au vin blanc. Réduire.","Remettre la pintade. Ajouter carottes, bouillon et herbes.","Couvrir et cuire 40 minutes.","Ajouter les lentilles rincées. Couvrir de bouillon chaud si nécessaire.","Cuire encore 30 minutes. Finir avec une cuillère de moutarde. Rectifier."]',
true, 'approved', 'La pintade est plus savoureuse que le poulet pour les braisés'),

(uid, 'Canard aux cerises et vinaigre balsamique', '', 4, 20, 90,
'["4 cuisses de canard","400g de cerises (fraîches ou surgelées)","2 échalotes","3 gousses d''ail","200ml de vin rouge","3 c. à soupe de vinaigre balsamique","2 c. à soupe de miel","200ml de bouillon de veau","Thym, romarin","Huile, sel, poivre"]',
'["Dégraisser légèrement les cuisses de canard. Les dorer à sec (côté peau en premier) jusqu''à rendu du gras.","Retourner et dorer l''autre côté. Réserver.","Dans le gras rendu, faire revenir échalotes et ail.","Déglacer au vin rouge et vinaigre balsamique. Ajouter le miel.","Remettre le canard. Ajouter le bouillon et les herbes.","Couvrir et braiser à 160°C pendant 1h au four.","Ajouter les cerises les 15 dernières minutes. Rectifier l''assaisonnement."]',
true, 'approved', 'Le canard dore à sec dans son propre gras — inutile d''ajouter de l''huile'),

(uid, 'Osso buco à la milanaise', '', 4, 20, 90,
'["4 tranches de jarret de veau (avec os)","2 oignons","3 gousses d''ail","2 carottes","2 branches de céleri","1 boîte de tomates concassées","200ml de vin blanc sec","300ml de bouillon de veau","Farine, beurre, huile","Gremolata : zeste citron + persil + ail","Sel, poivre, thym, laurier"]',
'["Fariner les tranches de jarret et les faire dorer dans beurre et huile sur les deux faces.","Réserver. Faire revenir oignons, ail, carottes et céleri.","Déglacer au vin blanc. Réduire de moitié.","Ajouter tomates, bouillon et herbes. Porter à frémissement.","Remettre les jarrets. Couvrir et cuire 1h30 à feu très doux.","Préparer la gremolata en mélangeant zeste de citron, persil haché et ail pressé.","Servir en saupoudrant de gremolata. Accompagner de risotto milanais au safran."]',
true, 'approved', 'La gremolata au dernier moment = fraîcheur indispensable qui équilibre la richesse du plat');

END $$;
