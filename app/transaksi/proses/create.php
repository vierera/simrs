<?php
session_start();
require_once '../../functions/MY_model.php';
$pasien_id = $_POST['pasien_id'];
$total = $_POST['total_tagihan'];
$terbayar= $_POST['jumlah_dibayar'];
$created_at = date('Y-m-d H:i:s');
$created_by = $_SESSION['user']['id'];
$status = $terbayar!=$total ? 0 : 1;
//$created_by = $_SESSION['user']['id'];
$query = "INSERT INTO transaksi VALUES('', '$pasien_id', '$total', '$terbayar', '$status','', '', '','$created_at', '', '')";
if (create($query) === 1) {
  echo '<script>document.location.href="../../../?page=transaksi";</script>';
} else {
  echo mysqli_error($conn);
}
