USE QLRP;
GO

-- -- INSERT INTO Phim (TenPhim, TheLoai, ThoiLuong, GioiHanTuoi, NgayKhoiChieu, TrangThai)
-- -- VALUES 
-- -- (N'Dune: Phần Hai', N'Khoa học viễn tưởng', 166, 'C13', '2024-03-01', N'Đang chiếu'),
-- -- (N'Mai', N'Tâm lý, Tình cảm', 131, 'C18', '2024-02-10', N'Đang chiếu'),
-- -- (N'Kung Fu Panda 4', N'Hoạt hình', 94, 'P', '2024-03-08', N'Sắp chiếu'),
-- -- (N'Quật Mộ Trùng Ma', N'Kinh dị, Bí ẩn', 134, 'C16', '2024-03-15', N'Đang chiếu'),
-- -- (N'Lật Mặt 7', N'Gia đình, Hành động', 120, 'K', '2024-04-26', N'Sắp chiếu');

-- -- INSERT INTO PhongChieu (TenPhong, LoaiPhong, SucChua)
-- -- VALUES 
-- -- (N'Phòng 01', '2D', 50),
-- -- (N'Phòng 02', '3D', 40),
-- -- (N'Phòng IMAX 01', 'IMAX', 100);

-- -- INSERT INTO Ghe (MaPhong, Hang, SoCot, LoaiGhe)
-- -- VALUES 
-- -- (1, 'A', 1, N'Thường'), (1, 'A', 2, N'Thường'), (1, 'A', 3, N'Thường'),
-- -- (1, 'B', 1, N'VIP'), (1, 'B', 2, N'VIP'), (1, 'B', 3, N'VIP'),
-- -- (3, 'F', 10, N'Sweetbox'), (3, 'F', 11, N'Sweetbox');

-- -- INSERT INTO SuatChieu (MaPhim, MaPhong, NgayChieu, GioBatDau, GioKetThuc)
-- -- VALUES 
-- -- (1, 3, '2024-03-20', '19:00:00', '21:46:00'),
-- -- (2, 1, '2024-03-20', '20:00:00', '22:11:00'),
-- -- (4, 2, '2024-03-20', '18:30:00', '20:44:00');

-- -- INSERT INTO KhachHang (HoTen, SDT, Email, DiemTichLuy)
-- -- VALUES 
-- -- (N'Nguyễn Văn An', '0901234567', 'an.nguyen@gmail.com', 100),
-- -- (N'Lê Thị Bình', '0912345678', 'binh.le@yahoo.com', 50),
-- -- (N'Trần Minh Cường', '0988888888', 'cuong.tm@outlook.com', 0);

-- -- INSERT INTO ComboDichVu (TenCombo, Gia)
-- -- VALUES 
-- -- (N'Combo Solo (1 Bắp + 1 Nước)', 85000),
-- -- (N'Combo Couple (1 Bắp + 2 Nước)', 120000),
-- -- (N'Combo Gia Đình (2 Bắp + 4 Nước)', 250000);

-- INSERT INTO HoaDon (MaKH, NgayLap, HinhThucThanhToan, TrangThai, TongTien)
-- VALUES 
-- (1, '2024-03-20 18:30:00', N'Ví điện tử', N'Đã thanh toán', 185000),
-- (2, '2024-03-20 19:15:00', N'Tiền mặt', N'Đã thanh toán', 120000);

-- INSERT INTO Ve_ChiTiet (MaHD, MaSuat, MaGhe, GiaVe)
-- VALUES 
-- (1, 1, 7, 100000),
-- (2, 2, 4, 80000);

-- INSERT INTO HoaDon_Combo (MaHD, MaCombo, SoLuong)
-- VALUES 
-- (1, 1, 1),
-- (2, 2, 1);

INSERT INTO Phim (TenPhim, TheLoai, ThoiLuong, GioiHanTuoi, NgayKhoiChieu, TrangThai) VALUES
-- 🔥 ĐANG CHIẾU (7 phim)
('Avengers: Secret Wars', 'Hành động', 180, '13+', '2026-05-01', 'Đang chiếu'),
('Doraemon Movie 45', 'Hoạt hình', 105, 'P', '2026-04-20', 'Đang chiếu'),
('Thám tử Conan Movie', 'Trinh thám', 110, '13+', '2026-05-15', 'Đang chiếu'),
('Kungfu Panda 4', 'Hoạt hình', 95, 'P', '2026-04-10', 'Đang chiếu'),
('Shin - Cậu bé bút chì Movie', 'Hoạt hình', 95, 'P', '2026-05-25', 'Đang chiếu'),
('Minions 3', 'Hoạt hình', 95, 'P', '2026-08-01', 'Đang chiếu'),
('Aquaman 3', 'Viễn tưởng', 135, '13+', '2026-06-20', 'Đang chiếu'),

