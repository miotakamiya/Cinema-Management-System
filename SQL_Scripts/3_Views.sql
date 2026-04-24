USE QLRP;
GO

CREATE OR ALTER VIEW v_LichChieu AS
SELECT
    sc.MaSuat,
    p.MaPhim,
    p.TenPhim,
    p.TheLoai,
    p.ThoiLuong,
    p.GioiHanTuoi,
    p.TrangThai       AS TrangThaiPhim,
    qg.TenQuocGia,
    pc.MaPhong,
    pc.TenPhong,
    pc.LoaiPhong,
    sc.NgayChieu,
    FORMAT(sc.GioBatDau,  N'HH:mm') AS GioBatDau,
    FORMAT(sc.GioKetThuc, N'HH:mm') AS GioKetThuc
FROM SuatChieu sc
JOIN Phim       p  ON sc.MaPhim  = p.MaPhim
JOIN PhongChieu pc ON sc.MaPhong = pc.MaPhong
JOIN QuocGia    qg ON p.MaQuocGia = qg.MaQuocGia;
GO

CREATE OR ALTER VIEW v_PhimHienThi AS
SELECT
    p.MaPhim,
    p.TenPhim,
    p.TheLoai,
    p.ThoiLuong,
    p.GioiHanTuoi,
    p.NgayKhoiChieu,
    p.TrangThai,
    qg.TenQuocGia
FROM Phim    p
JOIN QuocGia qg ON p.MaQuocGia = qg.MaQuocGia
WHERE p.TrangThai IN (N'Đang chiếu', N'Sắp chiếu');
GO

CREATE OR ALTER VIEW v_TrangThaiGhe AS
SELECT
    g.MaGhe,
    g.MaPhong,
    g.Hang,
    g.SoCot,
    lg.TenLoaiGhe,
    lg.PhuThu,
    sc.MaSuat,
    sc.NgayChieu,
    FORMAT(sc.GioBatDau, N'HH:mm') AS GioBatDau,
    CASE
        WHEN v.MaVe IS NOT NULL THEN N'Đã đặt'
        ELSE N'Còn trống'
    END AS TrangThai
FROM Ghe g
JOIN LoaiGhe   lg ON g.MaLoai    = lg.MaLoai
JOIN SuatChieu sc ON g.MaPhong   = sc.MaPhong
LEFT JOIN Ve_ChiTiet v ON v.MaGhe = g.MaGhe
                       AND v.MaSuat = sc.MaSuat;
GO

CREATE OR ALTER VIEW v_ChiTietHoaDon AS
SELECT
    hd.MaHD,
    hd.NgayLap,
    hd.HinhThucThanhToan,
    hd.TrangThai          AS TrangThaiHD,
    kh.MaKH,
    kh.HoTen              AS TenKhachHang,
    kh.SDT,
    kh.Email,
    -- Vé
    v.MaVe,
    p.TenPhim,
    pc.TenPhong,
    pc.LoaiPhong,
    sc.NgayChieu,
    FORMAT(sc.GioBatDau,  N'HH:mm') AS GioBatDau,
    FORMAT(sc.GioKetThuc, N'HH:mm') AS GioKetThuc,
    g.Hang + CAST(g.SoCot AS VARCHAR) AS SoGhe,
    lg.TenLoaiGhe,
    v.GiaVe,
    -- Combo
    cd.TenCombo,
    hdc.SoLuong           AS SoLuongCombo,
    cd.Gia                AS DonGiaCombo,
    hdc.SoLuong * cd.Gia  AS ThanhTienCombo
FROM HoaDon hd
JOIN KhachHang   kh  ON hd.MaKH     = kh.MaKH
JOIN Ve_ChiTiet  v   ON hd.MaHD     = v.MaHD
JOIN SuatChieu   sc  ON v.MaSuat    = sc.MaSuat
JOIN Phim        p   ON sc.MaPhim   = p.MaPhim
JOIN PhongChieu  pc  ON sc.MaPhong  = pc.MaPhong
JOIN Ghe         g   ON v.MaGhe     = g.MaGhe
JOIN LoaiGhe     lg  ON g.MaLoai    = lg.MaLoai
LEFT JOIN HoaDon_Combo hdc ON hd.MaHD    = hdc.MaHD
LEFT JOIN ComboDichVu  cd  ON hdc.MaCombo = cd.MaCombo;
GO

CREATE OR ALTER VIEW v_DoanhThuPhim AS
SELECT
    p.MaPhim,
    p.TenPhim,
    p.TheLoai,
    p.TrangThai,
    qg.TenQuocGia,
    COUNT(DISTINCT sc.MaSuat)       AS TongSoSuat,
    COUNT(v.MaVe)                   AS TongVeDaBan,
    ISNULL(SUM(v.GiaVe), 0)         AS DoanhThuVe,
    ISNULL(SUM(hdc.SoLuong * cd.Gia), 0) AS DoanhThuCombo,
    ISNULL(SUM(v.GiaVe), 0)
    + ISNULL(SUM(hdc.SoLuong * cd.Gia), 0) AS TongDoanhThu
FROM Phim p
JOIN QuocGia       qg  ON p.MaQuocGia  = qg.MaQuocGia
LEFT JOIN SuatChieu    sc  ON p.MaPhim     = sc.MaPhim
LEFT JOIN Ve_ChiTiet   v   ON sc.MaSuat    = v.MaSuat
LEFT JOIN HoaDon_Combo hdc ON v.MaHD       = hdc.MaHD
LEFT JOIN ComboDichVu  cd  ON hdc.MaCombo  = cd.MaCombo
GROUP BY p.MaPhim, p.TenPhim, p.TheLoai, p.TrangThai, qg.TenQuocGia;
GO

