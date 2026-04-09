Tóm tắt Dự án: Hệ thống Quản lý & Đặt vé Rạp chiếu phim
1. Tổng quan Công nghệ
Cơ sở dữ liệu: Microsoft SQL Server (T-SQL).

Ngôn ngữ lập trình: Python 3.x.

Giao diện người dùng: CustomTkinter (Modern GUI).

Kết nối CSDL: pyodbc.

Kiến trúc: Modular Programming (Chia tách file cấu hình, xử lý DB và giao diện).

2. Cấu trúc Cơ sở dữ liệu (SQL Server)
Các Thực thể chính
Phim: Lưu thông tin tên phim, thể loại, thời lượng.

PhongChieu: Quản lý danh sách các phòng (IMAX, 2D, 3D).

Ghe: Lưu tọa độ ghế (Hàng, Cột) liên kết với từng phòng.

SuatChieu: Liên kết Phim - Phòng - Thời gian chiếu.

Ve_ChiTiet: Lưu kết quả giao dịch đặt vé.

Các thành phần nâng cao
View (v_LichChieu): Định dạng lại thời gian hiển thị thành HH:mm để giao diện Python sạch sẽ hơn.

Stored Procedure (sp_DatVe): * Tự động kiểm tra trạng thái ghế (trống/đã đặt).

Sử dụng Transaction để đảm bảo hóa đơn và vé luôn đi kèm nhau.

Sử dụng RAISERROR để phản hồi lỗi trực tiếp lên App Python.

Trigger (trg_CheckTrungLichChieu): Ngăn chặn việc xếp hai phim vào cùng một phòng trong cùng một khung giờ.

3. Cấu trúc Ứng dụng Python
Dự án được tổ chức thành 3 file chính để dễ quản lý:

config.py: Chứa thông số kết nối (Server Name, Database Name).

database.py:

Lớp CinemaDB quản lý kết nối.

Các phương thức: get_lich_chieu(), get_ve_da_dat(), dat_ve(), huy_ve().

main.py:

Sử dụng CTkTabview để chia làm 2 màn hình: Đặt vé và Quản lý vé.

Sử dụng ttk.Treeview để hiển thị dữ liệu dạng bảng.

Xử lý logic tương tác: Chọn dòng trên bảng -> lấy dữ liệu -> gọi hàm xử lý.

4. Các Chức năng chính trên App
Xem lịch chiếu: Hiển thị danh sách phim đang chiếu theo thời gian thực từ SQL Server.

Đặt vé thực tế:

Chọn suất chiếu trực tiếp bằng cách click chuột vào bảng.

Nhập ID Khách hàng và mã định danh Ghế (MaGhe).

Hệ thống báo lỗi nếu ghế đã có người ngồi (xử lý từ SQL).

Quản lý & Hủy vé:

Xem danh sách tất cả các vé đã bán thành công.

Chọn vé bất kỳ và nhấn "Hủy vé" để xóa khỏi hệ thống.

5. Các lưu ý kỹ thuật (Fix bug)
Lỗi định dạng giờ: Đã được xử lý bằng hàm LEFT(CONVERT(VARCHAR, ..., 108), 5) trong SQL View để tránh hiện đuôi .0000000.

Lỗi ép kiểu (Int vs String): Khi nhập mã ghế, cần nhập đúng ID số của ghế trong CSDL để khớp với kiểu dữ liệu INT.

Ràng buộc nghiệp vụ: Không thực hiện đặt vé ở phía Python mà đẩy toàn bộ logic kiểm tra xuống Stored Procedure để đảm bảo an toàn dữ liệu tuyệt đối.

6. Hướng phát triển tương lai
Chuyển từ việc nhập ID ghế sang chọn ghế trên sơ đồ đồ họa (Seat Map).

Bổ sung tính năng đăng nhập dành riêng cho Quản lý (Admin) và Nhân viên.

Thống kê doanh thu bằng biểu đồ trực quan (Matplotlib).