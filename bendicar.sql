-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2020 at 04:08 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bendicar`
--

-- --------------------------------------------------------

--
-- Table structure for table `denda`
--

CREATE TABLE `denda` (
  `id_denda` varchar(11) NOT NULL,
  `nm_denda` varchar(25) DEFAULT NULL,
  `harga_denda` int(11) DEFAULT NULL,
  `keterangan` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `denda`
--

INSERT INTO `denda` (`id_denda`, `nm_denda`, `harga_denda`, `keterangan`) VALUES
('1', 'Terlambat', 50000, 'Perhari'),
('2', 'lecet atau penyok', 300000, 'Rusak ringan'),
('3', 'Rusak Parah', 3000000, 'Rusak Berat'),
('4', 'Hilang', 5000000, 'Hilang'),
('5', 'rusak sedang', 4000, 'perhari');

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE `kendaraan` (
  `no_pol` varchar(9) NOT NULL,
  `jeniskendaraan` varchar(20) DEFAULT NULL,
  `merk` varchar(20) DEFAULT NULL,
  `hargasewa` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kendaraan`
--

INSERT INTO `kendaraan` (`no_pol`, `jeniskendaraan`, `merk`, `hargasewa`) VALUES
('B 1041 TF', 'MPV', 'Daihatsu Xenia', 1980000),
('B 1055 AA', '	City Car ', 'Toyota Yaris 1.5 G M', 4500000),
('B 1059 TV', '	City Car', '	Suzuki Swift Sport ', 385000),
('B 1208 ER', '	City Car ', 'Mitsubishi Mirage 20', 45000000),
('B 1322 RF', 'MPV', 'Suzuki Ertiga GL AT', 35000000),
('B 133 AGI', 'MPV', 'Toyota Avanza Veloz ', 21000000),
('B 1394 PY', '	Mobil Sedan', 'Toyota Corolla Altis', 785000),
('B 1424 PF', 'MPV', 'Nissan Grand Livina ', 35000000),
('B 1437 EK', 'MPV', 'Toyota Avanza 1.3 E ', 20000000),
('B 1471 BK', 'City Car ', 'Toyota Yaris 1.5 G A', 450000),
('B 1491 TY', '	Mobil Sedan', 'Honda Civic Hatchbac', 750000),
('B 1521 PR', '	Mobil SUV', 'Toyota Fortuner 2.4 ', 950000),
('B 1548 KV', 'City Car', 'Honda Jazz A MT', 50000000),
('B 1599 UR', '	Mobil SUV', 'Honda CR-V 2.0 i-VTE', 650000),
('B 1613 TZ', '	City Car ', 'Suzuki Swift Sport M', 395000),
('B 1683 SE', 'Mobil Double Cabin', 'Mitsubishi Triton Do', 900000),
('B 1927 KB', 'MPV', 'Honda Mobilio E CVT ', 25000000),
('B 1928 JK', 'City car', 'Toyota Avanza', 6000000),
('B 234 TNP', 'City Car', 'Honda Jazz RS MT', 55000000),
('B 275 SKE', 'MPV', 'Honda Mobilio 2017 S', 25500000),
('B 2984 BO', '	City Car', '	Mitsubishi Mirage 2', 350000),
('B 585 RFS', 'MPV', 'Toyota Avanza Veloz ', 25200000),
('BE 1992 L', 'MPV', 'Toyota Avanza', 5000000),
('BE 1993 P', 'City car', 'Toyota Avanza', 9000000),
('D 1685 AC', '	Mobil SUV', 'Toyota Rush G AT', 55000000),
('D 1768 AF', 'MPV', 'Toyota Avanza 1.3 G ', 25000000),
('D 1880 RZ', 'MPV', 'Nissan Grand Livina ', 70000000),
('F 1318 AT', 'Mobil Double Cabin', 'Isuzu D-Max Double C', 70000000);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(10) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `password`) VALUES
(1, 'Dimas Budi Pratama', '$2b$12$CbllSdOuOn92Pfcz9y3OpegZHKZmlMlaiOITWgbhXPbGTasmKg2si'),
(2, 'DimasJr', '$2b$12$E3oa40oVIujADH5Y8IpLyeENuryn/kggcgdH.AcKqD0Iaq5KwpIUS'),
(4, 'arigustiawansyah', '$2b$12$Z53NBiodr4.Un3uagHRkQ.boYjBZs2dpNB3/4JNKiu/9L/IB0bJGW'),
(5, 'ari', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `no_transaksi` varchar(10) NOT NULL,
  `tgl_peminjaman` date DEFAULT NULL,
  `id_petugas` varchar(16) DEFAULT NULL,
  `id_penyewa` varchar(20) DEFAULT NULL,
  `no_pol` varchar(9) DEFAULT NULL,
  `lama_peminjaman` int(2) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`no_transaksi`, `tgl_peminjaman`, `id_petugas`, `id_penyewa`, `no_pol`, `lama_peminjaman`, `harga`, `jk`) VALUES