-- ⏳ SẮP CHIẾU (7 phim)
('Fast & Furious 11', 'Hành động', 140, '16+', '2026-06-01', 'Sắp chiếu'),
('Spider-Man: Thế giới mới', 'Hành động', 130, '13+', '2026-06-10', 'Sắp chiếu'),
('Transformers: Trỗi dậy', 'Hành động', 150, '13+', '2026-07-01', 'Sắp chiếu'),
('Frozen 3', 'Hoạt hình', 110, 'P', '2026-12-01', 'Sắp chiếu'),
('The Nun 3', 'Kinh dị', 100, '18+', '2026-10-15', 'Sắp chiếu'),
('Insidious 6', 'Kinh dị', 105, '18+', '2026-09-20', 'Sắp chiếu'),
('Nhiệm vụ bất khả thi 9', 'Hành động', 150, '13+', '2026-07-15', 'Sắp chiếu'),

-- ❌ NGỪNG CHIẾU (6 phim)
('Avatar 2', 'Viễn tưởng', 180, '13+', '2025-12-20', 'Ngừng chiếu'),
('John Wick 4', 'Hành động', 140, '18+', '2025-11-01', 'Ngừng chiếu'),
('Thám tử Pikachu', 'Hoạt hình', 100, 'P', '2025-09-01', 'Ngừng chiếu'),
('Your Name', 'Tình cảm', 120, '13+', '2025-11-10', 'Ngừng chiếu'),
('Đứa con của thời tiết', 'Tình cảm', 115, '13+', '2025-10-05', 'Ngừng chiếu'),
('One Piece Film Red', 'Hoạt hình', 130, '13+', '2025-08-20', 'Ngừng chiếu');

INSERT INTO PhongChieu (TenPhong, LoaiPhong, SucChua) VALUES
('Phòng IMAX - 01', 'IMAX', 100),
('Phòng 2D - 01', '2D', 60),
('Phòng 2D - 02', '2D', 60),
('Phòng 3D - 01', '3D', 60),
('Phòng 3D - 02', '3D', 60),
('Phòng VIP - 01', 'VIP', 40);


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

INSERT INTO ComboDichVu (TenCombo, Gia) VALUES
(N'Combo Thường (Bắp + Nước)', 50000),
(N'Combo Lớn (Bắp lớn + Nước)', 70000),
(N'Combo Đôi (2 Bắp + 2 Nước)', 110000),
(N'Combo Nhóm (2 Bắp lớn + 3 Nước + Snack)', 150000),
(N'Combo Gia đình (2 Bắp lớn + 4 Nước)', 180000),
(N'Combo VIP (Bắp đặc biệt + 2 Nước + Snack cao cấp)', 200000),
(N'Combo Học sinh (Bắp nhỏ + Nước nhỏ)', 40000);

