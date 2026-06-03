<?php
require_once __DIR__ . '/includes/config.php';
require_login();
$page_title = 'Dashboard'; $active = 'dashboard';

$counts = [
  'total'       => (int)$conn->query("SELECT COUNT(*) c FROM assets")->fetch_assoc()['c'],
  'available'   => (int)$conn->query("SELECT COUNT(*) c FROM assets WHERE status='Available'")->fetch_assoc()['c'],
  'usedby'      => (int)$conn->query("SELECT COUNT(*) c FROM assets WHERE status='Used By'")->fetch_assoc()['c'],
  'borrowed'    => (int)$conn->query("SELECT COUNT(*) c FROM assets WHERE status='Borrowed'")->fetch_assoc()['c'],
  'maintenance' => (int)$conn->query("SELECT COUNT(*) c FROM assets WHERE status='Maintenance'")->fetch_assoc()['c'],
  'staff'       => (int)$conn->query("SELECT COUNT(*) c FROM users")->fetch_assoc()['c'],
  'departments' => (int)$conn->query("SELECT COUNT(DISTINCT department) c FROM assets WHERE department IS NOT NULL AND department<>''")->fetch_assoc()['c'],
];

$status_data = [];
$r = $conn->query("SELECT status, COUNT(*) c FROM assets GROUP BY status ORDER BY c DESC");
while ($row = $r->fetch_assoc()) $status_data[$row['status']] = (int)$row['c'];

$cat_data = [];
$r = $conn->query("SELECT IFNULL(NULLIF(asset_category,''),'Uncategorized') cat, COUNT(*) c FROM assets GROUP BY cat ORDER BY c DESC LIMIT 8");
while ($row = $r->fetch_assoc()) $cat_data[$row['cat']] = (int)$row['c'];

$recent_borrows = $conn->query("SELECT b.*, a.asset_name, a.asset_code FROM borrow_records b LEFT JOIN assets a ON a.id=b.asset_id ORDER BY b.created_at DESC LIMIT 5");
$maint_alerts   = $conn->query("SELECT m.*, a.asset_name, a.asset_code FROM maintenance_records m LEFT JOIN assets a ON a.id=m.asset_id WHERE m.status<>'Completed' ORDER BY m.created_at DESC LIMIT 5");

include __DIR__ . '/includes/header.php';
?>

<style>
*, *::before, *::after { box-sizing: border-box; }

.db-wrap { display: flex; flex-direction: column; gap: 20px; padding-bottom: 32px; }

