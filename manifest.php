<?php
/* =====================================================
   AIMS — Web App Manifest (PWA)
   Dihidang sebagai PHP supaya Content-Type betul tanpa perlu
   ubah konfigurasi server. Tidak perlu login (fail awam).
   URL adalah relatif — betul untuk domain root ATAU subfolder.
   ===================================================== */
header('Content-Type: application/manifest+json; charset=utf-8');
header('Cache-Control: public, max-age=86400');
?>
{
  "name": "AIMS — Asset Inventory Management System",
  "short_name": "AIMS",
  "description": "Sistem Pengurusan Inventori Aset KOWAMAS",
  "id": "./",
  "start_url": "dashboard.php",
  "scope": "./",
  "display": "standalone",
  "display_override": ["standalone", "minimal-ui"],
  "orientation": "any",
  "lang": "ms",
  "dir": "ltr",
  "theme_color": "#0f172a",
  "background_color": "#1e293b",
  "categories": ["business", "productivity"],
  "icons": [
    {
      "src": "assets/images/web-app-manifest-192x192.png",
      "sizes": "192x192",
      "type": "image/png",
      "purpose": "any"
    },
    {
      "src": "assets/images/web-app-manifest-192x192.png",
      "sizes": "192x192",
      "type": "image/png",
      "purpose": "maskable"
    },
    {
      "src": "assets/images/web-app-manifest-512x512.png",
      "sizes": "512x512",
      "type": "image/png",
      "purpose": "any"
    },
    {
      "src": "assets/images/web-app-manifest-512x512.png",
      "sizes": "512x512",
      "type": "image/png",
      "purpose": "maskable"
    },
    {
      "src": "assets/images/apple-touch-icon.png",
      "sizes": "180x180",
      "type": "image/png",
      "purpose": "any"
    }
  ],
  "shortcuts": [
    {
      "name": "Scan QR",
      "short_name": "Scan",
      "description": "Imbas QR aset / hardware",
      "url": "scan.php",
      "icons": [{ "src": "assets/images/web-app-manifest-192x192.png", "sizes": "192x192" }]
    },
    {
      "name": "Assets",
      "short_name": "Assets",
      "description": "Senarai aset",
      "url": "assets/list.php",
      "icons": [{ "src": "assets/images/web-app-manifest-192x192.png", "sizes": "192x192" }]
    },
    {
      "name": "Dashboard",
      "short_name": "Dashboard",
      "description": "Papan pemuka",
      "url": "dashboard.php",
      "icons": [{ "src": "assets/images/web-app-manifest-192x192.png", "sizes": "192x192" }]
    }
  ]
}
