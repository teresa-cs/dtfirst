USE [master]
GO
/****** Object:  Database [demodb]    Script Date: 03/10/2021 10:45:11 ******/
CREATE DATABASE [demodb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'datadb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\demodb.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'datadb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\demodb_log.ldf' , SIZE = 7616KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [demodb] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [demodb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [demodb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [demodb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [demodb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [demodb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [demodb] SET ARITHABORT OFF 
GO
ALTER DATABASE [demodb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [demodb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [demodb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [demodb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [demodb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [demodb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [demodb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [demodb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [demodb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [demodb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [demodb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [demodb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [demodb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [demodb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [demodb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [demodb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [demodb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [demodb] SET RECOVERY FULL 
GO
ALTER DATABASE [demodb] SET  MULTI_USER 
GO
ALTER DATABASE [demodb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [demodb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [demodb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [demodb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [demodb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [demodb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [demodb] SET QUERY_STORE = OFF
GO
USE [demodb]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 03/10/2021 10:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[Description] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 03/10/2021 10:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order Details]    Script Date: 03/10/2021 10:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order Details](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Quanity] [smallint] NOT NULL,
	[Discount] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 03/10/2021 10:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Description] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 03/10/2021 10:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Description] [ntext] NULL,
	[CategoryID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 03/10/2021 10:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [nvarchar](10) NULL,
	[Description] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 03/10/2021 10:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Description] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (1, N'CÁC LOẠI TRỨNG', NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (2, N'CÁC LOẠI RAU-CỦ-QUẢ', NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (3, N'THỦY HẢI SẢN', NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (4, N'CÁC LOẠI SỮA TƯƠI', NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (5, N'CÁC LOẠI THỊT', NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [LastName], [FirstName], [Email], [Phone]) VALUES (1, N'Nguyễn Thị', N'Ngọc', N'thingoc.nguyen@gmail.com', N'0732582614')
INSERT [dbo].[Customers] ([CustomerID], [LastName], [FirstName], [Email], [Phone]) VALUES (2, N'Trần Văn', N'An', N'an.tranvan.@gmail.com', N'0853262253')
INSERT [dbo].[Customers] ([CustomerID], [LastName], [FirstName], [Email], [Phone]) VALUES (3, N'Lê Văn', N'Nam', N'nam.van@gmail.com', N'0135266642')
INSERT [dbo].[Customers] ([CustomerID], [LastName], [FirstName], [Email], [Phone]) VALUES (4, N'Trần Nguyễn', N'Như', N'nguyennhu.nguyen@gmail.com', N'0435268526')
INSERT [dbo].[Customers] ([CustomerID], [LastName], [FirstName], [Email], [Phone]) VALUES (5, N'Lê Ngọc Bảo', N'An', N'lengocbaoan@gmail.com', N'0824365478')
INSERT [dbo].[Customers] ([CustomerID], [LastName], [FirstName], [Email], [Phone]) VALUES (7, N'Võ ', N'Tuấn', N'tuan1234@gmail.com', N'0152546365')
INSERT [dbo].[Customers] ([CustomerID], [LastName], [FirstName], [Email], [Phone]) VALUES (8, N'Trần Ngọc', N'Hưng', N'hungngoc@gmail.com', N'0976565566')
INSERT [dbo].[Customers] ([CustomerID], [LastName], [FirstName], [Email], [Phone]) VALUES (9, N'Võ Thu', N'Lan', N'lantrantt12@gmail.com', N'0653686435')
INSERT [dbo].[Customers] ([CustomerID], [LastName], [FirstName], [Email], [Phone]) VALUES (14, N'Đỗ', N'Ngọc', N'qd@gmail.com', N'0117654654')
INSERT [dbo].[Customers] ([CustomerID], [LastName], [FirstName], [Email], [Phone]) VALUES (15, N'Nguyễn', N'Nhật', N'a@gmail', N'1111111111')
INSERT [dbo].[Customers] ([CustomerID], [LastName], [FirstName], [Email], [Phone]) VALUES (16, N'Hoàng', N'Thư', N'A@d.com', N'1111111111')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Price], [Quanity], [Discount]) VALUES (1, 1, 30000.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Price], [Quanity], [Discount]) VALUES (2, 3, 145000.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Price], [Quanity], [Discount]) VALUES (3, 4, 30000.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Price], [Quanity], [Discount]) VALUES (3, 6, 70000.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Price], [Quanity], [Discount]) VALUES (4, 3, 145000.0000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Price], [Quanity], [Discount]) VALUES (5, 7, 80000.0000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Price], [Quanity], [Discount]) VALUES (6, 1, 30000.0000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Price], [Quanity], [Discount]) VALUES (7, 7, 80000.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Price], [Quanity], [Discount]) VALUES (8, 2, 50000.0000, 3, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Price], [Quanity], [Discount]) VALUES (9, 5, 150000.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Price], [Quanity], [Discount]) VALUES (10, 5, 150000.0000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Price], [Quanity], [Discount]) VALUES (11, 6, 70000.0000, 4, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Price], [Quanity], [Discount]) VALUES (12, 1, 30000.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Price], [Quanity], [Discount]) VALUES (14, 7, 80000.0000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Price], [Quanity], [Discount]) VALUES (15, 1, 30000.0000, 1, 1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Price], [Quanity], [Discount]) VALUES (16, 2, 50000.0000, 2, 1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Price], [Quanity], [Discount]) VALUES (17, 4, 30.0000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [Price], [Quanity], [Discount]) VALUES (19, 4, 30000.0000, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Description]) VALUES (1, 3, CAST(N'2021-06-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Description]) VALUES (2, 4, CAST(N'2021-06-13T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Description]) VALUES (3, 2, CAST(N'2021-06-14T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Description]) VALUES (4, 5, CAST(N'2021-06-15T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Description]) VALUES (5, 8, CAST(N'2021-06-15T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Description]) VALUES (6, 9, CAST(N'2021-06-17T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Description]) VALUES (7, 7, CAST(N'2021-06-19T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Description]) VALUES (8, 14, CAST(N'2021-06-20T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Description]) VALUES (9, 1, CAST(N'2021-06-22T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Description]) VALUES (10, 9, CAST(N'2021-06-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Description]) VALUES (11, 5, CAST(N'2021-07-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Description]) VALUES (12, 1, CAST(N'2021-07-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Description]) VALUES (13, 4, CAST(N'2021-07-13T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Description]) VALUES (14, 8, CAST(N'2021-07-14T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Description]) VALUES (15, 1, CAST(N'2021-07-17T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Description]) VALUES (16, 2, CAST(N'2021-07-20T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Description]) VALUES (17, 1, CAST(N'2021-09-22T21:34:32.533' AS DateTime), NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Description]) VALUES (18, 1, CAST(N'2022-01-21T15:18:41.000' AS DateTime), NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Description]) VALUES (19, 3, CAST(N'2021-10-15T15:56:25.000' AS DateTime), NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Description]) VALUES (21, 1, CAST(N'2021-10-02T22:33:23.337' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Description], [CategoryID], [SupplierID]) VALUES (1, N'Cà chua', CAST(30000.00 AS Decimal(10, 2)), N'1 kg', 2, 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Description], [CategoryID], [SupplierID]) VALUES (2, N'Vải thiều Lục Ngạn', CAST(50000.00 AS Decimal(10, 2)), N'1 kg', 2, 7)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Description], [CategoryID], [SupplierID]) VALUES (3, N'Táo Mỹ', CAST(75000.00 AS Decimal(10, 2)), N'500 gram', 2, 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Description], [CategoryID], [SupplierID]) VALUES (4, N'Bí đỏ', CAST(30000.00 AS Decimal(10, 2)), N'1 kg', 2, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Description], [CategoryID], [SupplierID]) VALUES (5, N'Nho đen Mỹ', CAST(75000.00 AS Decimal(10, 2)), N'0,5', 2, 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Description], [CategoryID], [SupplierID]) VALUES (6, N'Thịt ba chỉ', CAST(70000.00 AS Decimal(10, 2)), N'500 gram', 5, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Description], [CategoryID], [SupplierID]) VALUES (7, N'Thịt ếch', CAST(80000.00 AS Decimal(10, 2)), N'1 kg', 1, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Description], [CategoryID], [SupplierID]) VALUES (9, N'Bơ Sáp', CAST(90000.00 AS Decimal(10, 2)), N'1kg', 2, 7)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Description], [CategoryID], [SupplierID]) VALUES (10, N'Thịt nạc vai', CAST(80000.00 AS Decimal(10, 2)), N'500 gram', 5, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [Address], [Phone], [Description]) VALUES (1, N'Công ty TNHH Hoa Minh', N'8/5,Nguyễn Kiệm, phường 14, Quận Phú Nhuận, TP.HCM', N'028555245', N'Cung cấp các loại thực phẩm sạch')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [Address], [Phone], [Description]) VALUES (2, N'Công ty Cổ Phần Ánh Dương', N'Khu công nghiêp 2, Thị Xã Dĩ An, Tỉnh Bình Dương', N'023598897', N'Cung cấp loại hoa quả theo hướng Oganic')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [Address], [Phone], [Description]) VALUES (3, N'Công ty Xuất nhập khẩu AZC', N'87 Trương Định, Quận 3, TP.HCM', N'028333578', N'Các loại trái cây nhập khẩu')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [Address], [Phone], [Description]) VALUES (4, N'Công ty Cổ Phần ZSA', N'Lô 3, Khu công nghiệp 3, Tỉnh Bình Dương', N'023668747', N'Các loại hải sản tươi sống')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [Address], [Phone], [Description]) VALUES (5, N'Công ty Xuất nhập khẩu QQA', N'233 Cộng Hòa, Quận Tân Bình, TP.HCM', N'023554698', N'Cung cấp các loại rau củ ngoại nhập')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [Address], [Phone], [Description]) VALUES (6, N'Công ty TNHH SUN', N'B101 Phố Nguyễn Hiền, Bách Khoa, Hai Bà Trưng, Hà Nội', N'024386823', N'Cung cấp các loại rau củ sạch')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [Address], [Phone], [Description]) VALUES (7, N'Hội nông sản Vải thiều Lục Ngạn', N'284 QL31, TT. Chũ, Lục Ngạn, Bắc Giang', N'0111111', N'Cung cấp Vải Thiều')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [Address], [Phone], [Description]) VALUES (8, N'Công ty Xuất nhập khẩu Andy', N'233 Trường Chinh, Quận Tân Bình, TP.HCM', N'00000', N'Cung cấp các loại nguyên liệu, gia vị')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName], [Password], [Description]) VALUES (1, N'hello', N'1234', NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order Details]  WITH CHECK ADD  CONSTRAINT [FK_OrderOrdersDetail] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [FK_OrderOrdersDetail]
GO
ALTER TABLE [dbo].[Order Details]  WITH CHECK ADD  CONSTRAINT [FK_ProductOrdersDetail] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [FK_ProductOrdersDetail]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_CustomerOeder] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_CustomerOeder]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_CategoryProduct] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_CategoryProduct]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_SupplierProduct] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_SupplierProduct]
GO
/****** Object:  StoredProcedure [dbo].[dh_tinhtong]    Script Date: 03/10/2021 10:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[dh_tinhtong]
as 
begin
set nocount on
select Orders.OrderID, Orders.CustomerID ,Orders.OrderDate,SUM([Order Details].Price* [Order Details].Quanity) as total
from Orders,[Order Details]
where Orders.OrderID= [Order Details].OrderID
group by Orders.OrderID,Orders.CustomerID,Orders.OrderDate
end
GO
USE [master]
GO
ALTER DATABASE [demodb] SET  READ_WRITE 
GO
