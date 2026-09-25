-- SAUCES ITALIENNES POUR PÂTES — 20 recettes
-- (Sans doublon avec : carbonara, bolognaise, pesto basilic, sauce tomate simple, lasagnes)

DO $$
DECLARE
  uid uuid := '97a98e5c-d29d-4a9f-9d84-0684eef75fe6'::uuid;
BEGIN

INSERT INTO recipes (user_id, title, source_url, servings, prep_time, cook_time, ingredients, steps, is_public, moderation_status, user_notes) VALUES

-- 1
(uid, 'Amatriciana (guanciale, tomate, pecorino)', '', 4, 10, 25,
'["400g de bucatini ou rigatoni","200g de guanciale (ou pancetta) en lardons épais","400g de tomates pelées en boîte","1 piment sec","100ml de vin blanc sec","80g de pecorino romano râpé","Poivre noir"]',
'["Faire revenir le guanciale à sec dans une grande poêle à feu moyen jusqu''à ce qu''il soit doré et croustillant. Réserver en gardant le gras.","Ajouter le piment émietté dans le gras. Déglacer au vin blanc et laisser évaporer.","Ajouter les tomates écrasées à la main. Saler modérément (le guanciale est salé). Cuire 15 minutes à feu moyen.","Remettre le guanciale dans la sauce.","Cuire les pâtes al dente. Égoutter en conservant une louche d''eau de cuisson.","Mélanger pâtes et sauce hors du feu. Ajouter l''eau de cuisson si nécessaire.","Servir avec le pecorino et beaucoup de poivre noir fraîchement moulu."]',
true, 'approved', 'Jamais de crème ni d''oignon dans la vraie amatriciana — piment et pecorino seulement'),

-- 2
(uid, 'Arrabbiata (tomate, ail, piment fort)', '', 4, 5, 20,
'["400g de penne rigate","2 boîtes de tomates pelées","6 gousses d''ail","2 à 4 piments secs (selon tolérance)","6 c. à soupe d''huile d''olive extra-vierge","Persil plat frais","Sel"]',
'["Écraser les gousses d''ail sans les éplucher.","Faire chauffer l''huile d''olive dans une sauteuse. Faire dorer l''ail et les piments entiers à feu moyen.","Retirer l''ail et les piments une fois dorés.","Ajouter les tomates écrasées à la main. Saler. Cuire 15 minutes à feu vif pour concentrer.","Cuire les pâtes al dente.","Mélanger pâtes et sauce avec une louche d''eau de cuisson.","Parsemer de persil plat ciselé. Servir sans fromage (tradition romaine)."]',
true, 'approved', 'Arrabbiata = enragée en italien — la sauce doit piquer vraiment'),

-- 3
(uid, 'Cacio e pepe (pecorino et poivre noir)', '', 4, 5, 12,
'["400g de spaghetti ou tonnarelli","150g de pecorino romano finement râpé","50g de parmesan finement râpé","2 c. à café de poivre noir en grains","Eau de cuisson des pâtes (très salée)"]',
'["Faire torréfier le poivre concassé grossièrement dans une grande poêle sèche 1 minute. Réserver.","Cuire les pâtes dans très peu d''eau salée (plus concentrée en amidon).","Mélanger les fromages avec un peu d''eau de cuisson froide pour former une crème lisse.","Transférer les pâtes al dente dans la poêle avec le poivre. Ajouter 2 louches d''eau de cuisson chaude.","Retirer du feu. Ajouter la crème de fromage en remuant énergiquement.","Ajouter de l''eau de cuisson peu à peu jusqu''à obtenir une sauce crémeuse et nacrée.","Servir immédiatement avec du poivre supplémentaire."]',
true, 'approved', 'Jamais de crème — c''est l''amidon de l''eau de cuisson qui crée la texture'),

-- 4
(uid, 'Vongole (palourdes, ail, vin blanc)', '', 4, 15, 15,
'["400g de spaghetti","1 kg de palourdes vives","4 gousses d''ail","150ml de vin blanc sec","1 piment sec","Persil plat frais","6 c. à soupe d''huile d''olive","Sel, poivre"]',
'["Faire tremper les palourdes dans l''eau salée 30 minutes pour les dessabler. Rincer et brosser.","Faire chauffer l''huile avec l''ail émincé et le piment dans une grande sauteuse.","Quand l''ail est doré, verser les palourdes et le vin blanc. Couvrir à feu vif.","Secouer régulièrement. Retirer les palourdes au fur et à mesure qu''elles s''ouvrent (2-4 minutes).","Filtrer le jus de cuisson pour enlever le sable. Réduire légèrement.","Cuire les pâtes al dente. Les mélanger avec le jus réduit et les palourdes.","Parsemer de persil ciselé et de poivre noir. Servir immédiatement."]',
true, 'approved', 'Jeter les palourdes qui ne s''ouvrent pas — jamais les forcer'),

