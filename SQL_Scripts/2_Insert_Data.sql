USE QLRP;
GO

-- DANH SÁCH PHIM (20 phim)
INSERT INTO Phim (TenPhim, TheLoai, ThoiLuong, GioiHanTuoi, NgayKhoiChieu, TrangThai) VALUES
('Avengers: Secret Wars', 'Hành động', 180, '13+', '2026-05-01', N'Đang chiếu'),
('Doraemon Movie 45', 'Hoạt hình', 105, 'P', '2026-04-20', N'Đang chiếu'),
('Thám tử Conan Movie', 'Trinh thám', 110, '13+', '2026-05-15', N'Đang chiếu'),
('Kungfu Panda 4', 'Hoạt hình', 95, 'P', '2026-04-10', N'Đang chiếu'),
('Shin - Cậu bé bút chì Movie', 'Hoạt hình', 95, 'P', '2026-05-25', N'Đang chiếu'),
('Minions 3', 'Hoạt hình', 95, 'P', '2026-08-01', N'Đang chiếu'),
('Aquaman 3', 'Viễn tưởng', 135, '13+', '2026-06-20', N'Đang chiếu'),
('Fast & Furious 11', 'Hành động', 140, '16+', '2026-06-01', N'Sắp chiếu'),
('Spider-Man: Thế giới mới', 'Hành động', 130, '13+', '2026-06-10', N'Sắp chiếu'),
('Transformers: Trỗi dậy', 'Hành động', 150, '13+', '2026-07-01', N'Sắp chiếu'),
('Frozen 3', 'Hoạt hình', 110, 'P', '2026-12-01', N'Sắp chiếu'),
('The Nun 3', 'Kinh dị', 100, '18+', '2026-10-15', N'Sắp chiếu'),
('Insidious 6', 'Kinh dị', 105, '18+', '2026-09-20', N'Sắp chiếu'),
('Nhiệm vụ bất khả thi 9', 'Hành động', 150, '13+', '2026-07-15', N'Sắp chiếu'),
('Avatar 2', 'Viễn tưởng', 180, '13+', '2025-12-20', N'Ngừng chiếu'),
('John Wick 4', 'Hành động', 140, '18+', '2025-11-01', N'Ngừng chiếu'),
('Thám tử Pikachu', 'Hoạt hình', 100, 'P', '2025-09-01', N'Ngừng chiếu'),
('Your Name', 'Tình cảm', 120, '13+', '2025-11-10', N'Ngừng chiếu'),
('Đứa con của thời tiết', 'Tình cảm', 115, '13+', '2025-10-05', N'Ngừng chiếu'),
('One Piece Film Red', 'Hoạt hình', 130, '13+', '2025-08-20', N'Ngừng chiếu');

-- DANH SÁCH PHÒNG CHIẾU
INSERT INTO PhongChieu (TenPhong, LoaiPhong, SucChua) VALUES
(N'Phòng IMAX - 01', 'IMAX', 100),
(N'Phòng 2D - 01', '2D', 60),
(N'Phòng 2D - 02', '2D', 60),
(N'Phòng 3D - 01', '3D', 60),
(N'Phòng 3D - 02', '3D', 60),
(N'Phòng VIP - 01', 'VIP', 40);

-- DANH SÁCH GHẾ CHI TIẾT (Bổ sung đầy đủ cho 6 phòng)
-- PHÒNG IMAX (100 ghế)
DECLARE @i INT = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Ghe (MaPhong, Hang, SoCot, LoaiGhe) VALUES (1, CHAR(65 + (@i-1)/10), @i, CASE WHEN @i <= 30 THEN N'Thường' WHEN @i <= 70 THEN N'VIP' ELSE N'Sweetbox' END);
    SET @i = @i + 1;
END

-- PHÒNG 2D-01 (60 ghế)
SET @i = 1;
WHILE @i <= 60
BEGIN
    INSERT INTO Ghe (MaPhong, Hang, SoCot, LoaiGhe) VALUES (2, CHAR(65 + (@i-1)/10), @i, CASE WHEN @i <= 20 THEN N'Thường' WHEN @i <= 50 THEN N'VIP' ELSE N'Sweetbox' END);
    SET @i = @i + 1;
