<?php
require_once 'app/functions/MY_model.php';

$id = $_GET['id'];
$transaction = get_where("SELECT * FROM transaksi tr INNER JOIN pasien ON tr.pasien_id = pasien.id where tr.id = '$id'");
?>
<div class="content-header row">

  <div class="content-header-right col-md-12">
    <a href="?page=obat" class="btn btn-light float-right mb-2">Kembali</a>
  </div>
</div>
<section id="basic-horizontal-layouts">
  <div class="row match-height">
    <div class="col-md-12 col-12">
      <div class="card">
        <div class="card-header">
          <h4 class="card-title">Edit Tagihan</h4>
        </div>
        <div class="card-content">
          <div class="card-body">
            <form action="app/transaksi/proses/update.php" method="post">
              <input type="hidden" name="id" value="<?= $transaction['id']; ?>">
              <div class="form-body">
                <div class="row">
                  <div class="col-12">
                    <div class="form-group row">
                      <div class="col-md-4">
                        <label>Nama Pasien</label>
                      </div>
                      <div class="col-md-8">
                        <input type="text" class="form-control" disabled name="nama_pasien" value="<?= $transaction['nama_pasien']; ?>">
                      </div>
                    </div>
                  </div>

                  <div class="col-12">
                    <div class="form-group row">
                      <div class="col-md-4">
                        <label>Total Tagihan</label>
                      </div>
                      <div class="col-md-8">
                        <input type="number" placeholder="Total tagihan" class="form-control" name="total_tagihan" value="<?= $transaction['total']; ?>">
                      </div>
                    </div>
                  </div>
				  
				  <div class="col-12">
                    <div class="form-group row">
                      <div class="col-md-4">
                        <label>Nominal terbayar</label>
                      </div>
                      <div class="col-md-8">
                        <input type="number" placeholder="Nominal Terbayar" class="form-control" name="terbayar" value="<?= $transaction['terbayar']; ?>">
                      </div>
                    </div>
                  </div>

                  <div class="col-md-8 offset-md-4">
                    <button type="submit" name="save" class="btn btn-primary">Save</button>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>