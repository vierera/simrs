<?php
require_once 'app/functions/MY_model.php';
$transactions = get("SELECT *, tr.id as tr_id FROM transaksi tr
                    INNER JOIN pasien ON tr.pasien_id = pasien.id");
$no = 1;
?>

<!-- User Table -->
<section id="column-selectors">
  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-header">
          <h4 class="card-title">Transaksi</h4>
          <a href="?page=tambah-transaksi" class="btn btn-primary round waves-effect waves-light">
            Tambah Transaksi
          </a>
        </div>
        <div class="card-content">
          <div class="card-body card-dashboard">
            <div class="table-responsive">
              <table class="table table-striped dataex-html5-selectors">
                <thead>
                  <tr>
                    <th></th>
                    <th>Nama Pasien</th>
                    <th>Total Tagihan</th>
                    <th>Total Dibayar</th>
                    <th>Status</th>
                    <th>Aksi</th>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($transactions as $transaction) : ?>
                    <tr>
                      <td><?= $no++ ?></td>
                      <td><?= $transaction['nama_pasien']; ?></td>
                      <td>Rp. <?= $transaction['total']; ?></td>
					  <td>Rp. <?= $transaction['terbayar']; ?></td>
                      <td><?= $transaction['status']==0 ? '<h6 class="text-danger">Belum lunas</h6>' : '<h6 class="text-success">Lunas</h6>'; ?></td>

                        <td>
                        <a href="?page=edit-transaksi&id=<?= $transaction['tr_id']; ?>"><i class="m-1 feather icon-edit-2"></i></a>
                        <a href="?page=hapus-transaksi&id=<?= $transaction['tr_id']; ?>" class="btn-hapus"><i class="feather icon-trash"></i></a>
                      </td>
                    </tr>
                  <?php endforeach; ?>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- User Table -->
<?php $title = 'transaksi'; ?>