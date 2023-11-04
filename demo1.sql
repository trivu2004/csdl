use demo;
use qlda;
use ql_banhang;
-- singer column
create index ID_TenNV
on nhan_vien(Ten_NV);
create index Ho_NV
on nhan_vien(Ho_NV);
create index ID_diachi
on chu_so_huu(DiaChi);

drop index ID_TenNV
on nhan_vien;

create index Ten_DA
on duan(tenda);

create unique index dienthoai
on khachhang(DienThoai);

create unique index email
on khachhang(Email);

select MaSP,TenSP,GiaSP
from sanpham
where TenSP like 'Iphone %'
and GiaSP <5000000;

update hoadon
set TrangThai = 'Đã Thanh Toán'
where TrangThai = 'Chưa Thanh Toán';
update hoadon
set hoadon.NgayLapHD = curdate()
where hoadon.MaHD in ('HD002');

insert into  hoadon values('HD002','2021-03-04','500000','Chưa Thanh Toán','NV4','KH004');

select *
from sanpham sp , hoadonchitiet hdct
where sp.MaSP = hdct.MaSP
and hdct.SoLuongMua > 5;