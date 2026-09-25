-- PÂTISSERIES SIMPLES AVEC LES ENFANTS — 30 recettes
-- Sans doublon avec : banana bread, clafoutis, charlotte, cheesecake, churros, crêpes,
-- financiers, fondant, gâteau coco, mousse chocolat, pancakes, panna cotta, paris-brest,
-- profiteroles, speculoos, tarte tatin, tarte citron, tarte fraises, tiramisu

DO $$
DECLARE
  uid uuid := '97a98e5c-d29d-4a9f-9d84-0684eef75fe6'::uuid;
BEGIN

-- ═══════════════════════════════════════════════════
-- 🍰 GÂTEAUX FACILES
-- ═══════════════════════════════════════════════════

INSERT INTO recipes (user_id, title, source_url, servings, prep_time, cook_time, ingredients, steps, is_public, moderation_status, user_notes) VALUES

(uid, 'Gâteau au yaourt classique (recette enfants)', '', 8, 10, 35,
'["1 pot de yaourt nature (pot = mesure)","2 pots de sucre","3 pots de farine","1 pot d''huile neutre","3 œufs","1 sachet de levure chimique","1 sachet de sucre vanillé","1 pincée de sel"]',
'["Préchauffer le four à 180°C. Beurrer et fariner un moule rond.","Vider le yaourt dans un grand saladier. Garder le pot vide comme mesure.","Ajouter les œufs, le sucre et le sucre vanillé. Mélanger énergiquement.","Ajouter la farine, la levure et le sel. Bien mélanger.","Incorporer l''huile en dernier et mélanger jusqu''à pâte lisse.","Verser dans le moule. Enfourner 30-35 minutes (vérifier avec la pointe d''un couteau).","Laisser refroidir avant de démouler. Décorer avec du sucre glace si souhaité."]',
true, 'approved', 'La recette des enfants par excellence — le pot de yaourt sert de mesure'),

(uid, 'Quatre-quarts breton', '', 8, 15, 40,
'["250g de beurre doux mou","250g de sucre","250g de farine","4 œufs (environ 250g)","1 sachet de levure chimique","1 c. à café de vanille liquide","1 pincée de sel"]',
'["Préchauffer le four à 170°C. Beurrer un moule à cake.","Battre le beurre mou avec le sucre jusqu''à obtenir un mélange pâle et crémeux.","Ajouter les œufs un par un en battant bien entre chaque.","Incorporer la farine tamisée avec la levure et le sel.","Ajouter la vanille. Mélanger doucement pour ne pas trop travailler la pâte.","Verser dans le moule. Cuire 40-45 minutes.","Laisser refroidir 10 minutes avant de démouler. Conserver 3-4 jours."]',
true, 'approved', 'Quatre-quarts = 4 ingrédients en parts égales — les enfants adorent peser'),

(uid, 'Brownies aux noix et pépites de chocolat blanc', '', 12, 15, 25,
'["200g de chocolat noir à 70%","150g de beurre","200g de sucre","3 œufs","100g de farine","50g de cacao en poudre non sucré","100g de noix hachées","100g de pépites de chocolat blanc","1 pincée de sel"]',
'["Préchauffer le four à 180°C. Chemiser un moule carré de papier sulfurisé.","Faire fondre le chocolat noir et le beurre ensemble au bain-marie ou micro-ondes.","Ajouter le sucre. Mélanger. Incorporer les œufs un par un.","Ajouter farine, cacao et sel. Mélanger sans trop travailler.","Incorporer les noix et pépites de chocolat blanc.","Verser dans le moule. Cuire 20-22 minutes (le centre doit rester légèrement tremblotant).","Laisser refroidir complètement dans le moule avant de découper en carrés."]',
true, 'approved', 'Sous-cuire légèrement = texture fondante irrésistible'),

