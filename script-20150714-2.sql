USE [master]
GO
/****** Object:  Database [ors]    Script Date: 07/14/2015 20:24:20 ******/
CREATE DATABASE [ors] ON  PRIMARY 
( NAME = N'ors', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\ors.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ors_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\ors_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
ALTER DATABASE [ors] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ors] SET  MULTI_USER
GO
ALTER DATABASE [ors] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ors] SET DB_CHAINING OFF
GO
USE [ors]
GO
/****** Object:  Table [dbo].[RentalStatus]    Script Date: 07/14/2015 20:24:22 ******/
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
/****** Object:  Table [dbo].[RentalItem]    Script Date: 07/14/2015 20:24:22 ******/
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
 CONSTRAINT [PK_RentalItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RentalItem] ON
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl]) VALUES (1, N'Bàn', N'Bàn làm việc 1*2 m', 100000, 100, NULL)
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl]) VALUES (2, N'Ghế', N'Ghế đơn văn phòng', 20000, 400, NULL)
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl]) VALUES (3, N'Bàn làm việc', N'Bàn composite, phù hợp đặt 1 máy tính, hộc đựng bàn phím, 2 bên đặt các hộc tủ', 12000, 50, N'/upload/rental/d63e3d1c-2984-4a12-8eea-08060de78afd.jpg')
SET IDENTITY_INSERT [dbo].[RentalItem] OFF
/****** Object:  Table [dbo].[RepairStatus]    Script Date: 07/14/2015 20:24:22 ******/
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
INSERT [dbo].[RepairStatus] ([Id], [Name], [Description]) VALUES (1, N'Requested', N'Chờ xử lí')
INSERT [dbo].[RepairStatus] ([Id], [Name], [Description]) VALUES (2, N'Assigned', N'Đã giao việc')
INSERT [dbo].[RepairStatus] ([Id], [Name], [Description]) VALUES (3, N'Done', N'Hoàn thành')
INSERT [dbo].[RepairStatus] ([Id], [Name], [Description]) VALUES (4, N'Canceled', N'Hủy')
INSERT [dbo].[RepairStatus] ([Id], [Name], [Description]) VALUES (5, N'Waiting Confirm', N'Chờ khách hàng xác nhận')
SET IDENTITY_INSERT [dbo].[RepairStatus] OFF
/****** Object:  Table [dbo].[Role]    Script Date: 07/14/2015 20:24:22 ******/
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
SET IDENTITY_INSERT [dbo].[Role] OFF
/****** Object:  Table [dbo].[Category]    Script Date: 07/14/2015 20:24:22 ******/
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
/****** Object:  Table [dbo].[AppointmentStatus]    Script Date: 07/14/2015 20:24:22 ******/
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
/****** Object:  Table [dbo].[AmenityGroup]    Script Date: 07/14/2015 20:24:22 ******/
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
/****** Object:  Table [dbo].[AccountStatus]    Script Date: 07/14/2015 20:24:22 ******/
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
/****** Object:  Table [dbo].[PriceTerm]    Script Date: 07/14/2015 20:24:22 ******/
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
INSERT [dbo].[PriceTerm] ([Id], [Name], [Description]) VALUES (3, N'Person', N'Trên người')
INSERT [dbo].[PriceTerm] ([Id], [Name], [Description]) VALUES (4, N'Call', N'Liên hệ')
SET IDENTITY_INSERT [dbo].[PriceTerm] OFF
/****** Object:  Table [dbo].[PaymentTerm]    Script Date: 07/14/2015 20:24:22 ******/
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
/****** Object:  Table [dbo].[OfficeStatus]    Script Date: 07/14/2015 20:24:22 ******/
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
SET IDENTITY_INSERT [dbo].[OfficeStatus] OFF
/****** Object:  Table [dbo].[ContractStatus]    Script Date: 07/14/2015 20:24:22 ******/
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
/****** Object:  Table [dbo].[Office]    Script Date: 07/14/2015 20:24:22 ******/
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
	[OtherDetail] [ntext] NULL,
	[Address] [nvarchar](150) NOT NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[District] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[ParentOfficeId] [int] NULL,
	[CreateDate] [datetime] NOT NULL,
	[ViewCount] [int] NULL,
 CONSTRAINT [PK_Office] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Office] ON
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (4, N'Phú Mỹ Hưng', 2, 1, N'Căn hộ', NULL, 4, 1, 100, N'.', NULL, N'12 Phú Mỹ Hưng', 10.8023066, 106.7149526, NULL, NULL, NULL, CAST(0x0000A41300000000 AS DateTime), 4)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (7, N'Văn phòng thứ 2', 1, 1, N'awet awet awe oliweau tiawue tilawuetwaiet
awetuy aowuety oauweyt oaiwet
aw oetuoawieu toiawue t', NULL, 4, 12, 124, N'/upload/1/16219_10204043527185470_4770850841194644257_n.jpg,/upload/1/bthese_are_once_in_a_lifetime_pictures_these_photographer_29.jpg,', NULL, N'12 Trần Hưng Đạo, Quận 1, HCM', 10.8023066, 106.7149526, NULL, NULL, NULL, CAST(0x0000A43400000000 AS DateTime), 5)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (8, N'Văn phòng thứ 3', 2, 1, N'Mô tả ở đây', NULL, 4, 1, 800, N'/upload/1433823536505/1238338054EzJXzZc.jpg,/upload/1433823536505/16219_10204043527185470_4770850841194644257_n.jpg,', NULL, N'12 Trần Hưng Đạo, Quận 1, HCM', 10.8023066, 106.7149526, NULL, NULL, NULL, CAST(0x0000A41300000000 AS DateTime), 4)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (9, N'Văn phòng 4', 1, 1, N'aaa aaaokjaiw epiaw epoi ăpet
apiwetpo ă ietpo
păeoitpaoweti', NULL, 4, 0, 0, N'/upload/1433914827031/bthese_are_once_in_a_lifetime_pictures_these_photographer_29.jpg,/upload/1433914827031/Gun.JPG,', NULL, N'12 Trần Hưng Đạo, Quận 1, HCM', 10.8023066, 106.7149526, NULL, NULL, NULL, CAST(0x0000A41400000000 AS DateTime), 1)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (10, N'Artexport House', 2, 1, N'Với mức giá tương đối mềm so với nhiều tòa nhà khu vực trung tâm quận Hoàn Kiếm, Artexport House là tòa nhà văn phòng hạng B có vị trí đẹp, thiết kế sang trọng và hiện đại đã và đang là sự lựa chọn của đa số các tập đoàn trong và ngoài nước tại Hà Nội. 
Vị trí tòa nhà Nằm tại số 2 Phạm Sư Mạnh, Quận Hoàn Kiếm, Artexport House chiếm một vị trí vô cùng đắc địa. Phía trước là mặt đường lớn, giao thông thuận lợi, xung quanh là nhiều cơ quan bộ ngành và tòa nhà văn phòng đang được nhiều doanh nghiệp trong và ngoài nước đang thuê hoạt động phát triển: ACB Office Building, tòa nhà Sun City, tòa nhà 18 Lý Thường Kiệt, tòa nhà Vinaplast… 
Thiết kế tòa nhà Artexport House là tòa nhà văn phòng hạng B được xây dựng trên diện tích tổng thể 800m2. Trong đó, diện tích xây dựng 700m2 gồm 10 tầng văn phòng và 1 tầng hầm. Với diện tích cho thuê mỗi sàn 600m2, tòa nhà văn phòng Artexport House được chia nhỏ linh hoạt với diện tích nhỏ nhất từ 41m2 phù hợp với quy mô và nhu cầu sử dụng đa dạng của các doanh nghiệp thuê. 
Tiện ích tòa nhà văn phòng Là văn phòng hạng B, trang thiết bị lắp ráp trong tòa nhà đều được trang bị theo tiêu chuẩn quốc tế đáp ứng đầy đủ nhu cầu và công năng sử dụng của doanh nghiệp thuê. Ngoài ra, với vị trí trung tâm, tòa nhà văn phòng còn được thừa hưởng nhiều giá trị và tiện ích của khu vực xung quanh: ngân hàng, nhà hàng, khách sạn, khu trung tâm thương mại dịch vụ và vui chơi giải trí…
 Với vị trí và thiết kế hiện đại, linh hoạt, Artexport House là một trong những vị trí lý tưởng cho nhiều doanh nghiệp đang có nhu cầu mở rộng quy mô và hoạt động kinh doanh tại khu vực trung tâm Hà Nội.', 550000, 2, 10, 1400, N'/upload/1434474002457/1238338054EzJXzZc.jpg,/upload/1434474002457/9670109131_f67463b51f_b.jpg,', NULL, N'Số 2 Phạm Sư Mạnh, Hoàn Kiếm, Hà Nội', 10.8023066, 106.7149526, NULL, NULL, NULL, CAST(0x0000A4BA00003EFA AS DateTime), 3)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (51, N'CAO ỐC VĂN PHÒNG LIM TOWER', 2, 1, N'- LIM Tower thuộc chuỗi văn phòng cho thuê quận 1 tọa lạc trên mặt tiền đường Tôn Đức Thắng , Quận 1. Từ LIM Tower ra trung tâm quận 1 chỉ cần 5 phút đi xe máy. Gần LIM Tower có các cao ốc sang trọng bật nhất tại thành phố như: Saigon Trade Center, Green Power, Miss Áo Dài Building, Gemadept Tower...
 
- Giao thông tại cao ốc văn phòng LIM Tower:
+ Cách sở thú khoảng 5 phút đi xe máy .
+ Cách cầu Thủ Thiêm chỉ cần 5 phút đi xem máy.
+ Cách bến xe Bus khoảng 3 phút đi bộ.
+ Cách đài truyền hình Thành Phố Hồ Chí Minh 10 phút đi bộ.
+ Cách nhà thờ Đức Bà khoảng 5 phút đi xe máy.', 225000, 2, 7, 900, N'/upload/1436458919393/1.jpg,', NULL, N'20 Cộng Hoà, Cộng Hòa, Phường 4, Hồ Chí Minh, Việt Nam', 10.801496, 106.65491900000006, N'Tân Bình', N'Hồ Chí Minh', NULL, CAST(0x0000A4D00181F328 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (52, N'MAI HỒNG QUẾ BUILDING', 1, 1, N'- Mai Hồng Quế Building thuộc chuỗi văn phòng cho thuê quận 1 tọa lạc trên mặt tiền đường Nguyễn Hữu Cầu, Quận 1. Từ Mai Hồng Quế Building ra trung tâm quận 1 chỉ cần 10 phút đi xe máy. Đối diện Mai Hồng Quế Building là chợ Tân Định, khu trung tâm mua sắm sầm uất.', 5000000, 1, 1, 25, N'/upload/1436459127006/2.jpg,', NULL, N'1025 Cách Mạng Tháng 8, Tân Bình, Hồ Chí Minh, Việt Nam', 10.792158, 106.65474530000006, N'Tân Bình', N'Hồ Chí Minh', NULL, CAST(0x0000A4D001829531 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (53, N'CAO ỐC NORCH BUILDING', 2, 1, N'Tòa nhà Norch Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng C. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Tòa nhà văn phòng cho thuê Norch Building cao 12 tầng diện tích sàn 394m2 sử dụng 2 thang máy tốc độ cao , hệ thống PCCC, hệ thống báo cháy và chữa cháy tự động theo tiêu chuẩn hệ thống, 01 máy phát điện dự phòng 1000 KW…Bên cạnh đó, nơi đây còn có đội ngũ quản lý chuyên nghiệp và lực lượng bảo vệ 24/24h.f', 192000, 2, 9, 3000, N'/upload/1436459253685/4.jpg,', NULL, N'30 Phan Thúc Duyện, Tân Bình, Hồ Chí Minh, Việt Nam', 10.8039128, 106.66204519999997, N'Tân Bình', N'Hồ Chí Minh', NULL, CAST(0x0000A4D00182FC8C AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (54, N'TÒA NHÀ IES BUILDING', 2, 1, N'Tòa nhà IES Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng Giá rẻ. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu tốt. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định. 

Cao ốc văn phòng IES Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng IES Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.', 312000, 2, 20, 2500, N'/upload/1436459340720/5.jpg,/upload/1436459340720/6.jpg,', NULL, N'60 Phan Xích Long, Phú Nhuận, Hồ Chí Minh, Việt Nam', 10.800146, 106.68410900000004, N'Phú Nhuận', N'Hồ Chí Minh', NULL, CAST(0x0000A4D0018357FD AS DateTime), 1)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (55, N'CAO ỐC TKT BUILDING', 2, 1, N'Tòa nhà TKT Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng C. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.', 289000, 2, 10, 5000, N'/upload/1436459418791/7.jpg,/upload/1436459418791/4.jpg,', NULL, N'200/1 Lũy Bán Bích, Hồ Chí Minh, Việt Nam', 10.789653, 106.63708799999996, N'Tân Phú', N'Hồ Chí Minh', NULL, CAST(0x0000A4D00183CBF5 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (56, N'CAO ỐC SMART VIEW BUILDING', 2, 1, N'Tòa nhà Smart View Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng C. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng Smart View Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng Smart View Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.', 500000, 2, 20, 4000, N'/upload/1436459517456/8.jpg,/upload/1436459517456/11.jpg,', NULL, N'600 Nguyễn Đình Chiểu, Hồ Chí Minh, Việt Nam', 10.769588, 106.68148339999992, N'Quận 3', N'Hồ Chí Minh', NULL, CAST(0x0000A4D001846024 AS DateTime), 2)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (57, N'TÒA NHÀ ANH NGỮ SMART OFFICE', 2, 1, N'Tòa nhà Anh Ngữ Smart Office được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng cho thuê giá rẻ. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Tòa nhà văn phòng cho thuê Anh Ngữ Smart Office cao 6 tầng diện tích sàn 80m2 sử dụng 1 thang máy tốc độ cao , hệ thống PCCC, hệ thống báo cháy và chữa cháy tự động theo tiêu chuẩn hệ thống, 01 máy phát điện dự phòng cho toàn bộ tòa nhà chạy 24/24…Bên cạnh đó, nơi đây còn có đội ngũ quản lý chuyên nghiệp và lực lượng bảo vệ 24/24h.', 240000, 2, 7, 5000, N'/upload/1436459644044/9.jpg,', NULL, N'502 Huynh Tan Phat, Bình Thuận, Hồ Chí Minh, Việt Nam', 10.7482276, 106.72884320000004, N'Quận 7', N'Hồ Chí Minh', NULL, CAST(0x0000A4D00184BC2D AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (58, N'SAVICO OFFICE BUILDING', 2, 1, N'Tòa nhà Savico Office Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng cho thuê giá rẻ. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng Savico Office Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng Savico Office Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.
', 430000, 2, 9, 700, N'/upload/1436459722468/17.jpg,', NULL, N'70 Lê Minh Xuân, Tân Bình, Hồ Chí Minh, Việt Nam', 10.7865101, 106.652644, N'Tân Bình', N'Hồ Chí Minh', NULL, CAST(0x0000A4D00185142C AS DateTime), 3)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (59, N'HAN BUILDING', 2, 1, N'Tòa nhà HAN Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng C. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng HAN Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng HAN Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.
', 400000, 2, 12, 3000, N'/upload/1436459797910/16.jpg,', NULL, N'899 Nguyễn Trãi, Hồ Chí Minh, Việt Nam', 10.7527261, 106.65590729999995, N'Quận 5', N'Hồ Chí Minh', NULL, CAST(0x0000A4D001855DC1 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (60, N'VFC TOWER', 1, 1, N'Tòa nhà VFC Tower được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng C. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng VFC Tower tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng VFC Tower là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.', 5000000, 1, 5, 20, N'/upload/1436459860587/18.jpg,', NULL, N'55 Trần Quang Khải, Hồ Chí Minh, Việt Nam', 10.79206, 106.69416090000004, N'Quận 1', N'Hồ Chí Minh', NULL, CAST(0x0000A4D00185EE9D AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (61, N'RIVER VIEW TOWER', 2, 1, N'Tòa nhà River View Tower được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng B. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng River View Tower tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng River View Tower là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.', 350000, 2, 16, 2000, N'/upload/1436459983833/15.jpg,', NULL, N'602 Lê Hồng Phong, Hồ Chí Minh, Việt Nam', 10.7711608, 106.67285600000002, N'Quận 10', N'Hồ Chí Minh', NULL, CAST(0x0000A4D001863E5B AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (62, N'LAFAYETTE DE SAIGON', 2, 1, N'Tòa nhà Lafayette De Saigon Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng B. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng Lafayette De Saigon Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng Lafayette De Saigon Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.', 400000, 2, 20, 5000, N'/upload/1436460053999/14.jpg,', NULL, N'343 Phạm Ngũ Lão, Hồ Chí Minh, Việt Nam', 10.767076, 106.69016999999997, N'Quận 1', N'Hồ Chí Minh', NULL, CAST(0x0000A4D001867FA6 AS DateTime), 9)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (63, N'INTERNATIONAL PLAZA', 2, 1, N'Tòa nhà International Plaza Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng C. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng International Plaza Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng International Plaza Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.', 350000, 2, 20, 5000, N'/upload/1436460108353/18.jpg,', NULL, N'700 Nguyễn Kiệm, Phú Nhuận, Hồ Chí Minh, Việt Nam', 10.808452, 106.6786489, N'Phú Nhuận', N'Hồ Chí Minh', NULL, CAST(0x0000A4D0018748C1 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (64, N'MAI SƠN BUILDING', 2, 1, N'Tòa nhà Mai Sơn Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng giá rẻ. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng Mai Sơn Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng Mai Sơn Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.
', 125000, 2, 25, 7000, N'/upload/1436460305783/14.jpg,', NULL, N'200 Vạn Kiếp, Hồ Chí Minh, Việt Nam', 10.798671, 106.69348590000004, N'Bình Thạnh', N'Hồ Chí Minh', NULL, CAST(0x0000A4D001879992 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (65, N'NAM PHƯƠNG BUILDING', 2, 1, N'Tòa nhà Nam Phương Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng cho thuê giá rẻ. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng Nam Phương Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng Nam Phương Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.
', 400000, 2, 13, 2500, N'/upload/1436460348125/7.jpg,', NULL, N'100 Bình Thới, Hồ Chí Minh, Việt Nam', 10.7690889, 106.64807300000008, N'Quận 11', N'Hồ Chí Minh', NULL, CAST(0x0000A4D00187E432 AS DateTime), 1)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (66, N'SKY VIEW BUILDING', 2, 1, N'Tòa nhà Sky View Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng cho thuê giá rẻ. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng Sky View Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng Sky View Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.
', 200000, 2, 6, 1300, N'/upload/1436460411885/17.jpg,', NULL, N'800 Nguyễn Văn Linh, Tân Phú, Hồ Chí Minh, Việt Nam', 10.7318542, 106.71924349999996, N'Quận 7', N'Hồ Chí Minh', NULL, CAST(0x0000A4D00188207C AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (67, N'NVG OFFICE BUILDING', 2, 1, N'Tòa nhà NVG Office Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng cho thuê giá rẻ. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng NVG Office Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng NVG Office Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.
', 250000, 2, 8, 4000, N'/upload/1436460463411/5.jpg,', NULL, N'600 Cộng Hòa, Tân Bình, Hồ Chí Minh, Việt Nam', 10.804534, 106.63771599999996, N'Tân Bình', N'Hồ Chí Minh', NULL, CAST(0x0000A4D001885EA0 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (68, N'SUNSHINE BUILDING', 2, 1, N'Tòa nhà Sunshine Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng cho thuê giá rẻ. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng Sunshine Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng Sunshine Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.
', 295000, 2, 10, 5000, N'/upload/1436460516255/9.jpg,', NULL, N'455 Tô Hiến Thành, Hồ Chí Minh, Việt Nam', 10.7774874, 106.66500129999996, N'Quận 10', N'Hồ Chí Minh', NULL, CAST(0x0000A4D00188A599 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (69, N'MISS ÁO DÀI BUILDING', 2, 1, N'Tòa nhà Miss Áo Dài Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng B. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng Miss Áo Dài Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng Miss Áo Dài Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.', 215000, 2, 9, 4500, N'/upload/1436460516255/9.jpg,', NULL, N'221 Nguyễn Thị Minh Khai, Nguyễn Cư Trinh, Hồ Chí Minh, Việt Nam', 10.767096, 106.68354999999995, N'Quận 1', N'Hồ Chí Minh', NULL, CAST(0x0000A4D00188EE6E AS DateTime), 3)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (70, N'ZEN PLAZA', 1, 1, N'Tòa nhà Zen Plaza Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng B. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng Zen Plaza Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng Zen Plaza Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.', 1000000, 1, 10, 30, N'/upload/1436460640214/11.jpg,', NULL, N'233 Nguyễn Trãi, Hồ Chí Minh, Việt Nam', 10.7565673, 106.67708419999995, N'Quận 5', N'Hồ Chí Minh', NULL, CAST(0x0000A4D0018936D6 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (71, N'GOLDEN TOWER', 2, 1, N'Tòa nhà Golden Tower được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng B. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng Golden Tower tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng Golden Tower là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.', 400000, 2, 20, 10000, N'/upload/1436460721962/4.jpg,', NULL, N'254 Nguyễn Trãi, Hồ Chí Minh, Việt Nam', 10.762506, 106.68560200000002, N'Quận 1', N'Hồ Chí Minh', NULL, CAST(0x0000A4D001898910 AS DateTime), 1)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (72, N'ĐỖ TRẦN BUILDING', 2, 1, N'Tòa nhà Đỗ Trần Building được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng giá rẻ. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng Đỗ Trần Building tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng Đỗ Trần Building là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.', 150000, 2, 15, 7500, N'/upload/1436460772208/16.jpg,', NULL, N'677 Lê Hồng Phong, Hồ Chí Minh, Việt Nam', 10.7740419, 106.67175989999998, N'Quận 10', N'Hồ Chí Minh', NULL, CAST(0x0000A4D00189D68D AS DateTime), 2)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (73, N'VTP OFFICE SERVICE CENTER', 2, 1, N'Tòa nhà VTP Office Service Center được thiết kế theo đúng tiêu chuẩn của một cao ốc văn phòng hạng B. Hệ thống thang máy, máy lạnh thuộc nhãn hiệu cao cấp. Các văn phòng thì được lắp đặt sẵn các đường dây điện thoại, internet tốc độ cao, truyền hình cáp, Camera quan sát….
 
Mặt bằng được thiết kế  thoáng rộng rãi, nhận đủ ánh sáng mặt trời. Trang thiết bị trong toilet được làm bằng sứ cao cấp, hàng nhập với chất lượng đã được kiểm định.
 
Cao ốc văn phòng VTP Office Service Center tọa lạc tại nơi có không gian sạch sẽ, thoáng đãng, chất lượng dịch vụ tốt, view đẹp, văn phòng VTP Office Service Center là sự lựa chọn lý tưởng cho doanh nghiệp của bạn.
', 250000, 2, 13, 6000, N'/upload/1436460892613/12.jpg,', NULL, N'577 Nguyễn Kiệm, Hồ Chí Minh, Việt Nam', 10.805433, 106.678539, N'Phú Nhuận', N'Hồ Chí Minh', NULL, CAST(0x0000A4D0018A6118 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (74, N'CAO ỐC SAIGON TIMES SQUARE BUILDING', 2, 1, N'Saigon Times Square (Việt Nam) là một cao ốc phức hợp cao 164m tọa lạc ngay tại trung tâm TP.HCM. Với hai mặt tiền đại lộ Nguyễn Huệ và đường Đồng Khởi đắc địa, tòa tháp có các căn hộ dịch vụ tiện nghi theo tiêu chuẩn Leading Hotel of the World, 8 tầng văn phòng cho thuê hạng A và trung tâm mua sắm hiện đại cùng 5 nhà hàng – bar cao cấp và sang trọng bậc nhất thành phố.

Times Square được đầu tư bởi Công ty cổ phần đầu tư Times Square (Việt Nam), đây là tòa tháp có tường kính vòng lớn nhất Châu Á, mở ra không gian bao quát toàn cảnh thành phố và sông Sài Gòn. ', 315000, 2, 20, 8000, N'/upload/1436460957582/9.jpg,', NULL, N'299 Tôn Thất Thuyết, Hồ Chí Minh, Việt Nam', 10.7532518, 106.70545319999997, N'Quận 4', N'Hồ Chí Minh', NULL, CAST(0x0000A4D0018AAE36 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Office] OFF
/****** Object:  Table [dbo].[Account]    Script Date: 07/14/2015 20:24:22 ******/
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
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'admin', N'123', N'admin@ors', 1, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'manager1', N'123', N'manager@ors', 2, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'staff1', N'123', N'abv@123', 3, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'staff2', N'123', N'staff2@123', 3, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'staff3', N'123', N'staff3@ors', 3, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'tôi tên là lá la', N'124', N'124@124', 4, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'user1', N'123', N'abc@123', 4, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'user3', N'123', N'user3@gmail.com', 4, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'user4', N'123', N'user3@gmail.com', 4, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'userb', N'123', N'1123@124', 4, 1)
/****** Object:  Table [dbo].[Amenity]    Script Date: 07/14/2015 20:24:22 ******/
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
 CONSTRAINT [PK_Amentity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Amenity] ON
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (1, N'Phòng vệ sinh', NULL, 1, 1, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (2, N'Phòng tắm', NULL, 2, 1, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (3, N'Phòng ăn', NULL, 3, 1, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (4, N'Thang máy', NULL, 6, 1, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (5, N'Bãi đỗ xe', NULL, 10, 1, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (6, N'Sảnh', NULL, 11, 1, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (7, N'Phòng họp', NULL, 10, 2, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (8, N'Phòng họp trực tuyến', NULL, 11, 2, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (9, N'Hội trường', NULL, 12, 2, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (10, N'Hệ thống báo động', NULL, 1, 3, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (11, N'Hệ thống chữa cháy', NULL, 2, 3, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (12, N'Bảo vệ', NULL, 5, 3, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (13, N'Camera', NULL, 6, 3, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (14, N'IT hỗ trợ', NULL, 8, 3, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (15, N'Dịch vụ vệ sinh', NULL, 12, 3, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (16, N'Khu tiếp tân', NULL, 15, 3, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (17, N'Đèn', NULL, 1, 4, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (18, N'Điện', NULL, 2, 4, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (19, N'Bàn ghế', NULL, 4, 4, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (20, N'Điều hòa', NULL, 6, 4, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (21, N'Quạt trần', NULL, 7, 4, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (22, N'Wifi', NULL, 9, 4, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (23, N'Internet', NULL, 10, 4, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (24, N'Bảng viết', NULL, 15, 4, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (25, N'TV', NULL, 17, 4, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (26, N'Máy chiếu', NULL, 18, 4, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (27, N'Máy fax', NULL, 22, 4, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (28, N'Điện thoại bàn', NULL, 23, 4, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (29, N'Máy in', NULL, 25, 4, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (30, N'Máy hủy giấy', NULL, 27, 4, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (31, N'Máy photocopy', NULL, 24, 4, NULL)
SET IDENTITY_INSERT [dbo].[Amenity] OFF
/****** Object:  Table [dbo].[Appointment]    Script Date: 07/14/2015 20:24:22 ******/
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
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (2, N'user1', N'staff1', 8, CAST(0x0000A41300000000 AS DateTime), 4, CAST(0x0000A4AA00000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (3, N'userb', N'staff1', 9, CAST(0x0000A41400000000 AS DateTime), 5, CAST(0x0000A41300000000 AS DateTime), NULL, N'giá đắt')
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (5, N'userb', NULL, 7, CAST(0x0000A41300000000 AS DateTime), 5, CAST(0x0000A41300000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (8, N'userb', N'staff1', 9, CAST(0x0000A4BC00000000 AS DateTime), 4, CAST(0x0000A4B800BDEBA0 AS DateTime), NULL, NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (9, N'userb', N'staff1', 9, CAST(0x0000A4C700000000 AS DateTime), 4, CAST(0x0000A4B800D0B6BC AS DateTime), CAST(0x0000A4B800D19B9C AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (10, N'user1', N'staff1', 9, CAST(0x0000A4BC00000000 AS DateTime), 2, CAST(0x0000A4BA00D28063 AS DateTime), NULL, NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (11, N'user1', N'staff1', 9, CAST(0x0000A4C800830310 AS DateTime), 2, CAST(0x0000A4C4018B3A1E AS DateTime), NULL, NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (12, N'user1', NULL, 9, CAST(0x0000A4C800830310 AS DateTime), 1, CAST(0x0000A4C4018B408F AS DateTime), NULL, NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (13, N'userb', N'staff2', 9, CAST(0x0000A4C800903210 AS DateTime), 3, CAST(0x0000A4C600D29A3A AS DateTime), CAST(0x0000A4CF00D1BB62 AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (14, N'user1', N'staff1', 9, CAST(0x0000A4CF00888150 AS DateTime), 2, CAST(0x0000A4CD0015317E AS DateTime), CAST(0x0000A4CD001CAD38 AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (15, N'user1', NULL, 9, CAST(0x0000A4D100888150 AS DateTime), 1, CAST(0x0000A4CD00154102 AS DateTime), NULL, NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (16, N'userb', N'staff3', 9, CAST(0x0000A4CF008FEBC0 AS DateTime), 2, CAST(0x0000A4CD001CCFDA AS DateTime), NULL, NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (17, N'userb', NULL, 9, CAST(0x0000A4CF008FEBC0 AS DateTime), 1, CAST(0x0000A4CD001CD967 AS DateTime), NULL, NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (18, N'userb', N'staff3', 9, CAST(0x0000A4CF00903210 AS DateTime), 2, CAST(0x0000A4CD001CE259 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Appointment] OFF
/****** Object:  Table [dbo].[OfficeGroup]    Script Date: 07/14/2015 20:24:22 ******/
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
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (7, 1)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (8, 1)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (9, 1)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (10, 2)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (51, 0)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (52, 0)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (53, 0)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (54, 3)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (55, 0)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (56, 4)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (57, 1)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (58, 4)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (59, 4)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (60, 3)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (61, 4)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (62, 4)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (63, 3)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (64, 3)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (65, 4)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (66, 1)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (67, 0)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (68, 0)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (69, 4)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (70, 1)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (71, 4)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (72, 0)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (73, 3)
INSERT [dbo].[OfficeGroup] ([OfficeId], [OfficeGroup]) VALUES (74, 4)
/****** Object:  Table [dbo].[OfficeAmenity]    Script Date: 07/14/2015 20:24:22 ******/
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
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (1, 8, 1)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (2, 8, 2)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (3, 8, 4)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (4, 8, 5)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (5, 8, 6)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (6, 9, 1)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (7, 9, 3)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (8, 10, 1)
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
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (31, 59, 1)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (32, 60, 20)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (33, 60, 11)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (34, 61, 12)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (35, 61, 11)
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (36, 61, 1)
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
INSERT [dbo].[OfficeAmenity] ([Id], [OfficeId], [AmenityId]) VALUES (53, 70, 12)
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
SET IDENTITY_INSERT [dbo].[OfficeAmenity] OFF
/****** Object:  Table [dbo].[Contract]    Script Date: 07/14/2015 20:24:22 ******/
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
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Contract] ON
INSERT [dbo].[Contract] ([Id], [CustomerUsername], [OfficeId], [StartDate], [EndDate], [PaymentFee], [PaymentTerm], [StatusId], [Comment]) VALUES (2, N'user1', 4, CAST(0x063A0B00 AS Date), CAST(0x743B0B00 AS Date), 100, 1, 1, NULL)
INSERT [dbo].[Contract] ([Id], [CustomerUsername], [OfficeId], [StartDate], [EndDate], [PaymentFee], [PaymentTerm], [StatusId], [Comment]) VALUES (4, N'userb', 8, CAST(0x053A0B00 AS Date), CAST(0x733B0B00 AS Date), 1000000, 2, 1, NULL)
INSERT [dbo].[Contract] ([Id], [CustomerUsername], [OfficeId], [StartDate], [EndDate], [PaymentFee], [PaymentTerm], [StatusId], [Comment]) VALUES (5, N'userb', 9, CAST(0x313A0B00 AS Date), CAST(0x7E3A0B00 AS Date), 0, 2, 1, NULL)
INSERT [dbo].[Contract] ([Id], [CustomerUsername], [OfficeId], [StartDate], [EndDate], [PaymentFee], [PaymentTerm], [StatusId], [Comment]) VALUES (6, N'userb', 9, CAST(0x163A0B00 AS Date), CAST(0x9B3A0B00 AS Date), 0, 2, 1, NULL)
INSERT [dbo].[Contract] ([Id], [CustomerUsername], [OfficeId], [StartDate], [EndDate], [PaymentFee], [PaymentTerm], [StatusId], [Comment]) VALUES (7, N'user1', 8, CAST(0x233A0B00 AS Date), CAST(0x913B0B00 AS Date), 1200000, 2, 1, NULL)
SET IDENTITY_INSERT [dbo].[Contract] OFF
/****** Object:  Table [dbo].[RequestOffice]    Script Date: 07/14/2015 20:24:22 ******/
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
INSERT [dbo].[RequestOffice] ([Id], [CustomerUsername], [CategoryId], [Price], [Area], [District], [CreateDate], [ScheduleDate], [OfficeSuggested], [Available]) VALUES (1, N'user3', 1, 123124124, 124, N'Blah', CAST(0x0000A4D0016E22EB AS DateTime), NULL, NULL, 1)
INSERT [dbo].[RequestOffice] ([Id], [CustomerUsername], [CategoryId], [Price], [Area], [District], [CreateDate], [ScheduleDate], [OfficeSuggested], [Available]) VALUES (2, N'user3', 1, 123124124, 124, N'Blah', CAST(0x0000A4D0016E22EB AS DateTime), NULL, NULL, 1)
INSERT [dbo].[RequestOffice] ([Id], [CustomerUsername], [CategoryId], [Price], [Area], [District], [CreateDate], [ScheduleDate], [OfficeSuggested], [Available]) VALUES (3, N'user3', 1, 123124124, 124, N'Blah', CAST(0x0000A4D0016E4546 AS DateTime), NULL, NULL, 1)
INSERT [dbo].[RequestOffice] ([Id], [CustomerUsername], [CategoryId], [Price], [Area], [District], [CreateDate], [ScheduleDate], [OfficeSuggested], [Available]) VALUES (4, N'user3', 1, 123124124, 124, N'Blah', CAST(0x0000A4D0016E4546 AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[RequestOffice] OFF
/****** Object:  Table [dbo].[Profile]    Script Date: 07/14/2015 20:24:22 ******/
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
INSERT [dbo].[Profile] ([Username], [Title], [FullName], [Company], [Phone], [Address], [Birthday]) VALUES (N'user1', N'Ông ', N'Nguyễn Văn A', NULL, N'01231231234', N'12 Hải Triều, Quận Bình Thạnh', CAST(0x0000806800000000 AS DateTime))
INSERT [dbo].[Profile] ([Username], [Title], [FullName], [Company], [Phone], [Address], [Birthday]) VALUES (N'user3', N'Ông ', N'Nguyễn Văn Ba', N'Cty', N'012121212121', N'12 Trần Hưng Đạo, Quận 1, HCM', CAST(0x0000852C00000000 AS DateTime))
INSERT [dbo].[Profile] ([Username], [Title], [FullName], [Company], [Phone], [Address], [Birthday]) VALUES (N'user4', N'Ông ', N'Nguyễn Văn Ba', N'Cty', N'012121212121', N'12 Trần Hưng Đạo, Quận 1, HCM', CAST(0x000084F800000000 AS DateTime))
INSERT [dbo].[Profile] ([Username], [Title], [FullName], [Company], [Phone], [Address], [Birthday]) VALUES (N'userb', N'Bà  ', N'Lê Thị B', NULL, N'0123456785', N'Tại Gia', CAST(0x00007DAB00000000 AS DateTime))
/****** Object:  Table [dbo].[EmailQueue]    Script Date: 07/14/2015 20:24:22 ******/
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
/****** Object:  Table [dbo].[Rental]    Script Date: 07/14/2015 20:24:22 ******/
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
INSERT [dbo].[Rental] ([Id], [ContractId], [AssignStaff], [StatusId], [Description], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (1, 2, N'staff3', 1, N'ailweu iauwe tpiuaweptowapto', CAST(0x0000A43700000000 AS DateTime), NULL, CAST(0x0000A4C600000000 AS DateTime))
INSERT [dbo].[Rental] ([Id], [ContractId], [AssignStaff], [StatusId], [Description], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (2, 4, N'staff1', 2, N'ioiwapoaweitp awpeiotipwaoetp', CAST(0x0000A4AD00000000 AS DateTime), CAST(0x0000A4B70111EC93 AS DateTime), CAST(0x0000A4C600000000 AS DateTime))
INSERT [dbo].[Rental] ([Id], [ContractId], [AssignStaff], [StatusId], [Description], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (3, 2, NULL, 1, N'sdgasg', CAST(0x0000A4CD00C9F692 AS DateTime), NULL, NULL)
INSERT [dbo].[Rental] ([Id], [ContractId], [AssignStaff], [StatusId], [Description], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (4, 2, NULL, 1, N'sdgasg', CAST(0x0000A4CD00CA4EF1 AS DateTime), NULL, NULL)
INSERT [dbo].[Rental] ([Id], [ContractId], [AssignStaff], [StatusId], [Description], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (5, 2, NULL, 1, N'sdgasg', CAST(0x0000A4CD00CA7FDF AS DateTime), NULL, NULL)
INSERT [dbo].[Rental] ([Id], [ContractId], [AssignStaff], [StatusId], [Description], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (6, 2, NULL, 1, N'sdgasg', CAST(0x0000A4CD00CAB732 AS DateTime), NULL, NULL)
INSERT [dbo].[Rental] ([Id], [ContractId], [AssignStaff], [StatusId], [Description], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (7, 4, NULL, 1, N'Giao som dum', CAST(0x0000A4CF00D0B48C AS DateTime), NULL, NULL)
INSERT [dbo].[Rental] ([Id], [ContractId], [AssignStaff], [StatusId], [Description], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (8, 2, NULL, 1, N'123', CAST(0x0000A4CF00D8365D AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Rental] OFF
/****** Object:  Table [dbo].[RequestAmenity]    Script Date: 07/14/2015 20:24:22 ******/
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
/****** Object:  Table [dbo].[Repair]    Script Date: 07/14/2015 20:24:22 ******/
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
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (5, 2, N'staff1', N'jshgoahsoihia ioe', 3, CAST(0x0000A43500000000 AS DateTime), CAST(0x0000A4B800D28778 AS DateTime), CAST(0x0000A4C600000000 AS DateTime))
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (6, 4, NULL, N'oiauwoitu aowieut oiawue toia uwoetiuaowituaowiet', 5, CAST(0x0000A49000000000 AS DateTime), CAST(0x0000A4B800D2705C AS DateTime), NULL)
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (7, 4, N'staff2', N'oiawuetoiau wetiu', 2, CAST(0x0000A4AA00000000 AS DateTime), CAST(0x0000A4CF00BF4A05 AS DateTime), CAST(0x0000A4D100000000 AS DateTime))
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (8, 5, N'staff1', N'sửa máy lạnh', 4, CAST(0x0000A4BA00C8A896 AS DateTime), CAST(0x0000A4C600BAE150 AS DateTime), CAST(0x0000A4C700000000 AS DateTime))
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (9, 5, N'staff1', N'124', 2, CAST(0x0000A4BA00CA5B6B AS DateTime), NULL, CAST(0x0000A4CB00000000 AS DateTime))
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (10, 5, N'staff2', N'sửa xe', 4, CAST(0x0000A4BA00CD5459 AS DateTime), CAST(0x0000A4C600D1DDE2 AS DateTime), NULL)
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (11, 6, N'staff3', N'sửa máy lạnh', 1, CAST(0x0000A4BA00D76333 AS DateTime), NULL, NULL)
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (12, 4, N'staff2', N'2141', 2, CAST(0x0000A4CD00B51825 AS DateTime), CAST(0x0000A4CD00D46A0B AS DateTime), CAST(0x0000A4D200000000 AS DateTime))
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (13, 4, NULL, N'asfasdg', 1, CAST(0x0000A4CD00B52E25 AS DateTime), NULL, NULL)
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (14, 4, NULL, N'asdga', 1, CAST(0x0000A4CD00B537EF AS DateTime), NULL, NULL)
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (15, 7, NULL, N'Sua cap', 1, CAST(0x0000A4CD00D4D614 AS DateTime), NULL, NULL)
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (16, 7, NULL, N'uu tien cao', 1, CAST(0x0000A4CD00D5597B AS DateTime), NULL, NULL)
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (17, 7, N'staff2', N'1', 2, CAST(0x0000A4CD00D590DB AS DateTime), CAST(0x0000A4CD00D5D1F0 AS DateTime), CAST(0x0000A4CD00000000 AS DateTime))
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (18, 7, NULL, N'2', 1, CAST(0x0000A4CD00D596C1 AS DateTime), NULL, NULL)
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (19, 7, NULL, N'3', 1, CAST(0x0000A4CD00D59C9D AS DateTime), NULL, NULL)
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (20, 4, NULL, N'124', 1, CAST(0x0000A4CF0013CA61 AS DateTime), NULL, NULL)
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (21, 4, NULL, N'124', 1, CAST(0x0000A4CF0013D532 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Repair] OFF
/****** Object:  Table [dbo].[RepairDetail]    Script Date: 07/14/2015 20:24:22 ******/
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
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (1, 5, 1)
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (2, 5, 2)
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (3, 6, 3)
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (4, 6, 4)
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (5, 7, 1)
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (6, 7, 2)
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (7, 7, 3)
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (8, 10, 1)
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (9, 11, 3)
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (10, 12, 2)
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (11, 13, 4)
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (12, 14, 5)
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (13, 15, 4)
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (14, 16, 4)
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (15, 17, 4)
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (16, 18, 4)
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (17, 19, 4)
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (18, 20, 4)
INSERT [dbo].[RepairDetail] ([Id], [RepairId], [AmenityId]) VALUES (19, 21, 6)
SET IDENTITY_INSERT [dbo].[RepairDetail] OFF
/****** Object:  Table [dbo].[RentalDetail]    Script Date: 07/14/2015 20:24:22 ******/
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
INSERT [dbo].[RentalDetail] ([Id], [RentalItemId], [RentalId], [UnitPrice], [Quantity]) VALUES (1, 1, 1, 1241, 1)
INSERT [dbo].[RentalDetail] ([Id], [RentalItemId], [RentalId], [UnitPrice], [Quantity]) VALUES (2, 2, 1, 124, 4)
INSERT [dbo].[RentalDetail] ([Id], [RentalItemId], [RentalId], [UnitPrice], [Quantity]) VALUES (3, 1, 2, 124, 2)
INSERT [dbo].[RentalDetail] ([Id], [RentalItemId], [RentalId], [UnitPrice], [Quantity]) VALUES (4, 2, 2, 123, 8)
SET IDENTITY_INSERT [dbo].[RentalDetail] OFF
/****** Object:  StoredProcedure [dbo].[GetJobCount]    Script Date: 07/14/2015 20:24:32 ******/
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
	WHERE StatusId = 2 AND [Time] >= @StartDate AND [Time] < @EndDate)
	UNION ALL
	(SELECT AssignedStaff AS Staff, AssignedTime AS [time]
	FROM Repair
	WHERE RepairStatusId = 2  AND AssignedTime >= @StartDate AND AssignedTime < @EndDate)
	UNION ALL
	(SELECT AssignedStaff AS Staff, AssignedTime AS [time]
	FROM Repair
	WHERE RepairStatusId = 2  AND AssignedTime >= @StartDate AND AssignedTime < @EndDate)
	UNION ALL
	(SELECT AssignStaff AS Staff, AssignedTime AS [time]
	FROM Rental
	WHERE StatusId = 2 AND AssignedTime >= @StartDate AND AssignedTime < @EndDate)
	) a
	GROUP BY Staff
GO
/****** Object:  Default [DF_Amenity_HitCount]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[Amenity] ADD  CONSTRAINT [DF_Amenity_HitCount]  DEFAULT ((0)) FOR [Weight]
GO
/****** Object:  ForeignKey [FK_Office_Category]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[Office]  WITH CHECK ADD  CONSTRAINT [FK_Office_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Office] CHECK CONSTRAINT [FK_Office_Category]
GO
/****** Object:  ForeignKey [FK_Office_Office]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[Office]  WITH CHECK ADD  CONSTRAINT [FK_Office_Office] FOREIGN KEY([ParentOfficeId])
REFERENCES [dbo].[Office] ([Id])
GO
ALTER TABLE [dbo].[Office] CHECK CONSTRAINT [FK_Office_Office]
GO
/****** Object:  ForeignKey [FK_Office_OfficeStatus]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[Office]  WITH CHECK ADD  CONSTRAINT [FK_Office_OfficeStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[OfficeStatus] ([Id])
GO
ALTER TABLE [dbo].[Office] CHECK CONSTRAINT [FK_Office_OfficeStatus]
GO
/****** Object:  ForeignKey [FK_Office_PriceTerm]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[Office]  WITH CHECK ADD  CONSTRAINT [FK_Office_PriceTerm] FOREIGN KEY([PriceTerm])
REFERENCES [dbo].[PriceTerm] ([Id])
GO
ALTER TABLE [dbo].[Office] CHECK CONSTRAINT [FK_Office_PriceTerm]
GO
/****** Object:  ForeignKey [FK_Account_AccountStatus]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_AccountStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[AccountStatus] ([Id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_AccountStatus]
GO
/****** Object:  ForeignKey [FK_Account_Role]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
/****** Object:  ForeignKey [FK_Amenity_AmenityGroup]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[Amenity]  WITH CHECK ADD  CONSTRAINT [FK_Amenity_AmenityGroup] FOREIGN KEY([AmenityGroupId])
REFERENCES [dbo].[AmenityGroup] ([Id])
GO
ALTER TABLE [dbo].[Amenity] CHECK CONSTRAINT [FK_Amenity_AmenityGroup]
GO
/****** Object:  ForeignKey [FK_Appointment_Account]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Account] FOREIGN KEY([CustomerUsername])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Account]
GO
/****** Object:  ForeignKey [FK_Appointment_Account1]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Account1] FOREIGN KEY([AssignedStaff])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Account1]
GO
/****** Object:  ForeignKey [FK_Appointment_AppointmentStatus]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_AppointmentStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[AppointmentStatus] ([Id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_AppointmentStatus]
GO
/****** Object:  ForeignKey [FK_Appointment_Office]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Office] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Office] ([Id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Office]
GO
/****** Object:  ForeignKey [FK_OfficeGroup_Office]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[OfficeGroup]  WITH CHECK ADD  CONSTRAINT [FK_OfficeGroup_Office] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Office] ([Id])
GO
ALTER TABLE [dbo].[OfficeGroup] CHECK CONSTRAINT [FK_OfficeGroup_Office]
GO
/****** Object:  ForeignKey [FK_OfficeAmenity_Amentity]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[OfficeAmenity]  WITH CHECK ADD  CONSTRAINT [FK_OfficeAmenity_Amentity] FOREIGN KEY([AmenityId])
REFERENCES [dbo].[Amenity] ([Id])
GO
ALTER TABLE [dbo].[OfficeAmenity] CHECK CONSTRAINT [FK_OfficeAmenity_Amentity]
GO
/****** Object:  ForeignKey [FK_OfficeAmenity_Office]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[OfficeAmenity]  WITH CHECK ADD  CONSTRAINT [FK_OfficeAmenity_Office] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Office] ([Id])
GO
ALTER TABLE [dbo].[OfficeAmenity] CHECK CONSTRAINT [FK_OfficeAmenity_Office]
GO
/****** Object:  ForeignKey [FK_Contract_Account]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Account] FOREIGN KEY([CustomerUsername])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Account]
GO
/****** Object:  ForeignKey [FK_Contract_ContractStatus]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_ContractStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ContractStatus] ([Id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_ContractStatus]
GO
/****** Object:  ForeignKey [FK_Contract_Office]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Office] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Office] ([Id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Office]
GO
/****** Object:  ForeignKey [FK_Contract_PaymentTerm]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_PaymentTerm] FOREIGN KEY([PaymentTerm])
REFERENCES [dbo].[PaymentTerm] ([Id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_PaymentTerm]
GO
/****** Object:  ForeignKey [FK_RequestOffice_Account]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[RequestOffice]  WITH CHECK ADD  CONSTRAINT [FK_RequestOffice_Account] FOREIGN KEY([CustomerUsername])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[RequestOffice] CHECK CONSTRAINT [FK_RequestOffice_Account]
GO
/****** Object:  ForeignKey [FK_RequestOffice_Category]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[RequestOffice]  WITH CHECK ADD  CONSTRAINT [FK_RequestOffice_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[RequestOffice] CHECK CONSTRAINT [FK_RequestOffice_Category]
GO
/****** Object:  ForeignKey [FK_Profile_Account]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_Account]
GO
/****** Object:  ForeignKey [FK_EmailQueue_Account]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[EmailQueue]  WITH CHECK ADD  CONSTRAINT [FK_EmailQueue_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[EmailQueue] CHECK CONSTRAINT [FK_EmailQueue_Account]
GO
/****** Object:  ForeignKey [FK_Rental_Account]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_Account] FOREIGN KEY([AssignStaff])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_Account]
GO
/****** Object:  ForeignKey [FK_Rental_Contract]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_Contract] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contract] ([Id])
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_Contract]
GO
/****** Object:  ForeignKey [FK_Rental_RentalStatus]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_RentalStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[RentalStatus] ([Id])
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_RentalStatus]
GO
/****** Object:  ForeignKey [FK_RequestAmentity_Amentity]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[RequestAmenity]  WITH CHECK ADD  CONSTRAINT [FK_RequestAmentity_Amentity] FOREIGN KEY([AmenityId])
REFERENCES [dbo].[Amenity] ([Id])
GO
ALTER TABLE [dbo].[RequestAmenity] CHECK CONSTRAINT [FK_RequestAmentity_Amentity]
GO
/****** Object:  ForeignKey [FK_RequestAmentity_RequestOffice]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[RequestAmenity]  WITH CHECK ADD  CONSTRAINT [FK_RequestAmentity_RequestOffice] FOREIGN KEY([RequestOfficeId])
REFERENCES [dbo].[RequestOffice] ([Id])
GO
ALTER TABLE [dbo].[RequestAmenity] CHECK CONSTRAINT [FK_RequestAmentity_RequestOffice]
GO
/****** Object:  ForeignKey [FK_Repair_Account]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[Repair]  WITH CHECK ADD  CONSTRAINT [FK_Repair_Account] FOREIGN KEY([AssignedStaff])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Repair] CHECK CONSTRAINT [FK_Repair_Account]
GO
/****** Object:  ForeignKey [FK_Repair_Contract]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[Repair]  WITH CHECK ADD  CONSTRAINT [FK_Repair_Contract] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contract] ([Id])
GO
ALTER TABLE [dbo].[Repair] CHECK CONSTRAINT [FK_Repair_Contract]
GO
/****** Object:  ForeignKey [FK_Repair_RepairStatus]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[Repair]  WITH CHECK ADD  CONSTRAINT [FK_Repair_RepairStatus] FOREIGN KEY([RepairStatusId])
REFERENCES [dbo].[RepairStatus] ([Id])
GO
ALTER TABLE [dbo].[Repair] CHECK CONSTRAINT [FK_Repair_RepairStatus]
GO
/****** Object:  ForeignKey [FK_RepairDetail_Amenity]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[RepairDetail]  WITH CHECK ADD  CONSTRAINT [FK_RepairDetail_Amenity] FOREIGN KEY([AmenityId])
REFERENCES [dbo].[Amenity] ([Id])
GO
ALTER TABLE [dbo].[RepairDetail] CHECK CONSTRAINT [FK_RepairDetail_Amenity]
GO
/****** Object:  ForeignKey [FK_RepairDetail_Repair]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[RepairDetail]  WITH CHECK ADD  CONSTRAINT [FK_RepairDetail_Repair] FOREIGN KEY([RepairId])
REFERENCES [dbo].[Repair] ([Id])
GO
ALTER TABLE [dbo].[RepairDetail] CHECK CONSTRAINT [FK_RepairDetail_Repair]
GO
/****** Object:  ForeignKey [FK_RentalDetail_Rental]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[RentalDetail]  WITH CHECK ADD  CONSTRAINT [FK_RentalDetail_Rental] FOREIGN KEY([RentalId])
REFERENCES [dbo].[Rental] ([Id])
GO
ALTER TABLE [dbo].[RentalDetail] CHECK CONSTRAINT [FK_RentalDetail_Rental]
GO
/****** Object:  ForeignKey [FK_RentalDetail_RentalItem]    Script Date: 07/14/2015 20:24:22 ******/
ALTER TABLE [dbo].[RentalDetail]  WITH CHECK ADD  CONSTRAINT [FK_RentalDetail_RentalItem] FOREIGN KEY([RentalItemId])
REFERENCES [dbo].[RentalItem] ([Id])
GO
ALTER TABLE [dbo].[RentalDetail] CHECK CONSTRAINT [FK_RentalDetail_RentalItem]
GO
