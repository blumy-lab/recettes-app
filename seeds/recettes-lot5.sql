-- LOT 5 — Fêtes religieuses et traditions culinaires (50 recettes)

DO $$
DECLARE
  uid uuid := '97a98e5c-d29d-4a9f-9d84-0684eef75fe6'::uuid;
BEGIN

-- ═══════════════════════════════════════════════════
-- 🎄 NOËL (France, Europe, Réunion)
-- ═══════════════════════════════════════════════════

INSERT INTO recipes (user_id, title, source_url, servings, prep_time, cook_time, ingredients, steps, is_public, moderation_status, user_notes) VALUES

(uid, 'Bûche de Noël au chocolat', '', 8, 45, 15,
'["4 œufs","100g de sucre","80g de farine","20g de cacao","Pour la crème : 200ml de crème entière, 150g de chocolat noir","Décors : copeaux de chocolat, sucre glace"]',
'["Battre les jaunes avec le sucre jusqu''à blanchiment. Incorporer farine et cacao tamisés.","Monter les blancs en neige ferme, incorporer délicatement.","Étaler sur une plaque recouverte de papier sulfurisé. Cuire 10 min à 180°C.","Rouler le biscuit chaud dans un linge humide. Laisser refroidir roulé.","Faire fondre le chocolat dans la crème chaude (ganache). Réfrigérer jusqu''à épaississement.","Dérouler le biscuit, étaler la ganache, rouler à nouveau fermement.","Couvrir de ganache, strier à la fourchette. Décorer de copeaux et sucre glace."]',
true, 'approved', 'Dessert de Noël traditionnel français'),

(uid, 'Foie gras maison mi-cuit', '', 8, 30, 30,
'["1 lobe de foie gras de canard (500g)","1 c. à café de sel fin","1 pincée de poivre blanc","1 pincée de sucre","2 c. à soupe de cognac ou Sauternes","Pain de campagne grillé et confiture de figue pour servir"]',
'["Sortir le foie gras 1 heure avant. Séparer les lobes délicatement.","Retirer les veines en suivant leur trajet sans abîmer le foie.","Assaisonner de sel, poivre, sucre et alcool. Filmer et mariner 2 heures.","Reconstituer le foie dans une terrine. Tasser fermement.","Cuire au bain-marie au four à 100°C pendant 25-30 minutes.","Laisser refroidir, puis réfrigérer avec un poids dessus 24 heures.","Servir tranché avec du pain de campagne grillé et de la confiture de figue."]',
true, 'approved', 'Entrée de Noël luxueuse'),

(uid, 'Dinde rôtie aux marrons', '', 8, 30, 180,
'["1 dinde de 4 kg","300g de marrons cuits","200g de chair à saucisse","1 oignon","3 gousses d''ail","Thym, persil","100g de beurre","Sel, poivre","50ml de cognac"]',
'["Préparer la farce : faire revenir l''oignon, mélanger avec la chair à saucisse, les marrons écrasés, le persil, le cognac.","Saler et poivrer l''intérieur de la dinde. Farcir.","Badigeonner la dinde de beurre ramolli assaisonné.","Ficeler la dinde. Préchauffer le four à 180°C.","Cuire 3 heures en arrosant toutes les 30 minutes.","La dinde est cuite quand le jus qui s''écoule est clair.","Laisser reposer 20 minutes sous aluminium avant de découper."]',
true, 'approved', 'Dinde de Noël farcie'),

(uid, 'Saumon gravlax', '', 8, 20, 0,
'["1 filet de saumon (600g) avec peau","3 c. à soupe de gros sel","2 c. à soupe de sucre","1 c. à café de poivre concassé","Aneth frais abondant","Sauce : moutarde à l''ancienne, miel, aneth, vinaigre"]',
'["Mélanger le sel, le sucre et le poivre.","Couvrir le saumon d''une épaisse couche d''aneth frais.","Enduire le tout du mélange sel-sucre.","Emballer hermétiquement dans du film alimentaire.","Réfrigérer sous un poids pendant 48 heures en retournant toutes les 12h.","Rincer, sécher et trancher finement en biais.","Servir avec la sauce aneth-moutarde et du pain noir."]',
true, 'approved', 'Saumon mariné nordique de Noël'),