(uid, 'Cake marbré chocolat-vanille', '', 8, 20, 45,
'["3 œufs","200g de sucre","200g de farine","1 sachet de levure","100ml de lait","100ml d''huile neutre","2 c. à soupe de cacao en poudre","1 c. à café de vanille liquide","1 pincée de sel"]',
'["Préchauffer le four à 170°C. Beurrer un moule à cake.","Fouetter œufs et sucre jusqu''à blanchiment.","Ajouter huile, lait et vanille. Bien mélanger.","Incorporer farine, levure et sel.","Séparer la pâte en deux parties égales. Ajouter le cacao dans l''une.","Verser en alternant les pâtes dans le moule. Passer un couteau pour créer le marbrage.","Cuire 40-45 minutes. Laisser refroidir avant de démouler."]',
true, 'approved', 'Le marbrage à la fourchette est l''activité préférée des enfants'),

(uid, 'Gâteau renversé à l''ananas', '', 8, 15, 40,
'["Fond caramel : 80g de beurre, 100g de cassonade","Garniture : 1 boîte d''ananas en tranches, cerises confites","Gâteau : 3 œufs, 150g de sucre, 150g de farine, 1 sachet de levure, 80ml d''huile, 80ml de jus d''ananas, 1 pincée de sel"]',
'["Préchauffer le four à 180°C. Faire fondre beurre et cassonade dans le fond d''un moule rond au four 5 minutes.","Disposer artistiquement les tranches d''ananas et les cerises sur le caramel.","Fouetter œufs et sucre. Ajouter huile et jus d''ananas.","Incorporer farine, levure et sel.","Verser délicatement la pâte sur l''ananas.","Cuire 35-40 minutes.","Retourner IMMÉDIATEMENT à la sortie du four sur un plat. Attendre 1 minute avant de retirer le moule."]',
true, 'approved', 'Retourner immédiatement à la sortie du four — le caramel se fige sinon'),

(uid, 'Moelleux aux amandes et framboises', '', 8, 15, 25,
'["200g de poudre d''amandes","150g de sucre glace","80g de beurre fondu","3 blancs d''œuf","2 c. à soupe de farine","150g de framboises fraîches ou surgelées","Sucre glace pour décorer"]',
'["Préchauffer le four à 180°C. Beurrer des moules à muffins ou un moule à gâteau.","Mélanger poudre d''amandes, sucre glace et farine.","Incorporer les blancs d''œuf non montés (juste mélangés) et le beurre fondu.","Mélanger jusqu''à pâte homogène.","Verser dans les moules. Enfoncer quelques framboises dans chaque gâteau.","Cuire 20-25 minutes jusqu''à dorure.","Laisser refroidir et saupoudrer de sucre glace."]',
true, 'approved', 'Les blancs d''œuf ne sont pas montés ici — juste mélangés comme des œufs entiers'),

(uid, 'Cake au citron glacé', '', 8, 15, 45,
'["3 œufs","200g de sucre","Zeste de 2 citrons","Jus de 1 citron","200g de farine","1 sachet de levure","100ml de crème fraîche épaisse","80g de beurre fondu","Glaçage : 150g de sucre glace, jus de 1 citron"]',
'["Préchauffer le four à 170°C. Beurrer un moule à cake.","Fouetter œufs, sucre et zeste de citron jusqu''à blanchiment.","Ajouter jus de citron, crème fraîche et beurre fondu.","Incorporer farine et levure tamisées.","Verser dans le moule. Cuire 40-45 minutes.","Laisser refroidir. Préparer le glaçage en mélangeant sucre glace et jus de citron jusqu''à consistance épaisse.","Verser le glaçage sur le cake refroidi. Laisser prendre 30 minutes."]',
true, 'approved', 'Les enfants adorent verser le glaçage — activité décorative garantie'),

(uid, 'Pain d''épices moelleux au miel', '', 10, 15, 40,
'["300g de farine","200g de miel liquide","100g de cassonade","2 œufs","100ml de lait chaud","50g de beurre","1 sachet de levure chimique","1 c. à café de cannelle","1 c. à café de gingembre","1/2 c. à café d''anis étoilé moulu","1/2 c. à café de muscade"]',
'["Préchauffer le four à 160°C. Beurrer un moule à cake.","Mélanger miel, beurre fondu et lait chaud.","Fouetter œufs et cassonade jusqu''à blanchiment.","Incorporer le mélange miel-lait aux œufs.","Ajouter farine, levure et toutes les épices. Bien mélanger.","Verser dans le moule. Cuire 35-40 minutes à feu doux.","Laisser refroidir 24h avant de déguster — le pain d''épices est meilleur le lendemain."]',
true, 'approved', 'Meilleur le lendemain — les arômes des épices se développent en reposant'),

