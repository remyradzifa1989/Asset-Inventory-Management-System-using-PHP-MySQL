<?php
/* =====================================================
   AIMS — QR image endpoint (untuk export Excel / PDF)
   Menjana QR sebagai PNG untuk sesuatu rekod.
   Awam (tiada login) — hanya "encode" URL view yang sah.
   Guna: qr_img.php?t=assets&id=12&s=140
   Bergantung pada library QR (endroid/qr-code atau bacon-qr-code)
   via composer. Jika tiada, pulangkan PNG lutsinar (tidak pecah).
   ===================================================== */
require_once __DIR__ . '/includes/qr_boot.php';

$type = in_array($_GET['t'] ?? '', ['assets', 'borrow', 'maintenance'], true) ? $_GET['t'] : 'assets';
$id   = (int)($_GET['id'] ?? 0);
$size = max(80, min(400, (int)($_GET['s'] ?? 160)));
$data = qr_link($type, $id);

header('Cache-Control: public, max-age=86400');

$autoload = __DIR__ . '/vendor/autoload.php';
if (is_file($autoload)) require_once $autoload;

/* 1) endroid/qr-code (Builder API — v4/v5) */
try {
    if (class_exists('Endroid\\QrCode\\Builder\\Builder')) {
        $b = \Endroid\QrCode\Builder\Builder::create()->data($data)->size($size)->margin(2);
        $result = $b->build();
        header('Content-Type: ' . $result->getMimeType());
        echo $result->getString();
        exit;
    }
} catch (\Throwable $e) { /* cuba yang lain */ }

/* 2) bacon/bacon-qr-code + GD */
try {
    if (class_exists('BaconQrCode\\Writer')
        && class_exists('BaconQrCode\\Renderer\\Image\\GdImageBackEnd')) {
        $renderer = new \BaconQrCode\Renderer\ImageRenderer(
            new \BaconQrCode\Renderer\RendererStyle\RendererStyle($size, 2),
            new \BaconQrCode\Renderer\Image\GdImageBackEnd()
        );
        $writer = new \BaconQrCode\Writer($renderer);
        header('Content-Type: image/png');
        echo $writer->writeString($data);
        exit;
    }
} catch (\Throwable $e) { /* fall through */ }

/* 3) Fallback — PNG lutsinar 1x1 (tidak pecah layout) */
header('Content-Type: image/png');
echo base64_decode('iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNk+A8AAQUBAScY42YAAAAASUVORK5CYII=');
