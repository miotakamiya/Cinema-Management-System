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

    def dat_ve(self, ma_kh, ma_suat, ma_ghe, gia_ve):
        try:
            sql = "{CALL sp_DatVe (?, ?, ?, ?)}"
            self.cursor.execute(sql, (ma_kh, ma_suat, ma_ghe, gia_ve))
            self.conn.commit()
            return True, "Đặt vé thành công!"
        except Exception as e:
            return False, str(e)