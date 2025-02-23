USE [master]
GO
/****** Object:  Database [QLNhaHang]    Script Date: 6/3/2024 3:20:31 PM ******/
CREATE DATABASE [QLNhaHang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLNhaHang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QLNhaHang.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLNhaHang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QLNhaHang_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QLNhaHang] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLNhaHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLNhaHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLNhaHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLNhaHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLNhaHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLNhaHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLNhaHang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLNhaHang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLNhaHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLNhaHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLNhaHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLNhaHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLNhaHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLNhaHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLNhaHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLNhaHang] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLNhaHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLNhaHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLNhaHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLNhaHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLNhaHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLNhaHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLNhaHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLNhaHang] SET RECOVERY FULL 
GO
ALTER DATABASE [QLNhaHang] SET  MULTI_USER 
GO
ALTER DATABASE [QLNhaHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLNhaHang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLNhaHang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLNhaHang] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLNhaHang] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLNhaHang] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLNhaHang', N'ON'
GO
ALTER DATABASE [QLNhaHang] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLNhaHang] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QLNhaHang]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 6/3/2024 3:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](60) NOT NULL,
	[Password] [varchar](60) NOT NULL,
	[FullName] [varchar](60) NOT NULL,
	[Role] [varchar](10) NOT NULL,
	[Phone] [varchar](60) NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuItems]    Script Date: 6/3/2024 3:20:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItems](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NOT NULL,
	[Category] [nvarchar](60) NULL,
	[Available] [bit] NOT NULL,
 CONSTRAINT [PK__MenuItem__727E838B26DE39BB] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/3/2024 3:20:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
 CONSTRAINT [PK__OrderDet__D3B9D36C5B6E5E43] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/3/2024 3:20:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderTime] [datetime] NOT NULL,
	[Status] [nvarchar](60) NOT NULL,
	[AccountId] [int] NOT NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK__Orders__C3905BCF9E69ED90] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 6/3/2024 3:20:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[ReservationId] [int] IDENTITY(1,1) NOT NULL,
	[ReservationTime] [datetime] NOT NULL,
	[Status] [nvarchar](60) NOT NULL,
	[AccountId] [int] NOT NULL,
	[TableId] [int] NOT NULL,
	[Flag] [int] NOT NULL,
 CONSTRAINT [PK__Reservat__B7EE5F24C3635B6C] PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tables]    Script Date: 6/3/2024 3:20:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tables](
	[TableId] [int] IDENTITY(1,1) NOT NULL,
	[Number] [int] NOT NULL,
	[Status] [nvarchar](60) NOT NULL,
	[Seats] [int] NULL,
 CONSTRAINT [PK__Tables__7D5F01EE509113D6] PRIMARY KEY CLUSTERED 
(
	[TableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([AccountId], [Username], [Password], [FullName], [Role], [Phone]) VALUES (5, N'admin', N'$2a$10$OXJL5P5P9GwpnYfQjuI0.uO6YcIXqb/44W1tQso.WlsHH2Zs/lJi6', N'Admin', N'ADMIN', N'3213213')
INSERT [dbo].[Accounts] ([AccountId], [Username], [Password], [FullName], [Role], [Phone]) VALUES (10, N'member', N'$2a$10$coW0kt9gGG7ChtqE2ApKT.rjIKjYvH7lB/pucqzr9.0PG5chtCcqe', N'member', N'MEMBER', N'122326133')
INSERT [dbo].[Accounts] ([AccountId], [Username], [Password], [FullName], [Role], [Phone]) VALUES (11, N'hoang', N'$2a$10$I4eRKZh5uxnjdhrp66xVOOQypGM0ZTR6E3NCrJUcHNZxK5mw6nTVq', N'Hoang', N'MEMBER', N'09086634')
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuItems] ON 

INSERT [dbo].[MenuItems] ([ItemId], [Name], [Description], [Price], [Category], [Available]) VALUES (2, N'Sườn sào chua ngọt', N'Super', 1000000, N'Món kho', 1)
INSERT [dbo].[MenuItems] ([ItemId], [Name], [Description], [Price], [Category], [Available]) VALUES (3, N'Đào', N'Ngon bổ rẻ', 1000000, N'60 cân', 1)
INSERT [dbo].[MenuItems] ([ItemId], [Name], [Description], [Price], [Category], [Available]) VALUES (4, N'Canh cà chua trứng', N'', 10000, N'Canh', 1)
SET IDENTITY_INSERT [dbo].[MenuItems] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailId], [Quantity], [OrderId], [ItemId]) VALUES (11, 1, 15, 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [Quantity], [OrderId], [ItemId]) VALUES (12, 1, 15, 3)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [OrderTime], [Status], [AccountId], [Price]) VALUES (15, CAST(N'2024-06-03T00:00:00.000' AS DateTime), N'Chấp nhận', 11, 2000000)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Reservations] ON 

INSERT [dbo].[Reservations] ([ReservationId], [ReservationTime], [Status], [AccountId], [TableId], [Flag]) VALUES (1, CAST(N'2024-06-03T00:00:00.000' AS DateTime), N'Chờ duyệt', 10, 4, 0)
INSERT [dbo].[Reservations] ([ReservationId], [ReservationTime], [Status], [AccountId], [TableId], [Flag]) VALUES (2, CAST(N'2024-06-03T00:00:00.000' AS DateTime), N'Đã bị từ chối', 10, 4, -1)
INSERT [dbo].[Reservations] ([ReservationId], [ReservationTime], [Status], [AccountId], [TableId], [Flag]) VALUES (4, CAST(N'2024-06-03T00:00:00.000' AS DateTime), N'Đặt thành công', 11, 1, 1)
SET IDENTITY_INSERT [dbo].[Reservations] OFF
GO
SET IDENTITY_INSERT [dbo].[Tables] ON 

INSERT [dbo].[Tables] ([TableId], [Number], [Status], [Seats]) VALUES (1, 1, N'Trống', 4)
INSERT [dbo].[Tables] ([TableId], [Number], [Status], [Seats]) VALUES (2, 2, N'Trống', 4)
INSERT [dbo].[Tables] ([TableId], [Number], [Status], [Seats]) VALUES (3, 3, N'Trống', 4)
INSERT [dbo].[Tables] ([TableId], [Number], [Status], [Seats]) VALUES (4, 4, N'Trống', 3)
SET IDENTITY_INSERT [dbo].[Tables] OFF
GO
ALTER TABLE [dbo].[Tables] ADD  CONSTRAINT [DF_Tables_Seats]  DEFAULT ((0)) FOR [Seats]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_MenuItems] FOREIGN KEY([ItemId])
REFERENCES [dbo].[MenuItems] ([ItemId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_MenuItems]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Accounts]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Accounts]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Tables] FOREIGN KEY([TableId])
REFERENCES [dbo].[Tables] ([TableId])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Tables]
GO
USE [master]
GO
ALTER DATABASE [QLNhaHang] SET  READ_WRITE 
GO
