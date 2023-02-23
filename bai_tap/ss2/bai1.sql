create database erd;
create table phieu_xuat(
so_px int primary key auto_increment,
ngay_xuat date
);
create table phieu_nhap(
so_pn int primary key auto_increment,
ngay_nhap date
);
create table so_dien_thoai(
sdt int primary key
);
create table nha_cung_cap(
ma_ncc int primary key auto_increment,
ten_ncc varchar(250),
dia_chi varchar(250),
sdt int,
foreign key (sdt) references so_dien_thoai(sdt)
);
create table vat_tu(
ma_vt int primary key auto_increment,
ten_vtu varchar(225)
);
create table Chi_tiet_phieu_xuat(
Id_px int,
foreign key (Id_px) references phieu_xuat(so_px),
Id_vtu int,
foreign key (Id_vtu) references vat_tu(ma_vt),
don_gia_xuat float,
so_luong_xuat int
);
create table chi_tiet_phieu_nhap(
id_pn int,
foreign key (id_pn) references phieu_nhap(so_pn),
id_vtu int,
foreign key (id_vtu) references vat_tu(ma_vt),
don_gia_nhap float,
so_luong_nhap int
);
create table don_dat_hang(
so_dh int primary key auto_increment,
ngay_dh date,
id_ncc int,
foreign key (id_ncc) references nha_cung_cap(ma_ncc)
);
create table chi_tiet_don_dat_hang(
id_vtu int,
foreign key (id_vtu) references vat_tu(ma_vt),
id_dh int,
foreign key (id_dh) references don_dat_hang(so_dh)
);