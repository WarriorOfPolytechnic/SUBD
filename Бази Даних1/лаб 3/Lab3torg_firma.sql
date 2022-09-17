create database Lab3torg_firma
go 
USE [Lab3torg_firma]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[klient](
	[id_klient] [int] NOT NULL,
	[Nazva] [varchar](50) NULL,
	[Adress] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Tel] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_klient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[postachalnik]    Script Date: 20.09.2017 9:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[postachalnik](
	[id_postach] [int] NOT NULL,
	[Nazva] [varchar](50) NULL,
	[Adress] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Tel] [varchar](50) NULL,
	[Kontakt_osoba] [varchar](50) NULL,
	[Posada] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_postach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sotrudnik]    Script Date: 20.09.2017 9:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sotrudnik](
	[id_sotrud] [int] NOT NULL,
	[Fname] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Lname] [varchar](50) NULL,
	[Posada] [varchar](50) NULL,
	[Adress] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Home_tel] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_sotrud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tovar]    Script Date: 20.09.2017 9:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tovar](
	[id_tovar] [int] IDENTITY(1,1) NOT NULL,
	[Nazva] [varchar](50) NULL,
	[Price] [decimal](6, 2) NULL,
	[NaSklade] [int] NULL,
	[id_postav] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tovar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zakaz]    Script Date: 20.09.2017 9:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zakaz](
	[id_zakaz] [int] IDENTITY(1,1) NOT NULL,
	[id_klient] [int] NOT NULL,
	[id_sotrud] [int] NOT NULL,
	[date_rozm] [datetime] NULL,
	[date_naznach]  AS (dateadd(day,(10),CONVERT([date],[date_rozm]))),
PRIMARY KEY CLUSTERED 
(
	[id_zakaz] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zakaz_tovar]    Script Date: 20.09.2017 9:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zakaz_tovar](
	[id_zakaz] [int] NOT NULL,
	[id_tovar] [int] NOT NULL,
	[Kilkist] [int] NOT NULL,
	[Znigka] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_zakaz] ASC,
	[id_tovar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

INSERT [dbo].[klient] ([id_klient], [Nazva], [Adress], [City], [Tel], [Email]) VALUES (1, N'ПП Стоян С.В.', N'вул. Бердичівська 10', N'Житомир', N'0504345566', NULL)
INSERT [dbo].[klient] ([id_klient], [Nazva], [Adress], [City], [Tel], [Email]) VALUES (2, N'ТОВ "Арей"', N'вул. Київська 7', N'Житомир', N'0678889994', N'arey@gmail.com')
INSERT [dbo].[klient] ([id_klient], [Nazva], [Adress], [City], [Tel], [Email]) VALUES (3, N'ПП Апин В.С.', N'вул. Короленка 9', N'Київ', N'0501112233', N'apin@gmail.com')
INSERT [dbo].[klient] ([id_klient], [Nazva], [Adress], [City], [Tel], [Email]) VALUES (4, N'ПП Кочерга А.Г', N'вул. Михайлівска 17в', N'Житомир', N'0504345566', N'kocherga"gmail.com')
INSERT [dbo].[klient] ([id_klient], [Nazva], [Adress], [City], [Tel], [Email]) VALUES (5, N'ТОВ "Рудь"', N'вул. Комерційна 1', N'Житомир', N'0678889994', N'rud@gmail.com')
INSERT [dbo].[klient] ([id_klient], [Nazva], [Adress], [City], [Tel], [Email]) VALUES (6, N'ПП  Влащук О.С.', N'вул. Жуйка 5', N'Київ', N'0501112233', NULL)
INSERT [dbo].[postachalnik] ([id_postach], [Nazva], [Adress], [City], [Tel], [Kontakt_osoba], [Posada]) VALUES (1, N'ПП Фриз Н.Н.', N'вул. Бердичівська 46', N'Житомир', N'0509998877', N'Фриз Н.Н.', N'')
INSERT [dbo].[postachalnik] ([id_postach], [Nazva], [Adress], [City], [Tel], [Kontakt_osoba], [Posada]) VALUES (2, N'ТОВ "Арей"', N'вул. Київська 7', N'Житомир', N'0678889994', N'Петров С.К', N'менеджер')
INSERT [dbo].[postachalnik] ([id_postach], [Nazva], [Adress], [City], [Tel], [Kontakt_osoba], [Posada]) VALUES (3, N'Краз Н.Н', N'вул. Вітрука 9', N'Київ', N'0974445544', N'Краз Н.Н.', N'')
INSERT [dbo].[postachalnik] ([id_postach], [Nazva], [Adress], [City], [Tel], [Kontakt_osoba], [Posada]) VALUES (4, N'ЗАТ Кочерга А.Г', N'вул. Михайлівска 17в', N'Житомир', N'0509998877', N'Кочерга А.Г', N'Директор')
INSERT [dbo].[postachalnik] ([id_postach], [Nazva], [Adress], [City], [Tel], [Kontakt_osoba], [Posada]) VALUES (5, N'ТОВ "Рудь"', N'вул. Комерційна 1', N'Житомир', N'0678889994', N'Рудь С.К', N'менеджер')
INSERT [dbo].[postachalnik] ([id_postach], [Nazva], [Adress], [City], [Tel], [Kontakt_osoba], [Posada]) VALUES (6, N'ЗАТ Влащук О.С.', N'вул. Жуйка 5', N'Київ', N'0974445544', N'Влащук О.С.', N'')
INSERT [dbo].[sotrudnik] ([id_sotrud], [Fname], [Name], [Lname], [Posada], [Adress], [City], [Home_tel]) VALUES (1, N'Крув', N'Наталія', N'Сергіївна', N'Продавець', N'вул. Бердичівська 67 кв.20', N'Житомир', N'0509998877')
INSERT [dbo].[sotrudnik] ([id_sotrud], [Fname], [Name], [Lname], [Posada], [Adress], [City], [Home_tel]) VALUES (2, N'Петренко', N'Олексій', N'Геннадійович', N'Продавець', N'вул. Вітрука 20 кв.50', N'Житомир', N'0506667788')
INSERT [dbo].[sotrudnik] ([id_sotrud], [Fname], [Name], [Lname], [Posada], [Adress], [City], [Home_tel]) VALUES (3, N'Хмельник', N'Олена', N'Петрівна', N'Продавець-консультант', N'вул. Київська 67 кв.20', N'Житомир', N'0509998877')
INSERT [dbo].[sotrudnik] ([id_sotrud], [Fname], [Name], [Lname], [Posada], [Adress], [City], [Home_tel]) VALUES (4, N'Крамарчук', N'Андрій', N'Олександрович', N'Продавець', N'вул. Бердичівська 12 кв.20', N'Житомир', N'0509998877')
INSERT [dbo].[sotrudnik] ([id_sotrud], [Fname], [Name], [Lname], [Posada], [Adress], [City], [Home_tel]) VALUES (5, N'Дмитренко', N'Данило', N'Миколайович', N'Продавець', N'вул. Чуднівська 20 кв.50', N'Житомир', N'0506667788')
INSERT [dbo].[sotrudnik] ([id_sotrud], [Fname], [Name], [Lname], [Posada], [Adress], [City], [Home_tel]) VALUES (6, N'Захарчук', N'Андрій', N'Євгенійович', N'Продавець-консультант', N'вул. Комерційна 67 кв.20', N'Житомир', N'0509998877')

SET IDENTITY_INSERT [dbo].[tovar] ON 

INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (1, N'Молоко', CAST(18.00 AS Decimal(6, 2)), 50, 1)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (2, N'Молоко', CAST(16.00 AS Decimal(6, 2)), 50, 2)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (3, N'Кефир', CAST(21.00 AS Decimal(6, 2)), 25, 3)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (4, N'Сметана', CAST(10.00 AS Decimal(6, 2)), 30, 2)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (5, N'Творог', CAST(35.00 AS Decimal(6, 2)), 10, 5)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (6, N'Молоко', CAST(18.00 AS Decimal(6, 2)), 50, 1)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (7, N'Молоко', CAST(16.00 AS Decimal(6, 2)), 50, 5)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (8, N'Кефир', CAST(21.00 AS Decimal(6, 2)), 25, 3)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (9, N'Сметана', CAST(10.00 AS Decimal(6, 2)), 30, 2)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (10, N'Творог', CAST(35.00 AS Decimal(6, 2)), 10, 6)
SET IDENTITY_INSERT [dbo].[tovar] OFF
SET IDENTITY_INSERT [dbo].[zakaz] ON 

INSERT [dbo].[zakaz] ([id_zakaz], [id_klient], [id_sotrud], [date_rozm]) VALUES (1, 3, 2, CAST(N'2020-11-05T07:11:51.293' AS DateTime))
INSERT [dbo].[zakaz] ([id_zakaz], [id_klient], [id_sotrud], [date_rozm]) VALUES (2, 2, 2, NULL)
INSERT [dbo].[zakaz] ([id_zakaz], [id_klient], [id_sotrud], [date_rozm]) VALUES (3, 1, 3, CAST(N'2020-11-03T07:11:51.293' AS DateTime))
INSERT [dbo].[zakaz] ([id_zakaz], [id_klient], [id_sotrud], [date_rozm]) VALUES (4, 6, 4, NULL)
INSERT [dbo].[zakaz] ([id_zakaz], [id_klient], [id_sotrud], [date_rozm]) VALUES (5, 5, 3, NULL)
INSERT [dbo].[zakaz] ([id_zakaz], [id_klient], [id_sotrud], [date_rozm]) VALUES (6, 2, 6, CAST(N'2020-10-01T07:11:51.297' AS DateTime))
INSERT [dbo].[zakaz] ([id_zakaz], [id_klient], [id_sotrud], [date_rozm]) VALUES (7, 4, 6, CAST(N'2020-09-22T07:11:51.297' AS DateTime))
INSERT [dbo].[zakaz] ([id_zakaz], [id_klient], [id_sotrud], [date_rozm]) VALUES (8, 6, 2, CAST(N'2020-10-11T07:11:51.297' AS DateTime))
INSERT [dbo].[zakaz] ([id_zakaz], [id_klient], [id_sotrud], [date_rozm]) VALUES (9, 4, 1, CAST(N'2020-10-16T07:11:51.297' AS DateTime))
SET IDENTITY_INSERT [dbo].[zakaz] OFF
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (1, 1, 32, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (1, 4, 5, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (2, 1, 43, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (2, 2, 48, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (2, 3, 7, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (3, 1, 17, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (3, 2, 16, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (3, 3, 9, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (3, 4, 16, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (3, 5, 21, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (4, 1, 2, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (4, 4, 13, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (5, 1, 2, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (5, 2, 15, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (5, 5, 11, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (5, 6, 48, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (6, 3, 35, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (6, 4, 36, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (6, 6, 21, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (7, 2, 42, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (7, 4, 7, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (7, 5, 1, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (8, 2, 20, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (8, 3, 20, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (8, 4, 7, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (8, 6, 9, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (9, 2, 45, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (9, 4, 39, 0)
INSERT [dbo].[zakaz_tovar] ([id_zakaz], [id_tovar], [Kilkist], [Znigka]) VALUES (9, 5, 3, 0)
ALTER TABLE [dbo].[tovar]  WITH CHECK ADD FOREIGN KEY([id_postav])
REFERENCES [dbo].[postachalnik] ([id_postach])
GO
ALTER TABLE [dbo].[zakaz]  WITH CHECK ADD FOREIGN KEY([id_klient])
REFERENCES [dbo].[klient] ([id_klient])
GO
ALTER TABLE [dbo].[zakaz]  WITH CHECK ADD FOREIGN KEY([id_sotrud])
REFERENCES [dbo].[sotrudnik] ([id_sotrud])
GO
ALTER TABLE [dbo].[zakaz_tovar]  WITH CHECK ADD FOREIGN KEY([id_tovar])
REFERENCES [dbo].[tovar] ([id_tovar])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[zakaz_tovar]  WITH CHECK ADD FOREIGN KEY([id_zakaz])
REFERENCES [dbo].[zakaz] ([id_zakaz])
ON UPDATE CASCADE
ON DELETE CASCADE
GO


/*3.1 Перелік замовлень до певної дати для товару молоко*/
SELECT zakaz.id_zakaz, zakaz.date_rozm, tovar.Nazva
FROM zakaz 
INNER JOIN zakaz_tovar on zakaz.id_zakaz = zakaz_tovar.id_zakaz INNER JOIN tovar on tovar.id_tovar = zakaz_tovar.id_tovar
WHERE tovar.Nazva like 'Молоко%' and zakaz.date_rozm<'2020-10-10';

/*3.2 Перелік товарів ціна яких знаходиться в заданому діапазоні і кількість на складі не менше  за 15 одиниць*/
SELECT Nazva, Price, NaSklade
FROM tovar
WHERE Price BETWEEN '18' and '21'  and NaSklade >15;

/*3.3 Перелік замовлень для яких не визначено дату виконання*/
SELECT zakaz.*
FROM zakaz
WHERE zakaz.date_rozm is NULL ;


/*3.4 Перелік товарів певного постачальника наявних у визначеній кількості*/
SELECT tovar.*, postachalnik.Nazva
FROM tovar INNER JOIN postachalnik ON tovar.id_postav = postachalnik.id_postach
WHERE postachalnik.Nazva like 'ТОВ "РУДЬ"%' and tovar.NaSklade BETWEEN '10' and '10';

/*3.5Визначити вартість всіх замовлених товарів за останні 30 днів, якщо постачальники є ТОВ*/
SELECT SUM(tovar.Price)AS summa
FROM tovar
inner join zakaz_tovar ON tovar.id_tovar = zakaz_tovar.id_tovar
inner join zakaz ON zakaz_tovar.id_zakaz = zakaz.id_zakaz
inner join postachalnik ON tovar.id_postav = postachalnik.id_postach
WHERE postachalnik.Nazva like 'ТОВ%' AND zakaz.date_rozm > dateadd(day, -30, getdate());

/*3.6 Визначити коди співробітників та дати, коли вони  обслуговували замовлення від певного клієнту*/
SELECT sotrudnik.id_sotrud, sotrudnik.Fname, zakaz.date_rozm, zakaz.id_klient, klient.Nazva
FROM sotrudnik inner join zakaz ON sotrudnik.id_sotrud = zakaz.id_sotrud inner join klient on zakaz.id_klient = klient.id_klient
WHERE klient.Nazva like'ПП Кочерга%';

/*3.7Перелік постачальників що є ЗАТ і не постачали товарів*/
SELECT postachalnik.Nazva 
FROM postachalnik
FULL OUTER JOIN tovar ON tovar.id_postav = postachalnik.id_postach
WHERE postachalnik.Nazva like 'ЗАТ%' and not exists(select tovar.id_postav FROM tovar WHERE tovar.id_postav = postachalnik.id_postach);

/*3.8 Перелік клієнтів що є ПП і купували товари в попередньому місяці*/
SELECT klient.*
FROM klient
JOIN zakaz ON klient.id_klient = zakaz.id_klient
WHERE klient.Nazva like 'ПП%' and zakaz.date_rozm > dateadd(MONTH, -1, getdate()) AND klient.Nazva like '%';

/*3.9 Перелік співробітників, на ім‘я Андрій впорядкувати за абеткою*/
SELECT sotrudnik.*
FROM sotrudnik
WHERE sotrudnik.Name like 'Андрій%'
ORDER BY sotrudnik.Name;

/*3.10 Перелік клієнтів що мають e-mail впорядкувати за id*/
SELECT klient.*
FROM klient
WHERE klient.Email IS NOT NULL
ORDER BY klient.id_klient;