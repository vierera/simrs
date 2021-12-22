
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
          <h4 class="card-title">Tambah Transaksi</h4>
        </div>
        <div class="card-content">
          <div class="card-body">
            <form action="app/transaksi/proses/create.php" method="post">
              <div class="form-body">
                <div class="row">
                  <div class="col-12">
                    <div class="form-group row">
                      <div class="col-md-4">
                        <label>Nama Pasien </label>
                      </div>
                      <div class="col-md-8">
                          <input type="text" placeholder="Cari Pasien (Masukkan Nama Lengkap)" class="form-control" id="nama_pasien" name="nama_pasien">
                          <div id="daftar_nama" class="alert alert-info p-2" hidden>

                          </div>
                      </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                      <div class="col-12">
                          <div class="form-group row">
                              <div class="col-md-4">
                                  <label>Daftar Ruangan dan Obat</label>
                              </div>
                              <div class="col-md-8" id="all-obat-ruang">
                                  <div class="alert alert-warning">
                                      Data obat dan ruangan belum ada, mohon masukkan nama pasien terlebih dahulu
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
                  <div class="row" id="input_dibayar" hidden>
                      <div class="col-12">
                          <div class="form-group row">
                              <div class="col-md-4">
                                  <label>Jumlah dibayar</label>
                              </div>
                              <div class="col-md-8">
                                  <input type="number" placeholder="Masukkan jumlah dibayarkan" class="form-control" id="jumlah_dibayar" name="jumlah_dibayar">
                              </div>
                          </div>
                      </div>
                  </div>
                  <div class="col-md-8 offset-md-4">
                    <button type="submit" class="btn btn-primary">Save</button>
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
