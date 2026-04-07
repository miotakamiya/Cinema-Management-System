USE QLRP;
GO

CREATE OR ALTER PROCEDURE sp_DatVe
    @MaKH INT,
    @MaSuat INT,
    @MaGhe INT,
    @GiaVe DECIMAL(18,2)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Ve_ChiTiet WHERE MaSuat = @MaSuat AND MaGhe = @MaGhe)
    BEGIN
        PRINT N'Lỗi: Ghế này đã có người đặt cho suất chiếu này!';
        RETURN;
    END

    BEGIN TRANSACTION;
    BEGIN TRY
        DECLARE @MaHD_Moi INT;
        INSERT INTO HoaDon (MaKH, NgayLap, TongTien, TrangThai)
        VALUES (@MaKH, GETDATE(), @GiaVe, N'Đã thanh toán');

        SET @MaHD_Moi = SCOPE_IDENTITY();

        INSERT INTO Ve_ChiTiet (MaHD, MaSuat, MaGhe, GiaVe)
        VALUES (@MaHD_Moi, @MaSuat, @MaGhe, @GiaVe);

        COMMIT TRANSACTION;
        PRINT N'Chúc mừng! Bạn đã đặt vé thành công.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT N'Đã có lỗi xảy ra trong quá trình đặt vé.';
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE sp_ThongKeDoanhThu
    @TuNgay DATE,
    @DenNgay DATE
AS
BEGIN
    SELECT 
        COUNT(MaHD) AS TongSoHoaDon,
        SUM(TongTien) AS TongDoanhThu
    FROM HoaDon
    WHERE CAST(NgayLap AS DATE) BETWEEN @TuNgay AND @DenNgay;
END;
GO