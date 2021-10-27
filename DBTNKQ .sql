create database [TNKQ]
go
Use [TNKQ]
go

---------------------------------------------------------------------------------------------------
/*Functions*/
--Function Bài thi
create function AUTO_IDBThi()
returns varchar(10)
as 
begin
	Declare @ID Varchar(10)
	if(select count(ID_BAITHI) from BAITHI)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(REPLACE(ID_BAITHI,' ',''),3)) from BAITHI
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then REPLACE('BT00' + CONVERT(char,@ID+1),' ','')
				When @ID >=9 then REPLACE('BT0'+CONVERT(Char,@ID+1),' ','')
				When @ID >=99 then REPLACE('BT'+CONVERT(Char,@ID+1),' ','')
		end
	return @ID
end
go

--Function Khoa
create function AUTO_IDKHOA()
returns char(5)
as 
begin
	Declare @ID Varchar(5)
	if(select count(ID_KHOA) from KHOA)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(REPLACE(ID_KHOA,' ',''),3)) from KHOA
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then REPLACE('KH00' + CONVERT(char,@ID+1),' ','')
				When @ID >=9 then REPLACE('KH0'+CONVERT(Char,@ID+1),' ','')
				When @ID >=99 then REPLACE('KH'+CONVERT(Char,@ID+1),' ','')
		end
	return @ID
end
go

--Function GV
create function AUTO_IDGVIEN()
returns char(10)
as 
begin
	Declare @ID Varchar(10)
	if(select count(ID_GVIEN) from GIANGVIEN)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(ID_GVIEN,2)) from GIANGVIEN
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then REPLACE(CONVERT(char,YEAR(GETDATE()),112) + CONVERT(char,MONTH(GETDATE()),112) +'000'+CONVERT(char,CONVERT(INT,@ID)+1),' ','')
				When @ID >=9 then REPLACE(CONVERT(char,YEAR(GETDATE()),112) + CONVERT(char,MONTH(GETDATE()),112) +'00'+CONVERT(char,CONVERT(INT,@ID)+1),' ','')
				When @ID >=99 then REPLACE(CONVERT(char,YEAR(GETDATE()),112) + CONVERT(char,MONTH(GETDATE()),112) +'0'+CONVERT(char,CONVERT(INT,@ID)+1),' ','')
				When @ID >=999 then REPLACE(CONVERT(char,YEAR(GETDATE()),112) + CONVERT(char,MONTH(GETDATE()),112) +''+CONVERT(char,CONVERT(INT,@ID)+1),' ','')
		end
	return @ID
end
go

--Function SV
create function AUTO_IDSVien()
returns char(11)
as 
begin
	Declare @ID char(11)
	if(select count(ID_SVIEN) from SINHVIEN)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(ID_SVIEN,4)) from SINHVIEN
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then REPLACE(CONVERT(char,YEAR(GETDATE()),112) +'0'+ CONVERT(char,MONTH(GETDATE()),112) +'000'+CONVERT(char,CONVERT(INT,@ID)+1),' ','')
				When @ID >=9 then REPLACE(CONVERT(char,YEAR(GETDATE()),112) +'0'+ CONVERT(char,MONTH(GETDATE()),112) +'00'+CONVERT(char,CONVERT(INT,@ID)+1),' ','')
				When @ID >=99 then REPLACE(CONVERT(char,YEAR(GETDATE()),112) +'0'+ CONVERT(char,MONTH(GETDATE()),112) +'0'+CONVERT(char,CONVERT(INT,@ID)+1),' ','')
				When @ID >=999 then REPLACE(CONVERT(char,YEAR(GETDATE()),112) +'0'+ CONVERT(char,MONTH(GETDATE()),112) +''+CONVERT(char,CONVERT(INT,@ID)+1),' ','')
		end
	return @ID
end
go

--Function CTDETHI
create function AUTO_IDCTDThi()
returns varchar(10)
as 
begin
	Declare @ID Varchar(10)
	if(select count(ID_CTDTHI) from CTDTHI)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(ID_CTDTHI,3)) from CTDTHI
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then 'CT00' + CONVERT(char,CONVERT(INT,@ID)+1)
				When @ID >=9 then 'CT0'+ CONVERT(Char,Convert(INT,@ID)+1)
				When @ID >=99 then 'CT'+ CONVERT(Char,Convert(INT,@ID)+1)
		end
	return @ID
end
go

--FUNCTION Chi tiết lớp học phần
create function AUTO_IDCTLOPHP()
returns varchar(10)
as 
begin
	Declare @ID Varchar(10)
	if(select count(ID_CTLHPHAN) from CTLHPHAN)=0
		Set @ID='0'
	else
		Select @ID = MAX(REPLACE(RIGHT(ID_CTLHPHAN,3),' ','')) from CTLHPHAN
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then 'CTLOP00' + REPLACE(CONVERT(char,CONVERT(INT,@ID)+1),' ','')
				When @ID >=9 then 'CTLOP0'+ REPLACE(CONVERT(Char,Convert(INT,@ID)+1),' ','')
				When @ID >=99 then 'CTLOP'+ REPLACE(CONVERT(Char,Convert(INT,@ID)+1),' ','')
		end
	return @ID
end
go

--Function Câu hỏi
create function AUTO_IDCAUHOI()
returns varchar(10)
as 
begin
	Declare @ID Varchar(10)
	if(select count(ID_CAUHOI) from CAUHOI)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(ID_CAUHOI,3)) from CAUHOI
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then 'CH00' + CONVERT(char,CONVERT(INT,@ID)+1)
				When @ID >=9 then 'CH0'+ CONVERT(Char,Convert(INT,@ID)+1)
				When @ID >=99 then 'CH'+ CONVERT(Char,Convert(INT,@ID)+1)
		end
	return @ID
end
go

--Function DIEMTHI
create function AUTO_IDDIEMTHI()
returns varchar(10)
as 
begin
	Declare @ID Varchar(10)
	if(select count(ID_DIEMTHI) from DIEMTHI)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(REPLACE(ID_DIEMTHI,' ',''),3)) from DIEMTHI
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then REPLACE('DT00' + CONVERT(char,@ID+1),' ','')
				When @ID >=9 then REPLACE('DT0'+CONVERT(Char,@ID+1),' ','')
				When @ID >=99 then REPLACE('DT'+CONVERT(Char,@ID+1),' ','')
		end
	return @ID
end
go

--Function DETHI
create function AUTO_IDDETHI()
returns varchar(10)
as 
begin
	Declare @ID Varchar(10)
	if(select count(ID_DETHI) from DETHI)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(ID_DETHI,3)) from DETHI
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then 'DT00' + CONVERT(char,CONVERT(INT,@ID)+1)
				When @ID >=9 then 'DT0'+ CONVERT(Char,Convert(INT,@ID)+1)
				When @ID >=99 then 'DT'+ CONVERT(Char,Convert(INT,@ID)+1)
		end
	return @ID
end
go

--Function LOPHOCPHAN
create function AUTO_IDLOPHP()
returns varchar(10)
as 
begin
	Declare @ID Varchar(10)
	if(select count(ID_LOPHP) from LOPHOCPHAN)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(ID_LOPHP,2)) from LOPHOCPHAN
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then REPLACE(CONVERT(char,YEAR(GETDATE()),112) + CONVERT(char,MONTH(GETDATE()),112) +'000'+CONVERT(char,CONVERT(INT,@ID)+1),' ','')
				When @ID >=9 then REPLACE(CONVERT(char,YEAR(GETDATE()),112) +'00'+CONVERT(char,CONVERT(INT,@ID)+1),' ','')
				When @ID >=99 then REPLACE(CONVERT(char,YEAR(GETDATE()),112) +'0'+CONVERT(char,CONVERT(INT,@ID)+1),' ','')
				When @ID >=999 then REPLACE(CONVERT(char,YEAR(GETDATE()),112) +CONVERT(char,CONVERT(INT,@ID)+1),' ','')
		end
	return @ID
end
go

--Function LICHTHI
create function AUTO_IDLICHTHI()
returns varchar(10)
as 
begin
	Declare @ID Varchar(10)
	if(select count(ID_LICHTHI) from LICHTHI)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(ID_LICHTHI,2)) from LICHTHI
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then REPLACE(CONVERT(char,GETDATE(),112)+'0'+CONVERT(char,CONVERT(INT,@ID)+1),' ','')
				When @ID >=9 then REPLACE(CONVERT(char,GETDATE(),112)+CONVERT(Char,Convert(INT,@ID)+1),' ','')
		end
	return @ID
end
go

--Function HOCKY
create function AUTO_IDHOCKY()
returns varchar(10)
as 
begin
	Declare @ID Varchar(10)
	if(select MAX(LEFT(ID_HOCKY,4)) from HOCKY)=YEAR(GETDATE())
		Select @ID = REPLACE(CONVERT(char,YEAR(GETDATE()))+'000HK2',' ','')
	else
		Select @ID = REPLACE(CONVERT(char,YEAR(GETDATE()))+'000HK1',' ','')
	return @ID
end
go

