use asm;
use ql_banhang;
-- Thống kê tổng tiền hàng xuất kho theo ngày, thông tin hiển thị: Ngày Xuất hàng, tổng thành tiền
select px.NgayXuat,sum(ctpx.SoLuong*hh.GiaBan)
from phieuxuat px , ctphieuxuat ctpx, hanghoa hh
where px.SoPhieu = ctpx.SoPhieu
and hh.MaHH = ctpx.MaHH
group by px.NgayXuat;

-- Cho biết số lượng hóa đơn chưa thanh toán của từng khách hàng. Thông tin gồm: Mã kh, tên kh, số lượng HD chưa TT
select kh.MaKH , kh.Ten , count(hd.TrangThai) as 'sl hoa don' from khachhang kh
inner join hoadon hd
on kh.MaKH = hd.MaKH
where hd.TrangThai like "Chưa thanh toán"
group by kh.MaKH;
-- Cho biết thông tin các nhân viên đã bán hàng cho khách hàng ‘KH001’. Thông tin hiển thị: MaNV, Họ tên NV, Số ĐT
select nv.MaNV , concat(nv.HoVaTenLot , " " , nv.Ten) as 'Ho va Ten' , nv.DienThoai from nhanvien nv
inner join hoadon hd 
on nv.MaNV = hd.MaNV
inner join khachhang kh
on hd.MaKH = kh.MaKH
where kh.MaKh = 'KH001'
group by nv.MaNV;

-- Danh sách các sản phẩm có trong nhiều hơn 2 hóa đơn.
select MaSP, count(*) as ' So luong hoa don'
from hoadonchitiet
group by MaSP
having count(*) > 2;