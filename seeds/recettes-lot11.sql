-- LOT 11 — Desserts du monde (55 recettes)

DO $$
DECLARE
  uid uuid := '97a98e5c-d29d-4a9f-9d84-0684eef75fe6'::uuid;
BEGIN

INSERT INTO recipes (user_id, title, source_url, servings, prep_time, cook_time, ingredients, steps, is_public, moderation_status, user_notes) VALUES

-- 🇫🇷 DESSERTS FRANÇAIS
(uid, 'Fondant au chocolat cœur coulant', '', 6, 15, 12,
'["200g de chocolat noir","100g de beurre","100g de sucre","3 œufs + 2 jaunes","60g de farine","Beurre et cacao pour les moules"]',
'["Préchauffer le four à 200°C.","Faire fondre le chocolat avec le beurre.","Fouetter les œufs et jaunes avec le sucre jusqu''à mélange mousseux.","Incorporer le chocolat fondu refroidi.","Ajouter la farine tamisée. Mélanger.","Beurrer et cacaoter des ramequins. Remplir aux 3/4.","Cuire 10-12 minutes. L''extérieur doit être pris mais le cœur coulant. Démouler et servir immédiatement."]',
true, 'approved', 'Gâteau chocolat au cœur liquide'),

(uid, 'Clafoutis aux cerises', '', 6, 15, 40,
'["500g de cerises fraîches (garder les noyaux pour plus de goût)","3 œufs","100g de sucre","100g de farine","300ml de lait","100ml de crème","1 c. à café de vanille","Beurre","Sucre glace"]',
'["Préchauffer le four à 180°C.","Beurrer un plat à gratin. Disposer les cerises.","Battre les œufs avec le sucre jusqu''à blanchiment.","Incorporer la farine, puis le lait et la crème progressivement.","Ajouter la vanille.","Verser l''appareil sur les cerises.","Cuire 35-40 minutes jusqu''à légère dorure. Saupoudrer de sucre glace. Servir tiède."]',
true, 'approved', 'Flan aux cerises limousin'),

(uid, 'Paris-Brest', '', 8, 45, 35,
'["Pâte à choux : 250ml eau, 100g beurre, 150g farine, 4 œufs","Crème pralinée : 500ml lait, 4 jaunes, 100g sucre, 40g maïzena, 100g pralin, 200g beurre","Amandes effilées","Sucre glace"]',
'["Pâte à choux : préparer et pocher en cercle de 20 cm. Parsemer d''amandes. Cuire 30 min à 200°C.","Prémices de crème : faire une crème pâtissière classique avec lait, jaunes, sucre, maïzena.","Incorporer le pralin dans la crème chaude.","Laisser refroidir. Travailler le beurre pommade.","Fouetter le beurre, incorporer la crème pralinée progressivement.","Couper le choux en deux. Garnir généreusement à la poche.","Refermer. Saupoudrer de sucre glace."]',
true, 'approved', 'Chou brioché à la crème pralinée'),

(uid, 'Tarte aux fraises et crème pâtissière', '', 8, 30, 20,
'["1 pâte sablée","Crème pâtissière : 500ml lait, 4 jaunes, 100g sucre, 40g maïzena, 1 gousse vanille","500g de fraises","Nappage abricot"]',
'["Cuire la pâte sablée à blanc 20 minutes à 180°C. Laisser refroidir.","Préparer la crème pâtissière : infuser la vanille dans le lait, fouetter jaunes et sucre, cuire en remuant.","Laisser refroidir en filmant au contact.","Garnir le fond de tarte de crème pâtissière.","Disposer les fraises coupées en deux ou entières sur la crème.","Faire fondre le nappage abricot. Badigeonner les fraises.","Réfrigérer 30 minutes avant de servir."]',
true, 'approved', 'Tarte aux fraises classique'),

