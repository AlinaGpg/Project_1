USE [Software products]
GO
/****** Object:  Table [dbo].[Expenses]    Script Date: 15.04.2022 8:20:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expenses](
	[Product number] [int] NOT NULL,
	[User] [varchar](50) NOT NULL,
	[Installation date] [date] NOT NULL,
	[Installation cost] [smallmoney] NOT NULL,
	[Number of licenses] [int] NOT NULL,
	[License cost] [smallmoney] NOT NULL,
	[Total costs] [smallmoney] NOT NULL,
 CONSTRAINT [PK_Expenses] PRIMARY KEY CLUSTERED 
(
	[Product number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Installation]    Script Date: 15.04.2022 8:20:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Installation](
	[Product number] [int] NOT NULL,
	[User] [varchar](50) NOT NULL,
	[Installation cost] [smallmoney] NOT NULL,
	[Installation date] [date] NOT NULL,
	[Number of licenses] [int] NOT NULL,
 CONSTRAINT [PK_Installation] PRIMARY KEY CLUSTERED 
(
	[Product number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Software product]    Script Date: 15.04.2022 8:20:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Software product](
	[Product code] [int] NOT NULL,
	[Product name] [varchar](50) NOT NULL,
	[Version] [int] NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Firm] [varchar](50) NOT NULL,
	[Release date] [date] NOT NULL,
	[License cost] [smallmoney] NOT NULL,
 CONSTRAINT [PK_Software product_1] PRIMARY KEY CLUSTERED 
(
	[Product code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Expenses] ([Product number], [User], [Installation date], [Installation cost], [Number of licenses], [License cost], [Total costs]) VALUES (1, N'Белый ветер', CAST(N'2000-02-01' AS Date), 3000.0000, 2, 3000.0000, 9000.0000)
INSERT [dbo].[Expenses] ([Product number], [User], [Installation date], [Installation cost], [Number of licenses], [License cost], [Total costs]) VALUES (2, N'Белый ветер', CAST(N'2000-02-05' AS Date), 2000.0000, 1, 2000.0000, 6000.0000)
INSERT [dbo].[Expenses] ([Product number], [User], [Installation date], [Installation cost], [Number of licenses], [License cost], [Total costs]) VALUES (3, N'Север', CAST(N'2001-09-18' AS Date), 1500.0000, 3, 1500.0000, 5000.0000)
INSERT [dbo].[Expenses] ([Product number], [User], [Installation date], [Installation cost], [Number of licenses], [License cost], [Total costs]) VALUES (4, N'Современные технологии', CAST(N'2001-12-28' AS Date), 1450.0000, 2, 1450.0000, 4000.0000)
INSERT [dbo].[Expenses] ([Product number], [User], [Installation date], [Installation cost], [Number of licenses], [License cost], [Total costs]) VALUES (5, N'Восток', CAST(N'2002-04-15' AS Date), 850.0000, 1, 850.0000, 2500.0000)
GO
INSERT [dbo].[Installation] ([Product number], [User], [Installation cost], [Installation date], [Number of licenses]) VALUES (1, N'Белый ветер', 3000.0000, CAST(N'2000-02-01' AS Date), 2)
INSERT [dbo].[Installation] ([Product number], [User], [Installation cost], [Installation date], [Number of licenses]) VALUES (2, N'Белый ветер', 2000.0000, CAST(N'2000-02-05' AS Date), 1)
INSERT [dbo].[Installation] ([Product number], [User], [Installation cost], [Installation date], [Number of licenses]) VALUES (3, N'Север', 1500.0000, CAST(N'2001-09-18' AS Date), 3)
INSERT [dbo].[Installation] ([Product number], [User], [Installation cost], [Installation date], [Number of licenses]) VALUES (4, N'Современные технологии', 1450.0000, CAST(N'2001-12-28' AS Date), 2)
INSERT [dbo].[Installation] ([Product number], [User], [Installation cost], [Installation date], [Number of licenses]) VALUES (5, N'Восток', 850.0000, CAST(N'2002-04-15' AS Date), 1)
GO
INSERT [dbo].[Software product] ([Product code], [Product name], [Version], [Type], [Firm], [Release date], [License cost]) VALUES (1, N'1С: Бухгалтерия', 8, N'Прикладные программы', N'1С', CAST(N'2014-06-01' AS Date), 3000.0000)
INSERT [dbo].[Software product] ([Product code], [Product name], [Version], [Type], [Firm], [Release date], [License cost]) VALUES (2, N'Microsoft office', 21, N'Пакет офисных приложений', N'Microsoft', CAST(N'1990-11-19' AS Date), 2000.0000)
INSERT [dbo].[Software product] ([Product code], [Product name], [Version], [Type], [Firm], [Release date], [License cost]) VALUES (3, N'Kaspersky Antivirus', 20, N'Антивирусное программное обеспечение', N'Лаборатория Касперского', CAST(N'1997-10-23' AS Date), 1500.0000)
INSERT [dbo].[Software product] ([Product code], [Product name], [Version], [Type], [Firm], [Release date], [License cost]) VALUES (4, N'ESET NOD32', 15, N'Антивирусное программное обеспечение', N'ESET', CAST(N'1987-03-12' AS Date), 1450.0000)
INSERT [dbo].[Software product] ([Product code], [Product name], [Version], [Type], [Firm], [Release date], [License cost]) VALUES (5, N'DMarket', 20, N'Онлайн-сервис продажи', N'DMarket', CAST(N'1991-08-17' AS Date), 850.0000)
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [FK_Expenses_Software product] FOREIGN KEY([Product number])
REFERENCES [dbo].[Software product] ([Product code])
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [FK_Expenses_Software product]
GO
ALTER TABLE [dbo].[Installation]  WITH CHECK ADD  CONSTRAINT [FK_Installation_Software product] FOREIGN KEY([Product number])
REFERENCES [dbo].[Software product] ([Product code])
GO
ALTER TABLE [dbo].[Installation] CHECK CONSTRAINT [FK_Installation_Software product]
GO
