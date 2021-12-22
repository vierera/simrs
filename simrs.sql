-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2021 at 06:24 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simrs`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id` int(11) NOT NULL,
  `nama_dokter` varchar(128) NOT NULL,
  `alamat` text DEFAULT NULL,
  `telephone` varchar(16) NOT NULL,
  `spesialis` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id`, `nama_dokter`, `alamat`, `telephone`, `spesialis`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 'Johan', 'Karawang', '0891234455', 'Hati', '2020-03-03 16:55:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(3, 'Sony', 'Bandung', '0987428947392', 'Gizi', '2021-12-18 08:14:12', '2021-12-22 16:35:30', '0000-00-00 00:00:00', 7, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `group_id`
--

CREATE TABLE `group_id` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `definition` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_id`
--

INSERT INTO `group_id` (`id`, `name`, `definition`) VALUES
(1, 'admin', 'admin'),
(2, 'dokter', 'dokter');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` int(11) NOT NULL,
  `nama_obat` varchar(128) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `harga` int(20) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `nama_obat`, `keterangan`, `harga`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 'Bodrex', 'sakit kepala', 5000, '2020-03-03 16:58:23', '2021-12-18 13:58:02', '0000-00-00 00:00:00', 1, 7, 0),
(3, 'panadol', 'obat kit pala', 5000, '2021-12-18 08:16:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id` int(11) NOT NULL,
  `nomor_identitas` varchar(30) DEFAULT NULL,
  `nama_pasien` varchar(128) NOT NULL,
  `jenis_kelamin` char(1) DEFAULT NULL,
  `alamat` text NOT NULL,
  `telephone` varchar(16) DEFAULT NULL,
  `tindakan` enum('inap','jalan') NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id`, `nomor_identitas`, `nama_pasien`, `jenis_kelamin`, `alamat`, `telephone`, `tindakan`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, '3215082394924', 'Siti', 'p', 'Karawang', '0989333333333', 'inap', '2020-03-03 16:55:51', '2021-12-20 10:10:31', '0000-00-00 00:00:00', 1, 7, 0),
(2, '3215082394923', 'Boi', 'l', 'Bekasi', '08561234567', '', '2020-03-03 16:56:25', '2021-12-20 10:07:14', '0000-00-00 00:00:00', 1, 7, 0),
(5, '37397920302348320', 'pie', 'p', 'Jakarta', '3525329080890', 'inap', '2021-12-18 09:54:35', '2021-12-22 16:47:29', '0000-00-00 00:00:00', 6, 7, 0),
(6, '3634342', 'Vierera', 'p', 'pdl', '0328029743', '', '2021-12-20 10:02:32', '2021-12-20 10:07:06', '0000-00-00 00:00:00', 7, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rekam_medis`
--

