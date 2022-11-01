USE [cwiczenia4_prod]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIMPizzaTypes](
	[key] [int] IDENTITY(1,1),
	[pizza_type_id] [varchar](50) NULL,
	[name] [varchar](50) NULL,
	[category] [varchar](50) NULL,
	[ingredients] [varchar](250) NULL,
	[pizza_id] [varchar](50) NULL,
	[size] [varchar](50) NULL,
	[price] [varchar](50) NULL,
	[EffStartDate] [date] NULL,
	[EffEndDate] [date] NULL
) ON [PRIMARY]
GO


