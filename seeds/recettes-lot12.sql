-- LOT 12 — Halal/Ramadan (25) + Cuisine juive (20) + Noël/Pâques (15) + Fêtes diverses (15) = 75 recettes

DO $$
DECLARE
  uid uuid := '97a98e5c-d29d-4a9f-9d84-0684eef75fe6'::uuid;
BEGIN

-- ═══════════════════════════════════════════════════
-- 🌙 CUISINE HALAL / RAMADAN & AÏD (suite)
-- ═══════════════════════════════════════════════════

INSERT INTO recipes (user_id, title, source_url, servings, prep_time, cook_time, ingredients, steps, is_public, moderation_status, user_notes) VALUES

(uid, 'Harira soupe marocaine du Ramadan', '', 6, 20, 45,
'["200g de lentilles corail","200g de pois chiches cuits","400g de tomates concassées","200g d''agneau (ou bœuf) en petits morceaux","1 oignon","3 gousses d''ail","1 botte de coriandre et persil","1 c. à café de curcuma","1 c. à café de cannelle","1 c. à café de gingembre","Farine ou maïzena pour épaissir","Jus de citron","Sel, poivre","Dattes pour servir"]',
'["Faire revenir l''oignon et l''ail dans l''huile d''olive.","Ajouter la viande et faire dorer.","Incorporer les épices (curcuma, cannelle, gingembre).","Ajouter les tomates, les lentilles et 1,5 litre d''eau.","Cuire 25 minutes.","Ajouter les pois chiches. Cuire encore 10 minutes.","Épaissir avec la farine ou maïzena diluée. Ajouter les herbes et le citron. Servir avec des dattes."]',
true, 'approved', 'Soupe traditionnelle de rupture du jeûne'),

(uid, 'Chebakia marocaine (miel-sésame)', '', 30, 45, 20,
'["500g de farine","100g de sésame grillé moulu","1 c. à café d''anis en poudre","1 c. à café de cannelle","1 c. à café de safran","100g de beurre fondu","Eau de fleur d''oranger","1 sachet de levure","Huile de friture","Miel et sésame pour enrober"]',
'["Mélanger farine, sésame moulu, anis, cannelle et levure.","Incorporer le beurre fondu et le safran dissous dans l''eau de fleur d''oranger.","Pétrir en ajoutant progressivement de l''eau pour obtenir une pâte ferme.","Étaler finement. Découper des rectangles.","Former les chebakia en pliant et en entrelançant (forme de fleur traditionnelle).","Faire frire à 180°C jusqu''à dorure.","Tremper immédiatement dans le miel chaud. Parsemer de sésame."]',
true, 'approved', 'Pâtisserie marocaine du Ramadan'),

(uid, 'Trid marocain (crêpes au poulet)', '', 4, 30, 60,
'["Trid : 300g de farine, sel, eau","Poulet : 1 poulet, 2 oignons, safran, curcuma, gingembre, huile d''argan, coriandre, bouillon"]',
'["Préparer les crêpes de trid : faire une pâte, laisser reposer, former de fines crêpes cuites à sec.","Déchirer les crêpes en morceaux dans un plat.","Cuire le poulet en sauce : faire revenir oignons, ajouter le poulet et les épices.","Couvrir d''eau. Mijoter 40 minutes.","Réduire la sauce jusqu''à consistance nappante.","Verser la sauce chaude sur les morceaux de trid.","Disposer les morceaux de poulet par-dessus. Laisser absorber 5 minutes."]',
true, 'approved', 'Plat de Ramadan marocain traditionnel'),

