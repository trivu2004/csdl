use ql_banhang;
use ql_banhang;
-- Bài 1
-- Câu a 
select  hoadon.MaHD,MaKH,TrangThai,MaSP,SoLuongMua,NgayLapHD
from hoadon,hoadonchitiet
where hoadon.MaHD = hoadonchitiet.MaHD;

-- C2
select  hoadon.MaHD,MaKH,TrangThai,MaSP,SoLuongMua,NgayLapHD
from hoadon inner join hoadonchitiet
on hoadon.MaHD = hoadonchitiet.MaHD;

-- Câu b
select  hoadon.MaHD,MaKH,TrangThai,MaSP,SoLuongMua,NgayLapHD
from hoadon,hoadonchitiet
where hoadon.MaHD = hoadonchitiet.MaHD
and hoadon.MaKH = 'KH001';

-- Câu c 
select  hoadon.MaHD,NgayLapHD,TenSP,GiaSP,hoadonchitiet.SoLuongMua,GiaSP*hoadonchitiet.SoLuongMua as 'Thành Tiền'
from hoadon,hoadonchitiet,sanpham
where hoadon.MaHD = hoadonchitiet.MaHD
and sanpham.MaSP = hoadonchitiet.MaSP;

-- C2
select  hoadon.MaHD,NgayLapHD,TenSP,GiaSP,hoadonchitiet.SoLuongMua,GiaSP*hoadonchitiet.SoLuongMua as 'Thành Tiền'
from hoadon inner join hoadonchitiet
on hoadon.MaHD = hoadonchitiet.MaHD
inner join sanpham
on sanpham.MaSP = hoadonchitiet.MaSP;
-- Câu d
select concat('HoVaTenLot',' ','Ten') as 'Ho Va Ten',Email,DienThoai,hd.MaHD,ct.MaSP, (GiaSP*ct.SoLuongMua) as 'Thành Tiền'
from khachhang kh inner join hoadon hd
on kh.MaKH = hd.MaKH
inner join hoadonchitiet ct
on hd.MaHD = ct.MaHD
inner join sanpham sp
on ct.MaSP = sp.MaSP
where hd.TrangThai like 'Chưa Thanh Toán';

-- Câu e 
select hd.MaHD,hd.NgayLapHD, sum(sp.GiaSP * hdct.SoLuongMua) as 'TTiền'
from hoadon hd inner join hoadonchitiet hdct
on hd.MaHD = hdct.MaHD
inner join sanpham sp
on sp.MaSP = hdct.MaSP
group by hd.MaHD
having sum(sp.GiaSP * hdct.SoLuongMua) >= 500;

-- Bài 2
-- Câu a
select * from khachhang
where MaKH not in (	select MaKH
					from hoadon where NgayLapHD>='2016-01-01');

-- Câu b
select sanpham.* from sanpham join hoadonchitiet 
		on sanpham.MaSP = hoadonchitiet.MaSP
group by sanpham.MaSP
having sum(SoLuongMua) = (select max(tongslmua)
			from (	select MaSP, sum(SoLuongMua) as tongslmua
					from hoadonchitiet
					group by MaSP) tam);

-- Câu c 
select KH.MaKH,
	   KH.HoVaTenLot,
       KH.Ten,
       Sum(CT.SoluongMua * SP.GiaSP) as 'tong'
from HoaDon HD join HoaDonChiTiet CT on HD.MaHD = CT.MaHD
	 join sanpham SP on SP.MaSP= CT.MaSP
     join khachhang KH on KH.MaKH = HD.MaKH
where year(HD.NgayLapHD) = 2016
group by MaKH
order by sum(CT.SoLuongMua * SP.GiaSP) desc limit 5;

-- Câu d
select KH.MaKH,
	   KH.HoVaTenLot,
       KH.Ten
from hoadon HD join hoadonchitiet CT ON HD.MaHD = CT.MaHD
	 join sanpham SP on SP.MaSP = CT.MaSP
     join khachhang KH on KH.MaKH = HD.MaKH
where KH.DiaChi like '%Đà Nẵng%'
	  and sp.TenSP = 'Iphone 7 32GB'
      and month(HD.NgayLapHD)= 12
      and year(HD.NgayLapHD)= 2016;

-- Câu e 
SELECT 
    sp.MaSP, sp.TenSP, COUNT(*) AS 'luotmua'
FROM
    sanpham sp
        INNER JOIN
    hoadonchitiet hdct ON sp.MaSP = hdct.MaSP
GROUP BY sp.MaSP
HAVING luotmua < (SELECT 
        AVG(SoLuong)
    FROM
        (SELECT 
            sp.MaSP, COUNT(*) AS 'Soluong'
        FROM
            hoadonchitiet
        GROUP BY MaSP) AS temp);
