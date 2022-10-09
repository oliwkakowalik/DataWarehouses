-- 1
with tmp as (
	select sum(p.price * od.quantity) as totalPrice
	from pizzas as p 
	join order_details as od on p.pizza_id = od.pizza_id
	join orders as o on o.order_id = od.order_id
	where o.date like '2015-02-18'
	group by o.order_id)

select avg(totalPrice) as avgPrice from tmp

-- 2
with tmp as(
	select od.order_id, STRING_AGG(pt.ingredients, ',') as ingredients
	from order_details as od
	join pizzas as p on p.pizza_id = od.pizza_id
	join pizza_types as pt on p.pizza_type_id = pt.pizza_type_id
	join orders as o on o.order_id = od.order_id
	where o.date LIKE '2015-03-%'
	group by od.order_id
)

select order_id, ingredients
from tmp
where ingredients not like '%Pineapple%'

-- 3
with tmp as (
	select sum(p.price * od.quantity) as orderPrice, o.order_id as id
	from order_details as od
	join pizzas as p on p.pizza_id = od.pizza_id 
	join orders as o on o.order_id = od.order_id 
	where o.date like '2015-02-%'
	group by o.order_id
)

select top(10) orderPrice, id, rank () over (order by orderPrice desc) rank_no 
from tmp

-- 4
with allOrders as (
	select o.order_id, sum(p.price * od.quantity) as orderPrice, o.date as orderDate
	from orders as o
	join order_details as od on o.order_id = od.order_id
	join pizzas as p on p.pizza_id = od.pizza_id
	group by o.date, o.order_id
),

months as (
		select avg(orderPrice) as monthAvg, month(orderDate) as monthOfOrder
		from allOrders
		group by month(orderDate)
)

select aO.order_id, aO.orderPrice, m.monthAvg, aO.orderDate
from allOrders as aO
join months as m on m.monthOfOrder = MONTH(aO.orderDate)

-- 5
select count(o.order_id) as orderCount, left(o.time, 2) as orderHour
from orders as o
where o.date like '2015-01-01'
group by left(time, 2), date

-- 6
select pt.name, pt.category, count(pt.category) as pizzasCount
from pizza_types as pt
join pizzas as p on p.pizza_type_id = pt.pizza_type_id
join order_details as od on od.pizza_id = p.pizza_id
join orders as o on o.order_id = od.order_details_id
where o.date like '2015-01-%'
group by p.pizza_type_id, pt.name, pt.category

-- 7
select p.size, sum(od.quantity) as amount 
from pizzas as p 
join order_details as od on p.pizza_id = od.pizza_id
join orders as o on o.order_id = od.order_id
where o.date like '2015-02%' or o.date like '2015-03%'
group by size