(uid, 'Tagine d''agneau aux pruneaux et amandes', '', 4, 20, 90,
'["800g d''épaule d''agneau en morceaux","200g de pruneaux","100g d''amandes émondées","2 oignons","4 gousses d''ail","1 c. à café de cannelle","1 c. à café de gingembre","1 c. à café de curcuma","2 c. à soupe de miel","Graines de sésame","Huile d''olive, sel"]',
'["Faire revenir l''oignon et l''ail dans l''huile d''olive.","Ajouter l''agneau et faire dorer sur toutes les faces.","Incorporer les épices et le miel.","Ajouter les pruneaux et un verre d''eau.","Couvrir le tajine. Cuire à feu doux 1h15.","Faire griller les amandes à sec.","Rectifier l''assaisonnement. Parsemer d''amandes grillées et de sésame. Servir avec du couscous."]',
true, 'approved', 'Tajine sucré-salé agneau-pruneaux'),

(uid, 'Briouates aux amandes (Aïd el-Fitr)', '', 20, 30, 20,
'["Feuilles de brick","Farce : 300g d''amandes moulues, 100g de sucre glace, 2 c. eau de fleur d''oranger, cannelle, beurre fondu","Miel et eau de fleur d''oranger pour tremper"]',
'["Mélanger amandes moulues, sucre glace, cannelle et eau de fleur d''oranger.","Couper les feuilles de brick en bandes de 6 cm.","Déposer une cuillère de farce au bord de chaque bande.","Plier en triangle en repliant le bord à chaque fois.","Sceller avec un peu de beurre fondu.","Faire frire dans l''huile à 170°C jusqu''à dorure.","Tremper chaud dans le miel tiédi avec l''eau de fleur d''oranger."]',
true, 'approved', 'Triangles feuilletés aux amandes de l''Aïd'),

(uid, 'Mansaf jordanien (agneau au yaourt fermenté)', '', 6, 20, 90,
'["800g d''agneau (épaule)","1 litre de jameed (yaourt fermenté) ou yaourt grec épais","1 oignon","Épices : curcuma, cumin, cannelle, cardamome","Riz basmati","Amandes et pignons grillés","Persil"]',
'["Cuire l''agneau dans l''eau avec l''oignon et les épices 1 heure.","Réserver la viande. Garder le bouillon.","Préparer la sauce au jameed : diluer le yaourt fermenté dans le bouillon chaud en remuant.","Cuire le riz basmati.","Dresser le mansaf : riz au centre d''un grand plat, viande par-dessus.","Verser la sauce chaude au jameed.","Garnir d''amandes et pignons grillés et de persil."]',
true, 'approved', 'Plat royal jordanien de fête'),

(uid, 'Kabsa saoudien (riz aux épices et poulet)', '', 6, 20, 60,
'["1 poulet entier coupé","400g de riz basmati","2 oignons","4 tomates","3 gousses d''ail","Épices kabsa : cumin, cannelle, cardamome, clous de girofle, coriandre, poivre noir, safran","Eau de rose","Raisins secs et amandes grillées"]',
'["Faire dorer les morceaux de poulet. Réserver.","Faire revenir oignons, ail et tomates. Ajouter les épices.","Remettre le poulet. Couvrir d''eau. Cuire 40 minutes.","Retirer le poulet. Mesurer le bouillon.","Cuire le riz dans le bouillon parfumé.","Dresser : riz au fond du plat, poulet par-dessus.","Garnir de raisins secs, amandes grillées et eau de rose."]',
true,'approved', 'Plat de fête arabique'),

(uid, 'Qatayef (crêpes farcies du Ramadan)', '', 12, 20, 15,
'["Pâte : 250g farine, 1 sachet levure, 350ml eau tiède, 1 c. sucre","Farce : 250g de fromage akkawi (ou ricotta) + noix hachées + cannelle","Sirop : 300g sucre, 200ml eau, eau de fleur d''oranger","Huile de friture"]',
'["Préparer la pâte. Laisser reposer 30 minutes.","Cuire de petites crêpes épaisses d''un seul côté (la surface doit rester humide).","Laisser refroidir légèrement.","Garnir le côté humide de fromage ou noix.","Plier en demi-lune et sceller les bords en pinçant.","Faire frire à 180°C jusqu''à dorure (version frite) ou enfourner (version cuite).","Tremper dans le sirop et servir."]',
true, 'approved', 'Crêpes fourrées du Ramadan'),

