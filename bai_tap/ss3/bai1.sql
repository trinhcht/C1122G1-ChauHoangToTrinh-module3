create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;
create table class_room(
class_id int primary key auto_increment,
class_name varchar(225) not null,
start_date date not null,
class_status bit
);
create table student(
student_id int primary key auto_increment,
student_name varchar(225) not null,
address varchar(50),
phone varchar(10),
student_status bit,
class_id int not null,
foreign key (class_id) references class_room(class_id)
);
create table is_subject(
sub_id int primary key auto_increment,
sub_name varchar(30) not null,
credit  tinyint not null default 1 check ( credit >= 1 ),
sub_status bit default 1
);
create table mark(
mark_id int primary key auto_increment,
sub_id int not null,
student_id int not null,
mark float default 0 check ( mark between 0 and 100),
exam_times tinyint default 1,
unique (sub_id, student_id),
foreign key (sub_id) references is_subject(sub_id),
foreign key (student_id) references student (student_id)
);
insert into class_room(class_name, start_date, class_status)
value ('A1', '2008-12-20', 1),
('A2', '2008-12-22', 1),
('B3', current_date, 0);
insert into student(student_name, address, phone, student_status, class_id)
value ('Hung', 'Ha Noi', '0912113113', 1, 1),
('Hoa', 'Hai phong', null, 1, 1),
('Manh', 'HCM', '0123123123', 0, 2);
insert into is_subject(sub_name, credit, sub_status)
value ('CF', 5, 1),
('C', 6, 1),
('HDJ', 5, 1),
('RDBMS', 10, 1);
insert into mark (sub_id, student_id, mark, exam_times)
value (1, 1, 8, 1),
(1, 2, 10, 2),
(2, 1, 12, 1);
select student_name
from student
where student_name like 'H%';
select class_id, class_name, class_status
from class_room
where start_date like '2008-12-%';
select sub_id, sub_name, sub_status
from is_subject
where credit >=3 and credit <= 5;
update student
set class_id = 2
where student_name = 'Hung';
select student_name, sub_name, mark
from mark
inner join student on mark.student_id = student.student_id
join is_subject on mark.sub_id = is_subject.sub_id
order by mark.mark desc, student.student_name asc;