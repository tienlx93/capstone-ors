USE [master]
GO
/****** Object:  Database [ors]    Script Date: 06/23/2015 16:34:59 ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 06/23/2015 16:35:00 ******/
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
/****** Object:  Table [dbo].[RepairStatus]    Script Date: 06/23/2015 16:35:00 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 06/23/2015 16:35:00 ******/
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
/****** Object:  Table [dbo].[AppointmentStatus]    Script Date: 06/23/2015 16:35:00 ******/
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
/****** Object:  Table [dbo].[AmenityGroup]    Script Date: 06/23/2015 16:35:00 ******/
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
INSERT [dbo].[AmenityGroup] ([Id], [Name], [Description]) VALUES (1, N'Vật dụng', N'Vật dụng để sửa chữa')
SET IDENTITY_INSERT [dbo].[AmenityGroup] OFF
/****** Object:  Table [dbo].[AccountStatus]    Script Date: 06/23/2015 16:35:00 ******/
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
/****** Object:  Table [dbo].[RentalStatus]    Script Date: 06/23/2015 16:35:00 ******/
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
/****** Object:  Table [dbo].[RentalItem]    Script Date: 06/23/2015 16:35:00 ******/
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
 CONSTRAINT [PK_RentalItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RentalItem] ON
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity]) VALUES (1, N'Bàn', N'Bàn làm việc 1*2 m', 100000, 100)
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity]) VALUES (2, N'Ghế', N'Ghế đơn văn phòng', 20000, 400)
SET IDENTITY_INSERT [dbo].[RentalItem] OFF
/****** Object:  Table [dbo].[PriceTerm]    Script Date: 06/23/2015 16:35:00 ******/
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
/****** Object:  Table [dbo].[PaymentTerm]    Script Date: 06/23/2015 16:35:00 ******/
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
/****** Object:  Table [dbo].[OfficeStatus]    Script Date: 06/23/2015 16:35:00 ******/
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
SET IDENTITY_INSERT [dbo].[OfficeStatus] OFF
/****** Object:  Table [dbo].[ContractStatus]    Script Date: 06/23/2015 16:35:00 ******/
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
/****** Object:  Table [dbo].[Office]    Script Date: 06/23/2015 16:35:00 ******/
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
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (4, N'Phú Mỹ Hưng', 2, 1, N'Căn hộ', 12, 2, 1, 100, N'.', NULL, N'12 Phú Mỹ Hưng', 10.8023066, 106.7149526, NULL, NULL, NULL, CAST(0x0000A41300000000 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (7, N'Văn phòng thứ 2', 1, 1, N'awet awet awe oliweau tiawue tilawuetwaiet
awetuy aowuety oauweyt oaiwet
aw oetuoawieu toiawue t', 12, 2, 12, 124, N'/upload/1/16219_10204043527185470_4770850841194644257_n.jpg,/upload/1/bthese_are_once_in_a_lifetime_pictures_these_photographer_29.jpg,', NULL, N'12 Trần Hưng Đạo, Quận 1, HCM', 10.8023066, 106.7149526, NULL, NULL, NULL, CAST(0x0000A43400000000 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (8, N'Văn phòng thứ 3', 2, 1, N'Mô tả ở đây', 123, 2, 1, 1000, N'/upload/1433823536505/1238338054EzJXzZc.jpg,/upload/1433823536505/16219_10204043527185470_4770850841194644257_n.jpg,', NULL, N'12 Trần Hưng Đạo, Quận 1, HCM', 10.8023066, 106.7149526, NULL, NULL, NULL, CAST(0x0000A41300000000 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (9, N'Văn phòng 4', 1, 1, N'aaa aaaokjaiw epiaw epoi ăpet
apiwetpo ă ietpo
păeoitpaoweti', NULL, 4, 0, 0, N'/upload/1433914827031/bthese_are_once_in_a_lifetime_pictures_these_photographer_29.jpg,/upload/1433914827031/Gun.JPG,', NULL, N'12 Trần Hưng Đạo, Quận 1, HCM', 10.8023066, 106.7149526, NULL, NULL, NULL, CAST(0x0000A41400000000 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (10, N'Artexport House', 2, 1, N'Với mức giá tương đối mềm so với nhiều tòa nhà khu vực trung tâm quận Hoàn Kiếm, Artexport House là tòa nhà văn phòng hạng B có vị trí đẹp, thiết kế sang trọng và hiện đại đã và đang là sự lựa chọn của đa số các tập đoàn trong và ngoài nước tại Hà Nội. 
Vị trí tòa nhà Nằm tại số 2 Phạm Sư Mạnh, Quận Hoàn Kiếm, Artexport House chiếm một vị trí vô cùng đắc địa. Phía trước là mặt đường lớn, giao thông thuận lợi, xung quanh là nhiều cơ quan bộ ngành và tòa nhà văn phòng đang được nhiều doanh nghiệp trong và ngoài nước đang thuê hoạt động phát triển: ACB Office Building, tòa nhà Sun City, tòa nhà 18 Lý Thường Kiệt, tòa nhà Vinaplast… 
Thiết kế tòa nhà Artexport House là tòa nhà văn phòng hạng B được xây dựng trên diện tích tổng thể 800m2. Trong đó, diện tích xây dựng 700m2 gồm 10 tầng văn phòng và 1 tầng hầm. Với diện tích cho thuê mỗi sàn 600m2, tòa nhà văn phòng Artexport House được chia nhỏ linh hoạt với diện tích nhỏ nhất từ 41m2 phù hợp với quy mô và nhu cầu sử dụng đa dạng của các doanh nghiệp thuê. 
Tiện ích tòa nhà văn phòng Là văn phòng hạng B, trang thiết bị lắp ráp trong tòa nhà đều được trang bị theo tiêu chuẩn quốc tế đáp ứng đầy đủ nhu cầu và công năng sử dụng của doanh nghiệp thuê. Ngoài ra, với vị trí trung tâm, tòa nhà văn phòng còn được thừa hưởng nhiều giá trị và tiện ích của khu vực xung quanh: ngân hàng, nhà hàng, khách sạn, khu trung tâm thương mại dịch vụ và vui chơi giải trí…
 Với vị trí và thiết kế hiện đại, linh hoạt, Artexport House là một trong những vị trí lý tưởng cho nhiều doanh nghiệp đang có nhu cầu mở rộng quy mô và hoạt động kinh doanh tại khu vực trung tâm Hà Nội.', 1200000, 2, 10, 34000, N'/upload/1434474002457/1238338054EzJXzZc.jpg,/upload/1434474002457/9670109131_f67463b51f_b.jpg,', NULL, N'Số 2 Phạm Sư Mạnh, Hoàn Kiếm, Hà Nội', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A4BA00003EFA AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Office] OFF
/****** Object:  Table [dbo].[Account]    Script Date: 06/23/2015 16:35:00 ******/
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
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'userb', N'123', N'1123@124', 4, 1)
/****** Object:  Table [dbo].[Amenity]    Script Date: 06/23/2015 16:35:00 ******/
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
 CONSTRAINT [PK_Amentity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Amenity] ON
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId]) VALUES (1, N'Bãi đỗ xe', NULL, 0, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId]) VALUES (2, N'Căn tin', NULL, 0, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId]) VALUES (3, N'Máy lạnh', NULL, 0, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId]) VALUES (4, N'Internet cáp quang', NULL, 0, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId]) VALUES (5, N'Điều hòa', NULL, 0, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId]) VALUES (6, N'Gần siêu thị', NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[Amenity] OFF
/****** Object:  Table [dbo].[Appointment]    Script Date: 06/23/2015 16:35:00 ******/
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
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (2, N'user1', N'staff1', 8, CAST(0x0000A41300000000 AS DateTime), 3, CAST(0x0000A4AA00000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (3, N'userb', N'staff1', 9, CAST(0x0000A41400000000 AS DateTime), 3, CAST(0x0000A41300000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (5, N'userb', NULL, 7, CAST(0x0000A41300000000 AS DateTime), 5, CAST(0x0000A41300000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (8, N'userb', N'staff1', 9, CAST(0x0000A4BC00000000 AS DateTime), 4, CAST(0x0000A4B800BDEBA0 AS DateTime), NULL, NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (9, N'userb', N'staff1', 9, CAST(0x0000A4C700000000 AS DateTime), 4, CAST(0x0000A4B800D0B6BC AS DateTime), CAST(0x0000A4B800D19B9C AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (10, N'user1', NULL, 9, CAST(0x0000A4BC00000000 AS DateTime), 1, CAST(0x0000A4BA00D28063 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Appointment] OFF
/****** Object:  Table [dbo].[Contract]    Script Date: 06/23/2015 16:35:00 ******/
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
SET IDENTITY_INSERT [dbo].[Contract] OFF
/****** Object:  Table [dbo].[OfficeAmenity]    Script Date: 06/23/2015 16:35:00 ******/
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
SET IDENTITY_INSERT [dbo].[OfficeAmenity] OFF
/****** Object:  Table [dbo].[Profile]    Script Date: 06/23/2015 16:35:00 ******/
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
INSERT [dbo].[Profile] ([Username], [Title], [FullName], [Company], [Phone], [Address], [Birthday]) VALUES (N'userb', N'Bà  ', N'Lê Thị B', NULL, N'01235151511', N'Tại Gia', CAST(0x0000629200000000 AS DateTime))
/****** Object:  Table [dbo].[RequestOffice]    Script Date: 06/23/2015 16:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestOffice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerUsername] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Price] [int] NULL,
	[Area] [float] NULL,
	[Address] [nvarchar](250) NULL,
 CONSTRAINT [PK_RequestOffice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestAmenity]    Script Date: 06/23/2015 16:35:00 ******/
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
/****** Object:  Table [dbo].[Repair]    Script Date: 06/23/2015 16:35:00 ******/
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
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (5, 2, N'staff1', N'jshgoahsoihia ioe', 3, CAST(0x0000A43500000000 AS DateTime), CAST(0x0000A4B800D28778 AS DateTime), NULL)
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (6, 4, NULL, N'oiauwoitu aowieut oiawue toia uwoetiuaowituaowiet', 5, CAST(0x0000A49000000000 AS DateTime), CAST(0x0000A4B800D2705C AS DateTime), NULL)
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (7, 4, NULL, N'oiawuetoiau wetiu', 1, CAST(0x0000A4AA00000000 AS DateTime), CAST(0x0000A4B7010B1DFE AS DateTime), NULL)
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (8, 5, N'staff1', N'sửa máy lạnh', 2, CAST(0x0000A4BA00C8A896 AS DateTime), NULL, NULL)
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (9, 5, NULL, N'124', 1, CAST(0x0000A4BA00CA5B6B AS DateTime), NULL, NULL)
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (10, 5, NULL, N'sửa xe', 1, CAST(0x0000A4BA00CD5459 AS DateTime), NULL, NULL)
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (11, 6, NULL, N'sửa máy lạnh', 1, CAST(0x0000A4BA00D76333 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Repair] OFF
/****** Object:  Table [dbo].[Rental]    Script Date: 06/23/2015 16:35:00 ******/
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
INSERT [dbo].[Rental] ([Id], [ContractId], [AssignStaff], [StatusId], [Description], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (1, 2, NULL, 1, N'ailweu iauwe tpiuaweptowapto', CAST(0x0000A43700000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Rental] ([Id], [ContractId], [AssignStaff], [StatusId], [Description], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (2, 4, N'staff1', 2, N'ioiwapoaweitp awpeiotipwaoetp', CAST(0x0000A4AD00000000 AS DateTime), CAST(0x0000A4B70111EC93 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Rental] OFF
/****** Object:  Table [dbo].[RepairDetail]    Script Date: 06/23/2015 16:35:00 ******/
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
SET IDENTITY_INSERT [dbo].[RepairDetail] OFF
/****** Object:  Table [dbo].[RentalDetail]    Script Date: 06/23/2015 16:35:00 ******/
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
/****** Object:  Default [DF_Amenity_HitCount]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[Amenity] ADD  CONSTRAINT [DF_Amenity_HitCount]  DEFAULT ((0)) FOR [Weight]
GO
/****** Object:  ForeignKey [FK_Office_Category]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[Office]  WITH CHECK ADD  CONSTRAINT [FK_Office_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Office] CHECK CONSTRAINT [FK_Office_Category]
GO
/****** Object:  ForeignKey [FK_Office_Office]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[Office]  WITH CHECK ADD  CONSTRAINT [FK_Office_Office] FOREIGN KEY([ParentOfficeId])
REFERENCES [dbo].[Office] ([Id])
GO
ALTER TABLE [dbo].[Office] CHECK CONSTRAINT [FK_Office_Office]
GO
/****** Object:  ForeignKey [FK_Office_OfficeStatus]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[Office]  WITH CHECK ADD  CONSTRAINT [FK_Office_OfficeStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[OfficeStatus] ([Id])
GO
ALTER TABLE [dbo].[Office] CHECK CONSTRAINT [FK_Office_OfficeStatus]
GO
/****** Object:  ForeignKey [FK_Office_PriceTerm]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[Office]  WITH CHECK ADD  CONSTRAINT [FK_Office_PriceTerm] FOREIGN KEY([PriceTerm])
REFERENCES [dbo].[PriceTerm] ([Id])
GO
ALTER TABLE [dbo].[Office] CHECK CONSTRAINT [FK_Office_PriceTerm]
GO
/****** Object:  ForeignKey [FK_Account_AccountStatus]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_AccountStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[AccountStatus] ([Id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_AccountStatus]
GO
/****** Object:  ForeignKey [FK_Account_Role]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
/****** Object:  ForeignKey [FK_Amenity_AmenityGroup]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[Amenity]  WITH CHECK ADD  CONSTRAINT [FK_Amenity_AmenityGroup] FOREIGN KEY([AmenityGroupId])
REFERENCES [dbo].[AmenityGroup] ([Id])
GO
ALTER TABLE [dbo].[Amenity] CHECK CONSTRAINT [FK_Amenity_AmenityGroup]
GO
/****** Object:  ForeignKey [FK_Appointment_Account]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Account] FOREIGN KEY([CustomerUsername])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Account]
GO
/****** Object:  ForeignKey [FK_Appointment_Account1]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Account1] FOREIGN KEY([AssignedStaff])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Account1]
GO
/****** Object:  ForeignKey [FK_Appointment_AppointmentStatus]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_AppointmentStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[AppointmentStatus] ([Id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_AppointmentStatus]
GO
/****** Object:  ForeignKey [FK_Appointment_Office]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Office] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Office] ([Id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Office]
GO
/****** Object:  ForeignKey [FK_Contract_Account]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Account] FOREIGN KEY([CustomerUsername])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Account]
GO
/****** Object:  ForeignKey [FK_Contract_ContractStatus]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_ContractStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ContractStatus] ([Id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_ContractStatus]
GO
/****** Object:  ForeignKey [FK_Contract_Office]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Office] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Office] ([Id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Office]
GO
/****** Object:  ForeignKey [FK_Contract_PaymentTerm]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_PaymentTerm] FOREIGN KEY([PaymentTerm])
REFERENCES [dbo].[PaymentTerm] ([Id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_PaymentTerm]
GO
/****** Object:  ForeignKey [FK_OfficeAmenity_Amentity]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[OfficeAmenity]  WITH CHECK ADD  CONSTRAINT [FK_OfficeAmenity_Amentity] FOREIGN KEY([AmenityId])
REFERENCES [dbo].[Amenity] ([Id])
GO
ALTER TABLE [dbo].[OfficeAmenity] CHECK CONSTRAINT [FK_OfficeAmenity_Amentity]
GO
/****** Object:  ForeignKey [FK_OfficeAmenity_Office]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[OfficeAmenity]  WITH CHECK ADD  CONSTRAINT [FK_OfficeAmenity_Office] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Office] ([Id])
GO
ALTER TABLE [dbo].[OfficeAmenity] CHECK CONSTRAINT [FK_OfficeAmenity_Office]
GO
/****** Object:  ForeignKey [FK_Profile_Account]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_Account]
GO
/****** Object:  ForeignKey [FK_RequestOffice_Account]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[RequestOffice]  WITH CHECK ADD  CONSTRAINT [FK_RequestOffice_Account] FOREIGN KEY([CustomerUsername])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[RequestOffice] CHECK CONSTRAINT [FK_RequestOffice_Account]
GO
/****** Object:  ForeignKey [FK_RequestOffice_Category]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[RequestOffice]  WITH CHECK ADD  CONSTRAINT [FK_RequestOffice_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[RequestOffice] CHECK CONSTRAINT [FK_RequestOffice_Category]
GO
/****** Object:  ForeignKey [FK_RequestAmentity_Amentity]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[RequestAmenity]  WITH CHECK ADD  CONSTRAINT [FK_RequestAmentity_Amentity] FOREIGN KEY([AmenityId])
REFERENCES [dbo].[Amenity] ([Id])
GO
ALTER TABLE [dbo].[RequestAmenity] CHECK CONSTRAINT [FK_RequestAmentity_Amentity]
GO
/****** Object:  ForeignKey [FK_RequestAmentity_RequestOffice]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[RequestAmenity]  WITH CHECK ADD  CONSTRAINT [FK_RequestAmentity_RequestOffice] FOREIGN KEY([RequestOfficeId])
REFERENCES [dbo].[RequestOffice] ([Id])
GO
ALTER TABLE [dbo].[RequestAmenity] CHECK CONSTRAINT [FK_RequestAmentity_RequestOffice]
GO
/****** Object:  ForeignKey [FK_Repair_Account]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[Repair]  WITH CHECK ADD  CONSTRAINT [FK_Repair_Account] FOREIGN KEY([AssignedStaff])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Repair] CHECK CONSTRAINT [FK_Repair_Account]
GO
/****** Object:  ForeignKey [FK_Repair_Contract]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[Repair]  WITH CHECK ADD  CONSTRAINT [FK_Repair_Contract] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contract] ([Id])
GO
ALTER TABLE [dbo].[Repair] CHECK CONSTRAINT [FK_Repair_Contract]
GO
/****** Object:  ForeignKey [FK_Repair_RepairStatus]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[Repair]  WITH CHECK ADD  CONSTRAINT [FK_Repair_RepairStatus] FOREIGN KEY([RepairStatusId])
REFERENCES [dbo].[RepairStatus] ([Id])
GO
ALTER TABLE [dbo].[Repair] CHECK CONSTRAINT [FK_Repair_RepairStatus]
GO
/****** Object:  ForeignKey [FK_Rental_Account]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_Account] FOREIGN KEY([AssignStaff])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_Account]
GO
/****** Object:  ForeignKey [FK_Rental_Contract]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_Contract] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contract] ([Id])
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_Contract]
GO
/****** Object:  ForeignKey [FK_Rental_RentalStatus]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_RentalStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[RentalStatus] ([Id])
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_RentalStatus]
GO
/****** Object:  ForeignKey [FK_RepairDetail_Amenity]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[RepairDetail]  WITH CHECK ADD  CONSTRAINT [FK_RepairDetail_Amenity] FOREIGN KEY([AmenityId])
REFERENCES [dbo].[Amenity] ([Id])
GO
ALTER TABLE [dbo].[RepairDetail] CHECK CONSTRAINT [FK_RepairDetail_Amenity]
GO
/****** Object:  ForeignKey [FK_RepairDetail_Repair]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[RepairDetail]  WITH CHECK ADD  CONSTRAINT [FK_RepairDetail_Repair] FOREIGN KEY([RepairId])
REFERENCES [dbo].[Repair] ([Id])
GO
ALTER TABLE [dbo].[RepairDetail] CHECK CONSTRAINT [FK_RepairDetail_Repair]
GO
/****** Object:  ForeignKey [FK_RentalDetail_Rental]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[RentalDetail]  WITH CHECK ADD  CONSTRAINT [FK_RentalDetail_Rental] FOREIGN KEY([RentalId])
REFERENCES [dbo].[Rental] ([Id])
GO
ALTER TABLE [dbo].[RentalDetail] CHECK CONSTRAINT [FK_RentalDetail_Rental]
GO
/****** Object:  ForeignKey [FK_RentalDetail_RentalItem]    Script Date: 06/23/2015 16:35:00 ******/
ALTER TABLE [dbo].[RentalDetail]  WITH CHECK ADD  CONSTRAINT [FK_RentalDetail_RentalItem] FOREIGN KEY([RentalItemId])
REFERENCES [dbo].[RentalItem] ([Id])
GO
ALTER TABLE [dbo].[RentalDetail] CHECK CONSTRAINT [FK_RentalDetail_RentalItem]
GO