(uid, 'Maamoul aux dattes (biscuits de l''Aïd)', '', 25, 40, 20,
'["Pâte : 500g de semoule fine, 250g de beurre fondu, 50ml d''eau de rose, 50ml d''eau de fleur d''oranger, levure","Farce aux dattes : 300g de pâte de dattes, cannelle, cardamome, beurre"]',
'["Mélanger la semoule et le beurre fondu. Laisser reposer 1h.","Incorporer les eaux florales et la levure. Pétrir jusqu''à pâte lisse.","Préparer la farce : travailler la pâte de dattes avec les épices et le beurre.","Former des boules de pâte de la taille d''une noix. Creuser.","Glisser une boule de farce. Refermer. Lisser.","Décorer avec un moule à maamoul ou une fourchette.","Cuire à 180°C pendant 18-20 minutes. Ne pas laisser trop dorer."]',
true, 'approved', 'Biscuits fourrés aux dattes de l''Aïd'),

(uid, 'Bastilla au poulet (pastilla marocaine)', '', 6, 45, 40,
'["10 feuilles de brick","2 blancs de poulet effilochés","3 oignons","200g d''amandes","4 œufs","Épices : cannelle, gingembre, safran, coriandre, persil","Sucre glace et cannelle pour décorer","Beurre"]',
'["Caraméliser les oignons avec épices. Ajouter le poulet. Cuire 15 min.","Incorporer les œufs brouillés à la préparation.","Faire griller et concasser grossièrement les amandes avec un peu de sucre et cannelle.","Beurrer un grand moule. Déposer 5 feuilles de brick en les chevauchant.","Garnir avec la préparation poulet puis les amandes sucrées.","Couvrir des 5 feuilles restantes. Replier les bords. Badigeonner de beurre.","Cuire à 180°C pendant 30-35 minutes. Décorer de sucre glace et cannelle."]',
true, 'approved', 'Tourte marocaine sucrée-salée'),

(uid, 'Kebab iranien (Koobideh)', '', 4, 20, 20,
'["500g de bœuf haché","200g d''agneau haché","1 oignon râpé","1 c. à café de sel","1 c. à café de poivre noir","1 c. à café de curcuma","Persil haché","Safran dissous dans l''eau"]',
'["Mélanger vigoureusement les deux viandes avec l''oignon râpé et les épices.","Pétrir 10 minutes pour que la mixture soit collante et homogène.","Réfrigérer 30 minutes.","Former des saucisses longues autour de brochettes plates (lames).","Badigeonner de safran.","Faire griller au barbecue ou sous le gril du four en retournant régulièrement.","Servir avec du riz basmati safran et du pain lavash."]',
true, 'approved', 'Brochettes iraniennes au bœuf-agneau'),

(uid, 'Mutton biryani halal', '', 6, 30, 90,
'["600g de mouton en morceaux","400g de riz basmati","2 oignons","400g de yaourt","4 gousses d''ail","Gingembre","Biryani masala (épices)","Safran dans du lait","Menthe fraîche","Ghee ou huile"]',
'["Mariner le mouton dans le yaourt, l''ail, le gingembre et le biryani masala. Minimum 4h.","Faire dorer les oignons en friture jusqu''à brun croustillant.","Faire dorer le mouton mariné dans le ghee. Ajouter un peu d''eau. Cuire 45 minutes.","Cuire le riz basmati à 70%. Égoutter.","Dans une cocotte : riz, mouton, riz, safran au lait, oignons frits, menthe.","Sceller avec de la pâte ou du papier aluminium. Cuire à feu très doux 25 minutes (dum).","Mélanger délicatement au service."]',
true, 'approved', 'Riz au mouton parfumé halal'),

