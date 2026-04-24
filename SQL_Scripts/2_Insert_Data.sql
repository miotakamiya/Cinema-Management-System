USE QLRP;
GO

-- =============================================
-- 1. QUOC GIA
-- =============================================
INSERT INTO QuocGia (TenQuocGia) VALUES 
(N'Việt Nam'),
(N'Mỹ'),
(N'Hàn Quốc'),
(N'Nhật Bản'),
(N'Trung Quốc'),
(N'Anh'),
(N'Pháp'),
(N'Úc');

-- =============================================
-- 2. LOAI GHE
-- =============================================
INSERT INTO LoaiGhe (TenLoaiGhe, PhuThu) VALUES 
(N'Thường',    0),
(N'VIP',       50000),
(N'Sweetbox',  100000);

-- =============================================
-- 3. PHONG CHIEU
-- =============================================
INSERT INTO PhongChieu (TenPhong, LoaiPhong, SucChua) VALUES 
(N'Phòng 01', N'2D',   60),
(N'Phòng 02', N'3D',   60),
(N'Phòng 03', N'IMAX', 100),
(N'Phòng 04', N'2D',   40),
(N'Phòng 05', N'4DX',  50);

-- =============================================
-- 4. COMBO DICH VU
-- =============================================
INSERT INTO ComboDichVu (TenCombo, Gia) VALUES 
(N'Bắp đơn nhỏ',        35000),
(N'Bắp đơn lớn',        45000),
(N'Bắp + Nước',         75000),
(N'Combo Đôi',         130000),
(N'Combo Gia Đình',    250000),
(N'Nước ngọt đơn',     30000),
(N'Gói Snack',          50000),
(N'Combo Premium',     200000);

-- =============================================
-- 5. PHIM
-- =============================================
INSERT INTO Phim (TenPhim, MaQuocGia, TheLoai, ThoiLuong, GioiHanTuoi, NgayKhoiChieu, TrangThai) VALUES
-- Việt Nam
(N'Lật Mặt 8',               1, N'Hành động',      120, N'16+', '2026-04-30', N'Đang chiếu'),
(N'Mai',                      1, N'Tình cảm',        135, N'13+', '2026-02-08', N'Ngừng chiếu'),
(N'Kẻ Ăn Hồn',               1, N'Kinh dị',         105, N'18+', '2026-05-20', N'Sắp chiếu'),
-- Mỹ
(N'Dune: Part Three',         2, N'Viễn tưởng',      160, N'13+', '2026-05-15', N'Sắp chiếu'),
(N'Mission Impossible 8',     2, N'Hành động',       145, N'13+', '2026-04-25', N'Đang chiếu'),
(N'Interstellar 2',           2, N'Khoa học viễn tưởng', 170, N'13+', '2026-06-10', N'Sắp chiếu'),
(N'The Notebook II',          2, N'Tình cảm',        110, N'13+', '2026-03-14', N'Ngừng chiếu'),
-- Hàn Quốc
(N'Exhuma',                   3, N'Kinh dị',         130, N'18+', '2026-04-01', N'Đang chiếu'),
(N'Sleep',                    3, N'Kinh dị',         95,  N'16+', '2026-03-20', N'Ngừng chiếu'),
(N'Project Silence',          3, N'Hành động',       115, N'13+', '2026-05-05', N'Sắp chiếu'),
-- Nhật Bản
(N'Thanh Gươm Diệt Quỷ: Vô Hạn',  4, N'Hoạt hình', 120, N'13+', '2026-03-01', N'Ngừng chiếu'),
(N'One Piece Film: Red 2',    4, N'Hoạt hình',       110, N'P',   '2026-05-25', N'Sắp chiếu'),
(N'Your Name 2',              4, N'Hoạt hình',       105, N'P',   '2026-06-20', N'Sắp chiếu'),
-- Trung Quốc
(N'Ne Zha 3',                 5, N'Hoạt hình',       115, N'P',   '2026-04-15', N'Đang chiếu'),
-- Anh
(N'Paddington in Peru',       6, N'Gia đình',         96, N'P',   '2026-04-10', N'Đang chiếu'),
-- Pháp
(N'Lupin III: Paris Heist',   7, N'Hành động',       108, N'13+', '2026-05-30', N'Sắp chiếu');