('P02', '2019-08-30', '1958985600235410', '1978985600234410', 'B 234 TNP', 2, 550000, 'P'),
('P03', '2019-09-01', '1958985600235400', '1978985600234420', 'B 1521 PR', 4, 950000, 'P'),
('P04', '2019-09-03', '1958985600235410', '1978985600234430', 'B 1683 SE', 2, 900000, 'P'),
('P05', '2019-10-05', '1958985600235400', '1978985600234440', 'D 1685 AC', 1, 550000, 'L'),
('P06', '2019-10-06', '1958985600235410', '1978985600234450', 'B 1491 TY', 1, 750000, 'L'),
('P07', '2019-11-01', '1958985600235400', '1978985600234460', 'D 1880 RZ', 2, 352000, 'L'),
('P08', '2019-11-01', '1958985600235400', '1978985600234470', 'B 1041 TF', 3, 198000, 'L');

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `no_transaksi` varchar(10) NOT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `id_petugas` varchar(16) DEFAULT NULL,
  `id_penyewa` varchar(20) DEFAULT NULL,
  `no_pol` varchar(9) DEFAULT NULL,
  `id_denda` varchar(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`no_transaksi`, `tgl_kembali`, `id_petugas`, `id_penyewa`, `no_pol`, `id_denda`, `harga`) VALUES
('K01', '2020-01-15', '1958985600235370', '1978985600234440', 'B 1471 BK', '2', 21313),
('K02', '2019-09-01', '1958985600235410', '1978985600234410', 'B 234 TNP', '2', 1400000),
('K03', '2019-09-05', '1958985600235400', '1978985600234420', 'B 1521 PR', '2', 4100000),
('K04', '2019-09-05', '1958985600235410', '1978985600234430', 'B 1683 SE', '2', 2100000),
('K05', '2019-10-06', '1958985600235400', '1978985600234440', 'D 1685 AC', '4', 50550000),
('K06', '2019-10-07', '1958985600235410', '1978985600234450', 'B 1491 TY', '3', 3750000),
('K07', '2019-11-03', '1958985600235400', '1978985600234460', 'D 1880 RZ', '2', 1004000),
('K08', '2019-11-05', '1958985600235400', '1978985600234470', 'B 1041 TF', '1', 644000);

-- --------------------------------------------------------

--
-- Table structure for table `penyewa`
--

