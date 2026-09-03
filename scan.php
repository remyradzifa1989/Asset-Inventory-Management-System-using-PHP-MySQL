<?php
require_once __DIR__ . '/includes/config.php';
require_login();
$page_title = 'Scan QR';
$active = 'scan';
include __DIR__ . '/includes/header.php';
?>

<style>
.scan-wrap { max-width: 560px; margin: 0 auto; }
#reader { border-radius: 14px; overflow: hidden; }
#reader video { border-radius: 14px; }
.scan-status { min-height: 24px; }
.scan-hint { font-size: 13px; color: #6c757d; }
</style>

<div class="scan-wrap">
  <div class="aims-card">
    <div class="text-center mb-3">
      <div class="form-section-title justify-content-center d-flex align-items-center gap-2">
        <i class="bi bi-qr-code-scan"></i> Scan QR AIMS
      </div>
      <p class="scan-hint mb-0">Halakan kamera ke QR pada komputer / hardware. Sistem akan buka maklumat aset secara automatik.</p>
    </div>

    <div id="reader"></div>

    <div class="scan-status text-center mt-3">
      <div id="scanMsg" class="small"></div>
    </div>

    <hr>

    <div class="text-center">
      <p class="scan-hint mb-2">Tiada kamera? Tampal pautan / kod QR di sini:</p>
      <div class="input-group input-group-sm">
        <input type="text" id="manualInput" class="form-control" placeholder="https://aims.kowamas.com/assets/view.php?id=1">
        <button class="btn btn-gradient" id="manualGo" type="button"><i class="bi bi-arrow-right-circle"></i> Buka</button>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/html5-qrcode@2.3.8/html5-qrcode.min.js"></script>
<script>
(function () {
  var BASE_URL = <?= json_encode(BASE_URL) ?>;
  var msg = document.getElementById('scanMsg');

  function setMsg(text, type) {
    msg.textContent = text;
    msg.className = 'small ' + (type === 'ok' ? 'text-success' : (type === 'err' ? 'text-danger' : 'text-muted'));
  }

  // Terima hanya URL view AIMS (assets/borrow/maintenance). Pulangkan URL tempatan atau null.
  function resolveAims(text) {
    if (!text) return null;
    var m = String(text).match(/\/(assets|borrow|maintenance)\/view\.php\?id=(\d+)/i);
    if (!m) return null;
    return BASE_URL + m[1] + '/view.php?id=' + m[2];
  }

  function handleDecoded(text, stop) {
    var dest = resolveAims(text);
    if (dest) {
      setMsg('QR sah — membuka maklumat...', 'ok');
      if (typeof stop === 'function') { try { stop(); } catch (e) {} }
      window.location.href = dest;
    } else {
      setMsg('QR ini bukan milik sistem AIMS. Sila imbas QR aset/borrow/maintenance yang sah.', 'err');
    }
  }

  // Manual fallback
  document.getElementById('manualGo').addEventListener('click', function () {
    handleDecoded(document.getElementById('manualInput').value.trim());
  });
  document.getElementById('manualInput').addEventListener('keydown', function (e) {
    if (e.key === 'Enter') { e.preventDefault(); document.getElementById('manualGo').click(); }
  });

  if (typeof Html5QrcodeScanner === 'undefined') {
    setMsg('Modul kamera gagal dimuatkan. Guna kotak manual di atas.', 'err');
    return;
  }

  // supportedScanTypes default = [camera, file], jadi tak perlu rujuk pemalar
  // Html5QrcodeScanType (elak beza antara versi library).
  var scanner = new Html5QrcodeScanner('reader', {
    fps: 10,
    qrbox: { width: 250, height: 250 },
    rememberLastUsedCamera: true,
    aspectRatio: 1.0
  }, /* verbose= */ false);

  var handled = false;
  scanner.render(function (decodedText) {
    if (handled) return;
    handled = true;
    handleDecoded(decodedText, function () { scanner.clear(); });
    // benarkan cuba lagi jika tidak sah
    setTimeout(function () { handled = false; }, 1500);
  }, function () { /* abaikan ralat imbas per-frame */ });

  setMsg('Menunggu QR...', 'muted');
})();
</script>

<?php include __DIR__ . '/includes/footer.php'; ?>