(uid, 'Baba au rhum', '', 8, 30, 25,
'["Pâte : 250g farine, 3 œufs, 100ml lait tiède, 10g levure, 50g beurre, 1 c. à café sel, 1 c. à soupe sucre","Sirop : 300ml eau, 200g sucre, 100ml rhum brun","Chantilly et fruits pour servir"]',
'["Mélanger farine, levure, sucre, sel. Ajouter œufs et lait. Pétrir 10 minutes.","Incorporer le beurre mou. Pétrir encore 5 minutes. Laisser lever 1h.","Remplir un moule à savarin au 2/3. Laisser lever encore 30 min.","Cuire à 190°C pendant 20-25 minutes.","Préparer le sirop : faire bouillir eau et sucre. Hors du feu, ajouter le rhum.","Démouler le baba chaud. Imbiber généreusement de sirop.","Servir avec de la chantilly et des fruits frais."]',
true, 'approved', 'Gâteau imbibé de rhum classique'),

(uid, 'Charlotte aux fraises', '', 8, 30, 0,
'["200g de biscuits à la cuillère","500g de fraises","Mousse : 250g de fromage blanc, 200ml de crème entière, 60g sucre, 10g de gélatine, jus de citron","Sirop de trempage : 100ml jus de fraise + eau + sucre"]',
'["Faire tremper la gélatine dans l''eau froide.","Monter la crème en chantilly. Mélanger fromage blanc et sucre.","Faire fondre la gélatine dans un peu de jus de fraise chaud. Incorporer au fromage blanc.","Incorporer délicatement la chantilly.","Tremper les biscuits dans le sirop. Tapisser le fond et les côtés du moule.","Verser une couche de mousse, des fraises, encore de la mousse.","Recouvrir de biscuits. Réfrigérer 6 heures. Démouler et décorer."]',
true, 'approved', 'Entremets classique à la fraise'),

-- 🇮🇹 DESSERTS ITALIENS
(uid, 'Panna cotta à la vanille et coulis de fruits rouges', '', 6, 10, 10,
'["600ml de crème entière","80g de sucre","1 gousse de vanille","6g de gélatine en feuilles","Coulis : 200g de fruits rouges, 50g de sucre"]',
'["Faire tremper la gélatine dans l''eau froide.","Chauffer la crème avec le sucre et la vanille.","Essorer la gélatine. Incorporer à la crème chaude hors du feu.","Verser dans des ramequins ou verrines.","Réfrigérer au moins 4 heures.","Préparer le coulis : mixer les fruits rouges avec le sucre. Filtrer si désiré.","Démouler la panna cotta. Napper de coulis de fruits rouges."]',
true, 'approved', 'Crème cuite italienne au coulis'),

(uid, 'Tiramisu classique', '', 8, 30, 0,
'["4 œufs","100g de sucre","500g de mascarpone","300ml de café fort refroidi","200g de biscuits à la cuillère","4 c. à soupe de marsala ou rhum","Cacao en poudre non sucré"]',
'["Séparer les blancs des jaunes.","Fouetter jaunes et sucre jusqu''à mélange blanc et mousseux.","Incorporer le mascarpone.","Monter les blancs en neige ferme.","Incorporer délicatement les blancs au mascarpone.","Tremper rapidement les biscuits dans le café + alcool. Disposer une couche.","Verser la crème. Répéter. Saupoudrer de cacao. Réfrigérer 6h."]',
true, 'approved', 'Tiramisu traditionnel au mascarpone'),

(uid, 'Cannoli siciliens', '', 12, 30, 20,
'["Pâte : 200g farine, 30g sucre, 30g beurre, 1 œuf, 50ml marsala, 1 pincée sel","Garniture : 500g ricotta, 150g sucre glace, 100g pépites de chocolat, zeste orange","Huile de friture","Pistaches hachées"]',
'["Pétrir la pâte. Laisser reposer 30 minutes au frigo.","Étaler finement. Découper des cercles de 10 cm.","Enrouler autour des tubes à cannoli. Sceller le bord avec de l''œuf.","Faire frire à 180°C 3-4 minutes. Laisser refroidir. Retirer délicatement des tubes.","Mélanger ricotta, sucre glace, pépites de chocolat et zeste d''orange.","Remplir les cannoli à la poche à douille.","Garnir les extrémités de pistaches hachées. Servir immédiatement."]',
true, 'approved', 'Pâtisserie sicilienne fourrée à la ricotta'),

