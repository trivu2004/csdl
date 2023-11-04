 create database QLDA;
 use QLDA;
 -- drop database QLDA;
 create table Phong_ban(
	mapb varchar(7) not null primary key ,
    tenpb varchar(50) null,
    matp int unique
);
 update Phong_ban 
 set matp = 2
 where mapb = 'PB001' ;
 create table Nhan_vien(
	manv int not null primary key auto_increment,
    honv varchar(255) null,
    tennv varchar(50) null,
    ngaysinh date null,
    gioitinh tinyint(1) null default 0,
    diachi varchar(255) null,
    luong decimal(10,0) null check(luong>=300),
    mapb varchar(7),
    foreign key (mapb) references Phong_ban(mapb)
);
create table duan(
	mada varchar(7) not null primary key,
    tenda varchar(50) null,
    ngaybatdau date,
    ngayketthuc date,
    mapb varchar(7),
    foreign key (mapb) references Phong_ban(mapb)
 );
 create table phan_cong(
	mada varchar(7) not null,
    manv int not null,
    ngaythamgia date,
    ngayketthuc date,
    vaitro varchar(50),
    foreign key (mada) references duan(mada),
    foreign key (manv) references Nhan_vien(manv),
    primary key(mada,manv)
);
-- tạo quan 1 - 1 giữa phòng ban và nhan vien
alter table Phong_ban add foreign key (matp) references Nhan_vien(manv);
-- dữ liệu phòng ban
insert into Phong_ban values('PB001','San Xuat 1','1');
insert into Phong_ban values('PB002','San Xuat 2','2');
insert into Phong_ban values('PB003','Quan ly chat luong','3');
insert into Phong_ban values('PB004','Thiet ke ','4');
insert into Phong_ban values('PB005','Nghien cuu cong nghe','5');
insert into Phong_ban values('PB006','Kinh doanh','6');
insert into Phong_ban values('PB007','Truyen thong','7');

-- dữ liệu dự án
insert into duan values('DA001','Library','2017-01-01','2017-03-08','PB001');
insert into duan values('DA002','Employee System','2017-03-03','2017-05-14','PB003');
insert into duan values('DA003','Travel Website','2017-07-19','2017-08-26','PB002');
insert into duan values('DA004','Lê Fation Website','2017-02-08','2018-01-06','PB001');

--  dữ liệu nhân viên
insert into Nhan_vien values('1','Nguyen','An','1997-01-01','1','15 Quang Trung Da Nang','1000','PB001');
insert into Nhan_vien values('2','Le','Bao','1992-02-03','0','16 Le Loi','500','PB002');
insert into Nhan_vien values('3','Tran','Cuong','1988-06-05','1','24 Tran Van Cao','1200','PB001');
insert into Nhan_vien values('4','Hoang','Lan','1982-03-04','0','137 Nguyen Thi Thap Da Nang','900','PB004');
insert into Nhan_vien values('5','Van','Toan','1984-04-02','1','34 Yen Bai','1500','PB003');
insert into Nhan_vien values('6','Nguyen','Thi','1988-03-12','0','67 Yen Bai','700','PB003');
insert into Nhan_vien values('7','Le','Loi','1987-04-23','1','90 Ngo Van So','900','PB004');
insert into Nhan_vien values('8','Hoang','Nga','1992-05-05','0','70 Nguyen Du','1000','PB005');
insert into Nhan_vien values('9','Tran','Thuy','1988-06-05','1','123 Nguyen Van Troi','1200','PB001');
insert into Nhan_vien values('10','Hoang','Chinh','1990-06-05','0','23 Hoang Dieu','1200','PB004');
insert into Nhan_vien values('11','Le','Hoang','1987-05-04','0','13 Hoang Van Thu','1000','PB001');
insert into Nhan_vien values('12','Hoang','Quan','1990-06-07','1','46 Ngo Thua Nham','700','PB003');



    
 