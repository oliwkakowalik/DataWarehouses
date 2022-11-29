use projektProd;

-- œrednia krocz¹ca dla danego dnia oraz 5 poprzednich 
with tmp as (
	select 
	sum(cast(amount as decimal(10, 2))) as amount,
	cast(SUBSTRING(cast(DateKey as varchar), 7, 2) as int) as day,
	cast(SUBSTRING(cast(DateKey as varchar), 5, 2) as int) as month
	from [dbo].[factTable]
	group by cast(SUBSTRING(cast(DateKey as varchar), 7, 2) as int),
	cast(SUBSTRING(cast(DateKey as varchar), 5, 2) as int)
)

select 
amount, 
avg(cast(amount as decimal(10, 2)))
over (order by month, day rows between 5 preceding and current row) as moving_average,
month,
day
from tmp;

-- percentyle pod k¹tem sumarycznej sprzeda¿y policzone dla firm dostarczj¹cych w 2006 roku
with tmp as(
	select 
	CarrierKey, 
	sum(cast(amount as decimal(10, 2))) as amount
	from [dbo].[factTable]
	where SUBSTRING(cast(DateKey as varchar), 1, 4) = '2006'
	group by CarrierKey
)

select 
tmp.CarrierKey, 
tmp.amount, percent_rank() over (order by tmp.amount) as Percentiles, 
DIMcarrier.carrier_name
from tmp 
JOIN dbo.DIMcarrier
on DIMcarrier.CarrierKey = tmp.CarrierKey
order by tmp.CarrierKey;

-- ranking miast z najwieksz¹ sprzeda¿¹ w 2006
select 
DIMc.city as city,
sum(cast(amount as decimal(10, 2))) as amount,
rank() over (partition by cast(SUBSTRING(cast(DateKey as varchar), 1, 4) as int) order by sum(cast(amount as decimal(10, 2))) desc) as Rank
from factTable ft
join DIMcustomers DIMc on ft.CustomerKey = DIMc.CustomerKey
where  SUBSTRING(cast(DateKey as varchar), 1, 4) = '2006'
group by cube(DIMc.city, cast(SUBSTRING(cast(DateKey as varchar), 1, 4) as int));