(uid, 'Vin chaud de Noël', '', 8, 5, 20,
'["1 bouteille de vin rouge","150g de sucre","2 bâtons de cannelle","5 clous de girofle","3 étoiles de badiane","Zeste d''une orange","Zeste d''un citron","200ml de jus d''orange"]',
'["Verser le vin et le jus d''orange dans une casserole.","Ajouter le sucre et les épices.","Ajouter les zestes d''orange et de citron.","Chauffer à feu doux sans jamais bouillir (max 70°C pour conserver l''alcool).","Laisser infuser 15 minutes à feu très doux.","Filtrer les épices.","Servir dans des mugs, décoré d''un bâton de cannelle."]',
true, 'approved', 'Boisson chaude des marchés de Noël'),

(uid, 'Gâteau de Noël réunionnais (gâteau napolitain)', '', 10, 40, 50,
'["500g de farine","200g de sucre","4 œufs","200g de beurre","1 sachet de levure","1 c. à café de vanille","Colorants alimentaires (rouge, vert, jaune)","Confiture pour garnir les couches"]',
'["Préparer la pâte de base : mélanger beurre, sucre, œufs, farine, levure et vanille.","Diviser en 3 ou 4 portions. Colorer chaque portion différemment.","Cuire chaque couche séparément dans un moule à 180°C, 15 minutes.","Laisser refroidir. Assembler les couches avec de la confiture.","Appuyer fermement. Réfrigérer 1 heure.","Couvrir de glaçage blanc ou de fondant.","Décorer avec des billes de sucre colorées."]',
true, 'approved', 'Gâteau coloré de Noël réunionnais'),

(uid, 'Marrons glacés maison', '', 6, 30, 60,
'["500g de marrons","500g de sucre","500ml d''eau","1 gousse de vanille","1 c. à soupe de rhum"]',
'["Inciser les marrons, les cuire 20 minutes à l''eau bouillante. Éplucher les deux peaux soigneusement.","Faire un sirop : eau, sucre, vanille. Porter à ébullition.","Plonger les marrons dans le sirop, cuire 5 minutes.","Laisser mariner 24h dans le sirop.","Répéter l''opération 3 fois sur 3 jours en ajoutant du sucre.","Le dernier jour, ajouter le rhum au sirop.","Égoutter sur une grille et laisser sécher."]',
true, 'approved', 'Confiserie de Noël au marron'),

-- ═══════════════════════════════════════════════════
-- 🐣 PÂQUES
-- ═══════════════════════════════════════════════════

(uid, 'Agneau pascal rôti au four', '', 6, 20, 90,
'["1 gigot d''agneau (2 kg)","6 gousses d''ail","Romarin frais","Thym frais","4 c. à soupe d''huile d''olive","Jus d''un citron","Sel, poivre","500ml de bouillon d''agneau ou de légumes"]',
'["Faire des incisions dans le gigot, y insérer des gousses d''ail et du romarin.","Mélanger huile, jus de citron, thym, sel et poivre. Badigeonner le gigot.","Laisser mariner 2 heures à température ambiante.","Préchauffer le four à 220°C.","Saisir le gigot 15 minutes à 220°C, puis réduire à 180°C.","Ajouter le bouillon dans le plat, arroser toutes les 20 minutes.","Cuire 45-60 minutes selon la cuisson désirée. Laisser reposer 15 min."]',
true, 'approved', 'Gigot d''agneau de Pâques'),

(uid, 'Œufs en chocolat fourrés', '', 6, 60, 0,
'["300g de chocolat noir ou au lait","Pour la ganache : 100ml de crème, 150g de chocolat, arômes (praliné, vanille, café)"]',
'["Tempérer le chocolat : faire fondre au bain-marie à 50°C, refroidir à 27°C, réchauffer à 31°C.","Remplir les moules à œufs de chocolat tempéré. Vider l''excès. Laisser cristalliser.","Répéter 2-3 fois pour avoir une coque solide.","Préparer la ganache : faire bouillir la crème, verser sur le chocolat, mélanger.","Aromatiser selon goût. Laisser refroidir jusqu''à texture crémeuse.","Garnir la moitié des coques de ganache.","Assembler les deux moitiés avec un peu de chocolat fondu."]',
true, 'approved', 'Œufs de Pâques en chocolat maison'),

