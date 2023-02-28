create database demo;
use demo;
create table products(
product_id int primary key,
product_code varchar(50),
product_name varchar(50),
product_price double,
product_amount int,
product_description varchar(255),
product_status varchar(50)
);
insert into products(product_id, product_code, product_name, product_price, product_amount, product_description, product_status)
value (1,'A001','TAO',14000,15,'DO','NEW'),
(2,'A015','CAM',17550,8,'VANG','NEW'),
(3,'A021','DAO',27000,22,'HONG','NEW');

select *
from Products;
create unique index index_product_code on Products(product_code);
create index index_product_name_and_price on Products(product_name,product_price);
explain select * from Products
where product_code = 'A001';
explain select * from Products
where product_name = 'TAO';
explain select * from Products
where product_price = 14000;

create view view_products
as select product_code, product_name, product_price, product_status
from products;
select *
from view_products;
update view_products set product_price = 25000 
where product_name = 'DAO';
drop view view_products;

delimiter $$
create procedure information_products() 
begin 
select *
from products;
end $$
delimiter ;
call information_products();

Delimiter $$
create procedure add_products()
begin
insert into products(product_id,product_code, product_name, product_price, product_amount, product_description, product_status)
value (4,'A027','NHO',50000,10,'XANH','NEW');
end $$
delimiter ;
call add_products();

Delimiter $$
create procedure update_product(in a int,
	product_id1 int,
    product_code1 varchar(25),
    product_name1 varchar(255),
    product_price1 float,
    product_amount1 int,
    product_description1 text,
    product_status1 varchar(25))
begin
update products
set
product_id = product_id1,
product_code = product_code1,
product_name = product_name1,
product_price = product_price1,
product_amount = product_amount1,
product_description = product_description1,
product_status = product_status1
where product_id = a ;
end $$
Delimiter ;
call update_product(2,5,'A015', 'CAM', 32000, 4,'CAM', 'OLD');

Delimiter $$
create procedure delete_product(in b int)
begin
delete 
from products
where product_id = b;
end $$
delimiter ;
call delete_product(5);
