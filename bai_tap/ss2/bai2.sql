create database quan_ly_ban_hang;
use quan_ly_ban_hang;
create table customer(
customer_id int primary key auto_increment,
customer_name varchar(225),
customer_age int
);
create table product(
product_id int primary key,
product_name varchar(225),
product_price float
);
create table `order`(
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
foreign key (order_id) references `order`(order_id),
foreign key (product_id) references product(product_id)
);
insert into customer(customer_name, customer_age)
value ('nguyen van a', 25),
('nguyen van b', 28),
('nguyen van c', 30);
insert into product(product_id, product_name, product_price)
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
insert into `order`(order_date, order_total_price,customer_id)
value ('2023-02-20', 70000,1),
('2023-02-21',50000,2);
insert into order_detail(order_id, product_id,order_qty)
value (1,0013,1),
(2,0425,2);