(uid, 'Affogato al caffè', '', 4, 5, 0,
'["4 boules de glace à la vanille","4 expressos bien chauds","Amaretti (facultatif)","Liqueur d''amande ou Bailey''s (facultatif)"]',
'["Préparer 4 expressos très chauds et concentrés.","Mettre 1 ou 2 boules de glace dans chaque tasse.","Verser immédiatement l''espresso chaud sur la glace.","Servir sans attendre — le contraste chaud-froid est essentiel.","Décorer d''un amaretti écrasé si désiré.","Ajouter un peu de liqueur d''amande pour une version adulte.","Déguster immédiatement avant que la glace ne fonde complètement."]',
true, 'approved', 'Glace noyée dans l''espresso'),

-- 🌍 DESSERTS DU MONDE
(uid, 'Cheesecake américain classique', '', 10, 30, 60,
'["Base : 200g de biscuits graham (ou speculoos), 80g de beurre fondu","Garniture : 800g de fromage frais, 200g de sucre, 4 œufs, 200ml de crème, vanille","Coulis fraise ou caramel pour servir"]',
'["Préchauffer le four à 160°C.","Mixer les biscuits avec le beurre. Tasser dans un moule à charnière. Réfrigérer.","Battre le fromage frais avec le sucre jusqu''à lisse.","Incorporer les œufs un à un. Ajouter la crème et la vanille.","Verser sur la base biscuitée.","Cuire au bain-marie 55-60 minutes. Le centre doit trembler légèrement.","Laisser refroidir dans le four éteint ouvert. Réfrigérer 4 heures."]',
true, 'approved', 'Gâteau au fromage new-yorkais'),

(uid, 'Baklava aux pistaches', '', 20, 30, 35,
'["500g de pâte filo","300g de pistaches non salées","200g de noix","100g d''amandes","200g de beurre fondu","Sirop : 300g de sucre, 200ml d''eau, jus de citron, eau de rose ou de fleur d''oranger"]',
'["Hacher grossièrement les pistaches, noix et amandes.","Préchauffer le four à 180°C.","Beurrer un grand plat. Déposer 10 feuilles de filo en les badigeonnant de beurre entre chaque.","Répartir une couche de fruits secs.","Alterner feuilles de filo beurrées et fruits secs (3-4 couches).","Terminer par 10 feuilles de filo. Inciser en losanges avant cuisson.","Cuire 35 minutes. Préparer le sirop. Verser immédiatement sur le baklava chaud."]',
true, 'approved', 'Pâtisserie orientale aux fruits secs'),

(uid, 'Gulab jamun indien', '', 20, 20, 20,
'["200g de lait en poudre","50g de farine","1/4 c. à café de levure","50ml de lait entier","1 c. à soupe de beurre mou","Huile de friture","Sirop : 400g de sucre, 400ml d''eau, 2 c. à soupe d''eau de rose, cardamome"]',
'["Mélanger lait en poudre, farine et levure.","Incorporer le beurre et le lait progressivement. Former une pâte molle.","Laisser reposer 10 minutes.","Préparer le sirop : bouillir sucre et eau 5 minutes. Ajouter eau de rose et cardamome.","Rouler la pâte en petites boules lisses (taille noix).","Faire frire à 140°C (feu doux) jusqu''à brun doré (attention : feu doux, sinon crème à l''intérieur).","Plonger immédiatement dans le sirop chaud. Laisser tremper 30 minutes."]',
true, 'approved', 'Boulettes sucrées indiennes au sirop'),