-- ═══════════════════════════════════════════════════
-- 🍪 BISCUITS ET COOKIES
-- ═══════════════════════════════════════════════════

(uid, 'Cookies aux pépites de chocolat (recette américaine)', '', 24, 15, 12,
'["250g de farine","200g de cassonade","100g de sucre blanc","2 œufs","200g de beurre mou","1 c. à café de bicarbonate","1 c. à café de vanille","1 pincée de sel","300g de pépites de chocolat"]',
'["Ne pas préchauffer tout de suite — la pâte doit reposer.","Battre le beurre mou avec les deux sucres jusqu''à texture crémeuse.","Ajouter les œufs et la vanille. Bien mélanger.","Incorporer farine, bicarbonate et sel. Mélanger sans trop travailler.","Ajouter les pépites de chocolat.","Réfrigérer la pâte 30 minutes minimum (ou une nuit pour un meilleur résultat).","Préchauffer le four à 180°C. Former des boules de pâte espacées sur une plaque. Cuire 10-12 min (encore mous à la sortie). Laisser figer sur la plaque 5 minutes."]',
true, 'approved', 'Sortir les cookies encore mous — ils durcissent en refroidissant'),

(uid, 'Sablés décorés au sucre glace et colorants', '', 30, 20, 12,
'["250g de farine","125g de beurre froid en dés","80g de sucre glace","1 œuf","1 c. à café de vanille","1 pincée de sel","Glaçage : 200g de sucre glace, 2 c. à soupe d''eau, colorants alimentaires"]',
'["Mixer farine, beurre et sel jusqu''à sablage (texture sable fin).","Ajouter sucre glace, œuf et vanille. Pétrir rapidement sans trop travailler.","Former une boule, filmer et réfrigérer 30 minutes.","Préchauffer le four à 180°C.","Étaler la pâte sur 5mm d''épaisseur. Découper avec des emporte-pièces.","Cuire 10-12 minutes jusqu''à légère coloration des bords. Laisser refroidir.","Préparer les glaçages colorés. Décorer les sablés refroidis avec les enfants."]',
true, 'approved', 'L''activité déco est aussi importante que la cuisson — prévoir des petits bols de couleurs différentes'),

(uid, 'Shortbread écossais (3 ingrédients)', '', 20, 10, 20,
'["250g de beurre doux mou (de qualité)","125g de sucre glace","375g de farine","1 pincée de sel"]',
'["Préchauffer le four à 160°C.","Battre le beurre mou jusqu''à consistance crémeuse.","Incorporer le sucre glace tamisé.","Ajouter la farine et le sel. Mélanger jusqu''à formation d''une pâte (ne pas trop travailler).","Étaler sur 1 cm d''épaisseur. Découper en rectangles ou utiliser des emporte-pièces.","Cuire 18-20 minutes — les shortbreads doivent rester très pâles (pas dorés).","Saupoudrer de sucre en sortant du four. Laisser refroidir sur grille."]',
true, 'approved', 'Cuire très doucement — la couleur pâle est caractéristique du shortbread'),

(uid, 'Biscuits au beurre de cacahuète (sans farine)', '', 20, 10, 12,
'["250g de beurre de cacahuète lisse","150g de sucre (ou cassonade)","1 œuf","1 c. à café de vanille","1 pincée de sel","Pépites de chocolat optionnelles"]',
'["Préchauffer le four à 180°C. Couvrir une plaque de papier sulfurisé.","Mélanger beurre de cacahuète, sucre, œuf, vanille et sel dans un bol.","La pâte sera épaisse — c''est normal, pas de farine !","Former des boules de 3 cm à la main.","Les déposer sur la plaque. Aplatir avec une fourchette en quadrillage.","Cuire 10-12 minutes (ils sembleront mous — ils durcissent en refroidissant).","Laisser refroidir complètement sur la plaque avant de déplacer."]',
true, 'approved', 'Recette naturellement sans gluten — 5 minutes de préparation'),