(uid, 'Simnel cake (gâteau de Pâques anglais)', '', 8, 30, 90,
'["200g de fruits secs mélangés","200g de beurre","200g de sucre","4 œufs","200g de farine","1 c. à café de quatre-épices","500g de pâte d''amandes","Confiture d''abricot","11 boules de pâte d''amandes (les 11 apôtres)"]',
'["Crémer le beurre et le sucre. Ajouter les œufs un à un.","Incorporer la farine, les épices et les fruits secs.","Abaisser la moitié de la pâte d''amandes en disque.","Verser la moitié de la pâte à gâteau, poser le disque d''amandes, verser le reste.","Cuire à 160°C pendant 1h30.","Couvrir de confiture d''abricot chauffée.","Poser le second disque de pâte d''amandes, former 11 boules. Dorer au grill."]',
true, 'approved', 'Gâteau de Pâques britannique'),

(uid, 'Tsoureki (brioche grecque de Pâques)', '', 8, 40, 30,
'["500g de farine","150g de sucre","1 sachet de levure","3 œufs","150ml de lait tiède","100g de beurre","Mahlab (épice cerise)","Mastic","Zeste d''orange","Œufs durs rouges pour décorer"]',
'["Dissoudre la levure dans le lait tiède avec une pincée de sucre.","Mélanger farine, sucre, mahlab, mastic et zeste.","Incorporer les œufs battus, le lait avec la levure et le beurre ramolli.","Pétrir 15 minutes jusqu''à pâte lisse. Lever 2 heures.","Diviser en 3 boudins, tresser.","Insérer les œufs durs rouges dans la tresse.","Dorer à l''œuf, cuire 25-30 minutes à 180°C."]',
true, 'approved', 'Brioche tressée grecque de Pâques'),

-- ═══════════════════════════════════════════════════
-- 🕌 RAMADAN & AÏD EL-FITR
-- ═══════════════════════════════════════════════════

(uid, 'Chorba frik (soupe du Ramadan)', '', 6, 20, 40,
'["200g de frik (blé vert concassé)","300g d''agneau en petits morceaux","2 tomates","1 oignon","3 gousses d''ail","1 c. à café de ras-el-hanout","1 c. à café de curcuma","1 botte de coriandre","1 botte de persil","Jus de citron","Sel, poivre"]',
'["Faire revenir l''oignon et l''agneau dans un peu d''huile.","Ajouter les épices, l''ail et les tomates concassées.","Verser 1,5 litre d''eau. Porter à ébullition.","Rincer le frik et l''ajouter. Saler.","Cuire 30 minutes jusqu''à ce que le frik soit cuit.","Ajouter coriandre et persil hachés en fin de cuisson.","Servir avec du jus de citron. Dégustée pour rompre le jeûne."]',
true, 'approved', 'Soupe traditionnelle de l''Iftar'),

(uid, 'Chebakia (gâteaux du Ramadan)', '', 20, 60, 20,
'["500g de farine","100g de sésame grillé","1 c. à café d''anis en poudre","1 c. à café de cannelle","1 c. à café de safran","2 c. à soupe de vinaigre","Eau de fleur d''oranger","Beurre fondu","Miel pour tremper"]',
'["Mélanger la farine, le sésame, les épices et le safran.","Incorporer le beurre fondu, le vinaigre et l''eau de fleur d''oranger pour obtenir une pâte ferme.","Laisser reposer 30 minutes.","Étaler finement, couper en rectangles. Faire des entailles et former en fleur ou nœud.","Faire frire dans l''huile jusqu''à doré.","Plonger immédiatement dans du miel chaud parfumé à l''eau de rose.","Rouler dans le sésame grillé."]',
true, 'approved', 'Gâteaux frits marocains du Ramadan'),

(uid, 'Dattes farcies aux amandes (Iftar)', '', 20, 20, 0,
'["20 grandes dattes Medjool","100g de pâte d''amandes","Pistaches concassées","Noix de coco râpée","Cacao en poudre"]',
'["Dénoyauter les dattes délicatement en faisant une incision.","Diviser la pâte d''amandes en 20 petits cylindres.","Insérer un cylindre de pâte d''amandes dans chaque datte.","Refermer légèrement.","Décorer certaines dattes de pistaches concassées.","D''autres de noix de coco râpée.","D''autres encore roulées dans le cacao."]',
true, 'approved', 'Friandises pour rompre le jeûne'),

