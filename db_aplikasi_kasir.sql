-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2024 at 06:13 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_aplikasi_kasir`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `cari_kategori` (IN `namaNya` VARCHAR(50))   SELECT kategori.nama_kategori
FROM kategori
WHERE nama_kategori LIKE concat("%",namaNya,"%")$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cari_user` (IN `namauser` VARCHAR(50))   SELECT user.email,
user.nama_user,
user.level,
user.status
FROM user
WHERE nama_user LIKE concat("%",namauser,"%")$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `detail_kategori` (IN `idNya` INT(3))   SELECT kategori.id_kategori, kategori.nama_kategori
FROM kategori
WHERE id_kategori=idNya$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `hapus_detailPenjualan` (IN `idNya` INT(3))   BEGIN
DELETE FROM detailpenjualan WHERE id_detail=idNya;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `hapus_kategori` (IN `idNya` INT(3))   BEGIN
DELETE FROM kategori WHERE id_kategori=idNya;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `hapus_produk` (IN `kodeNya` VARCHAR(25))   BEGIN
DELETE FROM produk WHERE kode_produk=kodeNya;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `hapus_satuan` (IN `idNya` INT(11))   BEGIN
DELETE FROM satuan WHERE id_satuan=idNya;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `hapus_user` (IN `emailNya` VARCHAR(255))   BEGIN
DELETE FROM user WHERE email=emailNya;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lihat_laporan` ()   SELECT produk.nama_produk, produk.harga_beli, produk.harga_jual, produk.stok
FROM produk

ORDER BY produk.stok ASC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lihat_produkpenjualan` ()   SELECT produk.kode_produk, produk.nama_produk, produk.harga_jual, produk.stok
FROM produk$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_produk` (IN `kodeNya` VARCHAR(25), IN `namaNya` VARCHAR(50), IN `hargabeliNya` INT(11), IN `hargajualNya` INT(11), IN `idNya` INT(3), IN `stokNya` INT(11), IN `idSatuan` INT(11))   BEGIN
INSERT INTO produk(kode_produk, nama_produk, harga_beli, harga_jual, id_kategori, stok, id_satuan) VALUES (kodeNya, namaNya, hargabeliNya, hargajualNya, idNya, stokNya, idSatuan);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_satuan` (IN `idNya` INT(11), IN `namaNya` VARCHAR(50))   BEGIN 
INSERT INTO satuan (id_satuan, nama_satuan) VALUES ('idNya','namaNya');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_user` (IN `emailNya` VARCHAR(255), IN `namauser` VARCHAR(50), IN `passwordNya` VARCHAR(32), IN `levelNya` ENUM('admin','kasir'))   BEGIN
INSERT INTO user(email, nama_user, password, level, status) VALUES (emailNya, namauser, md5(passwordNya), levelNya, 'aktif');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tampil_kategori` ()   BEGIN
SELECT * FROM kategori;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tampil_penjualan` ()   BEGIN
SELECT * FROM penjualan;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tampil_produk` ()   SELECT produk.kode_produk,
	   produk.nama_produk,
       produk.harga_beli,
       produk.harga_jual,
       kategori.nama_kategori,
       produk.stok,
       satuan.nama_satuan
FROM produk
JOIN kategori ON kategori.id_kategori=produk.id_kategori
JOIN satuan ON satuan.id_satuan=produk.id_satuan$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tampil_satuan` ()   BEGIN 
SELECT * FROM satuan;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tampil_user` ()   BEGIN
SELECT * FROM user;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_kategori` (IN `idNya` INT(3), IN `namaNya` VARCHAR(50))   BEGIN
UPDATE kategori SET nama_kategori=namaNya WHERE id_kategori=idNya;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_produk` (IN `kodeNya` VARCHAR(25), IN `namaNya` VARCHAR(50), IN `hargabeliNya` INT(11), IN `hargajualNya` INT(11), IN `idNya` INT(3), IN `stokNya` INT(11), IN `idSatuan` INT(11))   BEGIN
UPDATE produk SET kode_produk=kodeNya, 
nama_produk=namaNya,
harga_beli=hargabeliNya,
harga_jual=hargajualNya,
id_kategori=idNya,
stok=stokNya,
id_satuan=idSatuan
WHERE kode_produk=kodeNya;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_satuan` (IN `idNya` INT(11), IN `namaNya` VARCHAR(50))   BEGIN
UPDATE satuan SET nama_satuan=namaNya WHERE id_satuan=idNya;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user` (IN `emailNya` VARCHAR(255), IN `namaNya` VARCHAR(50), IN `passwordNya` CHAR(32), IN `levelNya` ENUM('admin','kasir'), IN `statusNya` ENUM('aktif','tidak aktif'))   BEGIN
UPDATE user SET nama_user=namaNya, password=passwordNya, level=levelNya, status=statusNya WHERE email=emailNya;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detailpenjualan`
--

CREATE TABLE `detailpenjualan` (
  `id_detail` int(3) NOT NULL,
  `kode_produk` varchar(25) NOT NULL,
  `kode_penjualan` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detailpenjualan`