(uid, 'Tres leches mexicain', '', 12, 20, 30,
'["Génoise : 6 œufs, 200g sucre, 200g farine, levure","Sirop : 250ml lait entier, 250ml lait concentré sucré, 250ml lait de coco ou crème","Garniture : 500ml crème entière, 4 c. sucre glace, cannelle"]',
'["Préparer une génoise classique. Cuire à 180°C 25 minutes.","Démouler tiède dans un plat creux à bords hauts.","Piquer généreusement le gâteau avec une fourchette.","Mélanger les trois laits. Verser très lentement sur le gâteau.","Laisser absorber au moins 2 heures au frigo.","Fouetter la crème avec le sucre glace en chantilly ferme.","Couvrir entièrement de chantilly. Saupoudrer de cannelle."]',
true, 'approved', 'Gâteau mexicain aux trois laits'),

(uid, 'Cinnamon rolls américains', '', 12, 40, 25,
'["Pâte : 500g farine, 1 sachet levure, 300ml lait tiède, 80g beurre, 1 œuf, 60g sucre, sel","Garniture : 100g beurre mou, 150g sucre brun, 3 c. à soupe cannelle","Glaçage : 200g fromage frais, 100g sucre glace, lait"]',
'["Préparer la pâte briochée. Laisser lever 1h.","Étaler en rectangle 40x30 cm.","Badigeonner de beurre mou. Parsemer de sucre brun et cannelle.","Rouler serré en boudin. Couper en 12 tranches.","Disposer dans un plat beurré. Laisser lever 30 minutes.","Cuire à 180°C pendant 22-25 minutes jusqu''à dorure.","Préparer le glaçage et napper les rolls encore chauds."]',
true, 'approved', 'Escargots à la cannelle américains'),

(uid, 'Churros au chocolat mexicain (version sucrée)', '', 4, 15, 15,
'["250ml eau","250g farine","1 c. à soupe sucre","1 c. à café sel","Huile de friture","Sucre + cannelle pour enrober","Chocolat chaud : 200g chocolat noir, 250ml lait, 1 c. à soupe sucre, 1/2 c. à café cannelle"]',
'["Bouillir eau, sucre et sel.","Verser farine d''un coup. Mélanger hors du feu jusqu''à pâte qui se décolle.","Mettre dans poche à douille étoilée.","Pocher des bâtons de 15 cm dans l''huile à 180°C.","Dorer 3-4 minutes en retournant.","Rouler immédiatement dans le sucre à la cannelle.","Chocolate chaud : chauffer lait, sucre et cannelle. Faire fondre le chocolat. Servir en trempette."]',
true, 'approved', 'Beignets espagnols sucrés à la cannelle'),

(uid, 'Käsekuchen allemand (tarte au fromage blanc)', '', 10, 20, 60,
'["Base : 200g farine, 100g beurre, 60g sucre, 1 œuf","Garniture : 750g de fromage blanc (Quark), 3 œufs, 150g sucre, 100ml crème, 40g maïzena, zeste citron, vanille"]',
'["Préparer la pâte sablée. Foncer un grand moule. Réfrigérer.","Préchauffer le four à 175°C.","Séparer les blancs des jaunes.","Mélanger fromage blanc, jaunes, sucre, crème, maïzena, zeste et vanille.","Monter les blancs en neige ferme. Incorporer délicatement.","Verser sur la pâte.","Cuire 55-60 minutes. L''intérieur doit être légèrement tremblant. Laisser refroidir dans le four éteint."]',
true, 'approved', 'Tarte allemande au fromage blanc'),

(uid, 'Milk tart sud-africain (Melktert)', '', 8, 20, 30,
'["Base : 200g biscuits digestives écrasés, 80g beurre fondu","Garniture : 1 litre de lait, 3 œufs, 100g sucre, 40g maïzena, 20g beurre, vanille","Cannelle pour saupoudrer"]',
'["Mélanger biscuits écrasés et beurre. Tasser dans un moule.","Faire chauffer 800ml de lait avec la vanille.","Mélanger jaunes, sucre et maïzena. Délayer avec 200ml de lait froid.","Verser le lait chaud progressivement en fouettant.","Cuire à feu doux en remuant jusqu''à épaississement.","Hors du feu, incorporer le beurre.","Verser sur la base. Saupoudrer de cannelle. Réfrigérer 3h."]',
true, 'approved', 'Tarte au lait sud-africaine'),

