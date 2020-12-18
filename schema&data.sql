USE [master]
GO
/****** Object:  Database [WeSplit]    Script Date: 19/12/2020 2:09:31 AM ******/
CREATE DATABASE [WeSplit]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WeSplit', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\WeSplit.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WeSplit_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\WeSplit_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WeSplit] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WeSplit].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WeSplit] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WeSplit] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WeSplit] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WeSplit] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WeSplit] SET ARITHABORT OFF 
GO
ALTER DATABASE [WeSplit] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WeSplit] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WeSplit] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WeSplit] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WeSplit] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WeSplit] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WeSplit] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WeSplit] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WeSplit] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WeSplit] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WeSplit] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WeSplit] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WeSplit] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WeSplit] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WeSplit] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WeSplit] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WeSplit] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WeSplit] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WeSplit] SET  MULTI_USER 
GO
ALTER DATABASE [WeSplit] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WeSplit] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WeSplit] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WeSplit] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WeSplit] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WeSplit] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WeSplit] SET QUERY_STORE = OFF
GO
USE [WeSplit]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 19/12/2020 2:09:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ImagePath] [nvarchar](200) NULL,
	[TripID] [int] NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 19/12/2020 2:09:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[TripID] [int] NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 19/12/2020 2:09:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Cost] [int] NULL,
	[MemberID] [int] NULL,
 CONSTRAINT [PK_Paying] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusDescription]    Script Date: 19/12/2020 2:09:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusDescription](
	[Status] [int] NOT NULL,
	[Description] [nvarchar](30) NULL,
 CONSTRAINT [PK_StatusDescription] PRIMARY KEY CLUSTERED 
(
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trip]    Script Date: 19/12/2020 2:09:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trip](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Destination] [nvarchar](50) NULL,
	[DepartureDate] [date] NULL,
	[ReturnDate] [date] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_TRIP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Waypoint]    Script Date: 19/12/2020 2:09:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Waypoint](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Location] [nvarchar](50) NULL,
	[ArrivalTime] [date] NULL,
	[LeavingTime] [date] NULL,
	[TripID] [int] NULL,
 CONSTRAINT [PK_Waypoint] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (1, N'Images\eb5f4e8d-ad2f-4ac5-9532-3aa930544984\6ead6ab8-af44-4405-9b9f-8c2466dd1768.jpg', 1)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (2, N'Images\eb5f4e8d-ad2f-4ac5-9532-3aa930544984\31c745ad-f7e7-4687-a8ff-df2ee86da0cf.jpg', 1)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (3, N'Images\eb5f4e8d-ad2f-4ac5-9532-3aa930544984\0c317845-47a1-4e99-85b0-772652cf5b6e.jpg', 1)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (4, N'Images\eb5f4e8d-ad2f-4ac5-9532-3aa930544984\cb6c5cd9-9a30-41f5-aeef-618c7abce619.jpg', 1)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (5, N'Images\eb5f4e8d-ad2f-4ac5-9532-3aa930544984\5cb38f34-c911-416f-b8f4-30108c3528e5.jpg', 1)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (6, N'Images\eb5f4e8d-ad2f-4ac5-9532-3aa930544984\18ae4217-34e4-45f5-8f82-c855929447ec.jpg', 1)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (7, N'Images\eb5f4e8d-ad2f-4ac5-9532-3aa930544984\aa5c7e10-cf10-481e-a616-0d9b369e1e89.jpg', 1)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (8, N'Images\ada88a9f-08e0-433f-b265-72e05d2283f3\df4faf4f-3748-4ba3-83ce-b7fa049a35fd.jpg', 2)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (9, N'Images\ada88a9f-08e0-433f-b265-72e05d2283f3\d0b9dfb6-28f6-4668-ac0e-e3856a0e4526.jpg', 2)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (10, N'Images\ada88a9f-08e0-433f-b265-72e05d2283f3\6281adb7-4a42-4202-a971-f391459b2f91.jpg', 2)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (11, N'Images\ada88a9f-08e0-433f-b265-72e05d2283f3\586e285f-eb3d-4c59-8276-169f825f48d2.jpg', 2)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (12, N'Images\ada88a9f-08e0-433f-b265-72e05d2283f3\2c7f4f3c-7f22-4f5d-97f5-20c3676a6194.jpg', 2)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (13, N'Images\a18db8a2-47d3-48a6-be03-b68f2415add9\579e48c8-f2a5-4e60-9eff-bf8cbb5b2e48.jpg', 3)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (14, N'Images\a18db8a2-47d3-48a6-be03-b68f2415add9\6731e483-39f5-496c-be19-835932770b27.jpg', 3)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (15, N'Images\a18db8a2-47d3-48a6-be03-b68f2415add9\70dceafa-b93d-4c25-9f37-47fec0ac8556.jpg', 3)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (16, N'Images\a18db8a2-47d3-48a6-be03-b68f2415add9\90e35cd3-07a7-4b28-a6fc-75ae18adda08.jpg', 3)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (17, N'Images\a18db8a2-47d3-48a6-be03-b68f2415add9\7dad398d-14f8-496d-b14f-42694f133eda.jpg', 3)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (18, N'Images\a18db8a2-47d3-48a6-be03-b68f2415add9\aa70f9b4-9449-482c-8845-ebcf781e7b86.jpg', 3)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (19, N'Images\3bb9eb70-c1a8-40e8-9228-5593c5e1497c\a83873d4-46fe-4466-9345-99b256de251c.jpg', 4)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (20, N'Images\3bb9eb70-c1a8-40e8-9228-5593c5e1497c\9343506f-719c-418b-a5d1-ea366f54352a.jpg', 4)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (21, N'Images\3bb9eb70-c1a8-40e8-9228-5593c5e1497c\5491ee6b-1f4c-4212-bda8-368218cba7a1.jpg', 4)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (22, N'Images\3bb9eb70-c1a8-40e8-9228-5593c5e1497c\a1781286-da35-494d-8407-53bd24b3781c.jpg', 4)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (23, N'Images\3bb9eb70-c1a8-40e8-9228-5593c5e1497c\3e1df46d-7a6c-4310-be0f-94f37afd2069.jpg', 4)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (24, N'Images\3bb9eb70-c1a8-40e8-9228-5593c5e1497c\122cbe4e-f418-44f9-93a4-9712ffba65c8.jpg', 4)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (25, N'Images\866176c1-1692-46f8-b6ee-56fbfb1715b3\5537ea81-c3f7-4c04-a7d6-b74172c56cf4.jpg', 5)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (26, N'Images\866176c1-1692-46f8-b6ee-56fbfb1715b3\a846f5db-5dcc-4e06-bfd8-670cef58f318.jpg', 5)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (27, N'Images\866176c1-1692-46f8-b6ee-56fbfb1715b3\a98febfd-eaec-49f5-801c-7742554656ee.jpg', 5)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (28, N'Images\866176c1-1692-46f8-b6ee-56fbfb1715b3\2bc884cb-4f7b-4822-a0ed-8dfae1395bcf.jpg', 5)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (29, N'Images\866176c1-1692-46f8-b6ee-56fbfb1715b3\361f9191-92c5-46a2-bbdd-c07f31d4082f.jpg', 5)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (30, N'Images\798b3a72-83d7-4635-992e-867dbb937d2a\72d36383-a479-4638-aa7e-ce3316e96b4a.jpg', 6)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (31, N'Images\798b3a72-83d7-4635-992e-867dbb937d2a\68b4cf6c-1c2b-4a5c-8e7b-63c49b993413.jpg', 6)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (32, N'Images\798b3a72-83d7-4635-992e-867dbb937d2a\a225605a-f3a2-4fc1-848e-cb8018a6a025.jpg', 6)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (33, N'Images\798b3a72-83d7-4635-992e-867dbb937d2a\e822862a-4b5b-4b64-b9cd-06b98904de4a.jpg', 6)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (34, N'Images\798b3a72-83d7-4635-992e-867dbb937d2a\e9de0a33-9ab9-43b8-a04b-9c30e48eb7ba.jpg', 6)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (35, N'Images\798b3a72-83d7-4635-992e-867dbb937d2a\0528db57-ce3f-4607-9393-bfb6e7cc8d20.jpg', 6)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (36, N'Images\ae571e73-41db-4af0-ba97-2f62622e1e21\77955f94-e540-461c-a65f-d83cd65a01a8.jpg', 7)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (37, N'Images\ae571e73-41db-4af0-ba97-2f62622e1e21\c394d70e-e493-42b8-b8e2-b116af3a0fad.jpg', 7)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (38, N'Images\ae571e73-41db-4af0-ba97-2f62622e1e21\ecdf932c-a9e2-4693-81f3-db1ea55da005.jpg', 7)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (39, N'Images\ae571e73-41db-4af0-ba97-2f62622e1e21\673a38bd-9f7d-465b-ba9c-b1450265e005.jpg', 7)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (40, N'Images\ae571e73-41db-4af0-ba97-2f62622e1e21\1f1fe9f0-458e-4c17-9462-9ee7a73761b8.jpg', 7)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (41, N'Images\ae571e73-41db-4af0-ba97-2f62622e1e21\72ce0696-1fd7-4ed9-86d9-d4f6540a8145.jpg', 7)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (42, N'Images\ae571e73-41db-4af0-ba97-2f62622e1e21\76a864b7-fc81-4cff-a839-a1f1276107d7.jpg', 7)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (43, N'Images\7d91e425-03bc-4a0d-b6da-2c76e3dae5ae\b7e0c60a-d026-473c-beb1-c7d72e614d74.jpg', 8)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (44, N'Images\7d91e425-03bc-4a0d-b6da-2c76e3dae5ae\de618fe0-2fc0-46eb-a216-f5c94755b78a.jpg', 8)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (45, N'Images\7d91e425-03bc-4a0d-b6da-2c76e3dae5ae\50a37584-6fec-4387-b13b-1cd259da2471.jpg', 8)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (46, N'Images\7d91e425-03bc-4a0d-b6da-2c76e3dae5ae\26c2caae-7e7f-438c-83fd-d5eb6bfce0f4.jpg', 8)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (47, N'Images\7d91e425-03bc-4a0d-b6da-2c76e3dae5ae\6403ef99-a523-4f75-9c8f-b3a3df404a70.jpg', 8)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (48, N'Images\7d91e425-03bc-4a0d-b6da-2c76e3dae5ae\262446b6-f1cb-4cdc-a767-f3254a90e1b3.jpg', 8)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (49, N'Images\7d91e425-03bc-4a0d-b6da-2c76e3dae5ae\b2bdebe4-c158-4167-8268-cc821cb65b5b.jpg', 8)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (50, N'Images\a3c6e33f-54f8-45d6-95e8-f41df2a6c66a\bd78af60-9c12-4423-a135-98ad2e86067e.jpg', 9)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (51, N'Images\a3c6e33f-54f8-45d6-95e8-f41df2a6c66a\a4c371e4-0e57-46f7-ad07-182b3421c242.jpg', 9)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (52, N'Images\a3c6e33f-54f8-45d6-95e8-f41df2a6c66a\89a98571-781a-4627-9ccb-0a429c4585e7.jpg', 9)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (53, N'Images\a3c6e33f-54f8-45d6-95e8-f41df2a6c66a\2d4af57e-7948-41fd-99bf-64e711bf6d35.jpg', 9)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (54, N'Images\a3c6e33f-54f8-45d6-95e8-f41df2a6c66a\153a973b-d6d5-45ba-a933-724b232ad3cc.jpg', 9)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (55, N'Images\a3c6e33f-54f8-45d6-95e8-f41df2a6c66a\46da6e8f-101f-42dc-bf47-d0c41e507eb2.jpg', 9)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (56, N'Images\9522dd33-79a0-47d4-afc4-9277dd23c134\dc366265-0725-4b93-8b74-aeb1f938269b.jpg', 10)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (57, N'Images\9522dd33-79a0-47d4-afc4-9277dd23c134\16906888-8464-4a7c-a359-74bd6ee9856e.jpg', 10)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (58, N'Images\9522dd33-79a0-47d4-afc4-9277dd23c134\b8915163-58e2-47de-9850-f23f41fe0069.jpg', 10)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (59, N'Images\9522dd33-79a0-47d4-afc4-9277dd23c134\734f982f-cc44-4b8e-8c7a-257eabed1e0c.jpg', 10)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (60, N'Images\9522dd33-79a0-47d4-afc4-9277dd23c134\76743338-8bea-40e6-a19f-3a50b90c2648.jpg', 10)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (61, N'Images\9522dd33-79a0-47d4-afc4-9277dd23c134\de8bc1e0-9d43-4808-9853-1a202c06c153.jpg', 10)