END

-- PHÒNG 2D-02 (60 ghế)
SET @i = 1;
WHILE @i <= 60
BEGIN
    INSERT INTO Ghe (MaPhong, Hang, SoCot, LoaiGhe) VALUES (3, CHAR(65 + (@i-1)/10), @i, CASE WHEN @i <= 20 THEN N'Thường' WHEN @i <= 50 THEN N'VIP' ELSE N'Sweetbox' END);
    SET @i = @i + 1;
END

-- PHÒNG VIP-01 (40 ghế toàn bộ là VIP và Sweetbox)
SET @i = 1;
WHILE @i <= 40
BEGIN
    INSERT INTO Ghe (MaPhong, Hang, SoCot, LoaiGhe) VALUES (6, CHAR(65 + (@i-1)/10), @i, CASE WHEN @i <= 30 THEN N'VIP' ELSE N'Sweetbox' END);
    SET @i = @i + 1;
END

--DANH SÁCH KHÁCH HÀNG (20 người)
INSERT INTO KhachHang (HoTen, SDT, Email, DiemTichLuy) VALUES
(N'Nguyễn Minh Anh','0908347291','minhanh91@gmail.com',120),
(N'Trần Quốc Bảo','0905123478','quocbao78@gmail.com',80),
(N'Lê Hoàng Nam','0909234567','hoangnam67@gmail.com',50),
(N'Phạm Gia Huy','0903456782','giahuy82@gmail.com',200),
(N'Hoàng Tuấn Kiệt','0908765431','tuankiet31@gmail.com',30),
(N'Võ Thanh Tùng','0902345619','thanhtung19@gmail.com',60),
(N'Đặng Ngọc Linh','0907654328','ngoclinh28@gmail.com',90),
(N'Bùi Quang Huy','0904567893','quanghuy93@gmail.com',40),
(N'Ngô Đức Anh','0906789124','ducanh24@gmail.com',75),
(N'Phan Nhật Minh','0901234789','nhatminh89@gmail.com',150),
(N'Nguyễn Hữu Phúc','0906626053','huuphuc53@gmail.com',70),
(N'Trần Văn Hòa','0905515942','vanhoa42@gmail.com',30),
(N'Lê Quang Khải','0904404831','quangkhai31@gmail.com',90),
(N'Phạm Văn Sơn','0903393720','vanson20@gmail.com',40),
(N'Hoàng Văn Đức','0902282619','vanduc19@gmail.com',100),
(N'Võ Văn Bình','0901171508','vanbinh08@gmail.com',60),
(N'Đặng Văn Tài','0909960497','vantai97@gmail.com',20),
(N'Bùi Văn Nam','0908859386','vannam86@gmail.com',50),
(N'Ngô Văn Phong','0907748275','vanphong75@gmail.com',80),
(N'Phan Văn Lộc','0906637164','vanloc64@gmail.com',35);

--COMBO DỊCH VỤ
INSERT INTO ComboDichVu (TenCombo, Gia) VALUES
(N'Combo Thường (Bắp + Nước)', 50000),
(N'Combo Lớn (Bắp lớn + Nước)', 70000),
(N'Combo Đôi (2 Bắp + 2 Nước)', 110000),
(N'Combo Nhóm (2 Bắp lớn + 3 Nước + Snack)', 150000),
(N'Combo Gia đình (2 Bắp lớn + 4 Nước)', 180000),
(N'Combo VIP (Bắp đặc biệt + 2 Nước + Snack)', 200000),
(N'Combo Học sinh (Bắp nhỏ + Nước nhỏ)', 40000);

--SUẤT CHIẾU (Đa dạng khung giờ cho các phim hot)
INSERT INTO SuatChieu (MaPhim, MaPhong, NgayChieu, GioBatDau, GioKetThuc) VALUES
(4, 2, '2026-04-10', '09:00:00', '10:35:00'),
(4, 3, '2026-04-10', '13:00:00', '14:35:00'),
(2, 3, '2026-04-20', '08:30:00', '10:15:00'),
(2, 2, '2026-04-20', '15:00:00', '16:45:00'),
(1, 1, '2026-05-01', '19:00:00', '22:00:00'),
(1, 1, '2026-05-01', '22:30:00', '01:30:00'),
(3, 2, '2026-05-15', '18:00:00', '19:50:00'),
(5, 3, '2026-05-25', '10:00:00', '11:35:00'),
(8, 1, '2026-06-01', '17:00:00', '19:20:00'),
(9, 2, '2026-06-10', '14:00:00', '16:10:00'),
(7, 1, '2026-06-20', '20:00:00', '22:15:00'),
(12, 6, '2026-10-15', '23:00:00', '00:40:00');

