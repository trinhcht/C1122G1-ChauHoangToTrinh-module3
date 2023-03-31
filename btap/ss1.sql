-- Tạo cơ sở dữ liệu có tên là book_management

create database book_management;
use book_management;
-- Tạo mới 1 bảng tên "books" với các thuộc tính
create table books(
id int primary key auto_increment,
`name` varchar(20),
page_size int,
author varchar(25)
);

-- Nhập dữ liệu cho bảng
insert into books(`name`, page_size, author)
value ('Toán', 45, 'Nguyễn Thái Học'),
('Văn', 34, 'Trần Minh Hoàng'),
('Sử', 56, 'Dương Trung Quốc'),
('Địa',	76,	'Lê Văn Hiến'),
('Hoá', 32,	'Hà Văn Minh');


-- Cập nhật số trang page_size=50 với sách có title = "Sử"
update books
set page_size = 50
where `name` = 'Sử';

-- Xoá sách có id =5
delete 
from books
where id = 5;

-- Xoá bảng books
drop table books;

-- Xoá cơ sở dữ liệu book_management
drop database book_management;

