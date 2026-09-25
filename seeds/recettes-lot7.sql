-- LOT 7 — Réunionnaise complémentaire (30) + Française classique (30) = 60 recettes

DO $$
DECLARE
  uid uuid := '97a98e5c-d29d-4a9f-9d84-0684eef75fe6'::uuid;
BEGIN

-- ═══════════════════════════════════════════════════
-- 🌺 CUISINE RÉUNIONNAISE (suite)
-- ═══════════════════════════════════════════════════

INSERT INTO recipes (user_id, title, source_url, servings, prep_time, cook_time, ingredients, steps, is_public, moderation_status, user_notes) VALUES

(uid, 'Boucané aux lentilles', '', 4, 15, 60,
'["500g de porc boucané (fumé)","300g de lentilles vertes","2 oignons","4 gousses d''ail","2 tomates","1 c. à café de curcuma","Thym, laurier","Sel, poivre","Huile"]',
'["Faire tremper les lentilles 30 minutes. Égoutter.","Faire revenir les oignons et l''ail dans l''huile.","Ajouter le boucané coupé en morceaux. Faire dorer.","Incorporer les tomates, le curcuma et les herbes.","Ajouter les lentilles et couvrir d''eau.","Mijoter 40 minutes jusqu''à tendreté des lentilles.","Rectifier l''assaisonnement. Servir avec du riz blanc."]',
true, 'approved', 'Plat réunionnais fumé aux lentilles'),

(uid, 'Rougail mangue verte', '', 6, 10, 0,
'["2 mangues vertes (pas mûres)","2 piments oiseaux","1 c. à café de sel","1 c. à soupe de jus de citron vert","1 oignon vert","Coriandre fraîche"]',
'["Éplucher les mangues vertes et les râper grossièrement.","Hacher finement les piments (ajuster la quantité selon le goût).","Émincer l''oignon vert.","Mélanger mangue râpée, piments, oignon et coriandre.","Saler et ajouter le jus de citron vert.","Mélanger et laisser reposer 10 minutes.","Servir en accompagnement d''un carry ou d''un riz."]',
true, 'approved', 'Condiment piquant réunionnais'),

(uid, 'Civet de cabri', '', 4, 20, 90,
'["800g de cabri (chevreau) coupé en morceaux","2 oignons","5 gousses d''ail","200ml de vin rouge","400g de tomates concassées","Thym, laurier, clou de girofle","1 c. à café de curcuma","1 c. à café de gingembre","Sel, poivre","Huile"]',
'["Faire mariner le cabri avec le vin, l''ail et les herbes pendant 2 heures.","Faire revenir les oignons dans l''huile.","Égoutter le cabri, faire dorer les morceaux.","Ajouter la marinade et les tomates.","Incorporer les épices (curcuma, gingembre, clou de girofle).","Couvrir et mijoter 1h30 à feu doux.","Servir avec du riz et du rougail tomates."]',
true, 'approved', 'Ragoût de chevreau réunionnais'),

(uid, 'Gratin de chouchou', '', 4, 15, 30,
'["3 chouchous (christophines)","200ml de crème fraîche","100g de gruyère râpé","2 gousses d''ail","Beurre","Sel, poivre, muscade"]',
'["Éplucher et couper les chouchous en cubes.","Cuire dans l''eau bouillante salée 15 minutes. Égoutter.","Préchauffer le four à 200°C.","Frotter un plat à gratin avec l''ail et le beurrer.","Disposer les chouchous. Verser la crème fraîche.","Parsemer de gruyère râpé, sel, poivre et muscade.","Gratiner au four 20 minutes jusqu''à dorure."]',
true, 'approved', 'Gratin réunionnais au chouchou'),

(uid, 'Carry de poulpe', '', 4, 30, 60,
'["800g de poulpe nettoyé","2 oignons","4 gousses d''ail","400g de tomates concassées","1 c. à café de curcuma","1 c. à café de cumin","1 c. à soupe de gingembre râpé","2 piments","Thym","Huile","Sel"]',
'["Attendrir le poulpe en le congélant 24h ou en le battant.","Couper en morceaux de 4 cm.","Faire revenir oignons et ail dans l''huile jusqu''à dorure.","Ajouter les épices et le gingembre. Cuire 2 minutes.","Incorporer les tomates et les piments.","Ajouter le poulpe. Couvrir d''un peu d''eau.","Mijoter 45-60 minutes jusqu''à tendreté. Servir avec du riz."]',
true, 'approved', 'Carry de fruits de mer réunionnais'),

