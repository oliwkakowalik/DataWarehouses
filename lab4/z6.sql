USE [cwiczenia4_prod]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIMCarrier](
	[key] [int] IDENTITY(1,1),
	[carrier_id] [int] NULL,
	[carrier_name] [varchar](4) NULL,
	[address] [varchar](50) NULL,
	[tax_id] [int] NULL,
	[contact_person] [varchar](19) NULL,
	[EffStartDate] [date] NULL,
	[EffEndDate] [date] NULL
) ON [PRIMARY]
GO


