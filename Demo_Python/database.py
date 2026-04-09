import pyodbc
from config import DB_CONFIG

class CinemaDB:
    def __init__(self):
        conn_str = (
            f"Driver={DB_CONFIG['driver']};"
            f"Server={DB_CONFIG['server']};"
            f"Database={DB_CONFIG['database']};"
            f"Trusted_Connection={DB_CONFIG['trusted_connection']};"
        )
        self.conn = pyodbc.connect(conn_str)
        self.cursor = self.conn.cursor()

    def get_lich_chieu(self):
        self.cursor.execute("SELECT * FROM v_LichChieu")
        return self.cursor.fetchall()

    def get_ve_da_dat(self, sdt=""):
        sql = "SELECT * FROM v_DanhSachVe"
        if sdt:
            sql += " WHERE SDT = ?"
            self.cursor.execute(sql, (sdt,))
        else:
            self.cursor.execute(sql)
        return self.cursor.fetchall()

    def get_gia_ghe(self, ma_ghe):
        GIA_THEO_LOAI = {"Thường": 70000, "VIP": 100000, "Sweetbox": 150000}
        self.cursor.execute("SELECT LoaiGhe FROM Ghe WHERE MaGhe = ?", (ma_ghe,))
        row = self.cursor.fetchone()
        if row:
            return GIA_THEO_LOAI.get(row[0], 70000)
        return 70000

    def get_danh_sach_ghe(self, ma_phong):
        self.cursor.execute("SELECT MaGhe, Hang, SoCot FROM Ghe WHERE MaPhong = ?", (ma_phong,))
        return self.cursor.fetchall()

    def dat_ve(self, ma_kh, ma_suat, ma_ghe, gia_ve):
        try:
            sql = "{CALL sp_DatVe (?, ?, ?, ?)}"
            self.cursor.execute(sql, (ma_kh, ma_suat, ma_ghe, gia_ve))
            self.conn.commit()
            return True, "Đặt vé thành công!"
        except Exception as e:
            return False, str(e)

    def huy_ve(self, ma_ve):
        try:
            self.cursor.execute("SELECT MaHD FROM Ve_ChiTiet WHERE MaVe = ?", (ma_ve,))
            row = self.cursor.fetchone()
            if not row:
                return False, "Không tìm thấy vé!"
            ma_hd = row[0]
            self.cursor.execute("DELETE FROM Ve_ChiTiet WHERE MaVe = ?", (ma_ve,))
            self.cursor.execute("DELETE FROM HoaDon_Combo WHERE MaHD = ?", (ma_hd,))
            self.cursor.execute("DELETE FROM HoaDon WHERE MaHD = ?", (ma_hd,))
            self.conn.commit()
            return True, "Đã hủy vé thành công!"
        except Exception as e:
            return False, str(e)