(uid, 'Gâteau patate douce', '', 8, 20, 45,
'["500g de patate douce","200g de sucre","4 œufs","100g de beurre","1 c. à café de vanille","1 c. à café de cannelle","Zeste de citron vert","200g de farine","1 sachet de levure"]',
'["Cuire les patates douces à l''eau jusqu''à tendreté. Réduire en purée.","Crémer le beurre avec le sucre.","Incorporer les œufs un à un.","Ajouter la purée de patate douce, la vanille, la cannelle et le zeste.","Incorporer la farine et la levure tamisées.","Verser dans un moule beurré.","Cuire à 180°C pendant 40-45 minutes. Démouler tiède."]',
true, 'approved', 'Gâteau créole à la patate douce'),

(uid, 'Daube de thon réunionnaise', '', 4, 15, 30,
'["600g de thon en dés","2 oignons","4 gousses d''ail","400g de tomates concassées","1 c. à café de curcuma","1 c. à soupe de gingembre râpé","1 piment","Thym, laurier","Huile, sel"]',
'["Faire revenir les oignons et l''ail dans l''huile.","Ajouter le curcuma, le gingembre et le piment.","Incorporer les tomates. Cuire 10 minutes.","Ajouter le thon en dés. Ne pas trop remuer pour garder les morceaux entiers.","Cuire 15 minutes à feu moyen.","Rectifier l''assaisonnement.","Servir avec du riz blanc et du rougail."]',
true, 'approved', 'Daube de thon créole'),

(uid, 'Bonbon piment (accras réunionnais)', '', 6, 20, 15,
'["300g de morue dessalée effilochée","200g de farine","2 œufs","150ml d''eau","1 sachet de levure chimique","2 piments oiseaux hachés","2 oignons verts","Coriandre fraîche","Sel","Huile de friture"]',
'["Mélanger la farine, la levure et le sel.","Incorporer les œufs et l''eau pour obtenir une pâte épaisse.","Ajouter la morue effilochée, les piments, les oignons et la coriandre.","Laisser reposer la pâte 15 minutes.","Faire chauffer l''huile à 180°C.","Déposer des cuillerées de pâte dans l''huile.","Frire 3-4 minutes jusqu''à dorure. Égoutter et servir chaud."]',
true, 'approved', 'Beignets de morue réunionnais'),

(uid, 'Vindaye de poisson', '', 4, 20, 20,
'["600g de poisson blanc (capitaine ou vieille)","1 c. à soupe de curcuma","1 c. à soupe de cumin","5 gousses d''ail","1 morceau de gingembre","2 piments","4 c. à soupe de vinaigre","Huile, sel"]',
'["Couper le poisson en morceaux. Saler.","Faire dorer les morceaux dans l''huile. Réserver.","Dans la même poêle, faire revenir l''ail et le gingembre écrasés.","Ajouter les épices (curcuma, cumin) et les piments.","Verser le vinaigre. Cuire 2 minutes.","Remettre le poisson. Bien enrober de la marinade épicée.","Laisser refroidir. Le vindaye se mange froid ou tiède."]',
true, 'approved', 'Poisson mariné aux épices réunionnais'),

(uid, 'Carry de lentilles corail au lait de coco', '', 4, 10, 25,
'["300g de lentilles corail","400ml de lait de coco","1 oignon","3 gousses d''ail","1 c. à café de curcuma","1 c. à café de cumin","1 c. à café de coriandre","Gingembre râpé","1 piment","Coriandre fraîche","Riz pour servir"]',
'["Faire revenir l''oignon et l''ail dans l''huile.","Ajouter les épices et le gingembre. Cuire 1 minute.","Incorporer les lentilles corail lavées.","Verser le lait de coco et 200ml d''eau.","Cuire 20 minutes en remuant jusqu''à consistance crémeuse.","Les lentilles doivent être fondantes et la sauce épaisse.","Parsemer de coriandre fraîche. Servir avec du riz."]',
true, 'approved', 'Dhal crémeux réunionnais'),