-- 5
(uid, 'Puttanesca (anchois, câpres, olives, tomate)', '', 4, 10, 20,
'["400g de spaghetti","2 boîtes de tomates pelées","6 filets d''anchois à l''huile","3 c. à soupe de câpres","100g d''olives noires de Gaète (ou Kalamata)","4 gousses d''ail","1 piment sec","Huile d''olive","Persil plat"]',
'["Faire chauffer l''huile avec l''ail et le piment. Ajouter les anchois et les écraser à la fourchette jusqu''à dissolution.","Ajouter les câpres et les olives. Faire sauter 2 minutes.","Incorporer les tomates écrasées à la main. Cuire 15 minutes à feu moyen.","Goûter avant de saler — anchois, câpres et olives sont déjà salés.","Cuire les pâtes al dente. Les mélanger à la sauce avec un peu d''eau de cuisson.","Parsemer de persil ciselé.","Servir sans fromage (la tradition napolitaine exclut le fromage avec les anchois)."]',
true, 'approved', 'Ne pas saler avant goûter — les anchois et câpres salent naturellement le plat'),

-- 6
(uid, 'Aglio olio e peperoncino (ail, huile, piment)', '', 4, 5, 10,
'["400g de spaghetti","8 gousses d''ail","1 c. à café de piment rouge en flocons","150ml d''huile d''olive extra-vierge de qualité","1 bouquet de persil plat","Sel","Parmesan optionnel"]',
'["Cuire les pâtes dans une grande casserole d''eau très salée.","Pendant ce temps, émincer l''ail très finement.","Dans une grande poêle, chauffer l''huile d''olive à feu moyen-doux. Faire dorer l''ail lentement sans le brûler (4-5 min).","Ajouter le piment. Retirer du feu.","Égoutter les pâtes al dente en gardant 2 louches d''eau de cuisson.","Remettre la poêle sur feu vif. Ajouter pâtes et eau de cuisson. Faire sauter vigoureusement.","Servir avec le persil ciselé. Le fromage est optionnel selon la tradition."]',
true, 'approved', 'L''ail ne doit jamais brûler — feu doux et patience sont la clé'),

-- 7
(uid, 'Alla Norma (aubergines, tomate, ricotta salée)', '', 4, 20, 30,
'["400g de rigatoni ou penne","2 grosses aubergines","400g de tomates pelées","3 gousses d''ail","100g de ricotta salée (ou feta sèche)","Basilic frais abondant","Huile d''olive","Sel, piment optionnel"]',
'["Couper les aubergines en dés de 2 cm. Saler et laisser dégorger 20 minutes. Rincer et sécher.","Faire frire les aubergines dans l''huile d''olive jusqu''à dorure. Égoutter sur papier.","Dans la même huile (filtrée), faire revenir l''ail. Ajouter les tomates écrasées.","Mijoter 15 minutes. Saler et ajouter le basilic.","Incorporer les aubergines dans la sauce. Cuire encore 5 minutes.","Mélanger les pâtes cuites al dente avec la sauce.","Servir avec la ricotta salée râpée et des feuilles de basilic frais."]',
true, 'approved', 'Plat emblématique de Catane — la ricotta salée est irremplaçable pour l''authenticité'),

-- 8
(uid, 'Genovese napoletaine (oignons confits et veau)', '', 6, 20, 180,
'["500g de rigatoni ou ziti","800g de veau (épaule) en gros morceaux","1,5 kg d''oignons jaunes émincés","200ml de vin blanc sec","Huile d''olive","Sel, poivre","Parmesan râpé","Persil"]',
'["Faire revenir le veau dans l''huile d''olive sur toutes les faces. Réserver.","Dans la même cocotte, faire fondre les oignons à feu très doux 20 minutes en remuant souvent.","Déglacer au vin blanc. Remettre le veau.","Couvrir et mijoter à feu très doux 2h30 à 3h en remuant régulièrement. Les oignons doivent fondre complètement et caraméliser.","Retirer le veau. L''effilocher et le remettre dans la sauce aux oignons.","Cuire les pâtes al dente. Les mélanger à la sauce.","Servir avec le parmesan et le persil."]',
true, 'approved', 'La sauce genovese n''est pas gênoise — c''est une spécialité napolitaine aux oignons fondus'),

