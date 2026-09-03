<?php
require_once __DIR__ . '/includes/config.php';
require_once __DIR__ . '/includes/lookups.php';  // helper senarai option
require_login();
$page_title = 'AI Assistant';
$active = 'assistant';
$user = current_user();
$isAdmin = ($user['role'] === 'ADMIN');

/* ---- Palet soalan siap (kekal, admin cukup klik) ---- */
$STATUSES   = lookup_values($conn, 'status');
$CATEGORIES = lookup_values($conn, 'category');
$DEPTS      = lookup_values($conn, 'department');
$BRANCHES   = lookup_values($conn, 'branch');

$groups = [
    'Umum'        => ['Ringkasan sistem','Berapa jumlah aset?','Aktiviti terkini','Bantuan'],
    'Status Aset' => array_map(function($s){ return "Aset status $s"; }, $STATUSES),
    'Kategori'    => array_map(function($c){ return "Aset kategori $c"; }, $CATEGORIES),
    'Department'  => array_map(function($d){ return "Aset department $d"; }, $DEPTS),
    'Branch'      => array_map(function($b){ return "Aset di $b"; }, $BRANCHES),
    'Warranty'    => ['Warranty akan tamat','Warranty dah tamat'],
    'Pinjaman'    => ['Pinjaman aktif','Pinjaman lewat','Sejarah pinjaman'],
    'Maintenance' => ['Maintenance pending','Jumlah kos maintenance','Senarai maintenance'],
    'Statistik'   => ['Pecahan department','Pecahan kategori','Pecahan branch','Aset paling lama','Aset paling baru'],
];
if ($isAdmin) $groups['User'] = ['Senarai user','Senarai admin'];

$cat_icons = [
    'Umum'=>'bi-grid','Status Aset'=>'bi-pc-display','Kategori'=>'bi-tag','Department'=>'bi-building',
    'Branch'=>'bi-geo-alt','Warranty'=>'bi-shield-check','Pinjaman'=>'bi-arrow-left-right',
    'Maintenance'=>'bi-tools','Statistik'=>'bi-bar-chart-line','User'=>'bi-people',
];

include __DIR__ . '/includes/header.php';
?>