(uid, 'Salade de palmiste', '', 4, 20, 0,
'["400g de cœur de palmier frais ou en boîte","1 tomate","1 oignon rouge","Ciboulette","Jus de citron vert","Huile d''olive","Sel, poivre","Piment vert haché"]',
'["Couper le palmiste en fines rondelles.","Couper la tomate en dés et émincer l''oignon rouge.","Hacher finement la ciboulette.","Mélanger tous les ingrédients dans un saladier.","Assaisonner avec le jus de citron vert, l''huile, sel et poivre.","Ajouter le piment selon le goût.","Laisser reposer 10 minutes avant de servir."]',
true, 'approved', 'Salade fraîche au cœur de palmier'),

(uid, 'Rhum arrangé à la vanille et fruits', '', 8, 15, 0,
'["1 litre de rhum blanc agricole","2 gousses de vanille de La Réunion","1 mangue mûre","1 ananas","Zeste de citron vert","100g de sucre de canne","Cannelle, badiane"]',
'["Fendre les gousses de vanille en deux.","Couper les fruits en morceaux.","Mettre tous les ingrédients dans un grand bocal hermétique.","Ajouter le sucre, la cannelle et la badiane.","Fermer hermétiquement.","Laisser macérer au minimum 3 semaines à température ambiante.","Filtrer si souhaité, ou servir directement avec les fruits."]',
true, 'approved', 'Rhum arrangé créole maison'),

(uid, 'Pâté créole (pâté en croûte réunionnais)', '', 8, 40, 50,
'["Pâte brisée : 400g farine, 200g beurre, sel, eau","Farce : 400g porc haché, 200g jambon, 2 œufs, oignon, persil, thym, curcuma, sel, poivre"]',
'["Préparer la pâte brisée. Réfrigérer 30 minutes.","Mélanger le porc haché, le jambon en dés, les œufs, l''oignon et les herbes.","Assaisonner avec curcuma, sel et poivre.","Foncer un moule à cake avec la pâte (garder de la pâte pour le dessus).","Garnir de la farce. Tasser.","Couvrir avec le reste de pâte. Souder les bords. Faire une cheminée.","Cuire à 180°C pendant 45-50 minutes. Servir tiède ou froid."]',
true, 'approved', 'Pâté en croûte créole'),

(uid, 'Carry de canard au gingembre', '', 4, 20, 60,
'["1 canard coupé en morceaux","3 oignons","6 gousses d''ail","3 c. à soupe de gingembre râpé","1 c. à café de curcuma","1 c. à café de cumin","400g de tomates","2 piments","Thym","Huile, sel"]',
'["Faire dorer les morceaux de canard dans l''huile sur toutes les faces. Réserver.","Faire revenir les oignons dans la même poêle.","Ajouter l''ail et le gingembre. Cuire 3 minutes.","Incorporer les épices et les piments.","Remettre le canard avec les tomates et un peu d''eau.","Couvrir et mijoter 50-60 minutes.","Le canard doit être très tendre. Servir avec riz et rougail."]',
true, 'approved', 'Carry de canard parfumé au gingembre'),

(uid, 'Tarte coco réunionnaise', '', 8, 20, 35,
'["Pâte brisée","Garniture : 3 œufs, 200g de sucre, 200g de noix de coco râpée, 200ml de lait de coco, 100ml de crème, 1 c. à café de vanille"]',
'["Préchauffer le four à 180°C.","Foncer un moule à tarte avec la pâte brisée. Piquer le fond.","Cuire à blanc 10 minutes.","Battre les œufs avec le sucre jusqu''à blanchiment.","Incorporer la noix de coco, le lait de coco, la crème et la vanille.","Verser sur le fond de tarte précuit.","Cuire 25-30 minutes jusqu''à ce que la garniture soit prise et dorée."]',
true, 'approved', 'Tarte créole à la noix de coco'),

-- ═══════════════════════════════════════════════════
-- 🥐 CUISINE FRANÇAISE CLASSIQUE (suite)
-- ═══════════════════════════════════════════════════

