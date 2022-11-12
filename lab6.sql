-- 1
with tmp as (
	select 
	sum([Amount]) as amount,
	day([Date]) as day,
	month([Date]) as month
	from [AdventureWorksDW2019].[dbo].[FactFinance]
	group by day([Date]), month([Date])
)

select 
amount, 
avg(amount)
over (order by month, day rows between 3 preceding and current row) as moving_average,
month,
day
from tmp

-- 2
select OrderDateMonth as month_of_year,isnull([0], 0) as [0], isnull([1], 0) as [1],isnull([2], 0) as [2],
	isnull([3], 0) as [3], isnull([4], 0) as [4], isnull([5], 0) as [5],isnull([6], 0) as [6],isnull([7], 0) as [7],
	isnull([8], 0) as [8], isnull([9], 0) as [9], isnull([10], 0) as [10]
from  (
  select 
  SalesTerritoryKey,
  month(OrderDate) as OrderDateMonth,
  sum(SalesAmount) as SalesAmount
  from  [AdventureWorksDW2019].[dbo].[FactInternetSales]
  where year(OrderDate) = 2011
  group by month(OrderDate),SalesTerritoryKey
) as SourceTable  
PIVOT  
(  
  sum(SalesAmount)  
  for SalesTerritoryKey IN ([0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10]) 
) as PivotTable;

-- 3
select 
OrganizationKey,
DepartmentGroupKey,
sum(amount) as amount
from [AdventureWorksDW2019].[dbo].[FactFinance]
group by rollup(OrganizationKey, DepartmentGroupKey)
order by OrganizationKey

-- 4
select 
OrganizationKey,
DepartmentGroupKey,
sum(amount) as amount
from [AdventureWorksDW2019].[dbo].[FactFinance]
group by cube(OrganizationKey, DepartmentGroupKey)
order by OrganizationKey
 
-- 5
with tmp as(
	select 
	OrganizationKey, 
	sum(Amount) as amount
	from [AdventureWorksDW2019].[dbo].[FactFinance]
	where year(Date) = 2012
	group by OrganizationKey
)

select 
tmp.OrganizationKey, 
tmp.amount, percent_rank() over (order by tmp.amount) as Percentiles, 
DIMorg.OrganizationName
from tmp 
JOIN [AdventureWorksDW2019].[dbo].[DimOrganization] as DIMorg
on DIMorg.OrganizationKey = tmp.OrganizationKey
order by tmp.OrganizationKey

-- 6 
with tmp as(
	select 
	OrganizationKey, 
	sum(Amount) as amount
	from [AdventureWorksDW2019].[dbo].[FactFinance]
	where year(Date) = 2012
	group by OrganizationKey
)

select 
tmp.OrganizationKey, 
tmp.amount, percent_rank() over (order by tmp.amount) as Percentiles, 
STDEV(tmp.amount) over (order by tmp.amount) AS stdDev,
DIMorg.OrganizationName
from tmp 
JOIN [AdventureWorksDW2019].[dbo].[DimOrganization] as DIMorg
on DIMorg.OrganizationKey = tmp.OrganizationKey
order by tmp.OrganizationKey