# AIMS — Design System (Emerald/Teal)

Panduan supaya **setiap halaman & ciri masa depan kekal seragam**. Semua gaya
berpusat di `assets_static/css/style.css` (dimuat pada setiap halaman melalui
`includes/header.php`). Ubah token di situ → seluruh app berubah serentak.

## 1. Design tokens (CSS variables) — `:root` dalam style.css
**Warna / accent**
- `--accent` `#10b981` (emerald) · `--accent-600` `#059669` · `--accent-2` `#06b6d4` (cyan)
- `--grad-primary` = emerald → cyan (butang jenama, sidebar aktif, ikon tajuk)
- `--ring` = halo fokus emerald

**Permukaan & teks:** `--bg`, `--card`, `--text`, `--muted`, `--border`, `--soft`
**Elevation:** `--shadow-sm` / `--shadow-md` / `--shadow-lg` / `--shadow-accent`
**Radius:** `--radius` (14) · `--radius-sm` (10) · `--radius-lg` (18) · `--radius-pill`
**Spacing:** `--sp-1`…`--sp-6` (0.25rem → 2rem)
**Font:** `--font` (system UI / Inter / Plus Jakarta Sans)

> Mod gelap: `body.dark` menetapkan semula token permukaan secara automatik.

## 2. Komponen sedia guna (kelas CSS)
| Guna | Kelas |
|------|-------|
| Kad | `.aims-card` |
| Tajuk halaman | `.page-head` + `.ph-title`/`.ph-sub`/`.ph-actions` |
| Tajuk seksyen | `.sec-title` / `.form-section-title` (ikon = accent) |
| Kad statistik | `.stat-card.bg-1..6` + `.stat-label`/`.stat-value`/`.stat-icon` |
| Butang jenama (CTA) | `.btn-gradient` |
| Bar eksport | `.export-bar` + `.btn-export`/`.btn-excel`/`.btn-pdf` |
| Kad penapis | `.filter-card` + `.filter-title` + `.active-filters` + `.filter-badge`/`.chip` |
| Keadaan kosong | `.empty-state` |
| Jadual | `.aims-table` (DataTables ditema automatik) |
| Badge status | `.badge-status` + `.b-<status>` (lihat bawah) |
| Borang | `.form-section` + `.form-section-title` |
| Detail | `.detail-grid` + `.detail-item` (`.lbl`/`.val`) |

Butang Bootstrap (`.btn`, `.btn-primary`, `.btn-outline-primary`, `.btn-success`),
`.form-control`, `.form-select`, `.card`, `.modal`, `.alert`, pagination & tabs
sudah **diselaraskan** ke accent emerald secara global — tak perlu CSS tambahan.

## 3. Badge status (satu sumber)
`.b-available .b-used-by .b-borrowed .b-maintenance .b-damaged .b-disposed
.b-outdated .b-pending .b-approved .b-returned .b-late-return .b-in-progress
.b-completed` — semua ditakrif SEKALI di style.css. **Jangan** tulis semula
gaya badge dalam halaman.

## 4. Komponen PHP boleh guna semula — `includes/ui.php`
Dimuat pada setiap halaman (via header.php). Guna untuk ciri baharu:
```php
ui_page_head('Assets', [
  'icon' => 'bi-pc-display',
  'sub'  => 'Urus semua aset',
  'actions' => '<a class="btn btn-gradient"><i class="bi bi-plus-lg"></i> New</a>',
]);

echo ui_badge($row['status']);          // badge status seragam
ui_stat('Jumlah Aset', 1280, 'bi-pc-display', 1);   // kad statistik
ui_empty('Tiada rekod.');               // keadaan kosong
```

## 5. Peraturan untuk ciri masa depan
1. **Guna kelas/komponen di atas** — jangan cipta gaya sendiri untuk perkara
   yang sudah ada (butang, kad, badge, jadual, borang, modal).
2. Perlu warna? Guna **token** (`var(--accent)`, `var(--muted)`, …), bukan hex
   keras. Ini memastikan mod gelap & penjenamaan konsisten.
3. Ikon: **Bootstrap Icons** (`bi bi-*`) sahaja.
4. Jarak: guch skala `--sp-*` / kelas Bootstrap (`mb-3`, `gap-2`, …).
5. Status → sentiasa `ui_badge()` atau `.badge-status .b-*`.

## 6. Fail teras
- `assets_static/css/style.css` — design system (token + komponen)
- `includes/ui.php` — komponen PHP
- `includes/header.php` / `footer.php` — shell dikongsi (nav, topbar, PWA)

## 7. Enterprise shell (global, semua halaman)
- **Navigasi responsif:** topbar sticky, sidebar boleh kolaps, hamburger mobile
  + **backdrop** (klik luar/pautan/ESC untuk tutup). Tiada horizontal-scroll.
- **Breadcrumb:** automatik di bawah topbar (Home / <tajuk halaman>).
- **Tema:** Light / Dark (kekal via `localStorage`; ikon bulan↔matahari).
- **Jadual responsif:** `.aims-table` skrol mendatar dalam kad (bukan halaman).
- **Skeleton loading:** kelas `.skeleton .line/.title/.block` + `AIMS_skeleton(el,n)`.
- **Toast:** `toast('success'|'error'|'warning'|'info','mesej')` (SweetAlert2).
- **Sahkan padam:** tambah kelas `.confirm-delete` pada pautan/butang.
- **Halaman ralat berjenama:** `403.php`, `404.php`, `500.php`, `maintenance.php`
  (self-contained, responsif; disambung via `.htaccess ErrorDocument`).

## 8. Peta jalan (fasa seterusnya — perlu backend/DB baharu)
Item berikut BUKAN sekadar UI — perlu jadual/logik baharu, dibuat berfasa:
- Dashboard lanjutan (warranty expiry, upcoming maintenance, movement timeline,
  pending approval, calendar, announcements).
- Jejak audit aset (audit trail), sejarah pindah/agih, komen, tag, galeri imej.
- Modul Profil (avatar, tukar kata laluan, keutamaan, sejarah log masuk).
- Pusat notifikasi, aliran kelulusan, carian global (index), bulk actions.
- Borang berperingkat (step form), auto-save draf, meter kekuatan kata laluan.
- Amaran session timeout / auto-logout.
