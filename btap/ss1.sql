create database book_management;
use book_management;
create table books(
id int primary key auto_increment,
`name` varchar(20),
page_size int,
author varchar(25)
);
insert into books(`name`, page_size, author)
value ('Toán', 45, 'Nguyễn Thái Học'),
('Văn', 34, 'Trần Minh Hoàng'),
('Sử', 56, 'Dương Trung Quốc'),
('Địa',	76,	'Lê Văn Hiến'),
('Hoá', 32,	'Hà Văn Minh');

update books
set page_size = 50
where `name` = 'Sử';

drop table books;

drop database book_management;