CREATE TABLE `rekam_medis` (
  `id` int(11) NOT NULL,
  `pasien_id` int(11) NOT NULL,
  `dokter_id` int(11) NOT NULL,
  `ruang_id` int(11) NOT NULL,
  `keluhan` text NOT NULL,
  `diagnosa` text NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rekam_medis`
--

INSERT INTO `rekam_medis` (`id`, `pasien_id`, `dokter_id`, `ruang_id`, `keluhan`, `diagnosa`, `tanggal`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(11, 1, 1, 1, 'ion', 'kit pala', '2021-12-18', '2021-12-18 08:16:35', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 0, 0),
(14, 1, 1, 1, 'dsg', 'gsfg', '2021-12-18', '2021-12-18 14:24:47', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 0, 0),
(15, 1, 1, 1, 'gr', 'ht', '2021-12-18', '2021-12-18 14:25:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 0, 0),
(16, 1, 1, 1, 'rgrg', 'rye', '2021-12-18', '2021-12-18 14:26:47', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 0, 0),
(17, 5, 1, 6, 'ga tau', 'sakit', '2021-12-20', '2021-12-20 09:20:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 0, 0),
(18, 6, 1, 6, 'Sakit perut', 'Keracunan', '2021-12-22', '2021-12-22 07:54:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rm_obat`
--

CREATE TABLE `rm_obat` (
  `id` int(11) NOT NULL,
  `obat_id` int(11) NOT NULL,
  `rm_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rm_obat`
--

INSERT INTO `rm_obat` (`id`, `obat_id`, `rm_id`) VALUES
(3, 3, 11),
(4, 3, 15),
(5, 1, 16),
(6, 1, 17),
(7, 3, 18);

-- --------------------------------------------------------

--
-- Table structure for table `ruang`
--

CREATE TABLE `ruang` (
  `id` int(11) NOT NULL,
  `nama_ruang` varchar(128) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `harga` int(20) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ruang`
--

INSERT INTO `ruang` (`id`, `nama_ruang`, `keterangan`, `harga`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 'Melati 01', 'Lantai 1', 250000, '2020-03-03 16:57:35', '2021-12-22 17:09:15', '0000-00-00 00:00:00', 1, 7, 0),
(2, 'Melati 02', 'Lantai 1', 300000, '2020-03-03 16:57:44', '2021-12-20 09:00:08', '0000-00-00 00:00:00', 1, 7, 0),
(5, 'Mawar', 'Lantai 2', 400000, '2021-12-20 09:00:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 0, 0),
(6, 'Tulip', 'Lantai 3 (VIP)', 600000, '2021-12-20 09:01:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `pasien_id` int(11) NOT NULL,
  `total` int(11) DEFAULT 0,
  `terbayar` int(11) DEFAULT 0,
  `status` int(3) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `pasien_id`, `total`, `terbayar`, `status`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 5, 605000, 605000, 1, 0, 0, 0, '2021-12-22 16:54:39', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `group_id`, `username`, `password`, `last_login`, `created_at`) VALUES
(6, 2, 'dokter', '$2y$10$V.x9VOSrvH0MTOx8dGzaTuF.xvA0SzHox1/tsYKlvN4cdw3b3xY.K', '0000-00-00 00:00:00', '2021-12-18 07:35:57'),
(7, 1, 'admin', '$2y$10$Ifx8ed4SLyX5EZE0vscwZejSfdZPIVOmMCGNJoSRV4litnZ.CCAhS', '0000-00-00 00:00:00', '2021-12-18 07:36:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `group_id`
--
ALTER TABLE `group_id`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rekam_medis`
--
ALTER TABLE `rekam_medis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dokter_id` (`dokter_id`),
  ADD KEY `ruang_id` (`ruang_id`),
  ADD KEY `pasien_id` (`pasien_id`);

--
-- Indexes for table `rm_obat`
--
ALTER TABLE `rm_obat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `obat_id` (`obat_id`),
  ADD KEY `rm_id` (`rm_id`);

--
-- Indexes for table `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pasien_id` (`pasien_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `group_id`
--
ALTER TABLE `group_id`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rekam_medis`
--
ALTER TABLE `rekam_medis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `rm_obat`
--
ALTER TABLE `rm_obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ruang`
--
ALTER TABLE `ruang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rekam_medis`
--
ALTER TABLE `rekam_medis`
  ADD CONSTRAINT `rekam_medis_ibfk_2` FOREIGN KEY (`dokter_id`) REFERENCES `dokter` (`id`),
  ADD CONSTRAINT `rekam_medis_ibfk_3` FOREIGN KEY (`ruang_id`) REFERENCES `ruang` (`id`),
  ADD CONSTRAINT `rekam_medis_ibfk_4` FOREIGN KEY (`pasien_id`) REFERENCES `pasien` (`id`);

--
-- Constraints for table `rm_obat`
--
ALTER TABLE `rm_obat`
  ADD CONSTRAINT `rm_obat_ibfk_1` FOREIGN KEY (`obat_id`) REFERENCES `obat` (`id`),
  ADD CONSTRAINT `rm_obat_ibfk_2` FOREIGN KEY (`rm_id`) REFERENCES `rekam_medis` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`pasien_id`) REFERENCES `pasien` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
