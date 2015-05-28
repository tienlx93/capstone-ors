USE [master]
GO
/****** Object:  Database [ors]    Script Date: 05/28/2015 20:30:13 ******/
CREATE DATABASE [ors] ON  PRIMARY 
( NAME = N'ors', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\ors.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
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
/****** Object:  Table [dbo].[PriceTerm]    Script Date: 05/28/2015 20:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceTerm](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_PriceTerm] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentTerm]    Script Date: 05/28/2015 20:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentTerm](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PaymentTime] [int] NOT NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_PaymentTerm] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfficeStatus]    Script Date: 05/28/2015 20:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfficeStatus](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_OfficeStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 05/28/2015 20:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (2, N'Manager')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (3, N'Staff')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (4, N'Customer')
/****** Object:  Table [dbo].[Category]    Script Date: 05/28/2015 20:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Amenity]    Script Date: 05/28/2015 20:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amenity](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_Amentity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 05/28/2015 20:30:15 ******/
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
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId]) VALUES (N'admin', N'123', N'admin@ors', 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId]) VALUES (N'manager1', N'123', N'manager@ors', 2)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleId]) VALUES (N'tiếng việt', N'123', N'assd', 4)
/****** Object:  Table [dbo].[Profile]    Script Date: 05/28/2015 20:30:15 ******/
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
/****** Object:  Table [dbo].[RequestOffice]    Script Date: 05/28/2015 20:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestOffice](
	[Id] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Office]    Script Date: 05/28/2015 20:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Office](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ManagerAccount] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[Description] [ntext] NOT NULL,
	[Price] [bigint] NULL,
	[PriceTerm] [int] NOT NULL,
	[FloorNumber] [int] NOT NULL,
	[Area] [float] NOT NULL,
	[ImageUrls] [text] NOT NULL,
	[OtherDetail] [ntext] NULL,
	[Address] [nvarchar](150) NOT NULL,
	[Latitute] [float] NULL,
	[Longtitute] [float] NULL,
	[District] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[ParrentOfficeId] [int] NULL,
 CONSTRAINT [PK_Office] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 05/28/2015 20:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[Id] [int] NOT NULL,
	[CustomerUsername] [nvarchar](50) NOT NULL,
	[OfficeId] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[PaymentFee] [int] NOT NULL,
	[PaymentTerm] [int] NOT NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 05/28/2015 20:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[Id] [int] NOT NULL,
	[CustomerUsername] [nvarchar](50) NOT NULL,
	[AssignedStaff] [nvarchar](50) NULL,
	[OfficeId] [int] NOT NULL,
	[Time] [datetime] NOT NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfficeAmenity]    Script Date: 05/28/2015 20:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfficeAmenity](
	[Id] [int] NOT NULL,
	[OfficeId] [int] NOT NULL,
	[AmenityId] [int] NOT NULL,
 CONSTRAINT [PK_OfficeAmenity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestAmenity]    Script Date: 05/28/2015 20:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestAmenity](
	[Id] [int] NOT NULL,
	[RequestOfficeId] [int] NOT NULL,
	[AmenityId] [int] NOT NULL,
 CONSTRAINT [PK_RequestAmentity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Repair]    Script Date: 05/28/2015 20:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Repair](
	[Id] [int] NOT NULL,
	[ContractId] [int] NOT NULL,
	[AssignedStaff] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Description] [ntext] NOT NULL,
 CONSTRAINT [PK_Repair] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Account_Role]    Script Date: 05/28/2015 20:30:15 ******/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