<style>
  .ai-wrap { max-width: 1000px; margin: 0 auto; }
  .ai-hero { display:flex; align-items:center; gap:14px; margin-bottom:14px; }
  .ai-hero .ai-avatar { width:48px;height:48px;border-radius:14px;flex-shrink:0;display:grid;place-items:center;color:#fff;font-size:22px;
    background:linear-gradient(135deg,#10b981 0%,#06b6d4 100%); box-shadow:0 8px 22px rgba(16,185,129,.35); }
  .ai-hero h4 { margin:0; font-weight:700; }
  .ai-hero p { margin:0; font-size:13px; color:var(--muted,#64748b); }

  .ai-chat { background:var(--card,#fff); border:1px solid var(--border,#e2e8f0); border-radius:18px;
    box-shadow:0 10px 30px rgba(15,23,42,.06); overflow:hidden; display:flex; flex-direction:column; height:52vh; min-height:340px; }
  .ai-msgs { flex:1; overflow-y:auto; padding:18px; display:flex; flex-direction:column; gap:14px; }
  .ai-row { display:flex; gap:10px; align-items:flex-start; }
  .ai-row.user { flex-direction:row-reverse; }
  .ai-ic { width:34px;height:34px;border-radius:10px;flex-shrink:0;display:grid;place-items:center;color:#fff;font-size:16px; }
  .ai-ic.bot { background:linear-gradient(135deg,#10b981,#06b6d4); }
  .ai-ic.me  { background:#0f172a; }
  .ai-bubble { max-width:88%; padding:12px 15px; border-radius:14px; font-size:14px; line-height:1.55; }
  .ai-row.bot  .ai-bubble { background:#f1f5f9; color:#0f172a; border-top-left-radius:4px; }
  .ai-row.user .ai-bubble { background:linear-gradient(135deg,#10b981,#06b6d4); color:#fff; border-top-right-radius:4px; }
  .ai-bubble p { margin:0 0 8px; } .ai-bubble p:last-child { margin-bottom:0; }

  .ai-inputbar { display:flex; gap:8px; padding:12px 14px; border-top:1px solid #eef2f7; background:#fff; }
  .ai-inputbar input { flex:1; border:1.5px solid #e2e8f0; border-radius:12px; padding:11px 14px; font-size:14px; outline:none; }
  .ai-inputbar input:focus { border-color:#06b6d4; box-shadow:0 0 0 3px rgba(6,182,212,.15); }
  .ai-send { border:none; background:linear-gradient(135deg,#10b981,#06b6d4); color:#fff; border-radius:12px; padding:0 18px; font-weight:700; cursor:pointer; font-size:14px; }
  .ai-send:disabled { opacity:.6; cursor:default; }

  /* ---- Palet soalan tetap ---- */
  .ai-palette { margin-top:16px; background:var(--card,#fff); border:1px solid var(--border,#e2e8f0); border-radius:18px; box-shadow:0 10px 30px rgba(15,23,42,.05); overflow:hidden; }
  .ai-pal-head { padding:12px 16px; border-bottom:1px solid #eef2f7; display:flex; align-items:center; gap:8px; font-weight:700; color:#334155; }
  .ai-pal-head .tagx { margin-left:auto; font-size:11px; font-weight:600; color:#10b981; background:#eef2ff; border:1px solid #dbe2f0; border-radius:999px; padding:2px 10px; }
  .ai-tabs { display:flex; gap:6px; overflow-x:auto; padding:10px 12px; border-bottom:1px solid #eef2f7; background:#fafbff; }
  .ai-tab { flex:0 0 auto; display:inline-flex; align-items:center; gap:6px; border:1px solid #dbe2f0; background:#fff; color:#475569;
    border-radius:999px; padding:7px 14px; font-size:13px; font-weight:600; cursor:pointer; white-space:nowrap; transition:.15s; }
  .ai-tab:hover { background:#eef2ff; }
  .ai-tab.active { background:linear-gradient(135deg,#10b981,#06b6d4); color:#fff; border-color:transparent; box-shadow:0 6px 16px rgba(16,185,129,.3); }
  .ai-qgroups { padding:14px 16px; }
  .ai-qgroup { display:none; flex-wrap:wrap; gap:9px; }
  .ai-qgroup.active { display:flex; }
  .ai-qbtn { border:1px solid #dbe2f0; background:#fff; color:#1e293b; border-radius:12px; padding:10px 15px; font-size:13.5px; font-weight:600;
    cursor:pointer; transition:.15s; display:inline-flex; align-items:center; gap:7px; }
  .ai-qbtn:hover { background:#eef2ff; border-color:#a5b4fc; transform:translateY(-1px); box-shadow:0 6px 14px rgba(16,185,129,.18); }
  .ai-qbtn:active { transform:translateY(0); }
  .ai-qbtn i { color:#10b981; }

  /* Answer content (dari ask.php) */
  .ai-stats { display:grid; grid-template-columns:repeat(auto-fit,minmax(120px,1fr)); gap:10px; margin:10px 0; }
  .ai-stat { background:#fff; border:1px solid #e2e8f0; border-radius:12px; padding:10px 12px; text-align:center; font-size:11px; color:#64748b; }
  .ai-stat span { display:block; font-size:20px; font-weight:800; color:#4f46e5; }
  .ai-tablewrap { overflow-x:auto; margin:8px 0; border-radius:10px; border:1px solid #e2e8f0; }
  .ai-table { width:100%; border-collapse:collapse; font-size:12.5px; background:#fff; }
  .ai-table th { background:#f8fafc; text-align:left; padding:7px 9px; font-weight:700; color:#475569; white-space:nowrap; }
  .ai-table td { padding:7px 9px; border-top:1px solid #eef2f7; vertical-align:top; }
  .ai-link { color:#4f46e5; text-decoration:none; font-weight:600; } .ai-link:hover { text-decoration:underline; }
  .ai-ul { margin:6px 0; padding-left:18px; } .ai-ul li { margin:3px 0; }
  .ai-empty { color:#94a3b8; font-style:italic; margin:4px 0; }
  .ai-sub { font-weight:700; color:#334155; margin:12px 0 4px; font-size:13px; }
  .ai-remark { background:#fff7ed; border:1px solid #fed7aa; border-radius:8px; padding:8px 10px; margin:8px 0; }
  .ai-detail-head { font-size:15px; margin-bottom:8px; }
  .ai-grid { display:grid; grid-template-columns:repeat(auto-fit,minmax(150px,1fr)); gap:8px; }
  .ai-di { background:#fff; border:1px solid #eef2f7; border-radius:8px; padding:7px 9px; }
  .ai-di span { display:block; font-size:10.5px; text-transform:uppercase; letter-spacing:.4px; color:#94a3b8; }
  .ai-di b { font-size:13px; }
  .ai-actions { margin-top:12px; }
  .ai-btn { display:inline-block; background:linear-gradient(135deg,#10b981,#06b6d4); color:#fff; text-decoration:none; padding:8px 16px; border-radius:10px; font-weight:600; font-size:13px; }

  .badge-status{padding:2px 8px;border-radius:20px;font-size:11px;font-weight:600;white-space:nowrap;background:#eef2ff;color:#3730a3;display:inline-block}
  .badge-status.b-available{background:#d1fae5;color:#065f46}.badge-status.b-used-by{background:#ede9fe;color:#5b21b6}
  .badge-status.b-borrowed{background:#fef3c7;color:#92400e}.badge-status.b-maintenance{background:#dbeafe;color:#1e40af}
  .badge-status.b-damaged{background:#fee2e2;color:#991b1b}.badge-status.b-disposed{background:#f3f4f6;color:#6b7280}
  .badge-status.b-outdated{background:#ffedd5;color:#9a3412}.badge-status.b-pending{background:#fef3c7;color:#92400e}
  .badge-status.b-approved{background:#dbeafe;color:#1e40af}.badge-status.b-returned{background:#d1fae5;color:#065f46}
  .badge-status.b-late-return{background:#fee2e2;color:#991b1b}.badge-status.b-in-progress{background:#dbeafe;color:#1e40af}
  .badge-status.b-completed{background:#d1fae5;color:#065f46}

  .ai-typing span { display:inline-block; width:6px;height:6px;border-radius:50%;background:#94a3b8;margin:0 1px; animation:aiblink 1s infinite; }
  .ai-typing span:nth-child(2){animation-delay:.2s}.ai-typing span:nth-child(3){animation-delay:.4s}
  @keyframes aiblink{0%,60%,100%{opacity:.2}30%{opacity:1}}
  @media (max-width:600px){ .ai-chat{height:46vh} .ai-bubble{max-width:92%} }
</style>

<div class="ai-wrap">
  <div class="ai-hero">
    <div class="ai-avatar"><i class="bi bi-stars"></i></div>
    <div>
      <h4>AIMS Assistant</h4>
      <p>Cukup <strong>klik butang soalan</strong> di bawah — jawapan segera. Tak perlu menaip.</p>
    </div>
  </div>

  <!-- Chat -->
  <div class="ai-chat">
    <div class="ai-msgs" id="aiMsgs"></div>
    <form class="ai-inputbar" id="aiForm" autocomplete="off">
      <input type="text" id="aiInput" placeholder="(Pilihan) taip soalan sendiri… cth: aset guna oleh Rahimi">
      <button type="submit" class="ai-send" id="aiSend"><i class="bi bi-send"></i></button>
    </form>
  </div>

  <!-- Palet soalan tetap -->
  <div class="ai-palette">
    <div class="ai-pal-head"><i class="bi bi-lightning-charge-fill" style="color:#10b981"></i> Soalan Pantas <span class="tagx">klik sahaja</span></div>
    <div class="ai-tabs" id="aiTabs">
      <?php $first=true; foreach ($groups as $cat=>$qs): ?>
        <button type="button" class="ai-tab <?= $first?'active':'' ?>" data-cat="<?= e($cat) ?>">
          <i class="bi <?= $cat_icons[$cat] ?? 'bi-question-circle' ?>"></i> <?= e($cat) ?>
        </button>
      <?php $first=false; endforeach; ?>
    </div>
    <div class="ai-qgroups" id="aiGroups">
      <?php $first=true; foreach ($groups as $cat=>$qs): ?>
        <div class="ai-qgroup <?= $first?'active':'' ?>" data-cat="<?= e($cat) ?>">
          <?php foreach ($qs as $qq): ?>
            <button type="button" class="ai-qbtn" data-q="<?= e($qq) ?>"><i class="bi bi-chat-dots"></i> <?= e($qq) ?></button>
          <?php endforeach; ?>
        </div>
      <?php $first=false; endforeach; ?>
    </div>
  </div>
</div>

<script>
(function(){
  var ASK = '<?= BASE_URL ?>ai/ask.php';
  var msgs = document.getElementById('aiMsgs');
  var form = document.getElementById('aiForm');
  var input = document.getElementById('aiInput');
  var sendBtn = document.getElementById('aiSend');

  function esc(t){ var d=document.createElement('div'); d.textContent=t; return d.innerHTML; }
  function scroll(){ msgs.scrollTop = msgs.scrollHeight; }

  function addUser(text){
    var row=document.createElement('div'); row.className='ai-row user';
    row.innerHTML='<div class="ai-ic me"><i class="bi bi-person"></i></div><div class="ai-bubble">'+esc(text)+'</div>';
    msgs.appendChild(row); scroll();
  }
  function addBot(html){
    var row=document.createElement('div'); row.className='ai-row bot';
    row.innerHTML='<div class="ai-ic bot"><i class="bi bi-stars"></i></div><div class="ai-bubble">'+html+'</div>';
    msgs.appendChild(row); scroll();
  }
  function typing(on){
    var t=document.getElementById('aiTyping');
    if(on){ if(t) return; var row=document.createElement('div'); row.className='ai-row bot'; row.id='aiTyping';
      row.innerHTML='<div class="ai-ic bot"><i class="bi bi-stars"></i></div><div class="ai-bubble ai-typing"><span></span><span></span><span></span></div>';
      msgs.appendChild(row); scroll();
    } else if(t){ t.remove(); }
  }

  function ask(q){
    q=(q||'').trim(); if(!q) return;
    addUser(q); input.value=''; sendBtn.disabled=true; typing(true);
    var body=new URLSearchParams(); body.append('q', q);
    fetch(ASK, {method:'POST', headers:{'X-Requested-With':'fetch'}, body:body, credentials:'same-origin'})
      .then(function(r){ return r.json(); })
      .then(function(d){ typing(false); addBot(d.html || '<p>Tiada jawapan.</p>'); sendBtn.disabled=false; })
      .catch(function(){ typing(false); addBot('<p>Maaf, ralat sambungan. Cuba lagi.</p>'); sendBtn.disabled=false; });
  }

  // Butang soalan (kekal — tidak dibuang selepas klik)
  document.getElementById('aiGroups').addEventListener('click', function(ev){
    var b = ev.target.closest('.ai-qbtn'); if(!b) return;
    ask(b.getAttribute('data-q'));
  });

  // Tab kategori
  var tabs = document.getElementById('aiTabs');
  var groups = document.getElementById('aiGroups');
  tabs.addEventListener('click', function(ev){
    var t = ev.target.closest('.ai-tab'); if(!t) return;
    var cat = t.getAttribute('data-cat');
    tabs.querySelectorAll('.ai-tab').forEach(function(x){ x.classList.toggle('active', x===t); });
    groups.querySelectorAll('.ai-qgroup').forEach(function(g){ g.classList.toggle('active', g.getAttribute('data-cat')===cat); });
  });

  // Taip sendiri (pilihan)
  form.addEventListener('submit', function(e){ e.preventDefault(); ask(input.value); });

  // Greeting
  addBot('<p>Hai <strong><?= e($user['fullname']) ?></strong>! Pilih mana-mana <strong>butang soalan</strong> di bawah untuk dapat jawapan segera. Butang kekal — boleh klik berkali-kali.</p>');
})();
</script>

<?php include __DIR__ . '/includes/footer.php'; ?>
