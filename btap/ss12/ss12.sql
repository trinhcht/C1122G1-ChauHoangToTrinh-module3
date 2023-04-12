create database library;
use library;

-- Chuyển đổi sơ đồ Entity thành các table
create table student(
s_id int primary key auto_increment,
s_name varchar(25),
birthday date,
class_name varchar(25)
);

create table category(
c_id int primary key auto_increment,
c_name varchar(25)
);

create table authors(
a_id int primary key auto_increment,
a_name varchar(25)
);

 create table books(
 b_id int primary key auto_increment,
 title varchar(50),
 page_size int,
 c_id int,
 a_id int,
 foreign key (c_id) references category(c_id),
 foreign key (a_id) references authors(a_id)
 );
 
 
 insert into category(c_name)
 value ('Tự nhiên'),
('Xã Hội'),
('Truyện'),
('Tiểu Thuyết'),
('Khác');


insert into authors(a_name)
value ('Nguyễn Thái Học'),
('Trần Minh Hoàng'),
('Dương Trung Quốc'),
('Lê Văn Hiến'),
('Hà Văn Minh');

insert into student(s_name, birthday, class_name)
value ('Nguyễn Văn A', '1999-12-12', 'C0822G1'),
('Nguyễn Văn B', '1999-12-13', 'C0822G1'),
('Nguyễn Văn C', '1999-12-14', 'C0822G1'),
('Nguyễn Văn D', '1999-12-15', 'C0922G1'),
('Nguyễn Văn E', '1999-12-16', 'C1022G1');

insert into books(title, page_size, a_id, c_id)
value ('Toán', 45, 1, 1),
('Văn',	34, 2, 2),
('Sử', 56, 3, 2),
('Địa',	76, 4, 2),
('Hoá',	32,	5, 1);


--  ss3: Từ CSDL của  ss2_query_database , nhập dữ liệu cho có dữ liệu cho các bảng như bên trên

-- Lấy ra toàn bộ sách có trong thư viện, cùng với tên thể loại và tác giả
select b.title, a.a_name, c.c_name
from books as b
inner join authors as a on b.a_id = a.a_id
inner join category as c on b.c_id = c.c_id;

-- Lấy ra danh sách các học viên đã từng mượn sách và sắp xếp danh sách theo theo tên từ a->z
-- select s_name
-- from student
-- where s_id in (select s_id from borrows as bo)
-- order by s_name;

-- Lấy ra  2 quyển sách được mượn nhiều nhất
-- select title, count(bo.b_id)
-- from borrows as bo
-- join books as b on b.b_id = bo.b_id
-- group by bo.b_id
-- order by count(bo.b_id) desc
-- limit 2;

-- Viết 1 stored procedure thêm mới book trong database
DELIMITER //
create procedure update_books (in b_id int, in title varchar(50), in page_size int, in c_id int, in a_id int)
begin
insert into books(title, page_size, books.c_id, books.a_id) values (title, page_size, books.c_id, books.a_id);
end; //
DELIMITER ;
call update_books(?,?,?,?);

-- Viết 1 stored procedure để  xoá book theo id trong database
DELIMITER //
create procedure delete_books (in b_id int)
begin
delete from books b where b.b_id = b_id;
end; //
DELIMITER ;
call delete_books(?);