(uid, 'Koeksisters (gâteaux tressés d''Afrique du Sud)', '', 15, 30, 20,
'["Pâte : 400g farine, 2 c. à café levure, 50g beurre, 1 œuf, 150ml lait","Sirop : 1 kg sucre, 500ml eau, 2 c. à café gingembre, 1 c. à café cannelle, zeste citron"]',
'["Préparer la pâte. Laisser lever 1h.","Préparer le sirop la veille. Réfrigérer.","Étaler la pâte en rectangle. Découper en bandes de 10x3 cm.","Couper chaque bande en 3 bandes fines sans détacher à une extrémité.","Tresser et souder l''extrémité.","Faire frire à 180°C jusqu''à dorure.","Plonger immédiatement dans le sirop froid. Les koeksisters doivent être bien imbibés."]',
true, 'approved', 'Beignets tressés imbibés de sirop'),

(uid, 'Banana bread américain', '', 8, 15, 55,
'["3 bananes très mûres","200g de farine","150g de sucre brun","1 œuf","80ml d''huile","1 c. à café de levure","1 c. à café de bicarbonate","1 c. à café de cannelle","100g de pépites de chocolat (facultatif)"]',
'["Préchauffer le four à 175°C. Beurrer un moule à cake.","Écraser les bananes à la fourchette.","Mélanger bananes, œuf, huile et sucre.","Incorporer farine, levure, bicarbonate et cannelle.","Ajouter les pépites de chocolat si désiré.","Verser dans le moule.","Cuire 50-55 minutes. Une pique doit ressortir propre. Laisser refroidir avant de trancher."]',
true, 'approved', 'Cake à la banane américain'),

(uid, 'Bavarois à la framboise', '', 8, 30, 0,
'["Génoise : 3 œufs, 90g sucre, 90g farine","Mousse : 400g framboises, 200g sucre, 300ml crème, 10g gélatine","Miroir : 200g framboises, 80g sucre, 5g gélatine"]',
'["Préparer la génoise. Cuire 15 min à 180°C. Laisser refroidir.","Mixer framboises et sucre. Filtrer. Chauffer la moitié. Y dissoudre la gélatine trempée.","Incorporer au reste de coulis.","Monter la crème en chantilly. Incorporer au coulis refroidi.","Disposer la génoise au fond du moule. Verser la mousse. Réfrigérer 3h.","Préparer le miroir : coulis + gélatine. Verser sur la mousse prise.","Réfrigérer encore 2h. Démouler délicatement."]',
true, 'approved', 'Entremets classique à la framboise'),

(uid, 'Speculoos belges', '', 30, 20, 15,
'["350g de farine","200g de cassonade","150g de beurre mou","1 œuf","1 c. à café de levure","2 c. à café de mélange épices speculoos (cannelle, girofle, muscade, cardamome, anis)","1 c. à café de sel"]',
'["Crémer le beurre avec la cassonade.","Incorporer l''œuf.","Ajouter la farine tamisée avec la levure, les épices et le sel.","Pétrir jusqu''à pâte homogène. Envelopper. Réfrigérer 1h.","Préchauffer le four à 170°C.","Étaler finement (3mm). Découper des formes.","Cuire 12-15 minutes jusqu''à légère dorure. Les biscuits durcissent en refroidissant."]',
true, 'approved', 'Biscuits épicés belges classiques'),

