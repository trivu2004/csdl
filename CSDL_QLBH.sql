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