-- =============================================
-- 6. KHACH HANG (20 khách)
-- =============================================
INSERT INTO KhachHang (HoTen, SDT, Email, DiemTichLuy) VALUES
(N'Nguyễn Văn An',      '0901111111', 'an.nguyen@gmail.com',      120),
(N'Trần Thị Bích',      '0902222222', 'bich.tran@gmail.com',      85),
(N'Lê Văn Cường',       '0903333333', 'cuong.le@gmail.com',       200),
(N'Phạm Thị Dung',      '0904444444', 'dung.pham@gmail.com',      50),
(N'Hoàng Văn Em',       '0905555555', 'em.hoang@gmail.com',       310),
(N'Vũ Thị Phương',      '0906666666', 'phuong.vu@gmail.com',      0),
(N'Đặng Văn Giang',     '0907777777', 'giang.dang@gmail.com',     175),
(N'Bùi Thị Hoa',        '0908888888', 'hoa.bui@gmail.com',        60),
(N'Ngô Văn Inh',        '0909999999', 'inh.ngo@gmail.com',        90),
(N'Đinh Thị Kim',       '0910000000', 'kim.dinh@gmail.com',       230),
(N'Trịnh Văn Long',     '0911111112', 'long.trinh@gmail.com',     145),
(N'Mai Thị Lan',        '0912222223', 'lan.mai@gmail.com',        70),
(N'Phan Văn Minh',      '0913333334', 'minh.phan@gmail.com',      0),
(N'Lý Thị Ngọc',        '0914444445', 'ngoc.ly@gmail.com',        410),
(N'Tô Văn Oanh',        '0915555556', 'oanh.to@gmail.com',        25),
(N'Cao Thị Phúc',       '0916666667', 'phuc.cao@gmail.com',       160),
(N'Hà Văn Quang',       '0917777778', 'quang.ha@gmail.com',       95),
(N'Lưu Thị Rong',       '0918888889', 'rong.luu@gmail.com',       0),
(N'Dương Văn Sơn',      '0919999990', 'son.duong@gmail.com',      280),
(N'Chu Thị Tuyết',      '0920000001', 'tuyet.chu@gmail.com',      130);

-- =============================================
-- 7. GHE (tạo ghế cho 5 phòng)
-- =============================================

-- Phòng 1: 2D, 60 ghế (hàng A-F, 10 ghế/hàng)
-- Hàng A-D: Thường (MaLoai=1), Hàng E: VIP (MaLoai=2), Hàng F: Sweetbox (MaLoai=3)
DECLARE @row INT, @col INT;

-- Phòng 1
SET @row = 0;
WHILE @row < 6
BEGIN
    SET @col = 1;
    WHILE @col <= 10
    BEGIN
        DECLARE @loai1 INT = CASE WHEN @row < 4 THEN 1 WHEN @row = 4 THEN 2 ELSE 3 END;
        INSERT INTO Ghe (MaPhong, Hang, SoCot, MaLoai)
        VALUES (1, CHAR(65 + @row), @col, @loai1);
        SET @col = @col + 1;
    END
    SET @row = @row + 1;
END

-- Phòng 2
SET @row = 0;
WHILE @row < 6
BEGIN
    SET @col = 1;
    WHILE @col <= 10
    BEGIN
        DECLARE @loai2 INT = CASE WHEN @row < 4 THEN 1 WHEN @row = 4 THEN 2 ELSE 3 END;
        INSERT INTO Ghe (MaPhong, Hang, SoCot, MaLoai)
        VALUES (2, CHAR(65 + @row), @col, @loai2);
        SET @col = @col + 1;
    END
    SET @row = @row + 1;
END

