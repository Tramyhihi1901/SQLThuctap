create database Thuctap
go
use Thuctap
go
create table Khoa
(
makhoa char(10), 
tenkhoa char(30), 
dienthoai char(10),
primary key (makhoa))
go 

create table GiangVien
(magv int,
hotengv char(30),
luong decimal(5,2),
makhoa char(10),
primary key (magv),
foreign key (makhoa) references Khoa
)
go 

create table SinhVien
(
masv int, hotensv char(30),
makhoa char(10),
namsinh int,
quequan char(30),
primary key (masv),
foreign key (makhoa) references Khoa)
go 

create table DeTai
(
madt char(10),
tendt char(30),
kinhphi int,
NoiThucTap char(30)
primary key (madt))
go 

create table HuongDan
(
masv int,
madt char(10),
magv int,
ketqua decimal(5,2),
foreign key (masv) references SinhVien,
foreign key (madt) references Detai,
foreign key (magv) references GiangVien,
)
go 
INSERT INTO Khoa VALUES('Geo','Dia ly va QLTN',3855413)
INSERT INTO Khoa VALUES('Math','Toan',3855411)
INSERT INTO Khoa VALUES('Bio','Cong nghe Sinh hoc',3855412)
go 

insert into GiangVien values (11,'Thanh Xuan',700,'Geo')
insert into GiangVien values (12,'Thu Minh',500,'Math')
insert into GiangVien values (13,'Chu Tuan',650,'Geo')
insert into GiangVien values (14,'Le Thi Lan',500,'Bio')
insert into GiangVien values (15,'Tran Xoay',900,'Math')
go 

insert into SinhVien values (1,'Le Van Sao','Bio',1990,'Nghe An')
insert into SinhVien values (2,'Nguyen Thi My','Geo',1990,'Thanh Hoa')
insert into SinhVien values (3,'Bui Xuan Duc','Math',1992,'Ha Noi')
insert into SinhVien values (4,'Nguyen Van Tung','Bio',null,'Ha Tinh')
insert into SinhVien values (5,'Le Khanh Linh','Bio',1989,'Ha Nam')
insert into SinhVien values (6,'Tran Khac Trong','Geo',1991,'Thanh Hoa')
insert into SinhVien values (7,'Le Thi Van','Math',null,'null')
insert into SinhVien values (8,'Hoang Van Duc','Bi',1992,'Nghe An')
go  
insert into DeTai values ('Dt01','GIS',100,'Nghe An')
insert into DeTai values ('Dt02','ARC GIS',500,'Nam Dinh')
insert into DeTai values ('Dt03','Spatial DB',100, 'Ha Tinh')
insert into DeTai values ('Dt04','MAP',300,'Quang Binh')
go 

insert into HuongDan values (1,'Dt01',13,8)
insert into HuongDan values (2,'Dt03',14,0)
insert into HuongDan values (3,'Dt03',12,10)
insert into HuongDan values (5,'Dt04',14,7)
insert into HuongDan values (6,'Dt01',13,Null)
insert into HuongDan values (7,'Dt04',11,10)
insert into HuongDan values (8,'Dt03',15,6)
go 
---1 Sử dụng lệnh truy vấn SQL lấy ra mã số và tên các đề tài có nhiều hơn 2 sinh viên tham gia thực tập .
select DeTai.madt,DeTai.tendt
from DeTai join HuongDan on DeTai.madt=HuongDan.madt
group by DeTai.madt,DeTai.tendt
having count (HuongDan.madt) > 2;

--2 Sử dụng câu lệnh truy vấn SQL lấy ra mã số, tên đề tài của đề tài có kinh phí cao nhất .
select madt,tendt
from DeTai
where kinhphi= (select Max(kinhphi) from DeTai);

--3 Sử dụng câu lệnh SQL xuất ra Tên khoa, Số lượng sinh viên của mỗi khoa 
select Khoa.tenkhoa, COUNT(masv) Slsv
from Khoa join SinhVien on Khoa.makhoa =SinhVien.makhoa
group by Khoa.tenkhoa;