USE QLRP;
GO

CREATE OR ALTER TRIGGER trg_CheckTrungLichChieu
ON SuatChieu
AFTER INSERT, UPDATE
AS
BEGIN
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
        RAISERROR (N'Lỗi: Phòng này đã có lịch chiếu khác trong khoảng thời gian này!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

CREATE OR ALTER TRIGGER trg_TichDiemKhachHang
ON HoaDon
AFTER UPDATE
AS
BEGIN
    IF UPDATE(TrangThai)
    BEGIN
        UPDATE KhachHang
        SET DiemTichLuy = DiemTichLuy + (i.TongTien / 1000)
        FROM KhachHang kh
        JOIN inserted i ON kh.MaKH = i.MaKH
        WHERE i.TrangThai = N'Đã thanh toán';
    END
END;
GO