(uid, 'Rochers à la noix de coco (congolais)', '', 20, 10, 15,
'["200g de noix de coco râpée","150g de sucre","3 blancs d''œuf","1 c. à café de vanille","1 pincée de sel","Chocolat noir pour tremper (optionnel)"]',
'["Préchauffer le four à 180°C. Couvrir une plaque de papier sulfurisé.","Mélanger noix de coco, sucre, vanille et sel dans un bol.","Incorporer les blancs d''œuf non montés. Mélanger jusqu''à pâte collante.","Former des petits rochers pointus en appuyant dans la paume de la main.","Déposer sur la plaque espacés.","Cuire 12-15 minutes jusqu''à dorure des pointes.","Optionnel : tremper la base refroidie dans le chocolat noir fondu."]',
true, 'approved', 'Façonner des pointes croustillantes — la forme conique est caractéristique'),

(uid, 'Florentins chocolat, amandes et oranges confites', '', 20, 15, 12,
'["100g de beurre","100g de sucre","2 c. à soupe de crème fraîche","100g d''amandes effilées","50g d''oranges confites hachées","50g de cerises confites","2 c. à soupe de farine","200g de chocolat noir pour enrober"]',
'["Préchauffer le four à 180°C. Chemiser une plaque de papier sulfurisé.","Faire fondre beurre, sucre et crème à feu doux jusqu''à dissolution.","Hors du feu, incorporer amandes, oranges, cerises et farine.","Déposer des petites cuillerées très espacées sur la plaque (elles s''étalent beaucoup).","Cuire 8-10 minutes jusqu''à dorure et caramélisation.","Laisser refroidir complètement. Retourner les biscuits.","Étaler le chocolat fondu sur la face lisse. Tracer des vagues avec une fourchette. Laisser figer."]',
true, 'approved', 'Bien espacer sur la plaque — les florentins s''étalent à la cuisson'),

(uid, 'Madeleines au citron et miel', '', 24, 15, 12,
'["3 œufs","150g de sucre","2 c. à soupe de miel","Zeste de 2 citrons","200g de farine","1 sachet de levure","150g de beurre fondu refroidi","1 pincée de sel"]',
'["Fouetter œufs, sucre, miel et zeste de citron jusqu''à blanchiment.","Incorporer la farine et la levure tamisées.","Ajouter le beurre fondu refroidi. Mélanger.","Filmer et réfrigérer la pâte 1h minimum (ou une nuit) — c''est le secret de la bosse.","Préchauffer le four à 220°C. Beurrer et fariner les moules à madeleine.","Remplir les alvéoles aux 3/4. Enfourner immédiatement.","Cuire 10-12 minutes. Démouler tièdes sur une grille."]',
true, 'approved', 'Le choc thermique pâte froide/four chaud est le secret de la bosse des madeleines'),

(uid, 'Nonnettes au miel et orange confite', '', 16, 15, 15,
'["250g de farine","100g de miel","80g de cassonade","100ml de lait chaud","1 sachet de levure chimique","1 c. à café de cannelle","1/2 c. à café de gingembre","Zeste d''orange","Confiture d''orange amère pour garnir","Glaçage : 150g de sucre glace, jus d''orange"]',
'["Préchauffer le four à 180°C. Beurrer des moules à muffins.","Mélanger miel, cassonade et lait chaud jusqu''à dissolution.","Incorporer farine, levure, cannelle, gingembre et zeste.","Verser un peu de pâte dans chaque moule, déposer 1 c. de confiture au centre.","Recouvrir de pâte jusqu''aux 3/4 des moules.","Cuire 12-15 minutes.","Laisser refroidir. Napper du glaçage orange."]',
true, 'approved', 'Petits gâteaux fourrés à la confiture — surprise à la dégustation'),

