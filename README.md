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



<img width="1031" height="793" alt="Screenshot 2026-08-07 162133" src="https://github.com/user-attachments/assets/49547182-d545-4bc8-93ed-46738b6ce27c" />

<img width="1892" height="891" alt="Screenshot 2026-08-07 162155" src="https://github.com/user-attachments/assets/6cc1ab02-1205-4cf3-aa7c-7d9cac777b4c" />

<img width="1884" height="892" alt="Screenshot 2026-08-07 162215" src="https://github.com/user-attachments/assets/7d1ed976-1aad-41c8-a9ed-6d9f222702aa" />

<img width="1896" height="877" alt="Screenshot 2026-08-07 162233" src="https://github.com/user-attachments/assets/a2d5ca57-e28a-4820-a593-f1c625fca90b" />

<img width="1896" height="885" alt="Screenshot 2026-08-07 162248" src="https://github.com/user-attachments/assets/42eb436f-70ce-484d-acc6-cf6ee57df509" />

<img width="1895" height="892" alt="Screenshot 2026-08-07 162305" src="https://github.com/user-attachments/assets/272756ad-b382-46d0-a57c-0d5bd46f14f5" />

<img width="1872" height="893" alt="Screenshot 2026-08-07 162319" src="https://github.com/user-attachments/assets/82f35218-b0f1-4232-9d50-359d97368901" />

<img width="1895" height="889" alt="Screenshot 2026-08-07 162332" src="https://github.com/user-attachments/assets/f6d8b69d-7edd-4471-ae6b-8708f81aca30" />

<img width="1887" height="878" alt="Screenshot 2026-08-07 162348" src="https://github.com/user-attachments/assets/16fe1708-6b9f-4522-97d0-2a7d8bac7bdb" />

<img width="1882" height="890" alt="Screenshot 2026-08-07 162407" src="https://github.com/user-attachments/assets/61d18ee5-3773-4591-84eb-3bd9a9112be4" />

<img width="1892" height="881" alt="Screenshot 2026-08-07 162423" src="https://github.com/user-attachments/assets/e0dcd1b5-719d-449d-8152-4c69bf0ab232" />

<img width="1900" height="889" alt="Screenshot 2026-08-07 162437" src="https://github.com/user-attachments/assets/22aabe3c-6d91-4a35-b12e-fd9569bd1b5f" />

<img width="1881" height="893" alt="Screenshot 2026-08-07 162454" src="https://github.com/user-attachments/assets/700daa12-dffa-4ce6-8234-affaa8010f98" />

<img width="1890" height="892" alt="Screenshot 2026-08-07 162814" src="https://github.com/user-attachments/assets/dd889320-8e80-4cc6-9e25-38b8a7805fef" />

<img width="1908" height="894" alt="Screenshot 2026-08-07 162958" src="https://github.com/user-attachments/assets/be129af7-5795-44d4-bff6-59af1856d5b8" />



