--PHÒNG IMAX (100 ghế = 10 hàng x 10 ghế) - 1
INSERT INTO Ghe (MaPhong, Hang, SoCot, LoaiGhe) VALUES
(1,'A',1,N'Thường'),(1,'A',2,N'Thường'),(1,'A',3,N'Thường'),(1,'A',4,N'Thường'),(1,'A',5,N'Thường'),
(1,'A',6,N'Thường'),(1,'A',7,N'Thường'),(1,'A',8,N'Thường'),(1,'A',9,N'Thường'),(1,'A',10,N'Thường');
(1,'B',11,N'Thường'),(1,'B',12,N'Thường'),(1,'B',13,N'Thường'),(1,'B',14,N'Thường'),(1,'B',15,N'Thường'),
(1,'B',16,N'Thường'),(1,'B',17,N'Thường'),(1,'B',18,N'Thường'),(1,'B',19,N'Thường'),(1,'B',20,N'Thường');
(1,'C',21,N'Thường'),(1,'C',22,N'Thường'),(1,'C',23,N'Thường'),(1,'C',24,N'Thường'),(1,'C',25,N'Thường'),
(1,'C',26,N'Thường'),(1,'C',27,N'Thường'),(1,'C',28,N'Thường'),(1,'C',29,N'Thường'),(1,'C',30,N'Thường');
(1,'D',31,N'VIP'),(1,'D',32,N'VIP'),(1,'D',33,N'VIP'),(1,'D',34,N'VIP'),(1,'D',35,N'VIP'),
(1,'D',36,N'VIP'),(1,'D',37,N'VIP'),(1,'D',38,N'VIP'),(1,'D',39,N'VIP'),(1,'D',40,N'VIP');
(1,'E',41,N'VIP'),(1,'E',42,N'VIP'),(1,'E',43,N'VIP'),(1,'E',44,N'VIP'),(1,'E',45,N'VIP'),
(1,'E',46,N'VIP'),(1,'E',47,N'VIP'),(1,'E',48,N'VIP'),(1,'E',49,N'VIP'),(1,'E',50,N'VIP');
(1,'F',51,N'VIP'),(1,'F',52,N'VIP'),(1,'F',53,N'VIP'),(1,'F',54,N'VIP'),(1,'F',55,N'VIP'),
(1,'F',56,N'VIP'),(1,'F',57,N'VIP'),(1,'F',58,N'VIP'),(1,'F',59,N'VIP'),(1,'F',60,N'VIP');
(1,'G',61,N'Sweetbox'),(1,'G',62,N'Sweetbox'),(1,'G',63,N'Sweetbox'),(1,'G',64,N'Sweetbox'),(1,'G',65,N'Sweetbox'),
(1,'G',66,N'Sweetbox'),(1,'G',67,N'Sweetbox'),(1,'G',68,N'Sweetbox'),(1,'G',69,N'Sweetbox'),(1,'G',70,N'Sweetbox'),
(1,'G',71,N'Sweetbox'),(1,'G',72,N'Sweetbox'),(1,'G',73,N'Sweetbox'),(1,'G',74,N'Sweetbox'),(1,'G',75,N'Sweetbox'),
(1,'G',76,N'Sweetbox'),(1,'G',77,N'Sweetbox'),(1,'G',78,N'Sweetbox'),(1,'G',79,N'Sweetbox'),(1,'G',80,N'Sweetbox');
(1,'H',81,N'Sweetbox'),(1,'H',82,N'Sweetbox'),(1,'H',83,N'Sweetbox'),(1,'H',84,N'Sweetbox'),(1,'H',85,N'Sweetbox'),
(1,'H',86,N'Sweetbox'),(1,'H',87,N'Sweetbox'),(1,'H',88,N'Sweetbox'),(1,'H',89,N'Sweetbox'),(1,'H',90,N'Sweetbox'),
(1,'I',91,N'Sweetbox'),(1,'I',92,N'Sweetbox'),(1,'I',93,N'Sweetbox'),(1,'I',94,N'Sweetbox'),(1,'I',95,N'Sweetbox'),
(1,'I',96,N'Sweetbox'),(1,'I',97,N'Sweetbox'),(1,'I',98,N'Sweetbox'),(1,'I',99,N'Sweetbox'),(1,'I',100,N'Sweetbox');
--PHÒNG 2D-01 - 2
INSERT INTO Ghe (MaPhong, Hang, SoCot, LoaiGhe) VALUES
(2,'A',1,N'Thường'),(2,'A',2,N'Thường'),(2,'A',3,N'Thường'),(2,'A',4,N'Thường'),(2,'A',5,N'Thường'),
(2,'A',6,N'Thường'),(2,'A',7,N'Thường'),(2,'A',8,N'Thường'),(2,'A',9,N'Thường'),(2,'A',10,N'Thường');
(2,'B',11,N'Thường'),(2,'B',12,N'Thường'),(2,'B',13,N'Thường'),(2,'B',14,N'Thường'),(2,'B',15,N'Thường'),
(2,'B',16,N'Thường'),(2,'B',17,N'Thường'),(2,'B',18,N'Thường'),(2,'B',19,N'Thường'),(2,'B',20,N'Thường');
(2,'C',21,N'VIP'),(2,'C',22,N'VIP'),(2,'C',23,N'VIP'),(2,'C',24,N'VIP'),(2,'C',25,N'VIP'),
(2,'C',26,N'VIP'),(2,'C',27,N'VIP'),(2,'C',28,N'VIP'),(2,'C',29,N'VIP'),(2,'C',30,N'VIP');
(2,'D',31,N'VIP'),(2,'D',32,N'VIP'),(2,'D',33,N'VIP'),(2,'D',34,N'VIP'),(2,'D',35,N'VIP'),
(2,'D',36,N'VIP'),(2,'D',37,N'VIP'),(2,'D',38,N'VIP'),(2,'D',39,N'VIP'),(2,'D',40,N'VIP');
(2,'E',41,N'Sweetbox'),(2,'E',42,N'Sweetbox'),(2,'E',43,N'Sweetbox'),(2,'E',44,N'Sweetbox'),(2,'E',45,N'Sweetbox'),
(2,'E',46,N'Sweetbox'),(2,'E',47,N'Sweetbox'),(2,'E',48,N'Sweetbox'),(2,'E',49,N'Sweetbox'),(2,'E',50,N'Sweetbox');
(2,'F',51,N'Sweetbox'),(2,'F',52,N'Sweetbox'),(2,'F',53,N'Sweetbox'),(2,'F',54,N'Sweetbox'),(2,'F',55,N'Sweetbox'),
(2,'F',56,N'Sweetbox'),(2,'F',57,N'Sweetbox'),(2,'F',58,N'Sweetbox'),(2,'F',59,N'Sweetbox'),(2,'F',60,N'Sweetbox');
--PHÒNG 2D-02 - 3
INSERT INTO Ghe (MaPhong, Hang, SoCot, LoaiGhe) VALUES
-- Hàng A: Thường (1-10)
(3,'A',1,N'Thường'),(3,'A',2,N'Thường'),(3,'A',3,N'Thường'),(3,'A',4,N'Thường'),(3,'A',5,N'Thường'),
(3,'A',6,N'Thường'),(3,'A',7,N'Thường'),(3,'A',8,N'Thường'),(3,'A',9,N'Thường'),(3,'A',10,N'Thường'),