(uid, 'Gâteau basque à la cerise', '', 8, 30, 40,
'["Pâte : 300g farine, 150g sucre, 150g beurre, 2 œufs, 1 sachet levure, sel, vanille","Garniture : confiture de cerises noires du Pays basque (ou crème pâtissière)"]',
'["Préparer la pâte : sabler farine, sucre, beurre. Incorporer les œufs.","Diviser en deux. Réfrigérer 30 minutes.","Préchauffer le four à 175°C.","Étaler une première moitié dans un moule beurré.","Garnir généreusement de confiture de cerises.","Couvrir de la seconde moitié de pâte. Sceller les bords.","Dorer à l''œuf. Striller à la fourchette. Cuire 35-40 minutes."]',
true, 'approved', 'Gâteau basque traditionnel'),

(uid, 'Mousse au chocolat classique', '', 6, 20, 0,
'["200g de chocolat noir","4 œufs","50g de sucre","20g de beurre","1 pincée de sel"]',
'["Faire fondre le chocolat avec le beurre au bain-marie.","Séparer les blancs des jaunes.","Mélanger les jaunes avec le chocolat fondu et le sucre.","Monter les blancs en neige ferme avec le sel.","Incorporer 1/4 des blancs au chocolat pour alléger.","Incorporer délicatement le reste des blancs en soulevant.","Verser dans des ramequins. Réfrigérer au moins 3h."]',
true, 'approved', 'Mousse au chocolat aérienne classique'),

(uid, 'Tarte au sucre (Belgique)', '', 8, 20, 25,
'["Pâte levée : 250g farine, 10g levure, 100ml lait tiède, 1 œuf, 50g beurre, 1 c. sucre, sel","Garniture : 100g cassonade, 100ml crème fraîche épaisse, 1 œuf, cannelle"]',
'["Préparer la pâte levée. Laisser lever 1h.","Préchauffer le four à 200°C.","Étaler la pâte dans un moule à tarte. Laisser lever encore 15 minutes.","Mélanger la cassonade, la crème et l''œuf.","Faire des petits trous dans la pâte avec les doigts.","Verser l''appareil sucré sur la tarte.","Saupoudrer de cannelle. Cuire 20-25 minutes jusqu''à caramélisation."]',
true, 'approved', 'Tarte belge à la crème et cassonade'),

(uid, 'Kouign-amann breton', '', 8, 30, 40,
'["500g de farine","1 sachet de levure","300ml d''eau tiède","200g de beurre demi-sel","200g de sucre","Sel"]',
'["Préparer une pâte à pain : farine, levure, sel, eau. Pétrir. Lever 1h.","Étaler la pâte en rectangle.","Disposer le beurre en lamelles au centre. Plier et étaler 3 fois (comme une pâte feuilletée).","Saupoudrer de sucre entre les plis.","Façonner en boule. Mettre dans un moule beurré et sucré.","Saupoudrer de sucre sur le dessus.","Cuire à 220°C pendant 35-40 minutes. Le sucre caramélise."]',
true, 'approved', 'Gâteau breton caramélisé au beurre'),

(uid, 'Gâteau de riz au caramel', '', 6, 15, 50,
'["200g de riz rond","1 litre de lait entier","150g de sucre","3 œufs","1 gousse de vanille","Zeste de citron","Caramel : 150g sucre, 50ml eau"]',
'["Préparer le caramel. Verser dans un moule.","Cuire le riz dans le lait avec la vanille 30 minutes. Laisser tiédir.","Mélanger œufs et sucre. Incorporer au riz.","Ajouter le zeste de citron.","Verser sur le caramel dans le moule.","Cuire au bain-marie au four à 170°C pendant 40 minutes.","Laisser refroidir. Réfrigérer. Démouler et servir."]',
true, 'approved', 'Riz au lait renversé au caramel'),