(uid, 'Briouates au miel (Aïd el-Fitr)', '', 12, 45, 15,
'["250g d''amandes émondées grillées","100g de sucre glace","1 c. à café de cannelle","Eau de fleur d''oranger","Feuilles de brick","Beurre fondu","Miel et sésame pour finition"]',
'["Mixer les amandes avec le sucre glace et la cannelle.","Ajouter l''eau de fleur d''oranger pour obtenir une pâte malléable.","Couper les feuilles de brick en bandes.","Former des petits rouleaux ou triangles avec la farce d''amandes.","Sceller avec du beurre fondu.","Faire frire dans l''huile jusqu''à dorure.","Tremper dans le miel chaud et rouler dans le sésame grillé."]',
true, 'approved', 'Pâtisseries de l''Aïd'),

(uid, 'Méchoui de l''Aïd el-Adha', '', 10, 30, 240,
'["1 agneau entier ou demi-agneau","100g de beurre","4 gousses d''ail","1 c. à café de cumin","1 c. à café de paprika","Sel","Menthe fraîche et pain pour servir"]',
'["Préparer le beurre épicé : mélanger beurre ramolli, ail écrasé, cumin, paprika et sel.","Faire des incisions profondes dans l''agneau. Y insérer le beurre épicé.","Enduire toute la surface.","Cuire sur broche ou dans un four très chaud (200°C) pendant 4 heures.","Arroser régulièrement du jus de cuisson.","La viande doit se détacher des os facilement.","Servir avec du pain, de la menthe et du cumin pour tremper."]',
true, 'approved', 'Agneau rôti de l''Aïd el-Adha'),

(uid, 'Kaab el ghzal (cornes de gazelle)', '', 20, 60, 15,
'["Pâte : 250g de farine, 50g de beurre, eau de fleur d''oranger","Farce : 200g d''amandes, 100g de sucre, cannelle, eau de fleur d''oranger","Sucre glace pour finition"]',
'["Préparer la farce : mixer amandes, sucre, cannelle et eau de fleur d''oranger. Former des petits boudins.","Préparer la pâte : mélanger farine, beurre et eau de fleur d''oranger. Reposer 30 min.","Étaler la pâte finement. Couper en rectangles.","Poser un boudin de farce sur chaque rectangle. Refermer et sceller.","Former en croissant (la corne de gazelle).","Cuire au four à 180°C pendant 15 minutes (doit rester pâle).","Rouler dans le sucre glace ou tremper dans du miel."]',
true, 'approved', 'Pâtisserie marocaine de l''Aïd'),

-- ═══════════════════════════════════════════════════
-- ✡️ PESSAH (PÂQUE JUIVE) & HANOUKKA
-- ═══════════════════════════════════════════════════

(uid, 'Matzo ball soup (soupe Pessah)', '', 6, 30, 60,
'["Pour les matzo balls : 200g de farine de matzo, 4 œufs, 4 c. à soupe d''huile, sel, poivre, persil","Pour le bouillon : 1 poule, 3 carottes, 2 oignons, céleri, aneth, sel"]',
'["Préparer le bouillon : cuire la poule avec les légumes 2 heures. Filtrer.","Mélanger la farine de matzo avec les œufs battus, l''huile, le sel et le persil.","Réfrigérer la pâte 1 heure (essentiel pour la texture).","Former des boules de la taille d''une noix avec les mains humides.","Cuire les matzo balls dans le bouillon frémissant 30 minutes.","Ils doivent gonfler et être moelleux.","Servir le bouillon avec les matzo balls et des carottes."]',
true, 'approved', 'Soupe traditionnelle de Pessah'),

(uid, 'Brisket (poitrine de bœuf braisée)', '', 6, 20, 180,
'["1,5 kg de poitrine de bœuf","3 oignons","4 gousses d''ail","400g de tomates concassées","200ml de vin rouge (ou bouillon)","1 c. à soupe de paprika","Thym, laurier","Sel, poivre","Huile"]',
'["Faire dorer la viande sur toutes les faces. Réserver.","Faire revenir les oignons et l''ail dans la même cocotte.","Ajouter les tomates, le paprika et le vin.","Remettre la viande, ajouter thym et laurier.","Couvrir hermétiquement et cuire au four à 160°C pendant 3 heures.","La viande doit être très tendre et se trancher facilement.","Servir en tranches épaisses nappées de sauce."]',
true, 'approved', 'Plat festif juif braisé'),