-- Hàng B: Thường (11-20)
(3,'B',11,N'Thường'),(3,'B',12,N'Thường'),(3,'B',13,N'Thường'),(3,'B',14,N'Thường'),(3,'B',15,N'Thường'),
(3,'B',16,N'Thường'),(3,'B',17,N'Thường'),(3,'B',18,N'Thường'),(3,'B',19,N'Thường'),(3,'B',20,N'Thường'),

-- Hàng C: VIP (21-30)
(3,'C',21,N'VIP'),(3,'C',22,N'VIP'),(3,'C',23,N'VIP'),(3,'C',24,N'VIP'),(3,'C',25,N'VIP'),
(3,'C',26,N'VIP'),(3,'C',27,N'VIP'),(3,'C',28,N'VIP'),(3,'C',29,N'VIP'),(3,'C',30,N'VIP'),

-- Hàng D: VIP (31-40)
(3,'D',31,N'VIP'),(3,'D',32,N'VIP'),(3,'D',33,N'VIP'),(3,'D',34,N'VIP'),(3,'D',35,N'VIP'),
(3,'D',36,N'VIP'),(3,'D',37,N'VIP'),(3,'D',38,N'VIP'),(3,'D',39,N'VIP'),(3,'D',40,N'VIP'),

-- Hàng E: Sweetbox (41-50)
(3,'E',41,N'Sweetbox'),(3,'E',42,N'Sweetbox'),(3,'E',43,N'Sweetbox'),(3,'E',44,N'Sweetbox'),(3,'E',45,N'Sweetbox'),
(3,'E',46,N'Sweetbox'),(3,'E',47,N'Sweetbox'),(3,'E',48,N'Sweetbox'),(3,'E',49,N'Sweetbox'),(3,'E',50,N'Sweetbox'),

-- Hàng F: Sweetbox (51-60)
(3,'F',51,N'Sweetbox'),(3,'F',52,N'Sweetbox'),(3,'F',53,N'Sweetbox'),(3,'F',54,N'Sweetbox'),(3,'F',55,N'Sweetbox'),
(3,'F',56,N'Sweetbox'),(3,'F',57,N'Sweetbox'),(3,'F',58,N'Sweetbox'),(3,'F',59,N'Sweetbox'),(3,'F',60,N'Sweetbox');
--PHONG 3D-01 - 4
INSERT INTO Ghe (MaPhong, Hang, SoCot, LoaiGhe) VALUES
-- Hàng A: Thường (1-10)
(4,'A',1,N'Thường'),(4,'A',2,N'Thường'),(4,'A',3,N'Thường'),(4,'A',4,N'Thường'),(4,'A',5,N'Thường'),
(4,'A',6,N'Thường'),(4,'A',7,N'Thường'),(4,'A',8,N'Thường'),(4,'A',9,N'Thường'),(4,'A',10,N'Thường'),

-- Hàng B: Thường (11-20)
(4,'B',11,N'Thường'),(4,'B',12,N'Thường'),(4,'B',13,N'Thường'),(4,'B',14,N'Thường'),(4,'B',15,N'Thường'),
(4,'B',16,N'Thường'),(4,'B',17,N'Thường'),(4,'B',18,N'Thường'),(4,'B',19,N'Thường'),(4,'B',20,N'Thường'),

-- Hàng C: VIP (21-30)
(4,'C',21,N'VIP'),(4,'C',22,N'VIP'),(4,'C',23,N'VIP'),(4,'C',24,N'VIP'),(4,'C',25,N'VIP'),
(4,'C',26,N'VIP'),(4,'C',27,N'VIP'),(4,'C',28,N'VIP'),(4,'C',29,N'VIP'),(4,'C',30,N'VIP'),

-- Hàng D: VIP (31-40)
(4,'D',31,N'VIP'),(4,'D',32,N'VIP'),(4,'D',33,N'VIP'),(4,'D',34,N'VIP'),(4,'D',35,N'VIP'),
(4,'D',36,N'VIP'),(4,'D',37,N'VIP'),(4,'D',38,N'VIP'),(4,'D',39,N'VIP'),(4,'D',40,N'VIP'),

