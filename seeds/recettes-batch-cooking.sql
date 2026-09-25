-- LOT BATCH COOKING — 50 recettes idéales pour cuisiner en avance

DO $$
DECLARE
  uid uuid := '97a98e5c-d29d-4a9f-9d84-0684eef75fe6'::uuid;
BEGIN

-- ═══════════════════════════════════════════════════
-- 🌾 BASES DE CÉRÉALES ET FÉCULENTS
-- ═══════════════════════════════════════════════════

INSERT INTO recipes (user_id, title, source_url, servings, prep_time, cook_time, ingredients, steps, is_public, moderation_status, user_notes) VALUES

(uid, 'Riz cuit en batch (à congeler par portions)', '', 8, 5, 20,
'["500g de riz basmati ou long grain","1 litre d''eau bouillante","1 c. à café de sel","1 c. à soupe d''huile neutre"]',
'["Rincer le riz à l''eau froide jusqu''à ce que l''eau soit claire.","Porter l''eau salée à ébullition. Ajouter le riz et l''huile.","Cuire à couvert à feu doux 15-18 minutes selon la variété.","Laisser reposer 5 minutes couvercle fermé.","Égrainer à la fourchette et laisser refroidir complètement avant de portionner.","Congeler par portions de 200g dans des sachets zip. Réchauffe en 3 minutes au micro-ondes."]',
true, 'approved', 'Base batch cooking — se conserve 4 jours au frigo ou 3 mois au congélateur'),

(uid, 'Quinoa cuit au bouillon (base salades et bowls)', '', 6, 5, 15,
'["400g de quinoa","800ml de bouillon de légumes","1 c. à café de sel","1 c. à soupe d''huile d''olive"]',
'["Rincer le quinoa abondamment sous l''eau froide pour enlever l''amertume.","Porter le bouillon à ébullition. Ajouter le quinoa.","Cuire 12 minutes à couvert à feu moyen-doux.","Éteindre le feu, laisser gonfler 5 minutes couvert.","Égrainer à la fourchette et laisser refroidir.","Portionner dans des boîtes hermétiques. Utilise dans des salades, bowls ou en accompagnement."]',
true, 'approved', 'Se conserve 5 jours au frigo — base polyvalente'),

(uid, 'Boulgour cuit nature (taboulé et accompagnements)', '', 6, 5, 10,
'["400g de boulgour moyen","800ml d''eau bouillante","1 c. à café de sel","1 c. à soupe d''huile d''olive"]',
'["Faire revenir le boulgour à sec 2 minutes dans une casserole.","Verser l''eau bouillante salée dessus.","Couvrir et laisser gonfler hors du feu pendant 10 minutes.","Ajouter l''huile d''olive et égrainer à la fourchette.","Laisser refroidir avant de portionner.","Utiliser dans des taboulés, salades composées ou en accompagnement de viandes."]',
true, 'approved', 'Prêt en 15 min — idéal pour taboulé express en semaine'),

(uid, 'Polenta crémeuse (à réchauffer ou à griller)', '', 6, 5, 20,
'["400g de semoule de maïs (polenta)","1,5 litre d''eau ou bouillon","100g de parmesan râpé","50g de beurre","Sel, poivre, noix de muscade"]',
'["Porter le bouillon à ébullition dans une grande casserole.","Verser la polenta en pluie en fouettant constamment.","Cuire à feu doux en remuant 15-20 minutes jusqu''à épaississement.","Incorporer le beurre et le parmesan. Assaisonner.","Pour congeler crémeuse : portionner dans des boîtes, couvrir d''un film alimentaire au contact.","Variante grillée : couler dans un plat huilé, laisser figer, découper en carrés à griller à la poêle."]',
true, 'approved', 'Version crémeuse ou à griller selon les envies'),

(uid, 'Orge perlé cuit (risotto, soupes, salades)', '', 8, 5, 35,
'["500g d''orge perlé","1,5 litre d''eau","1 c. à café de sel","1 feuille de laurier","1 c. à soupe d''huile d''olive"]',
'["Rincer l''orge à l''eau froide.","Porter l''eau salée à ébullition avec le laurier.","Ajouter l''orge et cuire 30-35 minutes à feu moyen.","Égoutter si nécessaire. Retirer le laurier.","Arroser d''huile d''olive pour éviter que ça colle.","Refroidir et portionner. Utiliser dans des soupes, des salades ou comme base de risotto."]',
true, 'approved', 'Riche en fibres — excellent pour les soupes et salades d''hiver'),

-- ═══════════════════════════════════════════════════
-- 🫘 LÉGUMINEUSES CUITES EN GRAND
-- ═══════════════════════════════════════════════════

(uid, 'Pois chiches cuits maison (à congeler)', '', 10, 10, 75,
'["500g de pois chiches secs","2 litres d''eau","1 c. à café de bicarbonate (trempage)","1 c. à café de sel","1 feuille de laurier","2 gousses d''ail"]',
'["La veille : tremper les pois chiches dans l''eau froide avec le bicarbonate pendant 12h minimum.","Rincer et égoutter les pois chiches trempés.","Couvrir d''eau froide dans une grande casserole avec ail et laurier.","Porter à ébullition, écumer. Cuire à feu moyen 1h à 1h15 jusqu''à tendreté.","Saler en fin de cuisson seulement (évite l''endurcissement).","Égoutter, laisser refroidir. Congeler par portions de 250g. Équivalent de 1 boîte de conserve."]',
true, 'approved', 'Bien meilleur que les boîtes — à congeler en portions de 250g'),

(uid, 'Lentilles vertes cuites (salade, soupe, curry)', '', 8, 5, 30,
'["500g de lentilles vertes du Puy ou Berry","1,5 litre d''eau","1 carotte","1 oignon","1 bouquet garni","Sel en fin de cuisson"]',
'["Trier et rincer les lentilles. Pas besoin de trempage.","Couvrir d''eau froide avec carotte, oignon piqué et bouquet garni.","Porter à ébullition. Écumer.","Cuire à feu moyen 25-30 minutes selon la variété.","Saler 5 minutes avant la fin. Égoutter.","Retirer les aromates. Refroidir et portionner. Utiliser en salade tiède, soupe ou curry."]',
true, 'approved', 'Ne pas saler en début de cuisson pour éviter l''endurcissement'),

(uid, 'Haricots blancs mijotés à l''ail et romarin', '', 8, 10, 60,
'["500g de haricots blancs secs (trempés 12h)","2 litres d''eau","1 tête d''ail entière","2 branches de romarin frais","2 feuilles de laurier","Huile d''olive","Sel, poivre"]',
'["Rincer les haricots trempés.","Dans une grande casserole, couvrir d''eau froide avec ail, romarin et laurier.","Porter à ébullition, écumer. Cuire à feu doux 50-60 minutes.","Saler en fin de cuisson. Arroser d''huile d''olive.","Égoutter en conservant un peu de liquide de cuisson.","Portionner avec un peu de liquide de cuisson. Se congèlent parfaitement."]',
true, 'approved', 'Le liquide de cuisson est précieux — garde-le pour des soupes'),