SET IDENTITY_INSERT [dbo].[Image] OFF
GO
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (1, N'Đoàn Minh Tân', 1)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (2, N'Hà Minh Cường', 1)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (3, N'Huỳnh Hồ Thanh Trà', 1)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (4, N'Nguyễn Văn Chấp', 2)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (5, N'Hà Minh Cường', 2)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (6, N'Nguyễn Văn Ba', 2)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (7, N'Nguyễn Văn Hậu', 3)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (8, N'Trần Thị Linh', 3)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (9, N'Nguyễn Văn Bé Ba', 4)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (10, N'Đoàn Minh Tân', 4)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (11, N'Hà Minh Cường', 4)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (12, N'Nguyễn Minh Luân', 4)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (13, N'Huỳnh Hồ Thanh Trà', 5)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (14, N'Nguyễn Minh Luân', 5)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (15, N'Nguyễn Văn Hứa', 6)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (16, N'Lê Văn Huyên', 6)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (17, N'Đoàn Văn Bá', 6)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (18, N'Hà Minh Cường', 7)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (19, N'Đoàn Minh Tân', 7)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (20, N'Huỳnh Hồ Thanh Trà', 7)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (21, N'Nguyễn Văn Hậu', 8)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (22, N'Nguyễn Hữu Nghĩa', 8)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (23, N'Nguyễn Văn Chấp', 9)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (24, N'Đinh Văn An', 9)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (25, N'Chu Đình Tuệ', 9)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (26, N'Nguyễn Chí Tuệ', 10)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (27, N'Đinh Văn An', 10)
SET IDENTITY_INSERT [dbo].[Member] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (1, N'Ăn sáng', 100000, 1)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (2, N'Mua nước', 60000, 1)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (3, N'Mua hoa', 200000, 1)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (4, N'Ăn sáng', 100000, 2)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (5, N'Mua nước giải khát', 200000, 2)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (6, N'Đổ xăng', 200000, 2)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (7, N'Ăn sáng', 100000, 3)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (8, N'Mua quà', 200000, 3)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (9, N'Mua khẩu trang', 30000, 3)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (10, N'Đổ xăng', 50000, 4)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (11, N'Mua đồ ăn', 1000000, 4)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (12, N'Đổ xăng', 50000, 5)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (13, N'Mua đồ uống', 300000, 5)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (14, N'Mua trái cây', 50000, 6)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (15, N'Ăn sáng', 30000, 7)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (16, N'Khách sạn', 200000, 7)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (17, N'Khẩu trang', 20000, 7)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (18, N'Mua quà', 500000, 8)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (19, N'Mua bánh', 300000, 8)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (20, N'Vé máy bay', 800000, 8)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (21, N'Vé máy bay', 100000, 9)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (22, N'Ăn', 200000, 9)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (23, N'Uống', 50000, 9)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (24, N'Khách sạn', 150000, 9)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (25, N'Vé máy bay', 100000, 10)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (26, N'Ăn', 150000, 10)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (27, N'Uống', 30000, 10)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (28, N'Khách sạn', 150000, 10)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (29, N'Vé máy bay', 100000, 11)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (30, N'Ăn', 300000, 11)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (31, N'Uống', 100000, 11)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (32, N'Khách sạn', 150000, 11)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (33, N'Vé máy bay', 100000, 12)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (34, N'Ăn', 250000, 12)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (35, N'Uống', 100000, 12)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (36, N'Khách sạn', 150000, 12)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (37, N'Ăn sáng', 20000, 13)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (38, N'Khách sạn', 400000, 13)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (39, N'Vé máy bay', 300000, 13)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (40, N'Ăn sáng', 20000, 14)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (41, N'Khách sạn', 400000, 14)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (42, N'Vé máy bay', 300000, 14)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (43, N'Mua quà', 500000, 14)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (44, N'Đi tàu', 120000, 15)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (45, N'Ăn', 300000, 15)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (46, N'Uống', 100000, 15)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (47, N'Quà', 120000, 15)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (48, N'Đi tàu', 120000, 16)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (49, N'Ăn', 350000, 16)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (50, N'Uống', 100000, 16)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (51, N'Thuốc', 100000, 16)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (52, N'Khẩu trang', 20000, 16)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (53, N'Đi tàu', 120000, 17)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (54, N'Ăn', 250000, 17)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (55, N'Uống', 20000, 17)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (56, N'Khách sạn', 1000000, 17)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (57, N'Vé máy bay', 500000, 18)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (58, N'Ăn', 1000000, 18)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (59, N'Uống', 500000, 18)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (60, N'Khách sạn', 1500000, 18)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (61, N'Quà', 1300000, 18)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (62, N'Vé máy bay', 500000, 19)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (63, N'Ăn', 1500000, 19)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (64, N'Uống', 750000, 19)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (65, N'Khách sạn', 1500000, 19)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (66, N'Quà', 1300000, 19)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (67, N'Vé máy bay', 500000, 20)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (68, N'Ăn', 1500000, 20)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (69, N'Uống', 750000, 20)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (70, N'Khách sạn', 1500000, 20)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (71, N'Quà', 1200000, 20)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (72, N'Vé máy bay', 500000, 21)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (73, N'Ăn', 100000, 21)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (74, N'Uống', 50000, 21)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (75, N'Mua quà', 120000, 21)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (76, N'Trái cây', 65000, 21)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (77, N'Vé máy bay', 500000, 22)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (78, N'Ăn', 100000, 22)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (79, N'Uống', 25000, 22)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (80, N'Mua quà', 650000, 22)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (81, N'Mua bia', 650000, 22)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (82, N'Khách sạn', 500000, 23)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (83, N'Ăn', 250000, 23)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (84, N'Uống', 120000, 23)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (85, N'Khách sạn', 500000, 24)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (86, N'Ăn', 300000, 24)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (87, N'Uống', 120000, 24)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (88, N'Khách sạn', 500000, 25)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (89, N'Ăn', 200000, 25)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (90, N'Uống', 150000, 25)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (91, N'Nhà nghỉ', 350000, 26)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (92, N'Ăn', 350000, 26)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (93, N'Uống', 100000, 26)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (94, N'Lều', 500000, 26)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (95, N'Nhà nghỉ', 350000, 27)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (96, N'Ăn', 350000, 27)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (97, N'Uống', 250000, 27)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (98, N'Trái cây', 230000, 27)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (99, N'Quà', 150000, 27)
GO
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
INSERT [dbo].[StatusDescription] ([Status], [Description]) VALUES (0, N'Chưa hoàn thành')
INSERT [dbo].[StatusDescription] ([Status], [Description]) VALUES (1, N'Đã hoàn thành')
INSERT [dbo].[StatusDescription] ([Status], [Description]) VALUES (2, N'Đã chia tiền')
GO
SET IDENTITY_INSERT [dbo].[Trip] ON 