(uid, 'Pot-au-feu traditionnel', '', 6, 30, 180,
'["1 kg de bœuf (paleron, plat de côtes, queue)","3 carottes","3 navets","3 poireaux","3 branches de céleri","1 chou","1 oignon piqué de clous de girofle","Bouquet garni","Os à moelle","Sel, poivre en grains","Cornichons, moutarde, gros sel pour servir"]',
'["Placer la viande dans une grande cocotte. Couvrir d''eau froide. Porter à ébullition.","Écumer régulièrement pendant 15 minutes.","Ajouter l''oignon piqué, les clous de girofle, le bouquet garni et le poivre.","Ajouter les légumes (carottes, navets, poireaux, céleri).","Mijoter 2h30 à feu très doux.","Ajouter le chou les 30 dernières minutes.","Servir le bouillon en entrée, puis la viande et les légumes avec cornichons, moutarde et gros sel."]',
true, 'approved', 'Grand classique de la cuisine française'),

(uid, 'Soufflé au fromage', '', 4, 20, 25,
'["50g de beurre","50g de farine","300ml de lait","4 œufs","150g de gruyère râpé","Sel, poivre, muscade","Parmesan pour les moules"]',
'["Préchauffer le four à 200°C. Beurrer et parmesaner 4 ramequins.","Faire une béchamel épaisse : beurre, farine, puis lait chaud.","Hors du feu, incorporer les jaunes d''œufs et le gruyère. Assaisonner.","Monter les blancs en neige très ferme avec une pincée de sel.","Incorporer un quart des blancs vigoureusement pour alléger la base.","Incorporer le reste délicatement en soulevant.","Cuire 20-25 minutes sans ouvrir le four. Servir immédiatement."]',
true, 'approved', 'Soufflé au fromage classique'),

(uid, 'Blanquette de veau à l''ancienne', '', 6, 20, 90,
'["1 kg de veau (épaule, tendron)","3 carottes","2 oignons","200g de champignons de Paris","200ml de crème fraîche","2 jaunes d''œufs","Bouquet garni","Jus de citron","50g de beurre","50g de farine","Sel, poivre"]',
'["Couvrir le veau d''eau froide. Porter à ébullition. Écumer.","Ajouter les carottes, les oignons et le bouquet garni.","Mijoter 1h15 à feu doux.","Faire sauter les champignons au beurre séparément.","Préparer un roux blanc (beurre + farine). Mouiller avec le bouillon de cuisson.","Lier avec les jaunes d''œufs et la crème. Ajouter le jus de citron.","Remettre veau, légumes et champignons dans la sauce. Servir avec du riz."]',
true, 'approved', 'Ragoût de veau à la crème'),

(uid, 'Tarte Tatin aux pommes', '', 6, 20, 45,
'["6 pommes (Golden ou Reinette)","150g de sucre","100g de beurre","1 rouleau de pâte feuilletée","Vanille","Crème fraîche ou glace vanille pour servir"]',
'["Faire un caramel sec dans un moule à manqué allant au four : sucre seul à feu moyen.","Hors du feu, incorporer le beurre en morceaux. Mélanger.","Éplucher et couper les pommes en quartiers.","Disposer les quartiers debout et serrés sur le caramel.","Recouvrir de pâte feuilletée en rentrant les bords sous les pommes.","Cuire à 200°C pendant 35-40 minutes.","Retourner immédiatement sur un plat. Servir tiède avec crème fraîche."]',
true, 'approved', 'Tarte renversée aux pommes caramélisées'),

(uid, 'Bouillabaisse marseillaise', '', 4, 30, 40,
'["1 kg de poissons variés (rouget, grondin, saint-pierre, baudroie)","300g de fruits de mer","3 tomates","1 oignon","4 gousses d''ail","1 branche de fenouil","Safran","1 c. à café de concentré de tomate","200ml de vin blanc","Rouille, croûtons, gruyère pour servir"]',
'["Faire revenir l''oignon, l''ail, le fenouil dans l''huile d''olive.","Ajouter les tomates et le concentré. Cuire 5 minutes.","Verser le vin blanc. Porter à ébullition.","Ajouter le safran, les poissons les plus gros en premier.","Cuire 10 minutes à gros bouillons. Ajouter les poissons délicats ensuite.","Cuire encore 8 minutes.","Servir le bouillon séparément avec la rouille et les croûtons frottés à l''ail."]',
true, 'approved', 'Soupe de poissons provençale'),

