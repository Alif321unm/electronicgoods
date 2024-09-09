-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2022 at 05:34 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `electronicgoods`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(10, 'Pendingin'),
(11, 'Media'),
(12, 'Alat Rumah');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `idbeli` int(11) NOT NULL,
  `nama` text NOT NULL,
  `tanggaltransfer` text NOT NULL,
  `tanggal` datetime NOT NULL,
  `bukti` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `idbeli` int(11) NOT NULL,
  `notransaksi` text NOT NULL,
  `id` int(11) NOT NULL,
  `tanggalbeli` date NOT NULL,
  `totalbeli` text NOT NULL,
  `alamatpengiriman` text NOT NULL,
  `totalberat` varchar(255) NOT NULL,
  `kota` text NOT NULL,
  `ongkir` text NOT NULL,
  `hargapemasangan` text NOT NULL,
  `statusbeli` text NOT NULL,
  `resipengiriman` text NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pembelianproduk`
--

CREATE TABLE `pembelianproduk` (
  `idbeli_produk` int(11) NOT NULL,
  `idbeli` text NOT NULL,
  `id` text NOT NULL,
  `idproduk` text NOT NULL,
  `nama` text NOT NULL,
  `harga` text NOT NULL,
  `berat` text NOT NULL,
  `subberat` text NOT NULL,
  `subharga` text NOT NULL,
  `jumlah` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `telepon` varchar(12) NOT NULL,
  `alamat` text NOT NULL,
  `fotoprofil` varchar(255) NOT NULL,
  `level` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `nama`, `email`, `password`, `telepon`, `alamat`, `fotoprofil`, `level`) VALUES
(1, 'Administrator', 'admin@gmail.com', 'admin', '0812345678', 'Palembang', 'Untitled.png', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `idproduk` int(11) NOT NULL,
  `id_kategori` text NOT NULL,
  `namaproduk` text NOT NULL,
  `hargaproduk` text NOT NULL,
  `beratproduk` text NOT NULL,
  `stokproduk` text NOT NULL,
  `fotoproduk` text NOT NULL,
  `deskripsiproduk` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`idproduk`, `id_kategori`, `namaproduk`, `hargaproduk`, `beratproduk`, `stokproduk`, `fotoproduk`, `deskripsiproduk`) VALUES
(3, '10', 'Kulkas ELECTROLUX ETB 2502J-A', '6000000', '60', '50', '0fe926eb-b6d2-455f-8829-8f15afb64c46.jpg', '<p><em>Lemari es Electrolux ETB2502J-A dilengkapi dengan Taste Seal, mampu menjaga kesegaran daging dan ikan selama 7 hari * tanpa pembekuan.<br />\r\nKompartemen TasteSeal mempertahankan suhu konsisten -2 &deg; C untuk menjaga bahan-bahan terbaik Anda dalam kondisi prima hingga 7 hari * tanpa pembekuan. Artinya, Anda selalu bisa memasak dari daging segar untuk menyajikan daging dan makanan laut yang bertekstur juicy, warnanya cerah, dan rasanya enak.<br />\r\nKapasitas Produk<br />\r\nKapasitas Kotor Total Unit (L) 225<br />\r\nKapasitas Bersih Ruang Pendingin (L) 163<br />\r\nKapasitas Bersih Ruang Pembeku (L) 62<br />\r\nKapasitas Bersih Total Unit (L) 225<br />\r\n- Dimensi Produk<br />\r\nTinggi produk 1470 mm<br />\r\nLebar produk 540 mm<br />\r\nKedalaman produk 615 mm<br />\r\nBerat Produk (kg): 49.9<br />\r\nDengan alarm / Door Alarm<br />\r\n- Pembuat es / ice tray<br />\r\n- Baki telur<br />\r\n- Garansi Resmi PT.ELECTROLUX INDONESIA untuk Kompresor 10Tahun dan Garansi Spareparts 1Tahun</em></p>\r\n'),
(4, '10', 'RSA Freezer box CF 210 / CF210 200 Liter', '2500000', '45', '67', 'e2da5531-fc9b-44ae-af58-fc52e85de05f.jpg', '<p>Garansi resmi RSA 1th sparepart dan 5th kompresor</p>\r\n\r\n<p>Pilihan pengiriman klik KURIR TOKO<br />\r\nFREE antar khusus JAKARTA saja (dikirim 1-3hr kerja),<br />\r\nBodetabek kota ada transport bervariasi<br />\r\nbiaya transport sebagai berikut :<br />\r\n- Tangerang, Depok dan cibubur 100rb<br />\r\n- Bogor dan bekasi kota 150rb ( khusus bagian kota saja, kabupaten tidak bisa )<br />\r\n- Cikarang 250rb</p>\r\n\r\n<p>Pilihan pengiriman klik KURIR TOKO<br />\r\n(pengiriman 1-3hr kerja)</p>\r\n\r\n<p>CF 210<br />\r\ndimensi :80,2x55,9x85,4cm<br />\r\nvolume : 200Liter<br />\r\nkonsumsi listrik : 120w<br />\r\ncocok untuk memajang makanan yang sudah beku seperti sosis, ice cream, nugget dll<br />\r\ntidak cocok untuk membekukan cairan<br />\r\neasy self install / mudah untuk diinstalasi oleh customer (handle, kunci, roda dll)</p>\r\n'),
(5, '11', 'Samsung Smart TV 43 inch UHD 4K', '4000000', '67', '9', '0945b5f5-1b7f-4661-b12f-0bbb2891421e.jpg', '<p>Kondisi: Baru<br />\r\nBerat Satuan: 67 kg<br />\r\nKategori: Televisi<br />\r\nEtalase: TV PROMO<br />\r\nNOTED : Barang yang sudah dipesan tidak bisa dibatalkan kecuali ada cacat produk (kelalaian dalam pengiriman)</p>\r\n\r\n<p>JABODETABEK ONLY</p>\r\n\r\n<p>[DESKRIPSI PRDUK]</p>\r\n\r\n<p>Deskripsi Produk :</p>\r\n\r\n<p>- Open up your smart 4K experience<br />\r\n- PurColor<br />\r\n- Crystal Processor 4K<br />\r\n- Motion Xcelerator<br />\r\n- 4K Resolution<br />\r\n- HDR<br />\r\n- Motion Xcelerator<br />\r\n- 4K Resolution<br />\r\n- HDR<br />\r\n- Q-Symphony<br />\r\n- Desain dengan 3-Bezeless<br />\r\n- Clean Cable Solution<br />\r\n- Clean Cable Solution<br />\r\n- PC on TV<br />\r\n&nbsp;</p>\r\n'),
(8, '10', 'INDOOR AC SPLIT 1/2 PK ', '1600000', '1', '13', '18828d9d-ae72-4657-b32d-5aa6c9c638d2.jpg', '<ul>\r\n	<li>Kondisi:&nbsp;Baru</li>\r\n	<li>Berat Satuan:&nbsp;1 kg</li>\r\n	<li>Kategori:&nbsp;<a href=\"https://www.tokopedia.com/p/elektronik/alat-pendingin-ruangan/air-conditioner\" target=\"_blank\"><strong>Air Conditioner</strong></a></li>\r\n	<li>Etalase:&nbsp;<a href=\"https://www.tokopedia.com/pasha2013/etalase/elektronik\" target=\"_blank\"><strong>ELEKTRONIK</strong></a></li>\r\n</ul>\r\n\r\n<p>INDOOR AC SPLIT 1/2 PK DAN JASA PEMASANGAN<br />\r\n<br />\r\nHarga Diatas Sudah Termasuk :<br />\r\nMerk AQUA<br />\r\n<br />\r\n1. 1 Unit Indoor<br />\r\n2. Remote<br />\r\n3. Bracket Indoor<br />\r\n4. Freon<br />\r\n5. Garansi Toko 1 Bulan<br />\r\n6. Barang Semua Baru Bukan Barang Bekas<br />\r\n<br />\r\nChat Wa 0812 - 1859 - 1823</p>\r\n'),
(9, '12', 'Mesin Cuci LG FM1007N3W', '4500000', '70', '17', '76fc6722-784e-4ef2-8123-6bfcab8d88d1.jpg', '<ul>\r\n	<li>Kondisi:&nbsp;Baru</li>\r\n	<li>Berat Satuan:&nbsp;70 kg</li>\r\n	<li>Kategori:&nbsp;<a href=\"https://www.tokopedia.com/p/elektronik/elektronik-rumah-tangga/mesin-cuci\" target=\"_blank\"><strong>Mesin Cuci</strong></a></li>\r\n	<li>Etalase:&nbsp;<a href=\"https://www.tokopedia.com/jwinelectronic/etalase/washing-machine\" target=\"_blank\"><strong>WASHING MACHINE</strong></a></li>\r\n</ul>\r\n\r\n<p>*Hai Agan &amp; Sist Jwin Electronic, Kami adalah Jwin Electronic OFFICIAL STORE<br />\r\n*Barang Dari OFFICIAL STORE Sudah Pasti 100% Baru, Segel, Garansi Resmi<br />\r\n*Jangka Waktu Pengiriman 1-3 Hari Kerja ( Senin - Minggu ) Jam 12-20<br />\r\n*Semua Produk TV diatas 43 Inc Hanya Kena Biaya Charge Rp. 20.000<br />\r\n*Untuk Produk BESAR seperti Kulkas dan Mesin Cuci Free Jakarta dengan pemilihan &quot;COSTUM LOGISTIK&quot;, diluar itu harap chat kami<br />\r\n*OFFICIAL STORE memberikan Garansi Cacat Pabrik yaitu 7 Hari kerja untuk tukar BARU (jika ada kerusakan sistem seperti mati suara, tv tidak menyala, input tidak berfungsi, dsb)<br />\r\n*Pengiriman Barang di luar JAKARTA, Harap Konfirmasi Terlebih dahulu ( 0813 84 332 332 )<br />\r\n<br />\r\n<br />\r\nFM1007N3W<br />\r\nMesin Cuci LG Front Loading 7kg, Inverter Direct Drive&trade; dengan Smart Diagnosis&trade;<br />\r\nPencucian Optimal 6 Gerakan - 6 Motion DD<br />\r\nTidak Bergetar, Tidak Berisik<br />\r\nInverter Direct Drive&trade;<br />\r\nSmart Diagnosis&trade;<br />\r\nTabung Stainless Steel Lebih Higienis<br />\r\n<br />\r\nDIMENSI<br />\r\n<br />\r\nRINGKASAN<br />\r\nKAPASITAS<br />\r\n7 kg<br />\r\nDIMENSI (PXTXL, MM)<br />\r\n600mm x 440mm x 850mm<br />\r\nWARNA FINISHING<br />\r\nPutih<br />\r\nTIPE<br />\r\nFront Loading - Inverter Direct Drive Motor&trade;<br />\r\nTUTUP<br />\r\nSPESIFIKASI UMUM<br />\r\nTipe Front Loading - Inverter Direct Drive Motor&trade;Kapasitas 7 kg<br />\r\nWarna PutihSmart Smart Diagnosis<br />\r\nDimensi (PxTxL, mm) 600mm x 440mm x 850mmLebar dengan Pintu terbuka (L&#39;) 600<br />\r\nLebar dari penutup belakang ke pintu (L&quot;) 1005Spin 1000 rpm<br />\r\nFITUR<br />\r\n6motions for Better performance Ya1000 RPM Ya<br />\r\n10yr Warranty on DD Motor YaSmart Diagnosis&trade; dengan NFC Control Ya<br />\r\nBig Touch White-LED Display (Black) YaWhite Door Ya</p>\r\n'),
(13, '12', ' Shimizu Pompa Air PS 135 E', '600000', '9', '109', '90a50234-b3f9-4991-9d8d-71f0515bf482.jpg', '<p>Kondisi: Baru<br />\r\nBerat Satuan: 9 kg<br />\r\nKategori: Pompa Air<br />\r\nEtalase: 28 WATER PUMP Aksesoris Pompa Air<br />\r\nPompa air listrik: Otomatis<br />\r\n- Daya keluar : 125 watt<br />\r\n- Daya masuk : 300 watt<br />\r\n- Daya hisap max : 9 meter<br />\r\n- Total head maks 40 meter<br />\r\n- Pipa hisap ukuran : 1&quot;<br />\r\n- Pipa dorong ukuran : 1&quot;<br />\r\n- SNI / ISO 9001 : 2008<br />\r\n- Garansi motor 3 tahun<br />\r\n- Garansi servis 1 tahun</p>\r\n\r\n<p>Customer care : 0800-1-889-889 (bebas pulsa)</p>\r\n');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`idbeli`);

--
-- Indexes for table `pembelianproduk`
--
ALTER TABLE `pembelianproduk`
  ADD PRIMARY KEY (`idbeli_produk`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`idproduk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `idbeli` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembelianproduk`
--
ALTER TABLE `pembelianproduk`
  MODIFY `idbeli_produk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `idproduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
