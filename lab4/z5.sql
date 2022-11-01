create table  [dbo].[DIMDate] (
	[key] int NOT NULL, 
	[date] date NOT NULL, 
	[day] int NOT NULL,
	[week] int NOT NULL,
	[month] int NOT NULL,
	[quarter] int NOT NULL,
	[year] int NOT NULL
);

declare @CurrentDate date = '2015-01-01'
declare @EndDate date = dateadd(day, -1, dateadd(year, 10, @CurrentDate));

while @CurrentDate < @EndDate
begin 
	insert into [dbo].[DIMDate] (
		[key],
		[date],
		[day],
		[week],
		[month],
		[quarter],
		[year]
	)
	select [key] = year(@CurrentDate) * 1000 + month(@CurrentDate) * 100 + day(@CurrentDate),
		   [date] = @CurrentDate,
		   [day] = day(@CurrentDate),
		   [week] = datepart(wk, @CurrentDate),
		   [month] = month(@CurrentDate),
		   [quarter] = datepart(q, @CurrentDate),
		   [year] = year(@CurrentDate)


	set @CurrentDate = dateadd(DD, 1, @CurrentDate)
end

select * from [dbo].[DIMDate]

