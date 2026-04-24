USE QLRP;
GO
-- Ngăn chặn xếp 2 suất chiếu trong cùng 1 phòng vào cùng một khoảng thời gian
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
-- Tích điểm dựa trên số tiền chi tiêu (Giả sử dựa trên giá trị các vé đã mua)
CREATE OR ALTER TRIGGER trg_TichDiemKhachHang
ON HoaDon
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF UPDATE(TrangThai)
    BEGIN
        UPDATE KhachHang
        SET DiemTichLuy = DiemTichLuy + (T.TongTien / 10000)
        FROM KhachHang kh
        JOIN inserted i ON kh.MaKH = i.MaKH
        JOIN deleted d ON i.MaHD = d.MaHD
        CROSS APPLY (
            SELECT ISNULL(SUM(GiaVe), 0) AS TongTien 
            FROM Ve_ChiTiet 
            WHERE MaHD = i.MaHD
        ) T
        WHERE i.TrangThai = N'Đã thanh toán' 
          AND d.TrangThai <> N'Đã thanh toán';
    END
END;
GO
-- Đảm bảo ghế trong cùng suất chiếu không thể bán cho 2 người
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