-- Phòng 3: IMAX 100 ghế (hàng A-J, 10 ghế/hàng)
-- Hàng A-G: Thường, Hàng H-I: VIP, Hàng J: Sweetbox
SET @row = 0;
WHILE @row < 10
BEGIN
    SET @col = 1;
    WHILE @col <= 10
    BEGIN
        DECLARE @loai3 INT = CASE WHEN @row < 7 THEN 1 WHEN @row < 9 THEN 2 ELSE 3 END;
        INSERT INTO Ghe (MaPhong, Hang, SoCot, MaLoai)
        VALUES (3, CHAR(65 + @row), @col, @loai3);
        SET @col = @col + 1;
    END
    SET @row = @row + 1;
END

-- Phòng 4: 2D 40 ghế (hàng A-D, 10 ghế/hàng)
SET @row = 0;
WHILE @row < 4
BEGIN
    SET @col = 1;
    WHILE @col <= 10
    BEGIN
        DECLARE @loai4 INT = CASE WHEN @row < 3 THEN 1 ELSE 2 END;
        INSERT INTO Ghe (MaPhong, Hang, SoCot, MaLoai)
        VALUES (4, CHAR(65 + @row), @col, @loai4);
        SET @col = @col + 1;
    END
    SET @row = @row + 1;
END

-- Phòng 5: 4DX 50 ghế (hàng A-E, 10 ghế/hàng)
SET @row = 0;
WHILE @row < 5
BEGIN
    SET @col = 1;
    WHILE @col <= 10
    BEGIN
        DECLARE @loai5 INT = CASE WHEN @row < 3 THEN 1 WHEN @row = 3 THEN 2 ELSE 3 END;
        INSERT INTO Ghe (MaPhong, Hang, SoCot, MaLoai)
        VALUES (5, CHAR(65 + @row), @col, @loai5);
        SET @col = @col + 1;
    END
    SET @row = @row + 1;
END

-- =============================================
-- 8. SUAT CHIEU
-- =============================================
INSERT INTO SuatChieu (MaPhim, MaPhong, NgayChieu, GioBatDau, GioKetThuc) VALUES
-- Lật Mặt 8 (MaPhim=1) - Phòng 01 & 04
(1, 1, '2026-04-30', '09:00:00', '11:00:00'),
(1, 1, '2026-04-30', '13:30:00', '15:30:00'),
(1, 1, '2026-04-30', '18:00:00', '20:00:00'),
(1, 4, '2026-05-01', '10:00:00', '12:00:00'),
(1, 4, '2026-05-01', '15:00:00', '17:00:00'),

-- Mission Impossible 8 (MaPhim=5) - Phòng 02 & 03
(5, 2, '2026-04-25', '10:00:00', '12:25:00'),
(5, 2, '2026-04-25', '14:00:00', '16:25:00'),
(5, 3, '2026-04-26', '19:00:00', '21:25:00'),
(5, 3, '2026-04-27', '20:00:00', '22:25:00'),

-- Exhuma (MaPhim=8) - Phòng 02
(8, 2, '2026-04-28', '20:30:00', '22:40:00'),
(8, 2, '2026-04-29', '20:30:00', '22:40:00'),
(8, 5, '2026-04-30', '21:00:00', '23:10:00'),

-- Ne Zha 3 (MaPhim=14) - Phòng 03
(14, 3, '2026-04-20', '09:30:00', '11:25:00'),
(14, 3, '2026-04-20', '13:00:00', '14:55:00'),
(14, 3, '2026-04-21', '10:00:00', '11:55:00'),

-- Paddington in Peru (MaPhim=15) - Phòng 04
(15, 4, '2026-04-22', '09:00:00', '10:36:00'),
(15, 4, '2026-04-22', '13:00:00', '14:36:00'),
(15, 4, '2026-04-23', '11:00:00', '12:36:00');