-- ═══════════════════════════════════════════════════
-- 🍮 DESSERTS À LA CUILLÈRE
-- ═══════════════════════════════════════════════════

(uid, 'Riz au lait à la vanille (grand format)', '', 6, 5, 35,
'["200g de riz rond à dessert","1 litre de lait entier","100ml de crème fraîche","80g de sucre","1 gousse de vanille","1 pincée de sel","Cannelle et caramel pour servir"]',
'["Fendre la gousse de vanille et gratter les graines.","Mettre riz, lait, crème, sucre, sel et gousse de vanille dans une casserole.","Porter à frémissement à feu moyen en remuant.","Cuire à feu très doux 30-35 minutes en remuant toutes les 5 minutes.","Le riz doit être tendre et la crème épaissie mais encore coulante (elle épaissit en refroidissant).","Retirer la gousse. Verser dans des ramequins ou un grand plat.","Servir tiède ou froid avec caramel ou cannelle."]',
true, 'approved', 'Remuer régulièrement pour éviter que le riz accroche au fond'),

(uid, 'Crumble pommes-cannelle (le classique enfants)', '', 6, 15, 30,
'["Garniture : 6 pommes, 2 c. à soupe de sucre, 1 c. à café de cannelle, jus de citron","Crumble : 150g de farine, 100g de beurre froid en dés, 80g de cassonade, 50g de flocons d''avoine, 1 pincée de sel"]',
'["Préchauffer le four à 190°C.","Éplucher les pommes et les couper en gros dés.","Mélanger avec sucre, cannelle et jus de citron. Verser dans un plat à gratin.","Dans un saladier, mélanger farine, cassonade, flocons d''avoine et sel.","Ajouter le beurre froid en dés. Émietter avec les doigts jusqu''à texture sableuse.","Répartir le crumble sur les pommes.","Cuire 25-30 minutes jusqu''à dorure. Servir chaud avec une boule de glace."]',
true, 'approved', 'Beurre froid obligatoire — le beurre mou donne de la pâte, pas du crumble'),

(uid, 'Mousse au caramel beurre salé', '', 6, 20, 10,
'["Caramel : 200g de sucre, 100ml de crème, 50g de beurre demi-sel","Mousse : 3 blancs d''œuf, 2 c. à soupe de sucre, 200ml de crème liquide entière"]',
'["Faire un caramel à sec : sucre dans une casserole à feu moyen sans remuer jusqu''à coloration ambrée.","Hors du feu, ajouter beurre et crème chaude en faisant attention aux projections. Remettre sur feu et mélanger.","Laisser le caramel refroidir complètement à température ambiante.","Monter la crème liquide froide en chantilly ferme. Réserver au frigo.","Monter les blancs en neige avec le sucre.","Incorporer délicatement le caramel froid, puis la chantilly et les blancs en neige.","Verser dans des verrines. Réfrigérer 2h minimum."]',
true, 'approved', 'Le caramel doit être complètement refroidi avant incorporation pour ne pas faire fondre la mousse'),

(uid, 'Tiramisu aux fraises (version sans alcool pour enfants)', '', 6, 20, 0,
'["400g de fraises fraîches","250g de mascarpone","3 œufs","80g de sucre","200ml de jus de fraise ou grenadine","1 paquet de biscuits à la cuillère","Quelques fraises pour décorer"]',
'["Séparer blancs et jaunes. Fouetter jaunes et sucre jusqu''à blanchiment.","Incorporer le mascarpone. Mélanger jusqu''à pâte lisse.","Monter les blancs en neige ferme. Les incorporer délicatement.","Couper les fraises en lamelles.","Tremper rapidement les biscuits dans le jus de fraise. Les disposer dans un plat.","Couvrir de crème mascarpone, puis de lamelles de fraises.","Alterner biscuits et crème. Finir par la crème. Décorer de fraises. Réfrigérer 4h."]',
true, 'approved', 'Version sans alcool et sans café — accessible aux enfants dès 4 ans'),

