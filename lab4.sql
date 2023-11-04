create database BĐS;
use BĐS;
drop database lab4;

create table Nhan_Vien(
	ID_NhanVien int not null,
    Ten_NV varchar(25) not null
);
create table Chu_So_Huu(
	Id_CSH int not null,
    DiaChi varchar(250) null,
    SĐT int not null,
    TenCSH varchar(25) null
);
create table Bat_Dong_San(
	ID_BĐS int not null,
    TenBĐS varchar(25) null,
    DiaChi varchar(50) null
);
create table Phong_Ban(
	Ma_PB int not null,
    DiaDiem varchar(30) not null
);
create table Than_Nhan(
	Ten varchar(25) not null,
    NgaySinh date null
);
alter table Nhan_Vien
add column Email varchar(50);
alter table Nhan_Vien
drop column Luong;