(uid, 'Latkes (galettes de pommes de terre Hanoukka)', '', 4, 20, 20,
'["4 pommes de terre","1 oignon","2 œufs","3 c. à soupe de farine de matzo ou farine ordinaire","Sel, poivre","Huile pour frire","Crème sure et compote de pommes pour servir"]',
'["Râper les pommes de terre et l''oignon. Presser fortement pour enlever l''excès d''eau.","Mélanger avec les œufs battus, la farine, le sel et le poivre.","Faire chauffer généreusement l''huile dans une poêle.","Former des galettes avec la préparation, les aplatir.","Faire frire 3-4 minutes par face jusqu''à dorure croustillante.","Égoutter sur du papier absorbant.","Servir chaud avec de la crème sure et de la compote de pommes."]',
true, 'approved', 'Galettes de Hanoukka'),

(uid, 'Sufganiyot (beignets de Hanoukka)', '', 12, 30, 20,
'["400g de farine","7g de levure sèche","60g de sucre","2 œufs","150ml de lait tiède","60g de beurre","1 c. à café de vanille","Confiture de fraise ou crème pâtissière","Sucre glace","Huile de friture"]',
'["Dissoudre la levure dans le lait tiède sucré.","Mélanger farine, sucre, œufs, vanille et le mélange de levure.","Incorporer le beurre ramolli. Pétrir 10 minutes. Lever 1h30.","Abaisser la pâte à 1 cm. Découper des cercles.","Laisser lever encore 30 minutes.","Faire frire dans l''huile à 170°C, 2-3 minutes par face.","Égoutter, refroidir légèrement, garnir de confiture à la poche, saupoudrer de sucre glace."]',
true, 'approved', 'Beignets de la fête des Lumières'),

-- ═══════════════════════════════════════════════════
-- 🪔 DIWALI (Fête des Lumières hindoue)
-- ═══════════════════════════════════════════════════

(uid, 'Gulab jamun (dessert Diwali)', '', 8, 20, 20,
'["200g de lait en poudre","50g de farine","1 c. à café de levure","3 c. à soupe de beurre fondu","Lait pour lier","Sirop : 400g sucre, 400ml eau, eau de rose, cardamome","Pistaches pour décorer"]',
'["Mélanger lait en poudre, farine, levure et beurre fondu.","Ajouter juste assez de lait pour former une pâte molle.","Former de petites boules lisses (sans fissures).","Préparer le sirop : porter eau, sucre, eau de rose et cardamome à ébullition.","Faire frire les boules à feu doux dans l''huile jusqu''à brun doré.","Plonger immédiatement les boules chaudes dans le sirop chaud.","Laisser tremper au moins 2 heures. Garnir de pistaches."]',
true, 'approved', 'Boules de lait frites au sirop de rose'),

(uid, 'Kheer (riz au lait indien)', '', 6, 10, 40,
'["100g de riz à grain court","1 litre de lait entier","100g de sucre","1 c. à café de cardamome","1 c. à soupe d''eau de rose","Amandes et pistaches effilées","Safran (pincée)"]',
'["Rincer le riz. Le cuire dans le lait à feu doux en remuant régulièrement.","Continuer la cuisson 30-35 minutes jusqu''à ce que le riz soit très tendre et le lait réduit et crémeux.","Ajouter le sucre et la cardamome. Cuire encore 5 minutes.","Dissoudre le safran dans un peu de lait chaud, incorporer.","Ajouter l''eau de rose.","Servir chaud ou froid.","Garnir d''amandes et pistaches effilées."]',
true, 'approved', 'Riz au lait parfumé indien'),

(uid, 'Murukku (crackers de riz Diwali)', '', 8, 30, 20,
'["300g de farine de riz","100g de farine de pois chiche","1 c. à café de cumin","1 c. à café de sésame","1 c. à café de sel","3 c. à soupe de beurre","Eau pour lier","Huile de friture"]',
'["Mélanger les farines avec le cumin, le sésame et le sel.","Incorporer le beurre fondu, mélanger en sableux.","Ajouter l''eau progressivement pour obtenir une pâte ferme.","Remplir une presse à biscuits avec la pâte (disque étoilé).","Presser directement dans l''huile chaude en formant des spirales.","Frire à feu moyen jusqu''à dorure et croustillant.","Égoutter sur papier absorbant. Se conserve plusieurs semaines."]',
true, 'approved', 'Crackers en spirale de Diwali'),

