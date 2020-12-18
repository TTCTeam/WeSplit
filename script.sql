USE [master]
GO
/****** Object:  Database [WeSplit]    Script Date: 12/18/2020 3:39:00 PM ******/
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
/****** Object:  Table [dbo].[Image]    Script Date: 12/18/2020 3:39:02 PM ******/
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
/****** Object:  Table [dbo].[Member]    Script Date: 12/18/2020 3:39:02 PM ******/
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
/****** Object:  Table [dbo].[Payment]    Script Date: 12/18/2020 3:39:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NULL,
	[Cost] [int] NULL,
	[MemberID] [int] NULL,
 CONSTRAINT [PK_Paying] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusDescription]    Script Date: 12/18/2020 3:39:02 PM ******/
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
/****** Object:  Table [dbo].[Trip]    Script Date: 12/18/2020 3:39:02 PM ******/
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
/****** Object:  Table [dbo].[Waypoint]    Script Date: 12/18/2020 3:39:02 PM ******/
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

INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (1, N'./Images/PlaceImages/VinhHaLong.jpg', 1)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (2, N'./Images/PlaceImages/NhaHatLonHaNoi.jpg', 1)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (3, N'./Images/PlaceImages/PhuQuoc.jpg', 1)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (4, N'/Images/PlaceImages/QuangTruongBaDinh.jpg', 1)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (5, N'./Images/PlaceImages/RuongbacThang.jp', 1)
INSERT [dbo].[Image] ([ID], [ImagePath], [TripID]) VALUES (6, N'./Images/PlaceImages/DongBangSongCuuLong.jpg', 1)
SET IDENTITY_INSERT [dbo].[Image] OFF
GO
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (1, N'Thanh Trà', 1)
INSERT [dbo].[Member] ([ID], [Name], [TripID]) VALUES (2, N'Nhất Dương', 1)
SET IDENTITY_INSERT [dbo].[Member] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (1, N'Nước uống                                         ', 50000, 1)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (2, N'Ăn sáng                                           ', 75000, 2)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (3, N'Đổ xăng                                           ', 50000, 1)
INSERT [dbo].[Payment] ([ID], [Name], [Cost], [MemberID]) VALUES (4, N'Đổ xăng                                           ', 10000, 2)
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
INSERT [dbo].[StatusDescription] ([Status], [Description]) VALUES (1, N'Đã đi')
GO
SET IDENTITY_INSERT [dbo].[Trip] ON 

INSERT [dbo].[Trip] ([ID], [Name], [Destination], [DepartureDate], [ReturnDate], [Status]) VALUES (1, N'Bến Tre', N'Đi về quê ngoại', CAST(N'2020-07-18' AS Date), CAST(N'2020-07-30' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Trip] OFF
GO
SET IDENTITY_INSERT [dbo].[Waypoint] ON 

INSERT [dbo].[Waypoint] ([ID], [Location], [ArrivalTime], [LeavingTime], [TripID]) VALUES (1, N'Tiền Giang', CAST(N'2020-07-18' AS Date), CAST(N'2020-07-18' AS Date), 1)
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