--

INSERT INTO `detailpenjualan` (`id_detail`, `kode_produk`, `kode_penjualan`, `qty`, `total_harga`) VALUES
(41, 'SNK0002', 0, 0, 600000),
(42, 'SNK0003', 0, 2, 800000),
(43, 'SNK0003', 0, 2, 800000),
(44, 'SNK0002', 34, 1, 200000),
(45, 'SNK0002', 34, 1, 200000),
(46, 'SNK0002', 0, 1, 200000),
(47, 'SNK0002', 0, 1, 200000),
(48, 'SNK0002', 35, 1, 200000),
(49, 'SNK0002', 35, 1, 200000),
(50, 'SNK0002', 0, 1, 200000),
(51, 'SNK0002', 0, 1, 200000),
(52, 'SNK0002', 36, 1, 200000),
(53, 'SNK0002', 36, 1, 200000),
(54, 'SNK0001', 37, 1, 200000),
(55, 'SNK0002', 37, 1, 200000),
(56, 'SNK0003', 37, 1, 400000),
(57, 'SNK0001', 38, 1, 200000);

--
-- Triggers `detailpenjualan`
--
DELIMITER $$
CREATE TRIGGER `kurangiStok` AFTER INSERT ON `detailpenjualan` FOR EACH ROW UPDATE produk SET produk.stok=produk.stok - new.qty
WHERE produk.kode_produk = new.kode_produk
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tambahTotalHarga` AFTER INSERT ON `detailpenjualan` FOR EACH ROW UPDATE penjualan SET penjualan.total_harga=penjualan.total_harga+new.total_harga
WHERE penjualan.kode_penjualan=new.kode_penjualan
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(3) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Sneakers'),
(5, 'High Heels'),
(30, 'Boots'),
(31, 'Sport');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `kode_penjualan` int(11) NOT NULL,
  `no_faktur` varchar(50) NOT NULL,
  `tgl_penjualan` datetime NOT NULL,
  `total_harga` int(11) NOT NULL,
  `cash` int(11) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`kode_penjualan`, `no_faktur`, `tgl_penjualan`, `total_harga`, `cash`, `email`) VALUES
(34, '202402280001', '2024-02-28 10:37:03', 800000, 0, 'diniamelia705@gmail.com'),
(35, '202402280002', '2024-02-28 10:39:12', 800000, 0, 'diniamelia705@gmail.com'),
(36, '202402280003', '2024-02-28 10:46:33', 800000, 0, 'diniamelia705@gmail.com'),
(37, '202402280004', '2024-02-28 11:04:04', 1600000, 0, 'diniamelia705@gmail.com'),
(38, '202402280005', '2024-02-28 11:49:32', 400000, 0, 'diniamelia705@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `kode_produk` varchar(25) NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `id_kategori` int(3) NOT NULL,
  `stok` int(11) NOT NULL,
  `id_satuan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`kode_produk`, `nama_produk`, `harga_beli`, `harga_jual`, `id_kategori`, `stok`, `id_satuan`) VALUES
('SNK0001', 'Sneakers Anak Uk 34', 100000, 200000, 1, 8, 2),
('SNK0002', 'Sneakers Uk 42', 150000, 200000, 1, 9, 2),
('SNK0003', 'Boots Nike Uk 40', 230000, 400000, 30, 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `id_satuan` int(11) NOT NULL,
  `nama_satuan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`id_satuan`, `nama_satuan`) VALUES
(2, 'Box');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `email` varchar(255) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `level` enum('admin','kasir') NOT NULL,
  `status` enum('aktif','tidak aktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`email`, `nama_user`, `password`, `level`, `status`) VALUES
('diniamelia705@gmail.com', 'Putri Dini', '5968996e0aca329cf3218086223f8308', 'admin', 'aktif'),
('naufalali@gmail.com', 'Naufal', '49c0b9d84c2a16fcaf9d25694fda75e1', 'kasir', 'tidak aktif'),
('raisaaprilia@gmail.com', 'Raisa Aprilia', '0404', 'admin', 'aktif'),
('renjun@gmail.com', 'Renjun', 'bc6dc48b743dc5d013b1abaebd2faed2', 'kasir', 'aktif');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detailpenjualan`
--
ALTER TABLE `detailpenjualan`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `kode_penjualan` (`kode_penjualan`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`kode_penjualan`),
  ADD KEY `id_user` (`email`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`kode_produk`),
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_satuan` (`id_satuan`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detailpenjualan`
--
ALTER TABLE `detailpenjualan`
  MODIFY `id_detail` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `kode_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`),
  ADD CONSTRAINT `produk_ibfk_3` FOREIGN KEY (`id_satuan`) REFERENCES `satuan` (`id_satuan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