-- 9
(uid, 'Pesto trapanese (amandes, tomates, basilic, sicilien)', '', 4, 15, 0,
'["400g de busiate ou spaghetti","100g d''amandes mondées","300g de tomates cerise bien mûres","1 bouquet de basilic","2 gousses d''ail","100ml d''huile d''olive extra-vierge","50g de pecorino siciliano (ou parmesan)","Sel, piment"]',
'["Faire torréfier légèrement les amandes à sec dans une poêle. Laisser refroidir.","Mixer amandes, tomates cerises crues (non cuites), basilic et ail.","Incorporer l''huile d''olive en filet tout en mixant.","Ajouter le pecorino. Mixer brièvement. Saler et ajouter le piment.","Cuire les pâtes al dente. Réserver une louche d''eau de cuisson.","Mélanger les pâtes chaudes avec le pesto froid et un peu d''eau de cuisson.","Servir immédiatement — ce pesto est toujours cru, jamais chauffé."]',
true, 'approved', 'Pesto cru typique de Trapani — tomates et amandes remplacent les pignons et le basilic seul'),

-- 10
(uid, 'Pasta e fagioli (haricots borlotti, romarin)', '', 4, 15, 35,
'["300g de ditali ou tubetti","400g de haricots borlotti cuits (ou en boîte)","2 boîtes de tomates concassées","1 oignon","4 gousses d''ail","2 branches de romarin","1 branche de céleri","100g de lardons (optionnel)","Huile d''olive, sel, poivre","Parmesan pour finir"]',
'["Faire revenir oignon, ail, céleri et lardons dans l''huile d''olive.","Ajouter les tomates et le romarin. Mijoter 10 minutes.","Incorporer les haricots. Écraser grossièrement 1/3 des haricots pour épaissir la sauce.","Ajouter 400ml d''eau ou bouillon. Porter à frémissement.","Verser les pâtes directement dans la soupe. Cuire en remuant selon les indications du paquet.","La soupe doit être épaisse — ajouter de l''eau si trop compacte.","Finir avec un filet d''huile d''olive crue et du parmesan."]',
true, 'approved', 'Plat entre soupe et pâtes — la consistance est celle d''une soupe épaisse'),

-- 11
(uid, 'Boscaiola (saucisse, champignons, crème)', '', 4, 15, 25,
'["400g de pappardelle ou rigatoni","300g de saucisses italiennes (ou chipolatas)","300g de champignons mélangés","1 oignon","3 gousses d''ail","200ml de vin blanc","200ml de crème fraîche","Thym, romarin","Huile d''olive, sel, poivre","Parmesan râpé"]',
'["Retirer la chair des saucisses de leur boyau et l''émietter.","Faire dorer la saucisse émiettée dans l''huile. Réserver.","Faire sauter les champignons à feu vif jusqu''à évaporation. Réserver.","Faire revenir oignon et ail. Déglacer au vin blanc.","Remettre saucisse et champignons. Ajouter crème et herbes.","Mijoter 10 minutes à feu doux.","Mélanger les pâtes al dente avec la sauce. Servir avec le parmesan."]',
true, 'approved', 'Boscaiola = de la forêt — champignons et saucisse rustiques'),

-- 12
(uid, 'Salsiccia e broccoli (saucisse et brocoli, ail, piment)', '', 4, 10, 20,
'["400g d''orecchiette ou cavatelli","300g de saucisses italiennes","2 têtes de brocoli","6 gousses d''ail","2 piments secs","100ml de vin blanc","Huile d''olive généreuse","Sel","Pecorino râpé"]',
'["Diviser le brocoli en fleurettes. Cuire dans l''eau des pâtes 3 minutes. Égoutter en gardant l''eau.","Cuire les pâtes dans cette même eau (garde la saveur du brocoli).","Pendant ce temps, émietter la saucisse et faire dorer dans l''huile.","Ajouter ail émincé et piment. Déglacer au vin blanc.","Ajouter les fleurettes de brocoli. Écraser grossièrement avec une fourchette.","Mélanger pâtes al dente avec la saucisse et brocoli. Ajouter de l''eau de cuisson pour lier.","Servir avec le pecorino râpé et un filet d''huile d''olive."]',
true, 'approved', 'Cuire le brocoli dans l''eau des pâtes = l''eau prend le goût et parfume les pâtes'),

