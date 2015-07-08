USE [master]
GO
/****** Object:  Database [ors]    Script Date: 7/8/2015 11:28:50 AM ******/
CREATE DATABASE [ors]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ors', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER2012\MSSQL\DATA\ors.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ors_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER2012\MSSQL\DATA\ors_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
ALTER DATABASE [ors] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ors] SET  MULTI_USER 
GO
ALTER DATABASE [ors] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ors] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ors] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ors] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ors', N'ON'
GO
USE [ors]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/8/2015 11:28:50 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AccountStatus]    Script Date: 7/8/2015 11:28:50 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Amenity]    Script Date: 7/8/2015 11:28:50 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AmenityGroup]    Script Date: 7/8/2015 11:28:50 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 7/8/2015 11:28:50 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AppointmentStatus]    Script Date: 7/8/2015 11:28:50 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/8/2015 11:28:50 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contract]    Script Date: 7/8/2015 11:28:50 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContractStatus]    Script Date: 7/8/2015 11:28:50 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Office]    Script Date: 7/8/2015 11:28:50 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OfficeAmenity]    Script Date: 7/8/2015 11:28:50 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OfficeStatus]    Script Date: 7/8/2015 11:28:50 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentTerm]    Script Date: 7/8/2015 11:28:50 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PriceTerm]    Script Date: 7/8/2015 11:28:50 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Profile]    Script Date: 7/8/2015 11:28:50 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rental]    Script Date: 7/8/2015 11:28:50 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RentalDetail]    Script Date: 7/8/2015 11:28:50 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RentalItem]    Script Date: 7/8/2015 11:28:50 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RentalStatus]    Script Date: 7/8/2015 11:28:50 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Repair]    Script Date: 7/8/2015 11:28:50 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RepairDetail]    Script Date: 7/8/2015 11:28:50 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RepairStatus]    Script Date: 7/8/2015 11:28:50 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RequestAmenity]    Script Date: 7/8/2015 11:28:50 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RequestOffice]    Script Date: 7/8/2015 11:28:50 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/8/2015 11:28:50 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'admin', N'123', N'admin@ors', 1, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'manager1', N'123', N'manager@ors', 2, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'staff1', N'123', N'abv@123', 3, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'staff2', N'123', N'staff2@123', 3, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'staff3', N'123', N'staff3@ors', 3, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'tôi tên là lá la', N'124', N'124@124', 4, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'user1', N'123', N'abc@123', 4, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId], [StatusId]) VALUES (N'userb', N'123', N'1123@124', 4, 1)
INSERT [dbo].[AccountStatus] ([Id], [Name], [Description]) VALUES (1, N'Normal', NULL)
INSERT [dbo].[AccountStatus] ([Id], [Name], [Description]) VALUES (2, N'Banned', NULL)
INSERT [dbo].[AccountStatus] ([Id], [Name], [Description]) VALUES (3, N'Deleted', NULL)
SET IDENTITY_INSERT [dbo].[Amenity] ON 

INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (1, N'phòng vệ sinh', NULL, 1, 1, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (2, N'phòng tắm', NULL, 2, 1, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (3, N'phòng ăn', NULL, 3, 1, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (4, N'thang máy', NULL, 6, 1, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (5, N'bãi đỗ xe', NULL, 10, 1, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (6, N'sảnh', NULL, 11, 1, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (7, N'phòng họp', N'gần bệnh viện', 10, 2, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (8, N'phòng họp trực tuyến', N'nhà tắm', 11, 2, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (1007, N'hội trường', NULL, 12, 2, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (1008, N'hệ thống báo động', NULL, 1, 3, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (1009, N'hệ thống chữa cháy', NULL, 2, 3, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (1010, N'bảo vệ', NULL, 5, 3, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (1011, N'camera', NULL, 6, 3, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (1012, N'IT hỗ trợ', NULL, 8, 3, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (1013, N'dịch vụ vệ sinh', NULL, 12, 3, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (1014, N'khu tiếp tân', NULL, 15, 3, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (1015, N'đèn', NULL, 1, 4, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (1016, N'điện', NULL, 2, 4, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (1017, N'bàn ghế', NULL, 4, 4, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (1018, N'điều hòa', NULL, 6, 4, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (1019, N'quạt trần', NULL, 7, 4, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (1020, N'wifi', NULL, 9, 4, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (1021, N'internet', NULL, 10, 4, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (1022, N'bảng viết', NULL, 15, 4, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (1023, N'TV', NULL, 17, 4, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (1024, N'máy chiếu', NULL, 18, 4, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (1025, N'máy fax', NULL, 22, 4, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (1026, N'điện thoại bàn', NULL, 23, 4, 1)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (1027, N'máy in', NULL, 24, 4, NULL)
INSERT [dbo].[Amenity] ([Id], [Name], [Description], [Weight], [AmenityGroupId], [Priority]) VALUES (1028, N'máy hủy giấy', NULL, 25, 4, NULL)
SET IDENTITY_INSERT [dbo].[Amenity] OFF
SET IDENTITY_INSERT [dbo].[AmenityGroup] ON 

INSERT [dbo].[AmenityGroup] ([Id], [Name], [Description]) VALUES (1, N'Tiện nghi căn bảng', N'Tiện nghi căn bảng')
INSERT [dbo].[AmenityGroup] ([Id], [Name], [Description]) VALUES (2, N'Tiện nghi họp', N'Tiện nghi họp')
INSERT [dbo].[AmenityGroup] ([Id], [Name], [Description]) VALUES (3, N'Dịch vụ', N'Dịch vụ')
INSERT [dbo].[AmenityGroup] ([Id], [Name], [Description]) VALUES (4, N'Vật dụng', N'Vật dụng')
SET IDENTITY_INSERT [dbo].[AmenityGroup] OFF
SET IDENTITY_INSERT [dbo].[Appointment] ON 

INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (2, N'user1', N'staff1', 8, CAST(0x0000A41300000000 AS DateTime), 4, CAST(0x0000A4AA00000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (3, N'userb', N'staff1', 9, CAST(0x0000A41400000000 AS DateTime), 5, CAST(0x0000A41300000000 AS DateTime), NULL, N'giá đắt')
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (5, N'userb', NULL, 7, CAST(0x0000A41300000000 AS DateTime), 5, CAST(0x0000A41300000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (8, N'userb', N'staff1', 9, CAST(0x0000A4BC00000000 AS DateTime), 4, CAST(0x0000A4B800BDEBA0 AS DateTime), NULL, NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (9, N'userb', N'staff1', 9, CAST(0x0000A4C700000000 AS DateTime), 4, CAST(0x0000A4B800D0B6BC AS DateTime), CAST(0x0000A4B800D19B9C AS DateTime), NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (10, N'user1', N'staff1', 9, CAST(0x0000A4BC00000000 AS DateTime), 2, CAST(0x0000A4BA00D28063 AS DateTime), NULL, NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (11, N'user1', N'staff1', 9, CAST(0x0000A4C800830310 AS DateTime), 2, CAST(0x0000A4C4018B3A1E AS DateTime), NULL, NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (12, N'user1', NULL, 9, CAST(0x0000A4C800830310 AS DateTime), 1, CAST(0x0000A4C4018B408F AS DateTime), NULL, NULL)
INSERT [dbo].[Appointment] ([Id], [CustomerUsername], [AssignedStaff], [OfficeId], [Time], [StatusId], [CreateTime], [UpdateTime], [Comment]) VALUES (13, N'userb', N'staff2', 9, CAST(0x0000A4C800903210 AS DateTime), 2, CAST(0x0000A4C600D29A3A AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Appointment] OFF
INSERT [dbo].[AppointmentStatus] ([Id], [Name], [Description]) VALUES (1, N'Pending', N'Chờ xử lí')
INSERT [dbo].[AppointmentStatus] ([Id], [Name], [Description]) VALUES (2, N'Assigned', N'Đã được giao')
INSERT [dbo].[AppointmentStatus] ([Id], [Name], [Description]) VALUES (3, N'Accepted', N'Chấp nhận')
INSERT [dbo].[AppointmentStatus] ([Id], [Name], [Description]) VALUES (4, N'Done', N'Hoàn thành')
INSERT [dbo].[AppointmentStatus] ([Id], [Name], [Description]) VALUES (5, N'Rejected', N'Hủy')
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Description]) VALUES (1, N'House', N'Văn phòng nguyên căn')
INSERT [dbo].[Category] ([Id], [Name], [Description]) VALUES (2, N'Building', N'Tòa nhà văn phòng')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Contract] ON 

INSERT [dbo].[Contract] ([Id], [CustomerUsername], [OfficeId], [StartDate], [EndDate], [PaymentFee], [PaymentTerm], [StatusId], [Comment]) VALUES (2, N'user1', 4, CAST(0x063A0B00 AS Date), CAST(0x743B0B00 AS Date), 100, 1, 1, NULL)
INSERT [dbo].[Contract] ([Id], [CustomerUsername], [OfficeId], [StartDate], [EndDate], [PaymentFee], [PaymentTerm], [StatusId], [Comment]) VALUES (4, N'userb', 8, CAST(0x053A0B00 AS Date), CAST(0x733B0B00 AS Date), 1000000, 2, 1, NULL)
INSERT [dbo].[Contract] ([Id], [CustomerUsername], [OfficeId], [StartDate], [EndDate], [PaymentFee], [PaymentTerm], [StatusId], [Comment]) VALUES (5, N'userb', 9, CAST(0x313A0B00 AS Date), CAST(0x7E3A0B00 AS Date), 0, 2, 1, NULL)
INSERT [dbo].[Contract] ([Id], [CustomerUsername], [OfficeId], [StartDate], [EndDate], [PaymentFee], [PaymentTerm], [StatusId], [Comment]) VALUES (6, N'userb', 9, CAST(0x163A0B00 AS Date), CAST(0x9B3A0B00 AS Date), 0, 2, 1, NULL)
INSERT [dbo].[Contract] ([Id], [CustomerUsername], [OfficeId], [StartDate], [EndDate], [PaymentFee], [PaymentTerm], [StatusId], [Comment]) VALUES (7, N'user1', 8, CAST(0x233A0B00 AS Date), CAST(0x913B0B00 AS Date), 1200000, 2, 1, NULL)
SET IDENTITY_INSERT [dbo].[Contract] OFF
SET IDENTITY_INSERT [dbo].[ContractStatus] ON 

INSERT [dbo].[ContractStatus] ([Id], [Name], [Description]) VALUES (1, N'Available', N'Khả dụng')
INSERT [dbo].[ContractStatus] ([Id], [Name], [Description]) VALUES (2, N'Extend Requested', N'Yêu cầu gia hạn')
INSERT [dbo].[ContractStatus] ([Id], [Name], [Description]) VALUES (3, N'Cancel Requested', N'Yêu cầu trả trước hạn')
INSERT [dbo].[ContractStatus] ([Id], [Name], [Description]) VALUES (4, N'Expire', N'Hết hạn/ Hủy')
SET IDENTITY_INSERT [dbo].[ContractStatus] OFF
SET IDENTITY_INSERT [dbo].[Office] ON 

INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (4, N'Phú Mỹ Hưng', 2, 1, N'Căn hộ', 12, 2, 1, 100, N'/img/office43.jpg,/img/office44.jpg,/img/office49.jpg,/img/office50.jpg,', NULL, N'12 Phú Mỹ Hưng', 10.8023066, 106.7149526, NULL, NULL, NULL, CAST(0x0000A41300000000 AS DateTime), 3)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (7, N'Văn phòng thứ 2', 1, 1, N'awet awet awe oliweau tiawue tilawuetwaiet
awetuy aowuety oauweyt oaiwet
aw oetuoawieu toiawue t', 12, 2, 12, 124, N'/img/office45.jpg,/img/office46.jpg,', NULL, N'12 Trần Hưng Đạo, Quận 1, HCM', 10.8023066, 106.7149526, NULL, NULL, NULL, CAST(0x0000A43400000000 AS DateTime), 20)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (8, N'Văn phòng thứ 3', 2, 1, N'Mô tả ở đây', 123, 2, 1, 800, N'/img/office47.jpg,/img/office48.jpg,', NULL, N'12 Trần Hưng Đạo, Quận 1, HCM', 10.8023066, 106.7149526, NULL, NULL, NULL, CAST(0x0000A41300000000 AS DateTime), 5)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (9, N'Văn phòng 4', 1, 1, N'aaa aaaokjaiw epiaw epoi ăpet
apiwetpo ă ietpo
păeoitpaoweti', NULL, 4, 0, 0, N'/img/office.jpg,/img/office1.jpg,', NULL, N'12 Trần Hưng Đạo, Quận 1, HCM', 10.8023066, 106.7149526, NULL, NULL, NULL, CAST(0x0000A41400000000 AS DateTime), 20)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (10, N'Artexport House', 2, 1, N'Với mức giá tương đối mềm so với nhiều tòa nhà khu vực trung tâm quận Hoàn Kiếm, Artexport House là tòa nhà văn phòng hạng B có vị trí đẹp, thiết kế sang trọng và hiện đại đã và đang là sự lựa chọn của đa số các tập đoàn trong và ngoài nước tại Hà Nội. 
Vị trí tòa nhà Nằm tại số 2 Phạm Sư Mạnh, Quận Hoàn Kiếm, Artexport House chiếm một vị trí vô cùng đắc địa. Phía trước là mặt đường lớn, giao thông thuận lợi, xung quanh là nhiều cơ quan bộ ngành và tòa nhà văn phòng đang được nhiều doanh nghiệp trong và ngoài nước đang thuê hoạt động phát triển: ACB Office Building, tòa nhà Sun City, tòa nhà 18 Lý Thường Kiệt, tòa nhà Vinaplast… 
Thiết kế tòa nhà Artexport House là tòa nhà văn phòng hạng B được xây dựng trên diện tích tổng thể 800m2. Trong đó, diện tích xây dựng 700m2 gồm 10 tầng văn phòng và 1 tầng hầm. Với diện tích cho thuê mỗi sàn 600m2, tòa nhà văn phòng Artexport House được chia nhỏ linh hoạt với diện tích nhỏ nhất từ 41m2 phù hợp với quy mô và nhu cầu sử dụng đa dạng của các doanh nghiệp thuê. 
Tiện ích tòa nhà văn phòng Là văn phòng hạng B, trang thiết bị lắp ráp trong tòa nhà đều được trang bị theo tiêu chuẩn quốc tế đáp ứng đầy đủ nhu cầu và công năng sử dụng của doanh nghiệp thuê. Ngoài ra, với vị trí trung tâm, tòa nhà văn phòng còn được thừa hưởng nhiều giá trị và tiện ích của khu vực xung quanh: ngân hàng, nhà hàng, khách sạn, khu trung tâm thương mại dịch vụ và vui chơi giải trí…
 Với vị trí và thiết kế hiện đại, linh hoạt, Artexport House là một trong những vị trí lý tưởng cho nhiều doanh nghiệp đang có nhu cầu mở rộng quy mô và hoạt động kinh doanh tại khu vực trung tâm Hà Nội.', 1200000, 2, 10, 34000, N'/img/office2.jpg,/img/office3.jpg,', NULL, N'Số 2 Phạm Sư Mạnh, Hoàn Kiếm, Hà Nội', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A4BA00003EFA AS DateTime), 13)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (13, N'Cao ốc văn phòng Tản Đà Building', 2, 1, N'Với thiết kế đơn giản và trang nhã, Cao ốc văn phong cho thuê Tản Đà Court Building đặc biệt nổi bật ngay giữa khu ẩm thực nổi tiếng và các khu buôn bán sầm uất của trung tâm kinh tế thương mại Chợ Lớn.

Nằm ngay tại giao lộ Tản Đà - Nguyễn Trãi, một vị trí rất thuận lợi giữa hai trung tâm kinh tế lớn Quận 1 và Quận 5. Với khoảng cách rất ngắn từ sân bay và Trung tâm Thành Phố.

Tản Đà Court Building sẽ mang lại không gian làm việc lý tưởng cho doanh nghiệp của bạn.', 120000, 2, 10, 800, N'/img/office3.jpg,/img/office4.jpg,', NULL, N'123 Lê Lợi, Hoàn Kiếm, Hà Nội', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A4BB00000000 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (15, N'Cao ốc văn phòng PTS SAIGON', 2, 1, N'Tòa nhà văn phòng cho thuê của PTS Sài Gòn tọa lạc trên trục đường Huỳnh Tấn Phát, rất gần cầu Tân Thuận; liền kề Khu chế xuất Tân Thuận, khu đô thị Phú Mỹ Hưng và chỉ mất 10 phút để đến trung tâm quận 1.

Tòa nhà được xây dựng theo kiến trúc hiện đại; đảm bảo cho Quý khách có một môi trường làm việc tiện nghi, thoáng mát và yên tĩnh. Diện tích phân chia cho mỗi tầng từ 50m2 - 360m2, thuận tiện cho Quý khách trong việc tính toán diện tích thuê.

Tòa nhà được trang bị hệ thống 2 thang máy tốc độ cao(1.75m/s), 2 thang bộ, hệ thống điện dự phòng đảm bảo cung cấp điện 24/24, hệ thống phòng cháy chữa cháy theo tiêu chuẩn và 2 khu vệ sinh nam nữ riêng biệt, tiện ích cho mỗi tầng… Tòa nhà có ưu thế đặc biệt về bãi đỗ xe, ngoài sức chứa ở tầng hầm là chỗ đậu xe rộng rãi quanh khuôn viên của tòa nhà.

Quý khách hàng sẽ được cung cấp các dịch vụ một cách hoàn hảo và chuyên nghiệp bởi đội ngũ bảo vệ, vệ sinh, bảo dưỡng toà nhà được chủ đầu tư chọn lựa từ những công ty uy tín hàng đầu tại Việt Nam.', 250000, 4, 10, 750, N'/img/office5.jpg,/img/office6.jpg,', NULL, N'45 Lý Thường Kiệt, Quận 5, HCM', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A4BB00000000 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (17, N'Văn Phòng Phú Mã Dương Building', 2, 1, N'Tọa lạc tại 57 Láng Hạ, một vị trí trung tâm của thành phố Hà Nội. Nơi đây cực kỳ thuận lợi về giao thông đi các địa điểm của Thành phố như lên Hồ Tây, Hoàn Kiếm, Lăng Bác…Ngoài ra phố Láng Hạ cũng được coi như phố Wall của Hà Nội, khi nơi đây tập trung các Trụ sở và Chi nhánh của nhiều Công ty, tổ chức tài chính lớn trong và ngoài nước
', 300000, 2, 5, 500, N'/img/office7.jpg,/img/office8.jpg,', NULL, N'55 Lý Thái Tổ, Quận 5, HCM', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A4BB00000000 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (18, N'Diamond Flower Tower ', 1, 1, N'Eurowindow MultiComplex là tổ hợp đa chức năng gồm: Văn phòng, căn hộ cao cấp do Công ty Cổ phần Đầu tư xây dựng và Phát triển công nghệ cao (Decotech) thuộc Eurowindow Holding làm chủ đầu tư. Dự án gồm 25 tầng nổi, 3 tầng hầm và 2 tầng kỹ thuật được xây dựng tại số 27, đường Trần Duy Hưng, phường Trung Hòa, quận Cầu Giấy, Hà Nội trên tổng diện tích khu đất 3.962 m2. Tổng diện tích mặt sàn là 60.804m2 và 10.674 m2 tầng hầm. ', 250000, 2, 6, 660, N'/img/office9.jpg,/img/office10.jpg,', NULL, N'333 Husky, Quận 1, HCM', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A4BB00000000 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (19, N'PVI Tower', 2, 1, N'Được phát triển bởi một tổng công ty hàng đầu là Bảo hiểm Dầu khí Việt Nam và hoàn thành từ 2013, PVI là tòa nhà văn phòng hạng A cao 25 tầng tọa lạc thuận lợi ở ngay trung tâm phía tây Hà Nội. 
Là trụ sở chính thức của Quỹ đầu tư PVI Holdings, tòa nhà được trang bị đầy đủ các thiết bị hiện đại, bao gồm không gian văn phòng rộng rãi, nhiều phòng họp đa chức năng, 1 phòng hội thảo lớn đạt chuẩn quốc tế, 7 phòng họp dịch vụ, 1 phòng tập hiện đại, quán cà-phê, nhà hàng và phòng lưu trữ máy chủ.
 PVI đã sẵn sàng phục vụ hoạt động thức thời của các khách thuê và hiện đã được Samsung, Sunlight Insurance, PVI, Seabank, Obayashi and Vinamob lựa chọn làm không gian văn phòng.
 Để đảm bảo uy tín của chủ đầu tư PVI Holdings, PVI đã được thiết kế và xây dựng theo tiêu chuẩn cao cấp nhất và sẽ là sự lựa chọn tuyệt vời cho những khách hàng đang có nhu cầu tìm kiếm cho mình một không gian văn phòng mới.', 5000000, 2, 9, 7500, N'/img/office11.jpg,/img/office12.jpg,', NULL, N'45A Đường Trần Thánh Tông, Cầu Giấy, Hà Nội', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A4C800000000 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (21, N'Indochina Plaza Hanoi', 2, 1, N'Indochina Plaza Hanoi (IPH) là một công trình phức hợp liên kết khối nhà ở, trung tâm thương mại,  với văn phòng theo phong cách thiết kế hiện đại.
Công trình bao gồm tòa nhà cao 11 tầng cung cấp  14,000 mét vuông  diện tích văn phòng hạng A nằm giữa hai tòa tháp căn hộ.
Hoàn thiện từ năm 2012, cho tới nay IPH là một trong những công trình phức hợp nổi bật nhất tại Hà Nội, hứa hẹn mang lại cho những cư dân tương lai một môi trường sống và làm việc đạt chuẩn quốc tế.', 200000, 4, 12, 860, N'/img/office13.jpg,/img/office14.jpg,', NULL, N'239 Xuân Thủy, Cầu Giấy, Hà Nội', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A4C800000000 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (22, N'Lotte Centre Hanoi', 1, 1, N'ọa lạc tại vị trí thuận lợi gần 2 con phố lớn Nguyễn Chí Thanh và Kim Mã, Lotte Centre Hanoi đóng vai trò như một điểm nối quan trọng giữa khu trung tâm và khu vực phía Tây Hà Nội, nơi có mật độ cao về phát triển dự án văn phòng, thương mại và nhà ở.
Được phát triển bởi tập đoàn Lotte - một trong 10 tổ chức hàng đầu châu Á, Lotte Centre Hanoi là một tổ hợp hạng sang gồm 65 tầng và 5 tầng hầm với chiều cao 267 mét và hệ thống cửa hàng cao cấp, khu Văn Phòng Cho Thuê hạng A, tầm nhìn quan sát đẹp nhất và vị trị chiến lược thuận lợi ngay sát khu trung tâm thương mại, siêu thị lớn và trung tâm văn hóa.', 330000, 4, 1, 1200, N'/img/office15.jpg,/img/office16.jpg,', NULL, N'546 Ba Đình, Hà Nội', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A4C800000000 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (23, N'Pacific Place', 1, 1, N'Sở hữu bởi chủ đầu tư Ever Fortune, Pacific Place được biết đến với kiến trúc hiện đại và vị trí tuyệt đẹp, nằm tại góc đường giao giữa Lý Thường Kiệt và Phan Bội Châu, là cầu nối giữa khu vực trung tâm Hoàn Kiếm và khu hành chính mới phía Tây Hà Nội. Trong nhiều năm qua, Pacific Place luôn là lựa chọn hàng đầu cho những khách thuê cao cấp tìm kiếm không gian thương mại chuyên nghiệp và hiện đại. Tòa nhà 18 tầng này cung cấp 16,000 m2 khu văn phòng hạng A cùng khu căn hộ cao cấp trongnội thành, với đầy đủ những tiện ích cần thiết.', 450000, 2, 13, 1500, N'/img/office17.jpg,/img/office18.jpg,', NULL, N'83B Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A4C800000000 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (24, N'Hồng Hà Centre', 2, 1, N'Nằm ở trung tâm thủ đô, Hong Ha Center rất gần với nhiều khách sạn năm sao nổi tiếng, cùng một chuỗi các tòa nhà văn phòng, nhà hàng, cửa hiệu cao cấp.
Hong Ha Center cao 15 tầng với 2 tầng hầm, cung cấp hơn 28.000 m2 văn phòng cho thuê. Diện tích chào thuê tối thiểu chỉ từ 100 m2. Đây là một vị trí lý tưởng cho các công ty, doanh nghiệp có nhu cầu tìm địa điểm văn phòng tọa lạc ở khu vực trung tâm với mức chi phí hợp lý.
Các khách thuê có thể chuyển vào làm việc ngay tại tòa nhà. Hiện nay, Công ty Văn phòng phẩm Hồng Hà, Tập đoàn Giấy Việt Nam, Zara, BHD, Elite Gym & Fitness Centre, Thuan An Company và Vietinbank đã lựa chọn nơi đây làm văn phòng của mình.', 550000, 2, 7, 770, N'/img/office19.jpg,/img/office20.jpg,', NULL, N'25 Lý Thường Kiệt, Hoàn Kiếm, Hà Nội', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A4C800000000 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (25, N'Asia Tower', 2, 1, N'Asia Tower là tòa văn phòng cao cấp 7 tầng với vị trí chiến lược ngay tại trung tâm thủ đô - trái tim của Hà Nội. Nằm ngay sát hồ Hoàn Kiếm trong khu vực trung tâm,  tòa nhà tọa lạc trên phố Nhà Thờ, nơi được biết đến là tụ điểm trung tâm ăn uống và mua sắm nổi tiếng cho cộng đồng du khách nước ngoài , đã tạo nên nét khác biệt của tòa nhà so với các công trình khác.
Asia Tower hiện thu hút một số lượng các khách thuê hàng đầu như: HSBC, Highlands Coffee, JPMorgan Chase Bank, Rolls Royce, Nokia, Nomura and AES.
Từ tháng 3/2014, Savills chào thuê một số vị trí văn phòng cao cấp tại Asia Tower.', 650000, 2, 3, 880, N'/img/office21.jpg,/img/office22.jpg,', NULL, N'6 Đường Nhà Thờ, Hoàn Kiếm, Hà Nội', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A4C800000000 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (26, N'Sentinel Place', 2, 1, N'Tọa lạc tại 41A phố Lý Thái Tổ, Sentinel Place là tòa nhà văn phòng cao cấp hạng A nằm trong khu trung tâm Hà Nội. Ngay sát các địa danh nổi tiếng như hồ Hoàn Kiếm, khách sạn Sofitel Metropole Hanoi và Ngân hàng Nhà nước Việt Nam, Sentinel Place sở hữu vị trí kết nối thuận tiện nhất tới các khu vực khác nhau trong thành phố. Bao gồm 9 tầng nổi và 3 tầng hầm, tòa nhà cung cấp cho khách thuê không gian văn phòng xấp xỉ 7,042 m2.
Kể từ khi hoàn thiện từ đầu năm 2010, cùng với một số các tòa nhà văn phòng khác trong khu vực trung tâm, Sentinel Place luôn được rất nhiều các khách hàng  tin tưởng chọn lựa bởi vị trí đẹp cùng thiết kế sang trọng. Các  khách hàng hiện đang lựa chọn Sentinel Place bao gồm:  Savills Việt Nam, Regus, Qatar Airlines, Đại sứ quán Argentina and Hogan Lovells.', 750000, 4, 6, 970, N'/img/office23.jpg,/img/office24.jpg,', NULL, N'41A Lý Thái Tổ, Hoàn Kiếm, Hà Nội', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A4C800000000 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (27, N'CornerStone', 2, 1, N'Nằm tại vị trí trung tâm Hà Nội, CornerStone là tòa nhà văn phòng hạng A được thiết kế chuyên nghiệp bởi hai công ty kiến trúc nổi tiếng thế giới  là Archipel (Pháp) và DWP (Úc). Tòa nhà không những được biết đến bởi vị trí kết nối thuận tiện đến các khu vực kinh doanh, cơ quan chính phủ, khu vực mua sắm và nhà hàng tại Hà Nội mà còn bởi thiết kế đặc biệt kết hợp phong cách thiết kế kiểu Pháp giàu tính nghệ thuật với cáctiện nghi hiện đại.
Được trang bị nội thất cao cấp hiện đại, thiết kế theo phong cách kiến trúc Pháp bán cổ điển, CornerStone là lựa chọn lí tưởng với những tổ chức lớn cần đến không gian văn phòng mở, đạt tiêu chuẩn quốc tế  tọa lạc tại các quận trung tâm nhưng vẫn đảm bảo sự yên tĩnh.', 850000, 4, 5, 555, N'/img/office25.jpg,/img/office26.jpg,', NULL, N'16 Phan Chu Trinh, Hoàn Kiếm, Hà Nội', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A4C800000000 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (28, N'Times City', 2, 1, N'Times City được đầu tư, xây dựng dựa trên ý tưởng về một khu đô thị hiện đại mang phong cách kiến trúc sinh thái thân thiện của Đảo Quốc Singapore.
Dự án là một tổ hợp bao gồm căn hộ cao cấp, trung tâm thương mại và văn phòng... mang lại không gian sống, làm việc và mua sắm - giải trí đẳng cấp.
Hệ thống văn phòng cho thuê của Times City trải rộng trên diện tích gần 15.000 m2, được đặt tại tầng đế các tòa nhà của dự án và đạt tiêu chuẩn quốc tế.', 550000, 4, 8, 880, N'/img/office27.jpg,/img/office28.jpg,', NULL, N'458 Minh Khai, Quận Hai Bà Trưng, Hà Nội', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A4C800000000 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (30, N'Citilight Tower', 1, 1, N'Citilight Tower nằm trên đường Võ Thị Sáu, gần công viên Lê Văn Tám. Citilight Tower cung cấp cho khách hàng một tầm nhìn xanh mát độc đáo. Chỉ mất 5 phút từ trung tâm quận 1, giữa các địa điểm nổi tiếng trong lòng thành phố.
Tòa nhà Citilight không chỉ mang lại các thông số đáng tự hào mà còn mang giá trị nhân văn sâu sắc trong mỗi mét vuông của tòa nhà, phục vụ nhu cầu tinh tế nhất để đáp ứng những mong muốn của các nhà đầu tư cho một tòa nhà văn phòng.', 450000, 2, 3, 450, N'/img/office29.jpg,/img/office30.jpg,', NULL, N'450 Minh Khai, Quận 1, TP. HCM', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A4C800000000 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (31, N'Continental', 1, 1, N'Continental là cao ốc văn phòng hạng B tọa lạc tại một vị trí trung tâm trên cả 2 mặt tiền đường Hàm Nghi và Pasteur, Quận 1, Thành Phố Hồ Chí Minh. Tòa nhà có diện cho thuê lên tới 13,000 m2 bao gồm 2 tầng hầm, 17 lầu và 1 bãi đáp trực thăng trên nóc. Từ tòa nhà có thể dễ dàng và nhanh chóng tới các khu trung tâm kinh doanh và tài chính của Thành phố.
Chúng tôi rất tự hào thông báo, Savills Việt Nam, một công ty tư vấn bất động sản có uy tín với hơn 30 năm kinh nghiệm trong việc quản lý bất động sản ở châu Á đã được chọn làm đơn vị quản lý chính thức của tòa nhà. Savills Vietnam luôn đảm bảo mang đến cho khách hàng một dịch vụ quản lý hiệu quả và chuyên nghiệp.', 350000, 4, 20, 2500, N'/img/office31.jpg,/img/office32.jpg,', NULL, N'120 Hàm Nghi, Quận 1, TP. HCM', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A4C800000000 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (32, N'Sailing Tower', 2, 1, N'Toà nhà Sailing Tower được thiết kế như là điểm nhấn cho thành phố Hồ chí Minh, với hình khối và vật liệu riêng biệt để tạo ra ngôn ngữ pha trộn cho các chức năng văn phòng và khu căn hộ cao cấp, hình thành giải pháp hài hoà tổng thể.
Với ý tưởng là mặt đứng cong nổi bật quay ra góc phố. Một mặt quay ra khoảng lùi rộng rãi dưới sân, mặt kia hình thành mặt đứng mang biểu tượng cánh buồm.', 650000, 2, 15, 1300, N'/img/office33.jpg,/img/office34.jpg,', NULL, N'765 Âu Cơ, Quận 1, TPHCM', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A4C800000000 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (39, N'Sun Wah Tower', 1, 1, N'Tòa nhà Sun Wah được thiết kế và giám sát bởi các kiến trúc sư từ Los Angeles thuộc tập đoàn Archeon International và xây dựng theo tiêu chuẩn quốc tế bởi nhà thầu tốt nhất Nhật Bản- Tổng công ty Shimizu. Tọa lạc ngay tại trung tâm thương mại quận 1.
Tòa nhà Sun Wah sở hữu một vị trí thuận tiện để cung cấp địa chỉ kinh doanh cơ bản, thu hút các văn phòng đại diện lân cận từ các công ty toàn cầu trong lĩnh vực tài chính và thị trường vốn, cũng như từ các khách sạn tốt nhất thế giới.', 450000, 2, 12, 1333, N'/img/office35.jpg,/img/office36.jpg,', NULL, N'115 Nguyễn Huệ, Quận 1, TP. HCM', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A2A600000000 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (40, N'Times Square', 1, 1, N'Sở hữu bởi chủ đầu tư tập đoàn Windsor, Times Square được biết đến với kiến trúc sang trọng và vị trí tuyệt đẹp, nằm tại 2 mặt đường Nguyễn Huệ và Đồng Khởi, là cầu nối đến khu vực tập trung của các khách sạn, nhà hàng và trung tâm mua sắm. Times Square luôn là sự lựa chọn hàng đầu cho những khách thuê cao cấp tìm kiếm không gian thương mại chuyên nghiệp và hiện đại.
Times Square là một dự án tích hợp không gian văn phòng với khách sạn và trung tâm bán lẻ, vừa đảm bảo tính kết nối vừa đảm bảo công năng sử dụng riêng của từng khu.', 1100000, 4, 12, 1400, N'/img/office37.jpg,/img/office38.jpg,', NULL, N'36 Đường Nguyễn Huệ, Quận 1, TP.HCM', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A4C800000000 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (43, N'Tòa nhà 3C Tôn Đức Thắng (Le Meridien)', 1, 1, N'Tọa lạc trên đường Tôn Đức Thắng, nằm ngay trung tâm của TPHCM và dọc theo sông Sài Gòn, Tòa nhà 3C (Le Meridien) cách trung tâm thương mại và giải trí của thành phố chỉ trong khoảng cách đi bộ và cách sân bay Tân Sơn Nhất 15 phút đi xe (khoảng 7km).
Tòa nhà 3C gồm có 22 tầng dành cho văn phòng và khách sạn.
Khách sạn 5 sao mới nhất tại thành phố HCM, sở hữu bởi tập đoàn Starwood bao gồm 6 tầng văn phòng nhìn về phía sông Sài Gòn.
Sàn cho thuê lớn và linh hoạt cho khách thuê lớn và nhỏ, mang lại cơ hội cho khách thuê đặt trụ sở tại tòa nhà với chất lượng cao trong khu phức hợp 5 sao và bảo đảm không gian mở nhìn về phía sông Sài gòn.', 800000, 2, 10, 1500, N'/img/office39.jpg,/img/office40.jpg,', NULL, N'500 Thành Thái, Quận 1, TPHCM', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A4C800000000 AS DateTime), NULL)
INSERT [dbo].[Office] ([Id], [Name], [CategoryId], [StatusId], [Description], [Price], [PriceTerm], [FloorNumber], [Area], [ImageUrls], [OtherDetail], [Address], [Latitude], [Longitude], [District], [City], [ParentOfficeId], [CreateDate], [ViewCount]) VALUES (47, N'Empress Tower', 2, 1, N'Savills Việt Nam đã được chỉ định là Đại lý Cho thuê Độc quyền tòa nhà Empress Tower tọa lạc tại 138 Hai Bà Trưng, Quận 1, TP.HCM. Empress Tower là tòa nhà Hạng B tại Quận 1 có thể cung cấp diện tích sàn trên 1.000 m2 theo tiêu chuẩn quốc tế.
Empress Tower có hơn 18.000 m2 diện tích văn phòng, bao gồm 17 tầng và hai tầng hầm với diện tích dành cho ngân hàng và khu cafe tại tầng trệt và tầng lửng.
Tòa nhà này có vị trí thuận tiện, cách sân bay Tân Sơn Nhất khoảng 4,8km bao gồm nhiều tiện ích lân cận như các nhà hàng, tiệm cà phê và đối diện là khách sạn Novotel. Nằm giữa hai tuyến đường lớn là Điện Biên Phủ và Nguyễn Thị Minh Khai, Empress Tower dễ dàng kết nối với những quận xung quanh nên rất thuận tiện cho nhân viên và cả khách hàng.', 900000, 4, 10, 1500, N'/img/office41.jpg,/img/office42.jpg,', NULL, N'138 Đường Hai Bà Trưng, Quận 1, TPHCM', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A41900000000 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Office] OFF
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
SET IDENTITY_INSERT [dbo].[OfficeStatus] ON 

INSERT [dbo].[OfficeStatus] ([Id], [Name], [Description]) VALUES (1, N'Available', N'Chưa đặt')
INSERT [dbo].[OfficeStatus] ([Id], [Name], [Description]) VALUES (2, N'Occupied', N'Đã đặt')
SET IDENTITY_INSERT [dbo].[OfficeStatus] OFF
SET IDENTITY_INSERT [dbo].[PaymentTerm] ON 

INSERT [dbo].[PaymentTerm] ([Id], [Name], [PaymentTime], [Description]) VALUES (1, N'1 month', 1, N'1 tháng')
INSERT [dbo].[PaymentTerm] ([Id], [Name], [PaymentTime], [Description]) VALUES (2, N'3 months', 3, N'3 tháng')
INSERT [dbo].[PaymentTerm] ([Id], [Name], [PaymentTime], [Description]) VALUES (3, N'6 months', 6, N'6 tháng')
SET IDENTITY_INSERT [dbo].[PaymentTerm] OFF
SET IDENTITY_INSERT [dbo].[PriceTerm] ON 

INSERT [dbo].[PriceTerm] ([Id], [Name], [Description]) VALUES (1, N'House', N'Nguyên căn')
INSERT [dbo].[PriceTerm] ([Id], [Name], [Description]) VALUES (2, N'Area', N'Trên m2')
INSERT [dbo].[PriceTerm] ([Id], [Name], [Description]) VALUES (3, N'Person', N'Trên người')
INSERT [dbo].[PriceTerm] ([Id], [Name], [Description]) VALUES (4, N'Call', N'Liên hệ')
SET IDENTITY_INSERT [dbo].[PriceTerm] OFF
INSERT [dbo].[Profile] ([Username], [Title], [FullName], [Company], [Phone], [Address], [Birthday]) VALUES (N'user1', N'Ông ', N'Nguyễn Văn A', NULL, N'01231231234', N'12 Hải Triều, Quận Bình Thạnh', CAST(0x0000806800000000 AS DateTime))
INSERT [dbo].[Profile] ([Username], [Title], [FullName], [Company], [Phone], [Address], [Birthday]) VALUES (N'userb', N'Bà  ', N'Lê Thị B', NULL, N'01235151511', N'Tại Gia', CAST(0x0000629200000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Rental] ON 

INSERT [dbo].[Rental] ([Id], [ContractId], [AssignStaff], [StatusId], [Description], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (1, 2, N'staff3', 1, N'ailweu iauwe tpiuaweptowapto', CAST(0x0000A43700000000 AS DateTime), NULL, CAST(0x0000A4C600000000 AS DateTime))
INSERT [dbo].[Rental] ([Id], [ContractId], [AssignStaff], [StatusId], [Description], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (2, 4, N'staff1', 2, N'ioiwapoaweitp awpeiotipwaoetp', CAST(0x0000A4AD00000000 AS DateTime), CAST(0x0000A4B70111EC93 AS DateTime), CAST(0x0000A4C600000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Rental] OFF
SET IDENTITY_INSERT [dbo].[RentalDetail] ON 

INSERT [dbo].[RentalDetail] ([Id], [RentalItemId], [RentalId], [UnitPrice], [Quantity]) VALUES (1, 1, 1, 1241, 1)
INSERT [dbo].[RentalDetail] ([Id], [RentalItemId], [RentalId], [UnitPrice], [Quantity]) VALUES (2, 2, 1, 124, 4)
INSERT [dbo].[RentalDetail] ([Id], [RentalItemId], [RentalId], [UnitPrice], [Quantity]) VALUES (3, 1, 2, 124, 2)
INSERT [dbo].[RentalDetail] ([Id], [RentalItemId], [RentalId], [UnitPrice], [Quantity]) VALUES (4, 2, 2, 123, 8)
SET IDENTITY_INSERT [dbo].[RentalDetail] OFF
SET IDENTITY_INSERT [dbo].[RentalItem] ON 

INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl]) VALUES (1, N'Bàn', N'Bàn làm việc 1*2 m', 100000, 100, NULL)
INSERT [dbo].[RentalItem] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl]) VALUES (2, N'Ghế', N'Ghế đơn văn phòng', 20000, 400, NULL)
SET IDENTITY_INSERT [dbo].[RentalItem] OFF
INSERT [dbo].[RentalStatus] ([Id], [Name], [Description]) VALUES (1, N'Requested', N'Chờ xử lí')
INSERT [dbo].[RentalStatus] ([Id], [Name], [Description]) VALUES (2, N'Assigned', N'Đã giao việc')
INSERT [dbo].[RentalStatus] ([Id], [Name], [Description]) VALUES (3, N'Done', N'Hoàn thành')
INSERT [dbo].[RentalStatus] ([Id], [Name], [Description]) VALUES (4, N'Canceled', N'Hủy')
INSERT [dbo].[RentalStatus] ([Id], [Name], [Description]) VALUES (5, N'Waiting Confirm', N'Chờ khách hàng xác nhận')
SET IDENTITY_INSERT [dbo].[Repair] ON 

INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (5, 2, N'staff1', N'jshgoahsoihia ioe', 3, CAST(0x0000A43500000000 AS DateTime), CAST(0x0000A4B800D28778 AS DateTime), CAST(0x0000A4C600000000 AS DateTime))
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (6, 4, NULL, N'oiauwoitu aowieut oiawue toia uwoetiuaowituaowiet', 5, CAST(0x0000A49000000000 AS DateTime), CAST(0x0000A4B800D2705C AS DateTime), NULL)
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (7, 4, N'staff2', N'oiawuetoiau wetiu', 2, CAST(0x0000A4AA00000000 AS DateTime), CAST(0x0000A4B7010B1DFE AS DateTime), NULL)
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (8, 5, N'staff1', N'sửa máy lạnh', 4, CAST(0x0000A4BA00C8A896 AS DateTime), CAST(0x0000A4C600BAE150 AS DateTime), CAST(0x0000A4C700000000 AS DateTime))
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (9, 5, N'staff1', N'124', 2, CAST(0x0000A4BA00CA5B6B AS DateTime), NULL, CAST(0x0000A4CB00000000 AS DateTime))
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (10, 5, N'staff2', N'sửa xe', 4, CAST(0x0000A4BA00CD5459 AS DateTime), CAST(0x0000A4C600D1DDE2 AS DateTime), NULL)
INSERT [dbo].[Repair] ([Id], [ContractId], [AssignedStaff], [Description], [RepairStatusId], [CreateTime], [UpdateTime], [AssignedTime]) VALUES (11, 6, N'staff3', N'sửa máy lạnh', 1, CAST(0x0000A4BA00D76333 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Repair] OFF
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
SET IDENTITY_INSERT [dbo].[RepairStatus] ON 

INSERT [dbo].[RepairStatus] ([Id], [Name], [Description]) VALUES (1, N'Requested', N'Chờ xử lí')
INSERT [dbo].[RepairStatus] ([Id], [Name], [Description]) VALUES (2, N'Assigned', N'Đã giao việc')
INSERT [dbo].[RepairStatus] ([Id], [Name], [Description]) VALUES (3, N'Done', N'Hoàn thành')
INSERT [dbo].[RepairStatus] ([Id], [Name], [Description]) VALUES (4, N'Canceled', N'Hủy')
INSERT [dbo].[RepairStatus] ([Id], [Name], [Description]) VALUES (5, N'Waiting Confirm', N'Chờ khách hàng xác nhận')
SET IDENTITY_INSERT [dbo].[RepairStatus] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (2, N'Manager')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (3, N'Staff')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (4, N'Customer')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Profile]    Script Date: 7/8/2015 11:28:51 AM ******/
CREATE NONCLUSTERED INDEX [IX_Profile] ON [dbo].[Profile]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Amenity] ADD  CONSTRAINT [DF_Amenity_HitCount]  DEFAULT ((0)) FOR [Weight]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_AccountStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[AccountStatus] ([Id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_AccountStatus]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Amenity]  WITH CHECK ADD  CONSTRAINT [FK_Amenity_AmenityGroup] FOREIGN KEY([AmenityGroupId])
REFERENCES [dbo].[AmenityGroup] ([Id])
GO
ALTER TABLE [dbo].[Amenity] CHECK CONSTRAINT [FK_Amenity_AmenityGroup]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Account] FOREIGN KEY([CustomerUsername])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Account]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Account1] FOREIGN KEY([AssignedStaff])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Account1]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_AppointmentStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[AppointmentStatus] ([Id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_AppointmentStatus]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Office] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Office] ([Id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Office]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Account] FOREIGN KEY([CustomerUsername])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Account]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_ContractStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ContractStatus] ([Id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_ContractStatus]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Office] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Office] ([Id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Office]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_PaymentTerm] FOREIGN KEY([PaymentTerm])
REFERENCES [dbo].[PaymentTerm] ([Id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_PaymentTerm]
GO
ALTER TABLE [dbo].[Office]  WITH CHECK ADD  CONSTRAINT [FK_Office_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Office] CHECK CONSTRAINT [FK_Office_Category]
GO
ALTER TABLE [dbo].[Office]  WITH CHECK ADD  CONSTRAINT [FK_Office_Office] FOREIGN KEY([ParentOfficeId])
REFERENCES [dbo].[Office] ([Id])
GO
ALTER TABLE [dbo].[Office] CHECK CONSTRAINT [FK_Office_Office]
GO
ALTER TABLE [dbo].[Office]  WITH CHECK ADD  CONSTRAINT [FK_Office_OfficeStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[OfficeStatus] ([Id])
GO
ALTER TABLE [dbo].[Office] CHECK CONSTRAINT [FK_Office_OfficeStatus]
GO
ALTER TABLE [dbo].[Office]  WITH CHECK ADD  CONSTRAINT [FK_Office_PriceTerm] FOREIGN KEY([PriceTerm])
REFERENCES [dbo].[PriceTerm] ([Id])
GO
ALTER TABLE [dbo].[Office] CHECK CONSTRAINT [FK_Office_PriceTerm]
GO
ALTER TABLE [dbo].[OfficeAmenity]  WITH CHECK ADD  CONSTRAINT [FK_OfficeAmenity_Amentity] FOREIGN KEY([AmenityId])
REFERENCES [dbo].[Amenity] ([Id])
GO
ALTER TABLE [dbo].[OfficeAmenity] CHECK CONSTRAINT [FK_OfficeAmenity_Amentity]
GO
ALTER TABLE [dbo].[OfficeAmenity]  WITH CHECK ADD  CONSTRAINT [FK_OfficeAmenity_Office] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Office] ([Id])
GO
ALTER TABLE [dbo].[OfficeAmenity] CHECK CONSTRAINT [FK_OfficeAmenity_Office]
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_Account]
GO
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_Account] FOREIGN KEY([AssignStaff])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_Account]
GO
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_Contract] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contract] ([Id])
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_Contract]
GO
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_RentalStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[RentalStatus] ([Id])
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_RentalStatus]
GO
ALTER TABLE [dbo].[RentalDetail]  WITH CHECK ADD  CONSTRAINT [FK_RentalDetail_Rental] FOREIGN KEY([RentalId])
REFERENCES [dbo].[Rental] ([Id])
GO
ALTER TABLE [dbo].[RentalDetail] CHECK CONSTRAINT [FK_RentalDetail_Rental]
GO
ALTER TABLE [dbo].[RentalDetail]  WITH CHECK ADD  CONSTRAINT [FK_RentalDetail_RentalItem] FOREIGN KEY([RentalItemId])
REFERENCES [dbo].[RentalItem] ([Id])
GO
ALTER TABLE [dbo].[RentalDetail] CHECK CONSTRAINT [FK_RentalDetail_RentalItem]
GO
ALTER TABLE [dbo].[Repair]  WITH CHECK ADD  CONSTRAINT [FK_Repair_Account] FOREIGN KEY([AssignedStaff])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Repair] CHECK CONSTRAINT [FK_Repair_Account]
GO
ALTER TABLE [dbo].[Repair]  WITH CHECK ADD  CONSTRAINT [FK_Repair_Contract] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contract] ([Id])
GO
ALTER TABLE [dbo].[Repair] CHECK CONSTRAINT [FK_Repair_Contract]
GO
ALTER TABLE [dbo].[Repair]  WITH CHECK ADD  CONSTRAINT [FK_Repair_RepairStatus] FOREIGN KEY([RepairStatusId])
REFERENCES [dbo].[RepairStatus] ([Id])
GO
ALTER TABLE [dbo].[Repair] CHECK CONSTRAINT [FK_Repair_RepairStatus]
GO
ALTER TABLE [dbo].[RepairDetail]  WITH CHECK ADD  CONSTRAINT [FK_RepairDetail_Amenity] FOREIGN KEY([AmenityId])
REFERENCES [dbo].[Amenity] ([Id])
GO
ALTER TABLE [dbo].[RepairDetail] CHECK CONSTRAINT [FK_RepairDetail_Amenity]
GO
ALTER TABLE [dbo].[RepairDetail]  WITH CHECK ADD  CONSTRAINT [FK_RepairDetail_Repair] FOREIGN KEY([RepairId])
REFERENCES [dbo].[Repair] ([Id])
GO
ALTER TABLE [dbo].[RepairDetail] CHECK CONSTRAINT [FK_RepairDetail_Repair]
GO
ALTER TABLE [dbo].[RequestAmenity]  WITH CHECK ADD  CONSTRAINT [FK_RequestAmentity_Amentity] FOREIGN KEY([AmenityId])
REFERENCES [dbo].[Amenity] ([Id])
GO
ALTER TABLE [dbo].[RequestAmenity] CHECK CONSTRAINT [FK_RequestAmentity_Amentity]
GO
ALTER TABLE [dbo].[RequestAmenity]  WITH CHECK ADD  CONSTRAINT [FK_RequestAmentity_RequestOffice] FOREIGN KEY([RequestOfficeId])
REFERENCES [dbo].[RequestOffice] ([Id])
GO
ALTER TABLE [dbo].[RequestAmenity] CHECK CONSTRAINT [FK_RequestAmentity_RequestOffice]
GO
ALTER TABLE [dbo].[RequestOffice]  WITH CHECK ADD  CONSTRAINT [FK_RequestOffice_Account] FOREIGN KEY([CustomerUsername])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[RequestOffice] CHECK CONSTRAINT [FK_RequestOffice_Account]
GO
ALTER TABLE [dbo].[RequestOffice]  WITH CHECK ADD  CONSTRAINT [FK_RequestOffice_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[RequestOffice] CHECK CONSTRAINT [FK_RequestOffice_Category]
GO
USE [master]
GO
ALTER DATABASE [ors] SET  READ_WRITE 
GO