--Function Ngân Hàng Câu Hỏi
create function AUTO_IDNHCHOI()
returns varchar(10)
as 
begin
	Declare @ID Varchar(10)
	if(select count(ID_NHCH) from NHCH)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(ID_NHCH,3)) from NHCH
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then 'NHCH00' + CONVERT(char,CONVERT(INT,@ID)+1)
				When @ID >=9 then 'NHCH0'+ CONVERT(Char,Convert(INT,@ID)+1)
				When @ID >=99 then 'NHCH'+ CONVERT(Char,Convert(INT,@ID)+1)
		end
	return @ID
end
go

--Funcion Chức vụ
create function AUTO_IDCVU()
returns char(10)
as 
begin
	Declare @ID Varchar(10)
	if(select count(ID_CVU) from CHUCVU)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(REPLACE(ID_CVU,' ',''),3)) from CHUCVU
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then REPLACE('CVU00' + CONVERT(char,@ID+1),' ','')
				When @ID >=9 then REPLACE('CVU0'+CONVERT(Char,@ID+1),' ','')
				When @ID >=99 then REPLACE('CVU'+CONVERT(Char,@ID+1),' ','')
		end
	return @ID
end
go

--Function Môn học
create function AUTO_IDMONHOC()
returns char(10)
as 
begin
	Declare @ID Varchar(10)
	if(select count(ID_MONHOC) from MONHOC)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(REPLACE(ID_MONHOC,' ',''),3)) from MONHOC
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then REPLACE('MH00' + CONVERT(char,@ID+1),' ','')
				When @ID >=9 then REPLACE('MH0'+CONVERT(Char,@ID+1),' ','')
				When @ID >=99 then REPLACE('MH'+CONVERT(Char,@ID+1),' ','')
		end
	return @ID
end
go

--Function Màn Hình
create function AUTO_IDMANHINH()
returns char(10)
as 
begin
	Declare @ID Varchar(10)
	if(select count(ID_MANHINH) from MANHINH)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(REPLACE(ID_MANHINH,' ',''),3)) from MANHINH
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then REPLACE('MHN00' + CONVERT(char,@ID+1),' ','')
				When @ID >=9 then REPLACE('MHN0'+CONVERT(Char,@ID+1),' ','')
		end
	return @ID
end
go

--function mức độ
create function AUTO_IDMUCDO()
returns varchar(10)
as 
begin
	Declare @ID Varchar(10)
	if(select count(ID_MUCDO) from MUCDO)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(REPLACE(ID_MUCDO,' ',''),3)) from MUCDO
		Select @ID = CASE
				When @ID >= 0 and @ID < 4 then 'MCD00' + CONVERT(char,CONVERT(INT,@ID)+1)
		end
	return @ID
end
go

--Function Năm Học
create function AUTO_IDNAMHOC()
returns varchar(10)
as 
begin
	Declare @ID Varchar(10)
	if(select Count(ID_NAMHOC) from NAMHOC) = 0
		Select @ID = 'NH' + CONVERT(char,YEAR(GETDATE()))
	else
		select @ID = MAX(left(ID_NAMHOC,4)) from NAMHOC
		Select @ID = 'NH'+CONVERT(char,YEAR(GETDATE()))
	return @ID
end
go

--FUntion Phòng thi
create function AUTO_IDPHONG()
returns char(10)
as 
begin
	Declare @ID Varchar(10)
	if(select count(ID_PHONGTHI) from PHONGTHI)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(REPLACE(ID_PHONGTHI,' ',''),3)) from PHONGTHI
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then REPLACE('P00' + CONVERT(char,@ID+1),' ','')
				When @ID >=9 then REPLACE('P0'+CONVERT(Char,@ID+1),' ','')
		end
	return @ID
end
go


---------------------------------------------------------------------------------------------------
/*Tables*/
--Table BaiThi
create table BAITHI
(	
	ID_BAITHI char(10) not null primary key(ID_BAITHI) constraint PK_BAITHI default dbo.AUTO_IDBThi() ,
	ID_DETHI char(10)not null,
	CAUTL nvarchar(500) not null,
	TINHTRANG int,
	TGBDau datetime,
	TGKT datetime,
);
--Table Chi tiet de thi
Create table CTDTHI
(
	ID_CTDTHI char(10) not null primary key(ID_CTDTHI) constraint PK_CTDTHI default dbo.AUTO_IDCTDThi(),
	ID_DTHI char(10) not null,
	CAUHOI nvarchar(500),
	A nvarchar(200),
	B nvarchar(200),
	C nvarchar (200),
	D nvarchar (200),
	DapAn nvarchar(200),
);
--table CTLHPhan
create table CTLHPHAN(
	ID_CTLHPHAN char(10) not null primary key(ID_CTLHPHAN) constraint PK_CTLHPHAN default dbo.AUTO_IDCTLOPHP(),
	ID_SVIEN char(11) not null,
	ID_LOPHP char(10) not null,
);
--Table Câu hỏi
create table CAUHOI(
	ID_CAUHOI char(10) not null primary key(ID_CAUHOI) constraint PK_CAUHOI default dbo.AUTO_IDCAUHOI(),
	NOIDUNGCH nvarchar(500),
	DAPAN nvarchar(200),
	A nvarchar(200),
	B nvarchar(200),
	C nvarchar(200),
	D nvarchar(200),
	CHUONG int,
	TTrang nvarchar(50),
	ID_MUCDO char(10) not null,
	ID_NHCH char(10) not null,
);
--Table Chức Vụ
 create table CHUCVU(
	ID_CVU char(10) not null primary key(ID_CVU) constraint PK_CVU default DBO.AUTO_IDCVU(),
	TENCVU nvarchar(50), 
 );
 --Table Đề Thi
 create table DETHI(
	ID_DETHI char(10) not null primary key(ID_DETHI) constraint PK_DTHI default DBO.AUTO_IDDETHI(),
	TENDETHI nvarchar(50),
	SLCAU int,
	TGLamBai int,
	GhiChu nvarchar(50),
	ID_NHCH char(10) not null,
	ID_GVIEN char(10) not null,
	ID_NAMHOC char(10) not null,
 );
 --Table Điểm Thi
 Create table KETQUA(
	ID_KQUA char(10) not null primary key(ID_KQUA) constraint PK_DIEMTHI default dbo.AUTO_IDDIEMTHI(),
	DIEMTHI float,
	SLCAUDUNG int,
	ID_BAITHI char(10) not null,
 );
 --Table Giảng Viên
 Create table GIANGVIEN(
	ID_GVIEN char(10) not null primary key(ID_GVIEN) constraint PK_GIANGVIEN default DBO.AUTO_IDGVIEN(),
	PASSGV nvarchar(30),
	TENGV nvarchar(50),
	HINHGV nvarchar(100),
	NAMSINH date,
	GIOITINH nvarchar(5),
	CHUYENMON nvarchar(50),
	TDHOCVAN nvarchar(50),
	ID_KHOA char(5) not null,
)
--Table Giảng viên chức vụ
create table GVIENCHUCVU(
	ID_CVU char(10) not null,
	ID_GVIEN char(10) not null,
	CONSTRAINT PK_NNND PRIMARY KEY(ID_CVU, ID_GVIEN),
	CONSTRAINT FK_NNND_ND FOREIGN KEY (ID_GVIEN) REFERENCES GIANGVIEN(ID_GVIEN),
	CONSTRAINT FK_NNND_NND FOREIGN KEY (ID_CVU) REFERENCES CHUCVU(ID_CVU)
);