(uid, 'Barfi aux noix de cajou (Kaju Katli)', '', 16, 20, 20,
'["200g de noix de cajou","150g de sucre","100ml d''eau","1 c. à café de cardamome","1 c. à café d''eau de rose","Feuille d''argent alimentaire (varak) pour décorer"]',
'["Mixer les noix de cajou à sec en poudre fine (ne pas trop mixer pour éviter l''huile).","Faire un sirop : sucre + eau, cuire jusqu''à consistance de fil (115°C).","Ajouter la poudre de cajou au sirop hors du feu, mélanger vigoureusement.","Incorporer la cardamome et l''eau de rose.","Étaler sur une plaque beurrée, aplatir à 5mm.","Poser la feuille d''argent si disponible.","Couper en losanges quand encore tiède."]',
true, 'approved', 'Friandise indienne aux noix de cajou'),

-- ═══════════════════════════════════════════════════
-- 🧧 NOUVEL AN CHINOIS
-- ═══════════════════════════════════════════════════

(uid, 'Nian gao (gâteau du Nouvel An chinois)', '', 8, 20, 50,
'["300g de farine de riz gluant","200g de sucre brun","300ml d''eau","1 c. à café d''huile de sésame","Graines de sésame"]',
'["Dissoudre le sucre dans l''eau chaude. Laisser refroidir.","Mélanger la farine de riz gluant avec l''eau sucrée et l''huile de sésame.","Fouetter jusqu''à pâte lisse sans grumeaux.","Huiler un moule rond. Verser la pâte.","Parsemer de graines de sésame.","Cuire à la vapeur 45-50 minutes jusqu''à prise complète.","Laisser refroidir, démouler et trancher. Peut aussi être pané et frit."]',
true, 'approved', 'Gâteau collant du Nouvel An chinois'),

(uid, 'Dumplings du Nouvel An (Jiaozi)', '', 6, 60, 20,
'["Pour la pâte : 300g de farine, 150ml d''eau chaude, sel","Pour la farce : 300g de porc haché, 200g de chou chinois, ciboulette, sauce soja, sésame, gingembre, sel"]',
'["Pétrir la pâte jusqu''à lissité. Reposer 30 minutes sous linge.","Saler le chou émincé, laisser 10 min, essorer soigneusement.","Mélanger porc, chou, ciboulette, sauce soja, sésame et gingembre.","Diviser la pâte, former des boudins, couper des ronds de 8cm.","Déposer la farce, plier et plisser pour sceller.","Cuire à l''eau bouillante (ils sont prêts quand ils remontent à la surface + 3 min).","Servir avec sauce soja, vinaigre de riz et piment."]',
true, 'approved', 'Ravioles de la chance du Nouvel An'),

(uid, 'Longevity noodles (nouilles de longévité)', '', 4, 10, 15,
'["400g de longues nouilles chinoises (ne pas casser !)","300g de crevettes","2 c. à soupe de sauce huître","2 c. à soupe de sauce soja","1 c. à café d''huile de sésame","2 gousses d''ail","Oignons verts","Graines de sésame"]',
'["Cuire les nouilles sans les casser (symbolisme de longévité). Égoutter.","Faire sauter l''ail dans le wok.","Ajouter les crevettes, cuire 3 minutes.","Mélanger sauce huître, sauce soja et sésame.","Ajouter les nouilles et la sauce, mélanger délicatement.","Parsemer d''oignons verts et de sésame.","Servir immédiatement sans couper les nouilles."]',
true, 'approved', 'Nouilles sans les couper pour la longévité'),

-- ═══════════════════════════════════════════════════
-- 🎊 AUTRES FÊTES (Thanksgiving, Fête des morts, Épiphanie)
-- ═══════════════════════════════════════════════════

