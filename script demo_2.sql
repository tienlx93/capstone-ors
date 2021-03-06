USE [master]
GO
/****** Object:  Database [ors]    Script Date: 09/28/2015 14:47:46 ******/
CREATE DATABASE [ors] ON  PRIMARY 
( NAME = N'ors', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\ors.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ors_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\ors_log.LDF' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ors] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ors].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ors] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ors] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ors] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ors] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ors] SET ARITHABORT OFF
GO
ALTER DATABASE [ors] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ors] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ors] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ors] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ors] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ors] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ors] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ors] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ors] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ors] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ors] SET  DISABLE_BROKER
GO
ALTER DATABASE [ors] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ors] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ors] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ors] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ors] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ors] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ors] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ors] SET  READ_WRITE
GO
ALTER DATABASE [ors] SET RECOVERY FULL
GO
ALTER DATABASE [ors] SET  MULTI_USER
GO
ALTER DATABASE [ors] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ors] SET DB_CHAINING OFF
GO
USE [ors]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Role] ON
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (2, N'Manager')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (3, N'Staff')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (4, N'Customer')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (5, N'Owner')
SET IDENTITY_INSERT [dbo].[Role] OFF
/****** Object:  Table [dbo].[RepairStatus]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepairStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_RepairStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RepairStatus] ON
INSERT [dbo].[RepairStatus] ([Id], [Name], [Description]) VALUES (1, N'Requested', N'Mới yêu cầu')
INSERT [dbo].[RepairStatus] ([Id], [Name], [Description]) VALUES (2, N'Accepted', N'Cần giao việc')
INSERT [dbo].[RepairStatus] ([Id], [Name], [Description]) VALUES (3, N'Done', N'Hoàn thành')
INSERT [dbo].[RepairStatus] ([Id], [Name], [Description]) VALUES (4, N'Canceled', N'Hủy')
INSERT [dbo].[RepairStatus] ([Id], [Name], [Description]) VALUES (5, N'Waiting Confirm', N'Chờ khách hàng xác nhận')
SET IDENTITY_INSERT [dbo].[RepairStatus] OFF
/****** Object:  Table [dbo].[PriceTerm]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceTerm](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_PriceTerm] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PriceTerm] ON
INSERT [dbo].[PriceTerm] ([Id], [Name], [Description]) VALUES (1, N'House', N'Nguyên căn')
INSERT [dbo].[PriceTerm] ([Id], [Name], [Description]) VALUES (2, N'Area', N'Trên m2')
INSERT [dbo].[PriceTerm] ([Id], [Name], [Description]) VALUES (4, N'Call', N'Liên hệ')
SET IDENTITY_INSERT [dbo].[PriceTerm] OFF
/****** Object:  Table [dbo].[PaymentTerm]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentTerm](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PaymentTime] [int] NOT NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_PaymentTerm] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PaymentTerm] ON
INSERT [dbo].[PaymentTerm] ([Id], [Name], [PaymentTime], [Description]) VALUES (1, N'1 month', 1, N'1 tháng')
INSERT [dbo].[PaymentTerm] ([Id], [Name], [PaymentTime], [Description]) VALUES (2, N'3 months', 3, N'3 tháng')
INSERT [dbo].[PaymentTerm] ([Id], [Name], [PaymentTime], [Description]) VALUES (3, N'6 months', 6, N'6 tháng')
SET IDENTITY_INSERT [dbo].[PaymentTerm] OFF
/****** Object:  Table [dbo].[OfficeStatus]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfficeStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_OfficeStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[OfficeStatus] ON
INSERT [dbo].[OfficeStatus] ([Id], [Name], [Description]) VALUES (1, N'Available', N'Chưa đặt')
INSERT [dbo].[OfficeStatus] ([Id], [Name], [Description]) VALUES (2, N'Occupied', N'Đã đặt')
INSERT [dbo].[OfficeStatus] ([Id], [Name], [Description]) VALUES (3, N'Deleted', N'Xóa')
INSERT [dbo].[OfficeStatus] ([Id], [Name], [Description]) VALUES (4, N'Created', N'Mới tạo')
SET IDENTITY_INSERT [dbo].[OfficeStatus] OFF
/****** Object:  Table [dbo].[RentalStatus]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalStatus](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_RentalStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[RentalStatus] ([Id], [Name], [Description]) VALUES (1, N'Requested', N'Chờ xử lí')
INSERT [dbo].[RentalStatus] ([Id], [Name], [Description]) VALUES (2, N'Assigned', N'Đã giao việc')
INSERT [dbo].[RentalStatus] ([Id], [Name], [Description]) VALUES (3, N'Done', N'Hoàn thành')
INSERT [dbo].[RentalStatus] ([Id], [Name], [Description]) VALUES (4, N'Canceled', N'Hủy')
INSERT [dbo].[RentalStatus] ([Id], [Name], [Description]) VALUES (5, N'Waiting Confirm', N'Chờ khách hàng xác nhận')
/****** Object:  Table [dbo].[RentalItemGroup]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalItemGroup](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_RentalItemGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([Id], [Name], [Description]) VALUES (1, N'House', N'Văn phòng nguyên căn')
INSERT [dbo].[Category] ([Id], [Name], [Description]) VALUES (2, N'Building', N'Tòa nhà văn phòng')
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  Table [dbo].[ContractStatus]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_ContractStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ContractStatus] ON
INSERT [dbo].[ContractStatus] ([Id], [Name], [Description]) VALUES (1, N'Available', N'Khả dụng')
INSERT [dbo].[ContractStatus] ([Id], [Name], [Description]) VALUES (2, N'Extend Requested', N'Yêu cầu gia hạn')
INSERT [dbo].[ContractStatus] ([Id], [Name], [Description]) VALUES (3, N'Cancel Requested', N'Yêu cầu trả trước hạn')
INSERT [dbo].[ContractStatus] ([Id], [Name], [Description]) VALUES (4, N'Expire', N'Hết hạn/ Hủy')
SET IDENTITY_INSERT [dbo].[ContractStatus] OFF
/****** Object:  Table [dbo].[AppointmentStatus]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppointmentStatus](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_AppointmentStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AppointmentStatus] ([Id], [Name], [Description]) VALUES (1, N'Pending', N'Chờ xử lí')
INSERT [dbo].[AppointmentStatus] ([Id], [Name], [Description]) VALUES (2, N'Assigned', N'Đã được giao')
INSERT [dbo].[AppointmentStatus] ([Id], [Name], [Description]) VALUES (3, N'Accepted', N'Chấp nhận')
INSERT [dbo].[AppointmentStatus] ([Id], [Name], [Description]) VALUES (4, N'Done', N'Hoàn thành')
INSERT [dbo].[AppointmentStatus] ([Id], [Name], [Description]) VALUES (5, N'Rejected', N'Hủy')
/****** Object:  Table [dbo].[AmenityGroup]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AmenityGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_AmenityGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AmenityGroup] ON
INSERT [dbo].[AmenityGroup] ([Id], [Name], [Description]) VALUES (1, N'Tiện nghi căn bản', N'Các tiện nghi gắn với văn phòng')
INSERT [dbo].[AmenityGroup] ([Id], [Name], [Description]) VALUES (2, N'Tiện nghi họp', N'Các loại phòng họp')
INSERT [dbo].[AmenityGroup] ([Id], [Name], [Description]) VALUES (3, N'Dịch vụ', N'Các dịch vụ')
INSERT [dbo].[AmenityGroup] ([Id], [Name], [Description]) VALUES (4, N'Vật dụng', N'Vật dụng để sửa chữa')
SET IDENTITY_INSERT [dbo].[AmenityGroup] OFF
/****** Object:  Table [dbo].[AccountStatus]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountStatus](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_AccountStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AccountStatus] ([Id], [Name], [Description]) VALUES (1, N'Normal', NULL)
INSERT [dbo].[AccountStatus] ([Id], [Name], [Description]) VALUES (2, N'Banned', NULL)
INSERT [dbo].[AccountStatus] ([Id], [Name], [Description]) VALUES (3, N'Deleted', NULL)
INSERT [dbo].[AccountStatus] ([Id], [Name], [Description]) VALUES (4, N'Created', NULL)
/****** Object:  Table [dbo].[Account]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'admin', N'12345678', N'admin@ors', 1, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'manager1', N'12345678', N'manager@ors', 2, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'owner1', N'12345678', N'owner@gmail.com', 5, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'owner2', N'12345678', N'onwer2@gmail.com', 5, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'staff1', N'12345678', N'abv@123', 3, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'staff2', N'12345678', N'staff2@123', 3, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'staff3', N'12345678', N'staff3@ors', 3, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'testmail', N'12345678', N'innarrajepp-5640@yopmail.com', 4, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'thanh', N'12345678', N'jiraiya_73@yahoo.com.vn', 4, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'user1', N'12345678', N'tienle_dl@yahoo.com', 4, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'user3', N'12345678', N'tienle_dl@yahoo.com', 4, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'user4', N'12345678', N'bestoneguy@gmail.com', 4, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'userb', N'12345678', N'tienle_dl@yahoo.com', 4, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'usertest', N'12345678', N'test@gmail.com', 4, 1)
/****** Object:  Table [dbo].[Amenity]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amenity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Weight] [int] NULL,
	[AmenityGroupId] [int] NULL,
	[Priority] [int] NULL,
	[Repairable] [bit] NULL,
 CONSTRAINT [PK_Amentity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Amenity] ON
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (2, N'Phòng tắm', NULL, 2, 1, NULL, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (3, N'Phòng ăn', NULL, 3, 1, NULL, 0)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (4, N'Thang máy', NULL, 6, 1, NULL, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (5, N'Bãi đỗ xe', NULL, 10, 1, NULL, 0)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (6, N'Sảnh', NULL, 11, 1, NULL, 0)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (7, N'Phòng họp', NULL, 10, 2, NULL, 0)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (8, N'Phòng họp trực tuyến', NULL, 11, 2, NULL, 0)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (9, N'Hội trường', NULL, 12, 2, NULL, 0)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (10, N'Hệ thống báo động', NULL, 1, 3, NULL, 0)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (11, N'Hệ thống chữa cháy', NULL, 2, 3, NULL, 0)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (12, N'Bảo vệ', NULL, 5, 3, NULL, 0)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (13, N'Camera', NULL, 6, 3, NULL, 0)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (14, N'IT hỗ trợ', NULL, 8, 3, NULL, 0)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (15, N'Dịch vụ vệ sinh', NULL, 12, 3, NULL, 0)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (16, N'Khu tiếp tân', NULL, 15, 3, NULL, 0)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (17, N'Đèn', NULL, 1, 4, 1, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (19, N'Bàn ghế', NULL, 4, 4, NULL, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (20, N'Điều hòa', NULL, 6, 4, NULL, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (21, N'Quạt trần', NULL, 7, 4, NULL, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (22, N'Wifi', NULL, 9, 4, 1, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (23, N'Internet', NULL, 10, 4, 1, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (24, N'Bảng viết', NULL, 15, 4, NULL, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (25, N'TV', NULL, 17, 4, NULL, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (26, N'Máy chiếu', NULL, 18, 4, NULL, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (27, N'Máy fax', NULL, 22, 4, NULL, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (28, N'Điện thoại bàn', NULL, 23, 4, 1, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (29, N'Máy in', NULL, 25, 4, NULL, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (30, N'Máy hủy giấy', NULL, 27, 4, NULL, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (31, N'Máy photocopy', NULL, 24, 4, NULL, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority], [Repairable]) VALUES (38, N'Truyền hình cáp', NULL, 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Amenity] OFF
/****** Object:  Table [dbo].[RentalItem]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Description] [ntext] NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
	[ImageUrl] [nvarchar](250) NULL,
	[OfficeType] [int] NULL,
	[GroupId] [int] NULL,
 CONSTRAINT [PK_RentalItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RentalItem] ON
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [OfficeType], [GroupId]) VALUES (1, N'Ghế xoay CX02', N'Ghế được làm bằng chun. Giữa các chun có khoảng cách nhất định nên tạo sự thông thoáng, mát mẻ khi ngồi, thích hợp khi dùng trong mùa hè.
Ghế tựa lưng cao nên có thể ngả đầu thoải mái để nghỉ ngơi.
Ghế có tay vịn. Chân ghế được làm bằng nhựa.
Ghế có 5 bánh xe di chuyển dễ dàng, tạo thuận lợi khi làm việc
Kích thước 700x710x1010/1110', 91000, 120, N'/upload/rental/00aef534-a46b-4183-8d7f-eb855acff550.jpg', 0, NULL)
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [OfficeType], [GroupId]) VALUES (2, N'Ghế lưới GL209', N'Ghế lưới chuyên viên khung nhựa, đệm tựa ghế bọc vải lưới. Chân mạ, tay ghế nhựa kết hợp thép mạ.
Rộng x Sâu x Cao:	610 x 600 x (1015 ÷ 1140)', 58000, 41, N'/upload/rental/36c744e8-9b60-4528-85aa-3edee0b7af10.jpg', 0, NULL)
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [OfficeType], [GroupId]) VALUES (3, N'Ghế xoay SG602H', N'Sản phẩm ghế lưng trung được thiết kế theo phong cách riêng biệt, phần lưng khá rộng rãi, mang lại cảm giác dễ chịu, có thể ngả ra mỗi khi làm việc căng thẳng. Chúng tôi cung cấp nhiều màu sắc để khách hàng lựa chọn ghế xoay văn phòng : Màu lông chuột, màu xanh da trời, màu xanh nước biển, màu đỏ .... 
Kích thước : W620  x D700 x H1140 -1270 mm', 110000, 50, N'/upload/rental/66c25429-d43c-4ee3-b8f2-0e3da114405a.jpg', 0, NULL)
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [OfficeType], [GroupId]) VALUES (4, N'Ghế chân quỳ QC062-U1', N'Ghế chân quỳ khung inox, đệm tựa ghế bọc vải lưới. Chân mạ, tay ghế nhựa kết hợp thép mạ. Rộng x Sâu x Cao: 610 x 600 x (1015 ÷ 1140)', 74000, 50, N'/upload/rental/d796e751-7074-4516-8499-e8e5a1100f74.PNG', 0, NULL)
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [OfficeType], [GroupId]) VALUES (5, N'Bàn trưởng phòng HR1885CNY2', N'Bộ bàn bao gồm: Bàn + tủ phụ + hộc.
Mặt bàn: gỗ Melamine vân sần dày 18 + tấm MDF sơn ánh bạc. Liên kết với tủ phụ và hộc bằng trụ mạ Ø88.
Chân bàn hộp vuông liên kết với bích đỡ bắt lên mặt bàn, chân sơn dán giấy cùng màu.
Yếm bàn tôn dày 0.7 mm đục lỗ vuông + tròn liên kết với chân vuông và liên kết với mặt bàn bằng trụ sơn ánh bạc Ø19×83.', 150000, 28, N'/upload/rental/cab29f67-67d5-410b-bc58-9565f0c4d527.jpg', 0, NULL)
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [OfficeType], [GroupId]) VALUES (6, N'Bàn trưởng phòng HR1885CNY1', N'Bộ bàn bao gồm: Bàn + tủ phụ + hộc.
Mặt bàn: gỗ Melamine vân sần dày 20+ tấm MDF sơn ánh bạc. Liên kết với tủ phụ và hộc bằng trụ mạ Ø90.
Chân bàn hộp vuông liên kết với bích đỡ bắt lên mặt bàn, chân sơn dán giấy cùng màu.
Yếm bàn tôn dày 0.7 mm đục lỗ vuông + tròn liên kết với chân vuông và liên kết với mặt bàn bằng trụ sơn ánh bạc Ø20×83.', 140000, 24, N'/upload/rental/09486aef-86ef-423e-aad4-c17c8ffff871.jpg', 0, NULL)
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [OfficeType], [GroupId]) VALUES (7, N'Bàn trưởng phòng HR1885CNY3', N'Bộ bàn bao gồm: Bàn + tủ phụ + hộc.
Mặt bàn: gỗ Melamine vân sần dày 15 + tấm MDF sơn ánh bạc. Liên kết với tủ phụ và hộc bằng trụ mạ Ø90.
Chân bàn hộp vuông liên kết với bích đỡ bắt lên mặt bàn, chân sơn dán giấy cùng màu.
Yếm bàn tôn dày 0.7 mm đục lỗ vuông + tròn liên kết với chân vuông và liên kết với mặt bàn bằng trụ sơn ánh bạc Ø20×83.', 180000, 25, N'/upload/rental/f98570a9-e633-4870-bfff-cec9da7e5b03.jpg', 0, NULL)
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [OfficeType], [GroupId]) VALUES (8, N'Ghế giám đốc DT1890H1', N'Bộ bàn giám đốc sơn PU cao cấp. Mặt bàn dày 80mm hình chữ nhật,có miếng da phần ngồi viết, yếm thẳng, chân dày 61mm, hộc cố định liền chân. Được thiết kế phù hợp với không gian văn phòng cao cấp.', 110000, 15, N'/upload/rental/b98385ca-2b46-4d9a-9aab-89d8c6f6cded.jpg', 2, NULL)
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [OfficeType], [GroupId]) VALUES (9, N'Ghế giám đốc DT1890H1', N'Kích thước:  W1800 x D900 x H760 mm
Mặt bàn lượn cong dày 80mm, có miếng da phần ngồi viết.
Chân hộp chữ nhật , liên kết với yếm bằng chốt mạ. Yếm giật 2 cấp, soi rãnh hình quả trám có hạt ', 130000, 15, N'/upload/rental/eb6979ad-0758-451e-8c0b-c94c279351e0.jpg', 2, NULL)
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [OfficeType], [GroupId]) VALUES (10, N'Ghế giám đốc DT1890H1', N'Bộ bàn giám đốc sơn PU cao cấp. Mặt bàn dày 80mm, được thiết kế phù hợp với không gian văn phòng cao cấp', 100000, 15, N'/upload/rental/5b529660-8fab-441e-bf4b-b6d8f13c44e0.jpg', 2, NULL)
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [OfficeType], [GroupId]) VALUES (11, N'Ghế  phòng chờ PC202T1-C1', N'Ghế phòng chờ chân chữ T1 50x50 sơn tĩnh điện, chân tăng chỉnh, đệm nhựa C1 hoặc đệm C2
Kích thước W955 x D470 x H810mm . Dãy gồm 2 ghế', 100000, 35, N'/upload/rental/ed1f62c4-a2e6-4a8d-b83e-b256f125c803.PNG', 2, NULL)
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [OfficeType], [GroupId]) VALUES (12, N'Ghế  phòng chờ GC02', N'Mặt nhựa được thiết kế vững, kiểu dáng thời trang, 3 màu: xanh, đỏ vàng.
Sử dụng vật liệu nhựa đặc biệt có độ bóng, độ cứng bề mặt cao, hạn chế trầy xước.
Tựa lưng đàn hồi. ', 50000, 35, N'/upload/rental/6127e53a-abae-490d-bd12-e486c52dbfa1.PNG', 2, NULL)
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [OfficeType], [GroupId]) VALUES (13, N'Ghế  phòng chờ GC04LC', N'Ghế phòng chờ dây chun lưng cao có đệm đầu, 3/4 chỗ ngồi, chân sơn tĩnh điện
Kích thước GC04LC-3	: W1520x D700x H1020', 58000, 35, N'/upload/rental/9debee27-11b4-4514-9b40-248d47e6c7ca.PNG', 2, NULL)
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [OfficeType], [GroupId]) VALUES (14, N'Ghế  phòng chờ GC01', N'Ghế phòng chờ dây chun lưng cao có đệm đầu, 3/4 chỗ ngồi, chân sơn tĩnh điện
Kích thước GC01	: W1020x D500x H1020', 45000, 35, N'/upload/rental/cfbdd594-17b4-4c3d-af7c-f4647b458cc1.PNG', 1, NULL)
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [OfficeType], [GroupId]) VALUES (15, N'Bàn làm việc HR-MD01', N'Module bàn làm việc Hòa Phát HR-MD01 bao gồm:
4 chỗ, mặt bàn thẳng , hộc 3 ngăn kéo chung hậu, vách ngăn VN HP02.
Ở giữa có thể đặt máy in để sử dụng 1 cách tiện lợi nhất.
Module được làm từ chất liệu gỗ MFC, bề mặt phủ Laminate nhập khẩu.
Sản phẩm thích hợp cho việc sử dụng máy vi tính trong các văn phòng.
Kích thước : W2810 x D1420 x H1100 mm', 65000, 35, N'/upload/rental/78173268-974c-4fe5-87f0-7bf2a015a50c.jpg', 1, NULL)
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [OfficeType], [GroupId]) VALUES (16, N'Ghế  phòng chờ GC04LC', N'Ghế phòng chờ 2 chỗ ngồi mặt, sơn tĩnh điện đệm và lưng bọc da PVC, chân sơn
Kích thước GC04LC: W1020x D500x H1020', 35000, 35, N'/upload/rental/a9001666-8b56-40c7-ae66-19bab9fa5e89.PNG', 1, NULL)
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [OfficeType], [GroupId]) VALUES (17, N'Bàn làm việc HR-MD02', N'Module bàn làm việc Hòa Phát HR-MD02 bao gồm:
4 chỗ, mặt bàn thẳng , hộc 3 ngăn kéo chung hậu, vách ngăn VN HP02.
Ở giữa có thể đặt máy in để sử dụng 1 cách tiện lợi nhất.
Module được làm từ chất liệu gỗ MFC, bề mặt phủ Laminate nhập khẩu.
Sản phẩm thích hợp cho việc sử dụng máy vi tính trong các văn phòng.
Kích thước : W2810 x D1420 x H1100 mm', 64000, 50, N'/upload/rental/5b381dee-d78a-422f-83e6-bb939c18f4e3.jpg', 1, NULL)
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [OfficeType], [GroupId]) VALUES (18, N'Bàn làm việc HR-MD03', N'Module bàn làm việc Hòa Phát HR-MD03 bao gồm:
4 chỗ, mặt bàn thẳng , hộc 3 ngăn kéo chung hậu, vách ngăn VN HP02.
Ở giữa có thể đặt máy in để sử dụng 1 cách tiện lợi nhất.
Module được làm từ chất liệu gỗ MFC, bề mặt phủ Laminate nhập khẩu.
Sản phẩm thích hợp cho việc sử dụng máy vi tính trong các văn phòng.
Kích thước : W2810 x D1420 x H1100 mm', 67000, 50, N'/upload/rental/f0de696c-772a-4daf-a96d-3746c66c1ed3.jpg', 1, NULL)
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [OfficeType], [GroupId]) VALUES (19, N'Bàn họp CT2010H5', N'Bàn họp sơn PU cao cấp CT2010H5
Mặt bàn lượn cong 4 phía. Chất liệu gỗ công nghiệp MDF sơn PU. Chân bàn ghép hộp trang chí bằng thanh nhựa mạ. Mặt bàn soi rãnh trang trí. Ở giữa sơn khác màu
Kích thước : W2000 x D1000 x H760 mm', 47000, 50, N'/upload/rental/ca1dc844-7612-4f3d-a228-831709cd662b.jpg', 1, NULL)
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [OfficeType], [GroupId]) VALUES (20, N'Bàn họp CT2010H5', N'Bàn Họp thuộc dòng sản phẩm mới của nội thất hòa phát với kiểu dáng tinh tế
Bàn họp quây, ở giữa rỗng và có sử dụng ngăn tài liệu
Bàn họp được ghép bởi bốn phần lại với nhau
Kích Thước: W4000 x D1600 x H750', 62000, 50, N'/upload/rental/6b4a1aa1-6402-4a84-a0d9-607469bc1d41.jpg', 1, NULL)
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [OfficeType], [GroupId]) VALUES (21, N'Bàn họp ATH2812OV', N'Bàn Họp thuộc dòng sản phẩm mới của nội thất hòa phát với kiểu dáng tinh tế
Bàn họp quây, ở giữa rỗng và có sử dụng ngăn tài liệu
Bàn họp được ghép bởi bốn phần lại với nhau
Kích Thước: W4000 x D1600 x H750', 59000, 50, N'/upload/rental/6ef3dce5-7842-42a1-b3b5-43e73605ac38.jpg', 1, NULL)
SET IDENTITY_INSERT [dbo].[RentalItem] OFF
/****** Object:  Table [dbo].[Profile]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Profile](
	[Username] [nvarchar](50) NOT NULL,
	[Title] [char](4) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Company] [nvarchar](100) NULL,
	[Phone] [varchar](15) NOT NULL,
	[Address] [nvarchar](150) NULL,
	[Birthday] [datetime] NULL,
 CONSTRAINT [PK_Profile_1] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_Profile] ON [dbo].[Profile] 
(
	[Username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[Profile] ([Username], [Title], [FullName], [Company], [Phone], [Address], [Birthday]) VALUES (N'admin', N'Ông ', N'Nguyễn Trọng Hưng', N'ORS', N'01214145115', N'Công Ty ORS', CAST(0x000080C600000000 AS DateTime))
INSERT [dbo].[Profile] ([Username], [Title], [FullName], [Company], [Phone], [Address], [Birthday]) VALUES (N'manager1', N'Ông ', N'Trương Tiến Thành', N'ORS', N'01636016405', N'31/49 Ung Văn Khiêm, Q Bình Thạnh', CAST(0x000084F600000000 AS DateTime))
INSERT [dbo].[Profile] ([Username], [Title], [FullName], [Company], [Phone], [Address], [Birthday]) VALUES (N'owner1', N'Ông ', N'Nguyễn Vũ Hoàng Quốc', N'Công ty TNHH kinh doanh bất động sản Quốc Hoàng', N'0933690486', N'144 Tô Ký, Quận 12, TP HCM', CAST(0x000084F500000000 AS DateTime))
INSERT [dbo].[Profile] ([Username], [Title], [FullName], [Company], [Phone], [Address], [Birthday]) VALUES (N'owner2', N'Ông ', N'Nguyễn Huy', N'Công ty TNHH một thành viên Nguyễn Huy', N'01234567890', N'155 Cộng Hòa, Tp Hồ Chí Minh', CAST(0x00007DAD00000000 AS DateTime))
INSERT [dbo].[Profile] ([Username], [Title], [FullName], [Company], [Phone], [Address], [Birthday]) VALUES (N'staff1', N'Ông ', N'Trần Quang Trung', N'ORS', N'01234512451', N'Công Ty ORS1', CAST(0x000084B000000000 AS DateTime))
INSERT [dbo].[Profile] ([Username], [Title], [FullName], [Company], [Phone], [Address], [Birthday]) VALUES (N'staff2', N'Bà  ', N'Trương Trung Trực', N'ORS', N'01212121411', N'Công Ty ORS', CAST(0x0000861D00000000 AS DateTime))
INSERT [dbo].[Profile] ([Username], [Title], [FullName], [Company], [Phone], [Address], [Birthday]) VALUES (N'staff3', N'Ông ', N'Nguyễn Văn An', N'ORS', N'01314141451', N'Công Ty ORS', CAST(0x0000861D00000000 AS DateTime))
INSERT [dbo].[Profile] ([Username], [Title], [FullName], [Company], [Phone], [Address], [Birthday]) VALUES (N'testmail', N'Ông ', N'Nguyen Minh', NULL, N'01636016405', N'12 To Ky, Q12', CAST(0x000084F5011826C0 AS DateTime))
INSERT [dbo].[Profile] ([Username], [Title], [FullName], [Company], [Phone], [Address], [Birthday]) VALUES (N'thanh', N'Ông ', N'Tien Thanh', NULL, N'0933690486', NULL, CAST(0x000084FD00000000 AS DateTime))
INSERT [dbo].[Profile] ([Username], [Title], [FullName], [Company], [Phone], [Address], [Birthday]) VALUES (N'user1', N'Ông ', N'Lê Xuân Tiến', NULL, N'01636016405', N'12 Hải Triều, Quận Bình Thạnh', CAST(0x00008067011826C0 AS DateTime))
INSERT [dbo].[Profile] ([Username], [Title], [FullName], [Company], [Phone], [Address], [Birthday]) VALUES (N'user3', N'Ông ', N'Nguyễn Văn Ba', N'Cty', N'01212340231', N'12 Trần Hưng Đạo, Quận 1, HCM', CAST(0x0000852C00000000 AS DateTime))
INSERT [dbo].[Profile] ([Username], [Title], [FullName], [Company], [Phone], [Address], [Birthday]) VALUES (N'user4', N'Ông ', N'Nguyễn Văn Bốn', N'Cty', N'01636016405', N'24 Tô Kí, Q 12, HCM', CAST(0x000084F800000000 AS DateTime))
INSERT [dbo].[Profile] ([Username], [Title], [FullName], [Company], [Phone], [Address], [Birthday]) VALUES (N'userb', N'Bà  ', N'Lê Thị B', NULL, N'0123456785', N'Tại Gia', CAST(0x00007DAB00000000 AS DateTime))
INSERT [dbo].[Profile] ([Username], [Title], [FullName], [Company], [Phone], [Address], [Birthday]) VALUES (N'usertest', N'Ông ', N'Le Trung', NULL, N'01212312312', N'144 Trường Chinh, TP HCM', CAST(0x000084F500000000 AS DateTime))
/****** Object:  Table [dbo].[EmailQueue]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailQueue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[OfficeIds] [nvarchar](50) NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_EmailQueue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestOffice]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestOffice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerUsername] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NULL,
	[Price] [int] NULL,
	[Area] [float] NULL,
	[District] [nvarchar](50) NULL,
	[CreateDate] [datetime] NOT NULL,
	[ScheduleDate] [datetime] NULL,
	[OfficeSuggested] [nvarchar](250) NULL,
	[Available] [bit] NOT NULL,
 CONSTRAINT [PK_RequestOffice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RequestOffice] ON
INSERT [dbo].[RequestOffice] ([Id], [CustomerUsername], [CategoryId], [Price], [Area], [District], [CreateDate], [ScheduleDate], [OfficeSuggested], [Available]) VALUES (2, N'user1', 1, 100000, 5000, N'Quận 1', CAST(0x0000A51E010A6288 AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[RequestOffice] OFF
/****** Object:  Table [dbo].[Office]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Office](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[Description] [ntext] NOT NULL,
	[Price] [bigint] NULL,
	[PriceTerm] [int] NOT NULL,
	[FloorNumber] [int] NOT NULL,
	[Area] [float] NOT NULL,
	[ImageUrls] [text] NULL,
	[Address] [nvarchar](150) NOT NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[District] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[ParentOfficeId] [int] NULL,
	[CreateDate] [datetime] NOT NULL,
	[ViewCount] [int] NULL,
	[BasePrice] [bigint] NULL,
	[MinArea] [float] NULL,
	[MinTime] [int] NULL,
	[Commission] [int] NULL,
	[OwnerUsername] [nvarchar](50) NULL,
 CONSTRAINT [PK_Office] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Office] ON
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (4, N'Cao Ốc Văn Phòng Green Country', 2, 1, N'Tiền điện:	Theo giá điện kinh doanh', 250000, 2, 1, 1500, N'/upload/1438027817367/office33.jpg,', N'phường Tân Quy, Hồ Chí Minh, Quận 7, Việt Nam', 10.7409584, 106.71019580000008, N'Quận 7', N'Hồ Chí Minh', NULL, CAST(0x0000A50E010B686A AS DateTime), 31, 250000, 100, 3, 5, N'owner1')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (7, N'Cao ốc văn phòng Thái An', 2, 2, N'Tòa nhà văn phòng mới, hiện đại gồm 1 tầng hầm rộng rãi, 14 tầng nổi.
Tòa nhà cao, thoáng, tầm nhìn rộng, MT đường QL1A, ngay TT Phần Mềm Quang Trung & Gần Ngã 4 An Sương.
Có chỗ đỗ ô tô, có bãi đỗ xe tiện đi lại giao dịch với các ngân hàng và các cơ quan lớn.', 150000, 2, 14, 7500, N'/upload/1438072962396/20150724174157-27c1.jpg,', N'Quốc lộ 1A, Hồ Chí Minh, Quận 12, Việt Nam', 10.8620419, 106.6748791, N'Quận 12', N'Hồ Chí Minh', NULL, CAST(0x0000A50E0103D27B AS DateTime), 16, 120000, 150, 3, 5, N'owner1')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (8, N'VĂN PHÒNG LƯU NGUYỄN', 2, 1, N' Tầng 1: 180m2, 2 phòng ngủ, 2 phòng khách, 1 phòng bếp, sảnh lớn.
- Tầng 2 3 4: Mỗi tầng 200m2 gồm 5 phòng ngủ 1 phòng bếp 1 phòng khách.
- Phòng ngủ: 25 - 35m2/phòng.
- Free: Internet, tivi cab, security 24/24, để xe, giặt đồ.
- Hầm để xe có kho hàng 40m2.
- Dịch vụ vệ sinh dọn phòng.', 131000, 2, 4, 800, N'/upload/1438993420728/office18.jpg,/upload/1438993420728/office28.jpg,', N'12 Trần Hưng Đạo, Hồ Chí Minh, Quận 1, Việt Nam', 10.7915388, 106.73083539999992, N'Quận 1', N'Hồ Chí Minh', NULL, CAST(0x0000A4EE00076122 AS DateTime), 8, 131000, 100, 3, 5, N'owner2')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (9, N'TÒA NHÀ 242 CỐNG QUỲNH, QUẬN 1', 2, 1, N'Vị trí: Cách vòng xoay chợ Nguyễn Thái Bình khoảng 20m, đối diện siêu thị Hà Nội.
Diện tích: 350 - 485m2/sàn.
Giá thuê: 480.500 đồng/m2/tháng.
Mô tả chi tiết: Tòa nhà văn phòng 14 tầng, 02 tầng hầm, 01 tầng lửng, tòa nhà mới, có nhiều công ty tài chính tọa lạc.', 480000, 2, 2, 350, N'/upload/1438993037134/office11.jpg,/upload/1438993037134/office14.jpg,', N'242 Cống Quỳnh, Hồ Chí Minh, Việt Nam', 10.7669219, 106.68780979999995, N'Quận 1', N'Hồ Chí Minh', NULL, CAST(0x0000A4EE00068ED3 AS DateTime), 2, 480000, 150, 3, 5, N'owner1')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (10, N'Artexport House', 2, 1, N'Với mức giá tương đối mềm so với nhiều tòa nhà khu vực trung tâm quận Hoàn Kiếm, Artexport House là tòa nhà văn phòng hạng B có vị trí đẹp, thiết kế sang trọng và hiện đại đã và đang là sự lựa chọn của đa số các tập đoàn trong và ngoài nước tại Hà Nội. 
Vị trí tòa nhà Nằm tại số 2 Phạm Sư Mạnh, Quận Hoàn Kiếm, Artexport House chiếm một vị trí vô cùng đắc địa. Phía trước là mặt đường lớn, giao thông thuận lợi, xung quanh là nhiều cơ quan bộ ngành và tòa nhà văn phòng đang được nhiều doanh nghiệp trong và ngoài nước đang thuê hoạt động phát triển: ACB Office Building, tòa nhà Sun City, tòa nhà 18 Lý Thường Kiệt, tòa nhà Vinaplast… 
Thiết kế tòa nhà Artexport House là tòa nhà văn phòng hạng B được xây dựng trên diện tích tổng thể 800m2. Trong đó, diện tích xây dựng 700m2 gồm 10 tầng văn phòng và 1 tầng hầm. Với diện tích cho thuê mỗi sàn 600m2, tòa nhà văn phòng Artexport House được chia nhỏ linh hoạt với diện tích nhỏ nhất từ 41m2 phù hợp với quy mô và nhu cầu sử dụng đa dạng của các doanh nghiệp thuê. 
Tiện ích tòa nhà văn phòng Là văn phòng hạng B, trang thiết bị lắp ráp trong tòa nhà đều được trang bị theo tiêu chuẩn quốc tế đáp ứng đầy đủ nhu cầu và công năng sử dụng của doanh nghiệp thuê. Ngoài ra, với vị trí trung tâm, tòa nhà văn phòng còn được thừa hưởng nhiều giá trị và tiện ích của khu vực xung quanh: ngân hàng, nhà hàng, khách sạn, khu trung tâm thương mại dịch vụ và vui chơi giải trí…
 Với vị trí và thiết kế hiện đại, linh hoạt, Artexport House là một trong những vị trí lý tưởng cho nhiều doanh nghiệp đang có nhu cầu mở rộng quy mô và hoạt động kinh doanh tại khu vực trung tâm Hà Nội.', 550000, 2, 10, 1400, N'/upload/1438994737894/office26.jpg,/upload/1438994737894/office34.jpg,', N'2 Nguyễn Văn Quá, Hồ Chí Minh, Việt Nam', 10.8279966, 106.62671079999996, N'Quận 12', N'Hồ Chí Minh', NULL, CAST(0x0000A51400283B44 AS DateTime), 3, 550000, 150, 3, 5, N'owner1')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (51, N'CAO ỐC VĂN PHÒNG LIM TOWER', 2, 1, N'- LIM Tower thuộc chuỗi văn phòng cho thuê quận 1 tọa lạc trên mặt tiền đường Tôn Đức Thắng , Quận 1. Từ LIM Tower ra trung tâm quận 1 chỉ cần 5 phút đi xe máy. Gần LIM Tower có các cao ốc sang trọng bật nhất tại thành phố như: Saigon Trade Center, Green Power, Miss Áo Dài Building, Gemadept Tower...
 
- Giao thông tại cao ốc văn phòng LIM Tower:
+ Cách sở thú khoảng 5 phút đi xe máy .
+ Cách cầu Thủ Thiêm chỉ cần 5 phút đi xem máy.
+ Cách bến xe Bus khoảng 3 phút đi bộ.
+ Cách đài truyền hình Thành Phố Hồ Chí Minh 10 phút đi bộ.
+ Cách nhà thờ Đức Bà khoảng 5 phút đi xe máy.', 225000, 2, 4, 850, N'/upload/1436458919393/1.jpg,', N'20 Cộng Hoà, Cộng Hòa, Phường 4, Hồ Chí Minh, Việt Nam', 10.801496, 106.65491900000006, N'Tân Bình', N'Hồ Chí Minh', NULL, CAST(0x0000A514002867E3 AS DateTime), 4, 225000, 100, 3, 5, N'owner1')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (52, N'Văn phòng Vũ Tông Phan', 1, 2, N'Diện tích 92,5m2, có 2 phòng làm việc, máy lạnh, máy nước nóng đầy đủ.
+ Có cầu thang riêng biệt, 2 vệ sinh.
+ Ô tô đỗ thoải mái làm văn phòng công ty, văn phòng đại diện (hoặc nhà ở).
- Giá: 8 triệu/tháng.', 8000000, 1, 1, 92, N'/upload/1436459127006/2.jpg,', N'711 Vũ Tông Phan, Hồ Chí Minh, Việt Nam', 10.7984613, 106.74455480000006, N'Quận 2', N'Hồ Chí Minh', NULL, CAST(0x0000A51400288CE3 AS DateTime), 3, 8000000, 92, 3, 5, N'owner1')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (53, N'CAO ỐC NORCH BUILDING', 2, 1, N'Tòa nhà Norch Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng C. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Tòa nhà văn phòng cho thuê Norch Building cao 12 tầng diện tích sàn 394m2 sử dụng 2 thang máy tốc độ cao , hệ thống PCCC, hệ thống báo cháy và chữa cháy tự động theo tiêu chuẩn hệ thống, 01 máy phát điện dự phòng 1000 KW…Bên cạnh đó, nơi đây còn có đội ngũ quản lý chuyên nghiệp và lực lượng bảo vệ 24/24h.f', 195000, 2, 9, 3000, N'/upload/1436459253685/4.jpg,', N'30 Phan Thúc Duyện, Hồ Chí Minh, Tân Bình, Việt Nam', 10.8039269, 106.66205680000007, N'Tân Bình', N'Hồ Chí Minh', NULL, CAST(0x0000A5140028DF34 AS DateTime), 4, 195000, 100, 3, 5, N'owner2')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (54, N'TÒA NHÀ IES BUILDING', 2, 1, N'Tòa nhà IES Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng Giá rẻ. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu tốt. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định. 

Cao ốc văn phòng IES Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng IES Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.', 312000, 2, 20, 2500, N'/upload/1436459340720/5.jpg,/upload/1436459340720/6.jpg,', N'60 Phan Xích Long, Phú Nhuận, Hồ Chí Minh, Việt Nam', 10.800146, 106.68410900000004, N'Phú Nhuận', N'Hồ Chí Minh', NULL, CAST(0x0000A4D0018357FD AS DateTime), 1, 312000, 150, 3, 5, N'owner1')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (55, N'CAO ỐC TKT BUILDING', 2, 1, N'Tòa nhà TKT Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng C. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.', 289000, 2, 10, 5000, N'/upload/1436459418791/7.jpg,/upload/1436459418791/4.jpg,', N'200/1 Lũy Bán Bích, Hồ Chí Minh, Việt Nam', 10.789653, 106.63708799999996, N'Tân Phú', N'Hồ Chí Minh', NULL, CAST(0x0000A4D00183CBF5 AS DateTime), NULL, 289000, 100, 3, 5, N'owner1')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (56, N'CAO ỐC SMART VIEW BUILDING', 2, 1, N'Tòa nhà Smart View Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng C. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng Smart View Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng Smart View Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.', 500000, 2, 20, 4000, N'/upload/1436459517456/8.jpg,', N'600 Nguyễn Đình Chiểu, Hồ Chí Minh, Việt Nam', 10.769588, 106.68148339999992, N'Quận 3', N'Hồ Chí Minh', NULL, CAST(0x0000A4FC00952B43 AS DateTime), 16, 500000, 100, 3, 5, N'owner2')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (57, N'TÒA NHÀ ANH NGỮ SMART OFFICE', 2, 1, N'Tòa nhà Anh Ngữ Smart Office được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng cho thuê giá rẻ. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Tòa nhà văn phòng cho thuê Anh Ngữ Smart Office cao 6 tầng diện tích sàn 80m2 sử dụng 1 thang máy tốc độ cao , hệ thống PCCC, hệ thống báo cháy và chữa cháy tự động theo tiêu chuẩn hệ thống, 01 máy phát điện dự phòng cho toàn bộ tòa nhà chạy 24/24…Bên cạnh đó, nơi đây còn có đội ngũ quản lý chuyên nghiệp và lực lượng bảo vệ 24/24h.', 240000, 2, 7, 4800, N'/upload/1436459644044/9.jpg,', N'502 Huynh Tan Phat, Bình Thuận, Hồ Chí Minh, Việt Nam', 10.7482276, 106.72884320000004, N'Quận 7', N'Hồ Chí Minh', NULL, CAST(0x0000A4D00184BC2D AS DateTime), 4, 240000, 150, 3, 5, N'owner1')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (58, N'SAVICO OFFICE BUILDING', 2, 1, N'Tòa nhà Savico Office Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng cho thuê giá rẻ. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng Savico Office Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng Savico Office Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.
', 430000, 2, 9, 700, N'/upload/1436459722468/17.jpg,', N'70 Lê Minh Xuân, Tân Bình, Hồ Chí Minh, Việt Nam', 10.7865101, 106.652644, N'Tân Bình', N'Hồ Chí Minh', NULL, CAST(0x0000A4D00185142C AS DateTime), 5, 430000, 150, 3, 5, N'owner2')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (59, N'HAN BUILDING', 2, 1, N'Tòa nhà HAN Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng C. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng HAN Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng HAN Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.
', 400000, 2, 12, 3000, N'/upload/1436459797910/16.jpg,', N'899 Nguyễn Trãi, Hồ Chí Minh, Việt Nam', 10.7527261, 106.65590729999995, N'Quận 5', N'Hồ Chí Minh', NULL, CAST(0x0000A514002913B2 AS DateTime), 3, 400000, 100, 3, 5, N'owner1')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (60, N'TUẤN MINH BUILDING', 2, 1, N'Văn phòng cho thuê Tuấn Minh building là một văn phòng sang trọng, tiện ích, phù hợp cho khách hàng đặt các văn phòng đại diện, trụ sở làm việc. 
Có vị trí thuận lợi, nằm ngay khu vực trung tâm kinh doanh, gần các khu trung tâm thương mại, tài chánh, hành chánh của quận 1 và các khu cho thuê văn phòng khác.', 300000, 2, 7, 3500, N'/upload/1440234155773/cho-thue-van-phong-quan-3-tuan-minh-2-building.jpg,', N'Lê Thị Riêng, Hồ Chí Minh, Quận 1, Việt Nam', 10.7711423, 106.6907744, N'Quận 1', N'Hồ Chí Minh', NULL, CAST(0x0000A4FC00982763 AS DateTime), 3, 300000, 50, 6, 5, N'owner2')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (61, N'RIVER VIEW TOWER', 2, 1, N'Tòa nhà River View Tower được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng B. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng River View Tower tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng River View Tower là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.', 350000, 2, 16, 2000, N'/upload/1436459983833/15.jpg,', N'602 Lê Hồng Phong, Hồ Chí Minh, Việt Nam', 10.7711608, 106.67285600000002, N'', N'', NULL, CAST(0x0000A51400292511 AS DateTime), 2, 350000, 100, 3, 5, N'owner1')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (62, N'LAFAYETTE DE SAIGON', 2, 1, N'Tòa nhà Lafayette De Saigon Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng B. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng Lafayette De Saigon Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng Lafayette De Saigon Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.', 400000, 2, 20, 4850, N'/upload/1436460053999/14.jpg,', N'343 Phạm Ngũ Lão, Hồ Chí Minh, Việt Nam', 10.767076, 106.69016999999997, NULL, NULL, NULL, CAST(0x0000A4FB008E79EC AS DateTime), 34, 400000, 150, 3, 5, N'owner2')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (63, N'INTERNATIONAL PLAZA', 2, 1, N'Tòa nhà International Plaza Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng C. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng International Plaza Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng International Plaza Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.', 350000, 2, 20, 5000, N'/upload/1436460108353/18.jpg,', N'700 Nguyễn Kiệm, Phú Nhuận, Hồ Chí Minh, Việt Nam', 10.808452, 106.6786489, N'', N'', NULL, CAST(0x0000A51400294226 AS DateTime), NULL, 350000, 150, 3, 5, N'owner1')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (64, N'MAI SƠN BUILDING', 2, 1, N'Tòa nhà Mai Sơn Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng giá rẻ. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng Mai Sơn Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng Mai Sơn Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.
', 125000, 2, 25, 7000, N'/upload/1436460305783/14.jpg,', N'200 Vạn Kiếp, Hồ Chí Minh, Việt Nam', 10.798671, 106.69348590000004, N'', N'', NULL, CAST(0x0000A51400295B9C AS DateTime), 1, 125000, 150, 3, 5, N'owner2')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (65, N'NAM PHƯƠNG BUILDING', 2, 1, N'Tòa nhà Nam Phương Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng cho thuê giá rẻ. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng Nam Phương Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng Nam Phương Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.
', 400000, 2, 13, 2500, N'/upload/1436460348125/7.jpg,', N'100 Bình Thới, Hồ Chí Minh, Việt Nam', 10.7690889, 106.64807300000008, N'', N'', NULL, CAST(0x0000A5140029843F AS DateTime), 4, 400000, 150, 3, 5, N'owner1')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (66, N'SKY VIEW BUILDING', 2, 1, N'Tòa nhà Sky View Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng cho thuê giá rẻ. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng Sky View Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng Sky View Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.
', 200000, 2, 6, 1200, N'/upload/1436460411885/17.jpg,', N'800 Nguyễn Văn Linh, Tân Phú, Hồ Chí Minh, Việt Nam', 10.7318542, 106.71924349999996, NULL, NULL, NULL, CAST(0x0000A4FB008E1226 AS DateTime), 3, 200000, 100, 3, 5, N'owner2')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (67, N'NVG OFFICE BUILDING', 2, 1, N'Tòa nhà NVG Office Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng cho thuê giá rẻ. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng NVG Office Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng NVG Office Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.
', 250000, 2, 8, 4000, N'/upload/1436460463411/5.jpg,', N'600 Cộng Hòa, Hồ Chí Minh, Tân Bình, Việt Nam', 10.804534, 106.63771599999996, N'Tân Bình', N'Hồ Chí Minh', NULL, CAST(0x0000A5140029A1D5 AS DateTime), 1, 250000, 100, 3, 5, N'owner1')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (68, N'SUNSHINE BUILDING', 2, 1, N'Tòa nhà Sunshine Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng cho thuê giá rẻ. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng Sunshine Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng Sunshine Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.
', 295000, 2, 10, 5000, N'/upload/1436460516255/9.jpg,', N'455 Tô Hiến Thành, Hồ Chí Minh, Việt Nam', 10.7774874, 106.66500129999996, N'', N'', NULL, CAST(0x0000A5140029B5E7 AS DateTime), NULL, 295000, 100, 3, 5, N'owner1')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (69, N'MISS ÁO DÀI BUILDING', 2, 1, N'Tòa nhà Miss Áo Dài Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng B. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng Miss Áo Dài Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng Miss Áo Dài Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.', 215000, 2, 9, 4700, N'/upload/1440236910675/5c7d4121-3ea9-4973-8fd0-5e28b310c768_Miss AO DAI(copy).jpg,', N'221 Nguyễn Thị Minh Khai, Nguyễn Cư Trinh, Hồ Chí Minh, Việt Nam', 10.767096, 106.68354999999995, N'Quận 1', N'Hồ Chí Minh', NULL, CAST(0x0000A51F00AC7863 AS DateTime), 23, 215000, 150, 3, 5, N'owner1')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (70, N'ZEN PLAZA', 1, 1, N'Tòa nhà Zen Plaza Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng B. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng Zen Plaza Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng Zen Plaza Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.', 20000000, 1, 1, 100, N'/upload/1436460640214/11.jpg,/upload/1440344740067/office45.jpg,', N'233 Nguyễn Trãi, Hồ Chí Minh, Việt Nam', 10.7565673, 106.67708419999995, N'Quận 5', N'Hồ Chí Minh', NULL, CAST(0x0000A4FD01045D6A AS DateTime), 16, 20000000, 100, 3, 5, N'owner1')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (71, N'GOLDEN TOWER', 2, 1, N'Tòa nhà Golden Tower được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng B. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng Golden Tower tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng Golden Tower là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.', 400000, 2, 20, 10000, N'/upload/1436460721962/4.jpg,', N'254 Nguyễn Trãi, Hồ Chí Minh, Việt Nam', 10.762506, 106.68560200000002, NULL, NULL, NULL, CAST(0x0000A4FB008DAD76 AS DateTime), 2, 400000, 150, 3, 5, N'owner1')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (72, N'ĐỖ TRẦN BUILDING', 2, 1, N'Tòa nhà Đỗ Trần Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng giá rẻ. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng Đỗ Trần Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng Đỗ Trần Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.', 150000, 2, 15, 7500, N'/upload/1436460772208/16.jpg,', N'677 Lê Hồng Phong, Hồ Chí Minh, Việt Nam', 10.7740419, 106.67175989999998, N'', N'', NULL, CAST(0x0000A514002A2879 AS DateTime), 9, 150000, 150, 3, 5, N'owner2')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (73, N'VTP OFFICE SERVICE CENTER', 2, 1, N'Tòa nhà VTP Office Service Center được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng B. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng VTP Office Service Center tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng VTP Office Service Center là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.
', 250000, 2, 13, 6000, N'/upload/1436460892613/12.jpg,', N'577 Nguyễn Kiệm, Hồ Chí Minh, Việt Nam', 10.805433, 106.678539, NULL, NULL, NULL, CAST(0x0000A4FB008D6344 AS DateTime), NULL, 250000, 150, 3, 5, N'owner1')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (74, N'CAO ỐC SAIGON TIMES SQUARE BUILDING', 2, 1, N'Saigon Times Square (Việt Nam) là một cao ốc phức hợp cao 164m tọa lạc ngay tại trung tâm TP.HCM. Với hai mặt tiền đại lộ Nguyễn Huệ và đường Đồng Khởi đắc địa, tòa tháp có các căn hộ dịch vụ tiện nghi theo tiêu chuẩn Leading Hotel of the World, 8 tầng văn phòng cho thuê hạng A và trung tâm mua sắm hiện đại cùng 5 nhà hàng – bar cao cấp và sang trọng bậc nhất thành phố.

Times Square được đầu tư bởi Công ty cổ phần đầu tư Times Square (Việt Nam), đây là tòa tháp có tường kính vòng lớn nhất Châu Á, mở ra không gian bao quát toàn cảnh thành phố và sông Sài Gòn. ', 315000, 2, 20, 8000, N'/upload/1440236688165/cao-oc-van-phong-saigon-times-square-tower-307.jpg,', N'299 Tôn Thất Thuyết, Hồ Chí Minh, Việt Nam', 10.7532699, 106.70545300000003, N'Quận 4', N'Hồ Chí Minh', NULL, CAST(0x0000A4FC00A159C4 AS DateTime), 6, 315000, 150, 3, 5, N'owner2')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (76, N'New City Group Thủ Đức', 2, 1, N'*** Quy mô:
- Gồm 06 tầng
- Diện tích sử dụng mỗi tầng: 1.600 m2
- Diện tích cho thuê: 4.800 m2 (ngang 60m)
- Chỗ để xe rộng, thoáng mát, an ninh.

*** Hiện trạng:
- Tòa nhà mới xây khai trương vào tháng 1-2015
- Cho thuê diện tích theo nhu cầu khách hàng', 215000, 2, 5, 200, N'/upload/1438994786214/20150325120122-7d84.jpg,', N'Quốc lộ 13, Hồ Chí Minh, quận Thủ Đức, Việt Nam', 10.8405791, 106.71838849999996, N'Thủ Đức', N'Hồ Chí Minh', NULL, CAST(0x0000A514002A1370 AS DateTime), NULL, 215000, 100, 3, 5, N'owner2')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (80, N'Le Tien', 2, 3, N'124', 1412455, 2, 10, 155, N'', N'124 Xô Viết Nghệ Tĩnh, Hồ Chí Minh, Việt Nam', 10.796295, 106.71048599999996, N'Bình Thạnh', N'Hồ Chí Minh', NULL, CAST(0x0000A50C00F251F3 AS DateTime), NULL, 1412455, 1555, 12, 0, N'owner2')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (81, N'Anna Building', 2, 1, N'Gần đại học FPT', 200000, 2, 10, 1200, N'/upload/1441697411738/office7.jpg,/upload/1441697411738/office12.jpg,', N'144 Tô Ký, Hồ Chí Minh, Việt Nam', 10.8525967, 106.62630050000009, N'Quận 12', N'Hồ Chí Minh', NULL, CAST(0x0000A50E00E4F043 AS DateTime), NULL, 190000, 100, 12, 0, N'owner2')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (82, N'Cao ốc văn phòng Thái An', 2, 2, N'Tòa nhà văn phòng mới, hiện đại gồm 1 tầng hầm rộng rãi, 14 tầng nổi.
Tòa nhà cao, thoáng, tầm nhìn rộng, MT đường QL1A, ngay TT Phần Mềm Quang Trung & Gần Ngã 4 An Sương.
Có chỗ đỗ ô tô, có bãi đỗ xe tiện đi lại giao dịch với các ngân hàng và các cơ quan lớn.', 150000, 2, 14, 100, N'/upload/1438072962396/20150724174157-27c1.jpg,', N'Quốc lộ 1A, Hồ Chí Minh, Quận 12, Việt Nam', 10.8620419, 106.6748791, N'Quận 12', N'Hồ Chí Minh', 7, CAST(0x0000A50E0103EBFD AS DateTime), 2, 120000, 150, 3, 5, N'owner2')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (83, N'CAO ỐC SMART VIEW BUILDING', 2, 2, N'Tòa nhà Smart View Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng C. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng Smart View Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng Smart View Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.', 500000, 2, 20, 100, N'/upload/1436459517456/8.jpg,', N'600 Nguyễn Đình Chiểu, Hồ Chí Minh, Việt Nam', 10.769588, 106.68148339999992, N'Quận 3', N'Hồ Chí Minh', 56, CAST(0x0000A52301162C43 AS DateTime), 1, 500000, 100, 3, 5, N'owner1')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (84, N'MISS ÁO DÀI BUILDING', 2, 2, N'Tòa nhà Miss Áo Dài Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng B. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng Miss Áo Dài Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng Miss Áo Dài Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.', 215000, 2, 9, 200, N'/upload/1440236910675/5c7d4121-3ea9-4973-8fd0-5e28b310c768_Miss AO DAI(copy).jpg,', N'221 Nguyễn Thị Minh Khai, Nguyễn Cư Trinh, Hồ Chí Minh, Việt Nam', 10.767096, 106.68354999999995, N'Quận 1', N'Hồ Chí Minh', 69, CAST(0x0000A52300FA21B9 AS DateTime), 1, 215000, 150, 3, 5, N'owner2')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (85, N'LAFAYETTE DE SAIGON', 2, 2, N'Tòa nhà Lafayette De Saigon Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng B. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng Lafayette De Saigon Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng Lafayette De Saigon Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.', 400000, 2, 20, 150, N'/upload/1436460053999/14.jpg,', N'343 Phạm Ngũ Lão, Hồ Chí Minh, Việt Nam', 10.767076, 106.69016999999997, NULL, NULL, 62, CAST(0x0000A51800AD1E33 AS DateTime), 4, 400000, 150, 3, 5, N'owner2')
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount], [BasePrice], [MinArea], [MinTime], [Commission], [OwnerUsername]) VALUES (86, N'Văn phòng trung tâm q1 giá 100k', 1, 4, N'Văn phòng matching yêu cầu request office', NULL, 1, 5, 5000, N'/upload/1443172233296/office35.jpg,', N'12 Nguyễn Thị Minh Khai, Hồ Chí Minh, Việt Nam', 10.787921, 106.70252299999991, N'Quận 1', N'Hồ Chí Minh', NULL, CAST(0x0000A51E010B5E1F AS DateTime), NULL, 500000000, 5000, 12, 0, N'owner2')
SET IDENTITY_INSERT [dbo].[Office] OFF
/****** Object:  Table [dbo].[Appointment]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerUsername] [nvarchar](50) NOT NULL,
	[AssignedStaff] [nvarchar](50) NULL,
	[OfficeId] [int] NOT NULL,
	[Time] [datetime] NOT NULL,
	[StatusId] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NULL,
	[Comment] [nvarchar](250) NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointment] ON
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (32, N'userb', N'staff2', 70, CAST(0x0000A50D00F358E0 AS DateTime), 4, CAST(0x0000A50D00F36551 AS DateTime), CAST(0x0000A5100113CB77 AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (33, N'user3', N'staff1', 4, CAST(0x0000A50D00F39F30 AS DateTime), 4, CAST(0x0000A50D00F3AFD0 AS DateTime), CAST(0x0000A50E00BA66EF AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (34, N'user3', N'staff3', 7, CAST(0x0000A50D00F58B60 AS DateTime), 4, CAST(0x0000A50D00F5A2C0 AS DateTime), CAST(0x0000A51100DFB89A AS DateTime), N'')
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (35, N'user3', N'staff2', 56, CAST(0x0000A51000F890D0 AS DateTime), 4, CAST(0x0000A50D00F8CD51 AS DateTime), CAST(0x0000A50E00BE6CFD AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (36, N'user3', N'staff1', 69, CAST(0x0000A50E00FDC8C0 AS DateTime), 4, CAST(0x0000A50D00FDF020 AS DateTime), CAST(0x0000A50E00BE71C4 AS DateTime), N'ok')
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (37, N'user3', N'staff1', 69, CAST(0x0000A50F011EBE40 AS DateTime), 4, CAST(0x0000A50D00FEB7DF AS DateTime), CAST(0x0000A50E00BE76D5 AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (38, N'userb', N'staff2', 70, CAST(0x0000A51100DD5FE0 AS DateTime), 4, CAST(0x0000A51100AC2009 AS DateTime), CAST(0x0000A51100ACBEE9 AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (42, N'user3', N'staff3', 62, CAST(0x0000A52301232340 AS DateTime), 2, CAST(0x0000A51100F1F3FE AS DateTime), CAST(0x0000A51800ADBB8E AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (43, N'thanh', N'staff2', 70, CAST(0x0000A5230112EED0 AS DateTime), 2, CAST(0x0000A51100F20A73 AS DateTime), CAST(0x0000A51800ADC193 AS DateTime), N'')
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (44, N'testmail', N'staff2', 66, CAST(0x0000A52300D103D0 AS DateTime), 2, CAST(0x0000A51100F23CA1 AS DateTime), CAST(0x0000A51800AE4199 AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (45, N'user4', NULL, 67, CAST(0x0000A5240125E260 AS DateTime), 5, CAST(0x0000A51100F2BF7B AS DateTime), CAST(0x0000A51F00A9E603 AS DateTime), N'1')
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (48, N'userb', N'staff1', 62, CAST(0x0000A51800AA49C0 AS DateTime), 4, CAST(0x0000A51800AA83F8 AS DateTime), CAST(0x0000A51800AD1EC4 AS DateTime), N'')
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (49, N'usertest', N'staff1', 61, CAST(0x0000A5250083D600 AS DateTime), 2, CAST(0x0000A52100F2E1A5 AS DateTime), CAST(0x0000A52100F30673 AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (50, N'thanh', NULL, 62, CAST(0x0000A5240083D600 AS DateTime), 1, CAST(0x0000A52100F34587 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Appointment] OFF
/****** Object:  Table [dbo].[Contract]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerUsername] [nvarchar](50) NOT NULL,
	[OfficeId] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[PaymentFee] [int] NOT NULL,
	[PaymentTerm] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[Comment] [nvarchar](250) NULL,
	[Deposit] [bigint] NULL,
	[CancelDate] [date] NULL,
	[ImageUrl] [nvarchar](150) NULL,
	[CancelFee] [bigint] NULL,
	[DepositPaidDay] [int] NULL,
	[FirstPaymentPaidDay] [int] NULL,
	[PaymentPaidDay] [int] NULL,
	[AdditionalCharge] [int] NULL,
	[LatePaidDay] [int] NULL,
	[ParentContractId] [int] NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Contract] ON
INSERT [dbo].[Contract] ([Id], [CustomerUsername], [OfficeId], [StartDate], [EndDate], [PaymentFee], [PaymentTerm], [StatusId], [Comment], [Deposit], [CancelDate], [ImageUrl], [CancelFee], [DepositPaidDay], [FirstPaymentPaidDay], [PaymentPaidDay], [AdditionalCharge], [LatePaidDay], [ParentContractId]) VALUES (13, N'user3', 82, CAST(0x693A0B00 AS Date), CAST(0xC33A0B00 AS Date), 150000, 1, 1, NULL, 22500000, NULL, N'', NULL, 5, 5, 5, 5, 5, NULL)
INSERT [dbo].[Contract] ([Id], [CustomerUsername], [OfficeId], [StartDate], [EndDate], [PaymentFee], [PaymentTerm], [StatusId], [Comment], [Deposit], [CancelDate], [ImageUrl], [CancelFee], [DepositPaidDay], [FirstPaymentPaidDay], [PaymentPaidDay], [AdditionalCharge], [LatePaidDay], [ParentContractId]) VALUES (14, N'user4', 83, CAST(0xB0390B00 AS Date), CAST(0xB63A0B00 AS Date), 500000, 2, 1, NULL, 100000000, NULL, N'', NULL, 5, 20, 20, 9, NULL, NULL)
INSERT [dbo].[Contract] ([Id], [CustomerUsername], [OfficeId], [StartDate], [EndDate], [PaymentFee], [PaymentTerm], [StatusId], [Comment], [Deposit], [CancelDate], [ImageUrl], [CancelFee], [DepositPaidDay], [FirstPaymentPaidDay], [PaymentPaidDay], [AdditionalCharge], [LatePaidDay], [ParentContractId]) VALUES (15, N'user4', 84, CAST(0xE7390B00 AS Date), CAST(0x163B0B00 AS Date), 215000, 1, 4, NULL, 32250000, CAST(0x7A3A0B00 AS Date), N'', NULL, 5, 3, 3, 5, NULL, NULL)
INSERT [dbo].[Contract] ([Id], [CustomerUsername], [OfficeId], [StartDate], [EndDate], [PaymentFee], [PaymentTerm], [StatusId], [Comment], [Deposit], [CancelDate], [ImageUrl], [CancelFee], [DepositPaidDay], [FirstPaymentPaidDay], [PaymentPaidDay], [AdditionalCharge], [LatePaidDay], [ParentContractId]) VALUES (16, N'userb', 85, CAST(0x733A0B00 AS Date), CAST(0xDB3B0B00 AS Date), 400000, 2, 1, NULL, 120000000, NULL, N'', NULL, 3, 5, 5, 10, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Contract] OFF
/****** Object:  Table [dbo].[OfficeGroup]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfficeGroup](
	[OfficeId] [int] NOT NULL,
	[OfficeGroup] [int] NOT NULL,
 CONSTRAINT [PK_OfficeGroup] PRIMARY KEY CLUSTERED 
(
	[OfficeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (4, 1)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (8, 0)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (9, 1)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (10, 3)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (51, 4)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (53, 4)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (54, 2)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (55, 4)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (56, 3)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (57, 1)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (58, 3)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (59, 3)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (60, 1)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (61, 1)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (62, 1)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (63, 2)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (64, 0)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (65, 3)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (66, 1)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (67, 4)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (68, 4)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (69, 0)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (70, 0)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (71, 1)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (72, 0)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (73, 2)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (74, 1)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (76, 2)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (81, 4)
/****** Object:  Table [dbo].[OfficeAmenity]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfficeAmenity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OfficeId] [int] NOT NULL,
	[AmenityId] [int] NOT NULL,
 CONSTRAINT [PK_OfficeAmenity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[OfficeAmenity] ON
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (2, 8, 2)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (3, 8, 4)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (4, 8, 5)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (5, 8, 6)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (7, 9, 3)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (9, 10, 2)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (10, 51, 5)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (11, 52, 5)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (12, 53, 8)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (13, 53, 12)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (14, 54, 2)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (15, 54, 4)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (16, 54, 8)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (17, 55, 4)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (18, 55, 2)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (19, 55, 11)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (20, 56, 8)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (21, 56, 13)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (22, 56, 11)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (23, 57, 6)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (24, 57, 4)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (25, 57, 8)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (26, 58, 21)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (27, 58, 2)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (28, 58, 24)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (29, 59, 22)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (30, 59, 15)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (32, 60, 20)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (33, 60, 11)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (34, 61, 12)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (35, 61, 11)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (37, 62, 2)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (38, 62, 8)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (39, 62, 4)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (40, 63, 6)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (41, 63, 7)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (42, 64, 6)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (43, 64, 12)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (44, 65, 20)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (45, 65, 4)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (46, 66, 20)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (47, 66, 27)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (48, 67, 20)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (49, 67, 8)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (50, 68, 7)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (51, 69, 8)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (52, 70, 20)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (54, 70, 31)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (55, 71, 20)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (56, 71, 4)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (57, 71, 13)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (58, 72, 24)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (59, 72, 27)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (60, 73, 3)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (61, 73, 8)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (62, 73, 2)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (63, 74, 4)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (64, 74, 2)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (65, 7, 20)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (66, 7, 4)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (67, 7, 5)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (68, 9, 7)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (69, 9, 21)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (70, 8, 15)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (71, 76, 2)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (72, 76, 31)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (73, 4, 15)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (78, 4, 5)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (79, 4, 26)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (81, 60, 4)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (82, 60, 20)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (85, 60, 11)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (92, 70, 7)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (94, 81, 20)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (95, 81, 4)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (96, 81, 15)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (97, 81, 5)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (98, 82, 20)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (99, 82, 4)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (100, 82, 5)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (101, 83, 8)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (102, 83, 13)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (103, 83, 11)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (104, 10, 15)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (105, 10, 12)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (106, 10, 26)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (107, 51, 13)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (108, 51, 8)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (109, 51, 3)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (110, 52, 20)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (111, 52, 21)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (112, 53, 28)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (113, 59, 23)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (114, 59, 14)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (115, 61, 8)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (116, 61, 6)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (117, 63, 4)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (118, 63, 10)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (119, 64, 14)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (120, 64, 2)
GO
print 'Processed 100 total records'
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (121, 64, 23)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (122, 64, 13)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (123, 65, 13)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (124, 65, 38)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (125, 67, 29)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (126, 67, 30)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (127, 68, 4)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (128, 68, 10)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (129, 69, 15)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (130, 69, 5)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (131, 69, 20)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (132, 69, 17)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (133, 76, 5)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (134, 76, 15)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (135, 72, 2)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (136, 72, 3)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (137, 84, 8)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (138, 84, 15)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (139, 84, 5)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (140, 84, 20)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (141, 84, 17)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (142, 85, 2)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (143, 85, 8)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (144, 85, 4)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (145, 86, 20)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (146, 86, 26)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (147, 86, 5)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (148, 69, 23)
SET IDENTITY_INSERT [dbo].[OfficeAmenity] OFF
/****** Object:  Table [dbo].[RequestAmenity]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestAmenity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestOfficeId] [int] NOT NULL,
	[AmenityId] [int] NOT NULL,
 CONSTRAINT [PK_RequestAmentity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RequestAmenity] ON
INSERT [dbo].[RequestAmenity] ([Id], [RequestOfficeId], [AmenityId]) VALUES (1, 2, 20)
INSERT [dbo].[RequestAmenity] ([Id], [RequestOfficeId], [AmenityId]) VALUES (2, 2, 26)
SET IDENTITY_INSERT [dbo].[RequestAmenity] OFF
/****** Object:  Table [dbo].[Repair]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Repair](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContractId] [int] NOT NULL,
	[AssignedStaff] [nvarchar](50) NULL,
	[Description] [ntext] NOT NULL,
	[RepairStatusId] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NULL,
	[AssignedTime] [datetime] NULL,
 CONSTRAINT [PK_Repair] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Repair] ON
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (29, 13, NULL, N'sua chua', 4, CAST(0x0000A50E01089CF5 AS DateTime), CAST(0x0000A50E010AB8D1 AS DateTime), NULL)
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (30, 13, N'staff1', N'sua chua', 4, CAST(0x0000A50E01091F53 AS DateTime), CAST(0x0000A5140019A5F0 AS DateTime), CAST(0x0000A51100000000 AS DateTime))
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (31, 13, N'staff1', N'sửa máy lạnh', 4, CAST(0x0000A51100F324FF AS DateTime), CAST(0x0000A51E00EB80A4 AS DateTime), NULL)
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (32, 14, N'staff1', N'Sua voi nuoc', 5, CAST(0x0000A52C01173D98 AS DateTime), CAST(0x0000A52C0117C786 AS DateTime), CAST(0x0000A52D00000000 AS DateTime))
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (33, 15, NULL, N'sua may dieu hoa', 4, CAST(0x0000A52600FB4F12 AS DateTime), CAST(0x0000A51F00A8F255 AS DateTime), CAST(0x0000A52600000000 AS DateTime))
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (34, 16, N'staff3', N'ket voi sen', 5, CAST(0x0000A51800AD3E02 AS DateTime), CAST(0x0000A52200B7992F AS DateTime), CAST(0x0000A52600000000 AS DateTime))
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (35, 16, N'staff1', N'thang ket', 5, CAST(0x0000A52200B40309 AS DateTime), CAST(0x0000A52200B7B839 AS DateTime), CAST(0x0000A52600000000 AS DateTime))
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (36, 16, NULL, N'thang ke', 2, CAST(0x0000A52200B44AF3 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Repair] OFF
/****** Object:  Table [dbo].[Rental]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rental](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContractId] [int] NOT NULL,
	[AssignStaff] [nvarchar](50) NULL,
	[StatusId] [int] NOT NULL,
	[Description] [ntext] NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NULL,
	[AssignedTime] [datetime] NULL,
 CONSTRAINT [PK_Rental] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Rental] ON
INSERT [dbo].[Rental] ([Id], [ContractId], [AssignStaff], [StatusId], [Description], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (13, 13, N'staff1', 3, NULL, CAST(0x0000A50E011115C4 AS DateTime), CAST(0x0000A5100112965F AS DateTime), CAST(0x0000A51000000000 AS DateTime))
INSERT [dbo].[Rental] ([Id], [ContractId], [AssignStaff], [StatusId], [Description], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (14, 16, NULL, 1, N'Xin giao vao thu 7', CAST(0x0000A51800AD6192 AS DateTime), CAST(0x0000A51E00EB809E AS DateTime), CAST(0x0000A52400000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Rental] OFF
/****** Object:  Table [dbo].[RepairDetail]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepairDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RepairId] [int] NOT NULL,
	[AmenityId] [int] NOT NULL,
 CONSTRAINT [PK_RepairDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RepairDetail] ON
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (27, 29, 20)
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (28, 29, 4)
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (29, 30, 20)
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (30, 30, 4)
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (31, 31, 20)
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (32, 33, 20)
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (33, 34, 2)
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (34, 35, 4)
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (35, 36, 4)
SET IDENTITY_INSERT [dbo].[RepairDetail] OFF
/****** Object:  Table [dbo].[RentalDetail]    Script Date: 09/28/2015 14:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RentalItemId] [int] NOT NULL,
	[RentalId] [int] NOT NULL,
	[UnitPrice] [float] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_RentalDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RentalDetail] ON
INSERT [dbo].[RentalDetail] ([Id], [RentalItemId], [RentalId], [UnitPrice], [Quantity]) VALUES (13, 5, 13, 150000, 1)
INSERT [dbo].[RentalDetail] ([Id], [RentalItemId], [RentalId], [UnitPrice], [Quantity]) VALUES (14, 6, 13, 140000, 1)
INSERT [dbo].[RentalDetail] ([Id], [RentalItemId], [RentalId], [UnitPrice], [Quantity]) VALUES (15, 2, 13, 58000, 8)
INSERT [dbo].[RentalDetail] ([Id], [RentalItemId], [RentalId], [UnitPrice], [Quantity]) VALUES (16, 2, 14, 58000, 1)
INSERT [dbo].[RentalDetail] ([Id], [RentalItemId], [RentalId], [UnitPrice], [Quantity]) VALUES (17, 5, 14, 150000, 1)
SET IDENTITY_INSERT [dbo].[RentalDetail] OFF
/****** Object:  StoredProcedure [dbo].[GetJobCount]    Script Date: 09/28/2015 14:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetJobCount]
    @StartDate DateTime, 
    @EndDate DateTime
AS 
    SELECT a.Staff, COUNT(a.[time]) AS JobCount FROM (
	(SELECT AssignedStaff AS Staff, Time AS [time]
	FROM Appointment
	WHERE StatusId != 1 AND [Time] >= @StartDate AND [Time] < @EndDate)
	UNION ALL
	(SELECT AssignedStaff AS Staff, AssignedTime AS [time]
	FROM Repair
	WHERE RepairStatusId != 1  AND AssignedTime >= @StartDate AND AssignedTime < @EndDate)
	UNION ALL
	(SELECT AssignedStaff AS Staff, AssignedTime AS [time]
	FROM Repair
	WHERE RepairStatusId != 1  AND AssignedTime >= @StartDate AND AssignedTime < @EndDate)
	UNION ALL
	(SELECT AssignStaff AS Staff, AssignedTime AS [time]
	FROM Rental
	WHERE StatusId != 1 AND AssignedTime >= @StartDate AND AssignedTime < @EndDate)
	) a
	GROUP BY Staff
GO
/****** Object:  StoredProcedure [dbo].[GetDetailJob]    Script Date: 09/28/2015 14:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDetailJob]
    @StartDate DateTime, 
    @EndDate DateTime, 
    @Staff NVARCHAR(50) 
AS 

(SELECT Id, [Time], 1 as Kind
FROM Appointment 
WHERE assignedStaff = @Staff AND Time >= @StartDate AND Time < @EndDate AND StatusId != 1)
UNION ALL
(SELECT Id, AssignedTime AS Time, 2 as Kind
FROM Rental
WHERE AssignStaff = @Staff AND AssignedTime >= @StartDate AND AssignedTime < @EndDate AND StatusId != 1)
UNION ALL
(SELECT Id, AssignedTime AS Time, 3 as Kind
FROM Repair
WHERE AssignedStaff = @Staff AND AssignedTime >= @StartDate AND AssignedTime < @EndDate AND RepairStatusId != 1)
UNION ALL
(SELECT Id, AssignedTime AS Time, 3 as Kind
FROM Repair
WHERE AssignedStaff = @Staff AND AssignedTime >= @StartDate AND AssignedTime < @EndDate AND RepairStatusId != 1)
GO
/****** Object:  StoredProcedure [dbo].[CalculateIncome]    Script Date: 09/28/2015 14:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CalculateIncome]
    @startDate DATETIME,
    @endDate DATETIME,
    @district NVARCHAR(50)
AS 

IF @district != ''
	SELECT 
	COALESCE((
	SELECT SUM (UnitPrice * Quantity) FROM RentalDetail 
	WHERE RentalId IN (
	 SELECT Id FROM Rental WHERE ContractId IN (
	  SELECT id FROM [Contract] 
	  WHERE StartDate < @endDate AND EndDate >= @startDate AND StatusId != 4
	  AND OfficeId IN (SELECT Id FROM [Office] WHERE District = @district) 
	 ) 
	 AND StatusId = 3 )),0) AS Income

ELSE 
	SELECT 
	COALESCE((
	SELECT SUM (UnitPrice * Quantity) FROM RentalDetail 
	WHERE RentalId IN (
	 SELECT Id FROM Rental WHERE ContractId IN (
	  SELECT id FROM [Contract] 
	  WHERE StartDate < @endDate AND EndDate >= @startDate AND StatusId != 4
	 ) 
	 AND StatusId = 3 )),0) AS Income
GO
/****** Object:  DdlTrigger [rds_deny_backups_trigger]    Script Date: 09/28/2015 14:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [rds_deny_backups_trigger] ON DATABASE WITH EXECUTE AS 'dbo' FOR
 ADD_ROLE_MEMBER, GRANT_DATABASE AS BEGIN
   SET NOCOUNT ON;
   SET ANSI_PADDING ON;
 
   DECLARE @data xml;
   DECLARE @user sysname;
   DECLARE @role sysname;
   DECLARE @type sysname;
   DECLARE @sql NVARCHAR(MAX);
   DECLARE @permissions TABLE(name sysname PRIMARY KEY);
   
   SELECT @data = EVENTDATA();
   SELECT @type = @data.value('(/EVENT_INSTANCE/EventType)[1]', 'sysname');
    
   IF @type = 'ADD_ROLE_MEMBER' BEGIN
      SELECT @user = @data.value('(/EVENT_INSTANCE/ObjectName)[1]', 'sysname'),
       @role = @data.value('(/EVENT_INSTANCE/RoleName)[1]', 'sysname');

      IF @role IN ('db_owner', 'db_backupoperator') BEGIN
         SELECT @sql = 'DENY BACKUP DATABASE, BACKUP LOG TO ' + QUOTENAME(@user);
         EXEC(@sql);
      END
   END ELSE IF @type = 'GRANT_DATABASE' BEGIN
      INSERT INTO @permissions(name)
      SELECT Permission.value('(text())[1]', 'sysname') FROM
       @data.nodes('/EVENT_INSTANCE/Permissions/Permission')
      AS DatabasePermissions(Permission);
      
      IF EXISTS (SELECT * FROM @permissions WHERE name IN ('BACKUP DATABASE',
       'BACKUP LOG'))
         RAISERROR('Cannot grant backup database or backup log', 15, 1) WITH LOG;       
   END
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
DISABLE TRIGGER [rds_deny_backups_trigger] ON DATABASE
GO
/****** Object:  Default [DF_Amenity_HitCount]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[Amenity] ADD  CONSTRAINT [DF_Amenity_HitCount]  DEFAULT ((0)) FOR [Weight]
GO
/****** Object:  ForeignKey [FK_Account_AccountStatus]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_AccountStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[AccountStatus] ([Id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_AccountStatus]
GO
/****** Object:  ForeignKey [FK_Account_Role]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
/****** Object:  ForeignKey [FK_Amenity_AmenityGroup]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[Amenity]  WITH CHECK ADD  CONSTRAINT [FK_Amenity_AmenityGroup] FOREIGN KEY([AmenityGroupId])
REFERENCES [dbo].[AmenityGroup] ([Id])
GO
ALTER TABLE [dbo].[Amenity] CHECK CONSTRAINT [FK_Amenity_AmenityGroup]
GO
/****** Object:  ForeignKey [FK_RentalItem_RentalItemGroup]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[RentalItem]  WITH CHECK ADD  CONSTRAINT [FK_RentalItem_RentalItemGroup] FOREIGN KEY([GroupId])
REFERENCES [dbo].[RentalItemGroup] ([Id])
GO
ALTER TABLE [dbo].[RentalItem] CHECK CONSTRAINT [FK_RentalItem_RentalItemGroup]
GO
/****** Object:  ForeignKey [FK_Profile_Account]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_Account]
GO
/****** Object:  ForeignKey [FK_EmailQueue_Account]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[EmailQueue]  WITH CHECK ADD  CONSTRAINT [FK_EmailQueue_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[EmailQueue] CHECK CONSTRAINT [FK_EmailQueue_Account]
GO
/****** Object:  ForeignKey [FK_RequestOffice_Account]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[RequestOffice]  WITH CHECK ADD  CONSTRAINT [FK_RequestOffice_Account] FOREIGN KEY([CustomerUsername])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[RequestOffice] CHECK CONSTRAINT [FK_RequestOffice_Account]
GO
/****** Object:  ForeignKey [FK_RequestOffice_Category]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[RequestOffice]  WITH CHECK ADD  CONSTRAINT [FK_RequestOffice_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[RequestOffice] CHECK CONSTRAINT [FK_RequestOffice_Category]
GO
/****** Object:  ForeignKey [FK_Office_Account]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[Office]  WITH CHECK ADD  CONSTRAINT [FK_Office_Account] FOREIGN KEY([OwnerUsername])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Office] CHECK CONSTRAINT [FK_Office_Account]
GO
/****** Object:  ForeignKey [FK_Office_Category]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[Office]  WITH CHECK ADD  CONSTRAINT [FK_Office_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Office] CHECK CONSTRAINT [FK_Office_Category]
GO
/****** Object:  ForeignKey [FK_Office_Office]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[Office]  WITH CHECK ADD  CONSTRAINT [FK_Office_Office] FOREIGN KEY([ParentOfficeId])
REFERENCES [dbo].[Office] ([Id])
GO
ALTER TABLE [dbo].[Office] CHECK CONSTRAINT [FK_Office_Office]
GO
/****** Object:  ForeignKey [FK_Office_OfficeStatus]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[Office]  WITH CHECK ADD  CONSTRAINT [FK_Office_OfficeStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[OfficeStatus] ([Id])
GO
ALTER TABLE [dbo].[Office] CHECK CONSTRAINT [FK_Office_OfficeStatus]
GO
/****** Object:  ForeignKey [FK_Office_PriceTerm]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[Office]  WITH CHECK ADD  CONSTRAINT [FK_Office_PriceTerm] FOREIGN KEY([PriceTerm])
REFERENCES [dbo].[PriceTerm] ([Id])
GO
ALTER TABLE [dbo].[Office] CHECK CONSTRAINT [FK_Office_PriceTerm]
GO
/****** Object:  ForeignKey [FK_Appointment_Account]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Account] FOREIGN KEY([CustomerUsername])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Account]
GO
/****** Object:  ForeignKey [FK_Appointment_Account1]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Account1] FOREIGN KEY([AssignedStaff])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Account1]
GO
/****** Object:  ForeignKey [FK_Appointment_AppointmentStatus]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_AppointmentStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[AppointmentStatus] ([Id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_AppointmentStatus]
GO
/****** Object:  ForeignKey [FK_Appointment_Office]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Office] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Office] ([Id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Office]
GO
/****** Object:  ForeignKey [FK_Contract_Account]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Account] FOREIGN KEY([CustomerUsername])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Account]
GO
/****** Object:  ForeignKey [FK_Contract_Contract]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Contract] FOREIGN KEY([ParentContractId])
REFERENCES [dbo].[Contract] ([Id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Contract]
GO
/****** Object:  ForeignKey [FK_Contract_ContractStatus]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_ContractStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ContractStatus] ([Id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_ContractStatus]
GO
/****** Object:  ForeignKey [FK_Contract_Office]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Office] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Office] ([Id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Office]
GO
/****** Object:  ForeignKey [FK_Contract_PaymentTerm]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_PaymentTerm] FOREIGN KEY([PaymentTerm])
REFERENCES [dbo].[PaymentTerm] ([Id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_PaymentTerm]
GO
/****** Object:  ForeignKey [FK_OfficeGroup_Office]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[OfficeGroup]  WITH CHECK ADD  CONSTRAINT [FK_OfficeGroup_Office] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Office] ([Id])
GO
ALTER TABLE [dbo].[OfficeGroup] CHECK CONSTRAINT [FK_OfficeGroup_Office]
GO
/****** Object:  ForeignKey [FK_OfficeAmenity_Amentity]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[OfficeAmenity]  WITH CHECK ADD  CONSTRAINT [FK_OfficeAmenity_Amentity] FOREIGN KEY([AmenityId])
REFERENCES [dbo].[Amenity] ([Id])
GO
ALTER TABLE [dbo].[OfficeAmenity] CHECK CONSTRAINT [FK_OfficeAmenity_Amentity]
GO
/****** Object:  ForeignKey [FK_OfficeAmenity_Office]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[OfficeAmenity]  WITH CHECK ADD  CONSTRAINT [FK_OfficeAmenity_Office] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Office] ([Id])
GO
ALTER TABLE [dbo].[OfficeAmenity] CHECK CONSTRAINT [FK_OfficeAmenity_Office]
GO
/****** Object:  ForeignKey [FK_RequestAmentity_Amentity]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[RequestAmenity]  WITH CHECK ADD  CONSTRAINT [FK_RequestAmentity_Amentity] FOREIGN KEY([AmenityId])
REFERENCES [dbo].[Amenity] ([Id])
GO
ALTER TABLE [dbo].[RequestAmenity] CHECK CONSTRAINT [FK_RequestAmentity_Amentity]
GO
/****** Object:  ForeignKey [FK_RequestAmentity_RequestOffice]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[RequestAmenity]  WITH CHECK ADD  CONSTRAINT [FK_RequestAmentity_RequestOffice] FOREIGN KEY([RequestOfficeId])
REFERENCES [dbo].[RequestOffice] ([Id])
GO
ALTER TABLE [dbo].[RequestAmenity] CHECK CONSTRAINT [FK_RequestAmentity_RequestOffice]
GO
/****** Object:  ForeignKey [FK_Repair_Account]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[Repair]  WITH CHECK ADD  CONSTRAINT [FK_Repair_Account] FOREIGN KEY([AssignedStaff])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Repair] CHECK CONSTRAINT [FK_Repair_Account]
GO
/****** Object:  ForeignKey [FK_Repair_Contract]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[Repair]  WITH CHECK ADD  CONSTRAINT [FK_Repair_Contract] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contract] ([Id])
GO
ALTER TABLE [dbo].[Repair] CHECK CONSTRAINT [FK_Repair_Contract]
GO
/****** Object:  ForeignKey [FK_Repair_RepairStatus]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[Repair]  WITH CHECK ADD  CONSTRAINT [FK_Repair_RepairStatus] FOREIGN KEY([RepairStatusId])
REFERENCES [dbo].[RepairStatus] ([Id])
GO
ALTER TABLE [dbo].[Repair] CHECK CONSTRAINT [FK_Repair_RepairStatus]
GO
/****** Object:  ForeignKey [FK_Rental_Account]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_Account] FOREIGN KEY([AssignStaff])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_Account]
GO
/****** Object:  ForeignKey [FK_Rental_Contract]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_Contract] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contract] ([Id])
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_Contract]
GO
/****** Object:  ForeignKey [FK_Rental_RentalStatus]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_RentalStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[RentalStatus] ([Id])
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_RentalStatus]
GO
/****** Object:  ForeignKey [FK_RepairDetail_Amenity]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[RepairDetail]  WITH CHECK ADD  CONSTRAINT [FK_RepairDetail_Amenity] FOREIGN KEY([AmenityId])
REFERENCES [dbo].[Amenity] ([Id])
GO
ALTER TABLE [dbo].[RepairDetail] CHECK CONSTRAINT [FK_RepairDetail_Amenity]
GO
/****** Object:  ForeignKey [FK_RepairDetail_Repair]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[RepairDetail]  WITH CHECK ADD  CONSTRAINT [FK_RepairDetail_Repair] FOREIGN KEY([RepairId])
REFERENCES [dbo].[Repair] ([Id])
GO
ALTER TABLE [dbo].[RepairDetail] CHECK CONSTRAINT [FK_RepairDetail_Repair]
GO
/****** Object:  ForeignKey [FK_RentalDetail_Rental]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[RentalDetail]  WITH CHECK ADD  CONSTRAINT [FK_RentalDetail_Rental] FOREIGN KEY([RentalId])
REFERENCES [dbo].[Rental] ([Id])
GO
ALTER TABLE [dbo].[RentalDetail] CHECK CONSTRAINT [FK_RentalDetail_Rental]
GO
/****** Object:  ForeignKey [FK_RentalDetail_RentalItem]    Script Date: 09/28/2015 14:47:48 ******/
ALTER TABLE [dbo].[RentalDetail]  WITH CHECK ADD  CONSTRAINT [FK_RentalDetail_RentalItem] FOREIGN KEY([RentalItemId])
REFERENCES [dbo].[RentalItem] ([Id])
GO
ALTER TABLE [dbo].[RentalDetail] CHECK CONSTRAINT [FK_RentalDetail_RentalItem]
GO
/****** Object:  DdlTrigger [rds_deny_backups_trigger]    Script Date: 09/28/2015 14:48:16 ******/
Enable Trigger [rds_deny_backups_trigger] ON Database
GO