(uid, 'Lentilles corail cuites (base dal, soupe, sauce)', '', 8, 5, 20,
'["500g de lentilles corail","1 litre d''eau","1 oignon","2 gousses d''ail","1 c. à café de curcuma","Sel, huile d''olive"]',
'["Rincer les lentilles corail sous l''eau froide.","Faire revenir l''oignon et l''ail dans l''huile.","Ajouter les lentilles, le curcuma et l''eau.","Cuire 15-20 minutes à feu moyen jusqu''à dissolution des lentilles.","Assaisonner. Mixer partiellement pour une texture crémeuse si souhaité.","Portionner dans des boîtes. Base parfaite pour dal, soupe ou sauce végétarienne."]',
true, 'approved', 'Se dissout naturellement — base crémeuse sans matière grasse'),

(uid, 'Haricots noirs épicés (tacos, burritos, salades)', '', 8, 10, 90,
'["500g de haricots noirs secs (trempés 12h)","1 oignon","3 gousses d''ail","1 c. à café de cumin","1 c. à café de paprika fumé","1 piment oiseau","Bouillon de légumes","Sel, coriandre fraîche"]',
'["Rincer les haricots trempés.","Faire revenir l''oignon, l''ail et les épices dans l''huile d''olive.","Ajouter les haricots et couvrir de bouillon de légumes chaud.","Mijoter à feu doux 1h à 1h30 jusqu''à tendreté.","Saler et ajouter la coriandre en fin de cuisson.","Portionner. Excellent pour tacos, burritos, riz-haricots ou salades composées."]',
true, 'approved', 'Goût bien plus profond que les boîtes conserves'),

(uid, 'Pois cassés jaunes cuits (houmous, soupe, garniture)', '', 8, 5, 45,
'["500g de pois cassés jaunes","1,5 litre d''eau","1 oignon","2 gousses d''ail","1 c. à café de curcuma","Sel, cumin, huile d''olive"]',
'["Rincer les pois cassés. Pas besoin de trempage.","Couvrir d''eau froide avec oignon, ail et curcuma.","Porter à ébullition, écumer.","Cuire à feu doux 40-45 minutes jusqu''à tendreté complète.","Saler en fin de cuisson. Égoutter légèrement.","Utiliser en soupe épaisse, en purée ou comme base de houmous indien (dal jaune)."]',
true, 'approved', 'Riche en protéines végétales — base de soupe express'),

-- ═══════════════════════════════════════════════════
-- 🍗 PROTÉINES PRÉPARÉES EN AVANCE
-- ═══════════════════════════════════════════════════

(uid, 'Poulet rôti entier (pour 4 repas différents)', '', 8, 15, 70,
'["2 poulets fermiers de 1,2 kg chacun","4 gousses d''ail","2 citrons","2 c. à soupe d''herbes de Provence","Huile d''olive","Sel, poivre"]',
'["Préchauffer le four à 200°C.","Frotter les poulets avec l''huile d''olive, le sel, le poivre et les herbes.","Insérer l''ail et le citron coupé en deux dans les cavités.","Rôtir 1h à 1h10 en arrosant régulièrement.","Laisser reposer 10 minutes avant de découper.","Désosser et portionner : blancs pour salades/sandwichs, cuisses pour réchauffer, carcasses pour bouillon."]',
true, 'approved', '1 session cuisson = 4 repas différents toute la semaine'),

(uid, 'Boulettes de viande en sauce tomate (à congeler)', '', 6, 20, 30,
'["500g de bœuf haché","500g de porc haché (ou tout bœuf)","2 œufs","100g de chapelure","1 oignon râpé","3 gousses d''ail","Persil, sel, poivre","Sauce tomate : 2 boîtes tomates concassées, basilic, ail, oignon"]',
'["Mélanger les viandes, œufs, chapelure, oignon, ail et persil.","Former des boulettes de 4 cm et les disposer sur une plaque huilée.","Enfourner 15 minutes à 200°C pour les saisir.","Préparer la sauce tomate en faisant revenir ail et oignon, ajouter les tomates.","Transférer les boulettes dans la sauce. Mijoter 15 minutes.","Refroidir et congeler par portions de 6-8 boulettes avec sauce. Décongeler au frigo la veille."]',
true, 'approved', 'Congeler avec sauce — prêt à réchauffer en 10 minutes'),

(uid, 'Saumon au four en papillotes (4 portions batch)', '', 4, 10, 15,
'["4 pavés de saumon (150g chacun)","2 citrons","4 branches d''aneth frais","4 c. à soupe d''huile d''olive","Sel, poivre, ail en poudre","Papier aluminium"]',
'["Préchauffer le four à 180°C.","Découper 4 grandes feuilles d''aluminium.","Déposer un pavé de saumon au centre de chaque feuille.","Assaisonner, arroser d''huile, poser l''aneth et le citron.","Fermer hermétiquement les papillotes.","Enfourner 12-15 minutes. Laisser refroidir avant de réfrigérer.","Se conserve 3 jours au frigo. Servir froid en salade ou réchauffer doucement."]',
true, 'approved', 'Préparation 4 portions en une seule fournée'),

(uid, 'Bœuf haché cuit nature (base sauce bolognaise, hachis, tacos)', '', 8, 5, 15,
'["1 kg de bœuf haché (5% MG)","2 oignons finement émincés","4 gousses d''ail","Sel, poivre","Huile neutre"]',
'["Faire revenir les oignons et l''ail dans une grande poêle.","Ajouter le bœuf haché en l''émiettant bien.","Cuire à feu vif en remuant jusqu''à coloration complète.","Assaisonner. Égoutter l''excès de gras.","Refroidir complètement.","Portionner par 250g dans des sachets. Se congèle 3 mois. Base pour bolognaise, hachis Parmentier, tacos, sauce viande."]',
true, 'approved', 'Cuire 1 kg en avance = 4 plats différents en semaine'),

(uid, 'Escalopes de poulet marinées et grillées (batch 6 portions)', '', 6, 15, 20,
'["6 escalopes de poulet (120g chacune)","Marinade : 4 c. à soupe d''huile d''olive, 2 citrons, 4 gousses d''ail, 1 c. à café de paprika, 1 c. à café de cumin, sel, poivre","Herbes fraîches"]',
'["Aplatir les escalopes entre deux feuilles de film alimentaire.","Mélanger tous les ingrédients de la marinade.","Faire mariner le poulet 1h minimum (ou une nuit au frigo).","Cuire à la plancha ou poêle grill 5-7 minutes par face.","Laisser reposer 2 minutes avant de trancher.","Refroidir et réfrigérer. Utiliser tranché dans salades, wraps, pâtes ou simplement réchauffé."]',
true, 'approved', 'Mariner la nuit — cuire le matin en 20 minutes pour toute la semaine'),

