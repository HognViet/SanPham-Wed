-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2026 at 06:10 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

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
('MP001', 'Son Tint Romand Juicy Lasting Tint', '199,000 VND', 'image/sp1.jpg\r\n', 'Son tint bóng nhẹ với chất son mọng nước, lên màu tươi tắn, giúp môi căng bóng tự nhiên và bền màu nhiều giờ.', 'ROMAND', '4.6g', 'bare grape', '24 tháng ', 'noibat'),
('MP002', 'Son Kem 3CE', '338,000 VNĐ', 'image/sp2.jpg', 'Son kem lì nổi tiếng với chất son mềm mịn, che rãnh môi tốt, màu trendy và giữ màu khá lâu.', '3CE', '4.6g', 'laydown', ' 24 tháng ', 'noibat'),
('MP003', 'Son kem BBIA ', '165,00 VNĐ', 'image/sp3.jpg', 'Son kem lì mỏng nhẹ, độ bám cao, finish lì mịn nhưng không gây khô môi.', 'BBIA', '5g', 'Hồng Đất ', '24 tháng ', 'noibat'),
('MP004', 'Son Tint Peripera Water Bare Tint', '211,00 VNĐ', 'image/sp4.jpg', 'Son tint nước nhẹ môi, tạo hiệu ứng trong trẻo tự nhiên, dưỡng ẩm tốt và ít bết dính.', 'PERIPARA', '5g', 'Hồng ', '24 tháng ', 'hangmoi'),
('MP005', 'Son Tint Fwee Rose Obsession Stay-Fit Tint', '302,00 VNĐ', 'image/sp5.jpg', 'Son tint bóng với màu sắc ngọt ngào, chất son mịn nhẹ, giữ độ bóng và bám màu ổn định.', 'FWEE', '4.6g', 'Hồng Son', '24 tháng ', 'hangmoi'),
('MP006', 'Son Kem Mooekiss Velvet Lip Mud', '169,000 VNĐ', 'image/sp6.jpg', 'Son kem bùn lì với texture đặc mịn, che phủ môi tốt và tạo hiệu ứng môi mờ sang trọng.', 'MOOEKISS', '4.8g', 'Cam đất ', '24 tháng ', 'hangmoi'),
('MP007', 'Son Bóng d\'Alba Plumping Lip Glow Volumizer - Petal Rose', '706,000VNĐ', 'image/sp7.jpg', 'Son bóng dưỡng môi giúp môi căng mọng, tạo hiệu ứng đầy môi và có độ bóng tự nhiên.', 'd\'Alba', '4.6g ', 'Đỏ nâu ', '36 tháng ', 'banchay'),
('MP008', 'Son ENTROPY Glossy Charm Tint Amber', '580,00VNĐ', 'image/sp8.jpg', 'Son tint bóng với sắc màu trong trẻo, tạo đôi môi căng mọng và mềm mượt suốt ngày dài.', 'ENTROPY', '4,9g', 'Đỏ mận ', '24 tháng ', 'banchay'),
('MP009', 'Son Tint Clio Crystal Glam Tint', '316,000VNĐ', 'image/sp9.jpg', 'Son tint bóng nhẹ, lên màu rõ, mang lại hiệu ứng môi căng bóng chuẩn Hàn Quốc.', 'CLIO', '4.8g', 'Đỏ pha cam ', '24 tháng ', 'banchay'),
('MP010', 'Phấn Nước Renoderm DayLong BB Cream Gold SPF37/PA', '650,00k', 'image/sp10.jpg', 'Phấn nước kiêm kem nền giúp che phủ tự nhiên, nâng tông da và hỗ trợ chống nắng hằng ngày.', 'RENODERM', '15g', 'Hồng trắng ', '24 tháng ', 'giamgia'),
('MP011', 'Kem Nền Catrice HD Liquid Coverage Foundation', '219,000VNĐ', 'image/sp11.jpg', 'Kem nền che phủ tốt, finish lì mịn tự nhiên, kiềm dầu khá ổn và lâu trôi.', 'CATRICE', '30g', 'Light beige', '24 tháng ', 'giamgia'),
('MP012', 'Phấn Phủ Carslan Soft Focus Dạng Bột 02 Siêu Kiềm Dầu Trong Suốt', '159,000VNĐ', 'image/sp12.jpg', 'Phấn phủ dạng bột giúp kiềm dầu, làm mịn da và cố định lớp makeup lâu trôi.', 'CARSLAN', '27g', 'Hồng đào ', '24 tháng ', 'giamgia'),
('MP013', 'Phấn Má Peripera Syrupy Tok Cheek Dạng Kem 05 Cool Apple', '251,000VNĐ', 'image/sp13.jpg', 'Phấn má kem với màu sắc tươi trẻ, dễ tán và tạo hiệu ứng căng bóng tự nhiên cho má.', 'PERIPERA', '17g', 'Hồng phấn ', '24 tháng ', 'giamgia'),
('MP014', 'Phấn Má 3CE Mood Recipe Face Blush', '338,000VNĐ', 'image/sp13.jpg', 'Phấn má lì hạt mịn, lên màu nhẹ nhàng tự nhiên và phù hợp phong cách makeup Hàn Quốc.', '3CE', '3.5g', 'Hồng', '30 tháng ', 'noibat'),
('MP015', 'Kem Dưỡng Trắng Da Body Rmon White Label Dia Whitening Cream', '369,000VNĐ', 'image/sp15.jpg', 'Kem dưỡng body hỗ trợ nâng tông và làm sáng da, giúp da mềm mịn và đều màu hơn.', 'RMON', '200ml', NULL, '36 tháng ', 'banchay'),
('MP016', 'Kem Chống Nắng d\'Alba Waterfull Tone-Up Pink Correcting SPF50', '530,000VNĐ', 'image/sp16.jpg', 'Kem chống nắng nâng tông nhẹ với khả năng bảo vệ da SPF50 và hiệu chỉnh sắc da hồng hào.', 'd\'Alba', '50ml', NULL, '36 tháng ', 'hangmoi'),
('MP017', 'Kem Chống Nắng Skin1004 Madagascar Centella Air-Fit Suncream Plus SPF50', '176,000VNĐ', 'image/sp17.jpg', 'Kem chống nắng vật lý dịu nhẹ chứa rau má, giúp bảo vệ da và hỗ trợ làm dịu kích ứng.', 'SKIN1004', '50ml', NULL, '36 tháng ', 'noibat'),
('MP018', 'Kem Dưỡng Ẩm Và Giúp Kiểm Soát Dầu Cerave Oil Control Moisturíing Gel', '370,00VNĐ', 'image/sp18.jpg', 'Gel dưỡng ẩm dành cho da dầu giúp cấp ẩm, kiểm soát dầu thừa và hỗ trợ phục hồi hàng rào da.', 'CERAVE', '50ml', NULL, '36 tháng ', 'giamgia'),
('MP019', 'Mặt Nạ Banobagi Vita Genic Jelly Mask - Màu Sắc:Vitalizing (Tím)', '20,00VNĐ', 'imgae/sp19.jpg', 'Mặt nạ giấy chứa tinh chất vitamin giúp cấp ẩm, làm sáng và phục hồi da mệt mỏi.', 'BANO:BAGI', '9g', NULL, '18 tháng ', 'banchay'),
('MP020', 'Sữa Dưỡng Thể Vaseline Healthy Bright UV Tone-Up Lotion Nâng Tông Sáng Da Tức Thì', '150,000VNĐ', 'image/sp20.jpg', 'Sữa dưỡng thể giúp nâng tông tức thì, dưỡng ẩm và hỗ trợ bảo vệ da dưới tia UV.', 'VASELINE', '320ml', NULL, '36 tháng ', 'noibat'),
('MP021', 'Kem Tắm Trắng Secret Key Snow White Milky Pack Làm Sáng Da Cho Mặt & Cơ Thể', '350,000VNĐ', 'image/sp21.jpg', 'Kem tắm trắng hỗ trợ làm sáng da tạm thời, dùng được cho mặt và cơ thể với hiệu ứng bật tông nhanh.', 'SECRET KEY', '220ml', NULL, '36 tháng ', 'noibat'),
('MP022', 'Dưỡng Thể Whisis Premium Collagen Whitening Body Lotion SPF50', '180,000VNĐ', 'image/sp22.jpg', 'Dưỡng thể chứa collagen giúp dưỡng ẩm, làm sáng da và hỗ trợ chống nắng cho body.', 'WHISIS', '200ml', NULL, '24 tháng ', 'hangmoi'),
('MP023', 'Kem Dưỡng Trắng Da Body Narci Natural Nâng Tông Smooth White Body', '365,000VNĐ', 'image/sp23.jpg', 'Kem dưỡng body nâng tông giúp da sáng đều màu, mềm mại và mịn màng hơn.', 'NARCI NATURAL', '200ml', NULL, '24 tháng ', 'banchay'),
('MP024', 'Serum d\'Alba White Truffle Dạng Xịt', '466,000VNĐ', 'image/sp24.jpg', 'Serum dạng xịt chứa nấm trắng Truffle giúp cấp ẩm, làm sáng và tăng độ căng bóng cho da.', 'd\'Alba', '110ml', NULL, '24 tháng ', 'noibat'),
('MP025', 'Sữa Rửa Mặt Obagi 2% BHA Clenziderm MD Daily Lightweight Sạch Sâu, Tẩy Tế Bào Chết', '1,150,000VNĐ', 'image/sp25.jpg', 'Sữa rửa mặt chứa BHA hỗ trợ làm sạch sâu, giảm dầu thừa và hỗ trợ tẩy tế bào chết nhẹ nhàng.', 'OBAGI', '120ml', NULL, '36 tháng ', 'banchay'),
('MP026', 'Sữa Tắm Tesori D\'Oriente Nước Hoa Hương Hoa Sen', '299,000VNĐ', 'image/sp26.jpg', 'Sữa tắm nước hoa với hương hoa sen thư giãn, giúp làm sạch và lưu hương lâu trên da.', 'TESORI D\'ORIENTE', '500ml', NULL, '36 tháng ', 'giamgia'),
('MP027', 'Kem Ủ Tóc Olexrs Hair Salon Argan Oil Collagen Complex Repair Mask', '180,00VNĐ', 'image/sp27.jpg', 'Kem ủ tóc chứa Argan Oil và Collagen giúp phục hồi tóc hư tổn, làm tóc mềm mượt và chắc khỏe.', 'OLEXRS', '500ml', NULL, '36 tháng ', 'giamgia'),
('MP028', 'Sữa Dưỡng Thể Eucerin Spotless Brightening Làm Sáng Da SPF 7', '399,00VNĐ', 'image/sp28.jpg', 'Sữa dưỡng thể hỗ trợ làm sáng da, cấp ẩm và cải thiện tình trạng da không đều màu.', 'EUCERIN', '250ml', NULL, '26 tháng ', 'hangmoi'),
('MP029', 'Sữa Dưỡng Thể Olay Whitening', '150,00VNĐ', 'image/sp29.jpg', 'Dưỡng thể giúp cấp ẩm, làm mềm da và hỗ trợ cải thiện độ sáng khỏe cho làn da.', 'OLAY', '260ml', NULL, '24 tháng ', 'banchay'),
('MP030', 'Tẩy Tế Bào Chết Body Cocoon Dak Lak Coffee Body Polish Cà Phê Đắk Lắk', '125,00VNĐ', 'image/sp30.jpg', 'Tẩy tế bào chết body từ cà phê Đắk Lắk giúp làm sạch da chết, hỗ trợ da mềm mịn và sáng khỏe hơn.', 'COCOON', '200g', NULL, '36 tháng ', 'noibat');

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
