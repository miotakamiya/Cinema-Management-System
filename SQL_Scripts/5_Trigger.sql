USE QLRP;
GO

-- TRIGGER: KIỂM TRA TRÙNG LỊCH CHIẾU
-- Tác dụng: Ngăn chặn việc xếp 2 suất chiếu trong cùng 1 phòng vào cùng một khoảng thời gian.
CREATE OR ALTER TRIGGER trg_CheckTrungLichChieu
ON SuatChieu
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (
        SELECT 1 
        FROM SuatChieu s
        INNER JOIN inserted i ON s.MaPhong = i.MaPhong
        WHERE s.MaSuat <> i.MaSuat
          AND i.NgayChieu = s.NgayChieu
          AND i.GioBatDau < s.GioKetThuc 
          AND i.GioKetThuc > s.GioBatDau
    )
    BEGIN
        RAISERROR (N'Lỗi: Phòng này đã có lịch chiếu khác trong khoảng thời gian bạn chọn!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

-- TRIGGER: TỰ ĐỘNG TÍCH ĐIỂM KHÁCH HÀNG
-- Tác dụng: Cứ mỗi 10.000đ chi tiêu, khách hàng được cộng 1 điểm khi hóa đơn chuyển sang 'Đã thanh toán'.
CREATE OR ALTER TRIGGER trg_TichDiemKhachHang
ON HoaDon
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF UPDATE(TrangThai)
    BEGIN
        UPDATE KhachHang
        SET DiemTichLuy = DiemTichLuy + (i.TongTien / 10000)
        FROM KhachHang kh
        JOIN inserted i ON kh.MaKH = i.MaKH
        JOIN deleted d ON i.MaHD = d.MaHD
        WHERE i.TrangThai = N'Đã thanh toán' 
          AND d.TrangThai <> N'Đã thanh toán';
    END
END;
GO

-- TRIGGER: CẬP NHẬT TỔNG TIỀN HÓA ĐƠN KHI THÊM VÉ
-- Tác dụng: Khi chèn 1 vé mới vào Ve_ChiTiet, tổng tiền của HoaDon sẽ tự động cộng thêm.
CREATE OR ALTER TRIGGER trg_UpdateTongTien_Ve
ON Ve_ChiTiet
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE HoaDon
    SET TongTien = 
        ISNULL((SELECT SUM(GiaVe) FROM Ve_ChiTiet WHERE MaHD = HoaDon.MaHD), 0) +
        ISNULL((SELECT SUM(c.Gia * hc.SoLuong) 
                FROM HoaDon_Combo hc 
                JOIN ComboDichVu c ON hc.MaCombo = c.MaCombo 
                WHERE hc.MaHD = HoaDon.MaHD), 0)
    WHERE MaHD IN (SELECT MaHD FROM inserted UNION SELECT MaHD FROM deleted);
END;
GO

-- TRIGGER: CẬP NHẬT TỔNG TIỀN HÓA ĐƠN KHI THÊM COMBO
-- Tác dụng: Khi khách mua thêm bắp nước (Combo), tổng tiền của HoaDon sẽ tự động cập nhật.
CREATE OR ALTER TRIGGER trg_UpdateTongTien_Combo
ON HoaDon_Combo
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE HoaDon
    SET TongTien = 
        ISNULL((SELECT SUM(GiaVe) FROM Ve_ChiTiet WHERE MaHD = HoaDon.MaHD), 0) +
        ISNULL((SELECT SUM(c.Gia * hc.SoLuong) 
                FROM HoaDon_Combo hc 
                JOIN ComboDichVu c ON hc.MaCombo = c.MaCombo 
                WHERE hc.MaHD = HoaDon.MaHD), 0)
    WHERE MaHD IN (SELECT MaHD FROM inserted UNION SELECT MaHD FROM deleted);
END;
GO

-- TRIGGER: NGĂN CHẶN ĐẶT TRÙNG GHẾ
-- Tác dụng: Đảm bảo một ghế trong cùng một suất chiếu không thể bán cho hai người.
CREATE OR ALTER TRIGGER trg_CheckTrungGhe
ON Ve_ChiTiet
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (
        SELECT 1 FROM Ve_ChiTiet v
        JOIN inserted i ON v.MaSuat = i.MaSuat AND v.MaGhe = i.MaGhe
    )
    BEGIN
        RAISERROR (N'Lỗi: Ghế này đã được bán trong suất chiếu này!', 16, 1);
    END
    ELSE
    BEGIN
        INSERT INTO Ve_ChiTiet (MaHD, MaSuat, MaGhe, GiaVe)
        SELECT MaHD, MaSuat, MaGhe, GiaVe FROM inserted;
    END
END;
GO