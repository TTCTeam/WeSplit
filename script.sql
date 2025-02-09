USE [master]
GO
/****** Object:  Database [WeSplit]    Script Date: 12/19/2020 2:41:29 PM ******/
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
/****** Object:  Table [dbo].[Image]    Script Date: 12/19/2020 2:41:31 PM ******/
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
/****** Object:  Table [dbo].[Member]    Script Date: 12/19/2020 2:41:31 PM ******/
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
/****** Object:  Table [dbo].[Payment]    Script Date: 12/19/2020 2:41:31 PM ******/
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
/****** Object:  Table [dbo].[StatusDescription]    Script Date: 12/19/2020 2:41:31 PM ******/
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
/****** Object:  Table [dbo].[Trip]    Script Date: 12/19/2020 2:41:31 PM ******/
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
/****** Object:  Table [dbo].[Waypoint]    Script Date: 12/19/2020 2:41:31 PM ******/
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
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (62, N'Images\46ce0008-a3b2-4aa3-bb96-f0714e3fd35e\cb3f8825-97b5-4ef0-abda-7b98c512cd1e.jpg', 11)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (63, N'Images\46ce0008-a3b2-4aa3-bb96-f0714e3fd35e\187bce0a-ef7f-4c98-a9d3-c53de595b7ee.jpg', 11)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (64, N'Images\46ce0008-a3b2-4aa3-bb96-f0714e3fd35e\a487993f-aae3-4eec-a14f-282b5e485c9c.jpg', 11)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (65, N'Images\46ce0008-a3b2-4aa3-bb96-f0714e3fd35e\8db9f45e-58c2-49d2-88b3-f6ccddab6b14.jpg', 11)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (66, N'Images\46ce0008-a3b2-4aa3-bb96-f0714e3fd35e\e0b84666-abc2-424a-9861-fcc62b843375.jpg', 11)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (67, N'Images\46ce0008-a3b2-4aa3-bb96-f0714e3fd35e\fd4bc4e5-e664-4e1a-9827-8c2237ccaba9.jpg', 11)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (68, N'Images\46ce0008-a3b2-4aa3-bb96-f0714e3fd35e\4892426c-052a-4115-8a18-1aa036a50ba5.jpg', 11)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (69, N'Images\46ce0008-a3b2-4aa3-bb96-f0714e3fd35e\cd6057d4-f523-4f0a-b6af-607d27b4f8fb.jpg', 11)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (70, N'Images\46ce0008-a3b2-4aa3-bb96-f0714e3fd35e\2f178d6c-82b9-44f5-a992-b360cdda125b.jpg', 11)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (71, N'Images\63e47bfa-8f3f-46b2-aae9-4e16f5b88b4c\8361f79e-a335-4979-ac99-96c4c38e9a63.jpg', 12)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (72, N'Images\63e47bfa-8f3f-46b2-aae9-4e16f5b88b4c\24ccb8f1-bc6a-465e-8164-7911490eb1c8.jpg', 12)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (73, N'Images\63e47bfa-8f3f-46b2-aae9-4e16f5b88b4c\d40197cb-1bbc-4588-9592-249dfaf44160.jpg', 12)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (74, N'Images\63e47bfa-8f3f-46b2-aae9-4e16f5b88b4c\24c1e589-a9a6-4cc4-b042-c94eb6891212.jpg', 12)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (75, N'Images\63e47bfa-8f3f-46b2-aae9-4e16f5b88b4c\ec2afd7b-f251-4f1e-9069-de0a978bb6cd.jpg', 12)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (76, N'Images\63e47bfa-8f3f-46b2-aae9-4e16f5b88b4c\a3fc493e-4b0e-4279-a0ba-5939417b4ffb.jpg', 12)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (77, N'Images\63e47bfa-8f3f-46b2-aae9-4e16f5b88b4c\cdd6459d-4e1b-4153-98ce-6305c7f77432.jpg', 12)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (78, N'Images\63e47bfa-8f3f-46b2-aae9-4e16f5b88b4c\b8539fec-76ca-419c-bebd-8906ecb87a55.jpg', 12)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (79, N'Images\63e47bfa-8f3f-46b2-aae9-4e16f5b88b4c\9ed6cf71-6291-4050-be58-dce85f1c8243.jpg', 12)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (80, N'Images\63e47bfa-8f3f-46b2-aae9-4e16f5b88b4c\3f3761a7-b9ce-421b-9f4a-27d34b2d937d.jpg', 12)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (81, N'Images\9cac1cd7-79eb-48c0-ac52-b3d0bf757204\5007bd7a-d355-4e7c-a0bd-e953db7ee231.jpg', 13)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (82, N'Images\9cac1cd7-79eb-48c0-ac52-b3d0bf757204\d5f256a7-5023-4ffe-a653-c41bdf76fc12.jpg', 13)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (83, N'Images\9cac1cd7-79eb-48c0-ac52-b3d0bf757204\cab72dbd-822b-4427-8f5a-d8bc469a9d76.jpg', 13)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (84, N'Images\9cac1cd7-79eb-48c0-ac52-b3d0bf757204\902f12c7-eb8c-4e80-a2ed-35067c8df3f9.jpg', 13)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (85, N'Images\9cac1cd7-79eb-48c0-ac52-b3d0bf757204\cff82dd3-4c15-4cc9-9a98-c36325be0a62.jpg', 13)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (86, N'Images\9cac1cd7-79eb-48c0-ac52-b3d0bf757204\075a059c-1490-46b1-8a2d-b669ac501900.jpg', 13)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (87, N'Images\9cac1cd7-79eb-48c0-ac52-b3d0bf757204\191994be-45fd-4bb2-b016-c7f6609633fe.jpg', 13)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (88, N'Images\9cac1cd7-79eb-48c0-ac52-b3d0bf757204\a67440a0-c4bd-4eb6-aace-a0527ab794ef.jpg', 13)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (89, N'Images\9cac1cd7-79eb-48c0-ac52-b3d0bf757204\296bdc71-9058-42e7-b8b9-745a5323d25c.jpg', 13)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (90, N'Images\22af2f5b-2d46-4e91-a352-a70f477261c1\8601b1f0-a9b3-44be-b65d-952728c0f4cb.jpg', 14)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (91, N'Images\22af2f5b-2d46-4e91-a352-a70f477261c1\e5e7548f-17e3-4729-b8b3-df1ae60067b7.jpg', 14)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (92, N'Images\22af2f5b-2d46-4e91-a352-a70f477261c1\01746abe-9a2d-417d-a37a-477e892c5492.jpg', 14)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (93, N'Images\22af2f5b-2d46-4e91-a352-a70f477261c1\23ffd488-be99-4f46-92fe-99653e09f188.jpg', 14)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (94, N'Images\22af2f5b-2d46-4e91-a352-a70f477261c1\89351db3-d1c4-47b4-8af5-4d2ed2d0cb13.png', 14)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (95, N'Images\22af2f5b-2d46-4e91-a352-a70f477261c1\1786ed53-a8ac-4ae4-809b-fca5c51e6a04.jpg', 14)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (96, N'Images\22af2f5b-2d46-4e91-a352-a70f477261c1\10652fbe-b3c3-4e31-9c34-0c8f9c873950.jpg', 14)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (97, N'Images\22af2f5b-2d46-4e91-a352-a70f477261c1\5e2f0fca-64d4-46de-867b-853da1bd111a.jpg', 14)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (98, N'Images\22af2f5b-2d46-4e91-a352-a70f477261c1\f11a484b-6443-4e33-8863-921d6c30c684.jpg', 14)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (99, N'Images\22af2f5b-2d46-4e91-a352-a70f477261c1\4bafc400-a7ad-4d98-80b4-2cd098800be4.jpg', 14)
GO
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (100, N'Images\5a9cb2ae-1b13-4ccb-b9ed-8cfecdf28c41\fbbf25c9-642c-4d44-b5fe-202dd6bf25ec.jpg', 15)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (101, N'Images\5a9cb2ae-1b13-4ccb-b9ed-8cfecdf28c41\ce6c6dac-4974-4ec6-8652-6319fd7a1962.jpg', 15)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (102, N'Images\5a9cb2ae-1b13-4ccb-b9ed-8cfecdf28c41\4e16d9b8-c6a9-4c92-aae1-9d4b79bb53a5.jpg', 15)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (103, N'Images\5a9cb2ae-1b13-4ccb-b9ed-8cfecdf28c41\4cc877b6-7a70-4be1-bc31-f549d85fb82a.jpg', 15)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (104, N'Images\5a9cb2ae-1b13-4ccb-b9ed-8cfecdf28c41\5c835f58-1014-4474-a810-3a59e0cc8d10.jpg', 15)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (105, N'Images\5a9cb2ae-1b13-4ccb-b9ed-8cfecdf28c41\52ae41d1-323b-414e-9556-e36dcd02c3a6.jpg', 15)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (106, N'Images\5a9cb2ae-1b13-4ccb-b9ed-8cfecdf28c41\2b307da7-0257-4dc0-b11d-0b51ecb8d961.jpg', 15)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (107, N'Images\5a9cb2ae-1b13-4ccb-b9ed-8cfecdf28c41\e506f941-de9f-48d4-8e46-94fc4013a21a.jpg', 15)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (108, N'Images\0233212f-0277-4290-b0f2-c9cff044ac08\de0f4999-4265-418a-b929-d095f6df0a43.jpg', 16)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (109, N'Images\0233212f-0277-4290-b0f2-c9cff044ac08\aef729ae-d2c9-4575-b0a9-fe6e72d5bfd3.jpg', 16)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (110, N'Images\0233212f-0277-4290-b0f2-c9cff044ac08\7e810514-e1eb-4258-99a0-905ba5361b17.jpg', 16)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (111, N'Images\0233212f-0277-4290-b0f2-c9cff044ac08\a8f15c04-4bbb-48cc-9e56-dcbbd582bcce.jpg', 16)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (112, N'Images\0233212f-0277-4290-b0f2-c9cff044ac08\8a6dddb1-f6d1-4f51-baf7-1e19b04df9ae.jpg', 16)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (113, N'Images\0233212f-0277-4290-b0f2-c9cff044ac08\353584de-51f2-414d-8e9c-10200605834e.jpg', 16)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (114, N'Images\0233212f-0277-4290-b0f2-c9cff044ac08\737c9a0d-00ba-47de-b935-700ca1dc77ff.jpg', 16)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (115, N'Images\0233212f-0277-4290-b0f2-c9cff044ac08\62bed41b-b9ab-463a-8432-cf7299aa0a08.jpg', 16)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (116, N'Images\0233212f-0277-4290-b0f2-c9cff044ac08\f3e3c1bf-bab1-4089-82fb-72b945409fb8.jpg', 16)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (117, N'Images\daed9c29-f7b1-43c8-99ec-fd3f5c8d89f5\e3cdd4e8-21c9-4291-ad60-91a96e5e931a.jpg', 17)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (118, N'Images\daed9c29-f7b1-43c8-99ec-fd3f5c8d89f5\1017e30f-e011-4bad-b906-0d1b0f2cf977.jpg', 17)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (119, N'Images\daed9c29-f7b1-43c8-99ec-fd3f5c8d89f5\99f316aa-107b-458c-9c29-166d702239af.jpg', 17)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (120, N'Images\daed9c29-f7b1-43c8-99ec-fd3f5c8d89f5\00752486-7e33-42cc-8fb3-110b65659fc7.jpg', 17)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (121, N'Images\daed9c29-f7b1-43c8-99ec-fd3f5c8d89f5\2f6f33d0-570d-487b-9155-223ffd4676a8.jpg', 17)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (122, N'Images\daed9c29-f7b1-43c8-99ec-fd3f5c8d89f5\b5ebd346-d19c-48b8-b127-fe8c81ea5c8c.jpg', 17)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (123, N'Images\daed9c29-f7b1-43c8-99ec-fd3f5c8d89f5\7f3179e6-3ab6-4ae0-a676-522e2e44998f.jpg', 17)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (124, N'Images\daed9c29-f7b1-43c8-99ec-fd3f5c8d89f5\4c2b0bb8-9026-4090-9f1a-e0eb2eb23847.jpg', 17)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (125, N'Images\daed9c29-f7b1-43c8-99ec-fd3f5c8d89f5\71bf23a0-b430-46a8-ad98-9adcb427be73.jpg', 17)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (126, N'Images\daed9c29-f7b1-43c8-99ec-fd3f5c8d89f5\486108c9-f940-43a9-8c74-c1e1990c6d90.jpg', 17)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (127, N'Images\daed9c29-f7b1-43c8-99ec-fd3f5c8d89f5\e9207621-f544-43cc-802e-392c3b2f97d9.jpg', 17)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (128, N'Images\2875d274-d94d-4e86-8c7e-4e1c6265ffdf\4cc3a7fb-8242-4513-86d6-7519936b413b.jpg', 18)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (129, N'Images\2875d274-d94d-4e86-8c7e-4e1c6265ffdf\383eef47-8636-470f-8379-d6db153c671e.jpg', 18)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (130, N'Images\2875d274-d94d-4e86-8c7e-4e1c6265ffdf\9a63baac-3ad7-486f-810f-0192ce480851.jpg', 18)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (131, N'Images\2875d274-d94d-4e86-8c7e-4e1c6265ffdf\623364a6-f5ec-4dd0-b4cd-59bd1237ae2c.jpg', 18)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (132, N'Images\2875d274-d94d-4e86-8c7e-4e1c6265ffdf\c910c145-625a-42ae-abb9-5219cfe5a3bc.jpg', 18)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (133, N'Images\2875d274-d94d-4e86-8c7e-4e1c6265ffdf\7c28452f-49d0-4f4c-8d2a-c2f38a75bad4.jpg', 18)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (134, N'Images\2875d274-d94d-4e86-8c7e-4e1c6265ffdf\fd83c612-4370-4b93-bfbe-6a4cfa69f155.jpg', 18)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (135, N'Images\2875d274-d94d-4e86-8c7e-4e1c6265ffdf\b9ffe438-0027-43e0-b714-aef8cac38a44.jpg', 18)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (136, N'Images\2875d274-d94d-4e86-8c7e-4e1c6265ffdf\955b9f38-9336-4f50-b1a5-339c60135f48.jpg', 18)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (137, N'Images\2875d274-d94d-4e86-8c7e-4e1c6265ffdf\1950bb16-4d71-478b-92d1-de9efb9c0c8d.jpg', 18)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (138, N'Images\a41d8732-3f85-4002-9bac-f30edc406c0b\139c9052-5769-4141-bda8-70dc3ddce734.jpg', 19)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (139, N'Images\a41d8732-3f85-4002-9bac-f30edc406c0b\f26ba41e-0d47-4e48-a720-2c43507b5815.jpg', 19)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (140, N'Images\a41d8732-3f85-4002-9bac-f30edc406c0b\2f1f3e65-b4f8-4090-84de-799037b30b1b.jpg', 19)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (141, N'Images\a41d8732-3f85-4002-9bac-f30edc406c0b\a2a9bfe2-854a-438d-be91-12fe291674b2.jpg', 19)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (142, N'Images\a41d8732-3f85-4002-9bac-f30edc406c0b\492f36d5-bb1b-44cf-a633-867035bad4f0.jpg', 19)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (143, N'Images\a41d8732-3f85-4002-9bac-f30edc406c0b\ee1aa1e5-0761-467f-910a-c1033e81720b.jpg', 19)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (144, N'Images\a41d8732-3f85-4002-9bac-f30edc406c0b\d14782d8-c631-49a7-8995-700b69cb9718.jpg', 19)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (145, N'Images\a41d8732-3f85-4002-9bac-f30edc406c0b\dd0e8d28-8fbe-4df9-bc79-24fbe07dce79.jpg', 19)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (146, N'Images\a41d8732-3f85-4002-9bac-f30edc406c0b\f7220f90-e0f2-4092-802b-aa51725a66fe.jpg', 19)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (147, N'Images\a41d8732-3f85-4002-9bac-f30edc406c0b\ff0f014b-c9e1-4b35-97dd-50a5bc26aaa4.jpg', 19)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (148, N'Images\4c3899bd-efca-460e-bd89-2de5d9987cc0\6353e6d8-f8dd-44a8-842c-e1306b7a2641.jpg', 20)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (149, N'Images\4c3899bd-efca-460e-bd89-2de5d9987cc0\779b056a-b99c-4592-b3dc-c2cd88a34ed4.jpg', 20)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (150, N'Images\4c3899bd-efca-460e-bd89-2de5d9987cc0\6bad848a-e883-473b-9ef7-1680c463655e.jpg', 20)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (151, N'Images\4c3899bd-efca-460e-bd89-2de5d9987cc0\a186e46f-f61d-4c30-a0b2-6ea6609ab00c.jpg', 20)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (152, N'Images\4c3899bd-efca-460e-bd89-2de5d9987cc0\7786c69b-4611-495e-97fc-011513120d62.jpg', 20)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (153, N'Images\4c3899bd-efca-460e-bd89-2de5d9987cc0\85cc439e-f14e-4e6a-8b7a-5ef9c094c21a.jpg', 20)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (154, N'Images\4c3899bd-efca-460e-bd89-2de5d9987cc0\10105368-8ccc-47d7-9da6-fb609d614174.jpg', 20)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (155, N'Images\4c3899bd-efca-460e-bd89-2de5d9987cc0\6ae39b9a-0e46-44b6-ac93-48f95c01dff2.jpg', 20)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (156, N'Images\4c3899bd-efca-460e-bd89-2de5d9987cc0\09e1ad7e-db0a-4e9f-8fe5-e9b6e668751b.jpg', 20)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (157, N'Images\4c3899bd-efca-460e-bd89-2de5d9987cc0\64be2653-802b-4f5b-b4cd-57b02e8d4016.jpg', 20)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (158, N'Images\4c3899bd-efca-460e-bd89-2de5d9987cc0\5f872813-0dd8-4b19-95e1-56f992ff10ad.jpg', 20)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (159, N'Images\4c3899bd-efca-460e-bd89-2de5d9987cc0\1f2e93ca-2b1f-4618-8db6-1d9052b29e9c.jpg', 20)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (160, N'Images\4c3899bd-efca-460e-bd89-2de5d9987cc0\49a9ce95-326c-446d-848e-fd6a8e33a276.jpg', 20)
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
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (28, N'Tạ Quyển Đình', 11)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (29, N'Tạ Minh Minh', 11)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (30, N'Quách Ngọc Ngân', 11)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (31, N'Huỳnh Gia Tuệ', 11)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (32, N'Hà Khuê', 11)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (33, N'Hiệu Nhất Nguyên', 12)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (34, N'Tô Nhất Minh', 12)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (35, N'Đồng Quang Bảo', 12)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (36, N'Đồng Quang Kiệm', 12)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (37, N'Kình Nhị Viên', 12)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (38, N'Thanh Trà', 13)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (39, N'Minh Tân', 13)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (40, N'Minh Cường', 13)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (41, N'Hà Tân', 13)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (42, N'Đoàn Cường', 13)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (43, N'Quách Gia Hân', 14)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (44, N'Ngân Gia Hàng', 14)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (45, N'Nguyễn Hàm Minh', 14)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (46, N'Nguyễn Bảo Nguyên', 15)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (47, N'Thiều Minh Tuệ', 15)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (48, N'Kiều Minh Nguyệt', 15)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (49, N'Hải Kiều Lan', 15)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (50, N'Lan Anh', 15)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (51, N'Tạ Uyển Đình', 16)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (52, N'Huỳnh Thiên Khôn', 16)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (53, N'Đoàn Quang Đại', 16)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (54, N'Lâm Ngọc Hoa', 16)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (55, N'Thôi Hiểu Bằng', 17)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (56, N'Hà Hải Băng', 17)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (57, N'Đoàn Gia Minh', 17)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (58, N'Lâm Văn Đời', 17)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (59, N'Tuấn Sang', 18)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (60, N'Thanh Nhàn', 18)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (61, N'Anh Thư', 18)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (62, N'Quang Huy', 18)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (63, N'Quàng Anh Tài', 19)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (64, N'Công Thanh Anh', 19)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (65, N'Lương Gia Kiện', 19)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (66, N'Châu Mỹ Hà', 19)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (67, N'Kim Anh Đào', 19)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (68, N'Thiều Bảo Bảo', 20)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (69, N'Diệp Lam Anh', 20)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (70, N'Đồng Ánh Loan', 20)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (71, N'Kiều Văn Tuấn', 20)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (72, N'Hạ Uyên Du', 20)
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
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (100, N'Ăn sáng', 1000000, 28)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (101, N'Ăn trưa', 1050000, 28)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (102, N'Ăn tối', 1000000, 28)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (103, N'Ăn vặt', 500000, 28)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (104, N'Tiền xe', 1050000, 29)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (105, N'Thuê phòng', 750000, 29)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (106, N'Thuê thuyền', 300000, 29)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (107, N'Nước uống', 500000, 30)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (108, N'Khẩu trang', 100000, 30)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (109, N'Ăn sáng', 30000, 33)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (110, N'Ăn trưa', 200000, 33)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (111, N'Ăn tối', 250000, 33)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (112, N'Ăn vặt', 500000, 33)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (113, N'Nước uống', 200000, 34)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (114, N'Thuê trang phục', 150000, 35)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (115, N'Thuê xe máy', 200000, 38)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (116, N'Chỗ ở', 1050000, 39)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (117, N'Ăn uống', 2000000, 40)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (118, N'Ăn uống', 3050000, 43)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (119, N'Thuê phòng', 2000000, 44)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (120, N'Đi lại', 3000000, 44)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (121, N'Ăn sáng', 1000000, 46)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (122, N'Ăn trưa', 950000, 46)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (123, N'Ăn tối', 1500000, 46)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (124, N'Ăn vặt', 500000, 46)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (125, N'Thuê xe', 300000, 47)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (126, N'Thuê phòng', 2000000, 47)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (127, N'Thuê thuyền', 350000, 48)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (128, N'Vé xe', 5000000, 49)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (129, N'Ăn uống', 1050000, 51)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (130, N'Đi lại', 3000000, 52)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (131, N'Chỗ ở', 2050000, 53)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (132, N'Vé tham quan', 500000, 53)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (133, N'Chỗ ở', 2050000, 55)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (134, N'Ăn uống', 1050000, 56)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (135, N'Xe', 1000000, 57)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (136, N'Thuê xe, ván', 200000, 57)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (137, N'Ăn uống', 1050000, 59)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (138, N'Chỗ ở', 2000000, 60)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (139, N'Thuê đồ', 500000, 60)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (140, N'Vui chơi khác', 1000000, 61)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (141, N'Ăn uống', 1050000, 63)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (142, N'Y tế', 150000, 63)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (143, N'Thuê xe máy', 500000, 64)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (144, N'Vé xe', 1500000, 64)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (145, N'Chụp ảnh', 500000, 65)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (146, N'Ăn uống', 5000000, 68)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (147, N'Vé máy bay', 3500000, 69)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (148, N'Vé tàu', 1000000, 69)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (149, N'Thuê đồ', 750000, 70)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (150, N'Đồ lưu niệm', 850000, 71)
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
INSERT [dbo].[StatusDescription] ([Status], [Description]) VALUES (0, N'Chưa hoàn thành')
INSERT [dbo].[StatusDescription] ([Status], [Description]) VALUES (1, N'Đã hoàn thành')
INSERT [dbo].[StatusDescription] ([Status], [Description]) VALUES (2, N'Đã thanh toán')
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
INSERT [dbo].[Trip] ([ID], [Name], [Destination], [DepartureDate], [ReturnDate], [Status]) VALUES (11, N'Du lịch Nà Hang - Tuyên Quang', N'Tuyên Quang', CAST(N'2020-07-11' AS Date), CAST(N'2020-07-14' AS Date), 0)
INSERT [dbo].[Trip] ([ID], [Name], [Destination], [DepartureDate], [ReturnDate], [Status]) VALUES (12, N'Hang Kia Pà Cò', N'Hòa Bình', CAST(N'2020-07-21' AS Date), CAST(N'2020-07-22' AS Date), 0)
INSERT [dbo].[Trip] ([ID], [Name], [Destination], [DepartureDate], [ReturnDate], [Status]) VALUES (13, N'Du lịch Mẫu Sơn - Lạng Sơn', N'Lạng Sơn', CAST(N'2020-10-20' AS Date), CAST(N'2020-10-23' AS Date), 1)
INSERT [dbo].[Trip] ([ID], [Name], [Destination], [DepartureDate], [ReturnDate], [Status]) VALUES (14, N'Mù Cang Chải -Yên Bái', N'Yên Bái', CAST(N'2020-11-20' AS Date), CAST(N'2020-11-22' AS Date), 1)
INSERT [dbo].[Trip] ([ID], [Name], [Destination], [DepartureDate], [ReturnDate], [Status]) VALUES (15, N'Khu Khu Dịch Cúc Phương', N'Ninh Bình', CAST(N'2020-06-20' AS Date), CAST(N'2020-06-25' AS Date), 1)
INSERT [dbo].[Trip] ([ID], [Name], [Destination], [DepartureDate], [ReturnDate], [Status]) VALUES (16, N'Phượt Hồ Núi Cốc', N'Thái Nguyên', CAST(N'2020-02-12' AS Date), CAST(N'2020-02-15' AS Date), 1)
INSERT [dbo].[Trip] ([ID], [Name], [Destination], [DepartureDate], [ReturnDate], [Status]) VALUES (17, N'Du lịch mũi Né', N'Bình Thuận', CAST(N'2020-04-28' AS Date), CAST(N'2020-05-02' AS Date), 0)
INSERT [dbo].[Trip] ([ID], [Name], [Destination], [DepartureDate], [ReturnDate], [Status]) VALUES (18, N'Du lịch Phan Thiết', N'Bình Thuận', CAST(N'2020-12-21' AS Date), CAST(N'2020-12-24' AS Date), 0)
INSERT [dbo].[Trip] ([ID], [Name], [Destination], [DepartureDate], [ReturnDate], [Status]) VALUES (19, N'Du lịch Đông Giang', N'Quảng Nam', CAST(N'2020-11-30' AS Date), CAST(N'2020-12-02' AS Date), 1)
INSERT [dbo].[Trip] ([ID], [Name], [Destination], [DepartureDate], [ReturnDate], [Status]) VALUES (20, N'Du lịch Đà Nẵng', N'Đà Nẵng', CAST(N'2020-07-01' AS Date), CAST(N'2020-07-05' AS Date), 0)
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
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (44, N'Thác Mơ', CAST(N'2020-07-11' AS Date), CAST(N'2020-07-11' AS Date), 11)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (45, N'Lòng Hồ Nà Hang', CAST(N'2020-07-12' AS Date), CAST(N'2020-07-12' AS Date), 11)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (46, N'Thượng Lâm', CAST(N'2020-07-13' AS Date), CAST(N'2020-07-13' AS Date), 11)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (47, N'Thác Khuổi Nghi', CAST(N'2020-07-14' AS Date), CAST(N'2020-07-14' AS Date), 11)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (48, N'Đèo Thung Khe', CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 12)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (49, N'Hang Kia', CAST(N'2020-07-22' AS Date), CAST(N'2020-07-22' AS Date), 12)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (50, N'Vườn mận Tà Xông A', CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 12)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (51, N'Thác Tạt Nàng', CAST(N'2020-07-22' AS Date), CAST(N'2020-07-22' AS Date), 12)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (52, N'Suối Long Đầu', CAST(N'2020-10-20' AS Date), CAST(N'2020-10-20' AS Date), 13)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (53, N'Linh địa cở Mẫu Sơn', CAST(N'2020-10-21' AS Date), CAST(N'2020-10-22' AS Date), 13)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (54, N'Núi Phặt Chỉ', CAST(N'2020-10-22' AS Date), CAST(N'2020-10-23' AS Date), 13)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (55, N'Thị xã Nghĩa Lộ', CAST(N'2020-11-20' AS Date), CAST(N'2020-11-20' AS Date), 14)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (56, N'Tú Lệ', CAST(N'2020-11-21' AS Date), CAST(N'2020-11-21' AS Date), 14)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (57, N'Đèo Khau Phạ', CAST(N'2020-11-22' AS Date), CAST(N'2020-11-22' AS Date), 14)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (58, N'La Pán Tẩn', CAST(N'2020-11-22' AS Date), CAST(N'2020-11-22' AS Date), 14)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (59, N'Hồ Yên Quang', CAST(N'2020-06-21' AS Date), CAST(N'2020-06-21' AS Date), 15)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (60, N'Khu Hồ Mạc', CAST(N'2020-06-22' AS Date), CAST(N'2020-06-22' AS Date), 15)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (61, N'Động Người Xưa', CAST(N'2020-06-22' AS Date), CAST(N'2020-06-22' AS Date), 15)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (62, N'Đỉnh Mây bạc', CAST(N'2020-06-23' AS Date), CAST(N'2020-06-23' AS Date), 15)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (63, N'Hang Măng Chiêng', CAST(N'2020-06-24' AS Date), CAST(N'2020-06-24' AS Date), 15)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (64, N'Hồ Núi Cốc', CAST(N'2020-02-13' AS Date), CAST(N'2020-02-13' AS Date), 16)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (65, N'Tam Đảo', CAST(N'2020-02-14' AS Date), CAST(N'2020-02-14' AS Date), 16)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (66, N'Vạn Thủy  Tú', CAST(N'2020-04-29' AS Date), CAST(N'2020-04-29' AS Date), 17)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (67, N'Tháp Chăm', CAST(N'2020-04-29' AS Date), CAST(N'2020-04-29' AS Date), 17)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (68, N'Bãi đá Ông Địa', CAST(N'2020-04-30' AS Date), CAST(N'2020-04-30' AS Date), 17)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (69, N'Suối Tiên', CAST(N'2020-04-30' AS Date), CAST(N'2020-04-30' AS Date), 17)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (70, N'Làng Chài', CAST(N'2020-05-01' AS Date), CAST(N'2020-05-01' AS Date), 17)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (71, N'Đồi cát Bàu Trắng', CAST(N'2020-05-01' AS Date), CAST(N'2020-05-01' AS Date), 17)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (72, N'Trường Dục Thanh', CAST(N'2020-12-22' AS Date), CAST(N'2020-12-22' AS Date), 18)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (73, N'Lầu Ông Hoàng', CAST(N'2020-12-22' AS Date), CAST(N'2020-12-22' AS Date), 18)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (74, N'Chùa Ông', CAST(N'2020-12-23' AS Date), CAST(N'2020-12-23' AS Date), 18)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (75, N'Chùa Nùi Tà Cú', CAST(N'2020-12-23' AS Date), CAST(N'2020-12-23' AS Date), 18)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (76, N'Đồi cát Bàu Trắng', CAST(N'2020-12-24' AS Date), CAST(N'2020-12-24' AS Date), 18)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (77, N'Thôn  Đhrôồng', CAST(N'2020-11-30' AS Date), CAST(N'2020-11-30' AS Date), 19)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (78, N'Đồi chè', CAST(N'2020-12-01' AS Date), CAST(N'2020-12-01' AS Date), 19)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (79, N'Cổng trời', CAST(N'2020-12-02' AS Date), CAST(N'2020-12-02' AS Date), 19)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (80, N'Bãi Biển Mỹ Khê', CAST(N'2020-07-02' AS Date), CAST(N'2020-07-02' AS Date), 20)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (81, N'Bán đảo Sơn Trà', CAST(N'2020-07-02' AS Date), CAST(N'2020-07-04' AS Date), 20)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (82, N'Chùa Linh Ứng', CAST(N'2020-07-02' AS Date), CAST(N'2020-07-02' AS Date), 20)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (83, N'Bãi Rạng', CAST(N'2020-07-03' AS Date), CAST(N'2020-07-03' AS Date), 20)
INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (84, N'Bãi Bắc', CAST(N'2020-07-04' AS Date), CAST(N'2020-07-03' AS Date), 20)
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
