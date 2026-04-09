USE QLRP;
GO

CREATE OR ALTER PROCEDURE sp_DatVe
    @MaKH INT,
    @MaSuat INT,
    @MaGhe INT,
    @GiaVe DECIMAL(18,2)
AS
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM Ve_ChiTiet 
        WHERE MaSuat = @MaSuat AND MaGhe = @MaGhe
    )
    BEGIN
        RAISERROR (N'Lỗi: Ghế này đã có người đặt cho suất chiếu này!', 16, 1);
        RETURN;
    END

    BEGIN TRANSACTION;
    BEGIN TRY
        -- 1. Tạo hóa đơn
        INSERT INTO HoaDon (MaKH, NgayLap, TongTien, TrangThai)
        VALUES (@MaKH, GETDATE(), @GiaVe, N'Đã thanh toán');

        DECLARE @MaHD INT = SCOPE_IDENTITY();

        -- 2. Chèn vào chi tiết vé
        INSERT INTO Ve_ChiTiet (MaHD, MaSuat, MaGhe, GiaVe)
        VALUES (@MaHD, @MaSuat, @MaGhe, @GiaVe);

        COMMIT TRANSACTION;
        PRINT N'Đặt vé thành công!';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrMsg NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrMsg, 16, 1);
    END CATCH
END;
GO