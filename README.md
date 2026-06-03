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
