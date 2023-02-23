create database quan_ly_ban_hang;
use quan_ly_ban_hang;
create table customer(
c_id int primary key auto_increment,
c_name varchar(225),
c_age int
);
create table product(
p_id int primary key,
p_name varchar(225),
p_price float
);
create table `order`(
o_id int primary key auto_increment,
o_date date,
o_total_price float,
c_id int,
foreign key (c_id) references customer(c_id)
);
create table order_detail(
o_id int,
p_id int,
od_qty int,
primary key (o_id, p_id),
foreign key (o_id) references `order`(o_id),
foreign key (p_id) references product(p_id)
);
insert into customer(c_name, c_age)
value ('nguyen van a', 25),
('nguyen van b', 28),
('nguyen van c', 30);
insert into product(p_id, p_name, p_price)
value(0013, 'banh', 50000),
(0103, 'keo', 20000),
(0222, 'cam', 30000),
(0425, 'rau', 25000),
(0134, 'mì', 10000),
(0563, 'trung', 30000),
(2573, 'tom', 65000),
(2719, 'ca', 55000),
(1672, 'thit', 80000),
(2172, 'sua', 30000),
(3261, 'ca rot', 15000);