--Table KocKy
create table HOCKY
(	
	ID_HOCKY char(10) not null primary key(ID_HOCKY) constraint PK_HOCKY default dbo.AUTO_IDHOCKY() ,
	TENHK nvarchar(50), 
);
--Table Khoa
create table KHOA(
	ID_KHOA char(5) not null primary key(ID_KHOA) constraint PK_KHOA default DBO.AUTO_IDKHOA(),
	TENKHOA nvarchar(50),
	DIADIEM nvarchar(200),
);
--Table Lịch thi
create table LICHTHI(
	ID_LICHTHI char(10)not null primary key(ID_LICHTHI) constraint PK_LICHTHI default DBO.AUTO_IDLICHTHI(),
	TENLICHTHI nvarchar(50),
	NGAYTAO datetime,
	NGAYTHI date,
	Tiet nvarchar(10),
	ID_GVIEN char(10) not null,
	ID_LOPHP char(10) not null,
);
--Table Lớp
create table LOPHOCPHAN(
	ID_LOPHP char(10) not null primary key(ID_LOPHP) constraint PK_LOPHP default DBO.AUTO_IDLOPHP(),
	TENLOP nvarchar(50),
	SISO int ,
	DIADIEM nvarchar(20),
	TIETHOC nchar(10),
	ID_MONHOC char(10) not null,
	ID_GVIEN char(10) not null,
	ID_HOCKY char(10) not null,
	ID_NAMHOC char(10) not null,
);
--Table Môn học
create table MONHOC(
	ID_MONHOC char(10) not null primary key(ID_MONHOC) constraint PK_MONHOC default DBO.AUTO_IDMONHOC(),
	TENMONHOC nvarchar(50),
	TChi int,
	ID_KHOA char(5) not null,
);
--Table Mức độ
create table MUCDO(
	ID_MUCDO char(10) not null primary key(ID_MUCDO) constraint PK_MUCDO default dbo.AUTO_IDMUCDO(),
	TENMUCDO nvarchar(20),
);
--table Màn hình
create table MANHINH(
	ID_MANHINH int primary key(ID_MANHINH) constraint PK_MANHINH default Dbo.Auto_IDMANHINH(),
	TENMANHINH nvarchar(100)
);
--Table Ngân hàng câu hỏi
create table NHCH(
	ID_NHCH char(10) not null primary key(ID_NHCH) constraint PK_NHCH default DBO.AUTO_IDNHCHOI(),
	TGCAPNHAT datetime,
	SLCAUHOI int,
	ID_GVIEN char(10),
	ID_MONHOC char(10) not null
);
--Table Năm Học
create table NAMHOC(
	ID_NAMHOC char(10) not null primary key(ID_NAMHOC) constraint PK_NAMHOC default DBO.AUTO_IDNAMHOC(),
	TENNAM nvarchar(30), 
);
--Table Sinh viên
create table SINHVIEN(
	ID_SVIEN char(11) not null primary key(ID_SVIEN) constraint PK_SINHVIEN default DBO.AUTO_IDSVien(),
	PASSSVIEN nvarchar(30),
	TENSV nvarchar(50),
	HINHSV Nvarchar(100),
	NAMSINH datetime,
	GIOITINH nvarchar(5),
	SDT char(12),
	DIACHI nvarchar(100),
	CMND nchar(11),
	QUEQUAN nvarchar(100),
	ID_KHOA char(5) not null,
);
--Table Tham gia thi
create table TGTHI(
	ID_TGTHI char(10) not null,
	TTRANG int,
	ID_LICHTHI char(10)not null,
	ID_SVIEN char(11) not null,
	ID_BAITHI char(10) ,
	ID_PHONGTHI char(10) not null,
	constraint PK_TGTHI primary key(ID_TGTHI)
);
--Table Phòng thi
create table PHONGTHI(
	ID_PHONGTHI char(10) not null primary key(ID_PHONGTHI) constraint PK_PHONGTHI default dbo.AUTO_IDPHONG(),
	TENPHONG nvarchar(30),
);
--table Phân quyền
CREATE TABLE PHANQUYEN
(
			ID_CVU			CHAR(10) NOT NULL,
			ID_MANHINH		INT NOT NULL,
			COQUYEN			BIT,
			CONSTRAINT PK_PHANQUYEN PRIMARY KEY(ID_CVU, ID_MANHINH),
			CONSTRAINT FK_PQ_MH FOREIGN KEY (ID_MANHINH) REFERENCES MANHINH(ID_MANHINH),
			CONSTRAINT FK_PQ_NNDA FOREIGN KEY (ID_CVU) REFERENCES CHUCVU(ID_CVU)
);

------------------------------------------------------------------------------------------------------------
/*Foreign*/
--Foreign Bài thi với Đề Thi
alter table BAITHI
Add constraint FK_BT_DETHI foreign key(ID_DETHI) references DETHI(ID_DETHI)
--Foreign Chi tiết đề thi với đề thi
alter table CTDTHI
add constraint FK_CTDTHI_DETHI foreign key(ID_DTHI) references DETHI(ID_DETHI)
--Foreign Chi tiết lớp học phần với sinh viên
alter table CTLHPHAN
add constraint FK_CTLHPHAN_SINHVIEN foreign key(ID_SVIEN) references SINHVIEN(ID_SVIEN)
--foreign chi tiết lớp học phần với lớp học phần
alter table CTLHPHAN
add constraint FK_CTLHPHAN_LOPHP foreign key(ID_LOPHP) references LOPHOCPHAN(ID_LOPHP)
--Foreign câu hỏi với mức độ
alter table CAUHOI
add constraint FK_CAUHOI_MUCDO foreign key(ID_MUCDO) references MUCDO(ID_MUCDO)
--foreign câu hỏi với ngân hàng câu hỏi
alter table CAUHOI
add constraint FK_CAUHOI_NHCH foreign key(ID_NHCH) references NHCH(ID_NHCH)
--foreign đề thi với ngân hàng câu hỏi
alter table DETHI
add constraint FK_DETHI_NHCH foreign key(ID_NHCH) references NHCH(ID_NHCH)
--foreign đề thi với giảng viên
alter table DETHI
add constraint FK_DETHI_GIANGVIEN foreign key(ID_GVIEN) references GIANGVIEN(ID_GVIEN)
--foreign kết quả với bài thi
alter table KETQUA
add constraint FK_KETQUA_BAITHI foreign key(ID_BAITHI) references BAITHI(ID_BAITHI)
--foreign giảng viên với khoa
alter table GIANGVIEN
add Constraint FK_GVIEN_KHOA foreign key(ID_KHOA) references KHOA(ID_KHOA)
--foreign Lịch Thi với Nhân viên
alter table LICHTHI
add constraint FK_LichThi_GVIEN foreign key(ID_GVIEN) references GIANGVIEN(ID_GVIEN)
--foreign Lịch thi với Lớp học phần********
alter table LICHTHI
add constraint FK_LICHTHI_LOPHP foreign key(ID_LOPHP) references LOPHOCPHAN(ID_LOPHP)
--foreign lớp với Giảng viên
alter table LOPHOCPHAN
add constraint FK_LOP_GVIEN foreign key(ID_GVIEN) references GIANGVIEN(ID_GVIEN)
--Foreign lớp học phần với học kỳ
alter table LOPHOCPHAN
add constraint FK_LOPHOCPHAN_HOCKY foreign key(ID_HOCKY) references HOCKY(ID_HOCKY)
--Foreign Lớp học phần với Môn học
alter table LOPHOCPHAN
add constraint FK_LOPHOCPHAN_MONHOC foreign key(ID_MONHOC) references MONHOC(ID_MONHOC)
--Foreign môn học với ngân hàng câu hỏi**************
alter table NHCH
add constraint FK_MONHOC_NHCH foreign key(ID_MONHOC) references MONHOC(ID_MONHOC)

--foreign môn học với khoa
alter table MONHOC
add constraint FK_MONHOC_KHOA foreign key(ID_KHOA) references KHOA(ID_KHOA)

--Foreign ngân hàng câu hỏi với nhân viên
alter table NHCH
add constraint FK_NHCH_GVIEN foreign key(ID_GVIEN) references GIANGVIEN(ID_GVIEN)
--Foreing Sinh viên với khoa
alter table SINHVIEN
add constraint FK_SVIEN_KHOA foreign key(ID_KHOA) references KHOA(ID_KHOA)
--foreign Tham gia thi với lịch thi
alter table TGTHI
add constraint FK_TGTHI_LICHTHI foreign key(ID_LICHTHI) references LICHTHI(ID_LICHTHI)
--foreign tham gia thi với sinh viên
alter table TGTHI
add constraint FK_TGTHI_SVIEN foreign key(ID_SVIEN) references SINHVIEN(ID_SVIEN)
--foreign Tham gia thi với Bài thi
alter table TGTHI
add constraint FK_TGTHI_BAITHI foreign key(ID_BAITHI) references BAITHI(ID_BAITHI)
--foreign Tham gia thi với phòng thi
alter table TGTHI
add constraint FK_TGTHI_PHONGTHI foreign key(ID_PHONGTHI) references PHONGTHI(ID_PHONGTHI)
--foreign Lớp học phần với năm học
alter table LOPHOCPHAN
add constraint FK_LHPHAN_NAMHOC foreign key(ID_NAMHOC) references NAMHOC(ID_NAMHOC)

/*Values*/
--Học kỳ
--Học kỳ
INSERT INTO HOCKY(TENHK)
VALUES(N'Học kỳ 1')
INSERT INTO HOCKY(TENHK)
VALUES(N'Học kỳ 2')

--Khoa
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Công nghệ Thông tin',N'Tầng trệt, dãy nhà A,Trường Đại học Công nghiệp Thực phẩm Tp.HCM')
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Công nghệ Thực phẩm',N'Tầng trệt, dãy nhà B,Trường Đại học Công nghiệp Thực phẩm Tp.HCM')
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Công nghệ Sinh học',N'Tầng 1, dãy nhà B,Trường Đại học Công nghiệp Thực phẩm Tp.HCM')
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Thủy sản',N'Tầng trệt, dãy nhà B,Trường Đại học Công nghiệp Thực phẩm Tp.HCM')
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Công nghệ Hóa học',N'Trường Đại học Công nghiệp Thực phẩm Tp.HCM')    ----5
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Môi trường - Tài nguyên và Biến đổi Khí hậu',N'B104, Tòa nhà B,Trường Đại học Công nghiệp Thực phẩm Tp.HCM')
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Công nghệ cơ khí',N'31 Chế Lan Viên, Phường Tây Thạnh, Quận Tân Phú, TP. HCM')
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Công nghệ Điện - Điện tử',N'31 Chế Lan Viên, Phường Tây Thạnh, Quận Tân Phú, TP. HCM')
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Công nghệ May và Thời trang',N'Trường Đại học Công nghiệp Thực phẩm Tp.HCM')
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Tài chính - Kế toán',N'Trường Đại học Công nghiệp Thực phẩm Tp.HCM')         ----10
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Quản trị Kinh doanh',N'Tầng 3 nhà C,Trường Đại học Công nghiệp Thực phẩm Tp.HCM')
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Du lịch và Ẩm thực',N'Trường Đại học Công nghiệp Thực phẩm Tp.HCM')
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Khoa học ứng dụng',N'Lầu 3, khu nhà C,Trường Đại học Công nghiệp Thực phẩm Tp.HCM')
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Chính trị - Luật',N'C301,Trường Đại học Công nghiệp Thực phẩm Tp.HCM')
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Ngoại ngữ',N'D.101,Trường Đại học Công nghiệp Thực phẩm Tp.HCM')       ----15
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Giáo dục thể chất và Quốc phòng An ninh',N'72 NGUYỄN ĐỖ CUNG, P.TÂY THẠNH, Q.TÂN PHÚ, TP.HCM')

