drop table if exists sales_trends;

create table sales_trends as
select
	year
		,month
		,total_revenue
		,number_of_orders
	    ,number_of_customer
	    ,avg_order_value
	    ,prev_month_revenue
	    ,round(((total_revenue-prev_month_revenue)/prev_month_revenue) * 100, 2 ) as mom_growth_pct
from (
	select 
		year
		,month
		,total_revenue
		,number_of_orders
	    ,number_of_customer
	    ,avg_order_value
	    ,lag(total_revenue) over (order by year, month) as prev_month_revenue
	from (
			select
				cast(year(order_purchase_timestamp) as char)				as year
				,month(order_purchase_timestamp)  							as month
				,sum(payment_value) 										as total_revenue
				,count(distinct o.order_id) 								as number_of_orders
				,count(distinct customer_unique_id)                 		as number_of_customer
				,round(sum(payment_value) /count(distinct o.order_id), 2 )	as  avg_order_value
			from orders o
			join order_payments p 	on o.order_id = p.order_id
			join customers c 		on o.customer_id = c.customer_id
			where order_status = 'delivered'
			group by 1, 2
	) as monthly_data
    ) as monthly_with_lag;
			

SELECT * FROM sales_trends;

SELECT year, month, COUNT(*) 
FROM sales_trends 
GROUP BY year, month 
HAVING COUNT(*) > 1;