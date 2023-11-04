create database ASM;
use ASM;

create table LoaiHang(
	MaLH int primary key not null,
    TenLH varchar(50) null
);
create table HangHoa(
	MaLH int not null,
    MaHH int primary key not null,
    TenHH varchar(50) null,
    ĐVT varchar(45) null,
    GiaBan decimal(10,0) null check(GiaBan > 1000),
    foreign key (MaLH) references LoaiHang(MaLH)
);
create table CuaHang(
	MaCH int primary key not null,
    TenCH varchar(50) null,
    DiaChi varchar(250) null,
    SĐT int null,
    Email varchar(50) null
);
create table PhieuXuat(
	SoPhieu varchar(10) primary key not null,
    MaCH int not null,
    NgayLap date not null,
    NgayXuat date not null,
    foreign key (MaCH) references CuaHang(MaCH)
);
create table CTPhieuXuat(
	MaLH int not null,
    SoPhieu varchar(10) not null,
    MaHH int not null,
    SoLuong int not null,
    GhiChu varchar(30),
    foreign key (MaHH) references HangHoa(MaHH),
    foreign key (SoPhieu) references PhieuXuat(SoPhieu)
);
insert into LoaiHang values (1,'Thời Trang Nam'),
							(2,'Thời Trang Nữ'),
                            (3,'Thời Trang Trẻ Em'),
                            (4,'Đồng Phục Học Sinh'),
                            (5,'Đông Phục Sinh Vien'),
                            (6,'Thời Trang Tổng Hợp');
					
insert into HangHoa values (1,15,'A','Cái','1500'),
							(2,16,'B','Cái','2000'),
                            (3,17,'C','Cái','2500'),
                            (4,18,'D','Cái','1600'),
                            (5,19,'E','Cái','1180');
						
insert into CuaHang values (1,'An','125/d TP Đà Nẵng','0268115786','nguyenvanA@gmail.com'),
                           (2,'Tien','158/d TP Mỹ Tho','0231545684','nguyenvanB@gmail.com'),
                           (3,'Teo','224/hd TP Hồ Chí Minh','0123568518','nguyenvanB@gmail.com'),
                           (4,'Khoa','126/a TP Thủ Đức','0956301571','nguyenvanD@gmail.com'),
                           (5,'Dung','156/e TP Hồ Chí Minh','0263146971','nguyenvanE@gmail.com');
                           
insert into PhieuXuat values('SP001',1,'2016-01-01','2016-03-04'),
							('SP002',2,'2017-01-01','2017-01-04'),
                            ('SP003',3,'2018-01-01','2018-02-04'),
                            ('SP004',4,'2019-01-01','2019-02-04'),
                            ('SP005',5,'2020-01-01','2016-05-04');
                            
insert into CTPhieuXuat values(1,'SP001',15,'30','Tot'),
								(2,'SP002',16,'20','Nhieu'),
                                (3,'SP003',17,'40','Du'),
                                (4,'SP004',18,'15','Tot'),
                                (5,'SP005',19,'60','Tot');
                                
-- 6.1                                
-- Hiển thị tất cả mặt hàng. Danh sách sắp xếp theo đơn giá tăng dần
select *
from HangHoa
order by GiaBan asc;
-- 6.2
-- Hiển thị tất cả các mặt hàng thuộc loại hàng “Thời trang”. Thông tin gồm: mã mặt hàng, tên mặt hàng, đơn vị tính, đơn giá, tên loại hàng
select hh.MaHH,hh.TenHH,hh.ĐVT,hh.GiaBan,lh.MaLH
from HangHoa hh,LoaiHang lh
where hh.MaLH = lh.MaLH
and lh.TenLH like 'Thời Trang%';
-- 6.3
-- Thống kê số mặt hàng theo loại hàng, thông tin gồm: mã loại hàng, tên loại hàng, tổngsố mặt hàng. Danh sách sắp xếp theo tổng số mặt hàng giảm dần.
select lh.MaLH,lh.TenLH, sum(hh.MaHH) as 'Tổng số HH'
from hanghoa hh inner join loaihang lh
on lh.MaLH = hh.MaLH 
group by lh.MaLH
order by sum(hh.MaHH) desc;
-- 6.4
-- Liệt kê số phiếu xuất, ngày xuất hàng, mã cửa hàng, tên mặt hàng, số lượng, đơn giá, thành tiền.
select px.SoPhieu , px.NgayXuat ,px.MaCH , hh.TenHH , ctpx.SoLuong , hh.GiaBan, ctpx.SoLuong * hh.GiaBan 'thanhtien' 
from hanghoa hh 
inner join ctphieuxuat ctpx
on hh.MaLH = ctpx.MaLH
inner join phieuxuat px 
on ctpx.SoPhieu = px.SoPhieu;
-- 6.5
-- Thống kế tổng số lần xuất hàng theo từng tháng trong năm 2021, thông tin gồm: tháng/năm, số lần xuất hàng.
select phieuxuat.NgayXuat as 'NgàyXuất', month(NgayXuat) as 'Thang', year(NgayXuat) as 'Nam', count(NgayXuat) as 'Tong'
from phieuxuat 
where month(NgayXuat) and year(NgayXuat) = 2019
group by NgayXuat;

