<?php
header('Content-Type: text/html; charset=utf-8');

$appUrl = 'https://recettes.pharmaciepitondesgoyaves.re';

// Validation stricte de l'id (doit ressembler à un UUID) avant toute requête
$id = isset($_GET['id']) ? $_GET['id'] : '';
if (!preg_match('/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i', $id)) {
    header('Location: ' . $appUrl);
    exit;
}

$supabaseUrl = 'https://qgcujfrgfjcsdapciucm.supabase.co'; // VITE_SUPABASE_URL
$anonKey = 'sb_publishable_Rpws55rOr96s9Fq7GIvjxQ_7bEKeqwm'; // VITE_SUPABASE_ANON_KEY — déjà publique dans le bundle JS

// Lecture seule, filtrée is_public + approved (même filtre que la policy RLS — défense en profondeur)
$endpoint = $supabaseUrl . '/rest/v1/recipes?id=eq.' . urlencode($id)
    . '&is_public=eq.true&moderation_status=eq.approved'
    . '&select=title,image_url,user_photo_url,servings,prep_time,cook_time';

$ch = curl_init($endpoint);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    'apikey: ' . $anonKey,
    'Authorization: Bearer ' . $anonKey,
]);
curl_setopt($ch, CURLOPT_TIMEOUT, 8);
curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
$body = curl_exec($ch);
$error = curl_error($ch);
curl_close($ch);

$targetUrl = $appUrl . '/?public_recipe=' . urlencode($id);

$rows = ($error || !$body) ? null : json_decode($body, true);
if (!$rows || count($rows) === 0) {
    header('Location: ' . $appUrl);
    exit;
}

$recipe = $rows[0];
$title = htmlspecialchars($recipe['title'] ?? 'Recette', ENT_QUOTES);
$image = htmlspecialchars($recipe['user_photo_url'] ?: ($recipe['image_url'] ?: ''), ENT_QUOTES);
$targetUrlEsc = htmlspecialchars($targetUrl, ENT_QUOTES);

$descParts = [];
$totalTime = (int) ($recipe['prep_time'] ?? 0) + (int) ($recipe['cook_time'] ?? 0);
if ($totalTime > 0) { $descParts[] = $totalTime . ' min'; }
if (!empty($recipe['servings'])) { $descParts[] = $recipe['servings'] . ' pers.'; }
$description = $descParts
    ? htmlspecialchars('Découvrez cette recette sur Mes Recettes — ' . implode(' · ', $descParts), ENT_QUOTES)
    : 'Découvrez cette recette sur Mes Recettes';
?>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title><?= $title ?> — Mes Recettes</title>
  <meta property="og:title" content="<?= $title ?>">
  <meta property="og:description" content="<?= $description ?>">
  <?php if ($image): ?><meta property="og:image" content="<?= $image ?>"><?php endif; ?>
  <meta property="og:url" content="<?= $targetUrlEsc ?>">
  <meta property="og:type" content="website">
  <meta name="twitter:card" content="summary_large_image">
  <meta http-equiv="refresh" content="0;url=<?= $targetUrlEsc ?>">
</head>
<body>
  <p>Redirection vers <a href="<?= $targetUrlEsc ?>">la recette</a>…</p>
</body>
</html>
