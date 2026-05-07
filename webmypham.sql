-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2026 at 05:24 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webmypham`
--

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `id` varchar(20) NOT NULL,
  `ten` varchar(255) NOT NULL,
  `gia` varchar(50) NOT NULL,
  `hinh` varchar(500) NOT NULL,
  `mo_ta` text DEFAULT NULL,
  `thuong_hieu` varchar(255) DEFAULT NULL,
  `trong_luong` varchar(100) DEFAULT NULL,
  `mau_sac` varchar(100) DEFAULT NULL,
  `han_dung` varchar(100) DEFAULT NULL,
  `danh_muc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`id`, `ten`, `gia`, `hinh`, `mo_ta`, `thuong_hieu`, `trong_luong`, `mau_sac`, `han_dung`, `danh_muc`) VALUES
('MP001', 'Son li mem min', '320,000 VND', 'https://picsum.photos/560/460?11', 'Son co chat kem min, len mau chuan, bam tot nhieu gio va khong gay kho moi.', 'TSV Cosmetic', '3.5g', 'Do hong', '24 thang', 'noibat'),
('MP002', 'Kem nen che phu', '289,000 VND', 'https://picsum.photos/560/460?12', 'Kem nen mong nhe, che phu tot, giu lop trang diem ben dep.', 'TSV Makeup', '30ml', 'Natural Beige', '18 thang', 'noibat'),
('MP003', 'Phan mat 6 mau', '199,000 VND', 'https://picsum.photos/560/460?13', 'Bang mau de phoi, chat phan min, bam mau on dinh.', 'TSV Beauty', '18g', 'Warm tone', '24 thang', 'noibat'),
('MP004', 'Serum cap am', '350,000 VND', 'https://picsum.photos/560/460?14', 'Serum giup cap am sau, lam diu da va ho tro phuc hoi da.', 'TSV Skin', '50ml', 'Trong suot', '24 thang', 'hangmoi'),
('MP005', 'Sua rua mat diu nhe', '149,000 VND', 'https://picsum.photos/560/460?21', 'Lam sach da nhe nhang, khong gay kho cang sau khi su dung.', 'TSV Skin', '100ml', 'Trang nga', '24 thang', 'hangmoi'),
('MP006', 'Kem chong nang SPF50+', '259,000 VND', 'https://picsum.photos/560/460?22', 'Chong nang pho rong, chat kem mong nhe, khong bet dinh.', 'TSV UV', '50ml', 'Trang sua', '24 thang', 'hangmoi'),
('MP007', 'Nuoc hoa mini 30ml', '420,000 VND', 'https://picsum.photos/560/460?23', 'Mui huong thanh lich, luu huong tot, thiet ke chai nho gon.', 'TSV Perfume', '30ml', 'Hong pastel', '36 thang', 'banchay'),
('MP008', 'Xit khoang duong da', '179,000 VND', 'https://picsum.photos/560/460?24', 'Bo sung do am tuc thi, ho tro lam diu va giu lop trang diem lau hon.', 'TSV Skin', '150ml', 'Trong suot', '24 thang', 'banchay'),
('MP009', 'Mat na cap nuoc', '89,000 VND', 'https://picsum.photos/560/460?31', 'Mat na duong am nhanh, giup da mem min va tuoi tan.', 'TSV Mask', '25ml', 'Trang', '18 thang', 'banchay'),
('MP010', 'Toner hoa cuc', '199,000 VND', 'https://picsum.photos/560/460?32', 'Lam diu da, can bang do pH va ho tro lam sach sau rua mat.', 'TSV Skin', '200ml', 'Vang nhat', '24 thang', 'giamgia'),
('MP011', 'Kem duong dem', '275,000 VND', 'https://picsum.photos/560/460?33', 'Duong am va phuc hoi da ban dem, cho lan da mem muot vao sang hom sau.', 'TSV Care', '50g', 'Trang kem', '24 thang', 'giamgia'),
('MP012', 'Son duong co mau', '109,000 VND', 'https://picsum.photos/560/460?34', 'Son duong mem moi, co mau nhe, phu hop su dung hang ngay.', 'TSV Lip', '4g', 'Hong dao', '24 thang', 'giamgia');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
