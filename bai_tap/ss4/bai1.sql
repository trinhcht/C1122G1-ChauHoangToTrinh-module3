use quan_ly_sinh_vien;
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select  *
from is_subject where credit = (select max(credit) from is_subject);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select * from is_subject
join mark on is_subject.sub_id = mark.sub_id
where mark = (select max(mark)
from mark);
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select student.*, avg(mark.mark) as 'Điểm trung bình'
from student
inner join mark on student.student_id = mark.student_id
group by student.student_id
order by 'Điểm trung bình' desc