--Chức vụ
INSERT INTO CHUCVU (TENCVU)
VALUES (N'Ban chủ nhiệm khoa')
INSERT INTO CHUCVU (TENCVU)
VALUES (N'Trưởng bộ môn')
INSERT INTO CHUCVU (TENCVU)
VALUES (N'Giảng viên')
insert into CHUCVU(TENCVU)
values(N'Nhân viên khảo thí')

--Giảng viên
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Lâm Thị Họa Mi',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Vũ Thanh Nguyên',NULL,NULL,N'Nam',N'',N'PGS.TS','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Phạm Nguyễn Huy Phương',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thanh Long',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thị Bích Ngân',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Vũ Đức Thịnh',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Văn Thịnh',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Ngô Dương Hà',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Văn Thế Thành',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Huỳnh Thị Châu Lan',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH001')   -----10
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123','Trần Đình Toàn',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Hải Yến',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Dương Thị Mộng Thùy',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Đinh Nguyễn Trọng Nghĩa',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thị Định',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Phương Hạc',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Đinh Thị Mận',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thị Thanh Thủy',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thị Thùy Trang',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thị Thu Tâm',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH001')   ----20
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Trần Như Ý',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)		
VALUES ('123',N'Nguyễn Văn Tùng','10.png',NULL,N'Nam',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Lê Nguyễn Đoan Duy',NULL,NULL,N'Nam',N'',N'PGS.TS','KH002')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thị Thảo Minh',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH002')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Đỗ Thị Lan Nhi',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH002')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thị Thùy Dương',NULL,NULL,N'Nữ',N'',N'Tiến sĩ','KH002')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Dương Hữu Huy',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH002')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Lê Minh Tâm',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH002')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Phan Thế Duy',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH002')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Đình Thị Như Nguyện',NULL,NULL,N'Nữ',N'',N'Tiến sĩ','KH002')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Hữu Quyền',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH002')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Ngô Duy Anh Triết',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH002')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Đặng Thị Yến',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH002')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Phan Thị Hồng Liên',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH002')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Phạm Minh Tuấn',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Phạm Văn Lộc',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Ngô Thị Kim Anh',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Lại Đình Biên',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Trần Hoàng Dũng',NULL,NULL,N'Nam',N'',N'PGS.TS','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Đỗ Thị Hiền',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Trần Quỳnh Hoa',NULL,NULL,N'Nữ',N'',N'Tiến sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Trần Quốc Huy',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Minh Phương',NULL,NULL,N'Nữ',N'',N'Tiến sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Đào Thị Mỹ Linh',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thị Quỳnh Mai',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thị Tuyết Nhung',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Trần Thị Anh Thoa',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Lê Thị Thúy',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Phạm Thị Phương Thùy',NULL,NULL,N'Nữ',N'',N'Tiến sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Đỗ Thị Hoàng Tuyến',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thị Thu Huyền',NULL,NULL,N'Nữ',N'',N'Tiến sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thị Nam Phương',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Phạm Hương Huyền',NULL,NULL,N'Nữ',N'',N'Tiến sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Trịnh Thị Hương',NULL,NULL,N'Nữ',N'',N'Tiến sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Huỳnh Phan Phương Trang',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Trịnh Xuân Ngọ',NULL,NULL,N'Nam',N'',N'PGS.TS','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Trần Hoàng Ngâu',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Hồ Viết Thế',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Hoàng XuânThế',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Ngô Thanh An',NULL,NULL,N'Nam',N'',N'PGS.TS','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Đặng Văn Sử',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Huỳnh Bảo Long',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Trần Lưu Dũng',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Đỗ Hữu Hoàng',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Bùi Tấn Nghĩa',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Huỳnh Văn Tiến',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Võ Phạm Phương Trang',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Bùi Thu Hà',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Đào Thanh Khê',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Hồ Tấn Thành',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Võ Văn Sim',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thị Thanh Hiền',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Trần Tấn Nhật',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Lê Thị Ngọc Hạnh',NULL,NULL,N'Nữ',N'',N'Tiến sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Văn Phúc',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Trương Bách Chiến',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Tán Văn Hậu',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH016')        ---77
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N' Nguyễn Thị Lương',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Đoàn Thị Minh Phương',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH014')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Huỳnh Lê Huy Cường',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH014')  --- 80
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Trần Nguyễn An Sa',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH014')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thúc Bội Huyên ',NULL,NULL,N'Nữ',N'',N'Tiến sĩ','KH014')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Giang Ngọc Hà',NULL,NULL,N'Nữ',N'',N'Tiến sĩ','KH014')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Học Thắng',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH016')    ---84
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Hồ Thị Ngọc Sương',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Võ Thị Nhã Uyên',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Hưng Thủy',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Ngọc Kim Tuyến',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH005')

--Môn học
INSERT INTO MONHOC(TENMONHOC,TChi,ID_KHOA,ID_NHCH)
VALUES(N'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 1',2,'KH014','') 
INSERT INTO MONHOC(TENMONHOC,TChi,ID_KHOA,ID_NHCH)
VALUES(N'Toán cao cấp A1',3,'KH001','') 
INSERT INTO MONHOC(TENMONHOC,TChi,ID_KHOA,ID_NHCH)
VALUES(N'Giáo dục quốc phòng - an ninh 1',3,'KH016','') 
INSERT INTO MONHOC(TENMONHOC,TChi,ID_KHOA,ID_NHCH)
VALUES(N'Giáo dục quốc phòng - an ninh 2',3,'KH016','') 
INSERT INTO MONHOC(TENMONHOC,TChi,ID_KHOA,ID_NHCH)
VALUES(N'Pháp luật đại cương',2,'KH014','')    ----5
INSERT INTO MONHOC(TENMONHOC,TChi,ID_KHOA,ID_NHCH)
VALUES(N'Kiến trúc máy tính',2,'KH001','') 
INSERT INTO MONHOC(TENMONHOC,TChi,ID_KHOA,ID_NHCH)
VALUES(N'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 2',3,'KH014','') 
INSERT INTO MONHOC(TENMONHOC,TChi,ID_KHOA,ID_NHCH)
VALUES(N'Tư tưởng Hồ Chí Minh1',2,'KH014','') 
INSERT INTO MONHOC(TENMONHOC,TChi,ID_KHOA,ID_NHCH)
VALUES(N'Hệ điều hành',3,'KH001','') 
INSERT INTO MONHOC(TENMONHOC,TChi,ID_KHOA,ID_NHCH)
VALUES(N'Đường lối cách mạng của Đảng Cộng sản Việt Nam',3,'KH014','') 

--Năm học
INSERT INTO NAMHOC(TENNAM)
VALUES('2021-2022')

--Lớp học phần
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 1',50,'MH001','2021100025','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 1',50,'MH001','2021100030','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 1',50,'MH001','2021100027','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 1',50,'MH001','2021100019','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 1',50,'MH001','2021100024','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Toán cao cấp A1',50,'MH002','2021100010','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Toán cao cấp A1',50,'MH002','2021100011','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Toán cao cấp A1',50,'MH002','2021100012','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Toán cao cấp A1',50,'MH002','2021100014','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Toán cao cấp A1',50,'MH002','2021100015','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Giáo dục quốc phòng - an ninh 1',50,'MH003','2021100080','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Giáo dục quốc phòng - an ninh 1',50,'MH003','2021100080','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Giáo dục quốc phòng - an ninh 1',50,'MH003','2021100080','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Giáo dục quốc phòng - an ninh 1',50,'MH003','2021100081','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Giáo dục quốc phòng - an ninh 1',50,'MH003','2021100081','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Giáo dục quốc phòng - an ninh 2',50,'MH004','2021100081','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Giáo dục quốc phòng - an ninh 2',50,'MH004','2021100082','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Giáo dục quốc phòng - an ninh 2',50,'MH004','2021100082','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Giáo dục quốc phòng - an ninh 2',50,'MH004','2021100082','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Giáo dục quốc phòng - an ninh 2',50,'MH004','2021100082','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Pháp luật đại cương',50,'MH005','2021100079','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Pháp luật đại cương',50,'MH005','2021100079','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Pháp luật đại cương',50,'MH005','2021100080','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Pháp luật đại cương',50,'MH005','2021100080','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Pháp luật đại cương',50,'MH005','2021100079','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Kiến trúc máy tính',50,'MH006','2021100006','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Kiến trúc máy tính',50,'MH006','2021100007','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Kiến trúc máy tính',50,'MH006','2021100008','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Kiến trúc máy tính',50,'MH006','2021100009','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Kiến trúc máy tính',50,'MH006','2021100011','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 2',50,'MH007','2021100081','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 2',50,'MH007','2021100081','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 2',50,'MH007','2021100081','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 2',50,'MH007','2021100082','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 2',50,'MH007','2021100082','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Tư tưởng Hồ Chí Minh',50,'MH008','2021100082','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Tư tưởng Hồ Chí Minh',50,'MH008','2021100082','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Tư tưởng Hồ Chí Minh',50,'MH008','2021100083','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Tư tưởng Hồ Chí Minh',50,'MH008','2021100083','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Tư tưởng Hồ Chí Minh',50,'MH008','2021100083','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Hệ điều hành',50,'MH009','2021100023','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Hệ điều hành',50,'MH009','2021100022','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Hệ điều hành',50,'MH009','2021100021','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Hệ điều hành',50,'MH009','2021100020','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Hệ điều hành',50,'MH009','2021100019','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Đường lối cách mạng của Đảng Cộng sản Việt Nam',50,'MH010','2021100079','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Đường lối cách mạng của Đảng Cộng sản Việt Nam',50,'MH010','2021100079','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Đường lối cách mạng của Đảng Cộng sản Việt Nam',50,'MH010','2021100080','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Đường lối cách mạng của Đảng Cộng sản Việt Nam',50,'MH010','2021100080','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Đường lối cách mạng của Đảng Cộng sản Việt Nam',50,'MH010','2021100080','2021000HK2','NH2021')