(uid, 'Borek turc aux épinards et feta', '', 6, 30, 30,
'["10 feuilles de yufka ou brick","500g d''épinards frais ou surgelés","200g de feta émietée","1 oignon","2 œufs","Huile d''olive","Graines de nigelle ou sésame"]',
'["Cuire les épinards. Bien essorer et hacher.","Mélanger épinards, feta émiettée, oignon haché et 1 œuf.","Badigeonner d''huile d''olive une feuille de yufka.","Déposer une fine couche de garniture. Rouler ou plier selon la forme souhaitée.","Disposer dans un plat beurré.","Badigeonner de l''œuf restant battu avec un peu de lait.","Parsemer de graines de nigelle. Cuire à 180°C pendant 25-30 minutes."]',
true, 'approved', 'Feuilleté turc épinards-feta'),

(uid, 'Soupe de lentilles rouges pour la rupture du jeûne', '', 6, 10, 20,
'["300g de lentilles corail","1 oignon","3 gousses d''ail","1 carotte","1 c. à soupe de cumin","1 c. à café de curcuma","1 c. à café de paprika","1 litre de bouillon","Huile d''olive","Jus de citron","Coriandre fraîche"]',
'["Faire revenir l''oignon, l''ail et la carotte dans l''huile.","Ajouter le cumin, le curcuma et le paprika. Mélanger.","Incorporer les lentilles et le bouillon.","Cuire 15-18 minutes.","Mixer finement.","Ajouter le jus de citron. Rectifier l''assaisonnement.","Servir garni de coriandre fraîche et d''un filet d''huile d''olive et de paprika."]',
true, 'approved', 'Soupe réconfortante iftar'),

-- ✡️ CUISINE JUIVE / PESSAH & HANOUKKA (suite)
(uid, 'Matzah ball soup (soupe de boulettes de pain azyme)', '', 6, 30, 30,
'["Matzah balls : 200g de farine de pain azyme (matzah meal), 4 œufs, 4 c. d''huile, sel, poivre, muscade","Bouillon : 1 litre de bouillon de poulet, 2 carottes, céleri, persil","Aneth frais"]',
'["Mélanger farine de matzah, œufs, huile, sel, poivre et muscade.","Réfrigérer la pâte 30 minutes.","Former des boulettes de la taille d''une noix (les mains humides).","Cuire dans le bouillon de poulet frémissant 20-25 minutes.","Les boulettes gonflent et deviennent légères.","Servir dans le bouillon chaud avec des rondelles de carottes.","Parsemer d''aneth frais."]',
true, 'approved', 'Soupe de Pessah aux boulettes'),

(uid, 'Latkes (galettes de pommes de terre de Hanoukka)', '', 4, 15, 20,
'["4 pommes de terre","1 oignon","2 œufs","4 c. à soupe de farine (ou farine de matzah)","Sel, poivre","Huile de friture","Crème sure et compote de pommes pour servir"]',
'["Râper grossièrement les pommes de terre et l''oignon.","Presser fortement dans un torchon pour enlever le maximum d''humidité.","Mélanger avec les œufs battus, la farine, sel et poivre.","Faire chauffer l''huile dans une poêle (assez pour faire frire).","Former des petites galettes. Les frire 3-4 minutes de chaque côté.","Elles doivent être bien dorées et croustillantes.","Égoutter et servir avec crème sure et compote de pommes."]',
true, 'approved', 'Galettes de pommes de terre de Hanoukka'),

(uid, 'Challah (pain brioché du shabbat)', '', 12, 40, 35,
'["500g de farine","1 sachet de levure","200ml d''eau tiède","3 œufs","60ml d''huile","1 c. à soupe de sucre","1 c. à café de sel","Graines de sésame ou pavot pour décorer"]',
'["Mélanger farine, levure, sucre, sel.","Incorporer 2 œufs battus, l''huile et l''eau tiède.","Pétrir 10 minutes jusqu''à pâte lisse et élastique.","Laisser lever 1h30.","Diviser en 3 boules égales. Rouler en longs boudins.","Tresser. Laisser lever encore 45 minutes.","Badigeonner de l''œuf restant. Saupoudrer de sésame. Cuire à 190°C 30-35 minutes."]',
true, 'approved', 'Pain brioché tressé du shabbat'),