(uid, 'Îles flottantes express', '', 4, 15, 10,
'["Crème anglaise : 4 jaunes d''œuf, 50cl de lait, 80g de sucre, 1 gousse de vanille","Blancs : 4 blancs d''œuf, 80g de sucre","Caramel : 150g de sucre, 2 c. à soupe d''eau"]',
'["Préparer la crème anglaise : chauffer lait et vanille. Fouetter jaunes et sucre. Verser le lait chaud dessus en fouettant. Remettre sur feu doux jusqu''à nappe. Filtrer et refroidir.","Monter les blancs en neige. Ajouter le sucre en trois fois pour obtenir une meringue ferme.","Faire pocher les îles : déposer des quenelles de blanc dans du lait frémissant, 1 minute de chaque côté.","Égoutter sur un torchon.","Faire un caramel à sec. Le verser en filets sur les îles.","Verser la crème anglaise dans les coupes. Déposer les îles dessus.","Décorer avec le caramel juste avant de servir."]',
true, 'approved', 'Les enfants adorent façonner les quenelles de blanc — technique accessible'),

-- ═══════════════════════════════════════════════════
-- 🍬 CONFISERIES ET PETITS GÂTEAUX
-- ═══════════════════════════════════════════════════

(uid, 'Truffes au chocolat roulées au cacao', '', 30, 20, 5,
'["200g de chocolat noir de qualité","100ml de crème fraîche liquide entière","30g de beurre","1 c. à soupe de miel","Cacao amer pour rouler","Optionnel : noix de coco, vermicelles de sucre, pralin"]',
'["Chauffer la crème jusqu''à frémissement. Verser sur le chocolat haché.","Attendre 2 minutes. Mélanger jusqu''à ganache lisse.","Ajouter beurre et miel. Mélanger.","Filmer et réfrigérer 2h jusqu''à consistance malléable.","Avec une cuillère à café, prélever des noix de ganache.","Former des boules rapidement entre les paumes (la chaleur fait fondre vite).","Rouler dans le cacao, la coco ou le pralin. Réfrigérer jusqu''au service."]',
true, 'approved', 'Travailler vite — se réchauffer entre les mains est la difficulté adorée des enfants'),

(uid, 'Fudge au chocolat et caramel (2 ingrédients de base)', '', 24, 10, 5,
'["1 boîte de lait concentré sucré (397g)","300g de chocolat noir haché","50g de beurre","1 c. à café de vanille","1 pincée de sel","Noix hachées ou fleur de sel pour décorer"]',
'["Chemiser un moule carré de papier sulfurisé.","Faire fondre chocolat, beurre et lait concentré sucré ensemble à feu très doux en remuant constamment.","Ajouter vanille et sel. Mélanger jusqu''à homogénéité.","Verser dans le moule. Parsemer de noix ou fleur de sel.","Réfrigérer 2h minimum jusqu''à fermeté.","Découper en petits carrés de 3 cm.","Conserver au frigo. Sortir 15 minutes avant de déguster."]',
true, 'approved', 'Recette la plus simple du monde — même les très jeunes enfants peuvent la faire'),

(uid, 'Rice Krispies au chocolat maison (carrés croustillants)', '', 16, 10, 5,
'["200g de chocolat noir ou au lait","80g de beurre","3 c. à soupe de sirop d''érable ou miel","150g de céréales soufflées (Rice Krispies ou équivalent)","50g de chamallows (optionnel)","Pépites de couleur pour décorer"]',
'["Chemiser un moule carré de papier sulfurisé.","Faire fondre chocolat et beurre au micro-ondes ou bain-marie.","Ajouter le sirop d''érable. Mélanger.","Ajouter les céréales soufflées. Mélanger délicatement jusqu''à enrobage.","Verser dans le moule. Presser fermement avec le dos d''une cuillère.","Décorer avec les pépites de couleur.","Réfrigérer 1h. Découper en carrés. Conserver au frigo."]',
true, 'approved', 'Activité parfaite pour 3-5 ans — pas de cuisson, résultat immédiat'),