-- 13
(uid, 'Ragù napoletano (ragù napolitain mijoté 4 heures)', '', 6, 20, 240,
'["500g de paccheri ou ziti","400g de paleron de bœuf en gros morceaux","200g de saucisses italiennes","100g de couenne de porc (optionnel)","2 boîtes de tomates pelées San Marzano","2 oignons","200ml de vin rouge","Basilic frais abondant","Huile d''olive, sel, poivre"]',
'["Faire dorer les viandes dans l''huile d''olive. Réserver.","Faire fondre les oignons dans le même gras 20 minutes.","Déglacer au vin rouge. Laisser réduire 10 minutes.","Remettre les viandes. Ajouter les tomates écrasées à la main.","Cuire à feu très doux à couvert pendant 3h30 à 4h en remuant régulièrement.","Retirer la viande — la servir comme plat séparé ou l''effilocher dans la sauce.","Finir avec le basilic frais. Servir la sauce sur les pâtes avec du parmesan."]',
true, 'approved', 'Le ragù napolitain cuit toute la matinée du dimanche — la viande se sert séparément'),

-- 14
(uid, 'Penne al salmone (saumon fumé, crème, câpres)', '', 4, 10, 15,
'["400g de penne","200g de saumon fumé en tranches","200ml de crème fraîche liquide","2 échalotes","100ml de vin blanc","2 c. à soupe de câpres","Aneth frais","Huile d''olive, sel, poivre blanc","Zeste de citron"]',
'["Émincer les échalotes et les faire suer dans l''huile d''olive.","Déglacer au vin blanc. Laisser réduire de moitié.","Ajouter la crème fraîche. Laisser épaissir 3 minutes.","Retirer du feu. Incorporer le saumon fumé coupé en lanières et les câpres.","Cuire les pâtes al dente. Les ajouter à la sauce hors du feu.","Mélanger délicatement pour ne pas casser le saumon.","Servir avec l''aneth ciselé, le zeste de citron et du poivre blanc."]',
true, 'approved', 'Saumon incorporé hors du feu pour ne pas le cuire — il doit rester soyeux'),

-- 15
(uid, 'Pesto di pistacchi (pesto de pistaches, sicilien)', '', 4, 10, 0,
'["400g de casarecce ou trofie","150g de pistaches non salées et décortiquées","50g de parmesan râpé","1 gousse d''ail","100ml d''huile d''olive extra-vierge","Jus de citron","Sel, poivre","Pistaches concassées et zeste de citron pour servir"]',
'["Faire tremper les pistaches dans l''eau chaude 5 minutes pour peler facilement.","Mixer pistaches, parmesan, ail et jus de citron.","Incorporer l''huile d''olive en filet tout en mixant.","Assaisonner de sel et poivre. Ajuster la texture avec un peu d''eau de cuisson.","Cuire les pâtes al dente. Réserver une tasse d''eau de cuisson.","Mélanger les pâtes chaudes avec le pesto et l''eau de cuisson.","Servir avec des pistaches concassées et le zeste de citron."]',
true, 'approved', 'Spécialité de Bronte en Sicile — la capitale mondiale des pistaches'),

-- 16
(uid, 'Pasta con le sarde (sardines, fenouil, pignons, raisins)', '', 4, 20, 25,
'["400g de bucatini ou spaghetti","400g de sardines fraîches (ou en boîte à l''huile)","1 botte de fenouil sauvage (ou aneth)","2 c. à soupe de pignons de pin","2 c. à soupe de raisins secs","1 oignon","4 anchois","Safran","Huile d''olive, sel, poivre","Chapelure grillée pour finir"]',
'["Faire tremper les raisins secs dans l''eau tiède 15 minutes.","Blanchir les fanes de fenouil 3 minutes dans l''eau des pâtes. Égoutter et hacher finement.","Dans la même eau, dissoudre le safran.","Faire revenir l''oignon avec les anchois (ils fondent). Ajouter pignons, raisins et fenouil.","Incorporer les sardines émiettées. Cuire 10 minutes.","Cuire les pâtes dans l''eau safranée. Mélanger avec la sauce.","Servir avec la chapelure grillée à l''huile d''olive (le parmesan sicilien)."]',
true, 'approved', 'La chapelure grillée remplace le parmesan dans la tradition sicilienne pauvre'),

