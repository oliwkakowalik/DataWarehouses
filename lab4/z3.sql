USE [cwiczenia4_prod]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIMCustomers](
	[key] [int] IDENTITY(1,1),
	[id] [int] NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[street] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](50) NULL,
	[country] [varchar](50) NULL,
	[phone] [varchar](12) NULL,
	[email] [varchar](50) NULL,
	[EffStartDate] [date] NULL,
	[EffEndDate] [date] NULL
) ON [PRIMARY]
GO