(uid, 'Œufs durs (batch de 12)', '', 12, 2, 12,
'["12 œufs frais","Eau froide","1 c. à soupe de vinaigre blanc (évite les fissures)","Bain d''eau glacée"]',
'["Déposer les œufs dans une grande casserole, couvrir d''eau froide avec le vinaigre.","Porter à ébullition à feu vif.","Dès l''ébullition, réduire à feu moyen. Cuire 10 minutes exactement.","Transférer immédiatement dans un bain d''eau glacée pour arrêter la cuisson.","Laisser refroidir 15 minutes dans l''eau glacée.","Conserver non écalés au frigo jusqu''à 7 jours. Marquer la date avec un stylo."]',
true, 'approved', 'Prêts pour toute la semaine — snack, salade, jambon-beurre'),

(uid, 'Tofu mariné et rôti (base végétarienne)', '', 6, 15, 25,
'["2 blocs de tofu ferme (400g chacun)","Marinade : 4 c. à soupe de sauce soja, 2 c. à soupe d''huile de sésame, 2 gousses d''ail, 1 c. à soupe de gingembre râpé, 1 c. à soupe de miel ou sirop d''érable, 1 c. à soupe de vinaigre de riz"]',
'["Presser le tofu entre des torchons avec un poids pendant 20 minutes pour éliminer l''humidité.","Couper en cubes de 2 cm.","Mélanger les ingrédients de la marinade.","Faire mariner le tofu 30 minutes minimum (ou une nuit).","Enfourner à 200°C sur une plaque huilée pendant 20-25 minutes en retournant à mi-cuisson.","Refroidir et portionner. Utiliser dans riz, wok, salades ou soupes."]',
true, 'approved', 'Bien presser le tofu = texture dorée croustillante'),

(uid, 'Cuisses de poulet confites à l''ail et thym', '', 6, 10, 55,
'["6 cuisses de poulet","8 gousses d''ail","4 branches de thym frais","4 branches de romarin","Huile d''olive généreuse","Sel, poivre"]',
'["Préchauffer le four à 160°C.","Disposer les cuisses dans un plat à four. Assaisonner généreusement.","Ajouter ail en chemise, thym et romarin. Arroser d''huile d''olive.","Couvrir de papier aluminium. Cuire 45 minutes.","Retirer l''aluminium. Cuire encore 10 minutes pour dorer la peau.","Refroidir et portionner avec leur jus. Se conserve 4 jours au frigo — le jus est une sauce naturelle."]',
true, 'approved', 'Confit à basse température = viande ultra-fondante qui se réchauffe parfaitement'),

-- ═══════════════════════════════════════════════════
-- 🥦 LÉGUMES RÔTIS ET PRÉPARÉS EN AVANCE
-- ═══════════════════════════════════════════════════

(uid, 'Légumes rôtis au four (grande plaque)', '', 6, 15, 35,
'["1 courgette","2 poivrons (rouge et jaune)","1 aubergine","2 carottes","1 oignon rouge","1 tête d''ail","4 c. à soupe d''huile d''olive","1 c. à café d''herbes de Provence","Sel, poivre"]',
'["Préchauffer le four à 200°C.","Couper tous les légumes en morceaux de taille similaire (3-4 cm).","Répartir sur une grande plaque de cuisson en une seule couche.","Arroser d''huile d''olive, saupoudrer d''herbes, saler et poivrer.","Rôtir 30-35 minutes en retournant à mi-cuisson.","Laisser refroidir. Portionner dans des boîtes hermétiques. Durée : 5 jours au frigo."]',
true, 'approved', 'Utiliser en accompagnement, dans des pâtes, couscous ou omelettes'),

(uid, 'Courge butternut rôtie en cubes', '', 6, 10, 30,
'["1 grosse courge butternut (1,2 kg)","3 c. à soupe d''huile d''olive","1 c. à café de cannelle","1 c. à café de cumin","1 c. à café de paprika doux","Sel, poivre"]',
'["Préchauffer le four à 200°C.","Éplucher la courge, retirer les graines. Couper en cubes de 3 cm.","Mélanger les épices avec l''huile d''olive.","Enrober les cubes de courge du mélange épicé.","Répartir sur une plaque. Rôtir 25-30 minutes.","Laisser refroidir. Utiliser dans des salades, soupes, currys ou wraps."]',
true, 'approved', 'Polyvalent : salades, soupes, curry — s''utilise chaud ou froid'),

(uid, 'Patates douces cuites au four entières', '', 6, 5, 50,
'["6 patates douces moyennes (200g chacune)","Huile d''olive","Gros sel"]',
'["Préchauffer le four à 200°C.","Piquer les patates douces avec une fourchette sur toute leur surface.","Frotter légèrement d''huile et rouler dans le gros sel.","Disposer directement sur la grille du four.","Cuire 45-50 minutes selon la taille.","Refroidir complètement. Conserver entières au frigo 5 jours. Utiliser en purée, farcie, en cubes dans une salade."]',
true, 'approved', 'Entières au frigo = peau facile à retirer au moment de l''utilisation'),

(uid, 'Carottes glacées au miel et gingembre (batch)', '', 6, 10, 25,
'["1 kg de carottes","3 c. à soupe de beurre","3 c. à soupe de miel","1 c. à café de gingembre frais râpé","Sel, persil frais","100ml d''eau"]',
'["Éplucher et couper les carottes en rondelles biseautées de 5 mm.","Mettre dans une grande sauteuse avec beurre, miel, eau et gingembre.","Cuire à couvert à feu moyen 15 minutes.","Retirer le couvercle, augmenter le feu pour faire réduire le jus et glacer les carottes 5 minutes.","Assaisonner. Parsemer de persil.","Portionner et réfrigérer. Se réchauffent parfaitement au micro-ondes."]',
true, 'approved', 'Accompagnement prêt en 5 min au micro-ondes toute la semaine'),

(uid, 'Épinards blanchis et pressés (base gratins, pâtes, wok)', '', 6, 5, 5,
'["1 kg d''épinards frais en feuilles","Sel","Eau de cuisson bouillante","Huile d''olive","2 gousses d''ail"]',
'["Laver abondamment les épinards.","Porter une grande casserole d''eau salée à ébullition.","Plonger les épinards 2 minutes dans l''eau bouillante.","Égoutter et plonger immédiatement dans de l''eau froide pour stopper la cuisson.","Presser fortement entre les mains pour éliminer le maximum d''eau.","Portionner en boules de 100g. Conserver 4 jours au frigo. Utiliser dans des pâtes, gratins, tartes ou wok."]',
true, 'approved', 'Bien presser = évite les plats détrempés en semaine'),

(uid, 'Brocolis vapeur (à utiliser chaud ou froid)', '', 6, 10, 8,
'["2 brocolis (800g total)","Sel","Jus d''un citron","2 c. à soupe d''huile d''olive"]',
'["Diviser les brocolis en fleurettes de taille uniforme.","Éplucher et couper le tronc en rondelles.","Cuire à la vapeur 7-8 minutes (al dente, pas trop mou).","Plonger dans l''eau froide pour arrêter la cuisson et préserver la couleur verte.","Égoutter et sécher sur un torchon.","Arroser d''huile d''olive et de citron. Portionner. Utiliser froid en salade ou réchauffer rapidement à la poêle."]',
true, 'approved', 'Al dente est essentiel — recuira lors du réchauffage'),

