<?php
session_start();
require_once '../../functions/MY_model.php';
$nama_ruang = $_POST['nama_ruang'];
$keterangan = $_POST['keterangan'];
$harga = $_POST['harga'];
$created_at = date('Y-m-d H:i:s');
$created_by = $_SESSION['user']['id'];
$query = "INSERT INTO ruang VALUES('', '$nama_ruang', '$keterangan', '$harga', '$created_at', '', '', '$created_by', '', '')";
if (create($query) === 1) {
  echo '<script>document.location.href="../../../?page=ruang";</script>';
} else {
  echo mysqli_error($conn);
}