/****** Object:  ForeignKey [FK_Profile_Account]    Script Date: 05/28/2015 20:30:15 ******/
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_Account]
GO
/****** Object:  ForeignKey [FK_RequestOffice_Account]    Script Date: 05/28/2015 20:30:15 ******/
ALTER TABLE [dbo].[RequestOffice]  WITH CHECK ADD  CONSTRAINT [FK_RequestOffice_Account] FOREIGN KEY([CustomerUsername])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[RequestOffice] CHECK CONSTRAINT [FK_RequestOffice_Account]
GO
/****** Object:  ForeignKey [FK_RequestOffice_Category]    Script Date: 05/28/2015 20:30:15 ******/
ALTER TABLE [dbo].[RequestOffice]  WITH CHECK ADD  CONSTRAINT [FK_RequestOffice_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[RequestOffice] CHECK CONSTRAINT [FK_RequestOffice_Category]
GO
/****** Object:  ForeignKey [FK_Office_Account]    Script Date: 05/28/2015 20:30:15 ******/
ALTER TABLE [dbo].[Office]  WITH CHECK ADD  CONSTRAINT [FK_Office_Account] FOREIGN KEY([ManagerAccount])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Office] CHECK CONSTRAINT [FK_Office_Account]
GO
/****** Object:  ForeignKey [FK_Office_Category]    Script Date: 05/28/2015 20:30:15 ******/
ALTER TABLE [dbo].[Office]  WITH CHECK ADD  CONSTRAINT [FK_Office_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Office] CHECK CONSTRAINT [FK_Office_Category]
GO
/****** Object:  ForeignKey [FK_Office_Office]    Script Date: 05/28/2015 20:30:15 ******/
ALTER TABLE [dbo].[Office]  WITH CHECK ADD  CONSTRAINT [FK_Office_Office] FOREIGN KEY([ParrentOfficeId])
REFERENCES [dbo].[Office] ([Id])
GO
ALTER TABLE [dbo].[Office] CHECK CONSTRAINT [FK_Office_Office]
GO
/****** Object:  ForeignKey [FK_Office_OfficeStatus]    Script Date: 05/28/2015 20:30:15 ******/
ALTER TABLE [dbo].[Office]  WITH CHECK ADD  CONSTRAINT [FK_Office_OfficeStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[OfficeStatus] ([Id])
GO
ALTER TABLE [dbo].[Office] CHECK CONSTRAINT [FK_Office_OfficeStatus]
GO
/****** Object:  ForeignKey [FK_Office_PriceTerm]    Script Date: 05/28/2015 20:30:15 ******/
ALTER TABLE [dbo].[Office]  WITH CHECK ADD  CONSTRAINT [FK_Office_PriceTerm] FOREIGN KEY([PriceTerm])
REFERENCES [dbo].[PriceTerm] ([Id])
GO
ALTER TABLE [dbo].[Office] CHECK CONSTRAINT [FK_Office_PriceTerm]
GO
/****** Object:  ForeignKey [FK_Contract_Account]    Script Date: 05/28/2015 20:30:15 ******/
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Account] FOREIGN KEY([CustomerUsername])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Account]
GO
/****** Object:  ForeignKey [FK_Contract_Office]    Script Date: 05/28/2015 20:30:15 ******/
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Office] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Office] ([Id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Office]
GO
/****** Object:  ForeignKey [FK_Contract_PaymentTerm]    Script Date: 05/28/2015 20:30:15 ******/
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_PaymentTerm] FOREIGN KEY([PaymentTerm])
REFERENCES [dbo].[PaymentTerm] ([Id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_PaymentTerm]
GO
/****** Object:  ForeignKey [FK_Appointment_Account]    Script Date: 05/28/2015 20:30:15 ******/
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Account] FOREIGN KEY([CustomerUsername])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Account]
GO
/****** Object:  ForeignKey [FK_Appointment_Account1]    Script Date: 05/28/2015 20:30:15 ******/
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Account1] FOREIGN KEY([AssignedStaff])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Account1]
GO
/****** Object:  ForeignKey [FK_Appointment_Office]    Script Date: 05/28/2015 20:30:15 ******/
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Office] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Office] ([Id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Office]
GO
/****** Object:  ForeignKey [FK_OfficeAmenity_Amentity]    Script Date: 05/28/2015 20:30:15 ******/
ALTER TABLE [dbo].[OfficeAmenity]  WITH CHECK ADD  CONSTRAINT [FK_OfficeAmenity_Amentity] FOREIGN KEY([AmenityId])
REFERENCES [dbo].[Amenity] ([Id])
GO
ALTER TABLE [dbo].[OfficeAmenity] CHECK CONSTRAINT [FK_OfficeAmenity_Amentity]
GO
/****** Object:  ForeignKey [FK_OfficeAmenity_Office]    Script Date: 05/28/2015 20:30:15 ******/
ALTER TABLE [dbo].[OfficeAmenity]  WITH CHECK ADD  CONSTRAINT [FK_OfficeAmenity_Office] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Office] ([Id])
GO
ALTER TABLE [dbo].[OfficeAmenity] CHECK CONSTRAINT [FK_OfficeAmenity_Office]
GO
/****** Object:  ForeignKey [FK_RequestAmentity_Amentity]    Script Date: 05/28/2015 20:30:15 ******/
ALTER TABLE [dbo].[RequestAmenity]  WITH CHECK ADD  CONSTRAINT [FK_RequestAmentity_Amentity] FOREIGN KEY([AmenityId])
REFERENCES [dbo].[Amenity] ([Id])
GO
ALTER TABLE [dbo].[RequestAmenity] CHECK CONSTRAINT [FK_RequestAmentity_Amentity]
GO
/****** Object:  ForeignKey [FK_RequestAmentity_RequestOffice]    Script Date: 05/28/2015 20:30:15 ******/
ALTER TABLE [dbo].[RequestAmenity]  WITH CHECK ADD  CONSTRAINT [FK_RequestAmentity_RequestOffice] FOREIGN KEY([RequestOfficeId])
REFERENCES [dbo].[RequestOffice] ([Id])
GO
ALTER TABLE [dbo].[RequestAmenity] CHECK CONSTRAINT [FK_RequestAmentity_RequestOffice]
GO
/****** Object:  ForeignKey [FK_Repair_Account]    Script Date: 05/28/2015 20:30:15 ******/
ALTER TABLE [dbo].[Repair]  WITH CHECK ADD  CONSTRAINT [FK_Repair_Account] FOREIGN KEY([AssignedStaff])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Repair] CHECK CONSTRAINT [FK_Repair_Account]
GO
/****** Object:  ForeignKey [FK_Repair_Contract]    Script Date: 05/28/2015 20:30:15 ******/
ALTER TABLE [dbo].[Repair]  WITH CHECK ADD  CONSTRAINT [FK_Repair_Contract] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contract] ([Id])
GO
ALTER TABLE [dbo].[Repair] CHECK CONSTRAINT [FK_Repair_Contract]
GO
