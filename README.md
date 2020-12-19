# WeSplit
```python
"A Desktop App that we can use to share money after trips together"
```

## Các thành viên trong nhóm:

```bash
Đoàn Minh Tân       -  18120234  -  18120234@student.hcmus.edu.vn
Huỳnh Hồ Thanh Trà  -  18120245  -  18120245@student.hcmus.edu.vn
Hà Minh Cường       -  18120297  -  18120297@student.hcmus.edu.vn
```

## Các chức năng đã làm được trong đồ án WeSplit:
```python
1. SplashScreen:
		- Hiển thị thông tin chào mừng mỗi khi ứng dụng khởi chạy.
		- Mỗi lần hiện ngẫu nhiên một thông tin thú vị về một điểm du lịch.
		- Cho phép chọn check "Không hiện hộp thoại này mỗi khi khởi động".
		- Từ nay về sau đi thẳng vào màn hình HomeScreen luôn.

2. HomeScreen:
		- Liệt kê danh sách các chuyến đi, phân ra theo 2 loại đã từng đi trước đó và đang đi.
		- Xem chi tiết các chuyến đi: Danh sách thành viên, Danh sách các địa điểm, tổng kết
		  thu chi của cả nhóm (vẽ biểu đồ hình bánh và biểu đồ cột)

3. SearchScreen:
		- Tìm kiếm món ăn bằng Cơ sở dữ liệu (SQL Server Express 2019), hỗ trợ tất cả các cảnh giới.
		- Tìm kiếm chuyến đi theo tên của chuyến đi và các thành viên trong chuyến đi đó.

4. CreateJorneyScreen:
		- Cho phép trường nhóm tạo một chuyến đi mới với các thông tin.
			+ Tên chuyến đi
			+ Thêm lịch trình chuyến đi, các điểm dừng chân.
			+ Thêm các thành viên
			+ Thêm các khoản chi
		

5. UpdateJorneyScreen:
		- Cập nhật thông tin của chuyến đi: các thành viên, các hình ảnh, các mốc lộ trình
		  các khoản thu chi. Có người ứng trước thì báo cáo ai phải trả cho ai bao nhiêu tiền.

```
## Các chức năng làm thêm:
	
	- Bật tắt SplashScreen ngay trong giao diện chính của chương trình.

##   Các con đường bất hạnh đã giải quyết:
	
	Màn hình CreateJorneyScreen có giải quyết các trường hợp người dùng nhập sai kiểu dữ liệu hoặc nhập thiếu dữ liệu.

##    Yêu cầu của phần mềm:

	- Có cài đặt SQL Server Express, có hỗ trợ Full-text Index.
	
##   Điểm đề nghị cho đồ án: 10/10.

##  Link Youtube demo: 

## Ghi chú thêm:

	- Có thể cho các khóa sau xem video demo nhưng không cho xem source code.