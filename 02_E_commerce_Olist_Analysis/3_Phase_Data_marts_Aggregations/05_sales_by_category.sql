update products_final as pf
join product_category_name_translation as pc on pf.product_category_name = pc.product_category_name
set pf.product_category_name = pc.product_category_name_english;

select * from products_final

drop table if exists sales_by_category

create table sales_by_category as
select 
	coalesce(nullif(pf.product_category_name, ''), 'unknown')		as product_category
	,sum(payment_value)								as total_revenue
	,count(distinct oi.order_id)					as total_orders
from order_items as oi
join orders as o on o.order_id = oi.order_id
join order_payments as op on op.order_id = oi.order_id
join products_final as pf on pf.product_id = oi.product_id
where order_status = 'delivered'
group by coalesce(nullif(pf.product_category_name, ''), 'unknown')	

select * from sales_by_category

select count(*) from products_final 
where product_category_name = '' or product_category_name is null;