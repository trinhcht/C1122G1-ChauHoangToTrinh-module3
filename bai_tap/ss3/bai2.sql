use quan_ly_ban_hang;
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select order_id, order_date, order_total_price
from is_order;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.customer_name,p.product_name 
from quan_ly_ban_hang.customer as c 
join quan_ly_ban_hang.is_order as o on c.customer_id = o.customer_id
join quan_ly_ban_hang.order_detail as od on o.order_id = od.order_id
join quan_ly_ban_hang.product as p on od.product_id = p.product_id;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select customer_name 
from quan_ly_ban_hang.customer as c 
left join quan_ly_ban_hang.is_order as o on c.customer_id = o.customer_id
where order_id is null;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice) 
update quan_ly_ban_hang.is_order as o 
join quan_ly_ban_hang.order_detail as od on o.order_id = od.order_id
join quan_ly_ban_hang.product as p on od.product_id = p.product_id 
set order_total_price = order_qty * product_price;
select order_id, order_date, order_total_price 
from quan_ly_ban_hang.is_order;
