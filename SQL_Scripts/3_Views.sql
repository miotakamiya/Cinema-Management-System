USE QLRP;
GO

CREATE OR ALTER VIEW v_LichChieu AS
SELECT 
    sc.MaSuat,
    p.TenPhim,
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

CREATE OR ALTER VIEW v_DanhSachVe AS
SELECT 
    v.MaVe,
    hd.MaHD,
    kh.HoTen AS TenKhachHang,
    kh.SDT,
    p.TenPhim,
    pc.TenPhong,
    g.Hang + CAST(g.SoCot AS VARCHAR) AS ViTriGhe,
    g.LoaiGhe,
    v.GiaVe,
    hd.NgayLap AS NgayThanhToan
FROM Ve_ChiTiet v
JOIN HoaDon hd ON v.MaHD = hd.MaHD
JOIN KhachHang kh ON hd.MaKH = kh.MaKH
JOIN SuatChieu sc ON v.MaSuat = sc.MaSuat
JOIN Phim p ON sc.MaPhim = p.MaPhim
JOIN PhongChieu pc ON sc.MaPhong = pc.MaPhong
JOIN Ghe g ON v.MaGhe = g.MaGhe;
GO

CREATE OR ALTER VIEW v_DoanhThuPhim AS
SELECT 
    p.TenPhim,
    COUNT(v.MaVe) AS TongSoVeDaBan,
    SUM(v.GiaVe) AS TongDoanhThuVe
FROM Phim p
LEFT JOIN SuatChieu sc ON p.MaPhim = sc.MaPhim
LEFT JOIN Ve_ChiTiet v ON sc.MaSuat = v.MaSuat
GROUP BY p.TenPhim;
GO