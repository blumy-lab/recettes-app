# Rapport technique et fonctionnel — "Mes Recettes" (recettes-app)

*Rapport produit à partir de la lecture exhaustive des 36 fichiers source TypeScript/TSX du projet (hors `node_modules`), des 5 fichiers de schéma SQL versionnés, des 2 Edge Functions et de la configuration Vite/PWA/ESLint. Suite de tests exécutée en direct (`npx vitest run` — 59/59 verts) et build de production vérifié (`npm run build` — 0 erreur TypeScript). État du code analysé : 24 septembre 2026.*

---

## 1. Vue d'ensemble

**Nom :** Mes Recettes (PWA, `short_name` : Recettes) — désignée par ailleurs "Assistant Menu Famille".
**Objectif :** application mobile-first pour familles et colocataires couvrant tout le cycle recette → liste de courses → garde-manger → menu de la semaine, avec IA générative (Gemini) pour automatiser l'import, l'estimation nutritionnelle et la lecture de tickets de caisse.
**Type :** SPA React, Progressive Web App (mode `standalone`, orientation portrait, `share_target` Android).
**Portée :** ciblage local Réunion (tag `local-reunion`, déploiement `https://recettes.pharmaciepitondesgoyaves.re`).

### Stack technique

| Couche | Technologie | Version |
|---|---|---|
| Langage | TypeScript | ~6.0.2 |
| UI framework | React | ^19.2.6 |
| Build tool | Vite | ^8.0.12 |
| Backend-as-a-service | Supabase (`@supabase/supabase-js`) | ^2.108.2 |
| IA générative | Google Gemini 2.5 Flash — appelée **exclusivement côté serveur** via REST direct depuis les Edge Functions | — |
| PWA | `vite-plugin-pwa` + Workbox | ^1.3.0 / ^7.4.1 |
| Offline storage | `idb` (IndexedDB wrapper) | ^8.0.3 |
| CSS | Design system maison, variables oklch, clair/sombre | — |
| Tests | Vitest + @testing-library/react + user-event + jsdom | ^5.0.1 / ^16.3.3 |
| Lint | ESLint + typescript-eslint + eslint-plugin-react-hooks | ^10.x |

### Architecture générale

```
src/
  App.tsx               Point d'entrée, routeur d'état (type View, 12 vues), bottom nav 6 onglets
  main.tsx               Bootstrap React StrictMode
  types.ts                Tous les types TypeScript (12 interfaces)
  store.ts                 DAO unique — 735 lignes, tous les appels Supabase
  scraper.ts             Scraping HTML → recette via JSON-LD (4 proxies en cascade)
  ingredients.ts       Dictionnaire d'autocomplétion (~200 ingrédients FR)
  tags.ts                    Système de tags (26 tags, 5 groupes)
  rayons.ts               Détection automatique du rayon supermarché par mot-clé
  components/           15 composants React
  contexts/                AuthContext (session Supabase)
  hooks/                     useHouseholds, useConfirm, useOfflineSync
  lib/                          gemini.ts, units.ts, pantryMatcher.ts, printRecipe.ts,
                                    offlineQueue.ts, uuid.ts, supabase.ts
  App.css                   Design system complet (2 397 lignes, variables CSS oklch)
seeds/                     16 fichiers SQL de données initiales (recettes françaises)
supabase/functions/   gemini-proxy/, moderate-recipe/ (Edge Functions Deno)
supabase-*.sql            5 fichiers de schéma versionnés (partiel — voir §4)
```

**URL de déploiement :** `https://recettes.pharmaciepitondesgoyaves.re`
**Supabase Project :** `qgcujfrgfjcsdapciucm.supabase.co`

