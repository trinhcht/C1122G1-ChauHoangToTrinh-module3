use library;
-- Tạo index cho cột  title của bảng books--
create index index_title on books(title);
drop index index_title on books;

-- Tạo 1 view để lấy ra danh sách các quyển sách đã được mượn, có hiển thị thêm cột số lần đã được mượn--
create view view_borows_book as select b.title, count(bo.b_id) as amount
from books as b
join borrows as bo on b.b_id= bo.b_id
group by b.b_id
order by amount asc;

-- Viết 1 stored procedure thêm mới book trong database với tham số kiểu IN--
delimiter //
create procedure add_books(in id int, title_book varchar(50),in page_size int,in author_id int,in category_id int
)
begin
insert into books(b_id, title, page_size, a_id, c_id) values (b_id, title, page_size, a_id, c_id);
end // 
delimiter ;

call add_books(7 ,'Mỹ Thuật', 30, 2, 2);