USE [master]
GO
/****** Object:  Database [CakeApp]    Script Date: 10/7/2015 11:59:12 AM ******/
CREATE DATABASE [CakeApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CakeApp', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CakeApp.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CakeApp_log', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CakeApp_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CakeApp] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CakeApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CakeApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CakeApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CakeApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CakeApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CakeApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [CakeApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CakeApp] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CakeApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CakeApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CakeApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CakeApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CakeApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CakeApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CakeApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CakeApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CakeApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CakeApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CakeApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CakeApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CakeApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CakeApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CakeApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CakeApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CakeApp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CakeApp] SET  MULTI_USER 
GO
ALTER DATABASE [CakeApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CakeApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CakeApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CakeApp] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CakeApp]
GO
/****** Object:  StoredProcedure [dbo].[InsertCategory]    Script Date: 10/7/2015 11:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCategory] (@categoryname nvarchar(max),
@title nvarchar(max),
@tagid bigint,
@image nvarchar(max),
@priority int,
@status bit,
@addedby bigint)
AS
BEGIN
Insert into [dbo].[CakeApp_Categories] values(@categoryname, @title,@tagid,@image,@priority,@status,@addedby)
END






GO
/****** Object:  StoredProcedure [dbo].[Selectcategory]    Script Date: 10/7/2015 11:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Selectcategory]

AS
BEGIN
	select * from [dbo].[CakeApp_Categories]
END





GO
/****** Object:  StoredProcedure [dbo].[SelectcategoryByID]    Script Date: 10/7/2015 11:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectcategoryByID] @CategoryID bigint
AS
BEGIN
	select * from [dbo].[CakeApp_Categories] where CategoryID = @CategoryID
END






GO
/****** Object:  StoredProcedure [dbo].[UpdateCategory]    Script Date: 10/7/2015 11:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCategory] (@categotyid bigint,@title nvarchar(max))
AS
BEGIN
update [dbo].[CakeApp_Categories] set Title=@title where CategoryID= @categotyid
END






GO
/****** Object:  Table [dbo].[CakeApp_Categories]    Script Date: 10/7/2015 11:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CakeApp_Categories](
	[CategoryID] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryImageID] [bigint] NULL,
	[CategoryName] [nvarchar](max) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[TagID] [bigint] NULL,
	[Priority] [int] NULL,
	[Status] [bit] NOT NULL,
	[AddedBy] [bigint] NULL,
	[CategoryImageName] [nvarchar](max) NULL,
 CONSTRAINT [PK_CakeApp_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CakeApp_CategoryImages]    Script Date: 10/7/2015 11:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CakeApp_CategoryImages](
	[CategoryImageID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[ImageName] [nvarchar](max) NULL,
	[ImageAlt] [nvarchar](max) NULL,
	[Priority] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_CakeApp_CategoryImages] PRIMARY KEY CLUSTERED 
(
	[CategoryImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CakeApp_FTPSettings]    Script Date: 10/7/2015 11:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CakeApp_FTPSettings](
	[FTPSettingsID] [bigint] IDENTITY(1,1) NOT NULL,
	[HostName] [nvarchar](500) NOT NULL,
	[FTPPassword] [nvarchar](500) NOT NULL,
	[FolderName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_CakeApp_FTPSettings] PRIMARY KEY CLUSTERED 
(
	[FTPSettingsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CakeApp_Groups]    Script Date: 10/7/2015 11:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CakeApp_Groups](
	[GroupID] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](max) NULL,
	[Title] [nvarchar](128) NULL,
 CONSTRAINT [PK_CakeApp] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CakeApp_Info]    Script Date: 10/7/2015 11:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CakeApp_Info](
	[InfoID] [bigint] IDENTITY(1,1) NOT NULL,
	[InfoName] [nvarchar](128) NULL,
	[Title] [nvarchar](128) NULL,
	[Priority] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_CakeApp_AdditionalInfo] PRIMARY KEY CLUSTERED 
(
	[InfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CakeApp_InfoGroup]    Script Date: 10/7/2015 11:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CakeApp_InfoGroup](
	[InfoGroupID] [bigint] IDENTITY(1,1) NOT NULL,
	[InfoID] [bigint] NULL,
	[GroupID] [bigint] NULL,
 CONSTRAINT [PK_CakeApp_InfoGroup] PRIMARY KEY CLUSTERED 
(
	[InfoGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CakeApp_ProductCategories]    Script Date: 10/7/2015 11:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CakeApp_ProductCategories](
	[ProductCategoryID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NULL,
	[CategoryID] [bigint] NULL,
 CONSTRAINT [PK_CakeApp_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CakeApp_ProductImages]    Script Date: 10/7/2015 11:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CakeApp_ProductImages](
	[ProductImageID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NULL,
	[ImageName] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[ImageAlt] [nvarchar](max) NULL,
	[Priority] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_CakeApp_ProductImages] PRIMARY KEY CLUSTERED 
(
	[ProductImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CakeApp_ProductInfo]    Script Date: 10/7/2015 11:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CakeApp_ProductInfo](
	[ProductInfoID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NULL,
	[InfoID] [bigint] NULL,
 CONSTRAINT [PK_CakeApp_ProductInfo] PRIMARY KEY CLUSTERED 
(
	[ProductInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CakeApp_ProductLog]    Script Date: 10/7/2015 11:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CakeApp_ProductLog](
	[ProductLogID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NULL,
	[IsAdded] [bit] NULL,
	[IsUpdated] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[DateOfModification] [datetime] NULL,
 CONSTRAINT [PK_CakeApp_ProductLog] PRIMARY KEY CLUSTERED 
(
	[ProductLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CakeApp_ProductPrice]    Script Date: 10/7/2015 11:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CakeApp_ProductPrice](
	[ProductPriceID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NULL,
	[GroupID] [bigint] NULL,
	[InfoIDs] [nvarchar](50) NULL,
	[SizeID] [bigint] NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_CakeApp_ProductPrice] PRIMARY KEY CLUSTERED 
(
	[ProductPriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CakeApp_Products]    Script Date: 10/7/2015 11:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CakeApp_Products](
	[ProductID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](128) NOT NULL,
	[Title] [nvarchar](128) NOT NULL,
	[TagID] [bigint] NULL,
	[Priority] [int] NOT NULL,
	[GroupID] [bigint] NULL,
	[Price] [decimal](18, 0) NULL,
	[AdditionalInfo] [nvarchar](max) NULL,
	[Instructions] [nvarchar](max) NULL,
	[AddedBy] [bigint] NULL,
	[Status] [bit] NOT NULL,
	[statusAdditionalInfo] [bit] NULL,
	[statusInstructions] [bit] NULL,
	[ProductImageName] [nvarchar](max) NULL,
 CONSTRAINT [PK_CakeApp_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CakeApp_ProductSizes]    Script Date: 10/7/2015 11:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CakeApp_ProductSizes](
	[ProductSizeID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NULL,
	[SizeID] [bigint] NULL,
 CONSTRAINT [PK_CakeApp_ProductSize] PRIMARY KEY CLUSTERED 
(
	[ProductSizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CakeApp_Roles]    Script Date: 10/7/2015 11:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CakeApp_Roles](
	[RoleID] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_CakeApp_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CakeApp_Screensavers]    Script Date: 10/7/2015 11:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CakeApp_Screensavers](
	[ScreensaverID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Priority] [int] NULL,
	[Status] [bit] NOT NULL,
	[Video] [nvarchar](max) NULL,
 CONSTRAINT [PK_CakeApp_Screensaver] PRIMARY KEY CLUSTERED 
(
	[ScreensaverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CakeApp_SizeGroup]    Script Date: 10/7/2015 11:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CakeApp_SizeGroup](
	[SizeGroupID] [bigint] IDENTITY(1,1) NOT NULL,
	[SizeID] [bigint] NULL,
	[GroupID] [bigint] NULL,
 CONSTRAINT [PK_CakeApp_SizeGroup] PRIMARY KEY CLUSTERED 
(
	[SizeGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CakeApp_Sizes]    Script Date: 10/7/2015 11:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CakeApp_Sizes](
	[SizeID] [bigint] IDENTITY(1,1) NOT NULL,
	[Size] [nvarchar](128) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[Price] [nvarchar](128) NULL,
	[Priority] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_CakeApp_Sizes] PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CakeApp_SyncProcess]    Script Date: 10/7/2015 11:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CakeApp_SyncProcess](
	[SyncProcessID] [bigint] IDENTITY(1,1) NOT NULL,
	[SyncID] [bigint] NULL,
	[ProductID] [bigint] NULL,
	[SyncStatus] [int] NULL,
 CONSTRAINT [PK_CakeApp_SyncProcess] PRIMARY KEY CLUSTERED 
(
	[SyncProcessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CakeApp_SyncSchedule]    Script Date: 10/7/2015 11:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CakeApp_SyncSchedule](
	[SyncID] [bigint] IDENTITY(1,1) NOT NULL,
	[SyncName] [nvarchar](128) NULL,
	[Date] [datetime] NULL,
	[Time] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_CakeApp_SyncSchedule] PRIMARY KEY CLUSTERED 
(
	[SyncID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CakeApp_Tags]    Script Date: 10/7/2015 11:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CakeApp_Tags](
	[TagID] [bigint] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](128) NOT NULL,
	[Title] [nvarchar](128) NULL,
 CONSTRAINT [PK_CakeApp_Tags] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CakeApp_Users]    Script Date: 10/7/2015 11:59:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CakeApp_Users](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](250) NULL,
	[Password] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
	[RoleID] [bigint] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_CakeApp_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CakeApp_Categories] ON 

INSERT [dbo].[CakeApp_Categories] ([CategoryID], [CategoryImageID], [CategoryName], [Title], [TagID], [Priority], [Status], [AddedBy], [CategoryImageName]) VALUES (10009, 1, N'Pam Cake', N'Pam Cake Title', 1, 10, 1, 2, NULL)
INSERT [dbo].[CakeApp_Categories] ([CategoryID], [CategoryImageID], [CategoryName], [Title], [TagID], [Priority], [Status], [AddedBy], [CategoryImageName]) VALUES (10010, 2, N'Fruit Cake', N'Fruit Cake Title', 4, 30, 1, 2, NULL)
INSERT [dbo].[CakeApp_Categories] ([CategoryID], [CategoryImageID], [CategoryName], [Title], [TagID], [Priority], [Status], [AddedBy], [CategoryImageName]) VALUES (10012, 3, N'Cream Cake', N'Cream Cake Title', 1, 30, 1, 2, NULL)
INSERT [dbo].[CakeApp_Categories] ([CategoryID], [CategoryImageID], [CategoryName], [Title], [TagID], [Priority], [Status], [AddedBy], [CategoryImageName]) VALUES (10013, 8, N'Carrot Cake', N'Carrot Cake Title', 6, 20, 1, 2, NULL)
INSERT [dbo].[CakeApp_Categories] ([CategoryID], [CategoryImageID], [CategoryName], [Title], [TagID], [Priority], [Status], [AddedBy], [CategoryImageName]) VALUES (10014, 10011, N'BirthDay Cake', N'BirthDay Cake', 4, 40, 1, 2, NULL)
INSERT [dbo].[CakeApp_Categories] ([CategoryID], [CategoryImageID], [CategoryName], [Title], [TagID], [Priority], [Status], [AddedBy], [CategoryImageName]) VALUES (10015, 10011, N'Cake Category1', N'CakeCategory1', 1, 50, 1, 2, NULL)
INSERT [dbo].[CakeApp_Categories] ([CategoryID], [CategoryImageID], [CategoryName], [Title], [TagID], [Priority], [Status], [AddedBy], [CategoryImageName]) VALUES (10016, 3, N'Category2', N'Category2', 4, 60, 1, 2, NULL)
INSERT [dbo].[CakeApp_Categories] ([CategoryID], [CategoryImageID], [CategoryName], [Title], [TagID], [Priority], [Status], [AddedBy], [CategoryImageName]) VALUES (10018, NULL, N'Category4', N'Category4', 6, 82, 1, 2, N'20150930_125116.jpg')
INSERT [dbo].[CakeApp_Categories] ([CategoryID], [CategoryImageID], [CategoryName], [Title], [TagID], [Priority], [Status], [AddedBy], [CategoryImageName]) VALUES (10020, NULL, N'Category5', N'Category56', 4, 90, 0, 2, NULL)
INSERT [dbo].[CakeApp_Categories] ([CategoryID], [CategoryImageID], [CategoryName], [Title], [TagID], [Priority], [Status], [AddedBy], [CategoryImageName]) VALUES (10021, NULL, N'Category6', N'Category6', 4, 92, 1, 2, NULL)
SET IDENTITY_INSERT [dbo].[CakeApp_Categories] OFF
SET IDENTITY_INSERT [dbo].[CakeApp_CategoryImages] ON 

INSERT [dbo].[CakeApp_CategoryImages] ([CategoryImageID], [Title], [ImageName], [ImageAlt], [Priority], [Status]) VALUES (1, N'Pam cake  ', N'pamcakes.jpg', N'Pam cake', 10, 1)
INSERT [dbo].[CakeApp_CategoryImages] ([CategoryImageID], [Title], [ImageName], [ImageAlt], [Priority], [Status]) VALUES (2, N'Fruit Cake', N'fruitcake.jpg', N'Fruit Cake', 20, 1)
INSERT [dbo].[CakeApp_CategoryImages] ([CategoryImageID], [Title], [ImageName], [ImageAlt], [Priority], [Status]) VALUES (3, N'Cream Cake', N'creamcake.jpg', N'Cream Cake', 22, 1)
INSERT [dbo].[CakeApp_CategoryImages] ([CategoryImageID], [Title], [ImageName], [ImageAlt], [Priority], [Status]) VALUES (8, N'Carrot Cake', N'carrotcake.jpg', N'Carrot Cake', 40, 1)
INSERT [dbo].[CakeApp_CategoryImages] ([CategoryImageID], [Title], [ImageName], [ImageAlt], [Priority], [Status]) VALUES (10009, N'FruitCake', N'fruitcake.jpg', N'Alt', 50, 1)
INSERT [dbo].[CakeApp_CategoryImages] ([CategoryImageID], [Title], [ImageName], [ImageAlt], [Priority], [Status]) VALUES (10010, N'Carrot Cake1', N'carrotcake1.jpg', N'Alt', 60, 1)
INSERT [dbo].[CakeApp_CategoryImages] ([CategoryImageID], [Title], [ImageName], [ImageAlt], [Priority], [Status]) VALUES (10011, N'Capsicum Cake', N'capsicumcake.jpg', N'alt', 70, 1)
SET IDENTITY_INSERT [dbo].[CakeApp_CategoryImages] OFF
SET IDENTITY_INSERT [dbo].[CakeApp_FTPSettings] ON 

INSERT [dbo].[CakeApp_FTPSettings] ([FTPSettingsID], [HostName], [FTPPassword], [FolderName]) VALUES (1, N'test', N'324234', N'aaa')
SET IDENTITY_INSERT [dbo].[CakeApp_FTPSettings] OFF
SET IDENTITY_INSERT [dbo].[CakeApp_Groups] ON 

INSERT [dbo].[CakeApp_Groups] ([GroupID], [GroupName], [Title]) VALUES (1, N'Group1', N'Group1Title')
INSERT [dbo].[CakeApp_Groups] ([GroupID], [GroupName], [Title]) VALUES (2, N'Group2', N'Group1Title')
INSERT [dbo].[CakeApp_Groups] ([GroupID], [GroupName], [Title]) VALUES (5, N'Group3', N'Group3 Title')
SET IDENTITY_INSERT [dbo].[CakeApp_Groups] OFF
SET IDENTITY_INSERT [dbo].[CakeApp_Info] ON 

INSERT [dbo].[CakeApp_Info] ([InfoID], [InfoName], [Title], [Priority], [Status]) VALUES (1, N'Fresh Cream', N'Fresh Cream', 10, 1)
INSERT [dbo].[CakeApp_Info] ([InfoID], [InfoName], [Title], [Priority], [Status]) VALUES (2, N'Butter Cream', N'Butter Cream', 20, 1)
INSERT [dbo].[CakeApp_Info] ([InfoID], [InfoName], [Title], [Priority], [Status]) VALUES (3, N'Icing', N'Icing', 15, 1)
INSERT [dbo].[CakeApp_Info] ([InfoID], [InfoName], [Title], [Priority], [Status]) VALUES (4, N'Chocolate1', N'Chocolate', 40, 1)
INSERT [dbo].[CakeApp_Info] ([InfoID], [InfoName], [Title], [Priority], [Status]) VALUES (7, N'info3', N'Info3', 50, 1)
INSERT [dbo].[CakeApp_Info] ([InfoID], [InfoName], [Title], [Priority], [Status]) VALUES (9, N'Info10', N'Info10 Title', 60, 1)
INSERT [dbo].[CakeApp_Info] ([InfoID], [InfoName], [Title], [Priority], [Status]) VALUES (10, N'Info11', N'Info11 Title', 70, 0)
INSERT [dbo].[CakeApp_Info] ([InfoID], [InfoName], [Title], [Priority], [Status]) VALUES (11, N'info4', N'info4', 80, 1)
INSERT [dbo].[CakeApp_Info] ([InfoID], [InfoName], [Title], [Priority], [Status]) VALUES (12, N'Info22', N'Info22', 90, 0)
SET IDENTITY_INSERT [dbo].[CakeApp_Info] OFF
SET IDENTITY_INSERT [dbo].[CakeApp_InfoGroup] ON 

INSERT [dbo].[CakeApp_InfoGroup] ([InfoGroupID], [InfoID], [GroupID]) VALUES (1, 1, 1)
INSERT [dbo].[CakeApp_InfoGroup] ([InfoGroupID], [InfoID], [GroupID]) VALUES (21, 2, 2)
INSERT [dbo].[CakeApp_InfoGroup] ([InfoGroupID], [InfoID], [GroupID]) VALUES (64, 4, 2)
INSERT [dbo].[CakeApp_InfoGroup] ([InfoGroupID], [InfoID], [GroupID]) VALUES (76, 7, 1)
INSERT [dbo].[CakeApp_InfoGroup] ([InfoGroupID], [InfoID], [GroupID]) VALUES (77, 7, 5)
INSERT [dbo].[CakeApp_InfoGroup] ([InfoGroupID], [InfoID], [GroupID]) VALUES (78, 7, 2)
INSERT [dbo].[CakeApp_InfoGroup] ([InfoGroupID], [InfoID], [GroupID]) VALUES (85, 9, 1)
INSERT [dbo].[CakeApp_InfoGroup] ([InfoGroupID], [InfoID], [GroupID]) VALUES (86, 9, 5)
INSERT [dbo].[CakeApp_InfoGroup] ([InfoGroupID], [InfoID], [GroupID]) VALUES (92, 10, 2)
INSERT [dbo].[CakeApp_InfoGroup] ([InfoGroupID], [InfoID], [GroupID]) VALUES (93, 10, 5)
INSERT [dbo].[CakeApp_InfoGroup] ([InfoGroupID], [InfoID], [GroupID]) VALUES (94, 3, 5)
INSERT [dbo].[CakeApp_InfoGroup] ([InfoGroupID], [InfoID], [GroupID]) VALUES (98, 11, 5)
INSERT [dbo].[CakeApp_InfoGroup] ([InfoGroupID], [InfoID], [GroupID]) VALUES (101, 12, 1)
SET IDENTITY_INSERT [dbo].[CakeApp_InfoGroup] OFF
SET IDENTITY_INSERT [dbo].[CakeApp_ProductCategories] ON 

INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (1, 1, 10010)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (2, 1, 10012)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (6, 2, 10010)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (7, 2, 10012)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10008, 7, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10009, 8, 10010)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10013, 11, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10014, 11, 10010)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10015, 12, 10010)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10016, 13, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10017, 13, 10010)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10020, 16, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10021, 17, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10022, 18, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10023, 19, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10024, 20, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10025, 21, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10026, 22, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10027, 23, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10028, 24, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10029, 25, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10030, 26, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10031, 27, 10013)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10032, 28, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10033, 29, 10013)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10035, 31, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10036, 32, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10037, 33, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10039, 35, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10040, 36, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10041, 37, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (10042, 38, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (20005, 10003, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (20006, 30, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (20007, 34, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (20009, 10, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (20010, 10, 10010)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (20011, 14, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (20012, 10004, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (20014, 10005, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (20015, 10005, 10012)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (20016, 10006, 10012)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (20017, 10007, 10012)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (20018, 10008, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (20019, 10008, 10010)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (20020, 10009, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (20031, 10011, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (20032, 10011, 10010)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (20033, 10010, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (20034, 10010, 10010)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (20035, 10010, 10012)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (20045, 15, 10012)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (30025, 10012, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (30026, 10012, 10010)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (30027, 10013, 10012)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (30028, 10013, 10014)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (30029, 10014, 10012)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (30030, 10014, 10014)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (30031, 10015, 10012)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (30032, 10015, 10014)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (30033, 10016, 10012)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (30034, 10016, 10014)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (30035, 10017, 10010)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (30036, 10017, 10013)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (30037, 10018, 10010)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (30038, 10018, 10014)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (30039, 10019, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (30040, 10020, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (30041, 10021, 10009)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (30042, 10022, 10012)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (30043, 10023, 10012)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (30044, 10024, 10010)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (30045, 10024, 10012)
INSERT [dbo].[CakeApp_ProductCategories] ([ProductCategoryID], [ProductID], [CategoryID]) VALUES (30046, 10025, 10009)
SET IDENTITY_INSERT [dbo].[CakeApp_ProductCategories] OFF
SET IDENTITY_INSERT [dbo].[CakeApp_ProductImages] ON 

INSERT [dbo].[CakeApp_ProductImages] ([ProductImageID], [ProductID], [ImageName], [Title], [ImageAlt], [Priority], [Status]) VALUES (1, 1, N'Fruit-1.png', N'Fruit', N'alt', 10, 1)
INSERT [dbo].[CakeApp_ProductImages] ([ProductImageID], [ProductID], [ImageName], [Title], [ImageAlt], [Priority], [Status]) VALUES (2, 1, N'Fruit-2.png', N'Fruit', N'alt', 20, 1)
INSERT [dbo].[CakeApp_ProductImages] ([ProductImageID], [ProductID], [ImageName], [Title], [ImageAlt], [Priority], [Status]) VALUES (3, 1, N'Fruit-3.png', N'Fruit', N'alt', 30, 1)
INSERT [dbo].[CakeApp_ProductImages] ([ProductImageID], [ProductID], [ImageName], [Title], [ImageAlt], [Priority], [Status]) VALUES (4, 1, N'Fruit-4.png', N'Fruit', N'alt', 40, 1)
INSERT [dbo].[CakeApp_ProductImages] ([ProductImageID], [ProductID], [ImageName], [Title], [ImageAlt], [Priority], [Status]) VALUES (5, 2, N'sample product 2-1.png', N'sample product 2', N'alt', 50, 1)
INSERT [dbo].[CakeApp_ProductImages] ([ProductImageID], [ProductID], [ImageName], [Title], [ImageAlt], [Priority], [Status]) VALUES (6, 2, N'sample product 2-2.png', N'sample product 2', N'alt', 60, 1)
INSERT [dbo].[CakeApp_ProductImages] ([ProductImageID], [ProductID], [ImageName], [Title], [ImageAlt], [Priority], [Status]) VALUES (8, 7, N'vanila2-1.png', N'vanila2', N'alt', 80, 1)
INSERT [dbo].[CakeApp_ProductImages] ([ProductImageID], [ProductID], [ImageName], [Title], [ImageAlt], [Priority], [Status]) VALUES (9, 8, N'Fruit234-1.png', N'fruit234', N'alt', 90, 1)
INSERT [dbo].[CakeApp_ProductImages] ([ProductImageID], [ProductID], [ImageName], [Title], [ImageAlt], [Priority], [Status]) VALUES (11, 30, N'eCake-1.png', N'eCake', N'alt', 110, 1)
INSERT [dbo].[CakeApp_ProductImages] ([ProductImageID], [ProductID], [ImageName], [Title], [ImageAlt], [Priority], [Status]) VALUES (12, 31, N'eeCake-1.png', N'eeCake', N'eeCake', 120, 1)
INSERT [dbo].[CakeApp_ProductImages] ([ProductImageID], [ProductID], [ImageName], [Title], [ImageAlt], [Priority], [Status]) VALUES (13, 32, N'hhhCake-1.png', N'hhhCake', N'alt', 130, 1)
INSERT [dbo].[CakeApp_ProductImages] ([ProductImageID], [ProductID], [ImageName], [Title], [ImageAlt], [Priority], [Status]) VALUES (14, 33, N'kkCake-1.png', N'kkCake', N'alt', 140, 1)
INSERT [dbo].[CakeApp_ProductImages] ([ProductImageID], [ProductID], [ImageName], [Title], [ImageAlt], [Priority], [Status]) VALUES (15, 34, N'rrCake-1.png', N'rrCake', N'alt', 150, 1)
INSERT [dbo].[CakeApp_ProductImages] ([ProductImageID], [ProductID], [ImageName], [Title], [ImageAlt], [Priority], [Status]) VALUES (16, 35, N'nnCake-1.png', N'nnCake', N'alt', 160, 1)
INSERT [dbo].[CakeApp_ProductImages] ([ProductImageID], [ProductID], [ImageName], [Title], [ImageAlt], [Priority], [Status]) VALUES (17, 36, N'aaCake-1.png', N'aaCake', N'alt', 170, 1)
INSERT [dbo].[CakeApp_ProductImages] ([ProductImageID], [ProductID], [ImageName], [Title], [ImageAlt], [Priority], [Status]) VALUES (18, 37, N'zzCake-1.png', N'zzCake', N'alt', 180, 1)
INSERT [dbo].[CakeApp_ProductImages] ([ProductImageID], [ProductID], [ImageName], [Title], [ImageAlt], [Priority], [Status]) VALUES (19, 38, N'ttCake-1.png', N'ttCake', N'alt', 190, 1)
INSERT [dbo].[CakeApp_ProductImages] ([ProductImageID], [ProductID], [ImageName], [Title], [ImageAlt], [Priority], [Status]) VALUES (10011, 10003, N'yyCake-1.png', N'yyCake', N'alt', 200, 1)
INSERT [dbo].[CakeApp_ProductImages] ([ProductImageID], [ProductID], [ImageName], [Title], [ImageAlt], [Priority], [Status]) VALUES (10012, 10004, N'vvCake-1.png', N'vvCake', N'alt', 210, 1)
INSERT [dbo].[CakeApp_ProductImages] ([ProductImageID], [ProductID], [ImageName], [Title], [ImageAlt], [Priority], [Status]) VALUES (10013, 10005, N'uuCake-1.png', N'uuCake', N'alt', 220, 1)
INSERT [dbo].[CakeApp_ProductImages] ([ProductImageID], [ProductID], [ImageName], [Title], [ImageAlt], [Priority], [Status]) VALUES (10014, 10006, N'zzzzCake-1.png', N'zzzzCake', N'alt', 230, 1)
INSERT [dbo].[CakeApp_ProductImages] ([ProductImageID], [ProductID], [ImageName], [Title], [ImageAlt], [Priority], [Status]) VALUES (10015, 10007, N'ggggCake-1.png', N'ggggCake', N'alt', 240, 1)
SET IDENTITY_INSERT [dbo].[CakeApp_ProductImages] OFF
SET IDENTITY_INSERT [dbo].[CakeApp_ProductInfo] ON 

INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (1, 1, 7)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (4, 2, 2)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (5, 2, 10)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10007, 7, 2)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10008, 8, 7)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10012, 11, 2)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10013, 12, 2)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10014, 13, 1)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10017, 16, 2)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10018, 17, 1)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10019, 18, 1)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10020, 19, 1)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10021, 20, 1)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10022, 21, 1)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10023, 22, 3)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10024, 22, 7)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10025, 23, 1)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10026, 24, 2)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10027, 25, 2)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10028, 26, 2)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10029, 26, 4)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10030, 27, 2)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10031, 27, 4)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10032, 28, 1)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10033, 29, 3)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10035, 31, 2)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10036, 32, 2)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10037, 33, 2)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10040, 35, 2)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10041, 35, 4)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10042, 36, 2)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10043, 36, 4)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10044, 37, 7)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (10045, 38, 1)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (20003, 10003, 1)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (20004, 30, 1)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (20005, 34, 2)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (20006, 34, 4)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (20008, 10, 1)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (20009, 10, 7)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (20010, 14, 3)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (20011, 10004, 2)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (20013, 10005, 1)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (20014, 10006, 2)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (20015, 10007, 2)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (20016, 10008, 2)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (20017, 10009, 2)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (20023, 10011, 2)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (20024, 10011, 4)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (20025, 10010, 1)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (20035, 15, 3)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (30021, 10012, 1)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (30022, 10013, 2)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (30023, 10014, 7)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (30024, 10014, 9)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (30025, 10015, 2)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (30026, 10016, 1)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (30027, 10017, 1)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (30028, 10018, 7)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (30029, 10019, 2)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (30030, 10020, 2)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (30031, 10021, 2)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (30032, 10022, 7)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (30033, 10023, 9)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (30034, 10024, 10)
INSERT [dbo].[CakeApp_ProductInfo] ([ProductInfoID], [ProductID], [InfoID]) VALUES (30035, 10025, 3)
SET IDENTITY_INSERT [dbo].[CakeApp_ProductInfo] OFF
SET IDENTITY_INSERT [dbo].[CakeApp_ProductLog] ON 

INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (1, 10005, 1, 0, 0, CAST(0x0000A52200EBEE25 AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (2, 10005, 0, 1, 0, CAST(0x0000A52200F0C984 AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (3, 10006, 1, 0, 0, CAST(0x0000A52200F1CFB6 AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (4, 10007, 1, 0, 0, CAST(0x0000A52200F4C4CB AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (5, 10008, 1, 0, 0, CAST(0x0000A52300893020 AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (6, 10009, 1, 0, 0, CAST(0x0000A523009B9013 AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (7, 10010, 1, 0, 0, CAST(0x0000A52300A0B439 AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (8, 10011, 1, 0, 0, CAST(0x0000A52300AE72D5 AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (9, 10010, 0, 1, 0, CAST(0x0000A52300C98065 AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (10, 10010, 0, 1, 0, CAST(0x0000A52300E14031 AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (11, 10011, 0, 1, 0, CAST(0x0000A52300E15F76 AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (12, 10010, 0, 1, 0, CAST(0x0000A52300E17964 AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (13, 9, 0, 1, 0, CAST(0x0000A52400AA7297 AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (14, 9, 0, 1, 0, CAST(0x0000A52400AAC573 AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (15, 9, 0, 1, 0, CAST(0x0000A52400D08302 AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (16, 15, 0, 1, 0, CAST(0x0000A52400D93155 AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (17, 15, 0, 1, 0, CAST(0x0000A52400DA3842 AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (18, 15, 0, 1, 0, CAST(0x0000A52400DC79D7 AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (10009, 10012, 1, 0, 0, CAST(0x0000A528008B7B32 AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (10010, 10013, 1, 0, 0, CAST(0x0000A52900DBF2BE AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (10011, 10014, 1, 0, 0, CAST(0x0000A52900E12FE1 AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (10012, 10015, 1, 0, 0, CAST(0x0000A52900E370C8 AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (10013, 10016, 1, 0, 0, CAST(0x0000A52900EA1D48 AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (10014, 10017, 1, 0, 0, CAST(0x0000A52900ED63AE AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (10015, 10018, 1, 0, 0, CAST(0x0000A52900EFA56B AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (10016, 10019, 1, 0, 0, CAST(0x0000A52900F861C1 AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (10017, 10020, 1, 0, 0, CAST(0x0000A52900FA44F2 AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (10018, 10021, 1, 0, 0, CAST(0x0000A52900FBAD7A AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (10019, 10022, 1, 0, 0, CAST(0x0000A52900FC66DF AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (10020, 10023, 1, 0, 0, CAST(0x0000A52900FDE8D7 AS DateTime))
INSERT [dbo].[CakeApp_ProductLog] ([ProductLogID], [ProductID], [IsAdded], [IsUpdated], [IsDeleted], [DateOfModification]) VALUES (10021, 10025, 1, 0, 0, CAST(0x0000A52900FECC7D AS DateTime))
SET IDENTITY_INSERT [dbo].[CakeApp_ProductLog] OFF
SET IDENTITY_INSERT [dbo].[CakeApp_ProductPrice] ON 

INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (1, 1, 1, N'7', 1, CAST(250 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (3, 2, 2, N'2,10', 2, CAST(300 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (10006, 7, 2, N'2', 2, CAST(560 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (10007, 8, 1, N'7', 1, CAST(25 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (10010, 11, 2, N'2', 2, CAST(5600 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (10011, 12, 2, N'2', 2, CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (10012, 13, 1, N'1', 5, CAST(200 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (10015, 16, 2, N'2', 2, CAST(250 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (10016, 17, 1, N'1', 5, CAST(250 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (10017, 18, 1, N'1', 5, CAST(230 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (10018, 19, 1, N'1', 5, CAST(230 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (10019, 20, 1, N'1', 5, CAST(2600 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (10020, 21, 1, N'1', 5, CAST(250 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (10021, 22, 5, N'3,7', 3, CAST(2800 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (10022, 23, 1, N'1', 5, CAST(3600 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (10023, 24, 2, N'2', 2, CAST(25 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (10024, 25, 2, N'2', 2, CAST(400 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (10025, 26, 2, N'2,4', 2, CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (10026, 27, 2, N'2,4', 2, CAST(1100 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (10027, 28, 1, N'1', 5, CAST(5600 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (10028, 29, 5, N'3', 3, CAST(100 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (10030, 31, 2, N'2', 2, CAST(7800 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (10031, 32, 2, N'2', 2, CAST(1470 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (10032, 33, 2, N'2', 2, CAST(4500 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (10034, 35, 2, N'2,4', 2, CAST(4500 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (10035, 36, 2, N'2,4', 2, CAST(1100 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (10036, 37, 1, N'7', 5, CAST(11100 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (10037, 38, 1, N'1', 5, CAST(1150 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (20003, 10003, 1, N'1', 5, CAST(850 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (20004, 30, 1, N'1', 5, CAST(1500 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (20005, 34, 2, N'2,4', 2, CAST(1150 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (20008, 10, 1, N'1,7', 5, CAST(8000 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (20009, 10, 1, N'1,7', 1, CAST(9000 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (20010, 14, 5, N'3', 3, CAST(4000 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (20011, 14, 5, N'3', 4, CAST(4000 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (20012, 10004, 2, N'2', 2, CAST(1500 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (20014, 10005, 1, N'1', 5, CAST(6000 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (20015, 10006, 2, N'2', 2, CAST(5800 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (20016, 10007, 2, N'2', 2, CAST(800 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (20017, 10008, 2, N'2', 2, CAST(4500 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (20018, 10008, 2, N'2', 6, CAST(5000 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (20019, 10009, 2, N'2', 2, CAST(8700 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (20031, 10011, 2, N'2,4', 2, CAST(8900 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (20032, 10011, 2, N'2,4', 6, CAST(960 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (20033, 10010, 1, N'1', 5, CAST(700 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (20034, 10010, 1, N'1', 1, CAST(800 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (20035, 10010, 1, N'1', 6, CAST(900 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (20043, 15, 5, N'3', 3, CAST(250 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (30025, 10012, 1, N'1', 5, CAST(560 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (30026, 10013, 2, N'2', 2, CAST(1480 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (30027, 10014, 5, N'7,9', 3, CAST(9600 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (30028, 10014, 5, N'7,9', 4, CAST(8300 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (30029, 10015, 2, N'2', 2, CAST(5740 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (30030, 10016, 1, N'1', 5, CAST(7860 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (30031, 10016, 1, N'1', 6, CAST(8790 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (30032, 10017, 1, N'1', 5, CAST(8520 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (30033, 10018, 5, N'7', 3, CAST(8000 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (30034, 10019, 2, N'2', 2, CAST(100 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (30035, 10020, 2, N'2', 2, CAST(540 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (30036, 10021, 2, N'2', 2, CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (30037, 10022, 2, N'7', 2, CAST(23 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (30038, 10023, 5, N'9', 3, CAST(55 AS Decimal(18, 0)))
INSERT [dbo].[CakeApp_ProductPrice] ([ProductPriceID], [ProductID], [GroupID], [InfoIDs], [SizeID], [Price]) VALUES (30039, 10025, 5, N'3', 3, CAST(23 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[CakeApp_ProductPrice] OFF
SET IDENTITY_INSERT [dbo].[CakeApp_Products] ON 

INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (1, N'aaa', N'Fruit', 6, 10, 1, NULL, N'test', N'test', 2, 1, 1, 0, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (2, N'sample product 23', N'sample product 23', 4, 20, 2, NULL, N'test', N'dfsfsd', NULL, 0, 1, 1, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (7, N'vanila2', N'vanila2', 1, 50, 2, NULL, N'bbbb', N'bbbb', 2, 1, 0, 0, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (8, N'aaa234', N'Fruit234', 1, 60, 1, NULL, N'szd', N'sadsad', 2, 1, 1, 1, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (10, N'bCake', N'bCake', 1, 80, 1, NULL, N'aaaa', N'aaaaa', NULL, 1, 1, 1, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (11, N'dCake', N'dCake', 4, 90, 2, NULL, N'xxxxxxxxxx', N'xxxxxxxxxxxxxxx', 2, 1, 1, 1, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (12, N'GCake', N'GCake', 4, 100, 2, NULL, N'xxxxxxxxxxxxx', N'xxxxxxxxxxxxx', 2, 1, 1, 1, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (13, N'hCake', N'hCake', 1, 110, 1, NULL, N'xxxxxxxxxxxxxxxxxxx', N'xxxxxxxxxxxxxxxxxx', 2, 1, 0, 0, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (14, N'kCake', N'kCake', 4, 120, 5, NULL, N'xxxxxxxxxxxxxxxxxx', N'xxxxxxxxxxxxxxxxxxxx', NULL, 1, 1, 1, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (15, N'fCake', N'fCake', 6, 130, 5, NULL, N'ssssssssssssss', N'sssssssssss', NULL, 1, 1, 1, N'20151001_065533.jpg')
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (16, N'JCake', N'jcake', 1, 140, 2, NULL, N'sssssssssssss', N'sssssssssssssssss', 2, 1, 0, 0, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (17, N'OCake', N'OCake', 1, 150, 1, NULL, N'dddddd', N'ddddddd', 2, 1, 1, 1, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (18, N'mCake', N'mCake', 6, 160, 1, NULL, N'rrrrrrrrr', N'rrrrrrrrrr', 2, 1, 1, 1, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (19, N'nCake', N'nCake', 6, 170, 1, NULL, N'sssssssssssss', N'sssssssssssssss', 2, 1, 1, 1, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (20, N'uCake', N'uCake', 1, 180, 1, NULL, N'aaaaaaaaaaa', N'aaaaaaaaaaaaa', 2, 1, 1, 1, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (21, N'cdCake', N'cdCake', 1, 190, 1, NULL, N'ggggggggg', N'gggggggggg', 2, 1, 0, 0, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (22, N'bbbbbb', N'bbbbb', 6, 200, 5, NULL, N'ggggggggg', N'gggggg', 2, 1, 1, 1, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (23, N'ddd', N'ddd', 1, 210, 1, NULL, N'fffffffffff', N'ffffffffff', 2, 1, 0, 0, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (24, N'wCAke', N'wCAke', 1, 220, 2, NULL, N'ggggg', N'gggggggggg', 2, 1, 0, 0, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (25, N'ccccc', N'ccccc', 1, 230, 2, NULL, N'ggggggggg', N'gggggggggg', 2, 1, 1, 1, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (26, N'sss', N'sss', 1, 240, 2, NULL, N'eeeeee', N'eeeeeee', 2, 1, 0, 0, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (27, N'pp', N'pp', 1, 250, 2, NULL, N'kkkk', N'kkkk', 2, 1, 1, 1, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (28, N'qq', N'qq', 1, 260, 1, NULL, N'rrrrr', N'rrrrrrrr', 2, 1, 1, 1, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (29, N'qCake', N'qCake', 4, 270, 5, NULL, N'aaaaaaa', N'aaaaaaaaaa', 2, 1, 0, 0, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (30, N'eCake', N'eCake', 1, 390, 1, NULL, N'sssssssssss', N'ssssssssss', NULL, 1, 1, 1, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (31, N'eeCake', N'eeCake', 4, 290, 2, NULL, N'aaaaaaaaa', N'aaaaaaaaaaaa', 2, 1, 0, 0, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (32, N'hhhCake', N'hhhCake', 1, 300, 2, NULL, N'aaaaaaaaa', N'aaaaaaaa', 2, 1, 1, 1, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (33, N'kkCake', N'kkCake', 1, 310, 2, NULL, N'aaaaaaaaaa', N'aaaaaaaaa', 2, 1, 0, 0, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (34, N'rrCake', N'rrCake', 4, 342, 2, NULL, N'aaaaaaaaa', N'aaaaaaaaaaaa', NULL, 1, 0, 0, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (35, N'nnCake', N'nnCake', 1, 330, 2, NULL, N'aaaaaaaaaaa', N'aaaaaaaaaaaaa', 2, 1, 0, 0, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (36, N'aaCake', N'aaCake', 1, 340, 2, NULL, N'aaaaaaaaaaa', N'aaaaaaa', 2, 1, 1, 1, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (37, N'zzCake', N'zzCake', 4, 350, 1, NULL, N'aaaaaaaaa', N'aaaaaaaa', 2, 1, 0, 0, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (38, N'ttCake', N'ttCake', 1, 360, 1, NULL, N'aaaaaa', N'aaaaa', 2, 1, 0, 0, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (10003, N'yyCake', N'yyCake', 1, 370, 1, NULL, N'rrrrrrr', N'rrrrrrr', 2, 1, 0, 0, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (10004, N'vvCake', N'vvCake', 1, 400, 2, NULL, N'aaaaaaaaaa', N'aaaaaaaaaaa', 2, 1, 0, 0, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (10005, N'uuCake', N'uuCake', 4, 410, 1, NULL, N'aaaaaaa', N'aaaaa', NULL, 1, 0, 0, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (10006, N'zzzzCake', N'zzzzCake', 1, 420, 2, NULL, N'aaaaaaaaaa', N'aaaaaaaaaaa', 2, 1, 0, 0, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (10007, N'ggggCake', N'ggggCake', 1, 430, 2, NULL, N'sssssssss', N'sssssssssss', 2, 1, 0, 0, NULL)
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (10008, N'demo', N'demo', 1, 440, 2, NULL, NULL, NULL, 2, 1, 1, 1, N'20150930_010749.jpg')
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (10009, N'huCake', N'huCake', 4, 450, 2, NULL, NULL, NULL, 2, 1, 0, 0, N'20150930_022263.jpg')
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (10010, N'buCake', N'buCake', 6, 460, 1, NULL, NULL, NULL, NULL, 1, 0, 1, N'20150930_032986.jpg')
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (10011, N'ruiCake', N'ruiCake', 1, 470, 2, NULL, NULL, NULL, NULL, 1, 1, 1, N'20150930_040824.jpg')
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (10012, N'SqareCake', N'SqareCake', 1, 500, 1, NULL, NULL, NULL, 2, 1, 1, 1, N'SqareCake-1.png')
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (10013, N'Kid Cake', N'Kid Cake', 4, 510, 2, NULL, NULL, NULL, 2, 1, 1, 1, N'Kid Cake-1.png')
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (10014, N'Kid Chokolate Cake', N'Kid Chokolate Cake', 4, 520, 5, NULL, NULL, NULL, 2, 1, 1, 1, N'Kid Chokolate Cake-1.png')
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (10015, N'Square Cake', N'Square Cake', 4, 530, 2, NULL, NULL, NULL, 2, 1, 1, 1, N'20151006_070463.jpg')
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (10016, N'RoundCake', N'RoundCake', 1, 540, 1, NULL, NULL, NULL, 2, 1, 1, 1, N'RoundCake-1.png')
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (10017, N'RoundCake1', N'RoundCake1', 6, 550, 1, NULL, NULL, NULL, 2, 1, 1, 1, N'RoundCake1-1.png')
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (10018, N'Square Cake2', N'Square Cake2', 4, 560, 5, NULL, NULL, NULL, 2, 1, 1, 1, N'Square Cake2-1.png')
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (10019, N'Square Cake3', N'Square Cake3', 1, 600, 2, NULL, NULL, NULL, 2, 1, 1, 1, N'Square Cake3-1.png')
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (10020, N'RoundCake6', N'RoundCake6', 4, 900, 2, NULL, NULL, NULL, 2, 1, 0, 0, N'RoundCake6-1.png')
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (10021, N'Square Cake9', N'Square Cake9', 4, 960, 2, NULL, NULL, NULL, 2, 1, 0, 0, N'Square Cake9-1.png')
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (10022, N'cakeApp2sss', N'Fruitsss', 4, 444, 2, NULL, NULL, NULL, 2, 1, 0, 0, N'Fruitsss-1.png')
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (10023, N'Black Forest6444', N'Cake6664', 1, 555, 5, NULL, NULL, NULL, 2, 1, 0, 0, N'Cake6664-1.png')
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (10024, N'Cake6665555', N'Cake666555', 1, 6666, 2, NULL, NULL, NULL, 2, 1, 0, 0, N'20151006_081917.jpg')
INSERT [dbo].[CakeApp_Products] ([ProductID], [ProductName], [Title], [TagID], [Priority], [GroupID], [Price], [AdditionalInfo], [Instructions], [AddedBy], [Status], [statusAdditionalInfo], [statusInstructions], [ProductImageName]) VALUES (10025, N'Cake66655554444', N'Cake6665554444', 1, 66646, 5, NULL, NULL, NULL, 2, 1, 0, 0, N'Cake6665554444-1.png')
SET IDENTITY_INSERT [dbo].[CakeApp_Products] OFF
SET IDENTITY_INSERT [dbo].[CakeApp_ProductSizes] ON 

INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (1, 1, 1)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (3, 2, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (10006, 7, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (10007, 8, 1)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (10010, 11, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (10011, 12, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (10012, 13, 5)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (10015, 16, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (10016, 17, 5)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (10017, 18, 5)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (10018, 19, 5)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (10019, 20, 5)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (10020, 21, 5)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (10021, 22, 3)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (10022, 23, 5)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (10023, 24, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (10024, 25, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (10025, 26, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (10026, 27, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (10027, 28, 5)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (10028, 29, 3)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (10030, 31, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (10031, 32, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (10032, 33, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (10034, 35, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (10035, 36, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (10036, 37, 5)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (10037, 38, 5)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (20003, 10003, 5)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (20004, 30, 5)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (20005, 34, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (20008, 10, 5)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (20009, 10, 1)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (20010, 14, 3)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (20011, 14, 4)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (20012, 10004, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (20014, 10005, 5)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (20015, 10006, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (20016, 10007, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (20017, 10008, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (20018, 10008, 6)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (20019, 10009, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (20031, 10011, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (20032, 10011, 6)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (20033, 10010, 5)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (20034, 10010, 1)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (20035, 10010, 6)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (20043, 15, 3)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (30025, 10012, 5)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (30026, 10013, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (30027, 10014, 3)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (30028, 10014, 4)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (30029, 10015, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (30030, 10016, 5)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (30031, 10016, 6)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (30032, 10017, 5)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (30033, 10018, 3)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (30034, 10019, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (30035, 10020, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (30036, 10021, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (30037, 10022, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (30038, 10023, 3)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (30039, 10024, 2)
INSERT [dbo].[CakeApp_ProductSizes] ([ProductSizeID], [ProductID], [SizeID]) VALUES (30040, 10025, 3)
SET IDENTITY_INSERT [dbo].[CakeApp_ProductSizes] OFF
SET IDENTITY_INSERT [dbo].[CakeApp_Roles] ON 

INSERT [dbo].[CakeApp_Roles] ([RoleID], [RoleName], [Status]) VALUES (1, N'Admin', 1)
SET IDENTITY_INSERT [dbo].[CakeApp_Roles] OFF
SET IDENTITY_INSERT [dbo].[CakeApp_Screensavers] ON 

INSERT [dbo].[CakeApp_Screensavers] ([ScreensaverID], [Name], [Title], [Priority], [Status], [Video]) VALUES (3, N'test', N'ggg', 10, 1, N'20150904_065692.mp4')
INSERT [dbo].[CakeApp_Screensavers] ([ScreensaverID], [Name], [Title], [Priority], [Status], [Video]) VALUES (4, N'ScreenSaver22222', N'ScreenSaver2222222222', 20, 1, N'20150918_082918.mp4')
SET IDENTITY_INSERT [dbo].[CakeApp_Screensavers] OFF
SET IDENTITY_INSERT [dbo].[CakeApp_SizeGroup] ON 

INSERT [dbo].[CakeApp_SizeGroup] ([SizeGroupID], [SizeID], [GroupID]) VALUES (2, 2, 2)
INSERT [dbo].[CakeApp_SizeGroup] ([SizeGroupID], [SizeID], [GroupID]) VALUES (3, 3, 5)
INSERT [dbo].[CakeApp_SizeGroup] ([SizeGroupID], [SizeID], [GroupID]) VALUES (16, 5, 1)
INSERT [dbo].[CakeApp_SizeGroup] ([SizeGroupID], [SizeID], [GroupID]) VALUES (21, 1, 1)
INSERT [dbo].[CakeApp_SizeGroup] ([SizeGroupID], [SizeID], [GroupID]) VALUES (23, 4, 5)
INSERT [dbo].[CakeApp_SizeGroup] ([SizeGroupID], [SizeID], [GroupID]) VALUES (33, 6, 1)
SET IDENTITY_INSERT [dbo].[CakeApp_SizeGroup] OFF
SET IDENTITY_INSERT [dbo].[CakeApp_Sizes] ON 

INSERT [dbo].[CakeApp_Sizes] ([SizeID], [Size], [Title], [Price], [Priority], [Status]) VALUES (1, N'8888', N'8111', N'20.25', 10, 0)
INSERT [dbo].[CakeApp_Sizes] ([SizeID], [Size], [Title], [Price], [Priority], [Status]) VALUES (2, N'10', N'10', N'30.50', 20, 1)
INSERT [dbo].[CakeApp_Sizes] ([SizeID], [Size], [Title], [Price], [Priority], [Status]) VALUES (3, N'12', N'12', N'60.50', 30, 1)
INSERT [dbo].[CakeApp_Sizes] ([SizeID], [Size], [Title], [Price], [Priority], [Status]) VALUES (4, N'16', N'16', N'50.20', 15, 1)
INSERT [dbo].[CakeApp_Sizes] ([SizeID], [Size], [Title], [Price], [Priority], [Status]) VALUES (5, N'16/28', N'16/28', N'20.75', 50, 1)
INSERT [dbo].[CakeApp_Sizes] ([SizeID], [Size], [Title], [Price], [Priority], [Status]) VALUES (6, N'20', N'20', NULL, 60, 1)
SET IDENTITY_INSERT [dbo].[CakeApp_Sizes] OFF
SET IDENTITY_INSERT [dbo].[CakeApp_Tags] ON 

INSERT [dbo].[CakeApp_Tags] ([TagID], [TagName], [Title]) VALUES (1, N'demotag1', N'demotag1Title')
INSERT [dbo].[CakeApp_Tags] ([TagID], [TagName], [Title]) VALUES (4, N'demotag2', N'demotag2title')
INSERT [dbo].[CakeApp_Tags] ([TagID], [TagName], [Title]) VALUES (6, N'demotag3', N'demotag3title')
SET IDENTITY_INSERT [dbo].[CakeApp_Tags] OFF
SET IDENTITY_INSERT [dbo].[CakeApp_Users] ON 

INSERT [dbo].[CakeApp_Users] ([UserID], [UserName], [Password], [Email], [RoleID], [Status]) VALUES (2, N'admin', N'E10ADC3949BA59ABBE56E057F20F883E', N'admin@gmail.com', 1, 1)
SET IDENTITY_INSERT [dbo].[CakeApp_Users] OFF
ALTER TABLE [dbo].[CakeApp_Categories] ADD  CONSTRAINT [DF_CakeApp_Categories_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[CakeApp_ProductImages] ADD  CONSTRAINT [DF_CakeApp_ProductImages_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[CakeApp_Products] ADD  CONSTRAINT [DF_CakeApp_Products_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[CakeApp_Roles] ADD  CONSTRAINT [DF_CakeApp_Roles_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[CakeApp_Sizes] ADD  CONSTRAINT [DF_CakeApp_Sizes_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[CakeApp_SyncSchedule] ADD  CONSTRAINT [DF_CakeApp_SyncSchedule_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[CakeApp_Users] ADD  CONSTRAINT [DF_CakeApp_Users_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[CakeApp_Categories]  WITH CHECK ADD  CONSTRAINT [FK_CakeApp_Categories_CakeApp_CategoryImages] FOREIGN KEY([CategoryImageID])
REFERENCES [dbo].[CakeApp_CategoryImages] ([CategoryImageID])
GO
ALTER TABLE [dbo].[CakeApp_Categories] CHECK CONSTRAINT [FK_CakeApp_Categories_CakeApp_CategoryImages]
GO
ALTER TABLE [dbo].[CakeApp_Categories]  WITH CHECK ADD  CONSTRAINT [FK_CakeApp_Categories_CakeApp_Tags] FOREIGN KEY([TagID])
REFERENCES [dbo].[CakeApp_Tags] ([TagID])
GO
ALTER TABLE [dbo].[CakeApp_Categories] CHECK CONSTRAINT [FK_CakeApp_Categories_CakeApp_Tags]
GO
ALTER TABLE [dbo].[CakeApp_InfoGroup]  WITH CHECK ADD  CONSTRAINT [FK_CakeApp_InfoGroup_CakeApp_Groups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[CakeApp_Groups] ([GroupID])
GO
ALTER TABLE [dbo].[CakeApp_InfoGroup] CHECK CONSTRAINT [FK_CakeApp_InfoGroup_CakeApp_Groups]
GO
ALTER TABLE [dbo].[CakeApp_InfoGroup]  WITH CHECK ADD  CONSTRAINT [FK_CakeApp_InfoGroup_CakeApp_Groups1] FOREIGN KEY([GroupID])
REFERENCES [dbo].[CakeApp_Groups] ([GroupID])
GO
ALTER TABLE [dbo].[CakeApp_InfoGroup] CHECK CONSTRAINT [FK_CakeApp_InfoGroup_CakeApp_Groups1]
GO
ALTER TABLE [dbo].[CakeApp_InfoGroup]  WITH CHECK ADD  CONSTRAINT [FK_CakeApp_InfoGroup_CakeApp_Info] FOREIGN KEY([InfoID])
REFERENCES [dbo].[CakeApp_Info] ([InfoID])
GO
ALTER TABLE [dbo].[CakeApp_InfoGroup] CHECK CONSTRAINT [FK_CakeApp_InfoGroup_CakeApp_Info]
GO
ALTER TABLE [dbo].[CakeApp_ProductCategories]  WITH CHECK ADD  CONSTRAINT [FK_CakeApp_ProductCategories_CakeApp_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[CakeApp_Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[CakeApp_ProductCategories] CHECK CONSTRAINT [FK_CakeApp_ProductCategories_CakeApp_Categories]
GO
ALTER TABLE [dbo].[CakeApp_ProductInfo]  WITH CHECK ADD  CONSTRAINT [FK_CakeApp_ProductInfo_CakeApp_Info] FOREIGN KEY([InfoID])
REFERENCES [dbo].[CakeApp_Info] ([InfoID])
GO
ALTER TABLE [dbo].[CakeApp_ProductInfo] CHECK CONSTRAINT [FK_CakeApp_ProductInfo_CakeApp_Info]
GO
ALTER TABLE [dbo].[CakeApp_Products]  WITH CHECK ADD  CONSTRAINT [FK_CakeApp_Products_CakeApp_Groups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[CakeApp_Groups] ([GroupID])
GO
ALTER TABLE [dbo].[CakeApp_Products] CHECK CONSTRAINT [FK_CakeApp_Products_CakeApp_Groups]
GO
ALTER TABLE [dbo].[CakeApp_Products]  WITH CHECK ADD  CONSTRAINT [FK_CakeApp_Products_CakeApp_Tags] FOREIGN KEY([TagID])
REFERENCES [dbo].[CakeApp_Tags] ([TagID])
GO
ALTER TABLE [dbo].[CakeApp_Products] CHECK CONSTRAINT [FK_CakeApp_Products_CakeApp_Tags]
GO
ALTER TABLE [dbo].[CakeApp_Products]  WITH CHECK ADD  CONSTRAINT [FK_CakeApp_Products_CakeApp_Tags1] FOREIGN KEY([TagID])
REFERENCES [dbo].[CakeApp_Tags] ([TagID])
GO
ALTER TABLE [dbo].[CakeApp_Products] CHECK CONSTRAINT [FK_CakeApp_Products_CakeApp_Tags1]
GO
ALTER TABLE [dbo].[CakeApp_ProductSizes]  WITH CHECK ADD  CONSTRAINT [FK_CakeApp_ProductSizes_CakeApp_Sizes] FOREIGN KEY([SizeID])
REFERENCES [dbo].[CakeApp_Sizes] ([SizeID])
GO
ALTER TABLE [dbo].[CakeApp_ProductSizes] CHECK CONSTRAINT [FK_CakeApp_ProductSizes_CakeApp_Sizes]
GO
ALTER TABLE [dbo].[CakeApp_SizeGroup]  WITH CHECK ADD  CONSTRAINT [FK_CakeApp_SizeGroup_CakeApp_Groups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[CakeApp_Groups] ([GroupID])
GO
ALTER TABLE [dbo].[CakeApp_SizeGroup] CHECK CONSTRAINT [FK_CakeApp_SizeGroup_CakeApp_Groups]
GO
ALTER TABLE [dbo].[CakeApp_SizeGroup]  WITH CHECK ADD  CONSTRAINT [FK_CakeApp_SizeGroup_CakeApp_Sizes] FOREIGN KEY([SizeID])
REFERENCES [dbo].[CakeApp_Sizes] ([SizeID])
GO
ALTER TABLE [dbo].[CakeApp_SizeGroup] CHECK CONSTRAINT [FK_CakeApp_SizeGroup_CakeApp_Sizes]
GO
ALTER TABLE [dbo].[CakeApp_SyncProcess]  WITH CHECK ADD  CONSTRAINT [FK_CakeApp_SyncProcess_CakeApp_SyncSchedule] FOREIGN KEY([SyncID])
REFERENCES [dbo].[CakeApp_SyncSchedule] ([SyncID])
GO
ALTER TABLE [dbo].[CakeApp_SyncProcess] CHECK CONSTRAINT [FK_CakeApp_SyncProcess_CakeApp_SyncSchedule]
GO
USE [master]
GO
ALTER DATABASE [CakeApp] SET  READ_WRITE 
GO