--Value PHÒNG THI
insert into PHONGTHI(TENPHONG)
values(N'A101')
insert into PHONGTHI(TENPHONG)
values(N'A102')
insert into PHONGTHI(TENPHONG)
values(N'A103')
insert into PHONGTHI(TENPHONG)
values(N'A104')
insert into PHONGTHI(TENPHONG)
values(N'A105')
insert into PHONGTHI(TENPHONG)
values(N'A106')
insert into PHONGTHI(TENPHONG)
values(N'A107')
insert into PHONGTHI(TENPHONG)
values(N'A108')
insert into PHONGTHI(TENPHONG)
values(N'A109')
insert into PHONGTHI(TENPHONG)
values(N'A110')
insert into PHONGTHI(TENPHONG)
values(N'A201')
insert into PHONGTHI(TENPHONG)
values(N'A202')
insert into PHONGTHI(TENPHONG)
values(N'A203')
insert into PHONGTHI(TENPHONG)
values(N'A204')
insert into PHONGTHI(TENPHONG)
values(N'A205')
insert into PHONGTHI(TENPHONG)
values(N'A206')
insert into PHONGTHI(TENPHONG)
values(N'A207')
insert into PHONGTHI(TENPHONG)
values(N'A208')
insert into PHONGTHI(TENPHONG)
values(N'A209')
insert into PHONGTHI(TENPHONG)
values(N'A210')

--- values mức độ
insert into MUCDO(TENMUCDO)
values(N'Dễ')
insert into MUCDO(TENMUCDO)
values(N'Trung Bình')
insert into MUCDO(TENMUCDO)
values(N'Khó')

--values Giảng viên chức vụ
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100002','CVU001')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100003','CVU001')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100004','CVU001')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100022','CVU001')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100023','CVU001')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100024','CVU001')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100034','CVU001')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100035','CVU001')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100059','CVU001')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100060','CVU001')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100005','CVU002')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100006','CVU002')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100007','CVU002')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100008','CVU002')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100025','CVU002')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100030','CVU002')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100031','CVU002')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100032','CVU002')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100033','CVU002')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100042','CVU002')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100061','CVU002')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100072','CVU002')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100079','CVU002')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100001','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100009','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100010','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100011','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100012','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100013','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100014','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100015','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100016','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100017','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100018','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100019','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100020','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100021','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100026','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100027','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100028','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100029','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100036','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100037','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100038','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100039','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100040','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100041','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100043','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100044','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100045','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100046','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100047','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100048','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100049','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100050','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100051','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100052','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100053','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100054','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100055','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100056','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100057','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100058','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100064','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100062','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100065','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100066','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100067','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100069','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100070','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100071','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100073','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100074','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100075','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100076','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100077','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100078','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100080','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100081','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100082','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100083','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100084','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100085','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100086','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021100087','CVU003')


--values Sinh viên
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Ngọc Thơ','','12/12/2000',N'Nữ','0937487645','','',N'Tây Ninh','KH001')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Võ Thị Cẩm Tú','','5/12/2000',N'Nữ','0931237645','','',N'TP.HCM','KH001')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Tạ Thị Minh Nhựt','','12/1/2000',N'Nữ','0931231236','','',N'Long An','KH001')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Văn Hiếu','','12/2/2000',N'Nam','0937487123','','',N'TP.HCM','KH001')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Huy Hoàng','','1/7/2000',N'Nam','0912387645','','',N'Đòng Nai','KH001')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Trần Ngọc Hoàng','','2/9/2000',N'Nam','0937123445','','',N'TP.HCM','KH002')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Đỗ Văn Vinh','','2/2/2000',N'Nam','0937412345','','',N'TP.HCM','KH002')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Lê Thanh Tùng','','12/8/2000',N'Nam','095665645','','',N'Bình Dương','KH002')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Vũ Linh','','11/10/2000',N'Nam','0937499645','','',N'TP.HCM','KH002')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Huỳnh Thắng','','11/10/2000',N'Nam','0937487222','','',N'Tây Ninh','KH002')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Trần Huyền Thoại','','3/8/2000',N'Nam','0937487345','','',N'TP.HCM','KH003')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Ngọc Hân','','9/1/2000',N'Nữ','0937487771','','',N'TP.HCM','KH003')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Trần Trang Trang','','2/7/2000',N'Nữ','0937787645','','',N'Đòng Nai','KH003')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Lê Bích Thùy','','6/3/2000',N'Nữ','0937787645','','',N'TP.HCM','KH003')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Đỗ Ngọc Đạt','','5/2/2000',N'Nam','0937487655','','',N'TP.HCM','KH003')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Đoàn Huy Hải','','8/11/2000',N'Nam','0937456645','','',N'Tiền Giang','KH004')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Lê Thanh Hoàng','','11/5/2000',N'Nam','0937687645','','',N'Tây Ninh','KH004')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Trần Ngọc Đạt','','12/8/2000',N'Nam','0937487645','','',N'Tây Ninh','KH004')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Trần Thơ Thơ','','8/12/2000',N'Nữ','0932487645','','',N'TP.HCM','KH004')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Chí Hùng','','9/12/2000',N'Nam','03999187645','','',N'Tây Ninh','KH004')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Ngọc Hiếu','','10/12/2000',N'Nam','0932417645','','',N'TP.HCM','KH005')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Văn Vũ','','4/2/2000',N'Nam','0937487997','','',N'TP.HCM','KH005')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Trần Thanh Thảo','','2/14/2000',N'Nữ','0937487654','','',N'Đòng Nai','KH005')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Trần Đức Đông','','12/17/2000',N'Nam','0937487635','','',N'Tây Ninh','KH005')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Hồ Văn Cường','','2/28/2000',N'Nam','0937487621','','',N'Tiền Giang','KH005')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Lê Xuân Thi','','12/30/2000',N'Nữ','0936767645','','',N'Long An','KH007')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Đặng Thị Thủy','','2/21/2000',N'Nữ','0937447645','','',N'TP.HCM','KH007')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Ngọc My','','1/19/2000',N'Nữ','0938487645','','',N'TP.HCM','KH007')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Đỗ Bá Đức','','3/18/2000',N'Nam','0937487445','','',N'TP.HCM','KH007')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Huy Hoàng','','6/26/2000',N'Nam','0937488645','','',N'Bình Dương','KH007')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Lê Cẩm Tiền','','5/27/2000',N'Nữ','','','',N'Đòng Nai','KH008')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Lê Hoang','','9/29/2000',N'Nữ','','','',N'TP.HCM','KH008')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Đỗ Văn Đức','','8/30/2000',N'Nam','','','',N'Tiền Giang','KH008')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Thanh Tú','','12/2/2000',N'Nam','','','',N'Tây Ninh','KH008')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Đông Quân','','12/19/2000',N'Nam','0936789645','','',N'Tây Ninh','KH008')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Ngọc Tuyết','','2/12/2000',N'Nữ','','','',N'TP.HCM','KH009')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Hải Nam','','2/8/2000',N'Nam','','','',N'Long An','KH009')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Trần Hải Nam','','12/18/2000',N'Nam','','','',N'Tây Ninh','KH009')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Văn Đức','','1/24/2000',N'Nam','','','',N'Bình Dương','KH009')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Thị Thủy','','1/26/2000',N'Nữ','0938887645','','',N'Tiền Giang','KH009')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Xuân Thi','','12/17/2000',N'Nữ','','','',N'Đòng Nai','KH010')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Văn Cường','','12/19/2000',N'Nam','0937225645','','',N'TTP.HCM','KH010')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Đức Đông','','12/30/2000',N'Nam','','','',N'TP.HCM','KH010')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Ngọc Đạt','','12/19/2000',N'Nam','','','',N'TP.HCM','KH010')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Trần Thanh Tú','','12/20/2000',N'Nữ','0933347645','','',N'Bình Dương','KH010')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Thanh Vân','','12/21/2000',N'Nữ','','','',N'Tây Ninh','KH011')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Đỗ Mỹ Vân','','12/12/2000',N'Nữ','','','',N'Long An','KH011')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Thanh Sang','','12/11/2000',N'Nam','','','',N'TP.HCM','KH011')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Văn Sang','','12/10/2000',N'Nam','0937421345','','',N'TTP.HCM','KH011')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Trần Đức Tuấn','','1/10/2000',N'Nam','','','',N'Bình Dương','KH011')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Trần Thành Danh','','1/11/2000',N'Nam','','','',N'TP.HCM','KH012')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Đỗ Thị Nhanh','','2/17/2000',N'Nữ','0937489345','','',N'Đòng Nai','KH012')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Lê Văn Danh','','1/9/2000',N'Nam','','','',N'Long An','KH012')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Lê Thị Thi','','1/12/2000',N'Nữ','','','',N'TP.HCM','KH012')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Lê Tuấn Sang','','12/1/2000',N'Nam','','','',N'TP.HCM','KH012')

