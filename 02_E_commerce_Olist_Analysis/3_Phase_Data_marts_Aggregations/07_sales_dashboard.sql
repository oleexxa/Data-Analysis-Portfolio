drop table if exists sales_dashboard;

create table sales_dashboard as
	select
	     year(o.order_purchase_timestamp)                                    as year
	    ,month(o.order_purchase_timestamp)                                   as month
	    ,c.customer_state
	    ,coalesce(nullif(pf.product_category_name, ''), 'unknown')           as product_category
	    ,sum(op.payment_value / oi_cnt.cnt)                                  as total_revenue
	    ,count(distinct o.order_id)                                          as total_orders
	from order_items as oi
	join orders as o on o.order_id = oi.order_id
	join (
	    select order_id, sum(payment_value) as payment_value
	    from order_payments
	    group by order_id
		) as op on op.order_id = oi.order_id
	join (
	    select order_id, count(*) as cnt
	    from order_items
	    group by order_id
		) as oi_cnt on oi_cnt.order_id = oi.order_id
	join customers as c on c.customer_id = o.customer_id
	join products_final as pf on pf.product_id = oi.product_id
	where o.order_status = 'delivered'
	group by year, month, c.customer_state, product_category;

select sum(total_revenue) from sales_dashboard;

select * from sales_dashboard limit 20;