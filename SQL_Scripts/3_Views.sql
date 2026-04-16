USE QLRP;
GO

CREATE OR ALTER VIEW v_LichChieu AS
SELECT 
    sc.MaSuat,
    p.TenPhim,
    p.TrangThai,
    p.ThoiLuong,
    pc.TenPhong,
    pc.LoaiPhong,
    sc.NgayChieu,
    FORMAT(sc.GioBatDau, 'HH:mm') AS GioBatDau, 
    FORMAT(sc.GioKetThuc, 'HH:mm') AS GioKetThuc
FROM SuatChieu sc
JOIN Phim p ON sc.MaPhim = p.MaPhim
JOIN PhongChieu pc ON sc.MaPhong = pc.MaPhong;
GO

CREATE OR ALTER VIEW v_DoanhThuPhim AS
SELECT 
    p.TenPhim,
    COUNT(v.MaVe) AS TongSoVeDaBan,
    ISNULL(SUM(v.GiaVe), 0) AS TongDoanhThuVe 
FROM Phim p
LEFT JOIN SuatChieu sc ON p.MaPhim = sc.MaPhim
LEFT JOIN Ve_ChiTiet v ON sc.MaSuat = v.MaSuat
GROUP BY p.TenPhim;
GO