(uid, 'Aubergines rôties confites à l''huile d''olive', '', 6, 10, 35,
'["3 grosses aubergines","6 c. à soupe d''huile d''olive","4 gousses d''ail","Thym, origan","Sel, poivre"]',
'["Préchauffer le four à 200°C.","Couper les aubergines en cubes de 2 cm.","Saler généreusement, laisser dégorger 15 minutes. Rincer et éponger.","Mélanger avec l''huile, l''ail émincé et les herbes.","Rôtir 30-35 minutes en retournant à mi-cuisson.","Laisser compoter légèrement. Portionner. Utiliser dans des pâtes, sur des bruschetta, dans des sandwichs ou avec du houmous."]',
true, 'approved', 'Dégorger les aubergines évite l''excès d''huile absorbée'),

(uid, 'Champignons sautés à l''ail et persil (batch)', '', 6, 10, 10,
'["1 kg de champignons de Paris","4 gousses d''ail","1 bouquet de persil","4 c. à soupe d''huile d''olive","Sel, poivre"]',
'["Nettoyer les champignons avec un torchon humide. Couper en quartiers.","Chauffer fortement une grande poêle.","Cuire les champignons à feu vif SANS remuer pendant 3 minutes (caramélisation).","Retourner et cuire encore 3 minutes.","Ajouter l''ail et le persil en fin de cuisson. Assaisonner.","Refroidir. Portionner. Utiliser dans des omelettes, pâtes, risottos ou sur du pain grillé."]',
true, 'approved', 'Ne pas saler en début de cuisson — les champignons rendraient trop d''eau'),

-- ═══════════════════════════════════════════════════
-- 🍅 SAUCES ET CONDIMENTS BASE
-- ═══════════════════════════════════════════════════

(uid, 'Grande sauce tomate maison (batch 2 litres)', '', 10, 15, 40,
'["2 kg de tomates concassées en boîte (ou fraîches)","3 oignons","6 gousses d''ail","4 c. à soupe d''huile d''olive","1 bouquet de basilic frais","1 c. à café de sucre","Sel, poivre, origan"]',
'["Faire revenir les oignons dans l''huile d''olive à feu moyen 8 minutes.","Ajouter l''ail et cuire 2 minutes.","Incorporer les tomates concassées, le sucre et l''origan.","Mijoter à feu doux 30-35 minutes en remuant régulièrement.","Ajouter le basilic frais en fin de cuisson. Assaisonner.","Mixer partiellement selon la texture souhaitée. Portionner par 300ml. Se congèle 3 mois."]',
true, 'approved', 'Base essentielle pour pasta, pizza, shakshuka, lasagnes'),

(uid, 'Sauce bolognaise en grande quantité (batch 3 kg)', '', 12, 20, 90,
'["1,5 kg de bœuf haché","3 oignons","4 carottes","4 branches de céleri","6 gousses d''ail","2 boîtes de tomates concassées","200ml de vin rouge","2 c. à soupe de concentré de tomate","Huile d''olive, sel, poivre, laurier, thym"]',
'["Faire revenir oignons, carottes et céleri en brunoise dans l''huile d''olive 10 minutes.","Ajouter l''ail. Cuire 2 minutes.","Ajouter le bœuf haché et cuire à feu vif en égrainant bien.","Déglacer au vin rouge. Laisser réduire 5 minutes.","Ajouter concentré de tomate, tomates concassées, laurier et thym.","Mijoter à feu très doux 1 heure à couvert. Ajuster l''assaisonnement.","Portionner par 400g. Se congèle parfaitement."]',
true, 'approved', 'La meilleure bolognaise mijote longtemps — préparer le double pour congeler'),

(uid, 'Pesto maison (batch 400g)', '', 8, 15, 0,
'["100g de basilic frais","80g de parmesan râpé","50g de pignons de pin (ou noix de cajou)","3 gousses d''ail","150ml d''huile d''olive extra-vierge","Sel, poivre","Jus de citron"]',
'["Griller légèrement les pignons à sec dans une poêle.","Mixer basilic, pignons, ail et parmesan.","Incorporer l''huile d''olive en filet tout en mixant.","Ajouter le citron, sel et poivre. Ajuster la texture.","Répartir dans de petits pots en verre. Couvrir d''une fine couche d''huile d''olive pour la conservation.","Se conserve 1 semaine au frigo ou 3 mois au congélateur (en glaçons)."]',
true, 'approved', 'Congeler en glaçons de pesto = dose parfaite pour une portion de pâtes'),

(uid, 'Houmous maison (grand batch)', '', 8, 15, 0,
'["400g de pois chiches cuits (ou 2 boîtes)","100g de tahini (purée de sésame)","Jus de 2 citrons","3 gousses d''ail","6 c. à soupe d''huile d''olive","1 c. à café de cumin","Sel, eau glacée","Paprika et persil pour servir"]',
'["Mixer les pois chiches, tahini, ail, citron et cumin.","Ajouter l''huile d''olive en filet tout en mixant.","Incorporer de l''eau glacée cuillère par cuillère pour obtenir une texture lisse et aérée.","Assaisonner généreusement. Mixer encore 2 minutes pour aérer.","Répartir dans des boîtes hermétiques. Finir avec huile d''olive, paprika et persil.","Se conserve 5 jours au frigo. Utilisez en trempette, tartinade, sauce pour wraps."]',
true, 'approved', 'L''eau glacée est le secret d''un houmous lisse comme en restaurant'),

(uid, 'Sauce béchamel grande quantité (lasagnes, gratin)', '', 8, 5, 15,
'["100g de beurre","100g de farine","1 litre de lait entier","Noix de muscade","Sel, poivre blanc"]',
'["Faire fondre le beurre dans une casserole à feu moyen.","Ajouter la farine en une fois et cuire en remuant 2 minutes (roux).","Incorporer le lait froid en 3 fois en fouettant vigoureusement à chaque fois.","Cuire à feu moyen en fouettant constamment jusqu''à épaississement (8-10 minutes).","Assaisonner avec muscade, sel et poivre blanc.","Filmer au contact pour éviter la pellicule. Refroidir. Se conserve 3 jours au frigo ou se congèle."]',
true, 'approved', 'Filmer au contact pour éviter la peau en surface'),

(uid, 'Sauce curry de base (tikka, korma, vindaloo)', '', 6, 15, 35,
'["3 oignons","4 gousses d''ail","3 cm de gingembre frais","2 boîtes de tomates concassées","200ml de crème de coco","2 c. à soupe d''huile neutre","2 c. à café de curry en poudre","1 c. à café de curcuma","1 c. à café de garam masala","1 c. à café de coriandre moulue","Sel"]',
'["Faire revenir les oignons à feu moyen 10 minutes jusqu''à caramélisation.","Ajouter ail et gingembre râpés. Cuire 2 minutes.","Incorporer toutes les épices. Cuire 1 minute en remuant.","Ajouter les tomates concassées. Mijoter 15 minutes.","Incorporer la crème de coco. Mijoter encore 10 minutes.","Mixer finement. Portionner. Ajouter viande, légumes ou légumineuses de votre choix au moment de servir."]',
true, 'approved', 'Sauce de base polyvalente — ajouter la protéine de votre choix au moment'),

