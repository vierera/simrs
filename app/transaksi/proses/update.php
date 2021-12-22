<?php
session_start();
require_once '../../functions/MY_model.php';

$id = $_POST['id'];
$total = $_POST['total_tagihan'];
$terbayar = $_POST['terbayar'];
$updated_at = date('Y-m-d H:i:s');
$updated_by = $_SESSION['user']['id'];
$status = $terbayar!=$total ? 0 : 1;

$query = "UPDATE transaksi SET total = '$total', terbayar = '$terbayar', updated_at = '$updated_at', status = '$status', updated_by = '$updated_by' WHERE id = '$id'";
if (create($query) === 1) {
  echo '<script>document.location.href="../../../?page=transaksi";</script>';
} else {
  echo mysqli_error($conn);
}
