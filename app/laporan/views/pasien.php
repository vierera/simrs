<?php
require_once 'app/functions/MY_model.php';
$pasien = get('SELECT * from pasien');
$pasien_female = get_count("SELECT count(*) as total from pasien where jenis_kelamin = 'p'");
$pasien_male = get_count("SELECT count(*) as total from pasien where jenis_kelamin = 'l'");
$ruang_pasien = get('SELECT r.nama_ruang as nama_ruang, count(rm.ruang_id) as total_pasien FROM ruang AS r LEFT OUTER JOIN rekam_medis AS rm ON rm.ruang_id = r.id GROUP BY r.id ORDER BY r.nama_ruang ASC');
$all_ruang = [];
$jumlah_pasien_ruang = [];
foreach ($ruang_pasien as $rp){
    array_push($all_ruang, $rp['nama_ruang']);
    array_push($jumlah_pasien_ruang, $rp['total_pasien']);
}
$no = 1;

$title = 'rekam_medis';
?>

<!-- Basic tabs start -->
<section id="basic-tabs-components">

    <div class="row">
        <div class="col-sm-12">
            <div class="card overflow-hidden">
                <div class="card-header">
                    <h4 class="card-title">Grafik Pasien</h4>
                </div>
                <div class="card-content">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-6">
                                <h6>Chart Gender</h6>
                                <div class="container" style="max-width: 400px !important;">
                                    <canvas id="chartGender" width="200" height="200"></canvas>
                                </div>
                            </div>
                            <div class="col-6">
                                <h6>Chart Ruang</h6>
                                <div class="container" style="max-width: 400px !important;">
                                    <canvas id="chartRuang" width="200" height="200"></canvas>
                                </div>
                            </div>
                        </div>


                        <!--                        <ul class="nav nav-tabs" role="tablist">-->
<!--                            <li class="nav-item">-->
<!--                                <a class="nav-link active" id="list-tab" data-toggle="tab" href="#list" aria-controls="list" role="tab" aria-selected="true">List</a>-->
<!--                            </li>-->
<!--                            <li class="nav-item">-->
<!--                                <a class="nav-link" id="summary-tab" data-toggle="tab" href="#summary" aria-controls="summary" role="tab" aria-selected="false">Summary</a>-->
<!--                            </li>-->
<!--                        </ul>-->
<!--                        <div class="tab-content">-->
<!--                            <div class="tab-pane active" id="list" aria-labelledby="list-tab" role="tabpanel">-->
<!--                            </div>-->
<!--                            <div class="tab-pane" id="profile" aria-labelledby="profile-tab" role="tabpanel">-->
<!--                                <p>Pudding candy canes sugar plum cookie chocolate cake powder croissant. Carrot cake tiramisu danish-->
<!--                                    candy cake muffin croissant tart dessert. Tiramisu caramels candy canes chocolate cake sweet roll-->
<!--                                    liquorice icing cupcake.</p>-->
<!--                            </div>-->
<!--                        </div>-->
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    function getRandomColor() {
        var letters = '0123456789ABCDEF'.split('');
        var color = '#';
        for (var i = 0; i < 6; i++ ) {
            color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
    }
    var jumlah_perempuan = "<?php echo $pasien_female; ?>";
    var jumlah_lakilaki = "<?php echo $pasien_male; ?>";
    var chartGender = document.getElementById('chartGender').getContext('2d');
    var chartGenderChart = new Chart(chartGender, {
        type: 'pie',
        data: {
            labels: ['Perempuan', 'Laki-laki'],
            datasets: [
                {
                    label: 'Gender Pasien',
                    data: [jumlah_perempuan, jumlah_lakilaki],
                    backgroundColor: [
                        'rgb(255, 99, 132)',
                        'rgb(54, 162, 235)',
                    ],
                }
            ]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                    text: 'Chart.js Pie Chart'
                }
            }
        },
    });
    var nama_ruang = <?php echo json_encode($all_ruang); ?>;
    var jumlah_pasien = <?php echo json_encode($jumlah_pasien_ruang); ?>;
    console.log(jumlah_pasien)
    var chartRuang = document.getElementById('chartRuang').getContext('2d');
    var chartRuangChart = new Chart(chartRuang, {
        type: 'bar',
        data: {
            labels: nama_ruang,
            datasets: [{
                label: 'Jumlah Pasien tiap ruang',
                data: jumlah_pasien,
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    display: true,
                    ticks: {
                        beginAtZero: true,
                        precision : 0
                    }
                }]
            },
        },

    });
</script>
<!-- Basic Tag Input end -->