USE QLRP;
GO

--Tự tính tiền dựa trên loại ghế và hỗ trợ Combo
CREATE OR ALTER PROCEDURE sp_DatVe_NangCap
    @MaKH INT,
    @MaSuat INT,
    @DanhSachGhe NVARCHAR(MAX), -- Chuỗi ID ghế cách nhau bằng dấu phẩy, VD: '1,2,3'
    @HinhThucTT NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Kiểm tra xem có ghế nào trong danh sách đã bị đặt chưa
        IF EXISTS (
            SELECT 1 FROM Ve_ChiTiet 
            WHERE MaSuat = @MaSuat AND MaGhe IN (SELECT value FROM STRING_SPLIT(@DanhSachGhe, ','))
        )
        BEGIN
            RAISERROR (N'Một hoặc nhiều ghế bạn chọn đã có người đặt!', 16, 1);
        END

        --Tạo hóa đơn trống trước
        INSERT INTO HoaDon (MaKH, NgayLap, HinhThucThanhToan, TrangThai, TongTien)
        VALUES (@MaKH, GETDATE(), @HinhThucTT, N'Đã thanh toán', 0);

        DECLARE @MaHD INT = SCOPE_IDENTITY();

        -- Chèn các vé vào Chi tiết và TỰ ĐỘNG lấy giá vé theo loại ghế
        INSERT INTO Ve_ChiTiet (MaHD, MaSuat, MaGhe, GiaVe)
        SELECT @MaHD, @MaSuat, g.MaGhe, 
               CASE 
                    WHEN g.LoaiGhe = N'Sweetbox' THEN 300000
                    WHEN g.LoaiGhe = N'VIP' THEN 170000
                    ELSE 120000 
               END
        FROM Ghe g
        WHERE g.MaGhe IN (SELECT value FROM STRING_SPLIT(@DanhSachGhe, ','));

        -- Cập nhật lại tổng tiền cho hóa đơn vừa tạo
        UPDATE HoaDon
        SET TongTien = (SELECT SUM(GiaVe) FROM Ve_ChiTiet WHERE MaHD = @MaHD)
        WHERE MaHD = @MaHD;

        COMMIT TRANSACTION;
        PRINT N'Đặt nhóm vé thành công! Mã hóa đơn: ' + CAST(@MaHD AS VARCHAR);
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        DECLARE @ErrorMsg NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMsg, 16, 1);
    END CATCH
END;
GO