(uid, 'Magret de canard aux cerises', '', 4, 10, 20,
'["2 magrets de canard","400g de cerises (fraîches ou surgelées)","100ml de porto","50ml de vinaigre balsamique","2 c. à soupe de miel","Sel, poivre","Thym"]',
'["Quadriller le gras des magrets au couteau sans atteindre la chair.","Assaisonner de sel et poivre.","Faire cuire côté gras à feu moyen 8-10 minutes. Le gras doit être croustillant.","Retourner et cuire 5 minutes côté chair. Laisser reposer sous aluminium.","Dans la même poêle, déglacer au porto.","Ajouter les cerises, le vinaigre et le miel. Réduire 5 minutes.","Trancher les magrets en biais. Napper de sauce aux cerises."]',
true, 'approved', 'Canard aux cerises et porto'),

(uid, 'Gratin dauphinois', '', 6, 15, 60,
'["1 kg de pommes de terre","500ml de crème entière","200ml de lait","2 gousses d''ail","Beurre","Sel, poivre, muscade"]',
'["Préchauffer le four à 180°C.","Éplucher et trancher les pommes de terre finement (2mm) à la mandoline.","Frotter le plat à gratin avec l''ail coupé, puis le beurrer.","Disposer les pommes de terre en couches serrées. Saler, poivrer, muscader.","Mélanger la crème et le lait. Verser sur les pommes de terre.","La crème doit affleurer la surface.","Cuire 55-60 minutes. La surface doit être dorée et les pommes de terre fondantes."]',
true, 'approved', 'Gratin crémeux de pommes de terre'),

(uid, 'Cassoulet toulousain', '', 6, 30, 180,
'["500g de haricots blancs trempés","400g de confit de canard","300g de saucisses de Toulouse","300g d''échine de porc","200g de lard","3 tomates","1 oignon","5 gousses d''ail","Bouquet garni","Chapelure","Sel, poivre"]',
'["Cuire les haricots avec le bouquet garni, l''oignon et l''ail 1 heure.","Faire dorer dans une poêle le porc, le lard et les saucisses.","Mélanger haricots et viandes dans une cassole (ou cocotte).","Ajouter les tomates et le jus de cuisson des viandes.","Couvrir juste d''eau. Saler légèrement.","Enfourner à 150°C. Casser la croûte 3-4 fois en cours de cuisson.","Cuire 2h30 total. Servir directement dans la cassole."]',
true, 'approved', 'Plat emblématique du Sud-Ouest'),

(uid, 'Crêpes Suzette', '', 4, 20, 20,
'["Pâte à crêpes : 250g farine, 3 œufs, 500ml lait, 30g beurre fondu","Sauce Suzette : 100g beurre, 100g sucre, jus de 2 oranges, zeste, 50ml Grand Marnier ou Cointreau"]',
'["Préparer la pâte à crêpes classique. Laisser reposer 30 minutes.","Cuire les crêpes fines dans une poêle beurrée.","Préparer la sauce : faire fondre beurre et sucre jusqu''à léger caramel.","Ajouter le jus et le zeste d''orange. Réduire 3 minutes.","Incorporer le Grand Marnier.","Plier les crêpes en quatre et les passer dans la sauce chaude.","Flamber en servant (facultatif). Servir immédiatement."]',
true, 'approved', 'Crêpes flambées à l''orange'),

(uid, 'Moules marinières', '', 4, 10, 15,
'["2 kg de moules fraîches","200ml de vin blanc sec","3 échalotes","3 gousses d''ail","Persil plat","50g de beurre","Poivre","Pain baguette pour servir"]',
'["Gratter et laver soigneusement les moules. Éliminer celles qui restent ouvertes.","Faire revenir les échalotes et l''ail dans le beurre.","Verser le vin blanc. Porter à ébullition.","Ajouter les moules. Couvrir et cuire 5 minutes en secouant la casserole.","Les moules sont cuites quand elles sont ouvertes. Jeter celles qui restent fermées.","Parsemer de persil fraîchement haché.","Servir immédiatement dans un grand plat creux avec du pain."]',
true, 'approved', 'Moules au vin blanc classiques'),

