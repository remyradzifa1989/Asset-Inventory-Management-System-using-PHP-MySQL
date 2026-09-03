/* =====================================================
   AIMS — Service Worker (PWA)
   Strategi:
   - Navigasi (halaman PHP): NETWORK-FIRST → fallback offline.html
     (tidak cache HTML → elak data basi / silang-pengguna)
   - Aset statik same-origin (css/js/img/font): stale-while-revalidate
   - CDN (bootstrap, chart.js, dll): stale-while-revalidate
   - Permintaan dinamik lain (export/delete/ajax): biar network normal
   ===================================================== */

const VERSION    = 'aims-v2';
const CACHE_CORE = 'aims-core-' + VERSION;
const CACHE_RUN  = 'aims-runtime-' + VERSION;

// Aset teras untuk precache (relatif kepada lokasi sw.js = root app)
const CORE_ASSETS = [
  './offline.html',
  './manifest.php',
  './assets_static/css/style.css',
  './assets_static/js/app.js',
  './assets/images/web-app-manifest-192x192.png',
  './assets/images/web-app-manifest-512x512.png',
  './assets/images/apple-touch-icon.png',
  './assets/images/favicon.ico',
  './assets/images/KOWAMAS-LOGO%20(1).png'
];

const STATIC_RE = /\.(?:css|js|png|jpe?g|gif|svg|ico|webp|woff2?|ttf|eot)(?:\?.*)?$/i;

// ── INSTALL: precache (setiap item cuba individu supaya 1 gagal tak batalkan) ──
self.addEventListener('install', (event) => {
  event.waitUntil((async () => {
    const cache = await caches.open(CACHE_CORE);
    await Promise.allSettled(CORE_ASSETS.map((url) => cache.add(url)));
    self.skipWaiting();
  })());
});

// ── ACTIVATE: buang cache lama ──
self.addEventListener('activate', (event) => {
  event.waitUntil((async () => {
    const keys = await caches.keys();
    await Promise.all(
      keys.filter((k) => k !== CACHE_CORE && k !== CACHE_RUN)
          .map((k) => caches.delete(k))
    );
    await self.clients.claim();
  })());
});

// Optional: benarkan halaman minta SW baharu aktif serta-merta
self.addEventListener('message', (e) => {
  if (e.data === 'SKIP_WAITING') self.skipWaiting();
});

// ── FETCH ──
self.addEventListener('fetch', (event) => {
  const req = event.request;
  if (req.method !== 'GET') return;

  let url;
  try { url = new URL(req.url); } catch (e) { return; }
  if (url.protocol !== 'http:' && url.protocol !== 'https:') return;

  const sameOrigin = url.origin === self.location.origin;

  // 1) Navigasi halaman → network-first, fallback offline.html
  if (req.mode === 'navigate') {
    event.respondWith((async () => {
      try {
        return await fetch(req);
      } catch (e) {
        const cache = await caches.open(CACHE_CORE);
        const off = await cache.match('./offline.html');
        return off || new Response('Offline', { status: 503, statusText: 'Offline' });
      }
    })());
    return;
  }

  // 2) Aset statik (same-origin) ATAU CDN cross-origin → stale-while-revalidate
  const isStatic = STATIC_RE.test(url.pathname);
  const isCDN = !sameOrigin && /(^|\.)(jsdelivr\.net|cdnjs\.cloudflare\.com|cloudflare\.com|jquery\.com|datatables\.net|unpkg\.com)$/i.test(url.hostname);

  if ((sameOrigin && isStatic) || isCDN) {
    event.respondWith((async () => {
      const cache = await caches.open(CACHE_RUN);
      const cached = await cache.match(req);
      const network = fetch(req).then((res) => {
        if (res && (res.status === 200 || res.type === 'opaque')) {
          cache.put(req, res.clone()).catch(() => {});
        }
        return res;
      }).catch(() => null);
      return cached || (await network) || new Response('', { status: 504 });
    })());
    return;
  }

  // 3) Lain-lain (export/delete/ajax PHP) → biar network normal (tak intercept)
});
