drop database ql_banhang;
create database ql_banhang;
use ql_banhang;
CREATE TABLE KHACHHANG (
    MaKH VARCHAR(10) NOT NULL,
    HoVaTenLot VARCHAR(50),
    Ten VARCHAR(50) NOT NULL,
    DiaChi VARCHAR(255),
    Email VARCHAR(50),
    DienThoai VARCHAR(20) NOT NULL,
    CONSTRAINT pk_makh PRIMARY KEY (MaKH)
)  ENGINE=INNODB;

CREATE TABLE NHANVIEN (
    MaNV VARCHAR(10) NOT NULL,
    HoVaTenLot VARCHAR(50),
    Ten VARCHAR(50) NOT NULL,
    DiaChi VARCHAR(255),
    Email VARCHAR(50),
    DienThoai VARCHAR(20) NOT NULL,
    CONSTRAINT pk_manv PRIMARY KEY (MaNV)
)  ENGINE=INNODB;
insert into nhanvien values('NV1','Vũ Cao','Trí','224 Hà Đặc','trivcps31493@gmail.com','0337461190');
insert into nhanvien values('NV2','Vũ Cao','Trí','224 Hà Đặc','trivcps31493@gmail.com','0337461190');
insert into nhanvien values('NV3','Vũ Cao','Trí','224 Hà Đặc','trivcps31493@gmail.com','0337461190');
insert into nhanvien values('NV4','Vũ Cao','Trí','224 Hà Đặc','trivcps31493@gmail.com','0337461190');
insert into nhanvien values('NV5','Vũ Cao','Trí','224 Hà Đặc','trivcps31493@gmail.com','0337461190');
CREATE TABLE SANPHAM (
    MaSP VARCHAR(10) NOT NULL,
    TenSP VARCHAR(50),
    GiaSP FLOAT NOT NULL,
    SoLuong INT NOT NULL,
    MoTa VARCHAR(255) NOT NULL,
    CONSTRAINT pk_masp PRIMARY KEY (MaSP)
)  ENGINE=INNODB;

CREATE TABLE HOADON (
    MaHD VARCHAR(10) NOT NULL,
    NgayLapHD DATE NOT NULL,
    TongTien FLOAT NOT NULL,
    TrangThai VARCHAR(20) NOT NULL,
    MaNV VARCHAR(10) NOT NULL,
    MaKH VARCHAR(10) NOT NULL,
    CONSTRAINT pk_mahd PRIMARY KEY (MaHD)
)  ENGINE=INNODB;

CREATE TABLE HOADONCHITIET (
    MaHD VARCHAR(10) NOT NULL,
    MaSP VARCHAR(10) NOT NULL,
    SoLuongMua INT NOT NULL,
    CONSTRAINT pk_mahd_masp PRIMARY KEY (MaHD , MaSP)
)  ENGINE=INNODB;

alter table hoadon
add constraint fk_hoadon_nhanvien foreign key (MaNV) references NHANVIEN(MaNV),
add constraint fk_hoadon_khachhang foreign key (MaKH) references KHACHHANG(MaKH);

alter table hoadonchitiet
add constraint fk_hdct_hoadon foreign key (MaHD) references HOADON(MaHD),
add constraint fk_hdct_sanpham foreign key (MaSP) references SANPHAM(MaSP);
insert into khachhang values('KH001','Nguyễn Thị','Nga','15 Quang Trung TP Đà Nẵng','ngant@gamil.com',0912345670),
							('KH002','Trần Công','Thành','234 Lê Lợi Quảng Nam','thanhtc@gmai.com', 16109423443),
                            ('KH003','Lê Hoàng','Nam','23 Trần Phú TP Huế','namlt@yahoo.com',0989354556),
                            ('KH004','Vũ Ngọc','Hiền','37 Nguyễn Thị Thập TP Đà Nẵng','hienvn@gmail.com', 0894545435);