-- 17
(uid, 'Pasta alla Gricia (guanciale et pecorino, sans tomate)', '', 4, 10, 15,
'["400g de rigatoni ou spaghetti","200g de guanciale (ou pancetta) en lardons","100g de pecorino romano finement râpé","1 c. à café de poivre noir en grains","Eau de cuisson des pâtes"]',
'["Faire revenir le guanciale à sec dans une poêle à feu moyen jusqu''à croustillant. Réserver en gardant le gras.","Concasser grossièrement le poivre et le toaster dans le gras du guanciale 1 minute.","Cuire les pâtes al dente dans une eau salée modérément (le guanciale et le pecorino sont salés).","Transférer les pâtes dans la poêle avec 2 louches d''eau de cuisson. Faire sauter à feu vif.","Retirer du feu. Ajouter le pecorino râpé en remuant vigoureusement pour créer une sauce crémeuse.","Ajouter l''eau de cuisson si la sauce est trop épaisse.","Servir avec le guanciale croustillant et du poivre noir."]',
true, 'approved', 'La gricia est l''ancêtre de la carbonara et de l''amatriciana — sans œuf ni tomate'),

-- 18
(uid, 'Sorrentina (tomate, mozzarella fondue, basilic)', '', 4, 10, 20,
'["400g de gnocchi de pomme de terre (ou penne)","2 boîtes de tomates pelées","2 boules de mozzarella di bufala","3 gousses d''ail","Basilic frais abondant","6 c. à soupe d''huile d''olive","Sel, piment optionnel"]',
'["Faire revenir l''ail dans l''huile d''olive jusqu''à légère coloration.","Ajouter les tomates écrasées à la main. Cuire 15 minutes à feu moyen.","Assaisonner. Déchirer la moitié du basilic dans la sauce.","Cuire les gnocchi : ils remontent à la surface quand ils sont prêts (2-3 min).","Mélanger gnocchi et sauce dans la poêle.","Déchirer la mozzarella en morceaux irréguliers et l''incorporer hors du feu.","Parsemer du basilic restant. Servir immédiatement avant que la mozzarella ne se fige."]',
true, 'approved', 'Incorporer la mozzarella hors du feu — elle doit fondre doucement, pas cuire'),

-- 19
(uid, 'Pasta e ceci (pois chiches, romarin, piment)', '', 4, 10, 30,
'["300g de maltagliati, lagane ou tagliatelles courtes","400g de pois chiches cuits","1 boîte de tomates concassées","2 branches de romarin","4 gousses d''ail","1 piment sec","Huile d''olive extra-vierge généreuse","Sel","Parmesan ou pecorino"]',
'["Faire revenir l''ail et le piment dans une généreuse quantité d''huile d''olive.","Ajouter les tomates et le romarin. Cuire 8 minutes.","Incorporer les pois chiches. Écraser 1/3 grossièrement pour épaissir.","Ajouter 400ml d''eau chaude. Porter à frémissement.","Verser les pâtes directement dans la soupe de pois chiches.","Cuire en remuant jusqu''à ce que les pâtes soient al dente et aient absorbé une partie du bouillon.","Finir avec un filet d''huile d''olive crue et du parmesan. Retirer le romarin."]',
true, 'approved', 'Plat cucina povera romain — épaissir en écrasant les pois chiches, pas avec de la fécule'),

-- 20
(uid, 'Pasta al tonno (thon, câpres, olives, tomate)', '', 4, 10, 15,
'["400g de spaghetti ou linguine","2 boîtes de thon à l''huile d''olive (160g chacune)","1 boîte de tomates concassées","3 gousses d''ail","2 c. à soupe de câpres","80g d''olives noires","1 piment sec","Persil plat frais","Huile d''olive, sel"]',
'["Faire revenir l''ail et le piment dans l''huile d''olive.","Ajouter les tomates concassées. Cuire 10 minutes à feu moyen.","Incorporer câpres et olives. Cuire 3 minutes.","Goûter avant de saler — câpres et thon sont déjà salés.","Égoutter le thon et l''émietter grossièrement dans la sauce. Retirer du feu.","Cuire les pâtes al dente. Les mélanger à la sauce avec un peu d''eau de cuisson.","Parsemer de persil ciselé. Servir sans fromage."]',
true, 'approved', 'Thon incorporé hors du feu pour conserver sa texture — il ne doit pas recuire');

END $$;
