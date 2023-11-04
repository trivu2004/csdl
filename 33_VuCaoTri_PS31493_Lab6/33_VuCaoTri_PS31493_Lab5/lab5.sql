use quanlybanhang;

-- bai1 a. Hiển thị tất cả thông tin có trong bảng khách hàng bao gồm tất cả các cột
select *
from khachhang;
-- bai1 b. Hiển thị 10 khách hàng đầu tiên trong bảng khách hàng bao gồm các cột: mã khách hàng, họ và tên, email, số điện thoại
select maKhachHang, concat(hoVaTenLot,' ',Ten),Email,dienThoai
from khachhang;
-- bai1 c Hiển thị thông tin từ bảng Sản phẩm gồm các cột: mã sản phẩm, tên sản phẩm, tổng tiền tồn kho. Với tổng tiền tồn kho = đơn giá* số lượng
select maSanPham,tenSP, donGia*soLuong as 'ThanhTien'
from sanpham;
-- bai1 d. Hiển thị danh sách khách hàng có tên bắt đầu bởi kí tự ‘H’ gồm các cột: maKhachHang, hoVaTen, diaChi. Trong đó cột hoVaTen ghép từ 2 cột 
-- hoVaTenLot và Ten
select maKhachHang, concat(hoVaTenLot,' ',Ten) as 'HoVaTen',diaChi
from khachhang
where Ten like 'H_';
-- bai1 e. Hiển thị tất cả thông tin các cột của khách hàng có địa chỉ chứa chuỗi ‘Đà Nẵng’
select*
from khachhang
where diaChi like '%Đà Nẵng%';
-- bai1 f. Hiển thị các sản phẩm có số lượng nằm trong khoảng từ 100 đến 500.
select*
from sanpham
where soLuong >=100
and soLuong <=500;
-- bai1 g. Hiển thị danh sách các hoá hơn có trạng thái là chưa thanh toán và ngày mua hàng trong năm 2016
select *
from hoadon
where trangThai like '%chuathanhtoan%'
and ngayMuaHang like '%2016%';
-- bai1 h. Hiển thị các hoá đơn có mã Khách hàng thuộc 1 trong 3 mã sau: KH001, KH003, KH006
select *
from hoadon
where maKhachHang like'1'
or maKhachHang like '3'
or maKhachHang like '6';
-- bai2 a. Hiển thị số lượng khách hàng có trong bảng khách hàng
select count(*) as 'so lượng KH'
from khachhang;
-- bai2 b. Hiển thị đơn giá lớn nhất trong bảng SanPham
select max(donGia) as 'don giá lớn nhất'
from sanpham;
-- bai2 c. Hiển thị số lượng sản phẩm thấp nhất trong bảng sản phẩm
select min(soLuong) as 'sản phẩm thấp nhât'
from sanpham;
-- bai2 d. Hiển thị tổng tất cả số lượng sản phẩm có trong bảng sản phẩm
select sum(soLuong) as 'Tổng'
from sanpham;
-- bai2 e. Hiển thị số hoá đơn đã xuất trong tháng 12/2016 mà có trạng thái chưa thanh toán
select count(*) as 'số hoá đơn 12/2016 chưa thanh toán'
from hoadon 
where trangThai = 'chuathanhtoan';
-- bai2 f. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn.
select maHoaDon, count(maSanPham) as 'Mọi loại sản phẩm'
from hoadonchitiet
group by maHoaDon;
-- bai2 g. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn. Yêu cầu chỉ hiển thị hàng nào có số loại sản phẩm được mua >=5.
select maHoaDon as 'Mã Hóa Đơn', count(maSanPham) as 'Số Loại Sản Phẩm'
from hoadonchitiet
group by maHoaDon
having count(maSanPham) >= 5;

-- bai2 h. Hiển thị thông tin bảng HoaDon gồm các cột maHoaDon, ngayMuaHang, maKhachHang. Sắp xếp theo thứ tự giảm dần của ngayMuaHang
select maHoaDon, ngayMuaHang, maKhachHang
from hoadon
order by ngayMuaHang DESC;
-- tăng dần là asc	