.db-stat-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(130px, 1fr));
  gap: 10px;
}
.db-stat-card {
  background: #fff;
  border: 0.5px solid rgba(0,0,0,.08);
  border-radius: 14px;
  padding: 14px 16px;
  display: flex;
  flex-direction: column;
  gap: 8px;
  transition: box-shadow .18s, transform .18s;
}
.db-stat-card:hover { box-shadow: 0 4px 18px rgba(0,0,0,.07); transform: translateY(-2px); }
.db-stat-icon {
  width: 34px; height: 34px;
  border-radius: 9px;
  display: flex; align-items: center; justify-content: center;
  font-size: 17px;
}
.db-stat-label { font-size: 10.5px; font-weight: 600; letter-spacing: .4px; text-transform: uppercase; color: #6b7280; }
.db-stat-value { font-size: 28px; font-weight: 600; line-height: 1; color: #111827; letter-spacing: -.5px; }

.sc-blue   .db-stat-icon { background: #eff6ff; color: #2563eb; }
.sc-green  .db-stat-icon { background: #f0fdf4; color: #16a34a; }
.sc-violet .db-stat-icon { background: #f5f3ff; color: #7c3aed; }
.sc-amber  .db-stat-icon { background: #fffbeb; color: #d97706; }
.sc-sky    .db-stat-icon { background: #e0f2fe; color: #0284c7; }
.sc-pink   .db-stat-icon { background: #fdf2f8; color: #be185d; }
.sc-teal   .db-stat-icon { background: #f0fdfa; color: #0d9488; }

.db-charts-row { display: grid; grid-template-columns: 5fr 7fr; gap: 12px; }
@media (max-width: 768px) { .db-charts-row { grid-template-columns: 1fr; } }

.db-card { background: #fff; border: 0.5px solid rgba(0,0,0,.08); border-radius: 14px; padding: 18px 20px; }
.db-card-title {
  font-size: 11.5px; font-weight: 600; letter-spacing: .3px;
  text-transform: uppercase; color: #6b7280;
  display: flex; align-items: center; gap: 7px;
  margin-bottom: 16px;
}
.db-card-title i { font-size: 15px; }

.db-tbl { width: 100%; border-collapse: collapse; font-size: 12.5px; }
.db-tbl th {
  text-align: left; font-size: 10.5px; font-weight: 600;
  color: #9ca3af; padding: 0 0 10px;
  border-bottom: 0.5px solid rgba(0,0,0,.08);
  text-transform: uppercase; letter-spacing: .3px;
}
.db-tbl td { padding: 10px 0; border-bottom: 0.5px solid rgba(0,0,0,.05); vertical-align: middle; color: #111827; }
.db-tbl tr:last-child td { border-bottom: none; }
.db-tbl .t-code { font-weight: 600; font-size: 12px; font-family: ui-monospace, monospace; }
.db-tbl .t-sub  { font-size: 11px; color: #6b7280; margin-top: 2px; }

.db-tables-row { display: grid; grid-template-columns: 1fr 1fr; gap: 12px; }
@media (max-width: 768px) { .db-tables-row { grid-template-columns: 1fr; } }

.db-badge { display: inline-block; padding: 2px 10px; border-radius: 20px; font-size: 10.5px; font-weight: 600; }
.db-badge.b-available      { background: #f0fdf4; color: #15803d; }
.db-badge.b-used-by        { background: #f5f3ff; color: #6d28d9; }
.db-badge.b-borrowed       { background: #fffbeb; color: #b45309; }
.db-badge.b-maintenance    { background: #eff6ff; color: #1d4ed8; }
.db-badge.b-damaged        { background: #fef2f2; color: #b91c1c; }
.db-badge.b-disposed       { background: #f9fafb; color: #6b7280; }
.db-badge.b-completed,
.db-badge.b-returned       { background: #f0fdf4; color: #15803d; }
.db-badge.b-pending        { background: #fffbeb; color: #b45309; }
.db-badge.b-in-progress    { background: #eff6ff; color: #1d4ed8; }
.db-badge.b-active         { background: #fdf4ff; color: #86198f; }
.db-badge.b-overdue        { background: #fef2f2; color: #b91c1c; }

.db-legend  { display: flex; flex-wrap: wrap; gap: 10px; margin-top: 14px; }
.db-leg     { display: flex; align-items: center; gap: 5px; font-size: 12px; color: #6b7280; }
.db-leg-dot { width: 9px; height: 9px; border-radius: 2px; flex-shrink: 0; }

.db-empty { text-align: center; color: #9ca3af; font-size: 12.5px; padding: 20px 0; }
.db-card-title.alert-title     { color: #b91c1c; }
.db-card-title.alert-title i   { color: #ef4444; }
</style>

<div class="db-wrap">

  <!-- Stat Cards -->
  <div class="db-stat-grid">
    <div class="db-stat-card sc-blue">
      <div class="db-stat-icon"><i class="bi bi-pc-display"></i></div>
      <div class="db-stat-label">Total Assets</div>
      <div class="db-stat-value" data-target="<?= $counts['total'] ?>">0</div>
    </div>
    <div class="db-stat-card sc-green">
      <div class="db-stat-icon"><i class="bi bi-check2-circle"></i></div>
      <div class="db-stat-label">Available</div>
      <div class="db-stat-value" data-target="<?= $counts['available'] ?>">0</div>
    </div>
    <div class="db-stat-card sc-violet">
      <div class="db-stat-icon"><i class="bi bi-person-check"></i></div>
      <div class="db-stat-label">Used By</div>
      <div class="db-stat-value" data-target="<?= $counts['usedby'] ?>">0</div>
    </div>
    <div class="db-stat-card sc-amber">
      <div class="db-stat-icon"><i class="bi bi-arrow-left-right"></i></div>
      <div class="db-stat-label">Borrowed</div>
      <div class="db-stat-value" data-target="<?= $counts['borrowed'] ?>">0</div>
    </div>
    <div class="db-stat-card sc-sky">
      <div class="db-stat-icon"><i class="bi bi-tools"></i></div>
      <div class="db-stat-label">Maintenance</div>
      <div class="db-stat-value" data-target="<?= $counts['maintenance'] ?>">0</div>
    </div>
    <div class="db-stat-card sc-pink">
      <div class="db-stat-icon"><i class="bi bi-people"></i></div>
      <div class="db-stat-label">Total Staff</div>
      <div class="db-stat-value" data-target="<?= $counts['staff'] ?>">0</div>
    </div>
    <div class="db-stat-card sc-teal">
      <div class="db-stat-icon"><i class="bi bi-building"></i></div>
      <div class="db-stat-label">Departments</div>
      <div class="db-stat-value" data-target="<?= $counts['departments'] ?>">0</div>
    </div>
  </div>

  <!-- Charts -->
  <div class="db-charts-row">
    <div class="db-card">
      <div class="db-card-title"><i class="bi bi-pie-chart-fill"></i> Asset Status</div>
      <div style="position:relative;width:100%;height:200px">
        <canvas id="statusChart"></canvas>
      </div>
      <div class="db-legend" id="statusLegend"></div>
    </div>
    <div class="db-card">
      <div class="db-card-title"><i class="bi bi-bar-chart-fill"></i> Assets by Category</div>
      <div style="position:relative;width:100%;height:230px">
        <canvas id="catChart"></canvas>
      </div>
    </div>
  </div>

  <!-- Tables -->
  <div class="db-tables-row">
    <div class="db-card">
      <div class="db-card-title"><i class="bi bi-clock-history"></i> Latest Borrow Records</div>
      <table class="db-tbl">
        <thead><tr><th>Asset</th><th>Borrower</th><th>Date</th><th>Status</th></tr></thead>
        <tbody>
          <?php if ($recent_borrows && $recent_borrows->num_rows): while ($b = $recent_borrows->fetch_assoc()): ?>
          <tr>
            <td>
              <div class="t-code"><?= e($b['asset_code']) ?></div>
              <div class="t-sub"><?= e($b['asset_name']) ?></div>
            </td>
            <td><?= e($b['borrow_by']) ?></td>
            <td><?= e($b['borrow_date']) ?></td>
            <td><span class="db-badge b-<?= strtolower(str_replace(' ', '-', $b['status'])) ?>"><?= e($b['status']) ?></span></td>
          </tr>
          <?php endwhile; else: ?>
          <tr><td colspan="4" class="db-empty">No borrow records yet</td></tr>
          <?php endif; ?>
        </tbody>
      </table>
    </div>

    <div class="db-card">
      <div class="db-card-title alert-title"><i class="bi bi-exclamation-triangle-fill"></i> Maintenance Alerts</div>
      <table class="db-tbl">
        <thead><tr><th>Asset</th><th>Technician</th><th>Date</th><th>Status</th></tr></thead>
        <tbody>
          <?php if ($maint_alerts && $maint_alerts->num_rows): while ($m = $maint_alerts->fetch_assoc()): ?>
          <tr>
            <td>
              <div class="t-code"><?= e($m['asset_code']) ?></div>
              <div class="t-sub"><?= e($m['asset_name']) ?></div>
            </td>
            <td><?= e($m['technician']) ?></td>
            <td><?= e($m['maintenance_date']) ?></td>
            <td><span class="db-badge b-<?= strtolower(str_replace(' ', '-', $m['status'])) ?>"><?= e($m['status']) ?></span></td>
          </tr>
          <?php endwhile; else: ?>
          <tr><td colspan="4" class="db-empty">No active maintenance</td></tr>
          <?php endif; ?>
        </tbody>
      </table>
    </div>
  </div>

</div>

<!-- ══ Chart.js MESTI load dulu sebelum script chart ══ -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script>
<script>
/* ── Data dari PHP → JavaScript ── */
var statusData = <?= json_encode($status_data, JSON_FORCE_OBJECT) ?>;
var catData    = <?= json_encode($cat_data,    JSON_FORCE_OBJECT) ?>;

/* ── Counter animation ── */
(function () {
  var cards   = document.querySelectorAll('.db-stat-value[data-target]');
  var started = false;

  function run() {
    if (started) return;
    started = true;
    var t0  = performance.now();
    var dur = 900;
    function tick(ts) {
      var p    = Math.min((ts - t0) / dur, 1);
      var ease = 1 - Math.pow(1 - p, 3);
      cards.forEach(function(el) {
        el.textContent = Math.round(parseInt(el.dataset.target, 10) * ease);
      });
      if (p < 1) requestAnimationFrame(tick);
    }
    requestAnimationFrame(tick);
  }

  if ('IntersectionObserver' in window && cards.length) {
    new IntersectionObserver(function(entries) {
      if (entries[0].isIntersecting) run();
    }, { threshold: 0.1 }).observe(cards[0]);
  } else {
    run();
  }
})();

/* ── Warna ikut status ── */
var statusColorMap = {
  'Available'   : '#16a34a',
  'Used By'     : '#7c3aed',
  'Borrowed'    : '#d97706',
  'Maintenance' : '#2563eb',
  'Damaged'     : '#dc2626',
  'Disposed'    : '#9ca3af'
};

var statusKeys   = Object.keys(statusData);
var statusValues = Object.values(statusData);
var chartColors  = statusKeys.map(function(k) {
  return statusColorMap[k] || '#cbd5e1';
});

/* ── Donut chart ── */
if (statusKeys.length > 0) {
  new Chart(document.getElementById('statusChart'), {
    type: 'doughnut',
    data: {
      labels: statusKeys,
      datasets: [{
        data: statusValues,
        backgroundColor: chartColors,
        borderWidth: 0,
        hoverOffset: 5
      }]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      cutout: '70%',
      plugins: {
        legend: { display: false },
        tooltip: {
          callbacks: {
            label: function(ctx) {
              var tot = ctx.dataset.data.reduce(function(a, b) { return a + b; }, 0);
              return ' ' + ctx.label + ': ' + ctx.raw + ' (' + Math.round(ctx.raw / tot * 100) + '%)';
            }
          }
        }
      }
    }
  });

  /* Legend */
  var legendEl = document.getElementById('statusLegend');
  var total    = statusValues.reduce(function(a, b) { return a + b; }, 0);
  statusKeys.forEach(function(k, i) {
    legendEl.insertAdjacentHTML('beforeend',
      '<span class="db-leg">' +
        '<span class="db-leg-dot" style="background:' + chartColors[i] + '"></span>' +
        k + ' <strong style="margin-left:3px;color:#374151">' +
        Math.round(statusValues[i] / total * 100) + '%</strong>' +
      '</span>'
    );
  });
}

/* ── Bar chart ── */
var catKeys   = Object.keys(catData);
var catValues = Object.values(catData);

if (catKeys.length > 0) {
  new Chart(document.getElementById('catChart'), {
    type: 'bar',
    data: {
      labels: catKeys,
      datasets: [{
        label: 'Assets',
        data: catValues,
        backgroundColor: 'rgba(37,99,235,.80)',
        hoverBackgroundColor: 'rgba(37,99,235,1)',
        borderRadius: 6,
        borderSkipped: false
      }]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      plugins: { legend: { display: false } },
      scales: {
        y: {
          beginAtZero: true,
          ticks: { precision: 0, font: { size: 11 }, color: '#9ca3af' },
          grid: { color: 'rgba(0,0,0,.04)' }
        },
        x: {
          ticks: { font: { size: 11 }, color: '#6b7280', autoSkip: false },
          grid: { display: false }
        }
      }
    }
  });
}
</script>

<?php include __DIR__ . '/includes/footer.php'; ?>
