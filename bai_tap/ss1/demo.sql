CREATE DATABASE demo_ss12;
USE demo_ss12;
create table users (
 id  int(3) NOT NULL,
`name` varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);
insert into users(id, `name`, email, country) values(1,'Minh','minh@codegym.vn','Viet Nam');
insert into users(id, `name`, email, country) values(2,'Kante','kante@che.uk','Kenia');

Delimiter $$
create procedure show_list()
begin
select *
from users;
end $$
Delimiter ;
call show_list();

Delimiter $$
create procedure show_edit(in edit_id int, in edit_name varchar(120),in edit_email varchar(220), in edit_country varchar(120))
begin
update users
set `name`= edit_name,
email = edit_email,
country = edit_country
where id = edit_id;
end $$
Delimiter ;

Delimiter $$
create procedure show_delete(in delete_id int)
begin
delete 
from users
where id = delete_id;
end $$
Delimiter ;
