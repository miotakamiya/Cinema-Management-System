# main.py
from database import CinemaDB

def show_menu():
    db = CinemaDB()
    while True:
        print("\n=== QUẢN LÝ RẠP PHIÊM - DEMO ===")
        print("1. Xem lịch chiếu")
        print("2. Đặt vé nhanh")
        print("0. Thoát")
        
        chon = input("Chọn chức năng: ")
        
        if chon == "1":
            lich = db.get_lich_chieu()
            for item in lich:
                print(f"{item.TenPhim} - {item.TenPhong} - {item.GioBatDau}")
        elif chon == "2":
            # Demo đặt vé giả định
            success, msg = db.dat_ve(1, 1, 3, 90000)
            print(msg)
        elif chon == "0":
            break

if __name__ == "__main__":
    show_menu()