INSERT [dbo].[Trip] ([ID], [Name], [Destination], [DepartureDate], [ReturnDate], [Status]) VALUES (1, N'Du lịch Cô Tô', N'Quảng Ninh', CAST(N'2020-03-10' AS Date), CAST(N'2020-03-15' AS Date), 1)
INSERT [dbo].[Trip] ([ID], [Name], [Destination], [DepartureDate], [ReturnDate], [Status]) VALUES (2, N'Du lịch Cù Lao Xanh', N'Bình Định', CAST(N'2020-12-18' AS Date), CAST(N'2020-12-20' AS Date), 0)
INSERT [dbo].[Trip] ([ID], [Name], [Destination], [DepartureDate], [ReturnDate], [Status]) VALUES (3, N'Đảo Ngọc Vùng', N'Quảng Ninh', CAST(N'2020-01-13' AS Date), CAST(N'2020-01-16' AS Date), 1)
INSERT [dbo].[Trip] ([ID], [Name], [Destination], [DepartureDate], [ReturnDate], [Status]) VALUES (4, N'Du lịch Đền Hùng', N'Phú Thọ', CAST(N'2019-09-22' AS Date), CAST(N'2019-09-23' AS Date), 1)
INSERT [dbo].[Trip] ([ID], [Name], [Destination], [DepartureDate], [ReturnDate], [Status]) VALUES (5, N'Đảo Cái Chiên', N'QuangNinh', CAST(N'2020-12-11' AS Date), CAST(N'2020-12-12' AS Date), 1)
INSERT [dbo].[Trip] ([ID], [Name], [Destination], [DepartureDate], [ReturnDate], [Status]) VALUES (6, N'Chuyến phượt Quan Lạn', N'Quảng Ninh', CAST(N'2021-01-21' AS Date), CAST(N'2021-01-23' AS Date), 0)
INSERT [dbo].[Trip] ([ID], [Name], [Destination], [DepartureDate], [ReturnDate], [Status]) VALUES (7, N'Vịnh Hạ Long', N'Quảng Ninh', CAST(N'2020-02-21' AS Date), CAST(N'2020-02-25' AS Date), 1)
INSERT [dbo].[Trip] ([ID], [Name], [Destination], [DepartureDate], [ReturnDate], [Status]) VALUES (8, N'Du lịch Móng Cái', N'Quảng Ninh', CAST(N'2021-03-23' AS Date), CAST(N'2021-03-24' AS Date), 0)
INSERT [dbo].[Trip] ([ID], [Name], [Destination], [DepartureDate], [ReturnDate], [Status]) VALUES (9, N'Du lịch Bình Liêu', N'Quảng Ninh', CAST(N'2021-05-22' AS Date), CAST(N'2021-05-24' AS Date), 0)
INSERT [dbo].[Trip] ([ID], [Name], [Destination], [DepartureDate], [ReturnDate], [Status]) VALUES (10, N'Phượt Cực Đông', N'Khánh Hòa', CAST(N'2021-07-01' AS Date), CAST(N'2021-07-03' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Trip] OFF
GO
SET IDENTITY_INSERT [dbo].[Waypoint] ON 

INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (1, N'Bãi biển Hồng Vân', CAST(N'2020-03-10' AS Date), CAST(N'2020-03-11' AS Date), 1)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (2, N'Bãi biển Nam Hải', CAST(N'2020-03-11' AS Date), CAST(N'2020-03-11' AS Date), 1)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (3, N'Bãi đá Cầu Mỹ', CAST(N'2020-03-11' AS Date), CAST(N'2020-03-11' AS Date), 1)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (4, N'HomeStay', CAST(N'2020-03-11' AS Date), CAST(N'2020-03-14' AS Date), 1)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (5, N'Tượng đài Bác Hồ', CAST(N'2020-03-14' AS Date), CAST(N'2020-03-15' AS Date), 1)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (6, N'Cầu Cảng', CAST(N'2020-12-18' AS Date), CAST(N'2020-12-18' AS Date), 2)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (7, N'Đảo', CAST(N'2020-12-18' AS Date), CAST(N'2020-12-19' AS Date), 2)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (8, N'HomeStay', CAST(N'2020-12-19' AS Date), CAST(N'2020-12-20' AS Date), 2)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (9, N'Cắm trại trên đá', CAST(N'2020-01-13' AS Date), CAST(N'2020-01-14' AS Date), 3)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (10, N'Hồ nước ngọt', CAST(N'2020-01-14' AS Date), CAST(N'2020-01-14' AS Date), 3)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (11, N'Khách sạn Hưng Thịnh', CAST(N'2020-01-14' AS Date), CAST(N'2020-01-15' AS Date), 3)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (12, N'Cảng Cống Yển', CAST(N'2020-01-15' AS Date), CAST(N'2020-01-16' AS Date), 3)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (13, N'Bảo tàng Hùng Vương', CAST(N'2019-09-22' AS Date), CAST(N'2019-09-22' AS Date), 4)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (14, N'Đền Thờ Lạc Long Quân', CAST(N'2019-09-22' AS Date), CAST(N'2019-09-22' AS Date), 4)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (15, N'Đền Mẫu Âu Cơ', CAST(N'2019-09-23' AS Date), CAST(N'2019-09-23' AS Date), 4)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (16, N'Đảo', CAST(N'2020-12-11' AS Date), CAST(N'2020-12-11' AS Date), 5)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (17, N'Khách sạn', CAST(N'2020-12-11' AS Date), CAST(N'2020-12-12' AS Date), 5)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (18, N'HomeStay', CAST(N'2021-01-21' AS Date), CAST(N'2021-01-21' AS Date), 6)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (19, N'Đảo', CAST(N'2021-01-22' AS Date), CAST(N'2021-01-22' AS Date), 6)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (20, N'Cảng', CAST(N'2021-01-23' AS Date), CAST(N'2021-01-23' AS Date), 6)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (21, N'Khách sạn', CAST(N'2020-02-21' AS Date), CAST(N'2020-02-21' AS Date), 7)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (22, N'Đảo Soi Sim', CAST(N'2020-02-21' AS Date), CAST(N'2020-02-21' AS Date), 7)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (23, N'Du thuyền', CAST(N'2020-02-21' AS Date), CAST(N'2020-02-21' AS Date), 7)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (24, N'Động Thiên Cung', CAST(N'2020-02-22' AS Date), CAST(N'2020-02-22' AS Date), 7)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (25, N'Đảo Ti Tốp', CAST(N'2020-02-23' AS Date), CAST(N'2000-02-23' AS Date), 7)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (26, N'Bãi tắm', CAST(N'2020-02-23' AS Date), CAST(N'2020-02-23' AS Date), 7)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (27, N'Chùa Lôi Âm', CAST(N'2020-02-24' AS Date), CAST(N'2020-02-24' AS Date), 7)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (28, N'Khách sạn', CAST(N'2020-02-24' AS Date), CAST(N'2020-02-25' AS Date), 7)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (29, N'Khách sạn', CAST(N'2021-03-23' AS Date), CAST(N'2021-03-23' AS Date), 8)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (30, N'Mùi Sa Vĩ', CAST(N'2020-03-23' AS Date), CAST(N'2020-03-23' AS Date), 8)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (31, N'Trà Cổ', CAST(N'2021-03-24' AS Date), CAST(N'2021-03-24' AS Date), 8)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (32, N'Bãi Đá Đen', CAST(N'2021-03-24' AS Date), CAST(N'2021-03-24' AS Date), 8)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (33, N'Khách sạn', CAST(N'2021-05-22' AS Date), CAST(N'2021-05-22' AS Date), 9)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (34, N'Thác Khe Vằn', CAST(N'2021-05-22' AS Date), CAST(N'2021-05-22' AS Date), 9)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (35, N'Thác Khe Tiền', CAST(N'2021-05-22' AS Date), CAST(N'2021-05-22' AS Date), 9)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (36, N'Núi Cao Ly', CAST(N'2021-05-23' AS Date), CAST(N'2021-05-23' AS Date), 9)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (37, N'Khách sạn', CAST(N'2021-05-23' AS Date), CAST(N'2021-05-24' AS Date), 9)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (38, N'Núi Quảng Nam Châu', CAST(N'2021-05-24' AS Date), CAST(N'2021-05-24' AS Date), 9)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (39, N'Đầm Môn', CAST(N'2021-07-01' AS Date), CAST(N'2021-07-01' AS Date), 10)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (40, N'Nhà nghỉ', CAST(N'2021-07-01' AS Date), CAST(N'2021-07-02' AS Date), 10)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (41, N'Điệp Sơn', CAST(N'2021-07-02' AS Date), CAST(N'2021-07-02' AS Date), 10)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (42, N'Ngủ lều', CAST(N'2021-07-02' AS Date), CAST(N'2021-07-03' AS Date), 10)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (43, N'', NULL, NULL, 10)
SET IDENTITY_INSERT [dbo].[Waypoint] OFF
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Trip] FOREIGN KEY([TripID])
REFERENCES [dbo].[Trip] ([ID])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Trip]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_Member_Trip] FOREIGN KEY([TripID])
REFERENCES [dbo].[Trip] ([ID])
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_Member_Trip]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([ID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Member]
GO
ALTER TABLE [dbo].[Trip]  WITH CHECK ADD  CONSTRAINT [FK_Trip_StatusDescription] FOREIGN KEY([Status])
REFERENCES [dbo].[StatusDescription] ([Status])
GO
ALTER TABLE [dbo].[Trip] CHECK CONSTRAINT [FK_Trip_StatusDescription]
GO
ALTER TABLE [dbo].[Waypoint]  WITH CHECK ADD  CONSTRAINT [FK_Waypoint_Trip] FOREIGN KEY([TripID])
REFERENCES [dbo].[Trip] ([ID])
GO
ALTER TABLE [dbo].[Waypoint] CHECK CONSTRAINT [FK_Waypoint_Trip]
GO
USE [master]
GO
ALTER DATABASE [WeSplit] SET  READ_WRITE 
GO