CREATE TABLE `penyewa` (
  `id_penyewa` varchar(20) NOT NULL,
  `nm_penyewa` varchar(35) DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL,
  `alamat_penyewa` text,
  `no_hp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penyewa`
--

INSERT INTO `penyewa` (`id_penyewa`, `nm_penyewa`, `jk`, `alamat_penyewa`, `no_hp`) VALUES
('1978985600234400', 'Laras Fitrianingsih', 'P', 'Jl.Ahmad Yani NO 90 RT/RW 001/002,Bandar Lampung', '85678124595'),
('1978985600234410', 'Laura Carona', 'P', 'Jl.Basuki Rahmat NO 90 RT/RW 001/002,Pesawaran', '85678124596'),
('1978985600234420', 'Libby Afipa Editanisa', 'P', 'Jl.Ahmad Yani2 NO 90 RT/RW 001/002,Lampung Selatan', '85678124597'),
('1978985600234430', 'Lidia Firda Saputri', 'P', 'Jl.Ahmad Yani NO 90 RT/RW 001/002,Bandar Lampung', '85678124598'),
('1978985600234440', 'M. Fajri Ramadhan', 'L', 'Jl.Basuki Rahmat NO 90 RT/RW 001/002,Pesawaran', '85678124599'),
('1978985600234450', 'M. Ilham Yusuf Gumai', 'L', 'Jl.Basuki Rahmat NO 90 RT/RW 001/002,Pesawaran', '85678124600'),
('1978985600234460', 'Made Slimacek', 'L', 'Jl.Z.A Pagar Alam NO 190,Kedaton', '85678124601'),
('1978985600234470', 'Mudo Kurniawan', 'L', 'Jl.Paguyuban Tirtayasa,Kemiling,Bandar Lampung', '85678124602'),
('1978985600234480', 'Muh. Aulia Prima Insani', 'L', 'Jl.Taman Margasatwa No.12,Warung Buncit,Jakarta Selatan', '85678124603'),
('1978985600234490', 'Muhammad Ichsan Rofiqo', 'L', 'JL. Tebet Raya No. 84, Tebet, Jakarta Selatan', '85678124604'),
('1978985600234500', 'Ongky Alexander', 'L', 'Jl. Metro Pondok Indah Kav. IV, Kebayoran Lama, Jakarta Selatan', '85678124605'),
('1978985600234510', 'Putri Mellyana Eka Safitri', 'P', 'Jl. KH. Agus Salim No. 29A Jakarta Pusat.', '85678124606'),
('1978985600234520', 'Renaldhi Fitra Yudha', 'L', 'Jl. Hos Cokroaminoto, No. 84, Menteng Jakarta Pusat.', '85678124607'),
('1978985600234530', 'Reza Janati Utami', 'P', 'Jl. Ahmad Dahlan/ Jl. Bacang I No.2 Jakarta Selatan', '85678124608'),
('1978985600234540', 'Romi Wijayanti', 'P', 'Jl. Raya Tirtomarto No.67 Ampelgading', '85678124609'),
('1978985600234550', 'Rona Arika Hasna', 'P', 'Jl. Raya Pasar Minggu Jakarta Selatan, Sebelah Makam Pahlawan Kalibata Jakarta Selatan', '85678124610'),
('1978985600234560', 'Safira Novrianti', 'P', 'Jl. Semeru Selatan No.23 Dampit ', '85678124611'),
('1978985600234570', 'Safira Ramadani', 'P', 'Jl. Benda No. 20D, Kemang Jakarta Selatan', '85678124612'),
('1978985600234580', 'Salza Firdiana Izmi', 'P', 'Jl. Arya Putra, Kedaung Ciputat Tangerang', '85678124613'),
('1978985600234590', 'Shinta', 'P', 'Jl. Raya Hasanudin No.180 Gedangan', '85678124614'),
('1978985600234600', 'Shoni Setiawan', 'L', 'Jl. Brigjend Abdul Manan No.8 Pujon', '85678124615'),
('1978985600234610', 'Stephani Yolanda', 'P', 'Jl. Raya Gunung Kawi No.10 Wonosari', '85678124616'),
('1978985600234620', 'Suryani', 'L', 'Jl. Alam Segar 3 No. 8, Pondok Indah Jakarta Selatan', '85678124617'),
('1978985600234630', 'Syaharani', 'P', 'Jl. Raya Sukolilo No. 1', '85678124618'),
('1978985600234640', 'Tika Nur Annisa', 'P', 'Jl. Kawi No.50 Kepanjen', '85678124619'),
('1978985600234650', 'Tri Wahyudi', 'L', 'Jl. Nailun Selatan No.85 Kromengan', '85678124620');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` varchar(20) NOT NULL,
  `nm_petugas` varchar(35) DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL,
  `jabatan` varchar(15) DEFAULT NULL,
  `gaji` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nm_petugas`, `jk`, `jabatan`, `gaji`) VALUES
('1958985600235370', 'Juztino Maratole', 'L', 'Sopir', 10000000),
('1958985600235380', 'Ayu Fariska', 'P', 'Sopir', 3000000),
('1958985600235390', 'Sumitri Alibaba', 'L', 'Sopir', 0),
('1958985600235400', 'Yulia Purba', 'P', 'Kasir', 0),
('1958985600235410', 'Ageng Yulia', 'P', 'Kasir', 0),
('1958985600235420', 'Julio Farastika Siantar', 'L', 'Manager', 50000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `denda`
--
ALTER TABLE `denda`
  ADD PRIMARY KEY (`id_denda`);

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`no_pol`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`no_transaksi`),
  ADD KEY `id_penyewa` (`id_penyewa`),
  ADD KEY `id_petugas` (`id_petugas`),
  ADD KEY `no_pol` (`no_pol`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`no_transaksi`),
  ADD KEY `id_penyewa` (`id_penyewa`),
  ADD KEY `id_petugas` (`id_petugas`),
  ADD KEY `no_pol` (`no_pol`),
  ADD KEY `id_denda` (`id_denda`);

--
-- Indexes for table `penyewa`
--
ALTER TABLE `penyewa`
  ADD PRIMARY KEY (`id_penyewa`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_penyewa`) REFERENCES `penyewa` (`id_penyewa`);

--
-- Constraints for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD CONSTRAINT `pengembalian_ibfk_3` FOREIGN KEY (`no_pol`) REFERENCES `kendaraan` (`no_pol`),
  ADD CONSTRAINT `pengembalian_ibfk_4` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengembalian_ibfk_5` FOREIGN KEY (`id_denda`) REFERENCES `denda` (`id_denda`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
