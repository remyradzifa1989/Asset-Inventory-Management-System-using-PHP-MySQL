<?php
/* =====================================================
   AIMS — Escape hatch: BUKA KUNCI sistem (localhost sahaja)
   Guna hanya jika tersilap kunci & tiada Super Admin dapat masuk.
   Selamat: hanya boleh dijalankan dari pelayan itu sendiri.
   PADAM fail ini selepas guna.
   ===================================================== */
require_once __DIR__ . '/includes/config.php';
require_once __DIR__ . '/includes/system_lock.php';

$ip = $_SERVER['REMOTE_ADDR'] ?? '';
$allowed = in_array($ip, ['127.0.0.1', '::1', '0.0.0.0'], true);
if (!$allowed) {
    http_response_code(403);
    die('Akses ditolak. Skrip ini hanya boleh dijalankan dari pelayan (localhost).');
}

sys_lock_ensure($conn);
$done = false;
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $conn->query("UPDATE system_lock SET manual_lock=0, scheduled=0, lock_at=NULL, updated_at=NOW() WHERE id=1");
    $done = true;
}
$locked = system_is_locked($conn);
?><!doctype html><html lang="ms"><head><meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"><title>Buka Kunci · AIMS</title>
<style>body{font-family:Segoe UI,system-ui,sans-serif;background:#f1f5f9;color:#0f172a;display:grid;place-items:center;min-height:100vh;margin:0;padding:24px}
.c{max-width:480px;width:100%;background:#fff;border:1px solid #e2e8f0;border-radius:16px;padding:28px;box-shadow:0 20px 40px -10px rgba(15,23,42,.18)}
h1{font-size:18px;margin:0 0 10px}p{color:#475569;font-size:14px;line-height:1.6}
.btn{display:inline-block;background:linear-gradient(135deg,#10b981,#06b6d4);color:#fff;border:none;border-radius:10px;padding:11px 20px;font-weight:700;cursor:pointer;font-size:14px}
.ok{background:#ecfdf5;border:1px solid #a7f3d0;color:#065f46;padding:10px 12px;border-radius:10px;font-size:14px;margin-bottom:12px}
code{background:#f1f5f9;padding:2px 6px;border-radius:5px}</style></head>
<body><div class="c">
<h1>🔓 Buka Kunci Sistem AIMS</h1>
<?php if ($done): ?>
  <div class="ok">✔ Sistem telah dibuka kunci. Semua pengguna boleh akses semula.</div>
  <p><b>Penting:</b> sila <b>PADAM</b> fail <code>unlock_system.php</code> ini sekarang.</p>
<?php else: ?>
  <p>Status semasa: <b><?= $locked ? 'TERKUNCI' : 'AKTIF (tidak terkunci)' ?></b></p>
  <p>Tekan butang untuk buka kunci sistem (set Aktif semula).</p>
  <form method="post"><button class="btn" type="submit">Buka Kunci Sekarang</button></form>
<?php endif; ?>
</div></body></html>
