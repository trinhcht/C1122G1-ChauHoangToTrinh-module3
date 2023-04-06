use library;

insert into borrows(s_id, b_id, borrow_date, return_date)
value (2, 4, '2022-12-15', '2022-12-29');

--  Thông kê các đầu sách được mượn nhiều nhất

create view muon_nhieu as
select title, count(bo.b_id) as dem
from borrows as bo
join books as b on b.b_id = bo.b_id
group by bo.b_id
order by count(bo.b_id) desc;

select title, dem
from muon_nhieu where dem = (select max(dem) from muon_nhieu);


select  max(dem) from 
(select title, count(bo.b_id) as dem
from borrows as bo
join books as b on b.b_id = bo.b_id
group by bo.b_id
order by count(bo.b_id) desc) as max;

-- Thông kê các đầu sách chưa được mượn
select b.title,b.b_id 
from books as b
join borrows as bo on bo.b_id = b.b_id
where bo.b_id not in (
select bo.b_id from borrows as bo
 where curdate() between bo.borrow_date and bo.return_date)
group by b.b_id;

select books.name,books.id
from books
left join borrows on books.id=borrows.book_id 
where borrows.book_id not in (select borrows.book_id from borrows where curdate() between borrows.borrow_date and borrows.return_date)
group by books.id;
-- Lấy ra danh sách các học viên đã từng mượn sách và sắp xếp  theo số lượng mượn sách từ lớn đến nhỏ
select s_name, count(bo.b_id) as `amount` 
from student as s
join borrows as bo on s.s_id = bo.s_id
where s.s_id
group by s.s_id
order by amount desc;

-- - Lấy ra các học viên mượn sách nhiều nhất của thư viện				
select s_name, count(bo.s_id) as `amount`
from student as s
join borrows as bo on s.s_id = bo.s_id
group by s.s_id
order by amount desc limit 2;