(uid, 'Vinaigrette moutarde-miel (grande quantité)', '', 10, 5, 0,
'["150ml d''huile d''olive","50ml de vinaigre de cidre","2 c. à soupe de moutarde de Dijon","1 c. à soupe de miel","1 gousse d''ail pressée","Sel, poivre","Herbes fraîches optionnelles"]',
'["Mettre la moutarde, le miel, l''ail et le vinaigre dans un bocal en verre.","Ajouter sel et poivre.","Verser l''huile d''olive.","Fermer le bocal et secouer énergiquement 30 secondes.","Goûter et ajuster l''équilibre vinaigre/miel/sel.","Conserver au frigo 2 semaines. Secouer avant chaque utilisation."]',
true, 'approved', 'Bocal en verre = shake facile et conservation parfaite'),

-- ═══════════════════════════════════════════════════
-- 🍵 SOUPES ET VELOUTÉS EN GRAND FORMAT
-- ═══════════════════════════════════════════════════

(uid, 'Soupe minestrone (grande marmite, 8 portions)', '', 8, 20, 35,
'["2 carottes","2 branches de céleri","2 courgettes","1 boîte de haricots blancs","1 boîte de tomates concassées","150g de petites pâtes ou haricots verts","2 litres de bouillon de légumes","1 oignon","3 gousses d''ail","Parmesan","Huile d''olive, sel, poivre, basilic"]',
'["Faire revenir oignon, carotte et céleri en brunoise 8 minutes dans l''huile d''olive.","Ajouter l''ail et cuire 1 minute.","Incorporer les tomates et le bouillon. Porter à ébullition.","Ajouter courgettes, haricots et haricots verts. Mijoter 15 minutes.","Ajouter les pâtes 8 minutes avant la fin.","Assaisonner, finir avec basilic et parmesan. Portionner. Se congèle sans les pâtes."]',
true, 'approved', 'Congeler sans les pâtes — ajouter fraîches à la décongélation'),

(uid, 'Velouté de carottes gingembre-coco (batch 3L)', '', 8, 15, 30,
'["1,2 kg de carottes","1 oignon","3 cm de gingembre frais","400ml de lait de coco","1,5 litre de bouillon de légumes","2 c. à soupe d''huile d''olive","Sel, poivre, cumin","Coriandre fraîche pour servir"]',
'["Éplucher et couper les carottes en rondelles.","Faire revenir l''oignon et le gingembre dans l''huile d''olive.","Ajouter les carottes et faire revenir 5 minutes.","Verser le bouillon. Porter à ébullition. Cuire 20 minutes.","Ajouter le lait de coco. Mixer finement.","Assaisonner. Portionner. Se congèle parfaitement. Réchauffer en 5 minutes avec un peu d''eau si trop épais."]',
true, 'approved', 'Excellent froid en gazpacho l''été aussi'),

(uid, 'Soupe lentilles-courge-cumin (batch 3L)', '', 8, 15, 30,
'["300g de lentilles corail","700g de courge butternut","1 oignon","3 gousses d''ail","1,5 litre de bouillon","1 boîte de tomates concassées","2 c. à café de cumin","1 c. à café de coriandre","Huile d''olive, sel, poivre, citron"]',
'["Faire revenir l''oignon et l''ail dans l''huile d''olive.","Ajouter les épices. Cuire 1 minute.","Incorporer la courge coupée en cubes, les lentilles, les tomates et le bouillon.","Porter à ébullition. Cuire 20-25 minutes.","Mixer partiellement pour un mélange lisse et morceleux.","Ajuster l''assaisonnement avec sel et citron. Portionner. Se congèle 3 mois."]',
true, 'approved', 'Mixer partiellement = texture plus intéressante que tout lisse'),

(uid, 'Potage poireaux-pommes de terre (grand format)', '', 8, 15, 30,
'["4 poireaux","4 pommes de terre farineuses","1 oignon","1,5 litre de bouillon de poulet ou légumes","200ml de crème légère","50g de beurre","Sel, poivre, ciboulette"]',
'["Émincer les poireaux (blanc et vert tendre).","Faire suer les poireaux et l''oignon dans le beurre 10 minutes.","Ajouter les pommes de terre coupées en cubes et le bouillon.","Cuire 20 minutes à couvert.","Mixer finement. Incorporer la crème.","Assaisonner. Portionner. Servir avec ciboulette. Se congèle sans la crème (ajouter à la décongélation)."]',
true, 'approved', 'Congeler sans crème — ajouter la crème fraîche au réchauffage'),

(uid, 'Bouillon de poulet maison (batch 3 litres)', '', 8, 10, 120,
'["1 carcasse de poulet rôti (ou 1 kg d''ailes/cous)","3 carottes","3 branches de céleri","2 oignons","1 bouquet garni","5 grains de poivre","1 c. à soupe de vinaigre de pomme (extrait collagène)","3,5 litres d''eau froide","Sel"]',
'["Placer tous les ingrédients dans une grande marmite.","Partir à froid et porter lentement à frémissement (ne pas faire bouillir fort).","Écumer la mousse pendant les 20 premières minutes.","Laisser frémir à couvert pendant 1h30 à 2h.","Filtrer à travers une passoire fine. Saler légèrement.","Refroidir rapidement dans un bain d''eau froide. Dégraisser une fois refroidi. Portionner par 500ml."]',
true, 'approved', 'Le vinaigre extrait le collagène des os — bouillon gélatineux naturel'),

(uid, 'Soupe de pois chiches à l''espagnole (cocido)', '', 8, 15, 60,
'["400g de pois chiches cuits","300g de chorizo tranché","200g de lard fumé","3 carottes","4 pommes de terre","1 oignon","3 gousses d''ail","1 boîte de tomates","2 litres de bouillon","Paprika fumé, cumin, laurier, sel"]',
'["Faire revenir le lard et le chorizo dans une grande marmite.","Ajouter oignon et ail. Cuire 5 minutes.","Incorporer carottes, pommes de terre, tomates et épices.","Verser le bouillon. Porter à ébullition.","Cuire 30 minutes. Ajouter les pois chiches. Cuire encore 15 minutes.","Ajuster l''assaisonnement. Portionner. Se bonifie le lendemain."]',
true, 'approved', 'Encore meilleur le lendemain — idéal batch cooking semaine'),

-- ═══════════════════════════════════════════════════
-- 🥗 SALADES ET BOWLS BASE EN AVANCE
-- ═══════════════════════════════════════════════════