-- Hàng E: Sweetbox (41-50)
(4,'E',41,N'Sweetbox'),(4,'E',42,N'Sweetbox'),(4,'E',43,N'Sweetbox'),(4,'E',44,N'Sweetbox'),(4,'E',45,N'Sweetbox'),
(4,'E',46,N'Sweetbox'),(4,'E',47,N'Sweetbox'),(4,'E',48,N'Sweetbox'),(4,'E',49,N'Sweetbox'),(4,'E',50,N'Sweetbox'),

-- Hàng F: Sweetbox (51-60)
(4,'F',51,N'Sweetbox'),(4,'F',52,N'Sweetbox'),(4,'F',53,N'Sweetbox'),(4,'F',54,N'Sweetbox'),(4,'F',55,N'Sweetbox'),
(4,'F',56,N'Sweetbox'),(4,'F',57,N'Sweetbox'),(4,'F',58,N'Sweetbox'),(4,'F',59,N'Sweetbox'),(4,'F',60,N'Sweetbox');
--PHONG 3D-02 - 5
INSERT INTO Ghe (MaPhong, Hang, SoCot, LoaiGhe) VALUES
-- Hàng A: Thường (1-10)
(5,'A',1,N'Thường'),(5,'A',2,N'Thường'),(5,'A',3,N'Thường'),(5,'A',4,N'Thường'),(5,'A',5,N'Thường'),
(5,'A',6,N'Thường'),(5,'A',7,N'Thường'),(5,'A',8,N'Thường'),(5,'A',9,N'Thường'),(5,'A',10,N'Thường'),

-- Hàng B: Thường (11-20)
(5,'B',11,N'Thường'),(5,'B',12,N'Thường'),(5,'B',13,N'Thường'),(5,'B',14,N'Thường'),(5,'B',15,N'Thường'),
(5,'B',16,N'Thường'),(5,'B',17,N'Thường'),(5,'B',18,N'Thường'),(5,'B',19,N'Thường'),(5,'B',20,N'Thường'),

-- Hàng C: VIP (21-30)
(5,'C',21,N'VIP'),(5,'C',22,N'VIP'),(5,'C',23,N'VIP'),(5,'C',24,N'VIP'),(5,'C',25,N'VIP'),
(5,'C',26,N'VIP'),(5,'C',27,N'VIP'),(5,'C',28,N'VIP'),(5,'C',29,N'VIP'),(5,'C',30,N'VIP'),

-- Hàng D: VIP (31-40)
(5,'D',31,N'VIP'),(5,'D',32,N'VIP'),(5,'D',33,N'VIP'),(5,'D',34,N'VIP'),(5,'D',35,N'VIP'),
(5,'D',36,N'VIP'),(5,'D',37,N'VIP'),(5,'D',38,N'VIP'),(5,'D',39,N'VIP'),(5,'D',40,N'VIP'),

-- Hàng E: Sweetbox (41-50)
(5,'E',41,N'Sweetbox'),(5,'E',42,N'Sweetbox'),(5,'E',43,N'Sweetbox'),(5,'E',44,N'Sweetbox'),(5,'E',45,N'Sweetbox'),
(5,'E',46,N'Sweetbox'),(5,'E',47,N'Sweetbox'),(5,'E',48,N'Sweetbox'),(5,'E',49,N'Sweetbox'),(5,'E',50,N'Sweetbox'),

-- Hàng F: Sweetbox (51-60)
(5,'F',51,N'Sweetbox'),(5,'F',52,N'Sweetbox'),(5,'F',53,N'Sweetbox'),(5,'F',54,N'Sweetbox'),(5,'F',55,N'Sweetbox'),
(5,'F',56,N'Sweetbox'),(5,'F',57,N'Sweetbox'),(5,'F',58,N'Sweetbox'),(5,'F',59,N'Sweetbox'),(5,'F',60,N'Sweetbox');

