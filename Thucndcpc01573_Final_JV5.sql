USE [master]
GO
/****** Object:  Database [J5Shop]    Script Date: 01/07/2022 11:20:45 ******/
CREATE DATABASE [J5Shop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'J5Shop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\J5Shop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'J5Shop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\J5Shop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [J5Shop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [J5Shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [J5Shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [J5Shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [J5Shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [J5Shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [J5Shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [J5Shop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [J5Shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [J5Shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [J5Shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [J5Shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [J5Shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [J5Shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [J5Shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [J5Shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [J5Shop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [J5Shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [J5Shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [J5Shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [J5Shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [J5Shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [J5Shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [J5Shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [J5Shop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [J5Shop] SET  MULTI_USER 
GO
ALTER DATABASE [J5Shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [J5Shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [J5Shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [J5Shop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [J5Shop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [J5Shop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [J5Shop] SET QUERY_STORE = OFF
GO
USE [J5Shop]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 01/07/2022 11:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Activated] [bit] NOT NULL,
	[Admin] [bit] NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 01/07/2022 11:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [char](4) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Icon] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 01/07/2022 11:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 01/07/2022 11:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 01/07/2022 11:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[image] [nvarchar](100) NOT NULL,
	[Price] [float] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [char](4) NOT NULL,
 CONSTRAINT [PK_Produts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'admin', N'admin', N'Xuân Nhi Nè', N'thucndcpc01573@fpt.edu.vn', N'0978215902', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'fpt1', N'123', N'Định', N'dinhtppc00576@fpt.edu.vn', N'0978215903', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'fpt2', N'123', N'Đạt', N'dat541@gmail.com', N'0978215904', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'fpt3', N'123', N'Hoa', N'hoapc00337@fpt.edu.vn', N'0978215905', 0, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'fpt4', N'123', N'Huệ', N'hueng@gmail.com', N'0978215906', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'fpt5', N'123', N'Kha', N'kha3@gmail.com', N'0978215907', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'fpt6', N'123', N'Lan', N'lalan@gmail.com', N'0978215908', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'fpt7', N'123', N'Mẫn', N'manman@gmail.com', N'0978215909', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'fpt8', N'123', N'Anh', N'annqpc00834@fpt.edu.vn', N'0978215910', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'ntkien', N'123456', N'Nguyễn Trung A', N'ntkienap@gmail.com', N'0978215911', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'ntkienap', N'123', N'Nguyễn Trung Kiên', N'2@gmail.com', N'0978215912', 0, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'ntkienap1', N'12312312', N'Nguyễn Trung Kiên 213', N'1@gmail.com', N'0978215913', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'tantai3004', N'123456', N'Đỗ Tấn Tài', N'dotantai31@gmail.com', N'0978215914', 1, 1)
GO
INSERT [dbo].[Categories] ([Id], [Name], [Icon]) VALUES (N'LAPT', N'Laptop', N'bi bi-laptop')
INSERT [dbo].[Categories] ([Id], [Name], [Icon]) VALUES (N'PHON', N'Điện Thoại', N'bi bi-phone')
INSERT [dbo].[Categories] ([Id], [Name], [Icon]) VALUES (N'PHUK', N'Phụ Kiện', N'bi bi-tools')
INSERT [dbo].[Categories] ([Id], [Name], [Icon]) VALUES (N'TABL', N'Máy Tính Bảng', N'bi bi-tablet-landscape')
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1, 1, 2, 41990000, 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Status]) VALUES (1, N'admin', CAST(N'2022-06-27T00:00:00.000' AS DateTime), N'sadas', 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1, N'MacBook M1 Pro 2021', N'apple-macbook-pro-14-m1-pro-2021-600x600.jpg', 48790000, CAST(N'2021-06-01' AS Date), 1, N'LAPT')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (2, N'MacBook M2 Pro 2022', N'apple-macbook-pro-m2-2022-xam-600x600.jpg', 41990000, CAST(N'2020-08-13' AS Date), 1, N'LAPT')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (3, N'MacBook Apple M2 2022', N'apple-macbook-air-m2-2022-xam-600x600.jpg', 39990000, CAST(N'2021-04-01' AS Date), 1, N'LAPT')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (4, N'MacBook Apple M2 10-Core', N'apple-macbook-pro-13-inch-m2-2022-xam-600x600.jpg', 35990000, CAST(N'2021-09-09' AS Date), 0, N'LAPT')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (5, N'Asus TUF Gaming FX506LH', N'asus-tuf-gaming-fx506lh-i5-hn188w-(12).jpg', 17990000, CAST(N'2021-05-31' AS Date), 1, N'LAPT')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (6, N'Asus Vivobook 15 X1502ZA', N'asus-vivobook-15-x1502za-i5-ej120w-600x600.jpg', 17690000, CAST(N'2021-05-25' AS Date), 0, N'LAPT')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (7, N'Asus ZenBook UX425EA', N'asus-zenbook-ux425ea-i5-ki839w-(18).jpg', 22990000, CAST(N'2021-01-27' AS Date), 1, N'LAPT')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (8, N'Asus Gaming ROG Flow', N'asus-gaming-rog-flow-z13-gz301z-i7-ld110w-160322-120057-600x600.jpg', 49490000, CAST(N'2021-05-17' AS Date), 1, N'LAPT')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (9, N'Asus ZenBook UX482EA', N'asus-zenbook-ux482ea-i5-1135g7-8gb-512gbtouch-600x600.jpg', 32490000, CAST(N'2021-02-20' AS Date), 1, N'LAPT')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (10, N'Asus ZenBook Duo', N'asus-zenbook-ux482ea-i5-ka274t-271021-093120-600x600.jpg', 31490000, CAST(N'2021-02-20' AS Date), 1, N'LAPT')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (11, N'Samsung Galaxy', N'Galaxy-S22-Ultra-Burgundy-600x600.jpg', 28990000, CAST(N'2021-05-31' AS Date), 1, N'PHON')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (12, N'iPhone 11 64GB', N'iphone-xi-xanhla-600x600.jpg', 13790000, CAST(N'2021-05-31' AS Date), 0, N'PHON')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (13, N'OPPO Reno7', N'oppo-reno7-z-5g-thumb-1-1-600x600.jpg', 17990000, CAST(N'2021-06-06' AS Date), 1, N'PHON')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (14, N'Realme C35 64GB', N'realme-c35-thumb-new-600x600.jpg', 4290000, CAST(N'2021-05-29' AS Date), 1, N'PHON')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (16, N'Xiaomi 11T 128GB', N'xiaomi-11t-(8).jpg', 10990000, CAST(N'2021-01-01' AS Date), 1, N'PHON')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (17, N'Vivo Y15a 64GB', N'Vivo-y15s-2021-xanh-den-660x600.jpg', 3490000, CAST(N'2021-05-31' AS Date), 1, N'PHON')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (18, N'OPPO A55 64GB', N'oppo-a55-4g-(6).jpg', 4490000, CAST(N'2021-02-20' AS Date), 1, N'PHON')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (19, N'Samsung Galaxy Z', N'samsung-galaxy-z-fold-3-(6).jpg', 34990000, CAST(N'2021-02-20' AS Date), 1, N'PHON')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (20, N'iPhone 13 Pro 128GB', N'iphone-13-pro-gold-1-600x600.jpg', 28790000, CAST(N'2021-02-20' AS Date), 1, N'PHON')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (21, N'TN Bluetooth True Wireless Rezo F15 ', N'bluetooth-true-wireless-rezo-f15-thumb-600x600.jpeg', 480000, CAST(N'2021-06-01' AS Date), 1, N'PHUK')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (22, N'Camera IP 4MP TP-Link Tapo 2022', N'camera-ip-ngoai-troi-4mp-tp-link-tapo-c320ws-trang-thumb-600x600.jpg', 1300000, CAST(N'2020-08-13' AS Date), 1, N'PHUK')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (23, N'Camera Hành Trình Vietmap R1', N'camera-hanh-trinh-vietmap-r1-den-1.-1-600x600.jpg', 3190000, CAST(N'2021-04-01' AS Date), 1, N'PHUK')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (24, N'Webcam 1080P Asus Rog Eye S', N'webcam-1080p-asus-rog-eye-s-den-1.-600x600.jpg', 1910000, CAST(N'2021-04-27' AS Date), 1, N'PHUK')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (25, N'Bàn phím không dây Microsoft', N'khong-day-microsoft-all-in-one-media-n9z-00028-den-ava-600x600.jpg', 890000, CAST(N'2021-04-01' AS Date), 1, N'PHUK')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (26, N'Chuột có dây Gaming Asus Keris', N'chuot-co-day-gaming-asus-keris-thumb-1-600x600.jpeg', 1125000, CAST(N'2021-01-27' AS Date), 1, N'PHUK')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (27, N'Đế Laptop WIWU S400 Nhôm Bạc', N'de-laptop-wiwu-s400-nhom-bac-600x600.jpg', 635000, CAST(N'2020-09-30' AS Date), 1, N'PHUK')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (28, N'Quạt sạc mini OSMIA CK-F050 2020', N'quat-sac-mini-osmia-ck-f050-600x600.jpg', 140000, CAST(N'2020-09-23' AS Date), 1, N'PHUK')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (29, N'TB Định vị thông minh AirTag 4', N'thiet-bi-dinh-vi-thong-minh-airtag-4-pack-mx542-600x600.jpg', 1950000, CAST(N'2021-06-06' AS Date), 1, N'PHUK')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (30, N'Vỏ bảo vệ AirTag Nhựa dẻo Nâu', N'tui-dung-airtag-nhua-deo-pu-well-jm-nau-1-600x600.jpg', 65000, CAST(N'2021-06-06' AS Date), 1, N'PHUK')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (31, N'Máy tính bảng Alcatel 3T8', N'alcatel-3t8-(4).jpg', 2440000, CAST(N'2021-06-06' AS Date), 1, N'TABL')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (32, N'Samsung Galaxy Tab S8', N'Samsung-Galaxy-Tab-s8-white-thumb-1-600x600.jpg', 18990000, CAST(N'2021-06-06' AS Date), 1, N'TABL')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (42, N'Samsung Galaxy Tab A7 Lite', N'samsung-galaxy-tab-a7-lite-gray-600x600.jpg', 3990000, CAST(N'2021-01-01' AS Date), 1, N'TABL')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (43, N'iPad Pro M1 WiFi Cellular', N'ipad-pro-2021-11-inch-silver-thumb-600x600.jpg', 34990000, CAST(N'2021-01-01' AS Date), 1, N'TABL')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (44, N'Galaxy Tab S8 Ultra', N'samsung-galaxy-tab-s8-ultra-1-600x600.jpg', 28990000, CAST(N'2021-01-01' AS Date), 1, N'TABL')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (45, N'iPad Pro M1 WiFi 128GB', N'ipad-pro-m1-129-inch-wifi-128gb-2021-(10).jpg', 25490000, CAST(N'2021-01-01' AS Date), 1, N'TABL')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (46, N'iPad Mini 6 WiFi 128GB 2020', N'ipad-mini-6-wifi-purple-1-600x600.jpg', 14390000, CAST(N'2021-01-01' AS Date), 1, N'TABL')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (47, N' iPad Air 4 Wifi 64GB 2020', N'ipad-air-4-wifi-64gb-2020-bac-600x600-600x600.jpg', 14590000, CAST(N'2021-01-01' AS Date), 1, N'TABL')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (48, N'Samsung Galaxy Tab S7', N'samsung-galaxy-tab-s7-thumb-xanh-600x600-600x600.jpg', 15990000, CAST(N'2021-01-01' AS Date), 1, N'TABL')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (49, N'iPad mini 6 WiFi Cellular', N'ipad-mini-6-wifi-cellular-grey-1-600x600.jpg', 17990000, CAST(N'2021-01-01' AS Date), 1, N'TABL')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (50, N'iPad Air 5 M1 Wifi Cellular', N'ipad-air-5-wifi-cellular-tim-thumb-600x600.jpg', 20290000, CAST(N'2021-01-01' AS Date), 1, N'TABL')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (51, N'OPPO Find X5 Pro', N'oppo-find-x5-pro-den-thumb-600x600.jpg', 30990000, CAST(N'2001-01-12' AS Date), 1, N'PHON')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (52, N'iPhone 12 Pro 512GB', N'iphone-12-pro-512gb-190720-020739-200x200.jpg', 28490000, CAST(N'2003-02-01' AS Date), 0, N'PHON')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (53, N'Samsung Galaxy S22', N'Galaxy-S22-Black-600x600.jpg', 19990000, CAST(N'2005-06-29' AS Date), 1, N'PHON')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (54, N'Xiaomi 11 Lite 5G NE ', N'xiaomi-11-lite-5g-ne-(8).jpg', 9490000, CAST(N'2001-01-12' AS Date), 1, N'PHON')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (55, N'Realme 9 Pro 5G', N'realme-9-pro-thumb-600x600.jpg', 7990000, CAST(N'2003-02-01' AS Date), 0, N'PHON')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (56, N'Cáp Type C Lightning 2m Apple', N'cap-type-c-lightning-2m-apple-mqgh2-trang-thumb-600x600.jpeg', 990000, CAST(N'2005-06-29' AS Date), 1, N'PHUK')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (57, N'Adapter Sạc USB Hydrus ACL2018', N'adapter-sac-usb-hydrus-acl2018-thumb-2-600x600.jpeg', 100000, CAST(N'2001-01-12' AS Date), 0, N'PHUK')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (58, N'Túi đựng AirPods Vịt Trắng', N'tui-dung-airpods-1-2-silicone-ck-ap018-osmia-vit-ava-600x600.jpg', 65000, CAST(N'2001-01-12' AS Date), 1, N'PHUK')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (59, N'Túi đựng AirPods Quả chuối vàng', N'tui-airpods-silicone-kem-moc-fr02-qua-chuoi-vang-600x600.jpg', 65000, CAST(N'2021-06-02' AS Date), 1, N'PHUK')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (60, N'Tai nghe Bluetooth AirPods 2', N'tai-nghe-bluetooth-airpods-2-wireless-charge-mrxj2-thumb-600x600.jpg', 3490000, CAST(N'2021-06-02' AS Date), 1, N'PHUK')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (61, N'Huawei MatePad 11 2020', N'huawei-matepad-11-9-1-600x600.jpg', 13990000, CAST(N'2021-06-02' AS Date), 1, N'TABL')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (62, N'Lenovo Yoga Tab 11 2022', N'lenovo-yoga-tab-11-thumb-600x600.jpg', 9790000, CAST(N'2021-06-02' AS Date), 1, N'TABL')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (63, N'Samsung Galaxy Tab A8', N'samsung-galaxy-tab-a8-(12).jpg', 7490000, CAST(N'1998-02-06' AS Date), 1, N'TABL')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (64, N'Huawei MatePad 128GB', N'huawei-matepad-xam-128gb-600x600.jpg', 6990000, CAST(N'1997-04-05' AS Date), 1, N'TABL')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (65, N'MTB Masstel Tab 10.4"', N'masstel-tab-104-grey-1-600x600.jpg', 4490000, CAST(N'1995-04-06' AS Date), 1, N'TABL')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (66, N'iPad 9 WiFi Cellular 64GB', N'ipad-gen-9-wifi-cellular-sliver-600x600.jpg', 11990000, CAST(N'1992-04-05' AS Date), 1, N'TABL')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (67, N'VivoBook Pro 15 OLED', N'asus-vivobook-pro-15-oled-k3500p-i5-l1386w-thumb-600x600.jpg', 28090000, CAST(N'2018-01-03' AS Date), 1, N'LAPT')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (68, N'Huawei MatePad T10 2021', N'Huawei-MatePad-T10-1-2-600x600.jpg', 3490000, CAST(N'2017-05-06' AS Date), 1, N'TABL')
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (69, N'Điện thoại Realme C35 64GB', N'realme-c35-thumb-new-600x600 (1_1656648125335_584.jpg', 4290000, CAST(N'2022-07-01' AS Date), 1, N'PHON')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
/****** Object:  Index [UK_OrderDetails]    Script Date: 01/07/2022 11:20:46 ******/
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [UK_OrderDetails] UNIQUE NONCLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders2] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders2]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FKaltatpxipsjtcih4d1h6bn0xr] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FKaltatpxipsjtcih4d1h6bn0xr]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Accounts1] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Accounts1]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Produts_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Produts_Categories]
GO
USE [master]
GO
ALTER DATABASE [J5Shop] SET  READ_WRITE 
GO