(uid, 'Barres au chocolat et beurre de cacahuète (no-bake)', '', 16, 15, 0,
'["Base : 200g de beurre de cacahuète, 150g de sucre glace, 100g de biscuits sablés émiettés, 2 c. à soupe de beurre fondu","Couverture : 200g de chocolat noir ou au lait, 1 c. à soupe d''huile de coco"]',
'["Chemiser un moule carré de papier sulfurisé.","Mélanger beurre de cacahuète, sucre glace, biscuits émiettés et beurre fondu.","Presser uniformément dans le moule. Réfrigérer 20 minutes.","Faire fondre le chocolat avec l''huile de coco.","Verser sur la base cacahuète refroidie. Lisser.","Réfrigérer 1h jusqu''à fermeté.","Découper en barres. Conserver au frigo."]',
true, 'approved', 'Aucune cuisson — recette idéale pour initier les enfants à la pâtisserie'),

(uid, 'Bugnes lyonnaises (beignets carnaval)', '', 30, 20, 20,
'["300g de farine","3 œufs","60g de beurre mou","50g de sucre","1 sachet de levure boulangère","Zeste de citron ou orange","1 c. à soupe de rhum ou fleur d''oranger","1 pincée de sel","Huile de friture","Sucre glace"]',
'["Dissoudre la levure dans 3 c. à soupe d''eau tiède.","Mélanger farine, sucre, sel et zeste. Creuser un puits.","Incorporer œufs, beurre mou et levure. Pétrir 10 minutes jusqu''à pâte souple.","Laisser lever 1h sous un torchon.","Étaler la pâte sur 3mm. Découper en losanges ou rectangles. Faire une entaille au centre.","Passer une extrémité à travers l''entaille pour former une torsade.","Faire frire à 170°C jusqu''à dorure. Égoutter. Saupoudrer généreusement de sucre glace."]',
true, 'approved', 'Fête de carnaval — les enfants adorent former les torsades'),

(uid, 'Guimauves maison à la fraise (marshmallows)', '', 30, 20, 5,
'["25g de gélatine en poudre (ou 10 feuilles)","400g de sucre","1 blanc d''œuf","2 c. à soupe de sirop de fraise ou arôme","Colorant rose optionnel","Sucre glace + maïzena pour enrober"]',
'["Réhydrater la gélatine dans 100ml d''eau froide 10 minutes.","Faire chauffer 200ml d''eau et le sucre jusqu''à 115°C (sirop).","Dissoudre la gélatine dans le sirop chaud.","Fouetter le blanc en neige. Verser le sirop gélatineux en filet tout en fouettant à vitesse max pendant 10 min.","Ajouter arôme et colorant. Fouetter encore 2 minutes.","Verser dans un moule poudré sucre glace-maïzena. Laisser figer 4h.","Découper en cubes. Rouler dans le mélange sucre glace-maïzena."]',
true, 'approved', 'Thermomètre de cuisine indispensable pour le sirop'),

-- ═══════════════════════════════════════════════════
-- 🥐 VIENNOISERIES ET PAINS SUCRÉS SIMPLES
-- ═══════════════════════════════════════════════════

(uid, 'Gaufres à la vanille (croustillantes à l''extérieur)', '', 8, 15, 20,
'["250g de farine","2 œufs","200ml de lait","100ml de crème fraîche","100g de beurre fondu","50g de sucre","1 sachet de levure chimique","1 c. à café de vanille","1 pincée de sel"]',
'["Séparer blancs et jaunes d''œuf.","Mélanger jaunes, sucre et vanille jusqu''à blanchiment.","Ajouter lait, crème et beurre fondu. Bien mélanger.","Incorporer farine, levure et sel.","Monter les blancs en neige ferme. Les incorporer délicatement en 3 fois.","Préchauffer le gaufrier bien huilé.","Cuire chaque gaufre 4-5 minutes selon le gaufrier. Servir avec sucre glace, fruits ou chantilly."]',
true, 'approved', 'Les blancs en neige séparés donnent des gaufres légères et croustillantes'),