--Phòng VIP - 01
INSERT INTO Ghe (MaPhong, Hang, SoCot, LoaiGhe) VALUES
(6,'A',1,N'VIP'),(6,'A',2,N'VIP'),(6,'A',3,N'VIP'),(6,'A',4,N'VIP'),(6,'A',5,N'VIP'),
(6,'A',6,N'VIP'),(6,'A',7,N'VIP'),(6,'A',8,N'VIP'),(6,'A',9,N'VIP'),(6,'A',10,N'VIP'),
(6,'B',11,N'VIP'),(6,'B',12,N'VIP'),(6,'B',13,N'VIP'),(6,'B',14,N'VIP'),(6,'B',15,N'VIP'),
(6,'B',16,N'VIP'),(6,'B',17,N'VIP'),(6,'B',18,N'VIP'),(6,'B',19,N'VIP'),(6,'B',20,N'VIP'),
(6,'C',21,N'VIP'),(6,'C',22,N'VIP'),(6,'C',23,N'VIP'),(6,'C',24,N'VIP'),(6,'C',25,N'VIP'),
(6,'C',26,N'VIP'),(6,'C',27,N'VIP'),(6,'C',28,N'VIP'),(6,'C',29,N'VIP'),(6,'C',30,N'VIP'),
(6,'D',31,N'Sweetbox'),(6,'D',32,N'Sweetbox'),(6,'D',33,N'Sweetbox'),(6,'D',34,N'Sweetbox'),(6,'D',35,N'Sweetbox'),
(6,'D',36,N'Sweetbox'),(6,'D',37,N'Sweetbox'),(6,'D',38,N'Sweetbox'),(6,'D',39,N'Sweetbox'),(6,'D',40,N'Sweetbox');


INSERT INTO SuatChieu (MaPhim, MaPhong, NgayChieu, GioBatDau, GioKetThuc) VALUES
-- --- PHIM ĐANG CHIẾU ---
-- Kungfu Panda 4 (MaPhim: 4) - Chiếu tại Phòng 2
(4, 2, '2026-04-10', '09:00:00', '10:35:00'),
(4, 2, '2026-04-10', '13:00:00', '14:35:00'),

-- Doraemon Movie 45 (MaPhim: 2) - Chiếu tại Phòng 3
(2, 3, '2026-04-20', '08:30:00', '10:15:00'),
(2, 3, '2026-04-20', '15:00:00', '16:45:00'),

-- Avengers: Secret Wars (MaPhim: 1) - Ưu tiên Phòng 1 (IMAX 100 ghế)
(1, 1, '2026-05-01', '19:00:00', '22:00:00'),
(1, 1, '2026-05-01', '22:30:00', '01:30:00'),

-- Thám tử Conan Movie (MaPhim: 3) - Chiếu tại Phòng 2
(3, 2, '2026-05-15', '18:00:00', '19:50:00'),

-- Shin - Cậu bé bút chì Movie (MaPhim: 5) - Chiếu tại Phòng 3
(5, 3, '2026-05-25', '10:00:00', '11:35:00'),

-- Aquaman 3 (MaPhim: 7) - Chiếu tại Phòng 1
(7, 1, '2026-06-20', '20:00:00', '22:15:00'),

-- --- PHIM SẮP CHIẾU (Bán vé sớm) ---
-- Fast & Furious 11 (MaPhim: 8)
(8, 1, '2026-06-01', '17:00:00', '19:20:00'),

-- Spider-Man: Thế giới mới (MaPhim: 9)
(9, 2, '2026-06-10', '14:00:00', '16:10:00'),

-- The Nun 3 (MaPhim: 12) - Suất chiếu đêm
(12, 3, '2026-10-15', '23:00:00', '00:40:00');


-- Xóa dữ liệu cũ nếu cần thiết
DELETE FROM HoaDon;

INSERT INTO HoaDon (MaKH, NgayLap, HinhThucThanhToan, TrangThai, TongTien) VALUES 
-- --- THÁNG 04/2026 ---
(1, '2026-04-10', N'Tiền mặt', N'Đã thanh toán', 0),
(2, '2026-04-10', N'Tiền mặt', N'Đã thanh toán', 0),
(3, '2026-04-20', N'Tiền mặt', N'Đã thanh toán', 0),
(4, '2026-04-20', N'Tiền mặt', N'Đã thanh toán', 0),
(5, '2026-04-20', N'Tiền mặt', N'Đã thanh toán', 0),

-- --- THÁNG 05/2026 ---
(6, '2026-05-01', N'Thẻ', N'Đã thanh toán', 0),
(7, '2026-05-01', N'Thẻ', N'Đã thanh toán', 0),
(8, '2026-05-15', N'Thẻ', N'Đã thanh toán', 0),
(9, '2026-05-15', N'Thẻ', N'Đã thanh toán', 0),
(10, '2026-05-25', N'Thẻ', N'Chờ thanh toán', 0),

-- --- THÁNG 06/2026 ---
(11, '2026-06-01', N'Chuyển khoản', N'Đã thanh toán', 0),
(12, '2026-06-01', N'Chuyển khoản', N'Đã thanh toán', 0),
(13, '2026-06-10', N'Chuyển khoản', N'Đã thanh toán', 0),
(14, '2026-06-10', N'Chuyển khoản', N'Đã thanh toán', 0),
(15, '2026-06-20', N'Chuyển khoản', N'Đã thanh toán', 0),

