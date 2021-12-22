CREATE TABLE `transaksi` (
                               `id` int(11) NOT NULL primary key AUTO_INCREMENT,
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
-- Indexes for table `rekam_medis`
--
ALTER TABLE `transaksi`
    ADD KEY `pasien_id` (`pasien_id`);

--
-- Constraints for table `rekam_medis`
--
ALTER TABLE `transaksi`
    ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`pasien_id`) REFERENCES `pasien` (`id`);