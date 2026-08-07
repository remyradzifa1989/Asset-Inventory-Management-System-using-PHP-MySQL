# AIMS - Asset Inventory Management System

Premium PHP Native + MySQL enterprise system with glassmorphism UI, dashboard, charts, full CRUD, attachments, borrow & maintenance modules, role-based access, and reports.

## Installation

1. **Copy** the entire `aims/` folder into your web root (e.g. `htdocs/aims/` for XAMPP, `www/aims/` for WAMP, or `/var/www/html/aims/` for Linux).
2. **Create database** in phpMyAdmin and import `database/aims.sql`. This creates the `aims_db` database, all tables, and sample data.
3. **Edit `includes/config.php`** — set your DB credentials:
   ```php
   define('DB_HOST', 'localhost');
   define('DB_USER', 'root');
   define('DB_PASS', '');
   define('DB_NAME', 'aims_db');
   ```
4. **Set permissions** on the `uploads/` folder (Linux: `chmod 775 uploads/`).
5. **Open** `http://localhost/aims/` in your browser.
6. **First-time only** — visit `http://localhost/aims/auth/reset_passwords.php` once to set the default passwords properly, then **delete that file**.

## Default Login

| Role  | Username | Password   |
|-------|----------|------------|
| ADMIN | `admin`  | `admin123` |
| STAFF | `staff`  | `staff123` |

## Folder Structure

```
aims/
├── auth/               # Login, logout
├── assets/             # Asset CRUD + export
├── borrow/             # Borrow records
├── maintenance/        # Maintenance records
├── reports/            # Report dashboard + activity logs
├── users/              # User management (admin only)
├── uploads/            # Asset images & file attachments
├── includes/           # config.php, header.php, footer.php
├── database/           # aims.sql (full schema + sample data)
├── assets_static/      # CSS, JS, img
├── ajax/               # (reserved for AJAX endpoints)
├── api/                # (reserved for API endpoints)
├── index.php           # Redirects to dashboard
└── dashboard.php       # Main dashboard with charts
```

## Modules Included

- **Authentication** – glassmorphism login, role-based session, auto-logout, secure routes
- **Dashboard** – 6 animated stat cards, doughnut + bar charts (Chart.js), latest borrow records, maintenance alerts
- **Asset Management** – full CRUD with hardware specs, location, status, multi-file attachments (JPG/PNG/PDF/DOCX/XLSX), image previews, export Excel/PDF/Print
- **Borrow Module** – borrow form, return processing, auto status sync, late return detection
- **Maintenance Module** – maintenance form, technician, cost tracking, status workflow
- **Reports** – charts by category/department/status, total cost, downloadable Excel & PDF reports
- **User Management** – ADMIN can create/edit/delete users with password hashing
- **Activity Logs** – all actions tracked
- **Dark Mode** – toggle in topbar, persisted in localStorage
- **Responsive** – mobile sidebar drawer
- **DataTables + SweetAlert** – AJAX search, sort, paginate, confirm delete

## Tech Stack

- PHP 7.4+ (Native, no framework)
- MySQL 5.7+ / MariaDB
- Bootstrap 5.3 + Bootstrap Icons
- DataTables, Chart.js, SweetAlert2 (all CDN — no install needed)
- Custom premium CSS (glassmorphism + gradients)

## Security Notes

- Passwords stored with `password_hash()` (bcrypt)
- Prepared statements throughout (SQL-injection safe)
- Session-based auth with role checks
- File upload whitelist (jpg/png/pdf/docx/xlsx)
- `htmlspecialchars()` output escaping
- Delete `auth/reset_passwords.php` after first run
- Change default passwords immediately in production

- <img width="1031" height="793" alt="Screenshot 2026-08-07 162133" src="https://github.com/user-attachments/assets/86527677-100f-4c76-9ea3-3de94ef5c310" />

<img width="1892" height="891" alt="Screenshot 2026-08-07 162155" src="https://github.com/user-attachments/assets/8d14a11e-6fea-44fe-8c88-55dbf1f839f5" />

<img width="1884" height="892" alt="Screenshot 2026-08-07 162215" src="https://github.com/user-attachments/assets/104ef516-ef6e-4916-9be5-c80661b56df3" />

<img width="1890" height="892" alt="Screenshot 2026-08-07 162814" src="https://github.com/user-attachments/assets/3d122d18-379a-407c-bd2d-cda493ccc897" />

<img width="1908" height="894" alt="Screenshot 2026-08-07 162958" src="https://github.com/user-attachments/assets/8d95f2e7-d471-41f1-be9c-847bcf6f0a70" />

<img width="1896" height="877" alt="Screenshot 2026-08-07 162233" src="https://github.com/user-attachments/assets/c567f5d8-cc75-410b-b2b5-00ef8949fe17" />

<img width="1896" height="885" alt="Screenshot 2026-08-07 162248" src="https://github.com/user-attachments/assets/bb0fbee7-c8fa-46bd-b9eb-2e6ffb6d1995" />

<img width="1895" height="892" alt="Screenshot 2026-08-07 162305" src="https://github.com/user-attachments/assets/6ce4428d-9588-4215-a70e-1e5bb3762b36" />

<img width="1872" height="893" alt="Screenshot 2026-08-07 162319" src="https://github.com/user-attachments/assets/de00b977-baf5-456d-b469-06f475910864" />

<img width="1895" height="889" alt="Screenshot 2026-08-07 162332" src="https://github.com/user-attachments/assets/04b91fbd-7fb3-447d-94d3-6d2606c90443" />

<img width="1887" height="878" alt="Screenshot 2026-08-07 162348" src="https://github.com/user-attachments/assets/efa49544-9ad1-4087-b054-b5ba4ebd69b0" />

<img width="1882" height="890" alt="Screenshot 2026-08-07 162407" src="https://github.com/user-attachments/assets/14652012-7aae-47ab-9e8e-c446dff8385f" />

<img width="1892" height="881" alt="Screenshot 2026-08-07 162423" src="https://github.com/user-attachments/assets/b3f4c717-63eb-4c52-992f-efeb0499a2e6" />

<img width="1900" height="889" alt="Screenshot 2026-08-07 162437" src="https://github.com/user-attachments/assets/f389f8ba-4be7-4e85-acf0-5f02e2f5ad14" />

<img width="1881" height="893" alt="Screenshot 2026-08-07 162454" src="https://github.com/user-attachments/assets/9624fcbe-058f-476b-8fa1-90f360355ae0" />
