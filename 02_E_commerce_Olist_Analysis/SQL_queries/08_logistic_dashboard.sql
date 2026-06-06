drop table if exists logistic_performance;

create table logistic_performance as
select
     c.customer_state as `state`
    ,year(o.order_purchase_timestamp) as `year`
    ,month(o.order_purchase_timestamp) as `month`
    ,date_format(o.order_purchase_timestamp, '%Y-%m') as `year_month`
    ,date_format(o.order_purchase_timestamp, '%M') as `month_name`
    ,count(o.order_id) as total_orders
    ,round(sum(p.total_order_value), 2) as total_revenue
    ,round(avg(p.total_order_value), 2) as avg_order_value
    ,round(avg(datediff(o.order_estimated_delivery_date, o.order_purchase_timestamp)), 1) as promised_delivery_time
    ,round(avg(datediff(o.order_delivered_customer_date, o.order_purchase_timestamp)), 1) as actual_delivery_time
    ,round(avg(datediff(o.order_delivered_customer_date, o.order_estimated_delivery_date)), 1) as avg_delay_days
    ,round(100.0 * sum(case when date(o.order_delivered_customer_date) > date(o.order_estimated_delivery_date) then 1 else 0 end) / count(*), 1) as pct_late
    ,sum(case when date(o.order_delivered_customer_date) > date(o.order_estimated_delivery_date) then 1 else 0 end) as late_orders
    ,sum(case when date(o.order_delivered_customer_date) < date(o.order_estimated_delivery_date) then 1 else 0 end) as early_orders
    ,sum(case when date(o.order_delivered_customer_date) = date(o.order_estimated_delivery_date) then 1 else 0 end) as on_time_orders
from orders o
join customers c on o.customer_id = c.customer_id
left join (
    select order_id, sum(payment_value) as total_order_value
    from order_payments
    group by order_id
) p on o.order_id = p.order_id
where o.order_status = 'delivered'
  and o.order_delivered_customer_date is not null and o.order_delivered_customer_date != ''
  and o.order_estimated_delivery_date is not null and o.order_estimated_delivery_date != ''
  and o.order_purchase_timestamp is not null and o.order_purchase_timestamp != ''
group by 
     c.customer_state
    ,year(o.order_purchase_timestamp)
    ,month(o.order_purchase_timestamp)
    ,date_format(o.order_purchase_timestamp, '%Y-%m')
    ,date_format(o.order_purchase_timestamp, '%M')
order by `year` desc, `month` desc, total_orders desc;

select * from logistic_performance