-- --- THÁNG 10/2026 ---
(16, '2026-06-20', N'Tiền mặt', N'Đã thanh toán', 0),
(17, '2026-06-20', N'Thẻ', N'Đã thanh toán', 0),
(18, '2026-10-15', N'Chuyển khoản', N'Đã thanh toán', 0),
(19, '2026-10-15', N'Tiền mặt', N'Chờ thanh toán', 0),
(20, '2026-10-15', N'Thẻ', N'Đã thanh toán', 0);

--Thường : 120k
--VIP : 170k
--SweetBox : 300k

-- Xóa để làm sạch dữ liệu cũ
DELETE FROM Ve_ChiTiet;

-- --- THÁNG 04/2026 ---
-- HD 1: Kungfu Panda (Suất 1, Phòng 2), Ghế 1
INSERT INTO Ve_ChiTiet VALUES (1, 1, (SELECT MaGhe FROM Ghe WHERE MaPhong = 2 AND SoCot = 1), 120000);
-- HD 2: Kungfu Panda (Suất 1, Phòng 2), Ghế 2, 3
INSERT INTO Ve_ChiTiet VALUES (2, 1, (SELECT MaGhe FROM Ghe WHERE MaPhong = 2 AND SoCot = 2), 120000), 
                             (2, 1, (SELECT MaGhe FROM Ghe WHERE MaPhong = 2 AND SoCot = 3), 120000);
-- HD 3: Doraemon (Suất 3, Phòng 3), Ghế 1
INSERT INTO Ve_ChiTiet VALUES (3, 3, (SELECT MaGhe FROM Ghe WHERE MaPhong = 3 AND SoCot = 1), 120000);
-- HD 4: Doraemon (Suất 3, Phòng 3), Ghế 11, 12
INSERT INTO Ve_ChiTiet VALUES (4, 3, (SELECT MaGhe FROM Ghe WHERE MaPhong = 3 AND SoCot = 11), 120000), 
                             (4, 3, (SELECT MaGhe FROM Ghe WHERE MaPhong = 3 AND SoCot = 12), 120000);
-- HD 5: Doraemon (Suất 3, Phòng 3), Ghế VIP 21
INSERT INTO Ve_ChiTiet VALUES (5, 3, (SELECT MaGhe FROM Ghe WHERE MaPhong = 3 AND SoCot = 21), 170000);

-- --- THÁNG 05/2026 ---
-- HD 6: Avengers (Suất 5, Phòng 1), Ghế Sweetbox 61, 62
INSERT INTO Ve_ChiTiet VALUES (6, 5, (SELECT MaGhe FROM Ghe WHERE MaPhong = 1 AND SoCot = 61), 300000), 
                             (6, 5, (SELECT MaGhe FROM Ghe WHERE MaPhong = 1 AND SoCot = 62), 300000);
-- HD 7: Avengers (Suất 5, Phòng 1), Ghế VIP 31
INSERT INTO Ve_ChiTiet VALUES (7, 5, (SELECT MaGhe FROM Ghe WHERE MaPhong = 1 AND SoCot = 31), 170000);
-- HD 8: Conan (Suất 7, Phòng 2), Ghế VIP 21, 22
INSERT INTO Ve_ChiTiet VALUES (8, 7, (SELECT MaGhe FROM Ghe WHERE MaPhong = 2 AND SoCot = 21), 170000), 
                             (8, 7, (SELECT MaGhe FROM Ghe WHERE MaPhong = 2 AND SoCot = 22), 170000);
-- HD 9: Conan (Suất 7, Phòng 2), Ghế 1, 2
INSERT INTO Ve_ChiTiet VALUES (9, 7, (SELECT MaGhe FROM Ghe WHERE MaPhong = 2 AND SoCot = 1), 120000), 
                             (9, 7, (SELECT MaGhe FROM Ghe WHERE MaPhong = 2 AND SoCot = 2), 120000);
-- HD 10: Shin (Suất 8, Phòng 3), Ghế VIP 31
INSERT INTO Ve_ChiTiet VALUES (10, 8, (SELECT MaGhe FROM Ghe WHERE MaPhong = 3 AND SoCot = 31), 170000);

-- --- THÁNG 06/2026 ---
-- HD 11: Fast 11 (Suất 9, Phòng 1), Ghế 1
INSERT INTO Ve_ChiTiet VALUES (11, 9, (SELECT MaGhe FROM Ghe WHERE MaPhong = 1 AND SoCot = 1), 120000);
-- HD 12: Fast 11 (Suất 9, Phòng 1), Ghế VIP 31
INSERT INTO Ve_ChiTiet VALUES (12, 9, (SELECT MaGhe FROM Ghe WHERE MaPhong = 1 AND SoCot = 31), 170000);
-- HD 13: Spider-Man (Suất 10, Phòng 2), Ghế Sweetbox 41, 42
INSERT INTO Ve_ChiTiet VALUES (13, 10, (SELECT MaGhe FROM Ghe WHERE MaPhong = 2 AND SoCot = 41), 300000), 
                              (13, 10, (SELECT MaGhe FROM Ghe WHERE MaPhong = 2 AND SoCot = 42), 300000);
