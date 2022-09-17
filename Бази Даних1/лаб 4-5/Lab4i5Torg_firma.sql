create database Lab4torg_firma
go
USE [Lab4torg_firma]  
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

INSERT [dbo].[klient] ([id_klient], [Nazva], [Adress], [City], [Tel], [Email]) VALUES (1, N'�� ����� �.�.', N'���. ������������ 10', N'�������', N'0504345566', NULL)
INSERT [dbo].[klient] ([id_klient], [Nazva], [Adress], [City], [Tel], [Email]) VALUES (2, N'��� "����"', N'���. ������� 7', N'�������', N'0678889994', N'arey@gmail.com')
INSERT [dbo].[klient] ([id_klient], [Nazva], [Adress], [City], [Tel], [Email]) VALUES (3, N'�� ���� �.�.', N'���. ��������� 9', N'���', N'0501112233', N'apin@gmail.com')
INSERT [dbo].[klient] ([id_klient], [Nazva], [Adress], [City], [Tel], [Email]) VALUES (4, N'�� ������� �.�', N'���. ���������� 17�', N'�������', N'0504345566', N'kocherga"gmail.com')
INSERT [dbo].[klient] ([id_klient], [Nazva], [Adress], [City], [Tel], [Email]) VALUES (5, N'��� "����"', N'���. ���������� 1', N'�������', N'0678889994', N'rud@gmail.com')
INSERT [dbo].[klient] ([id_klient], [Nazva], [Adress], [City], [Tel], [Email]) VALUES (6, N'��  ������ �.�.', N'���. ����� 5', N'���', N'0501112233', NULL)
INSERT [dbo].[postachalnik] ([id_postach], [Nazva], [Adress], [City], [Tel], [Kontakt_osoba], [Posada]) VALUES (1, N'�� ���� �.�.', N'���. ������������ 46', N'�������', N'0509998877', N'���� �.�.', N'')
INSERT [dbo].[postachalnik] ([id_postach], [Nazva], [Adress], [City], [Tel], [Kontakt_osoba], [Posada]) VALUES (2, N'��� "����"', N'���. ������� 7', N'�������', N'0678889994', N'������ �.�', N'��������')
INSERT [dbo].[postachalnik] ([id_postach], [Nazva], [Adress], [City], [Tel], [Kontakt_osoba], [Posada]) VALUES (3, N'���� �.�', N'���. ³����� 9', N'���', N'0974445544', N'���� �.�.', N'')
INSERT [dbo].[postachalnik] ([id_postach], [Nazva], [Adress], [City], [Tel], [Kontakt_osoba], [Posada]) VALUES (4, N'��� ������� �.�', N'���. ���������� 17�', N'�������', N'0509998877', N'������� �.�', N'��������')
INSERT [dbo].[postachalnik] ([id_postach], [Nazva], [Adress], [City], [Tel], [Kontakt_osoba], [Posada]) VALUES (5, N'��� "����"', N'���. ���������� 1', N'�������', N'0678889994', N'���� �.�', N'��������')
INSERT [dbo].[postachalnik] ([id_postach], [Nazva], [Adress], [City], [Tel], [Kontakt_osoba], [Posada]) VALUES (6, N'��� ������ �.�.', N'���. ����� 5', N'���', N'0974445544', N'������ �.�.', N'')
INSERT [dbo].[sotrudnik] ([id_sotrud], [Fname], [Name], [Lname], [Posada], [Adress], [City], [Home_tel]) VALUES (1, N'����', N'������', N'���㳿���', N'���������', N'���. ������������ 67 ��.20', N'�������', N'0509998877')
INSERT [dbo].[sotrudnik] ([id_sotrud], [Fname], [Name], [Lname], [Posada], [Adress], [City], [Home_tel]) VALUES (2, N'��������', N'������', N'�����������', N'���������', N'���. ³����� 20 ��.50', N'�������', N'0506667788')
INSERT [dbo].[sotrudnik] ([id_sotrud], [Fname], [Name], [Lname], [Posada], [Adress], [City], [Home_tel]) VALUES (3, N'��������', N'�����', N'�������', N'���������-�����������', N'���. ������� 67 ��.20', N'�������', N'0509998877')
INSERT [dbo].[sotrudnik] ([id_sotrud], [Fname], [Name], [Lname], [Posada], [Adress], [City], [Home_tel]) VALUES (4, N'���������', N'�����', N'�������������', N'���������', N'���. ������������ 12 ��.20', N'�������', N'0509998877')
INSERT [dbo].[sotrudnik] ([id_sotrud], [Fname], [Name], [Lname], [Posada], [Adress], [City], [Home_tel]) VALUES (5, N'���������', N'������', N'�����������', N'���������', N'���. ��������� 20 ��.50', N'�������', N'0506667788')
INSERT [dbo].[sotrudnik] ([id_sotrud], [Fname], [Name], [Lname], [Posada], [Adress], [City], [Home_tel]) VALUES (6, N'��������', N'�����', N'����������', N'���������-�����������', N'���. ���������� 67 ��.20', N'�������', N'0509998877')