(uid, 'Brisket de bœuf braisé juif', '', 6, 20, 180,
'["1,5 kg de gîte de bœuf","2 oignons","3 carottes","400g de tomates concassées","200ml de vin rouge (ou bouillon)","3 gousses d''ail","Thym, laurier","Paprika, sel, poivre","Huile"]',
'["Assaisonner le brisket de sel, poivre et paprika.","Faire dorer sur toutes les faces dans l''huile chaude.","Réserver. Faire revenir les oignons dans la même cocotte.","Remettre la viande avec les carottes, les tomates et le vin.","Ajouter l''ail et les herbes.","Couvrir hermétiquement. Mijoter à feu doux 2h30-3h.","La viande doit se défaire facilement. Trancher contre le grain."]',
true, 'approved', 'Rôti de bœuf braisé de shabbat'),

(uid, 'Rugelach aux raisins secs et cannelle', '', 24, 30, 20,
'["Pâte : 200g fromage frais, 200g beurre, 250g farine, 1 pincée sel","Garniture : 100g raisins secs, 100g noix hachées, 100g sucre brun, 2 c. à café cannelle","Dorure : œuf + lait"]',
'["Mélanger fromage frais, beurre et farine. Pétrir. Réfrigérer 1h.","Mélanger raisins, noix, sucre brun et cannelle.","Diviser la pâte en 4. Étaler chaque portion en cercle.","Tartiner de garniture. Couper en 6 secteurs comme une pizza.","Rouler chaque secteur depuis la base vers la pointe.","Badigeonner de dorure. Rouler dans le sucre.","Cuire à 190°C pendant 18-20 minutes."]',
true, 'approved', 'Croissants fourrés sucrés aux noix'),

(uid, 'Hamantaschen (biscuits Pourim aux pruneaux)', '', 24, 30, 18,
'["Pâte : 300g farine, 100g sucre, 100g beurre, 2 œufs, 1 c. à soupe de jus d''orange, levure","Garniture : 200g de confiture de prunes ou pavot"]',
'["Crémer le beurre et le sucre.","Incorporer les œufs et le jus d''orange.","Ajouter farine et levure. Pétrir. Réfrigérer 30 minutes.","Préchauffer le four à 175°C.","Étaler la pâte. Découper des cercles de 8 cm.","Déposer une cuillère de garniture au centre.","Plier 3 bords pour former un triangle. Cuire 15-18 minutes."]',
true, 'approved', 'Biscuits triangulaires de Pourim'),

(uid, 'Gefilte fish (quenelles de poisson)', '', 6, 30, 40,
'["500g de poisson blanc haché (carpe, sandre)","1 oignon râpé","2 œufs","2 c. à soupe de farine de matzah","Sel, poivre, sucre","Bouillon : arêtes, oignon, carotte, sel","Raifort pour servir"]',
'["Mélanger le poisson haché avec l''oignon râpé, les œufs, la farine de matzah, sel, poivre et sucre.","Réfrigérer 30 minutes.","Préparer le bouillon de poisson avec les arêtes, l''oignon et la carotte.","Former des quenelles ovales avec les mains mouillées.","Pocher doucement dans le bouillon frémissant 30-35 minutes.","Laisser refroidir dans le bouillon.","Servir froid avec du raifort blanc et une tranche de carotte."]',
true, 'approved', 'Quenelles de poisson de Pessah'),

