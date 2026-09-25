<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET');
header('Content-Type: text/html; charset=utf-8');

$url = isset($_GET['url']) ? $_GET['url'] : '';
if (!$url) { http_response_code(400); echo 'Missing url'; exit; }

// Sécurité : uniquement HTTP/HTTPS
if (!preg_match('/^https?:\/\//i', $url)) {
    http_response_code(403); echo 'Invalid URL'; exit;
}

// Bloquer les URLs internes
$host = parse_url($url, PHP_URL_HOST);
if (!$host || preg_match('/^(localhost|127\.|192\.168\.|10\.|172\.(1[6-9]|2[0-9]|3[01])\.)/i', $host)) {
    http_response_code(403); echo 'Forbidden'; exit;
}

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
curl_setopt($ch, CURLOPT_MAXREDIRS, 5);
curl_setopt($ch, CURLOPT_TIMEOUT, 20);
curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Linux; Android 13; Pixel 7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.210 Mobile Safari/537.36');
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_ENCODING, '');  // accepte gzip/deflate/br automatiquement
curl_setopt($ch, CURLOPT_COOKIEFILE, '');  // active le jar de cookies
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
    'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8',
    'Accept-Language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7',
    'Accept-Encoding: gzip, deflate, br',
    'Cache-Control: no-cache',
    'Pragma: no-cache',
    'Upgrade-Insecure-Requests: 1',
    'Sec-Fetch-Dest: document',
    'Sec-Fetch-Mode: navigate',
    'Sec-Fetch-Site: none',
    'Sec-Fetch-User: ?1',
    'Sec-Ch-Ua: "Not_A Brand";v="8", "Chromium";v="120", "Google Chrome";v="120"',
    'Sec-Ch-Ua-Mobile: ?1',
    'Sec-Ch-Ua-Platform: "Android"',
    'DNT: 1',
));

$body = curl_exec($ch);
$code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
$error = curl_error($ch);
curl_close($ch);

if ($error) { http_response_code(502); echo 'cURL error: ' . $error; exit; }
if ($code === 403) { http_response_code(403); echo 'Site bloqué (403 Forbidden) : ' . $host; exit; }
if (!$body || $code >= 400) { http_response_code(502); echo 'Fetch failed: HTTP ' . $code; exit; }

echo $body;