(uid, 'Pumpkin pie (Thanksgiving)', '', 8, 20, 60,
'["1 pâte brisée","400g de purée de potiron","200ml de crème","2 œufs","150g de sucre brun","1 c. à café de cannelle","1 c. à café de quatre-épices","1 pincée de gingembre","Crème chantilly pour servir"]',
'["Préchauffer le four à 180°C. Foncer un moule à tarte avec la pâte brisée.","Mélanger la purée de potiron avec la crème, les œufs battus et le sucre.","Incorporer les épices.","Verser sur le fond de tarte.","Cuire 50-60 minutes jusqu''à ce que la garniture soit prise.","Le centre peut être encore légèrement tremblotant.","Laisser refroidir complètement. Servir avec de la chantilly."]',
true, 'approved', 'Tarte au potiron de Thanksgiving'),

(uid, 'Pan de muerto (Fête des Morts mexicaine)', '', 8, 40, 30,
'["500g de farine","100g de sucre","7g de levure","3 œufs","100g de beurre","100ml de lait tiède","Zeste d''orange","1 c. à café d''eau de fleur d''oranger","Sucre et beurre pour finition"]',
'["Dissoudre la levure dans le lait tiède.","Mélanger farine, sucre, zeste d''orange et sel.","Incorporer les œufs, le beurre ramolli, la levure et l''eau de fleur d''oranger.","Pétrir 15 minutes jusqu''à pâte élastique. Lever 2 heures.","Former un grand pain rond. Façonner des croisillons et une boule de pâte.","Déposer les décorations sur le pain.","Dorer à l''œuf, cuire 25 minutes à 180°C. Badigeonner de beurre et rouler dans le sucre."]',
true, 'approved', 'Pain brioché mexicain du Día de los Muertos'),

(uid, 'Galette des Rois (Épiphanie)', '', 8, 20, 30,
'["2 rouleaux de pâte feuilletée","150g de poudre d''amandes","100g de sucre","100g de beurre mou","2 œufs","1 c. à soupe de rhum","1 fève","1 jaune d''œuf pour dorer"]',
'["Mélanger la poudre d''amandes, le sucre, le beurre et les œufs pour la frangipane.","Ajouter le rhum. Mélanger jusqu''à crème lisse.","Préchauffer le four à 200°C.","Poser un disque de pâte feuilletée sur une plaque.","Étaler la frangipane en laissant 2 cm de bord. Glisser la fève.","Poser le second disque, souder les bords en pinçant.","Dorer au jaune d''œuf, dessiner des motifs. Cuire 25-30 minutes."]',
true, 'approved', 'Galette traditionnelle de l''Épiphanie'),

(uid, 'Hot cross buns (Vendredi Saint anglais)', '', 12, 30, 20,
'["500g de farine","1 sachet de levure","75g de sucre","1 c. à café de quatre-épices","1 c. à café de cannelle","200ml de lait tiède","2 œufs","75g de beurre","100g de raisins secs","Croix : 75g farine + eau","Glaçage : 2 c. à soupe de marmelade"]',
'["Mélanger farine, levure, sucre et épices. Incorporer lait, œufs et beurre.","Ajouter les raisins secs. Pétrir 10 minutes. Lever 1h30.","Former 12 boules, les disposer serrées dans un plat.","Lever encore 45 minutes.","Préparer la pâte à croix (farine + eau), pocher une croix sur chaque bun.","Cuire 15-20 minutes à 200°C.","Badigeonner de marmelade chauffée à la sortie du four."]',
true, 'approved', 'Brioches de Pâques britanniques'),

(uid, 'Stollen de Noël (Allemagne)', '', 10, 40, 60,
'["500g de farine","7g de levure","200ml de lait tiède","150g de beurre","100g de sucre","2 œufs","300g de fruits confits et raisins secs","100g d''amandes","Zeste de citron et d''orange","1 c. à café de cardamome","1 rouleau de pâte d''amandes","Beurre fondu et sucre glace pour finition"]',
'["Faire tremper les fruits secs dans du rhum une nuit.","Préparer la pâte : lever, beurre, sucre, œufs, épices. Pétrir.","Incorporer les fruits égouttés et les amandes. Lever 2 heures.","Étaler la pâte en ovale. Poser un boudin de pâte d''amandes au centre.","Replier la pâte par-dessus, former la forme caractéristique du stollen.","Cuire 55-60 minutes à 170°C.","À chaud, badigeonner de beurre fondu et saupoudrer généreusement de sucre glace."]',
true, 'approved', 'Pain de Noël allemand aux fruits confits');

END $$;