select*from SINHVIEN
SELECT* from KHOA
DROP DATABASE TNKQ
--values Chi tiết Lớp Học Phần
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100001','20210001')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100001','20210006')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100001','20210011')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100001','20210006')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100001','20210021')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100001','20210026')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100001','20210032')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100001','20210037')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100001','20210041')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100001','20210048')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100002','20210001')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100002','20210006')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100002','20210012')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100002','20210016')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100002','20210021')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100002','20210027')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100002','20210033')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100002','20210037')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100002','20210043')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100002','20210049')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100003','20210001')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100003','20210006')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100003','20210013')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100003','20210016')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100003','20210023')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100003','20210026')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100003','20210032')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100003','20210037')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100003','20210041')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100003','20210048')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100004','20210002')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100004','20210007')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100004','20210012')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100004','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100004','20210022')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100004','20210026')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100004','20210032')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100004','20210037')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100004','20210041')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100004','20210048')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100005','20210003')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100005','20210007')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100005','20210012')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100005','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100005','20210022')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100005','20210027')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100005','20210033')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100005','20210037')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100005','20210043')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100005','20210049')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100006','20210004')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100006','20210011')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100006','20210017')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100006','20210024')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100006','20210031')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100006','20210038')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100006','20210048')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100007','20210004')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100007','20210011')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100007','20210017')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100007','20210024')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100007','20210031')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100007','20210038')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100007','20210048')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100008','20210004')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100008','20210011')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100008','20210017')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100008','20210024')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100008','20210031')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100008','20210038')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100008','20210048')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100009','20210004')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100009','20210011')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100009','20210017')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100009','20210024')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100009','20210031')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100009','20210038')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100009','20210048')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100010','20210004')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100010','20210011')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100010','20210017')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100010','20210024')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100010','20210031')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100010','20210038')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100010','20210048')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100011','20210005')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100011','20210015')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100011','20210020')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100011','20210025')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100011','20210035')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100011','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100011','20210050')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100012','20210005')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100012','20210015')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100012','20210020')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100012','20210025')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100012','20210035')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100012','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100012','20210050')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100013','20210005')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100013','20210015')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100013','20210020')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100013','20210025')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100013','20210035')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100013','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100013','20210050')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100014','20210005')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100014','20210015')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100014','20210020')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100014','20210025')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100014','20210035')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100014','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100014','20210050')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100015','20210005')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100015','20210015')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100015','20210020')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100015','20210025')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100015','20210035')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100015','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100015','20210050')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100016','20210002')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100016','20210013')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100016','20210017')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100016','20210022')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100016','20210032')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100016','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100016','20210046')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100017','20210002')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100017','20210013')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100017','20210017')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100017','20210022')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100017','20210032')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100017','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100017','20210046')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100018','20210002')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100018','20210013')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100018','20210017')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100018','20210022')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100018','20210032')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100018','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100018','20210046')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100019','20210002')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100019','20210013')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100019','20210017')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100019','20210022')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100019','20210032')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100019','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100019','20210046')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100020','20210002')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100020','20210013')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100020','20210017')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100020','20210022')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100020','20210032')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100020','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100020','20210046')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100021','20210002')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100021','20210011')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100021','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100021','20210022')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100021','20210031')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100021','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100021','20210046')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100022','20210002')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100022','20210011')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100022','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100022','20210022')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100022','20210031')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100022','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100022','20210046')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100023','20210002')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100023','20210011')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100023','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100023','20210022')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100023','20210031')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100023','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100023','20210046')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100024','20210002')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100024','20210011')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100024','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100024','20210022')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100024','20210031')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100024','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100024','20210046')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100025','20210002')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100025','20210011')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100025','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100025','20210022')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100025','20210031')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100025','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100025','20210046')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100026','20210003')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100026','20210013')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100026','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100026','20210023')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100026','20210033')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100026','20210043')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100026','20210048')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100027','20210003')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100027','20210013')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100027','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100027','20210023')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100027','20210033')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100027','20210043')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100027','20210048')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100028','20210003')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100028','20210013')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100028','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100028','20210023')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100028','20210033')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100028','20210043')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100028','20210048')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100029','20210003')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100029','20210013')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100029','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100029','20210023')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100029','20210033')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100029','20210043')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100029','20210048')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100030','20210003')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100030','20210013')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100030','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100030','20210023')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100030','20210033')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100030','20210043')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100030','20210048')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100031','20210004')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100031','20210014')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100031','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100031','20210023')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100031','20210034')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100031','20210043')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100031','20210046')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100032','20210004')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100032','20210014')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100032','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100032','20210023')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100032','20210034')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100032','20210043')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100032','20210046')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100033','20210004')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100033','20210014')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100033','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100033','20210023')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100033','20210034')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100033','20210043')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100033','20210046')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100034','20210004')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100034','20210014')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100034','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100034','20210023')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100034','20210034')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100034','20210043')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100034','20210046')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100035','20210004')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100035','20210014')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100035','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100035','20210023')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100035','20210034')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100035','20210043')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210100035','20210046')

