USE QLRP;
GO

INSERT INTO Phim (TenPhim, TheLoai, ThoiLuong, GioiHanTuoi, NgayKhoiChieu, TrangThai)
VALUES 
(N'Dune: Phần Hai', N'Khoa học viễn tưởng', 166, 'C13', '2024-03-01', N'Đang chiếu'),
(N'Mai', N'Tâm lý, Tình cảm', 131, 'C18', '2024-02-10', N'Đang chiếu'),
(N'Kung Fu Panda 4', N'Hoạt hình', 94, 'P', '2024-03-08', N'Sắp chiếu'),
(N'Quật Mộ Trùng Ma', N'Kinh dị, Bí ẩn', 134, 'C16', '2024-03-15', N'Đang chiếu'),
(N'Lật Mặt 7', N'Gia đình, Hành động', 120, 'K', '2024-04-26', N'Sắp chiếu');

INSERT INTO PhongChieu (TenPhong, LoaiPhong, SucChua)
VALUES 
(N'Phòng 01', '2D', 50),
(N'Phòng 02', '3D', 40),
(N'Phòng IMAX 01', 'IMAX', 100);

INSERT INTO Ghe (MaPhong, Hang, SoCot, LoaiGhe)
VALUES 
(1, 'A', 1, N'Thường'), (1, 'A', 2, N'Thường'), (1, 'A', 3, N'Thường'),
(1, 'B', 1, N'VIP'), (1, 'B', 2, N'VIP'), (1, 'B', 3, N'VIP'),
(3, 'F', 10, N'Sweetbox'), (3, 'F', 11, N'Sweetbox');

INSERT INTO SuatChieu (MaPhim, MaPhong, NgayChieu, GioBatDau, GioKetThuc)
VALUES 
(1, 3, '2024-03-20', '19:00:00', '21:46:00'),
(2, 1, '2024-03-20', '20:00:00', '22:11:00'),
(4, 2, '2024-03-20', '18:30:00', '20:44:00');

INSERT INTO KhachHang (HoTen, SDT, Email, DiemTichLuy)
VALUES 
(N'Nguyễn Văn An', '0901234567', 'an.nguyen@gmail.com', 100),
(N'Lê Thị Bình', '0912345678', 'binh.le@yahoo.com', 50),
(N'Trần Minh Cường', '0988888888', 'cuong.tm@outlook.com', 0);

INSERT INTO ComboDichVu (TenCombo, Gia)
VALUES 
(N'Combo Solo (1 Bắp + 1 Nước)', 85000),
(N'Combo Couple (1 Bắp + 2 Nước)', 120000),
(N'Combo Gia Đình (2 Bắp + 4 Nước)', 250000);

INSERT INTO HoaDon (MaKH, NgayLap, HinhThucThanhToan, TrangThai, TongTien)
VALUES 
(1, '2024-03-20 18:30:00', N'Ví điện tử', N'Đã thanh toán', 185000),
(2, '2024-03-20 19:15:00', N'Tiền mặt', N'Đã thanh toán', 120000);

INSERT INTO Ve_ChiTiet (MaHD, MaSuat, MaGhe, GiaVe)
VALUES 
(1, 1, 7, 100000),
(2, 2, 4, 80000);

INSERT INTO HoaDon_Combo (MaHD, MaCombo, SoLuong)
VALUES 
(1, 1, 1),
(2, 2, 1);