(uid, 'Délice à la noix de coco (lamington australien)', '', 12, 20, 20,
'["Génoise : 4 œufs, 150g sucre, 150g farine, 30g beurre fondu, levure","Nappage : 200g chocolat noir, 200ml crème, 200g noix de coco râpée"]',
'["Préparer et cuire la génoise à 180°C 18-20 minutes.","Laisser refroidir complètement. Couper en cubes de 5 cm.","Faire chauffer la crème. Verser sur le chocolat haché. Mélanger.","Laisser refroidir le glaçage jusqu''à consistance nappante.","Tremper chaque cube de génoise dans le glaçage chocolat.","Rouler immédiatement dans la noix de coco râpée.","Disposer sur une grille. Laisser prendre 1h."]',
true, 'approved', 'Gâteau australien chocolat-coco'),

(uid, 'Crème caramel à la vanille', '', 6, 15, 45,
'["Caramel : 150g sucre, 50ml eau","Flan : 4 œufs + 2 jaunes, 80g sucre, 500ml lait, 200ml crème, 1 gousse vanille"]',
'["Préparer le caramel. Verser dans 6 ramequins.","Faire infuser la vanille dans le mélange lait-crème chaud.","Fouetter œufs entiers, jaunes et sucre.","Verser le lait vanillé chaud progressivement en fouettant.","Filtrer et répartir dans les ramequins caramélisés.","Cuire au bain-marie au four à 150°C pendant 40-45 minutes.","Laisser refroidir. Réfrigérer 2h. Démouler sur assiette."]',
true, 'approved', 'Flan renversé au caramel classique'),

(uid, 'Tarte au citron basque', '', 8, 20, 35,
'["Pâte sablée : 250g farine, 125g beurre, 80g sucre, 1 œuf, sel","Crème citron : 4 citrons, 4 œufs, 150g sucre, 100g beurre, 2 c. maïzena"]',
'["Préparer la pâte sablée. Foncer un moule. Cuire à blanc 15 minutes à 175°C.","Préparer la crème : faire chauffer jus de citron et sucre.","Incorporer les œufs battus et la maïzena. Cuire en remuant jusqu''à épaississement.","Hors du feu, incorporer le beurre en dés.","Verser la crème citron chaude sur la pâte précuite.","Laisser refroidir à température ambiante puis au frigo.","Décorer de zeste de citron et de sucre glace."]',
true, 'approved', 'Tarte rustique au citron'),

(uid, 'Dacquoise aux noisettes', '', 8, 30, 20,
'["Dacquoise : 5 blancs d''œufs, 150g sucre, 100g poudre de noisettes, 50g sucre glace, 30g farine","Crème praliné : 4 jaunes, 100g sucre, 250ml lait, 200g beurre, 100g pâte de noisette"]',
'["Mélanger poudre de noisettes, sucre glace et farine.","Monter les blancs avec le sucre. Incorporer délicatement le mélange sec.","Pocher 2 disques de 20 cm sur papier sulfurisé.","Cuire à 170°C pendant 18-20 minutes.","Préparer la crème : faire une crème pâtissière avec jaunes, sucre et lait.","Incorporer le beurre pommade et la pâte de noisette.","Monter le gâteau en alternant dacquoise et crème."]',
true, 'approved', 'Entremet aux noisettes et praliné'),

(uid, 'Éclair au café', '', 10, 30, 25,
'["Pâte à choux : 125ml eau, 50g beurre, 75g farine, 2 œufs","Crème pâtissière café : 500ml lait, 4 jaunes, 100g sucre, 40g maïzena, 2 espressos","Glaçage fondant café ou glaçage chocolat"]',
'["Préparer la pâte à choux. Pocher des bâtons de 12 cm.","Cuire à 200°C 25 minutes sans ouvrir le four.","Préparer la crème pâtissière en ajoutant les espressos au lait. Laisser refroidir.","Garnir les éclairs à la poche (faire un trou dessous ou couper en deux).","Préparer le glaçage fondant café en mélangeant fondant et café fort.","Tremper le dessus des éclairs dans le glaçage.","Laisser prendre au frigo 30 minutes."]',
true, 'approved', 'Éclairs dorés fourrés à la crème café');

END $$;
