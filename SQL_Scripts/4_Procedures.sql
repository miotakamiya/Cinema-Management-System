USE QLRP;
GO

CREATE OR ALTER PROCEDURE sp_DatVe_NangCap
    @MaKH INT,
    @MaSuat INT,
    @DanhSachGhe NVARCHAR(MAX),
    @HinhThucTT NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        -- 1. Kiểm tra ghế đã đặt
        IF EXISTS (
            SELECT 1 FROM Ve_ChiTiet 
            WHERE MaSuat = @MaSuat AND MaGhe IN (SELECT value FROM STRING_SPLIT(@DanhSachGhe, ','))
        )
        BEGIN
            RAISERROR (N'Một hoặc nhiều ghế bạn chọn đã có người đặt!', 16, 1);
        END

        -- 2. Tạo hóa đơn
        INSERT INTO HoaDon (MaKH, NgayLap, HinhThucThanhToan, TrangThai)
        VALUES (@MaKH, GETDATE(), @HinhThucTT, N'Đã thanh toán');

        DECLARE @MaHD INT = SCOPE_IDENTITY();

        -- 3. Chèn vé và lấy giá từ bảng LoaiGhe
        INSERT INTO Ve_ChiTiet (MaHD, MaSuat, MaGhe, GiaVe)
        SELECT @MaHD, @MaSuat, g.MaGhe, (120000 + lg.PhuThu)
        FROM Ghe g
        JOIN LoaiGhe lg ON g.MaLoai = lg.MaLoai
        WHERE g.MaGhe IN (SELECT value FROM STRING_SPLIT(@DanhSachGhe, ','));

        COMMIT TRANSACTION;
        PRINT N'Đặt vé thành công! Mã hóa đơn: ' + CAST(@MaHD AS VARCHAR);
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        DECLARE @ErrorMsg NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMsg, 16, 1);
    END CATCH
END;
GO