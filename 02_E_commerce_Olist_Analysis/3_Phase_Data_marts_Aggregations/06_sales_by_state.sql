create table sales_by_state as
select 
	customer_state
	,sum(payment_value)							as total_revenue
	,count(distinct o.order_id)					as total_orders
from customers as c
join orders as o on o.customer_id = c.customer_id
join order_payments as op on op.order_id = o.order_id
where order_status = 'delivered'
group by customer_state

select * from sales_by_state