SET IDENTITY_INSERT [dbo].[tovar] ON 

INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (1, N'������', CAST(18.00 AS Decimal(6, 2)), 50, 1)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (2, N'������', CAST(16.00 AS Decimal(6, 2)), 50, 2)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (3, N'�����', CAST(21.00 AS Decimal(6, 2)), 25, 3)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (4, N'�������', CAST(10.00 AS Decimal(6, 2)), 30, 2)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (5, N'������', CAST(35.00 AS Decimal(6, 2)), 10, 5)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (6, N'������', CAST(18.00 AS Decimal(6, 2)), 50, 1)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (7, N'������', CAST(16.00 AS Decimal(6, 2)), 50, 5)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (8, N'�����', CAST(21.00 AS Decimal(6, 2)), 25, 3)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (9, N'�������', CAST(10.00 AS Decimal(6, 2)), 30, 2)
INSERT [dbo].[tovar] ([id_tovar], [Nazva], [Price], [NaSklade], [id_postav]) VALUES (10, N'������', CAST(35.00 AS Decimal(6, 2)), 10, 6)
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

USE Lab4torg_firma;
/* ������� �������� ������� ������ �� ���������*/
SELECT SUM(tovar.NaSklade) as tovar_sum FROM tovar GROUP BY id_postav;

/* ������� �������� ������� ����������� ���������� */ ---
select Count(sotrudnik.id_sotrud) as Sotrudnikiv
from sotrudnik;


/* ������� �������� ������� ������������� ����������. */ 
select Count(postachalnik.id_postach) as Postachalnikiv
from postachalnik;


/* ������� ������� �� ������ �������, �� ������� � ��������� ����� */ 
select sum(zakaz_tovar.Kilkist) as Kilkist, tovar.id_tovar
from tovar inner join zakaz_tovar on tovar.id_tovar = zakaz_tovar.id_tovar
inner join zakaz on zakaz_tovar.id_tovar = zakaz.id_zakaz
where zakaz.date_naznach>dateadd(MONTH, -12, getdate())
group by tovar.id_tovar


/* ������� ����, �� ��� ���� ������� ������ � ��������� �����.*/
select Sum(tovar.Price) as SUMA 
from tovar inner join zakaz_tovar on tovar.id_tovar = zakaz_tovar.id_tovar
inner join zakaz on zakaz_tovar.id_zakaz = zakaz.id_zakaz
where zakaz.date_naznach>dateadd(MONTH, -12, getdate())




/* ������� ���� ������� ������ �� ������ ��������������.*/
SELECT postachalnik.Nazva, tovar.Nazva, SUM(tovar.Price)
 FROM tovar INNER JOIN postachalnik ON tovar.id_postav = postachalnik.id_postach
GROUP BY postachalnik.Nazva, tovar.Nazva;

/* ������� �������� ������� ��������� �� ������ ��������������, �� ����� ������.*/
SELECT p.Nazva, count(zakaz.id_zakaz)
 FROM zakaz
INNER JOIN zakaz_tovar ON zakaz_tovar.id_zakaz=zakaz.id_zakaz
INNER JOIN tovar ON zakaz_tovar.id_tovar=tovar.id_tovar
INNER JOIN postachalnik p ON p.id_postach=tovar.id_postav
WHERE tovar.Nazva='������'
GROUP BY p.Nazva;

/* ������� ������� ����, �� ��� ���������� �����. */
SELECT tovar.Nazva, AVG(tovar.Price) AS �����������
FROM tovar 
Group By tovar.Nazva;


/* ������� ������� ��������� ��� �볺���, �� �������� � �������.*/
SELECT klient.Nazva, SUM(zakaz_tovar.Kilkist * tovar.Price) AS total_price
from (klient INNER JOIN zakaz ON klient.id_klient = zakaz.id_klient)
INNER JOIN zakaz_tovar ON zakaz.id_zakaz = zakaz_tovar.id_zakaz
INNER JOIN tovar ON tovar.id_tovar = zakaz_tovar.id_tovar
WHERE klient.City = '�������'
GROUP BY klient.Nazva;

/* ������� ������� ���� �� ������ �� ������� �������������.*/
SELECT postachalnik.Nazva, AVG(tovar.Price) AS �����������
FROM tovar INNER JOIN postachalnik ON postachalnik.id_postach = tovar.id_postav
Group By postachalnik.Nazva;