-- HD 14: Spider-Man (Suất 10, Phòng 2), Ghế 11
INSERT INTO Ve_ChiTiet VALUES (14, 10, (SELECT MaGhe FROM Ghe WHERE MaPhong = 2 AND SoCot = 11), 120000);
-- HD 15: Aquaman 3 (Suất 11, Phòng 1), Ghế VIP 41, 42
INSERT INTO Ve_ChiTiet VALUES (15, 11, (SELECT MaGhe FROM Ghe WHERE MaPhong = 1 AND SoCot = 41), 170000), 
                              (15, 11, (SELECT MaGhe FROM Ghe WHERE MaPhong = 1 AND SoCot = 42), 170000);

-- --- CÁC HÓA ĐƠN CÒN LẠI ---
-- HD 16: Aquaman 3 (Suất 11, Phòng 1), Ghế VIP 32, 33
INSERT INTO Ve_ChiTiet VALUES (16, 11, (SELECT MaGhe FROM Ghe WHERE MaPhong = 1 AND SoCot = 32), 170000), 
                              (16, 11, (SELECT MaGhe FROM Ghe WHERE MaPhong = 1 AND SoCot = 33), 170000);
-- HD 17: Aquaman 3 (Suất 11, Phòng 1), Ghế 2, 3
INSERT INTO Ve_ChiTiet VALUES (17, 11, (SELECT MaGhe FROM Ghe WHERE MaPhong = 1 AND SoCot = 2), 120000), 
                              (17, 11, (SELECT MaGhe FROM Ghe WHERE MaPhong = 1 AND SoCot = 3), 120000);
-- HD 18: The Nun 3 (Suất 12, Phòng 3), Ghế Sweetbox 41, 42
INSERT INTO Ve_ChiTiet VALUES (18, 12, (SELECT MaGhe FROM Ghe WHERE MaPhong = 3 AND SoCot = 41), 300000), 
                              (18, 12, (SELECT MaGhe FROM Ghe WHERE MaPhong = 3 AND SoCot = 42), 300000);
-- HD 19: The Nun 3 (Suất 12, Phòng 3), Ghế VIP 23
INSERT INTO Ve_ChiTiet VALUES (19, 12, (SELECT MaGhe FROM Ghe WHERE MaPhong = 3 AND SoCot = 23), 170000);
-- HD 20: The Nun 3 (Suất 12, Phòng 3), Ghế VIP 33
INSERT INTO Ve_ChiTiet VALUES (20, 12, (SELECT MaGhe FROM Ghe WHERE MaPhong = 3 AND SoCot = 33), 170000);
INSERT INTO HoaDon_Combo (MaHD, MaCombo, SoLuong) VALUES 
-- HD 1 (1 vé): 1 Combo Đơn
(1, 1, 1),

-- HD 2 (2 vé): 1 Combo Đôi
(2, 2, 1),

-- HD 3 (1 vé): 1 Combo Đơn
(3, 1, 1),

-- HD 4 (2 vé): 2 Combo Đơn
(4, 1, 2),

-- HD 6 (2 vé - Avengers): 1 Combo Gia đình (xem phim bom tấn ăn nhiều)
(6, 3, 1),

-- HD 8 (2 vé): 1 Combo Đôi
(8, 2, 1),

-- HD 9 (2 vé): 2 Combo Đơn
(9, 1, 2),

-- HD 12 (1 vé): 1 Combo Đơn
(12, 1, 1),

-- HD 13 (2 vé): 1 Combo Đôi
(13, 2, 1),

-- HD 15 (2 vé): 1 Combo Đôi
(15, 2, 1),

-- HD 16 (2 vé): 1 Combo Đôi
(16, 2, 1),

-- HD 18 (2 vé): 2 Combo Đơn
(18, 1, 2),

-- HD 20 (1 vé): 1 Combo Đơn
(20, 1, 1);



UPDATE HoaDon
SET TongTien = 
    ISNULL((SELECT SUM(GiaVe) FROM Ve_ChiTiet WHERE Ve_ChiTiet.MaHD = HoaDon.MaHD), 0) +
    ISNULL((SELECT SUM(c.Gia * hc.SoLuong) 
            FROM HoaDon_Combo hc 
            JOIN ComboDichVu c ON hc.MaCombo = c.MaCombo 
            WHERE hc.MaHD = HoaDon.MaHD), 0);