(uid, 'Pain perdu à la cannelle et caramel', '', 4, 10, 15,
'["8 tranches de pain brioche ou pain rassis épais","3 œufs","200ml de lait","50ml de crème","3 c. à soupe de sucre","1 c. à café de cannelle","1 c. à café de vanille","Beurre pour la cuisson","Sirop d''érable ou caramel pour servir"]',
'["Fouetter œufs, lait, crème, sucre, cannelle et vanille dans un grand bol.","Tremper les tranches de pain dans l''appareil 30 secondes de chaque côté.","Faire fondre le beurre dans une grande poêle à feu moyen.","Cuire les tranches 2-3 minutes par face jusqu''à belle coloration dorée.","Procéder par fournées sans encombrer la poêle.","Garder au chaud au four à 80°C le temps de tout cuire.","Servir immédiatement avec sirop d''érable, fruits frais ou glace vanille."]',
true, 'approved', 'Utiliser du pain rassis de 2 jours — il absorbe mieux l''appareil'),

(uid, 'Brioches individuelles nature (12 pièces)', '', 12, 30, 20,
'["500g de farine T45","60g de sucre","10g de sel","20g de levure fraîche (ou 1 sachet sèche)","5 œufs","80ml de lait tiède","200g de beurre mou","1 œuf pour dorer","Pépites de chocolat ou sucre perlé optionnels"]',
'["Dissoudre la levure dans le lait tiède.","Mélanger farine, sucre et sel. Ajouter les œufs et la levure.","Pétrir 10 minutes jusqu''à pâte élastique.","Incorporer le beurre mou en plusieurs fois. Pétrir encore 10 minutes.","Laisser lever 1h30 à température ambiante. Dégazer.","Façonner en 12 boules. Déposer dans des moules à muffins. Laisser lever 45 minutes.","Dorer à l''œuf battu. Ajouter pépites ou sucre perlé. Cuire à 180°C 15-18 minutes."]',
true, 'approved', 'Incorporer le beurre progressivement — la clé d''une mie filante'),

(uid, 'Kouglof alsacien (moule en couronne)', '', 10, 20, 50,
'["500g de farine","100g de sucre","1 c. à café de sel","2 sachets de levure","200ml de lait tiède","3 œufs","150g de beurre mou","100g de raisins secs (trempés dans le rhum)","80g d''amandes entières","Sucre glace"]',
'["Tremper les raisins dans du rhum ou jus d''orange 30 minutes.","Dissoudre la levure dans le lait tiède. Mélanger avec farine, sucre, sel et œufs.","Pétrir 8 minutes. Incorporer le beurre mou progressivement. Pétrir encore 5 minutes.","Ajouter les raisins égouttés. Pétrir doucement.","Beurrer généreusement le moule à kouglof. Disposer les amandes dans les cannelures.","Remplir le moule aux 2/3. Laisser lever 1h jusqu''à bord du moule.","Cuire à 180°C pendant 45-50 minutes. Démouler tiède. Saupoudrer de sucre glace."]',
true, 'approved', 'Beurrer très généreusement le moule — les amandes dans les rainures sont la signature du kouglof'),

(uid, 'Chouquettes (petits choux au sucre perlé)', '', 40, 20, 25,
'["Pâte à choux : 125ml d''eau, 125ml de lait, 100g de beurre, 1 c. à café de sucre, 1 pincée de sel, 150g de farine, 4-5 œufs","Finition : 1 œuf pour dorer, sucre perlé généreusement"]',
'["Préchauffer le four à 200°C. Chemiser une plaque de papier sulfurisé.","Porter eau, lait, beurre, sel et sucre à ébullition.","Hors du feu, ajouter la farine en une fois. Remuer vigoureusement.","Remettre sur feu moyen et dessécher la pâte 2 minutes en remuant.","Hors du feu, incorporer les œufs un par un en mélangeant bien — la pâte doit faire un ruban.","Pocher des petits choux de 3 cm sur la plaque. Dorer à l''œuf.","Parsemer TRÈS généreusement de sucre perlé. Cuire 20-25 minutes SANS ouvrir le four."]',
true, 'approved', 'Ne jamais ouvrir le four pendant la cuisson — les choux retomberaient');

END $$;