-- 6.6
-- Liệt kê 5 mặt hàng có số lượng xuất kho nhiều nhất.
select hh.MaHH,hh.TenHH,sum(ctpx.SoLuong) as 'SLX'
from CTPhieuXuat ctpx, PhieuXuat px, HangHoa hh
where ctpx.SoPhieu = px.SoPhieu
and hh.MaHH = ctpx.MaHH
and NgayXuat between '2016-01-01' and '2019-02-04'
group by hh.MaHH
order by sum(ctpx.SoLuong) desc
limit 5;
-- 6.7
-- Thống kê số hàng nhập về cửa hàng “Chi nhánh quận 5”, thông tin hiển thị: Tên cửa hàng, số lần nhập hàng.
select ch.MaCH,ch.TenCH,count(px.MaCH) as 'SoLanNhapHang'
from cuahang ch inner join phieuxuat px 
on ch.MaCH = px.MaCH
where ch.TenCH like '%Chi Nhánh Quận 5%'
group by ch.MaCH;
	
-- 6.8
-- Thống kê tổng tiền hàng xuất kho theo ngày, thông tin hiển thị: Ngày xuất hàng, tổng thành tiền.
select hh.MaHh,hh.TenHH,px.NgayXuat, day(px.NgayXuat) as 'NgayXH', (hh.GiaBan*ctpx.SoLuong) as 'TongThanhTien'
from hanghoa hh inner join CTPhieuXuat ctpx inner join phieuxuat px
on hh.MaHH = ctpx.MaHH
and px.SoPhieu = ctpx.SoPhieu;

-- 6.9
-- Cập nhật ngày xuất hàng là ngày hiện hành cho các phiếu xuất chưa có ngày xuất 
set SQL_Safe_updates = 0;
update PhieuXuat
set PhieuXuat.NgayXuat = curdate()
where PhieuXuat.SoPhieu in ('SP001');

-- 6.10
-- Cập nhật đơn giá của “Đồng phục học sinh” giảm 10% trên đơn giá hiện tại.
set SQL_Safe_updates = 0;
update hanghoa
set hanghoa.GiaBan = hanghoa.GiaBan*0.9
where hanghoa.MaLH like 'Đồng Phục Học Sinh';
-- 6.11
-- Thực hiện xóa các cửa hàng chưa có thông tin xuất hàng
delete from phieuxuat
where NgayXuat is null;

-- 6.12
-- Liệt kê danh sách các mặt hàng có số lượng xuất hàng thấp nhất: Mã hàng, tên hàng, tổng số lượng xuất.
select hh.MaHH,hh.TenHH,sum(ctpx.SoLuong) as 'TongSoLuongXuat'
from hanghoa hh inner join CTPhieuXuat ctpx
on hh.MaHH = ctpx.MaHH
group by MaHH
order by sum(ctpx.SoLuong) asc limit 1;

-- 6.13
-- Liệt kê những mặt hàng chưa từng xuất cho các cửa hàng, thông tin gồm: Mã mặt hàng, tên mặt hàng, tên loại hàng.
select hh.MaHH,hh.TenHH,lh.TenLH
from hanghoa hh, loaihang lh
where hh.MaLH = lh.MaLH
and hh.MaHH not in (select MaHH from CTPhieuXuat);