insert into sanpham values(1,'Samsung Galaxy J7 Pro','6600000',800,'Samsung Galaxy J7 Pro là một chiếc smartphone phù hợp
								với những người yêu thích một sản phẩm pin tốt, thích hệ điều hành mới cùng những tính năng đi kèm độc quyền'),
(2,'iPhone 6 32GB','899000',500,' iPhone 6 là một trong những smartphone được yêu thích nhất. Lắng nghe nhu cầu về thiết kế, khả 
							năng lưu trữ và giá cả, iPhone 6 32GB được chính thức phân phối chính hãng tại Việt Nam hứa hẹn sẽ là một sản phẩm rất Hot '),
                            (3,'Laptop Dell Inspiron 3467','11290000',507,'Dell Inspiron 3467 i3 7100U/4GB/1TB/Win10/(M20NR21)'),
                            (4,'Pin sạc dự phòng','200000',600,'Pin sạc dự phòng Polymer 5.000 mAh eSaver JP85'),
                            (5,'Nokia 3100','700000',100,'Nokia 3100 phù hợp với SINH VIÊN');
                            
insert into hoadon values(120954,'2016-03-23',1,'Đã Thanh Toán','NV1','KH001'),
						(120955,'2016-04-02',2,'Đã Thanh Toán','NV2','KH002'),
                        (120956,'2016-07-12',3,'Chưa Thanh Toán','NV3','KH001'),
                        (120957,'2016-12-04',4,'Đã Thanh Toán','NV4','KH004');
                        
insert into hoadonchitiet values(120954,3,40),
								(120954,1,20),
                                (120955,2,100),
                                (120956,4,6),
                                (120956,2,60),
                                (120956,1,10),
                                (120957,2,50);
                                
create table khachhangdanang(
	MaKhachHang varchar(7) not null,
    HoVaTenLot varchar(50) not null,
    Ten varchar(15) not null,
    DiaChi varchar(250) not null,
    Email varchar(50) not null,
    SĐT int not null
);
select *
from khachhang
where DiaChi like 'Đà Nẵng %'; 


-- Bài 2
-- a
update KHACHHANG
set DienThoai = '16267788989'
where MaKH = 'KH002';
-- b
update sanpham
set SoLuong = SoLuong +200
where MaSP = '3';
-- c
set sql_safe_updates = 0;
update sanpham 
set GiaSP = GiaSP*0.95;
-- d
select MaSP, sum(SoLuongMua) as 'SoLuongHoaDon' 
from hoadonchitiet hdct
group by MaSP
order by sum(SoLuongMua) desc limit 1;

select MaSP, sum(SoLuongMua) as 'Số Lượng Bán'
from hoadonchitiet hdct
inner join hoadon hd
on hd.MaHD = hdct.MaHD
where year(NgayLapHD) = '2016' and month(NgayLapHD)= '12'
group by MaSP
order by sum(SoLuongMua) desc;

update sanpham
set SoLuong = SoLuong + 100
where MaSP in (select MaSP from hoadonchitiet hdct
inner join hoadon hd
on hd.MaHD = hdct.MaHD
where year(NgayLapHD) = '2016' and month(NgayLapHD) = '12'
group by MaSP
order by sum(SoLuongMua) desc);

-- e 
select MaSP, sum(SoLuongMua) as 'SoLuongBan' 
from hoadonchitiet hdct
inner join hoadon hd
on hd.MaHD = hdct.MaHD
where year(NgayLapHD) = '2016' 
group by MaSP
order by sum(SoLuongMua) asc limit 2;

update sanpham
set SoLuong = SoLuong - SoLuong * 0.1
where MaSP in (select MaSP from hoadonchitiet hdct
inner join hoadon hd
on hd.MaHD = hdct.MaHD
where year(NgayLapHD) = '2016'
group by MaSP
order by sum(SoLuongMua) desc);
-- f
update hoadon
set TrangThai = 'Đã Thanh Toán'
where MaHD = '120956';
-- g
delete from hoadonchitiet hdct
where MaSP = '2' 
and MaHD in (select MaHD
from hoadon
where MaHD = '120956'
and TrangThai = 'Chưa Thanh Toán');
-- h
delete from khachhang
where MaKH not in (
select MaKH from hoadon
where NgayLapHD >= '2016-01-01');