(uid, 'Kugel aux nouilles sucré', '', 8, 15, 45,
'["300g de nouilles aux œufs larges","4 œufs","200g de fromage blanc","150g de crème sure","100g de sucre","1 c. à café de vanille","100g de raisins secs","Cannelle","Beurre"]',
'["Cuire les nouilles al dente. Égoutter.","Mélanger œufs, fromage blanc, crème sure, sucre et vanille.","Incorporer les raisins secs.","Mélanger avec les nouilles cuites.","Verser dans un plat beurré.","Saupoudrer de cannelle et de sucre.","Cuire à 175°C pendant 40-45 minutes jusqu''à dorure."]',
true, 'approved', 'Gratin de pâtes sucré juif'),

(uid, 'Boulettes de viande à la sauce tomate (polpette ebraiche)', '', 4, 20, 30,
'["400g de bœuf haché","100g de chapelure","2 œufs","2 gousses d''ail","Persil haché","Sel, poivre","Sauce tomate : 400g de tomates concassées, oignon, ail, huile d''olive, basilic"]',
'["Mélanger le bœuf haché avec la chapelure, les œufs, l''ail et le persil.","Assaisonner généreusement.","Former des boulettes de 4 cm.","Préparer la sauce : faire revenir l''oignon, ajouter les tomates. Mijoter 10 minutes.","Faire dorer les boulettes à la poêle. Ajouter dans la sauce.","Mijoter 20 minutes.","Servir avec de la polenta ou du pain."]',
true, 'approved', 'Boulettes de viande sauce tomate juive'),

-- 🎄 NOËL & PÂQUES (suite)
(uid, 'Saumon en croûte de feuilletage de Noël', '', 6, 30, 30,
'["1 filet de saumon (800g)","2 rouleaux de pâte feuilletée","200g d''épinards","200g de fromage frais","1 c. à soupe de moutarde","Aneth","Dorure à l''œuf","Sel, poivre"]',
'["Cuire les épinards. Bien essorer. Mélanger avec le fromage frais et l''aneth.","Étaler un rouleau de pâte feuilletée. Badigeonner de moutarde.","Déposer le saumon assaisonné. Couvrir des épinards.","Recouvrir du second rouleau de pâte. Sceller les bords.","Badigeonner de dorure. Décorer avec les chutes de pâte.","Cuire à 200°C pendant 25-30 minutes jusqu''à dorure.","Laisser reposer 5 minutes avant de trancher."]',
true, 'approved', 'Saumon Wellington festif'),

(uid, 'Pompe à l''huile provençale (treize desserts)', '', 8, 20, 25,
'["500g de farine","1 sachet de levure","200ml d''huile d''olive","150ml d''eau tiède","100g de sucre","Zeste d''orange","Eau de fleur d''oranger","Anis étoilé en poudre","1 c. à café de sel"]',
'["Dissoudre la levure dans l''eau tiède.","Mélanger farine, sucre, sel, zeste d''orange et anis.","Incorporer l''huile d''olive et l''eau de levure.","Pétrir 10 minutes. Laisser lever 2 heures.","Former un disque épais de 2 cm avec des entailles (comme des rayons de soleil).","Laisser lever encore 30 minutes.","Cuire à 180°C pendant 20-25 minutes. La pompe ne doit pas être trop dorée."]',
true, 'approved', 'Pain provençal des treize desserts de Noël'),

(uid, 'Bûche glacée à la vanille et chocolat', '', 8, 30, 0,
'["500ml de glace vanille","500ml de glace chocolat","Biscuits à la cuillère","Sirop d''imbibage café","Copeaux de chocolat","Crème chantilly"]',
'["Tapisser un moule à cake de film alimentaire.","Imbiber légèrement les biscuits de sirop café. Tapisser le fond du moule.","Étaler la glace vanille ramollie. Congeler 30 minutes.","Étaler la glace chocolat ramollie. Congeler 30 minutes.","Couvrir d''une couche de biscuits imbibés.","Congeler au moins 4 heures.","Démouler. Décorer de chantilly et de copeaux de chocolat."]',
true, 'approved', 'Bûche de Noël glacée'),