(uid, 'Salade de lentilles en bocal (prête à emporter)', '', 4, 15, 0,
'["400g de lentilles vertes cuites","200g de tomates cerises","100g de feta","1 concombre","4 c. à soupe d''huile d''olive","2 c. à soupe de vinaigre balsamique","1 échalote","Persil, menthe","Sel, poivre"]',
'["Préparer les lentilles cuites à l''avance (voir recette lentilles cuites).","Couper tomates, concombre en dés. Émincer l''échalote.","Mélanger lentilles, légumes, herbes et vinaigrette.","Émietter la feta par-dessus.","Montage en bocal : vinaigrette au fond, lentilles, légumes, feta en surface.","Se conserve 4 jours au frigo. Secouer avant de manger."]',
true, 'approved', 'La vinaigrette au fond du bocal ne ramollit pas les légumes'),

(uid, 'Buddha bowl base (quinoa, légumes rôtis, tahini)', '', 4, 15, 0,
'["400g de quinoa cuit (recette batch)","400g de légumes rôtis (recette batch)","200g de pois chiches rôtis","2 avocats","Sauce tahini : 4 c. à soupe tahini, jus de citron, ail, eau, sel","Graines de sésame","Herbes fraîches"]',
'["Réchauffer le quinoa et les légumes rôtis si nécessaire.","Rôtir les pois chiches égouttés 20 minutes à 200°C avec huile et épices.","Préparer la sauce tahini en mélangeant tous les ingrédients.","Couper les avocats en tranches.","Assembler les bols : quinoa, légumes, pois chiches, avocat.","Arroser de sauce tahini. Parsemer de graines de sésame et herbes."]',
true, 'approved', 'Assembler au moment, composants préparés en avance'),

(uid, 'Taboulé libanais en grand batch', '', 8, 20, 0,
'["200g de boulgour fin","1 kg de tomates","2 bottes de persil plat","1 botte de menthe fraîche","4 oignons nouveaux","Jus de 4 citrons","8 c. à soupe d''huile d''olive extra-vierge","Sel, poivre"]',
'["Verser de l''eau bouillante sur le boulgour, couvrir 10 minutes, égoutter.","Ciseler finement le persil et la menthe (retirer les tiges).","Couper les tomates en très petits dés. Émincer les oignons nouveaux.","Mélanger tous les ingrédients dans un grand saladier.","Assaisonner généreusement avec citron, huile, sel et poivre.","Laisser reposer 1h au frigo avant de servir. Se conserve 3 jours."]',
true, 'approved', 'Plus de persil que de boulgour — c''est la règle du taboulé libanais'),

(uid, 'Salade de riz complet, légumes et herbes (batch)', '', 6, 15, 0,
'["500g de riz complet cuit","2 poivrons grillés","100g d''olives noires","100g de tomates séchées","50g de câpres","4 c. à soupe d''huile d''olive","2 c. à soupe de vinaigre de xérès","Basilic, persil","Sel, poivre"]',
'["Préparer le riz complet cuit à l''avance et refroidi.","Couper les poivrons grillés en lanières.","Hacher grossièrement les tomates séchées.","Mélanger riz, poivrons, olives, tomates séchées et câpres.","Assaisonner avec huile, vinaigre, sel et poivre.","Ajouter les herbes fraîches au dernier moment. Se conserve 4 jours."]',
true, 'approved', 'Meilleur à température ambiante — sortir du frigo 20 min avant'),

-- ═══════════════════════════════════════════════════
-- 🍳 PLATS COMPLETS À CONGELER
-- ═══════════════════════════════════════════════════

(uid, 'Lasagnes maison (grand format 2 plats)', '', 12, 30, 50,
'["600g de lasagnes sèches","Sauce bolognaise (recette batch, 1,2 kg)","Béchamel (recette batch, 1 litre)","200g de parmesan râpé","200g de mozzarella râpée"]',
'["Préparer la bolognaise et la béchamel en avance (recettes batch).","Préchauffer le four à 180°C.","Dans 2 plats à gratin, alterner : béchamel, lasagnes, bolognaise, fromage.","Finir par béchamel et parmesan en surface.","Cuire 45 minutes à couvert puis 5 minutes à découvert pour gratiner.","Laisser refroidir 15 minutes avant de découper. Congeler un des deux plats non cuit."]',
true, 'approved', 'Congeler un plat CRU avec les mêmes ingrédients — cuire directement congelé 1h15 à 180°C'),

(uid, 'Chili con carne (grande marmite, 10 portions)', '', 10, 20, 90,
'["800g de bœuf haché","2 boîtes de haricots rouges","2 boîtes de tomates concassées","2 oignons","4 gousses d''ail","2 poivrons rouges","2 c. à café de cumin","2 c. à café de paprika fumé","1 c. à café de coriandre","1 c. à café de cannelle","Piment selon goût","Sel, chocolat noir (optionnel)"]',
'["Faire revenir oignons, ail et poivrons dans l''huile.","Ajouter le bœuf haché et cuire à feu vif en égrainant.","Incorporer toutes les épices. Cuire 1 minute.","Ajouter tomates et haricots rouges rincés.","Mijoter à feu doux 1 heure en remuant régulièrement.","Ajouter un carré de chocolat noir pour profondeur. Assaisonner. Portionner par 300g."]',
true, 'approved', 'Se bonifie les jours suivants — idéal pour préparer le dimanche'),

(uid, 'Curry de pois chiches à la tomate (chana masala batch)', '', 8, 15, 35,
'["600g de pois chiches cuits","2 boîtes de tomates concassées","2 oignons","4 gousses d''ail","3 cm de gingembre","2 c. à café de garam masala","1 c. à café de cumin","1 c. à café de coriandre","1 c. à café de curcuma","Huile, sel, citron, coriandre fraîche"]',
'["Faire revenir oignons dans l''huile jusqu''à caramélisation légère (10 min).","Ajouter ail et gingembre râpés. Cuire 2 minutes.","Incorporer toutes les épices. Cuire 1 minute en remuant.","Ajouter les tomates concassées. Mijoter 10 minutes.","Incorporer les pois chiches. Cuire encore 15 minutes.","Finir avec citron et coriandre fraîche. Portionner. Se congèle parfaitement."]',
true, 'approved', 'Plat végétarien complet — protéines et fibres pour toute la semaine'),

(uid, 'Gratin dauphinois (2 plats : un pour cette semaine, un à congeler)', '', 12, 20, 65,
'["2 kg de pommes de terre à chair ferme","800ml de crème liquide","400ml de lait","4 gousses d''ail","Noix de muscade","Sel, poivre","Beurre pour les plats","200g de gruyère râpé"]',
'["Préchauffer le four à 160°C.","Éplucher et trancher les pommes de terre en rondelles de 3 mm à la mandoline.","Frotter les plats beurrés avec de l''ail.","Chauffer crème, lait, ail et muscade. Saler généreusement.","Disposer les pommes de terre en couches, verser la crème chaude. Couvrir de gruyère.","Cuire 1h à 1h05. Laisser refroidir avant de congeler un des plats."]',
true, 'approved', 'Les tranches fines à la mandoline garantissent une cuisson homogène'),