-- HÓA ĐƠN (20 hóa đơn trải dài các tháng)
INSERT INTO HoaDon (MaKH, NgayLap, HinhThucThanhToan, TrangThai, TongTien) VALUES 
(1, '2026-04-10', N'Tiền mặt', N'Đã thanh toán', 0),
(2, '2026-04-10', N'Tiền mặt', N'Đã thanh toán', 0),
(3, '2026-04-20', N'Tiền mặt', N'Đã thanh toán', 0),
(4, '2026-04-20', N'Tiền mặt', N'Đã thanh toán', 0),
(5, '2026-04-20', N'Tiền mặt', N'Đã thanh toán', 0),
(6, '2026-05-01', N'Thẻ', N'Đã thanh toán', 0),
(7, '2026-05-01', N'Thẻ', N'Đã thanh toán', 0),
(8, '2026-05-15', N'Thẻ', N'Đã thanh toán', 0),
(9, '2026-05-15', N'Thẻ', N'Đã thanh toán', 0),
(10, '2026-05-25', N'Thẻ', N'Chờ thanh toán', 0),
(11, '2026-06-01', N'Chuyển khoản', N'Đã thanh toán', 0),
(12, '2026-06-01', N'Chuyển khoản', N'Đã thanh toán', 0),
(13, '2026-06-10', N'Chuyển khoản', N'Đã thanh toán', 0),
(14, '2026-06-10', N'Chuyển khoản', N'Đã thanh toán', 0),
(15, '2026-06-20', N'Chuyển khoản', N'Đã thanh toán', 0),
(16, '2026-06-20', N'Tiền mặt', N'Đã thanh toán', 0),
(17, '2026-06-20', N'Thẻ', N'Đã thanh toán', 0),
(18, '2026-10-15', N'Chuyển khoản', N'Đã thanh toán', 0),
(19, '2026-10-15', N'Tiền mặt', N'Chờ thanh toán', 0),
(20, '2026-10-15', N'Thẻ', N'Đã thanh toán', 0);

-- VÉ CHI TIẾT (Liên kết theo MaSuat và MaGhe tương ứng phòng)
INSERT INTO Ve_ChiTiet (MaHD, MaSuat, MaGhe, GiaVe) VALUES 
(1, 1, 101, 120000), (2, 1, 102, 120000), (2, 1, 103, 120000),
(3, 3, 161, 120000), (4, 3, 171, 120000), (4, 3, 172, 120000),
(6, 5, 1, 300000), (6, 5, 2, 300000), (7, 5, 31, 170000),
(11, 9, 1, 120000), (13, 10, 141, 300000), (15, 11, 41, 170000),
(18, 12, 281, 300000), (18, 12, 282, 300000), (20, 12, 283, 170000);

-- COMBO TRONG HÓA ĐƠN
INSERT INTO HoaDon_Combo (MaHD, MaCombo, SoLuong) VALUES 
(1, 1, 1), (2, 3, 1), (4, 1, 2), (6, 5, 1), (8, 3, 1), (9, 1, 2), (13, 3, 1), (15, 3, 1), (18, 4, 1);

-- TÍNH TOÁN LẠI TỔNG TIỀN
UPDATE HoaDon
SET TongTien = 
    ISNULL((SELECT SUM(GiaVe) FROM Ve_ChiTiet WHERE Ve_ChiTiet.MaHD = HoaDon.MaHD), 0) +
    ISNULL((SELECT SUM(c.Gia * hc.SoLuong) 
            FROM HoaDon_Combo hc 
            JOIN ComboDichVu c ON hc.MaCombo = c.MaCombo 
            WHERE hc.MaHD = HoaDon.MaHD), 0);
GO