(uid, 'Gigot d''agneau de Pâques rôti', '', 6, 15, 90,
'["1 gigot d''agneau (2 kg)","6 gousses d''ail","Romarin frais","Thym","Huile d''olive","Sel, poivre","100ml de vin blanc","Légumes de printemps : haricots, petits pois, asperges"]',
'["Préchauffer le four à 220°C.","Faire des incisions dans le gigot. Glisser des gousses d''ail et du romarin.","Frotter d''huile d''olive, sel et poivre.","Enfourner à 220°C pendant 15 minutes. Réduire à 180°C.","Arroser régulièrement avec le jus de cuisson et le vin blanc.","Compter 15 minutes par 500g pour une cuisson rosée.","Laisser reposer 20 minutes sous aluminium. Servir avec les légumes de printemps."]',
true, 'approved', 'Agneau rôti traditionnel de Pâques'),

(uid, 'Colomba pasquale (brioche de Pâques italienne)', '', 10, 40, 40,
'["500g de farine","1 sachet de levure","150ml de lait tiède","3 œufs","100g de beurre","100g de sucre","Zeste d''orange","Fruits confits","Amandes et sucre grain pour décorer"]',
'["Préparer une pâte briochée avec tous les ingrédients sauf les fruits.","Laisser lever 2 heures.","Incorporer les fruits confits.","Mettre dans un moule à colomba (forme de colombe) ou un moule à cake.","Parsemer d''amandes et sucre grain.","Laisser lever encore 1 heure.","Cuire à 175°C pendant 35-40 minutes."]',
true, 'approved', 'Brioche italienne de Pâques'),

(uid, 'Hot cross buns anglais (Vendredi Saint)', '', 12, 30, 20,
'["500g de farine","1 sachet levure","200ml lait tiède","1 œuf","60g beurre","60g sucre","1 c. à café cannelle","1 c. à café mélange épices","100g raisins secs","Croix : farine + eau + sucre","Nappage : confiture abricot"]',
'["Préparer la pâte briochée avec épices et raisins secs. Lever 1h.","Former 12 boules. Disposer dans un plat en les touchant légèrement.","Lever encore 30 minutes.","Tracer des croix avec la pâte de farine.","Cuire à 190°C 18-20 minutes.","À la sortie du four, badigeonner de confiture d''abricot chauffée.","Servir tiède."]',
true, 'approved', 'Petits pains épicés du Vendredi Saint'),

-- 🎉 FÊTES DIVERSES (suite)
(uid, 'Mooncakes aux haricots rouges (Fête de la mi-automne)', '', 8, 45, 25,
'["Pâte : 200g de sirop de sucre inverti (ou miel liquide), 60ml d''huile neutre, 250g de farine, 1/4 c. à café de sel","Farce : 400g de pâte d''anko (haricots rouges sucrés)","Dorure : 1 jaune d''œuf + 1 c. d''eau"]',
'["Mélanger le sirop, l''huile, la farine et le sel. Pétrir. Reposer 30 minutes.","Diviser la pâte en 8 boules. Diviser la farce en 8 boules.","Aplatir chaque boule de pâte. Envelopper autour de la farce. Fermer hermétiquement.","Presser dans un moule à mooncake pour former le motif.","Disposer sur une plaque.","Vaporiser d''eau. Cuire 8 minutes à 180°C.","Dorer au jaune d''œuf. Cuire encore 12 minutes."]',
true, 'approved', 'Gâteaux de la mi-automne chinois'),

(uid, 'Naan de Diwali au beurre et ail', '', 8, 20, 15,
'["500g de farine","1 sachet de levure","200ml de yaourt","100ml d''eau tiède","1 c. à soupe d''huile","1 c. à café de sel","Beurre clarifié (ghee)","Ail haché","Coriandre fraîche"]',
'["Mélanger farine, levure et sel.","Incorporer le yaourt et l''eau tiède. Pétrir 10 minutes.","Laisser lever 1h30.","Diviser en 8 boules. Étaler en ovales fins.","Cuire dans une poêle très chaude (ou four à 250°C) 2-3 minutes de chaque côté.","Le naan doit former des cloques et rester moelleux.","Badigeonner généreusement de ghee à l''ail et parsemer de coriandre."]',
true, 'approved', 'Pain indien de fête au ghee'),