-- =============================================
-- 9. HOA DON (15 hóa đơn)
-- =============================================
INSERT INTO HoaDon (MaKH, NgayLap, HinhThucThanhToan, TrangThai) VALUES 
(1,  '2026-04-25 09:30:00', N'Tiền mặt',      N'Đã thanh toán'),
(2,  '2026-04-25 10:15:00', N'Chuyển khoản',  N'Đã thanh toán'),
(3,  '2026-04-25 13:45:00', N'Thẻ tín dụng',  N'Đã thanh toán'),
(4,  '2026-04-26 09:00:00', N'Ví điện tử',    N'Đã thanh toán'),
(5,  '2026-04-26 14:20:00', N'Tiền mặt',      N'Đã thanh toán'),
(6,  '2026-04-26 18:00:00', N'Chuyển khoản',  N'Đã thanh toán'),
(7,  '2026-04-27 10:00:00', N'Thẻ tín dụng',  N'Đã thanh toán'),
(8,  '2026-04-27 15:30:00', N'Ví điện tử',    N'Đã thanh toán'),
(9,  '2026-04-28 20:00:00', N'Tiền mặt',      N'Đã thanh toán'),
(10, '2026-04-28 20:10:00', N'Chuyển khoản',  N'Đã thanh toán'),
(11, '2026-04-29 19:45:00', N'Thẻ tín dụng',  N'Đã thanh toán'),
(12, '2026-04-29 20:00:00', N'Ví điện tử',    N'Đã thanh toán'),
(14, '2026-04-20 09:00:00', N'Thẻ tín dụng',  N'Đã thanh toán'),
(19, '2026-04-22 12:50:00', N'Tiền mặt',      N'Đã thanh toán'),
(20, '2026-04-23 10:45:00', N'Ví điện tử',    N'Đã thanh toán');

-- =============================================
-- 10. VE CHI TIET
-- Lưu ý MaGhe:
--   Phòng 1: ghế 1-60   (hàng A=1-10, B=11-20, C=21-30, D=31-40, E=41-50, F=51-60)
--   Phòng 2: ghế 61-120
--   Phòng 3: ghế 121-220
--   Phòng 4: ghế 221-260
--   Phòng 5: ghế 261-310
-- =============================================

-- HD1: KH1 - Lật Mặt 8 suat 3 (MaSuat=3), Phòng 1 - 2 ghế hàng C
INSERT INTO Ve_ChiTiet (MaHD, MaSuat, MaGhe, GiaVe) VALUES
(1, 3, 21, 90000),
(1, 3, 22, 90000);

-- HD2: KH2 - Lật Mặt 8 suat 3, Phòng 1 - 2 ghế hàng E (VIP)
INSERT INTO Ve_ChiTiet (MaHD, MaSuat, MaGhe, GiaVe) VALUES
(2, 3, 41, 140000),
(2, 3, 42, 140000);

-- HD3: KH3 - Mission Impossible 8 suat 6 (MaSuat=6), Phòng 2 - 3 ghế hàng B
INSERT INTO Ve_ChiTiet (MaHD, MaSuat, MaGhe, GiaVe) VALUES
(3, 6, 71, 90000),
(3, 6, 72, 90000),
(3, 6, 73, 90000);

-- HD4: KH4 - Mission Impossible 8 suat 6, Phòng 2 - 2 ghế hàng E (VIP)
INSERT INTO Ve_ChiTiet (MaHD, MaSuat, MaGhe, GiaVe) VALUES
(4, 6, 101, 140000),
(4, 6, 102, 140000);

-- HD5: KH5 - Mission Impossible 8 suat 8 (IMAX), Phòng 3 - 4 ghế hàng D
INSERT INTO Ve_ChiTiet (MaHD, MaSuat, MaGhe, GiaVe) VALUES
(5, 8, 151, 120000),
(5, 8, 152, 120000),
(5, 8, 153, 120000),
(5, 8, 154, 120000);

-- HD6: KH6 - Mission Impossible 8 suat 8, Phòng 3 - 2 ghế Sweetbox hàng J
INSERT INTO Ve_ChiTiet (MaHD, MaSuat, MaGhe, GiaVe) VALUES
(6, 8, 211, 220000),
(6, 8, 212, 220000);

-- HD7: KH7 - Exhuma suat 10 (MaSuat=10), Phòng 2 - 2 ghế hàng C
INSERT INTO Ve_ChiTiet (MaHD, MaSuat, MaGhe, GiaVe) VALUES
(7, 10, 81, 105000),
(7, 10, 82, 105000);

