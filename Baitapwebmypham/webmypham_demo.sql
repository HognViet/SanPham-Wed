CREATE DATABASE IF NOT EXISTS webmypham CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE webmypham;

DROP TABLE IF EXISTS sanpham;
CREATE TABLE sanpham (
    id VARCHAR(20) PRIMARY KEY,
    ten VARCHAR(255) NOT NULL,
    gia VARCHAR(50) NOT NULL,
    hinh VARCHAR(500) NOT NULL,
    mo_ta TEXT,
    thuong_hieu VARCHAR(255),
    trong_luong VARCHAR(100),
    mau_sac VARCHAR(100),
    han_dung VARCHAR(100),
    danh_muc VARCHAR(50) NOT NULL
);

INSERT INTO sanpham (id, ten, gia, hinh, mo_ta, thuong_hieu, trong_luong, mau_sac, han_dung, danh_muc) VALUES
('MP001','Son li mem min','320,000 VND','https://picsum.photos/560/460?11','Son co chat kem min, len mau chuan, bam tot nhieu gio va khong gay kho moi.','TSV Cosmetic','3.5g','Do hong','24 thang','noibat'),
('MP002','Kem nen che phu','289,000 VND','https://picsum.photos/560/460?12','Kem nen mong nhe, che phu tot, giu lop trang diem ben dep.','TSV Makeup','30ml','Natural Beige','18 thang','noibat'),
('MP003','Phan mat 6 mau','199,000 VND','https://picsum.photos/560/460?13','Bang mau de phoi, chat phan min, bam mau on dinh.','TSV Beauty','18g','Warm tone','24 thang','noibat'),
('MP004','Serum cap am','350,000 VND','https://picsum.photos/560/460?14','Serum giup cap am sau, lam diu da va ho tro phuc hoi da.','TSV Skin','50ml','Trong suot','24 thang','hangmoi'),
('MP005','Sua rua mat diu nhe','149,000 VND','https://picsum.photos/560/460?21','Lam sach da nhe nhang, khong gay kho cang sau khi su dung.','TSV Skin','100ml','Trang nga','24 thang','hangmoi'),
('MP006','Kem chong nang SPF50+','259,000 VND','https://picsum.photos/560/460?22','Chong nang pho rong, chat kem mong nhe, khong bet dinh.','TSV UV','50ml','Trang sua','24 thang','hangmoi'),
('MP007','Nuoc hoa mini 30ml','420,000 VND','https://picsum.photos/560/460?23','Mui huong thanh lich, luu huong tot, thiet ke chai nho gon.','TSV Perfume','30ml','Hong pastel','36 thang','banchay'),
('MP008','Xit khoang duong da','179,000 VND','https://picsum.photos/560/460?24','Bo sung do am tuc thi, ho tro lam diu va giu lop trang diem lau hon.','TSV Skin','150ml','Trong suot','24 thang','banchay'),
('MP009','Mat na cap nuoc','89,000 VND','https://picsum.photos/560/460?31','Mat na duong am nhanh, giup da mem min va tuoi tan.','TSV Mask','25ml','Trang','18 thang','banchay'),
('MP010','Toner hoa cuc','199,000 VND','https://picsum.photos/560/460?32','Lam diu da, can bang do pH va ho tro lam sach sau rua mat.','TSV Skin','200ml','Vang nhat','24 thang','giamgia'),
('MP011','Kem duong dem','275,000 VND','https://picsum.photos/560/460?33','Duong am va phuc hoi da ban dem, cho lan da mem muot vao sang hom sau.','TSV Care','50g','Trang kem','24 thang','giamgia'),
('MP012','Son duong co mau','109,000 VND','https://picsum.photos/560/460?34','Son duong mem moi, co mau nhe, phu hop su dung hang ngay.','TSV Lip','4g','Hong dao','24 thang','giamgia');
