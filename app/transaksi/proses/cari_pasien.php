<?php
require_once '../../functions/MY_model.php';

if(isset($_REQUEST['get_val']))
{
    $term = $_REQUEST['get_val'];
    $pasiens = get("select * from pasien where nama_pasien like '%".$term."%'");
    if(count($pasiens)>0){
        foreach ($pasiens as $pasien)
        {
            echo "<label class='form-check-label'><input type='radio' data-id=".$pasien['id']." value=".$pasien['nama_pasien']." class='form-check-input' name='pilih_pasien'>".$pasien['nama_pasien']." (".$pasien["nomor_identitas"].")</label><br>";
        }
    } else {
        echo 'Tidak ada pasien dengan nama '.$term;
    }

    exit;
}

if(isset($_REQUEST['findval']))
{
    $term = $_REQUEST['findval'];
    $arr_rekam_medis_id = [];
    $arr_rekam_medis_ruang_id = [];
    $arr_obat_id = [];
    $rekam_medis = get("select * from rekam_medis where pasien_id = '$term'");
    $total_obat = 0;
    $total_ruang = 0;
    $total_semua = 0;
    echo "<input name='pasien_id' id='pasien_id' hidden value='$term'>";

    foreach ($rekam_medis as $r)
    {
        array_push($arr_rekam_medis_id, $r['id']);
        array_push($arr_rekam_medis_ruang_id, $r['ruang_id']);
    }
    if(count($rekam_medis)>0){
        $obat_rm = get("select * from rm_obat where rm_id in (" . implode(',', $arr_rekam_medis_id) . ")");
        $ruang = get("select * from ruang where id in (" . implode(',', $arr_rekam_medis_ruang_id) . ")");
        foreach ($obat_rm as $obat)
        {
            array_push($arr_obat_id, $obat['obat_id']);
        }
        echo "<h6>Data Ruang</h6><ul>";
        foreach ($ruang as $r)
        {
            $total_ruang+=$r['harga'];
            echo "<li><b>Ruang ".$r['nama_ruang']." : </b> Rp. ".$r['harga']."</li>";
        }
        echo "</ul>";
        if(count($arr_obat_id)>0){
            $obats = get("select * from obat where id in (" . implode(',', $arr_obat_id) . ")");
            echo "<h6>Data Obat-obatan</h6><ul>";
            foreach ($obats as $obat)
            {
                $total_obat+=$obat['harga'];
                echo "<li><b>Obat ".$obat['nama_obat']." : </b> Rp. ".$obat['harga']."</li>";
            }
            echo "</ul>";
        } else {
            echo 'Tidak ada data obat';
        }
        $total_semua = $total_obat+$total_ruang;
        echo "<h6><b>Total Tagihan : </b>Rp. ".$total_semua."</h6>";

    } else {
        echo 'Tidak ada data ruangan dan obat';
    }
    echo "<input name='total_tagihan' id='total_tagihan' hidden value='$total_semua'>";
    exit;
}
?>