-- HD8: KH8 - Exhuma suat 10 - 1 ghế VIP hàng E
INSERT INTO Ve_ChiTiet (MaHD, MaSuat, MaGhe, GiaVe) VALUES
(8, 10, 111, 155000);

-- HD9: KH9 - Exhuma suat 11 (MaSuat=11), Phòng 2 - 2 ghế hàng A
INSERT INTO Ve_ChiTiet (MaHD, MaSuat, MaGhe, GiaVe) VALUES
(9, 11, 61, 105000),
(9, 11, 62, 105000);

-- HD10: KH10 - Exhuma suat 11 - 2 ghế VIP hàng E
INSERT INTO Ve_ChiTiet (MaHD, MaSuat, MaGhe, GiaVe) VALUES
(10, 11, 101, 155000),  -- Suat 11 - Phong 2, ghế 101 (hàng E col 1)
(10, 11, 102, 155000);

-- HD11: KH11 - Exhuma suat 12 (4DX), Phòng 5 - 2 ghế hàng C
INSERT INTO Ve_ChiTiet (MaHD, MaSuat, MaGhe, GiaVe) VALUES
(11, 12, 281, 150000),
(11, 12, 282, 150000);

-- HD12: KH12 - Exhuma suat 12 - Sweetbox hàng E
INSERT INTO Ve_ChiTiet (MaHD, MaSuat, MaGhe, GiaVe) VALUES
(12, 12, 301, 245000),
(12, 12, 302, 245000);

-- HD13: KH14 - Ne Zha 3 suat 13 (MaSuat=13), Phòng 3 IMAX - 4 ghế hàng B
INSERT INTO Ve_ChiTiet (MaHD, MaSuat, MaGhe, GiaVe) VALUES
(13, 13, 131, 120000),
(13, 13, 132, 120000),
(13, 13, 133, 120000),
(13, 13, 134, 120000);

-- HD14: KH19 - Paddington suat 16 (MaSuat=16), Phòng 4 - 2 ghế hàng B
INSERT INTO Ve_ChiTiet (MaHD, MaSuat, MaGhe, GiaVe) VALUES
(14, 16, 231, 85000),
(14, 16, 232, 85000);

-- HD15: KH20 - Paddington suat 17 (MaSuat=17), Phòng 4 - 3 ghế hàng A
INSERT INTO Ve_ChiTiet (MaHD, MaSuat, MaGhe, GiaVe) VALUES
(15, 17, 221, 85000),
(15, 17, 222, 85000),
(15, 17, 223, 85000);

-- =============================================
-- 11. HOA DON COMBO
-- =============================================
INSERT INTO HoaDon_Combo (MaHD, MaCombo, SoLuong) VALUES
(1,  2, 2),   -- HD1: 2x Bắp đơn lớn
(1,  6, 2),   -- HD1: 2x Nước ngọt
(2,  3, 1),   -- HD2: 1x Bắp + Nước
(3,  4, 1),   -- HD3: 1x Combo Đôi
(3,  6, 1),   -- HD3: thêm 1x Nước
(4,  3, 2),   -- HD4: 2x Bắp + Nước
(5,  5, 1),   -- HD5: 1x Combo Gia Đình
(6,  8, 1),   -- HD6: 1x Combo Premium
(7,  2, 2),   -- HD7: 2x Bắp đơn lớn
(8,  6, 1),   -- HD8: 1x Nước ngọt
(9,  4, 1),   -- HD9: 1x Combo Đôi
(10, 3, 2),   -- HD10: 2x Bắp + Nước
(11, 7, 2),   -- HD11: 2x Gói Snack
(12, 8, 1),   -- HD12: 1x Combo Premium
(13, 5, 1),   -- HD13: 1x Combo Gia Đình
(14, 4, 1),   -- HD14: 1x Combo Đôi
(15, 1, 3);   -- HD15: 3x Bắp đơn nhỏ (gia đình nhỏ)
GO

PRINT N'Insert data hoàn tất!';
GO