(uid, 'Vichyssoise (soupe froide)', '', 4, 15, 25,
'["4 poireaux (partie blanche)","3 pommes de terre","1 oignon","1 litre de bouillon de volaille","200ml de crème fraîche","50g de beurre","Ciboulette fraîche","Sel, poivre blanc"]',
'["Faire revenir les blancs de poireaux et l''oignon dans le beurre à feu doux.","Ajouter les pommes de terre en dés et le bouillon.","Cuire 20 minutes jusqu''à tendreté.","Mixer finement.","Ajouter la crème fraîche. Rectifier l''assaisonnement.","Laisser refroidir puis réfrigérer au moins 2 heures.","Servir très frais, garni de ciboulette ciselée."]',
true, 'approved', 'Potage froid poireaux-pommes de terre'),

(uid, 'Île flottante à la crème anglaise', '', 4, 20, 20,
'["Blancs : 4 blancs d''œufs, 100g de sucre, 1 pincée de sel","Crème anglaise : 4 jaunes, 100g de sucre, 500ml de lait, 1 gousse de vanille","Caramel : 150g de sucre, 50ml d''eau"]',
'["Monter les blancs en neige ferme avec le sucre et le sel.","Former des quenelles et les pocher dans du lait frémissant 2 minutes de chaque côté.","Égoutter sur du papier absorbant.","Crème anglaise : chauffer le lait avec la vanille. Fouetter jaunes et sucre.","Verser le lait chaud progressivement. Cuire à 82°C en remuant. Refroidir.","Caramel : cuire sucre et eau jusqu''à couleur ambrée.","Servir les blancs sur la crème anglaise, nappés de caramel."]',
true, 'approved', 'Dessert classique en sauce vanille'),

(uid, 'Quiche lorraine authentique', '', 6, 20, 35,
'["1 pâte brisée","200g de lardons fumés","4 œufs","300ml de crème fraîche épaisse","100ml de lait","Sel, poivre, muscade","Beurre"]',
'["Préchauffer le four à 180°C.","Foncer un moule à tarte avec la pâte brisée. Piquer le fond.","Faire dorer les lardons à sec dans une poêle. Égoutter.","Disposer les lardons sur le fond de tarte.","Battre les œufs avec la crème et le lait. Assaisonner.","Verser l''appareil sur les lardons.","Cuire 30-35 minutes jusqu''à ce que l''appareil soit pris et légèrement doré."]',
true, 'approved', 'Quiche lorraine sans fromage, l''originale'),

(uid, 'Navarin d''agneau printanier', '', 4, 20, 90,
'["800g d''épaule d''agneau en morceaux","200g de petites carottes nouvelles","200g de navets nouveaux","200g de petits pois frais","200g de haricots verts","Oignons grelots","3 tomates","Bouquet garni","Farine","Huile, beurre","Sel, poivre"]',
'["Fariner légèrement les morceaux d''agneau. Faire dorer dans l''huile.","Ajouter les oignons grelots. Faire revenir.","Incorporer les tomates pelées et le bouquet garni.","Couvrir d''eau. Mijoter 45 minutes.","Ajouter les carottes et navets. Cuire 20 minutes.","Incorporer les haricots verts et petits pois. Cuire encore 10 minutes.","Rectifier l''assaisonnement. Les légumes doivent rester légèrement croquants."]',
true, 'approved', 'Ragoût d''agneau aux légumes nouveaux'),

(uid, 'Financiers aux amandes', '', 12, 15, 15,
'["180g de beurre noisette","200g de sucre glace","100g de poudre d''amandes","60g de farine","5 blancs d''œufs","1 c. à café de vanille","Amandes effilées pour décorer"]',
'["Faire fondre le beurre jusqu''à couleur noisette et odeur noisetée. Laisser tiédir.","Mélanger sucre glace, poudre d''amandes et farine.","Incorporer les blancs d''œufs non battus et la vanille.","Ajouter le beurre noisette. Mélanger.","Réfrigérer la pâte 30 minutes.","Remplir des moules à financiers beurrés aux 3/4.","Parsemer d''amandes effilées. Cuire à 200°C pendant 12-15 minutes."]',
true, 'approved', 'Gâteaux dorés aux amandes');

END $$;