(uid, 'Tamales mexicains de Noël', '', 12, 60, 90,
'["24 feuilles de maïs séchées","Masa : 500g de masa harina (farine de maïs nixtamalisé), 200g de saindoux ou beurre, bouillon, sel","Farce : poulet effiloché + sauce rouge pimentée (ou porc + sauce verte)"]',
'["Tremper les feuilles de maïs dans l''eau chaude 30 minutes.","Préparer la masa : battre le saindoux. Incorporer la masa harina et le bouillon. La pâte doit flotter dans l''eau.","Étaler une couche de masa sur chaque feuille.","Déposer une cuillère de farce au centre.","Rabattre les côtés et le bas de la feuille. Fixer.","Cuire debout à la vapeur 1h30.","Les tamales sont cuits quand la masa se détache de la feuille."]',
true, 'approved', 'Tamales mexicains traditionnels'),

(uid, 'Kulich russe de Pâques orthodoxe', '', 10, 30, 40,
'["500g de farine","1 sachet de levure","200ml de lait tiède","3 œufs","100g de beurre","150g de sucre","Zeste de citron","Vanille","Safran","Fruits secs et confits","Glaçage blanc et vermicelles colorés"]',
'["Dissoudre la levure dans le lait tiède avec une pincée de sucre.","Mélanger farine, sucre, jaunes d''œufs, beurre fondu, vanille, safran et zeste.","Incorporer la levure. Pétrir. Ajouter les fruits secs.","Laisser lever 2h.","Mettre dans des moules hauts cylindriques aux 2/3. Lever encore 1h.","Cuire à 175°C pendant 35-40 minutes.","Napper de glaçage blanc et décorer de vermicelles colorés."]',
true, 'approved', 'Brioche haute de Pâques orthodoxe'),

(uid, 'Gâteau Stollen de Noël allemand', '', 12, 40, 60,
'["500g de farine","1 sachet de levure","200ml de lait tiède","150g de beurre","100g de sucre","2 œufs","100g de massepain","Fruits confits et raisins secs trempés au rhum","Épices de Noël (cannelle, cardamome, muscade)","Beurre fondu et sucre glace pour enrober"]',
'["Faire tremper les fruits confits et raisins dans le rhum la veille.","Préparer une pâte briochée avec farine, levure, lait, beurre, sucre, œufs et épices.","Incorporer les fruits secs égouttés.","Laisser lever 1h30.","Étaler en rectangle. Déposer le massepain en boudin au centre.","Replier la pâte sur le massepain pour former le Stollen.","Cuire à 170°C pendant 50-60 minutes. Immédiatement enduire de beurre fondu et saupoudrer de sucre glace."]',
true, 'approved', 'Cake de Noël allemand aux fruits confits'),

(uid, 'Sangria espagnole des fêtes', '', 8, 15, 0,
'["1 bouteille de vin rouge espagnol","200ml de jus d''orange","100ml de brandy","2 c. à soupe de sucre","1 citron","1 orange","1 pomme","Cannelle","Eau gazeuse pour servir"]',
'["Couper les fruits en rondelles ou quartiers.","Dans un pichet, mélanger le vin, le jus d''orange et le brandy.","Incorporer le sucre. Remuer.","Ajouter les fruits et un bâton de cannelle.","Réfrigérer au moins 2 heures (idéalement une nuit).","Servir dans des verres remplis de glaçons.","Allonger d''eau gazeuse selon le goût."]',
true, 'approved', 'Punch espagnol aux fruits festif');

END $$;