CREATE OR ALTER VIEW v_DoanhThuTheoNgay AS
SELECT
    CAST(hd.NgayLap AS DATE)          AS NgayBan,
    COUNT(DISTINCT hd.MaHD)           AS SoHoaDon,
    COUNT(v.MaVe)                     AS SoVe,
    ISNULL(SUM(v.GiaVe), 0)           AS DoanhThuVe,
    ISNULL(SUM(hdc.SoLuong * cd.Gia), 0) AS DoanhThuCombo,
    ISNULL(SUM(v.GiaVe), 0)
    + ISNULL(SUM(hdc.SoLuong * cd.Gia), 0) AS TongDoanhThu
FROM HoaDon hd
LEFT JOIN Ve_ChiTiet   v   ON hd.MaHD      = v.MaHD
LEFT JOIN HoaDon_Combo hdc ON hd.MaHD      = hdc.MaHD
LEFT JOIN ComboDichVu  cd  ON hdc.MaCombo  = cd.MaCombo
GROUP BY CAST(hd.NgayLap AS DATE);
GO

CREATE OR ALTER VIEW v_DoanhThuPhong AS
SELECT
    pc.MaPhong,
    pc.TenPhong,
    pc.LoaiPhong,
    pc.SucChua,
    COUNT(DISTINCT sc.MaSuat)       AS TongSoSuat,
    COUNT(v.MaVe)                   AS TongVeDaBan,
    ISNULL(SUM(v.GiaVe), 0)         AS TongDoanhThu,
    CASE
        WHEN COUNT(DISTINCT sc.MaSuat) = 0 THEN 0
        ELSE CAST(COUNT(v.MaVe) AS FLOAT)
             / (COUNT(DISTINCT sc.MaSuat) * pc.SucChua) * 100
    END                             AS TiLeKinDoanhTB
FROM PhongChieu pc
LEFT JOIN SuatChieu  sc ON pc.MaPhong  = sc.MaPhong
LEFT JOIN Ve_ChiTiet v  ON sc.MaSuat   = v.MaSuat
GROUP BY pc.MaPhong, pc.TenPhong, pc.LoaiPhong, pc.SucChua;
GO

CREATE OR ALTER VIEW v_TopCombo AS
SELECT
    cd.MaCombo,
    cd.TenCombo,
    cd.Gia,
    ISNULL(SUM(hdc.SoLuong), 0)         AS TongSoLuongBan,
    ISNULL(SUM(hdc.SoLuong * cd.Gia), 0) AS TongDoanhThu
FROM ComboDichVu cd
LEFT JOIN HoaDon_Combo hdc ON cd.MaCombo = hdc.MaCombo
GROUP BY cd.MaCombo, cd.TenCombo, cd.Gia;
GO

CREATE OR ALTER VIEW v_KhachHangTongQuan AS
SELECT
    kh.MaKH,
    kh.HoTen,
    kh.SDT,
    kh.Email,
    kh.DiemTichLuy,
    COUNT(DISTINCT hd.MaHD)           AS TongHoaDon,
    COUNT(v.MaVe)                     AS TongVeDaMua,
    ISNULL(SUM(v.GiaVe), 0)
    + ISNULL(SUM(hdc.SoLuong * cd.Gia), 0) AS TongChiTieu,
    MAX(CAST(hd.NgayLap AS DATE))     AS LanMuaCuoi
FROM KhachHang kh
LEFT JOIN HoaDon       hd  ON kh.MaKH      = hd.MaKH
LEFT JOIN Ve_ChiTiet   v   ON hd.MaHD      = v.MaHD
LEFT JOIN HoaDon_Combo hdc ON hd.MaHD      = hdc.MaHD
LEFT JOIN ComboDichVu  cd  ON hdc.MaCombo  = cd.MaCombo
GROUP BY kh.MaKH, kh.HoTen, kh.SDT, kh.Email, kh.DiemTichLuy;
GO

CREATE OR ALTER VIEW v_LichSuMuaVe AS
SELECT
    kh.MaKH,
    kh.HoTen,
    hd.MaHD,
    CAST(hd.NgayLap AS DATE)          AS NgayMua,
    hd.HinhThucThanhToan,
    p.TenPhim,
    pc.TenPhong,
    pc.LoaiPhong,
    sc.NgayChieu,
    FORMAT(sc.GioBatDau, N'HH:mm')    AS GioBatDau,
    g.Hang + CAST(g.SoCot AS VARCHAR) AS SoGhe,
    lg.TenLoaiGhe,
    v.GiaVe
FROM KhachHang   kh
JOIN HoaDon      hd  ON kh.MaKH    = hd.MaKH
JOIN Ve_ChiTiet  v   ON hd.MaHD    = v.MaHD
JOIN SuatChieu   sc  ON v.MaSuat   = sc.MaSuat
JOIN Phim        p   ON sc.MaPhim  = p.MaPhim
JOIN PhongChieu  pc  ON sc.MaPhong = pc.MaPhong
JOIN Ghe         g   ON v.MaGhe    = g.MaGhe
JOIN LoaiGhe     lg  ON g.MaLoai   = lg.MaLoai;
GO

PRINT N'Tạo tất cả VIEW thành công!';
GO