(uid, 'Hachis Parmentier (grand plat à partager ou 2 petits)', '', 10, 20, 40,
'["800g de bœuf haché cuit (recette batch)","1,5 kg de pommes de terre","100g de beurre","200ml de crème","200g de gruyère","1 oignon","2 gousses d''ail","Thym, laurier, sel, poivre"]',
'["Préchauffer le four à 200°C.","Cuire les pommes de terre, les écraser avec beurre et crème chaude. Assaisonner.","Réchauffer le bœuf haché avec oignon, ail, thym et laurier.","Dans un grand plat, déposer le hachis de viande.","Couvrir de purée. Saupoudrer de gruyère râpé.","Enfourner 30-35 minutes jusqu''à gratinage. Se congèle cru ou cuit."]',
true, 'approved', 'Utiliser le bœuf haché préparé en batch — plat complet en 45 minutes'),

(uid, 'Soupe ramen de poulet (bouillon batch et toppings séparés)', '', 6, 20, 30,
'["1,5 litre de bouillon de poulet batch","200g de pousses de soja","6 œufs durs mollets","200g de champignons shiitake","3 c. à soupe de sauce soja","1 c. à soupe de miso","2 cm de gingembre","3 gousses d''ail","Huile de sésame","Nouilles ramen","Oignons verts, algues nori"]',
'["Enrichir le bouillon de poulet avec sauce soja, miso, gingembre et ail. Mijoter 15 minutes.","Cuire les œufs 6 minutes 30 dans l''eau bouillante (mollets). Refroidir et écaler.","Faire sauter les champignons dans huile de sésame.","Cuire les nouilles ramen séparément.","Portionner le bouillon aromatisé dans des boîtes.","Au moment de servir : bouillon chaud, nouilles, toppings. Personnaliser chaque bol."]',
true, 'approved', 'Garder bouillon, toppings et nouilles séparés pour assembler au moment'),

-- ═══════════════════════════════════════════════════
-- 🧁 PETITS PLATS ET EN-CAS BATCH
-- ═══════════════════════════════════════════════════

(uid, 'Muffins salés courgette-feta (12 muffins batch)', '', 12, 15, 25,
'["250g de farine","1 sachet de levure","3 œufs","150ml de lait","100ml d''huile d''olive","2 courgettes râpées et pressées","150g de feta émiettée","100g de parmesan râpé","Sel, poivre, origan"]',
'["Préchauffer le four à 180°C. Garnir un moule à 12 muffins.","Râper les courgettes, saler et presser dans un torchon pour éliminer l''eau.","Mélanger farine et levure dans un bol.","Fouetter œufs, lait et huile dans un autre bol.","Mélanger les deux préparations. Incorporer courgettes, feta, parmesan, origan.","Verser dans les moules. Cuire 22-25 minutes. Laisser refroidir. Se congèlent 3 mois."]',
true, 'approved', 'Congeler individuellement — décongelé en 2 minutes au micro-ondes'),

(uid, 'Pancakes protéinés avoine-banane (batch 20 pièces)', '', 10, 10, 20,
'["200g de flocons d''avoine mixés (farine d''avoine)","4 bananes mûres écrasées","4 œufs","200ml de lait","1 sachet de levure","1 c. à café de vanille","1 pincée de sel","Huile de coco pour la cuisson"]',
'["Mixer les flocons d''avoine en farine grossière.","Écraser les bananes à la fourchette.","Mélanger tous les ingrédients jusqu''à obtenir une pâte homogène.","Laisser reposer 5 minutes.","Cuire 2-3 minutes par face dans une poêle légèrement huilée.","Laisser refroidir sur une grille. Congeler par 4 dans des sachets. Décongeler au grille-pain."]',
true, 'approved', 'Sans gluten si utilise avoine certifiée — congeler empilés avec papier sulfurisé entre chaque'),

(uid, 'Barres granola maison (16 barres batch)', '', 16, 15, 25,
'["300g de flocons d''avoine","100g de miel ou sirop d''érable","60g de beurre ou huile de coco","50g de graines de tournesol","50g de graines de courge","50g de raisins secs","50g de cranberries","50g d''amandes hachées","1 c. à café de cannelle","1 pincée de sel"]',
'["Préchauffer le four à 170°C.","Chauffer miel et beurre jusqu''à dissolution.","Mélanger tous les ingrédients secs dans un grand bol.","Verser le mélange chaud dessus et mélanger énergiquement.","Presser fortement dans un plat recouvert de papier sulfurisé.","Cuire 20-25 minutes jusqu''à dorure. Laisser COMPLÈTEMENT refroidir avant de couper en barres. Conservation : 2 semaines."]',
true, 'approved', 'Attendre refroidissement complet avant de couper — sinon elles s''effritent'),

(uid, 'Boules d''énergie cacao-amande (batch 24 pièces)', '', 24, 15, 0,
'["200g de dattes Medjool dénoyautées","100g d''amandes","50g de noix de cajou","3 c. à soupe de cacao en poudre non sucré","2 c. à soupe de beurre d''amande","1 c. à café de vanille","Coco râpée ou cacao pour rouler"]',
'["Faire tremper les dattes 10 minutes dans l''eau chaude si elles sont trop sèches.","Mixer amandes et noix de cajou en poudre grossière.","Ajouter les dattes égouttées, cacao, beurre d''amande et vanille.","Mixer jusqu''à obtenir une pâte collante.","Former des boules de la taille d''une noix (25g).","Rouler dans la coco râpée ou le cacao. Réfrigérer 30 minutes. Conservation : 2 semaines au frigo."]',
true, 'approved', 'Snack naturel sans sucres ajoutés — 2 boules = en-cas rassasiant'),

(uid, 'Galettes de légumes au four (batch 12 galettes)', '', 12, 20, 25,
'["500g de carottes râpées","300g de courgettes râpées","3 œufs","100g de farine de pois chiche","100g de parmesan râpé","1 oignon râpé","3 gousses d''ail","Persil, cumin","Sel, poivre","Huile d''olive"]',
'["Préchauffer le four à 200°C.","Râper carottes et courgettes. Saler et presser dans un torchon pour éliminer l''eau.","Mélanger tous les ingrédients dans un grand bol.","Former 12 galettes et les poser sur une plaque huilée.","Cuire 20-25 minutes en retournant à mi-cuisson.","Refroidir. Conserver 5 jours au frigo ou congeler 3 mois."]',
true, 'approved', 'Bien presser les légumes râpés = galettes qui tiennent à la cuisson'),

(uid, 'Frittata de four (4 parts à emporter)', '', 4, 15, 25,
'["8 œufs","200ml de crème ou lait","200g de légumes rôtis batch","100g de fromage de chèvre ou feta","1 oignon caramélisé","Herbes fraîches","Sel, poivre"]',
'["Préchauffer le four à 180°C.","Fouetter les œufs avec la crème, sel, poivre et herbes.","Huiler un moule carré ou rectangulaire.","Répartir les légumes rôtis et l''oignon caramélisé dans le moule.","Verser l''appareil à œufs. Émietter le fromage sur le dessus.","Cuire 22-25 minutes jusqu''à prise complète. Couper en 4 portions. Se conserve 4 jours."]',
true, 'approved', 'Utilise les légumes batch — repas ou snack transportable'),

