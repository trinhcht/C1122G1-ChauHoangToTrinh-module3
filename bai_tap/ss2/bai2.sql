create database quan_ly_ban_hang;
use quan_ly_ban_hang;
create table customer(
customer_id int primary key auto_increment,
customer_name varchar(225),
customer_age int
);
create table product(
product_id int primary key auto_increment,
product_name varchar(225),
product_price float
);
create table is_order(
order_id int primary key auto_increment,
order_date date,
order_total_price float,
customer_id int,
foreign key (customer_id) references customer(customer_id)
);
create table order_detail(
order_id int,
product_id int,
order_qty int,
primary key (order_id, product_id),
foreign key (order_id) references is_order(order_id),
foreign key (product_id) references product(product_id)
);
insert into customer(customer_name, customer_age)
value ('Minh Quan', 15),
('Ngoc Oanh', 20),
('Hong Ha', 50);
insert into product(product_name, product_price)
value('May Giat', 3),
('Tu Lanh', 5),
('Dieu Hoa',7),
('Quat', 1),
('Bep Dien', 2);
insert into is_order(order_date, order_total_price,customer_id)
value ('2006-03-21',null,1),
('2006-03-23', null,2),
('2006-03-16', null, 1);
insert into order_detail(order_id, product_id,order_qty)
value (1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);