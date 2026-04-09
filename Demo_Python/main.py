import customtkinter as ctk
from tkinter import messagebox, ttk
from database import CinemaDB

class CinemaApp(ctk.CTk):
    def __init__(self):
        super().__init__()
        self.db = CinemaDB()
        self.title("Cinema Management System")
        self.geometry("1100x700")
        ctk.set_appearance_mode("dark")

        # Tạo Tabs
        self.tabview = ctk.CTkTabview(self)
        self.tabview.pack(fill="both", expand=True, padx=10, pady=10)
        self.tab_mua_ve = self.tabview.add("Lịch Chiếu & Đặt Vé")
        self.tab_quan_ly = self.tabview.add("Vé Đã Đặt")

        self.setup_tab_mua_ve()
        self.setup_tab_quan_ly()

    def setup_tab_mua_ve(self):
        # Bảng lịch chiếu
        ctk.CTkLabel(self.tab_mua_ve, text="DANH SÁCH SUẤT CHIẾU", font=("Arial", 20, "bold")).pack(pady=10)
        
        columns = ("Ma", "Phim", "Phong", "Loai", "Gio")
        self.tree_lich = ttk.Treeview(self.tab_mua_ve, columns=columns, show="headings")
        for col in columns: self.tree_lich.heading(col, text=col)
        self.tree_lich.pack(fill="both", expand=True, padx=20)

        # Form đặt vé
        frame_dat = ctk.CTkFrame(self.tab_mua_ve)
        frame_dat.pack(fill="x", padx=20, pady=20)

        ctk.CTkLabel(frame_dat, text="Mã KH:").grid(row=0, column=0, padx=5)
        self.ent_kh = ctk.CTkEntry(frame_dat, width=80); self.ent_kh.grid(row=0, column=1)

        ctk.CTkLabel(frame_dat, text="Mã Ghế:").grid(row=0, column=2, padx=5)
        self.ent_ghe = ctk.CTkEntry(frame_dat, width=80); self.ent_ghe.grid(row=0, column=3)

        btn_dat = ctk.CTkButton(frame_dat, text="XÁC NHẬN ĐẶT VÉ", fg_color="green", command=self.action_dat_ve)
        btn_dat.grid(row=0, column=4, padx=20)
        
        self.load_lich_chieu()

    def setup_tab_quan_ly(self):
        ctk.CTkLabel(self.tab_quan_ly, text="LỊCH SỬ ĐẶT VÉ", font=("Arial", 20, "bold")).pack(pady=10)
        
        columns_ve = ("MaVe", "Khach", "Phim", "Ghe", "Gia")
        self.tree_ve = ttk.Treeview(self.tab_quan_ly, columns=columns_ve, show="headings")
        for col in columns_ve: self.tree_ve.heading(col, text=col)
        self.tree_ve.pack(fill="both", expand=True, padx=20)

        btn_frame = ctk.CTkFrame(self.tab_quan_ly)
        btn_frame.pack(pady=10)

        ctk.CTkButton(btn_frame, text="Làm mới", command=self.load_ve_da_dat).grid(row=0, column=0, padx=10)
        ctk.CTkButton(btn_frame, text="HỦY VÉ ĐANG CHỌN", fg_color="red", command=self.action_huy_ve).grid(row=0, column=1, padx=10)

    def load_lich_chieu(self):
        for i in self.tree_lich.get_children(): self.tree_lich.delete(i)
        for r in self.db.get_lich_chieu():
            self.tree_lich.insert("", "end", values=(r.MaSuat, r.TenPhim, r.TenPhong, r.LoaiPhong, r.GioBatDau))

    def load_ve_da_dat(self):
        for i in self.tree_ve.get_children(): self.tree_ve.delete(i)
        for r in self.db.get_ve_da_dat():
            self.tree_ve.insert("", "end", values=(r.MaVe, r.TenKhachHang, r.TenPhim, r.ViTriGhe, r.GiaVe))

    def action_dat_ve(self):
        sel = self.tree_lich.selection()
        if not sel: return messagebox.showwarning("Lỗi", "Chọn suất chiếu!")

        try:
            ma_kh = int(self.ent_kh.get())
            ma_ghe = int(self.ent_ghe.get())
        except ValueError:
            return messagebox.showerror("Lỗi nhập liệu", "Mã KH và Mã Ghế phải là số nguyên!")

        ma_suat = self.tree_lich.item(sel)['values'][0]
        gia_ve = self.db.get_gia_ghe(ma_ghe)
        success, msg = self.db.dat_ve(ma_kh, ma_suat, ma_ghe, gia_ve)
        if success:
            messagebox.showinfo("Đặt vé thành công", msg)
            self.load_ve_da_dat()
        else:
            messagebox.showerror("Đặt vé thất bại", msg)

    def action_huy_ve(self):
        sel = self.tree_ve.selection()
        if not sel: return
        ma_ve = self.tree_ve.item(sel)['values'][0]

        if messagebox.askyesno("Xác nhận", f"Bạn có chắc muốn hủy vé số {ma_ve}?"):
            success, msg = self.db.huy_ve(ma_ve)
            if success:
                messagebox.showinfo("Thành công", msg)
                self.load_ve_da_dat()
            else:
                messagebox.showerror("Thất bại", msg)

if __name__ == "__main__":
    app = CinemaApp()
    app.mainloop()