--- Ngân hàng câu hỏi
INSERT INTO NHCH (TGIANCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('27/03/2021',40,'2021100079','MH001')
INSERT INTO NHCH (TGIANCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('10/03/2021',30,'2021100080','MH005')
INSERT INTO NHCH (TGIANCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('27/03/2021',20,'2021100081','MH007')
INSERT INTO NHCH (TGIANCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('27/03/2021',20,'2021100082','MH008')
INSERT INTO NHCH (TGIANCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('27/03/2021',50,'2021100083','MH010')
INSERT INTO NHCH (TGIANCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('27/03/2021',40,'2021100084','MH001')
INSERT INTO NHCH (TGIANCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('27/03/2021',40,'2021100022','MH002')
INSERT INTO NHCH (TGIANCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('27/03/2021',40,'2021100002','MH009')
INSERT INTO NHCH (TGIANCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('27/03/2021',70,'2021100003','MH002')
INSERT INTO NHCH (TGIANCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('27/03/2021',30,'2021100010','MH002')
INSERT INTO NHCH (TGIANCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('27/03/2021',40,'2021100015','MH002')
INSERT INTO NHCH (TGIANCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('27/03/2021',10,'2021100017','MH002')
INSERT INTO NHCH (TGIANCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('27/03/2021',40,'2021100008','MH002')
INSERT INTO NHCH (TGIANCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('27/03/2021',40,'2021100005','MH006')
INSERT INTO NHCH (TGIANCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('27/03/2021',40,'2021100020','MH006')
INSERT INTO NHCH (TGIANCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('27/03/2021',20,'2021100021','MH009')
INSERT INTO NHCH (TGIANCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('27/03/2021',40,'2021100004','MH006')
INSERT INTO NHCH (TGIANCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('27/03/2021',30,'2021100006','MH006')
INSERT INTO NHCH (TGIANCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('27/03/2021',40,'2021100007','MH006')
INSERT INTO NHCH (TGIANCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('27/03/2021',10,'2021100077','MH003')
INSERT INTO NHCH (TGIANCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('27/03/2021',40,'2021100084','MH004')

--- Câu hỏi
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Từ năm 1905 đến năm 1910, Nguyễn Tất Thành học tại trường nào?',N'Trường Quốc học, Huế',N'Quốc Tử giám, Hà Nội',N'Trường làng, Nghệ An',N'Trường Quốc học, Huế',N'Trường Dục Thanh, Phan Thiết',N'Chương 1',N'Đã duyệt','MC002','MH008')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tác phẩm nào của Hồ Chí Minh là sự tập hợp những bài giảng của Hồ Chí Minh cho đội ngũ cán bộ cốt cán đầu tiên của Việt Nam nhằm tuyên truyền chủ nghĩa Mác – Lênin để chuẩn bị cho sự ra đời một chính đảng vô sản kiểu mới ở Việt Nam?',N'Đường Kách mệnh',N'Người cùng khổ',N'Đường Kách mệnh',N'Vấn đề dân bản xứ',N'Bản án chế độ thực dân Pháp',N'Chương 1',N'Đã duyệt','MC003','MH008')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Vì sao Hồ Chí Minh hoàn toàn tin theo Lênin và Quốc tế III?',N'Vì họ bênh vực cho các dân tộc bị áp bức',N'Vì thắng lợi của Cách mạng Tháng Mười Nga',N'Vì đây là phương hướng mới',N'Vì họ bênh vực cho các dân tộc bị áp bức',N'Vì họ chiếm số động trên thế giới',N'Chương 1',N'Đã duyệt','MC002','MH008')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bạn hãy cho biết Hồ Chí Minh có bao nhiêu tên gọi, bút danh, bí danh?',N'152',N'150',N'151',N'152',N'153',N'Chương 1',N'Đã duyệt','MC002','MH008')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'“Tất cả các dân tộc trên thế giới đều sinh ra bình đẳng, dân tộc nào cũng có quyền sống, quyền sung sướng và quyền tự do”. Câu trên trích từ tác phẩm nào của Hồ Chí Minh?',N'Tuyên ngôn độc lập',N'Tuyên ngôn độc lập',N'Bản án chế độ thực dân Pháp',N'Chính cương sách lược vắn tắt',N'Đường cách mệnh',N'Chương 1',N'Đã duyệt','MC002','MH008')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Giá trị của bản tuyên ngôn độc lập của nước Việt Nam mới được đánh giá là',N'Có giá trị lịch sử to lớn',N'Có giá trị bình thường',N'Có giá trị lịch sử to lớn',N'Có giá trị lịch sử đặc biệt',N'Là bản thiên cổ hùng văn',N'Chương 1',N'Đã duyệt','MC002','MH008')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thực chất của vấn đề dân tộc thuộc địa trong tư tưởng Hồ Chí Minh là gì?',N'Đấu tranh giải phóng dân tộc, thành lập nhà nước dân tộc độc lập, trong đó nhân dân là chủ thể tối cao của quyền lực nhà nước',N'Đòi quyền bình đẳng giữa các dân tộc, thành lập nhà nước dân tộc độc lập, trong đó nhân dân là chủ thể tối cao của quyền lực nhà nước',N'Đòi quyền tự do dân chủ cho nhân dân, thành lập nhà nước dân tộc độc lập, trong đó nhân dân là chủ thể tối cao của quyền lực nhà nước',N'Đòi quyền tự trị dân tộc dưới sự bảo hộ của ngoại bang, thành lập nhà nước dân tộc độc lập, trong đó nhân dân là chủ thể tối cao của quyền lực nhà nước',N'Đấu tranh giải phóng dân tộc, thành lập nhà nước dân tộc độc lập, trong đó nhân dân là chủ thể tối cao của quyền lực nhà nước',N'Chương 2',N'Đã duyệt','MC004','MH008')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'“Cách mạng là phá cái cũ đổi ra cái mới, cái xấu đổi ra cái tốt”. Câu trên được trích từ tác phẩm nào của Hồ Chí Minh?',N'Đạo đức cách mạng',N'Sửa đổi lề lối làm việc',N'Bản án chế độ thực dân Pháp',N'Đường Cách mệnh',N'Đạo đức cách mạng',N'Chương 2',N'Đã duyệt','MC003','MH008')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nội dung cốt lõi của tư tưởng Hồ Chí Minh là',N'Độc lập dân tộc gắn liền với chủ nghĩa xã hội',N'Chủ nghĩa yêu nước',N'Độc lập dân tộc gắn liền với chủ nghĩa xã hội',N'Chủ nghĩa xã hội',N'Chủ nghĩa nhân đạo chiến đấu',N'Chương 3',N'Đã duyệt','MC001','MH008')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'“… toàn Đảng, toàn dân ta đoàn kết phấn đấu, xây dựng nước Việt Nam hoà bình, thống nhất, độc lập, dân chủ và giàu mạnh, và góp phần xứng đáng vào sự nghiệp cách mạng thế giới”. Đoạn văn trên được trích trong văn kiện nào của Hồ Chí Minh?',N'Di chúc',N'Đường Kách mệnh',N'Di chúc',N'Lời kêu gọi ngày 17/7/1966',N'Báo cáo Chính trị tại Đại hội III của Đảng năm 1960',N'Chương 5',N'Đã duyệt','MC003','MH008')

INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thiết bị nào không phải là thiết bị nhập dữ liệu vào máy tính:',N'Loa',N'Bàn phím',N'Loa',N'Chuột',N'Máy quét',N'Chương 1',N'Đã duyệt','MC001','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Máy vi tính không làm được việc gì',N'Tự động nâng cấp tốc độ và khả năng xử lý',N'Truy cập dữ liệu từ xa thông qua mạng internet',N'Xử lý dữ liệu theo yêu cầu',N'Tính toán số liệu',N'Tự động nâng cấp tốc độ và khả năng xử lý',N'Chương 2',N'Đã duyệt','MC002','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bộ nhớ trong của máy tính gồm',N'RAM',N'Đĩa mềm, đĩa CD',N'ROM',N'Ổ đĩa cứng',N'RAM',N'Chương 3',N'Đã duyệt','MC001','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đĩa mềm hiện nay phổ biến có dung lượng là',N'1.44 MB',N'1.2 MB',N'1.38 MB',N'1.44 MB',N'1.48 MB',N'Chương 4',N'Đã duyệt','MC002','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ điều hành Windows, chương trình nào quản lý tập tin, thư mục',N'Windows Explorer',N'Windows Explorer',N'Internet Explorer',N'Control Panel',N'Caculator',N'Chương 5',N'Đã duyệt','MC002','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Từ nào dưới đây không liên quan đến cấu trúc mạng máy tính?',N'Token',N'Bus',N'Ring',N'Token',N'Star',N'Chương 3',N'Đã duyệt','MC002','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong máy tính thiết bị nào dùng để lưu trữ các thông tin cài đặt phần cứng (bộ nhớ, đĩa cứng, đĩa mềm, cache,…)',N'CMOS',N'CMOS',N'BIOS',N'ROM',N'CPU',N'Chương 5',N'Đã duyệt','MC003','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'UPS (Uninterruptible Power Supply) là thiết bị dùng để',N'Làm nguồn thay thế tạm thời trong thời gian ngắn cho máy tính khi mất nguồn điện chính',N'Làm nguồn điện bổ sung cho máy tính',N'Làm nguồn điện dùng cho máy tính ở những nơi không có điện',N'Nắn dòng nguồn điện cho máy tính',N'Làm nguồn thay thế tạm thời trong thời gian ngắn cho máy tính khi mất nguồn điện chính',N'Chương 2',N'Đã duyệt','MC002','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong Windows cho phép đặt tên tối đa dài là……ký tự kể cả khoảng trống',N'255',N'255',N'12',N'64',N'32',N'Chương 1',N'Đã duyệt','MC001','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)           -----10
VALUES (N'Trong Windows Explorer, để tạo một tập tin mới ta vào',N'File\New\Folder',N'File\New\Directory',N'File\New\Folder',N'Ba câu trên đều sai',N'File\Create Dir',N'Chương 2',N'Đã duyệt','MC001','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khi xem thuộc tính của một File hoặc Folder, thông tin nào trong các thông tin sau giúp người dùng phân biệt được File hoặc Folder?',N'Contains',N'Attribute',N'Location',N'Contains',N'Size',N'Chương 4',N'Đã duyệt','MC002','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong Windows Explorer, bấm Ctrl+A chỉ có tác dụng trên cửa sổ',N'List View',N'List View',N'Tree View',N'Cả hai cửa sổ đều có tác dụng',N'Cả hai cửa sổ đều không có tác dụng',N'Chương 3',N'Đã duyệt','MC001','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Windows là một hệ điều hành',N'Đa nhiệm',N'Đơn nhiệm',N'Đa nhiệm',N'Cả A và B đều đúng',N'Cả A và B đều sai',N'Chương 5',N'Đã duyệt','MC003','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Để di chuyển một cửa sổ hiện hành trong môi trường Windows, ta thực hiện thao tác nào sau đây trên thanh tiêu đề của cửa sổ ?',N'Drag',N'Double click chuột',N'Click chuột',N'Drag',N'Right Click chuột',N'Chương 2',N'Đã duyệt','MC002','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong Windows, ký tự phân cách hàng ngàn là',N'Dấu chấm (.)',N'b. Dấu phẩy (,)',N'Dấu chẩm phẩy (;)',N'Dấu chấm (.)',N'Không có câu trả lời đúng',N'Chương 1',N'Đã duyệt','MC002','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thao tác nào trong các thao tác sau có thể thực hiện được trên cả hai cửa sổ TreeView và ListView của Windows Explorer?',N'Mở 1  Folder',N'Thay đổi kiểu hiển thị',N'Mở 1  Folder',N'Nới rộng hoặc thu hẹp 1 cấp Folder',N'Sắp xếp Folder hoặc File',N'Chương 2',N'Đã duyệt','MC002','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong Windows, ký tự phân cách số thập phân là',N'Tuỳ thuộc vào ký tự do người dùng quy định trong Control Panel',N'Dấu chấm (.)',N'Dấu chẩm phẩy (;)',N'Dấu phẩy (,)',N'Tuỳ thuộc vào ký tự do người dùng quy định trong Control Panel',N'',N'Đã duyệt','','')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong phần mềm thư điện tử Outlook, ý nghĩa của biểu tượng ″Kẹp giấy″ xuất hiện bên cạnh các email mà bạn nhận được là',N'Có tập tin đính kèm thư đó',N'Bạn bắt buộc phải trả lới email ngay khi đọc',N'Có tập tin đính kèm thư đó',N'Email có thông tin quan trọng',N'Cẩn thận, có virus gắn kèm email đó',N'Chương 5',N'Đã duyệt','MC002','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Giao thức để truyền các tập tin trên mạng Internet giữa các máy tính với nhau là',N'FTP: File Transfer Protocol',N'SNMP: Simple Network Management Protocol',N'SMTP: Simple Mail Transfer Protocol',N'FTP: File Transfer Protocol',N'HTTP: HyperText Transfer Protocol',N'Chương 4',N'Đã duyệt','MC003','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)           -----20
VALUES (N'Trong các mệnh đề sau mô tả chức năng của mạng Internet, mệnh đề nào đúng',N'Internet là một mạng máy tính cài đặt nhiều dịch vụ khác nhau cùng dựa trên nền giao thức TCP/IP',N'Trên mạng Internet ngoài TCP/IP còn có thể sử dụng nhiều giao thức khác nhau',N'Internet là mạng máy tính toàn cầu cung cấp dịch vụ TCP/IP cho các mạng con khác',N'Internet là mạng máy tính bao gồm các ″mạng con″ được kết nối với nhau bởi các ″cầu nối″',N'Internet là một mạng máy tính cài đặt nhiều dịch vụ khác nhau cùng dựa trên nền giao thức TCP/IP',N'Chương 5',N'Đã duyệt','MC002','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nếu kết nối Internet của bạn chậm, nguyên nhân chính là gì? (Chọn câu đúng nhất)',N'Do nhiều người cùng truy cập làm cho tốc độ đường truyền bị giảm và thường hay bị nghẽn mạch',N'Do chưa trả phí Internet',N'Do Internet có tốc độ chậm',N'Do nhiều người cùng truy cập làm cho tốc độ đường truyền bị giảm và thường hay bị nghẽn mạch',N'Do người dùng chưa biết sử dụng Internet',N'Chương 4',N'Đã duyệt','MC002','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'TCP/IP là gì?',N'Giao thức truyền tin trên mạng',N'Phần mềm quản lý truyền tin',N'Giao thức truyền tin trên mạng',N'Phần mềm tiện ích Internet',N'Cấu trúc liên kết mạng',N'Chương 3',N'Đã duyệt','MC002','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cho biết tên thiết bị truyền thông cho phép máy tính truyền thông tin qua một đường truyền điện thoại chuẩn?',N'Modem',N'Card mạng',N'Modem',N'Getway',N'Các ý trên đều sai',N'Chương 3',N'Đã duyệt','MC002','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong loại mạng nào dưới đây các máy tính nối mạng đều có vai trò như nhau?',N'Peer to Peer',N'Client/Server',N'Internet',N'Mainframe',N'Peer to Peer',N'Chương 4',N'Đã duyệt','MC002','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Để tạo một website cho riêng mình thì việc làm nào sau đây là không cần thiết',N'Đăng ký là thuê bao Internet của một ISP',N'Tạo nội dung trang web',N'Thuê Hosting',N'Đăng ký là thuê bao Internet của một ISP',N'Đăng ký tên miền',N'Chương 4',N'Đã duyệt','MC003','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Mạng cục bộ là mạng',N'kết nối một số lượng nhỏ máy tính gần nhau',N'kết nối một số lượng nhỏ máy tính gần nhau',N'có từ 10 máy trở xuống',N'kết nối các máy tính',N'của một gia đình hay của một phòng ban trong một cơ quan',N'Chương 1',N'Đã duyệt','MC002','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Mô hình Client-server là mô hình',N'xử lý phân tán ở nhiều máy, trong đó máy chủ cung cấp tai nguyên và các dịch vụ theo yêu từ máy khách',N'xử lý phân tán ở nhiều máy, trong đó máy chủ cung cấp tai nguyên và các dịch vụ theo yêu từ máy khách',N'b.xử lý được thực hiện ở một máy gọi là máy chủ. Máy trạm đơn thuần chỉ cung cấp quyền sử dụng thiết bị ngoại vi từ xa cho máy chủ',N'c.mọi máy trong mạng đều có khả năng cung cấp dịch vụ cho máy khác',N'máy chủ cung cấp thiết bị ngoại vi cho máy trạm. Máy trạm có thể dùng máy in hay ổ đĩa của máy chủ',N'Chương 5',N'Đã duyệt','MC003','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'E-mail là viết tắt của cụm từ nào sau đây?',N'Electronic Mail',N'Else Mail',N'Electronic Mail',N'c.Electrical Mail',N'Exchange Mail',N'Chương 2',N'Đã duyệt','MC003','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Phần mềm nào dưới đây không phải là trình duyệt web',N'Microsoft FrontPage',N'Cả 3 loại trên',N'Internet Explorer',N'Microsoft FrontPage',N'Netcape Navigator',N'Chương 4',N'Đã duyệt','MC003','MH009')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Ngôn ngữ nào sau đây được chuyên dùng để tạo ra các tài liệu văn bản xem được bằng trình duyệt web?',N'b.HTML',N'b.HTML',N'Java',N'C',N'Pascal',N'Chương 2',N'Đã duyệt','MC001','MH009')

INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Máy tính đầu tiên ENIAC sử dụng linh kiện nào trong số các linh kiện sau?',N'Đèn điện tử',N'Đèn điện tử',N'IC bản dẫn',N'Transistor trường',N'Transistor lưỡng cực',N'Chương 1',N'Đã duyệt','MC002','MH006')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các phát biểu sau, phát biểu nào đúng?',N'Phần cứng của máy tính bao gồm các đối tượng vật lý như: bản mạch chính, bộ nhớ RAM, ROM, đĩa cứng, màn hình',N'Phần cứng của máy tính bao gồm các đối tượng như: bản mạch chính, bộ nhớ RAM, bộ nhớ ROM, đĩa cửng, màn hình và chương trình được cải đặt trong ROM',N'Phần cứng của máy tính là chương trình được cải đặt trong bộ nhớ ROM',N'Phần cứng của máy tính chính là bộ xử lý trung tâm',N'Phần cứng của máy tính bao gồm các đối tượng vật lý như: bản mạch chính, bộ nhớ RAM, ROM, đĩa cứng, màn hình',N'Chương 3',N'Đã duyệt','MC002','MH006')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các thành phần cơ bản của một máy tính gồm',N'Bộ nhớ trong, CPU, bộ nhớ ngoài, bộ phối ghép vào ra và thiết bị ngoại vi',N'Bộ nhớ trong, CPU và khối phối ghép vào ra ',N'Bộ nhớ trong, CPU và thiết bị ngoại vi',N'Bộ nhớ trong, CPU, khối phối ghép vào ra và thiết bị ngoại vi',N'Bộ nhớ trong, CPU, bộ nhớ ngoài, bộ phối ghép vào ra và thiết bị ngoại vi',N'Chương 4',N'Đã duyệt','MC002','MH006')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Địa chỉ quay về chương trình chính từ chương trình con phục vụ ngắt được lưu vào đấu trước khi chương trình con phục vụ ngắt được thực hiện?',N'Vùng ngăn xếp ',N'Vùng ngăn xếp ',N'Bảng vectơ ngắt',N'Vùng nhớ dành riêng cho chương trình',N'Cặp thanh ghi CS:IP',N'Chương 2',N'Đã duyệt','MC003','MH006')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Ngắt mà được gọi bởi một lệnh trong chương trình ngôn ngữ máy thì được gọi là ngắt gì trong các loại ngắt sau đây',N'Ngắt mềm',N'Ngặt cứng không che được bằng cờ ngắt',N'Ngắt mềm',N'Ngoại lệ phát sinh từ chính CPU',N'Ngắt cứng che được bằng cờ ngắt',N'Chương 2',N'Đã duyệt','MC002','MH006')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N' Cơ chế DMA là gì?',N'Truy cập bộ nhớ trực tiếp',N'Truy cập ngoại vi trực tiếp',N'Điều khiển hệ thống bộ nhở thông qua thiết bị ngoại vi',N'Điều khiển thiết bị ngoại vi thông qua qua bộ nhớ',N'Truy cập bộ nhớ trực tiếp',N'Chương 4',N'Đã duyệt','MC002','MH006')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'DMA là viết tắt của',N'Direct Memory Access',N'Direct Memory Access',N'Direct Memory Application Access',N'Direct Management Access',N'Direct Mainboard Administration',N'Chương 1',N'Đã duyệt','MC001','MH006')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cơ chế DMA cho phép thực hiện điều gì?',N'Truyền dữ liệu trực tiếp giữa bộ nhớ và các thiết bị ngoại vi',N'Truyền dữ liệu trực tiếp giữa các thành phần trong hệ thống bộ nhớ',N'Truyền dữ liệu trực tiếp giữa bộ nhớ và các thiết bị ngoại vi',N'ruyền dữ liệu trực tiếp giữa các thiết bị ngoại vi',N'Truyền dữ liệu trực tiếp giữa hộ nhớ và các thanh ghi trong bộ vi xử lý',N'Chương 3',N'Đã duyệt','MC003','MH006')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'DMAC gửi tín hiệu yêu cầu CPU tự treo để thực hiện DMA qua chân nào?',N'HOLD',N'DREQ',N'HOLD',N'HOLDA',N'DACK',N'Chuongw 5',N'Đã duyệt','MC002','MH006')
INSERT INTO CAUHOI (NOIDUNGCH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khi CPU chấp nhận yêu cầu tự treo để thực hiện DMA thì nó sẽ bảo cho DMAC qua chân nào?',N'HOLDA',N'DREQ',N'HOLDA',N'HOLD',N'DACK',N'Chương 5',N'Đã duyệt','MC002','MH006')