(uid, 'Pain de mie complet maison (2 pains batch)', '', 16, 20, 35,
'["700g de farine T80 (ou mix T65+son)","300ml d''eau tiède","200ml de lait tiède","2 sachets de levure de boulanger","2 c. à café de sel","2 c. à soupe de miel","50g de beurre mou"]',
'["Dissoudre la levure dans l''eau tiède avec le miel. Laisser 10 minutes.","Mélanger farine et sel. Creuser un puits.","Incorporer le mélange levure et le lait. Pétrir 10 minutes.","Ajouter le beurre et pétrir encore 5 minutes.","Laisser lever 1h sous un torchon.","Diviser en 2. Façonner en boules allongées dans 2 moules. Lever 45 minutes. Cuire 30 minutes à 180°C."]',
true, 'approved', 'Congeler le deuxième pain en tranches — griller directement congelé'),

(uid, 'Purée de pommes de terre (grande quantité à congeler)', '', 8, 10, 25,
'["1,5 kg de pommes de terre farineuses (Bintje, Monalisa)","150g de beurre","300ml de lait chaud","Noix de muscade","Sel, poivre blanc"]',
'["Éplucher et couper les pommes de terre en morceaux de taille uniforme.","Cuire à l''eau bouillante salée 20-25 minutes.","Égoutter et laisser sécher 2 minutes sur feu doux.","Passer au moulin à légumes (jamais au mixeur — devient collant).","Incorporer beurre et lait chaud progressivement.","Assaisonner avec muscade, sel et poivre blanc. Portionner dans des sachets zip pour congeler."]',
true, 'approved', 'Moulin à légumes obligatoire — le mixeur rend la purée collante'),

(uid, 'Compote de pommes nature (grand batch à conserver)', '', 8, 15, 20,
'["1,5 kg de pommes (Golden, Gala ou mix)","Jus d''un citron","1 bâton de cannelle","1 gousse de vanille","3 c. à soupe de sucre (ou miel)","50ml d''eau"]',
'["Éplucher, évider et couper les pommes en quartiers.","Mettre dans une casserole avec l''eau, le citron, la cannelle et la vanille fendue.","Cuire à couvert à feu moyen 15 minutes en remuant de temps en temps.","Ajouter le sucre selon le goût et la variété des pommes.","Mixer partiellement ou laisser en morceaux selon préférence.","Portionner dans des bocaux stérilisés ou des boîtes. Dure 1 semaine au frigo ou 6 mois au congélateur."]',
true, 'approved', 'Sans ajout de sucre si pommes bien mûres — accompagne porridge, yaourt et crêpes'),

(uid, 'Granola maison au four (grand batch 1 kg)', '', 20, 10, 30,
'["500g de flocons d''avoine","100g d''amandes","100g de noix de cajou","80g de graines de tournesol","80g de graines de courge","150g de miel ou sirop d''érable","100ml d''huile de coco ou neutre","1 c. à café de cannelle","1 c. à café de vanille","150g de fruits secs (raisins, abricots, cranberries)"]',
'["Préchauffer le four à 160°C.","Mélanger flocons, amandes, noix, graines dans un grand bol.","Chauffer miel et huile de coco. Ajouter cannelle et vanille.","Verser sur le mélange sec et bien enrober.","Étaler en couche uniforme sur 2 grandes plaques.","Cuire 25-30 minutes en remuant 2-3 fois. Ajouter les fruits secs après cuisson. Laisser refroidir SANS remuer (forme les clusters). Conservation 3 semaines."]',
true, 'approved', 'Ne pas remuer en refroidissant = gros clusters croustillants'),

(uid, 'Sauce tzatziki en grand batch (500g)', '', 8, 15, 0,
'["500g de yaourt grec entier","2 concombres","3 gousses d''ail","3 c. à soupe d''huile d''olive","2 c. à soupe de vinaigre de vin blanc ou citron","Menthe et aneth frais","Sel"]',
'["Râper les concombres. Saler et laisser dégorger 15 minutes dans une passoire.","Presser fortement pour éliminer le maximum d''eau.","Écraser l''ail en purée avec le sel.","Mélanger yaourt, concombre pressé, ail, huile et vinaigre.","Ajouter la menthe et l''aneth ciselés.","Réfrigérer 1h avant de servir. Se conserve 4 jours. Utiliser comme sauce, trempette ou accompagnement."]',
true, 'approved', 'Bien presser le concombre = tzatziki épais et non liquide'),

(uid, 'Sauce verde (persil, câpres, anchois) pour viandes et poissons', '', 8, 10, 0,
'["2 bottes de persil plat","1 botte de basilic","50g de câpres","4 filets d''anchois","2 gousses d''ail","150ml d''huile d''olive","2 c. à soupe de vinaigre de vin blanc","Poivre"]',
'["Laver et sécher soigneusement les herbes.","Effeuiller le persil et le basilic.","Mixer grossièrement persil, basilic, câpres, anchois et ail.","Incorporer l''huile d''olive en filet.","Ajouter le vinaigre. Poivrer. Ne pas saler (anchois et câpres sont salés).","Portionner dans des petits pots. Se conserve 1 semaine au frigo couverte d''huile."]',
true, 'approved', 'Excellente sur viandes grillées, poisson vapeur et légumes rôtis'),

(uid, 'Marinade universelle citron-ail-herbes (à préparer en avance)', '', 8, 10, 0,
'["150ml d''huile d''olive","Jus de 3 citrons","Zeste de 2 citrons","6 gousses d''ail pressées","2 c. à soupe de moutarde","2 c. à café de thym séché","2 c. à café d''origan","1 c. à café de paprika","Sel, poivre"]',
'["Mélanger tous les ingrédients dans un bol ou bocal.","Fouetter ou secouer vigoureusement.","Goûter et ajuster l''équilibre acide/sel/herbes.","Verser dans un bocal hermétique.","Conserver au frigo jusqu''à 2 semaines.","Utiliser pour mariner poulet (12h), poisson (1h), légumes (30 min) ou comme vinaigrette chaude pour grillades."]',
true, 'approved', 'Préparer le dimanche — mariner viandes dès le soir pour toute la semaine'),

(uid, 'Compote poire-gingembre (à emporter, petit-déj batch)', '', 8, 10, 15,
'["1,2 kg de poires","3 cm de gingembre frais","Jus d''un citron","2 c. à soupe de miel","100ml d''eau","1 étoile d''anis"]',
'["Éplucher et couper les poires en morceaux.","Râper le gingembre.","Mettre poires, gingembre, citron, miel, eau et anis dans une casserole.","Cuire à couvert 12-15 minutes à feu moyen.","Retirer l''anis étoilé. Mixer selon texture souhaitée.","Portionner dans des pots individuels de 150g. Dure 1 semaine au frigo ou 6 mois au congélateur."]',
true, 'approved', 'Pots individuels prêts à glisser dans le sac chaque matin');

END $$;