> **Correction par rapport à la version précédente de ce rapport (22 septembre) :** le dépôt contenait alors un système de foyers v1 mort (`HouseholdScreen.tsx`, `lib/household.ts`). Il a depuis été entièrement retiré — seul `useHouseholds.ts` (v2, code d'invitation à 8 caractères) subsiste, intégré à `ProfileScreen`.

---

## 2. Fonctionnalités

### 2.1 Authentification
- Connexion email + mot de passe, inscription avec confirmation email
- OAuth Google et Facebook (redirect vers l'app déployée)
- Récupération de mot de passe par email (mode `PASSWORD_RECOVERY` détecté automatiquement)
- Changement de mot de passe depuis le profil (vérification de l'ancien, sauf en mode récupération)

### 2.2 Recettes — collection personnelle
- Liste paginée (20/page), recherche plein-texte sur le titre, filtres tags cumulables, 5 tris (récent / A→Z / durée / favoris / populaires)
- Création/édition avec ingrédients et étapes réordonnables par glisser-déposer
- Vue de détail : ajustement dynamique des portions (ratio recalculé en direct), étapes numérotées, lien source
- **Photo personnelle sur une recette** *(nouveau)* — upload validé (MIME + 5 Mo max), bucket `recipe-photos`, remplace l'image source sur la fiche, suppression en un clic
- Notes personnelles éditables, mise en favori, suppression, partage natif (`navigator.share` ou presse-papier)
- **Impression** — génère un document HTML autonome mis en page (colonnes, image, notes), ouvert dans un nouvel onglet puis `window.print()`

### 2.3 Mode Cuisine
- Plein écran étape par étape, navigation par swipe tactile ou boutons, barre de progression (portail React vers `document.body`)
- Minuteur intelligent : détection automatique d'une durée dans le texte de l'étape ("10 minutes", "1h30"…), vibration à l'échéance
- Wake Lock (écran maintenu allumé, ré-acquisition automatique au retour au premier plan)

### 2.4 Import de recettes
- Depuis URL : scraping via 4 proxies CORS en cascade + parsing JSON-LD (`@type: Recipe`, support `@graph` et tableaux), détection de 12 sites connus
- Depuis presse-papier : texte libre envoyé à Gemini (via proxy serveur) pour extraction structurée
- Depuis photo : capture appareil photo ou fichier → Gemini multimodal (image base64 + prompt JSON)

### 2.5 Liste de courses
- Gestion multi-listes (création, renommage, suppression), sélecteur avec badges foyer/privé
- Ajout manuel avec autocomplétion fuzzy (~200 ingrédients), rayon prévisualisé
- Fusion intelligente des quantités : conversion entre unités compatibles (g/kg, ml/cl/dl/l), sélection automatique de la meilleure unité — logique extraite en module pur testé (`lib/units.ts`)
- Groupement par rayon (détection auto + changement manuel via picker inline)
- **Scan de ticket de caisse** *(nouveau)* — photo (appareil ou galerie) → Gemini extrait les articles → sélection/édition inline du nom → ajout groupé comme "déjà achetés", rayon auto-détecté
- **Envoi vers le garde-manger** *(nouveau)* — les articles cochés sont transférés en un clic vers `pantry_items` puis retirés de la liste
- Partage par pseudo interne, par lien d'invitation, ou via WhatsApp / SMS / Messenger / presse-papier / `navigator.share` — extrait dans un composant dédié `ShareListModal`
- Synchronisation temps réel (`postgres_changes` sur `shopping_items`)
- Mode offline : file de mutations IndexedDB (add/check/uncheck/delete/update_rayon), replay automatique à la reconnexion (5 tentatives max), indicateur ⏳ sur items en attente

### 2.6 Garde-manger (Pantry) *(nouveau)*
- Inventaire personnel, écran dédié, groupé par rayon, recherche instantanée sur le nom
- Ajout avec autocomplétion : nom, quantité, unité, date d'expiration optionnelle (`<input type="date">`), rayon auto-détecté
- Édition inline (tap sur un article → quantité + date d'expiration)
- Alertes de péremption : badge "⚠️ Expire bientôt" (≤ 3 jours), badge "Expiré" si dépassée
- Priorise automatiquement le planificateur de menus (voir §2.7)

### 2.7 Planificateur de menus (MealPlanner)
- Configuration : 1–14 jours, 1–12 personnes, nb entrées/plats/desserts, filtres alimentaires
- Génération automatique (distribution round-robin par jour, tirage sans remise avec pools séparés par type de repas)
- **Priorisation garde-manger** *(nouveau)* — score de correspondance recette/stock (`scorePantryMatch`, module pur testé) ; les recettes à ≥ 50 % de correspondance sont piochées en priorité, plafonné à 70 % des créneaux d'un même type. Badge "🏠 X %" affiché sur chaque créneau concerné
- Verrouillage de slots, remplacement aléatoire individuel, picker de recette manuel
- Sauvegarde, partage (lien ou pseudo), synchronisation temps réel des `menu_items`
- Export vers liste de courses : consolidation dédupliquée, ajustée au nombre de personnes, aperçu groupé par rayon

### 2.8 Explorer & publication
- Recettes publiques approuvées, pagination serveur, recherche, filtres, 5 tris
- Onglet "Mes favoris" séparé, sauvegarde d'une recette publique dans sa collection (copie profonde)
- Signalement (4 raisons prédéfinies)
- **Publication modérée côté serveur** — toggle privé/public déclenche une Edge Function dédiée (`moderate-recipe`, `service_role`) ; un trigger Postgres empêche tout client de forcer `moderation_status` à `approved`/`rejected` directement (voir §6)

### 2.9 Estimation nutritionnelle
- Estimation IA (calories/protéines/lipides/glucides par portion), recalcul en temps réel si le nombre de portions change

### 2.10 Profil utilisateur
- Pseudo unique (3–20 car.), vérification de disponibilité en temps réel (debounce 500 ms)
- Avatar uploadé (bucket `avatars`, validation MIME jpeg/png/webp/gif + 5 Mo max, URL cache-bustée)
- Statistiques (recettes, favoris, publiées) et 5 badges gamifiés — **tous calculés dynamiquement** depuis des `count` Supabase réels
- Préférences alimentaires propagées automatiquement au planificateur et à l'Explorer
- Thème clair/sombre persisté (`localStorage`, `data-theme`)

### 2.11 Foyers (ménages)
- Création avec code d'invitation aléatoire, rejoindre par code à 8 caractères, multi-foyers
- Gestion des membres (expulsion par le propriétaire), renommage, régénération du code, suppression, quitter
- Palette de 8 couleurs distinctes par foyer
- RLS Supabase : listes de courses et menus partagés automatiquement visibles selon l'appartenance au foyer

### 2.12 PWA / Infrastructure
- Mode standalone portrait, icônes 192/512
- Service worker Workbox : CacheFirst polices Google, NetworkFirst (timeout 10s) API Supabase
- `share_target` : réception d'URL partagée depuis Android, redirigée vers l'import
- Bandeau offline avec compteur de mutations en attente
- Génération d'UUID avec polyfill pour contextes HTTP (Android sans HTTPS)

### Fonctionnalités partielles ou artefacts visibles

- **Onglet "Photo" d'`ImportRecipe` inerte** — le clic change l'état `tab` vers `'photo'` *et* appelle `onImportPhoto()` qui navigue vers un écran séparé ; le contenu du tab `'photo'` lui-même n'est jamais rendu. Vestige inoffensif à nettoyer.
- **Garde-manger sans lien retour vers les recettes** — aucune indication sur une fiche recette du type "3 ingrédients déjà dans votre stock".
- **Garde-manger sans temps réel** — contrairement à `shopping_items`/`menu_items`, `pantry_items` n'a pas de canal Supabase Realtime ; un ajout depuis un autre appareil du foyer n'apparaît qu'au rechargement de l'écran.

---

## 3. Flux utilisateur

### Parcours principal (nouvel utilisateur)

1. Accès à l'URL → `AuthScreen` (login/register/forgot)
2. Authentification → recettes chargées, profil vérifié
3. Si pas de pseudo → bandeau incitatif dans `RecipeList` → Profil → création du pseudo
4. `RecipeList` → import (URL / presse-papier / photo) ou création manuelle
5. `RecipeDetail` → ajustement des portions → ajout à la liste de courses
6. `ShoppingList` → articles triés par rayon, cochés au supermarché, ou scannés depuis un ticket
7. Retour du magasin → articles cochés envoyés au **Garde-manger**
8. `MealPlanner` → configuration → génération priorisée par le stock → sauvegarde → export vers courses

### Tous les écrans (`type View`, 12 valeurs)

| Vue | Composant | Rôle |
|---|---|---|
| `recipes` | `RecipeList` | Collection personnelle avec filtres/tri |
| `detail` | `RecipeDetail` | Fiche recette personnelle |
| `detail-public` | `RecipeDetail` (isPublicView) | Fiche recette publique (Explorer) |
| `create` | `RecipeForm` | Formulaire de création |
| `edit` | `RecipeForm` (initial) | Formulaire d'édition |
| `import` | `ImportRecipe` | Import URL / presse-papier |
| `import-photo` | `ImportPhoto` | Import par photo via Gemini |
| `shopping` | `ShoppingList` | Liste de courses |
| `planner` | `MealPlanner` | Planificateur de menus |
| `explore` | `ExploreScreen` | Recettes publiques de la communauté |
| `pantry` | `PantryScreen` | Garde-manger *(nouveau)* |
| `profile` | `ProfileScreen` | Paramètres, profil, foyers |

### Navigation

- Barre inférieure fixe (`bottom-nav`) à **6 onglets** : Recettes, Courses, Menu, Explorer, **Stock** *(nouveau)*, Profil.
- Masquée dans les vues formulaire/import (`isFullscreen`).
- La vue `detail` mémorise une `returnView` pour retourner vers `recipes` ou `planner`.
- Le planificateur reste monté en permanence (`display:none`) pour conserver son état pendant la consultation d'une fiche recette depuis le menu.
- Les liens d'invitation (`?invite=token` ou `?menu_invite=token`) sont capturés dans `sessionStorage` avant connexion puis traités après authentification.
- Les URLs partagées (`?url=...`) via le share target Android redirigent vers `ImportRecipe`.

---

## 4. Données et état

### Types TypeScript (`src/types.ts`)

| Interface | Champs clés |
|---|---|
| `Ingredient` | `id`, `name`, `quantity`, `unit` |
| `Recipe` | `id`, `title`, `source_url`, `image_url?`, `servings?`, `prep_time?`, `cook_time?`, `ingredients[]`, `steps[]`, `created_at`, `user_notes?`, `user_photo_url?`, `is_public?`, `moderation_status?`, `user_id?`, `is_favorite?`, `favorites_count?`, `tags?[]`, `author_name?` |
| `Profile` | `user_id`, `display_name`, `avatar_url?`, `dietary_filters?[]`, `created_at` |
| `MenuConfig` | `days`, `entrees`, `plats`, `desserts`, `tags[]`, `persons` |
| `MenuSlot` | `day`, `mealType`, `position`, `recipeId`, `recipeTitle`, `locked` |
| `SavedMenu` | `id`, `name`, `days_count`, `config`, `created_at`, `user_id?`, `household_id?`, `is_private?` |
| `ShoppingList` | `id`, `name`, `created_at`, `user_id?`, `household_id?`, `is_private?` |
| `ShoppingItem` | `id`, `name`, `quantity`, `unit`, `checked`, `rayon`, `recipe_id?`, `recipe_title?`, `list_id?` |
| `PantryItem` *(nouveau)* | `id`, `user_id?`, `household_id?`, `name`, `quantity: number\|null`, `unit`, `rayon`, `expires_at: string\|null`, `created_at` |
| `ScannedItem` *(nouveau)* | `name`, `quantity: number\|null`, `unit: string\|null` — résultat brut du scan Gemini |
| `HouseholdMember` | `user_id`, `pseudo`, `avatar_url`, `role` (`owner|member`) |
| `Household` | `id`, `name`, `invite_code`, `color`, `created_by`, `role`, `members[]` |

### Schéma Supabase

**Tables versionnées dans les fichiers SQL du dépôt :**

`recipes`, `shopping_items` (schéma de base), `households`, `household_members` (avec correctif `user_id` nullable pour invitations en attente), **`pantry_items`** *(nouveau)*.

**Tables référencées dans le code mais non définies dans les fichiers SQL du dépôt** (créées directement dans Supabase) :

`profiles`, `shopping_lists`, `menus`, `menu_items`, `recipe_favorites`, `recipe_reports`, `admins`, `shopping_list_shares`, `list_invites`, `menu_invites`, `menu_shares`.

> Une bonne moitié du schéma réel reste donc irrecréable à partir du seul dépôt Git.

**Procédures stockées Supabase RPC utilisées :**
- `get_my_households()`, `create_household(p_name, p_color)`, `join_household_by_code(p_code)`, `regenerate_invite_code(p_household_id)`, `accept_list_invite(invite_token)`, `accept_menu_invite(invite_token)`

**Trigger de sécurité** *(nouveau)* :
- `recipes_block_moderation_override` — lève une exception si un client authentifié tente de modifier `moderation_status` vers `approved`/`rejected` ; seul le `service_role` (utilisé par l'Edge Function de modération) peut le faire.

### Gestion de l'état React

| Niveau | Mécanisme | Données gérées |
|---|---|---|
| App global | `AuthContext` | `user`, `session`, `loading`, `signOut` |
| App global | `HouseholdsContext` (`useHouseholds`) | `households[]`, opérations CRUD foyers |
| App global | `ConfirmProvider` (`useConfirm`) | Modale de confirmation basée promesse — remplace `window.confirm` partout |
| App racine | `useState` dans `AppContent` | `view`, `recipes[]`, `selectedRecipe`, `dietaryFilters`, `isOnline`, `pendingMenuId` |
| Composant | `useState` local | Tous les états d'UI de chaque composant |
| Persistance locale | `localStorage` | `active_shopping_list_id`, `recipeTagFilters`, `profileBannerDismissed`, `theme`, bannières foyer |
| Offline | IndexedDB via `idb` | File de mutations `PendingMutation` (liste de courses uniquement) |

Aucune librairie de state management globale (Redux, Zustand…) — choix cohérent vu la taille du projet.

---

## 5. Intégrations externes

### Supabase

**Auth :** `signInWithPassword`, `signUp`, `signInWithOAuth` (Google/Facebook), `resetPasswordForEmail`, `updateUser`, `getSession`, `onAuthStateChange`

**Realtime :** 3 canaux actifs — `recipes_realtime`, `shopping_items`, `menu_items_{savedMenuId}` (filtré par menu). *Le garde-manger n'a pas de canal dédié.*

**Storage :** 2 buckets publics — `avatars` et **`recipe-photos`** *(nouveau)*, upload avec `upsert: true`, URL publique cachebustée par timestamp.

### Gemini API — architecture en deux couches *(sécurisée depuis la version précédente de ce rapport)*

Tout appel à Gemini passe désormais par une Edge Function Deno ; **aucune clé API n'est exposée côté client**.

| Fonction serveur | Rôle |
|---|---|
| `gemini-proxy` | 5 actions : `extractFromText`, `extractFromImage`, `moderateRecipe` (pré-check client), `estimateNutrition`, **`scanReceipt`** *(nouveau)* — JWT vérifié, clé Gemini lue depuis les secrets serveur |
| `moderate-recipe` | Modération **faisant autorité** — appelée par `publishRecipe()`, tourne avec `service_role` (contourne la RLS) pour écrire `moderation_status` de façon fiable, protégée en amont par le trigger Postgres |

Tous les prompts sont en français, demandent un JSON sans markdown. Le parsing strip le bloc ` ```json ``` ` avant `JSON.parse`.

### Scraper web (`src/scraper.ts`)

Mécanisme : fetch du HTML via 4 proxies en cascade avec timeout 12s :
1. Proxy maison PHP sur le domaine de l'app
2. `api.allorigins.win`
3. `corsproxy.io`
4. `api.codetabs.com`

Parsing : extraction des blocs `<script type="application/ld+json">`, recherche du nœud `@type: Recipe` (y compris `@graph` et arrays). Post-processing des ingrédients via regex avec ~50 unités françaises pour séparer quantité / unité / nom.

### PWA

- `registerType: 'autoUpdate'`, `skipWaiting: true` + `clientsClaim: true`
- Runtime caching : Google Fonts (CacheFirst, 1 an) + Supabase API (NetworkFirst, timeout 10s)
- Share target : `GET /share-target?url=...&title=...`

---

## 6. Qualité du code

> **Changement majeur depuis la version précédente de ce rapport (22 sept.) :** les deux failles les plus sérieuses alors identifiées — clé Gemini exposée côté client et modération contournable — ont depuis été corrigées par une migration vers une architecture serveur à deux couches (§5) plus un trigger Postgres de défense en profondeur. La couverture de tests est passée de 0 à 59 tests.

### Points forts

**Clé Gemini correctement isolée.** Absente de `.env.local` (commentaire explicite l'interdisant), stockée en secret Supabase, lue uniquement par les Edge Functions. Vérifié : `@google/generative-ai` n'est importé nulle part côté client.

**Modération défendue en profondeur.** Edge Function `service_role` + trigger SQL qui bloque toute écriture cliente de `moderation_status` vers `approved`/`rejected` — un contournement par appel direct à l'API Supabase est désormais impossible.

**59 tests automatisés.** Vitest + RTL couvrant la logique pure critique (fusion de quantités, génération de menus, score garde-manger, parsing scraper/durées, normalisation Gemini) *et* 2 composants React avec mocks Supabase complets.

**Logique métier extraite en modules purs.** `lib/units.ts` (`mergeQuantity`) et `lib/pantryMatcher.ts` (`scorePantryMatch`) sont testables sans réseau, ré-exportés depuis `store.ts` pour la compatibilité d'API.

**Gestion offline robuste.** File IndexedDB à 5 types de mutations, retry plafonné à 5, replay automatique à la reconnexion, UI optimiste avec indicateur de synchronisation.

**Confirmations non bloquantes.** `window.confirm()`/`alert()` natifs entièrement remplacés par `useConfirm()` + `ConfirmModal` (promesse, stylisable, non-bloquant) — vérifié sur les 6 composants qui déclenchent des confirmations.

**Pagination serveur.** `getRecipes` et `getPublicRecipes` paginent réellement (20/page, `count: 'exact'`) — pas de chargement intégral de la base.

**Système de tags complet, design system cohérent, réactivité temps réel bien gérée, UX soignée** (drag-and-drop, autocomplétion, deep links d'invitation, partage natif multi-canal).

### Points faibles et dette technique

**Dépendance npm morte.** `@google/generative-ai` (^0.24.1) reste listée dans `package.json` sans plus aucun import dans le code — poids mort du bundle et confusion pour un audit de dépendances.

**Schéma partiellement versionné.** 11 tables sur ~16 existent uniquement dans l'instance Supabase live, sans DDL dans le dépôt — l'environnement n'est pas reproductible de zéro à partir du seul code source.

**Onglet "Photo" inerte.** `ImportRecipe.tsx` — le tab change d'état sans jamais rendre de contenu propre.

**Erreurs réseau silencieuses dans MealPlanner.** `updateMenuSlot`/`replaceMenuSlots` sur régénérer/remplacer/verrouiller se contentent d'un `.catch(console.error)` — aucun retour visible pour l'utilisateur en cas d'échec.

**Pas de rate limiting client sur Gemini.** Un double-clic sur "Analyser" (scan de recette, ticket, estimation nutritionnelle) peut déclencher plusieurs appels facturés sans déduplication.

**`eslint-disable` ciblés.** 2 occurrences de `react-hooks/exhaustive-deps` désactivées (`CookingMode.tsx`, `MealPlanner.tsx`) — dépendances volontairement omises, pattern fragile en cas de refactor futur.

**Aucun test end-to-end ni CI.** Pas de `.github/workflows` dans le dépôt — les 59 tests unitaires/composants ne sont exécutés qu'à la main (`npm test`), aucune vérification automatique avant déploiement.

### Couverture de tests — détail

| Fichier | Couvre |
|---|---|
| `lib/units.test.ts` | `mergeQuantity` — consolidation multi-recettes |
| `lib/parseStepDuration.test.ts` | Parsing durées françaises (mode cuisine) |
| `lib/gemini.test.ts` | `normalizeScannedItems` — transformation résultat scan ticket |
| `store.test.ts` | `mergeQuantity` — 9 cas limites (unités incompatibles, valeurs vides…) |
| `scraper.test.ts` | `parseDuration` ISO 8601, `parseJsonLd` (formats @graph/array/HTML-encodé) |
| `planner.test.ts` | `poolForType`, `scorePantryMatch`, `generateSlots` (dont priorisation garde-manger) |
| `components/RecipeList.test.tsx` | État vide, debounce recherche 400ms, sélection d'une recette |
| `components/ShoppingList.test.tsx` | Séparation cochés/non-cochés, confirmation de suppression |

**Non couvert :** 13 des 15 composants (seuls RecipeList et ShoppingList ont des tests), aucune Edge Function, aucun test d'intégration Supabase réel (tout est mocké), aucun test e2e (Playwright/Cypress absents).

---

## 7. Ce qui manque ou pourrait être amélioré

### Fonctionnalités attendues mais absentes

- **Notifications push** — aucune alerte quand un collaborateur coche un article ou qu'un article du garde-manger expire
- **Lien garde-manger ↔ recette** — pas d'indication sur une fiche recette du type "vous avez déjà 3 des 6 ingrédients"
- **Décrément automatique du stock** — cuisiner une recette ne retire rien du garde-manger ; seul l'ajout depuis la liste de courses l'alimente
- **Historique de planning** — les menus passés ne sont pas consultables une fois remplacés
- **Gestion de conflit sur listes partagées** — "dernière écriture gagne", sans fusion ni détection de collision
- **Consolidation multi-menus** — l'export vers courses ne traite qu'un menu à la fois
- **Avatar sans génération automatique** (initiales) permanente dans Supabase Storage — seul l'upload manuel est possible

### Bugs ou comportements non gérés visibles

- **Mise à jour PWA silencieuse** — `autoUpdate` + `skipWaiting` + `clientsClaim` peuvent créer un état incohérent si l'utilisateur a plusieurs onglets ouverts pendant un déploiement
- **File offline limitée aux courses** — les modifications de recettes ou du garde-manger effectuées hors-ligne sont perdues silencieusement (pas de queue dédiée)
- **Validation d'URL d'image faible** — le formulaire de recette accepte une URL invalide ; seul `onError` masque l'aperçu, l'URL erronée reste enregistrée en base
- **Scan de ticket sans garde-fou de format** — un ticket illisible ou non standard ne produit qu'un message générique "aucun article détecté", sans indication de la cause (photo floue / ticket thermique effacé / langue non française)
- **`normalizeIngredients` dans `store.ts`** gère le cas où `ingredients` est un tableau de strings (ancienne structure), mais la conversion `gen-{i}` pour les IDs pourrait provoquer des collisions lors d'une fusion ultérieure

---

*Version précédente de ce rapport : 22 septembre 2026. Mise à jour du 24 septembre 2026 après ajout du garde-manger, du scan de ticket de caisse, de la photo personnelle sur recette, de l'extraction du partage de liste en composant dédié, de la suite de tests (0 → 59), et de la sécurisation complète de l'intégration Gemini.*
