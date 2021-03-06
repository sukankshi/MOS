USE [master]
GO
/****** Object:  Database [dbRealEstate]    Script Date: 6/23/2016 11:00:04 PM ******/
CREATE DATABASE [dbRealEstate]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbRealEstate', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\dbRealEstate.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbRealEstate_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\dbRealEstate_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbRealEstate] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbRealEstate].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbRealEstate] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbRealEstate] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbRealEstate] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbRealEstate] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbRealEstate] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbRealEstate] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbRealEstate] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [dbRealEstate] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbRealEstate] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbRealEstate] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbRealEstate] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbRealEstate] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbRealEstate] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbRealEstate] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbRealEstate] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbRealEstate] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbRealEstate] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbRealEstate] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbRealEstate] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbRealEstate] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbRealEstate] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbRealEstate] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbRealEstate] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbRealEstate] SET RECOVERY FULL 
GO
ALTER DATABASE [dbRealEstate] SET  MULTI_USER 
GO
ALTER DATABASE [dbRealEstate] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbRealEstate] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbRealEstate] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbRealEstate] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [dbRealEstate]
GO
/****** Object:  Table [dbo].[tblAmenity]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAmenity](
	[Id] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
	[MasterAmenityId] [int] NOT NULL,
	[Value] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tblAmenity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblApartmentBuildQuality]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblApartmentBuildQuality](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[MasterApartmentBuildQualityId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblApartmentBuildQuality] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblAverageRating]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAverageRating](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[Amenity] [float] NOT NULL,
	[ApartmentBuildQuality] [float] NOT NULL,
	[BuilderProfile] [float] NOT NULL,
	[ConstructionQualityParameter] [float] NOT NULL,
	[Inventory] [float] NOT NULL,
	[LegalClarity] [float] NOT NULL,
	[Livability] [float] NOT NULL,
 CONSTRAINT [PK_tblAverageRating] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblBuilderProfile]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBuilderProfile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[MasterBuilderProfileId] [int] NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblBuilderProfile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCity]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblCity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblConstructionQualityParameter]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblConstructionQualityParameter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[MasterConstructionQualityParameterId] [int] NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblConstructionQualityParameter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblFollowProject]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFollowProject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
 CONSTRAINT [PK_tblFollow] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblImage]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[ImageName] [varchar](50) NOT NULL,
	[Likes] [int] NOT NULL,
	[Dislikes] [int] NOT NULL,
 CONSTRAINT [PK_tblImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblInappropriate]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInappropriate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReviewId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Reason] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblInappropriate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblIntroductoryVideo]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblIntroductoryVideo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[Link] [nvarchar](100) NOT NULL,
	[Time] [datetime] NOT NULL,
	[Likes] [int] NOT NULL,
	[Dislikes] [int] NOT NULL,
 CONSTRAINT [PK_tblIntroductoryVideo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblInventory]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInventory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[MasterInventoryId] [int] NOT NULL,
	[Value] [float] NOT NULL,
 CONSTRAINT [PK_tblInventory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLegalClarity]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLegalClarity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[MasterLegalClarityId] [int] NOT NULL,
	[Value] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tblLegalClarity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLevel]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLevel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[value] [int] NULL,
 CONSTRAINT [PK_tblLevel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLivability]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLivability](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[MasterLivabilityId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Value] [float] NOT NULL,
 CONSTRAINT [PK_tblLivability] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLocation]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLocation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AddressLine1] [nvarchar](100) NOT NULL,
	[AddressLine2] [nvarchar](100) NOT NULL,
	[CityId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
 CONSTRAINT [PK_tblLocation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMasterAmenity]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMasterAmenity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblMasterAmenity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMasterApartmentBuildQuality]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMasterApartmentBuildQuality](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblMasterApartmentBuildQuality] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMasterBuilderProfile]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMasterBuilderProfile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblMasterBuilderProfile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMasterConstructionQualityParameter]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMasterConstructionQualityParameter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblMasterConstructionQualityParameter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMasterInventory]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMasterInventory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblMasterInventory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMasterLegalClarity]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMasterLegalClarity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblMasterLegalClarity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMasterLivability]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMasterLivability](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblMasterLivability] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMasterProjectInformation]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMasterProjectInformation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblMasterProjectInformation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMasterReview]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMasterReview](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblMasterReview] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProject]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProject](
	[Id] [int] IDENTITY(1001,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Possession] [datetime] NULL,
	[Pricing] [bigint] NOT NULL,
	[AverageRating] [float] NOT NULL,
 CONSTRAINT [PK_tblProject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProjectInformation]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjectInformation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[MasterProjectInformationId] [int] NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblProjectInformation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRecentlyViewed]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRecentlyViewed](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
	[Time] [datetime] NOT NULL,
 CONSTRAINT [PK_tblRecentlyViewed] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblReview]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReview](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[AverageValue] [float] NOT NULL,
	[Text] [nvarchar](max) NULL,
	[Helpful] [int] NOT NULL,
	[Unhelpful] [int] NOT NULL,
	[Time] [datetime] NOT NULL,
 CONSTRAINT [PK_tblReview] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblReviewDetails]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReviewDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReviewId] [int] NOT NULL,
	[ReviewedUserId] [int] NOT NULL,
	[ReviewNature] [int] NOT NULL,
 CONSTRAINT [PK_tblReviewDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblReviewRatingDetails]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReviewRatingDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReviewId] [int] NOT NULL,
	[MasterReviewId] [int] NOT NULL,
	[Value] [float] NOT NULL,
 CONSTRAINT [PK_tblReviewRatingDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUpdatedVideo]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUpdatedVideo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[Link] [nvarchar](100) NOT NULL,
	[Time] [datetime] NOT NULL,
	[Likes] [int] NOT NULL,
	[Dislikes] [int] NOT NULL,
 CONSTRAINT [PK_tblVideo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 6/23/2016 11:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[EmailId] [nvarchar](50) NOT NULL,
	[ProfilePicture] [varchar](50) NULL,
	[Contact] [numeric](12, 0) NULL,
	[Password] [nvarchar](50) NULL,
	[City] [varchar](50) NULL,
	[LevelId] [int] NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tblProject] ADD  CONSTRAINT [DF_tblProject_AverageRating]  DEFAULT ((0)) FOR [AverageRating]
GO
ALTER TABLE [dbo].[tblReview] ADD  CONSTRAINT [DF_tblReview_AverageValue]  DEFAULT ((0)) FOR [AverageValue]
GO
ALTER TABLE [dbo].[tblAmenity]  WITH CHECK ADD  CONSTRAINT [FK_tblMasterAmenity_tblAmenity] FOREIGN KEY([MasterAmenityId])
REFERENCES [dbo].[tblMasterAmenity] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblAmenity] CHECK CONSTRAINT [FK_tblMasterAmenity_tblAmenity]
GO
ALTER TABLE [dbo].[tblAmenity]  WITH CHECK ADD  CONSTRAINT [FK_tblProject_tblAmenity] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[tblProject] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblAmenity] CHECK CONSTRAINT [FK_tblProject_tblAmenity]
GO
ALTER TABLE [dbo].[tblApartmentBuildQuality]  WITH CHECK ADD  CONSTRAINT [FK_tblMasterApartmentBuildQuality_tblApartmentBuildQuality] FOREIGN KEY([MasterApartmentBuildQualityId])
REFERENCES [dbo].[tblMasterApartmentBuildQuality] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblApartmentBuildQuality] CHECK CONSTRAINT [FK_tblMasterApartmentBuildQuality_tblApartmentBuildQuality]
GO
ALTER TABLE [dbo].[tblApartmentBuildQuality]  WITH CHECK ADD  CONSTRAINT [FK_tblProject_tblApartmentBuildQuality] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[tblProject] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblApartmentBuildQuality] CHECK CONSTRAINT [FK_tblProject_tblApartmentBuildQuality]
GO
ALTER TABLE [dbo].[tblAverageRating]  WITH CHECK ADD  CONSTRAINT [FK_tblProject_tblAverageRating] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[tblProject] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblAverageRating] CHECK CONSTRAINT [FK_tblProject_tblAverageRating]
GO
ALTER TABLE [dbo].[tblBuilderProfile]  WITH CHECK ADD  CONSTRAINT [FK_tblMasterBuilderProfile_tblBuilderProfile] FOREIGN KEY([MasterBuilderProfileId])
REFERENCES [dbo].[tblMasterBuilderProfile] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblBuilderProfile] CHECK CONSTRAINT [FK_tblMasterBuilderProfile_tblBuilderProfile]
GO
ALTER TABLE [dbo].[tblBuilderProfile]  WITH CHECK ADD  CONSTRAINT [FK_tblProject_tblBuilderProfile] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[tblProject] ([Id])
GO
ALTER TABLE [dbo].[tblBuilderProfile] CHECK CONSTRAINT [FK_tblProject_tblBuilderProfile]
GO
ALTER TABLE [dbo].[tblConstructionQualityParameter]  WITH CHECK ADD  CONSTRAINT [FK_tblMasterConstructionQualityParameter_tblConstructionQualityParameter] FOREIGN KEY([MasterConstructionQualityParameterId])
REFERENCES [dbo].[tblMasterConstructionQualityParameter] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblConstructionQualityParameter] CHECK CONSTRAINT [FK_tblMasterConstructionQualityParameter_tblConstructionQualityParameter]
GO
ALTER TABLE [dbo].[tblConstructionQualityParameter]  WITH CHECK ADD  CONSTRAINT [FK_tblProject_tblConstructionQualityParameter] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[tblProject] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblConstructionQualityParameter] CHECK CONSTRAINT [FK_tblProject_tblConstructionQualityParameter]
GO
ALTER TABLE [dbo].[tblFollowProject]  WITH CHECK ADD  CONSTRAINT [FK_tblProject_tblFollowProject] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[tblProject] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblFollowProject] CHECK CONSTRAINT [FK_tblProject_tblFollowProject]
GO
ALTER TABLE [dbo].[tblFollowProject]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblFollowProject] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblFollowProject] CHECK CONSTRAINT [FK_tblUser_tblFollowProject]
GO
ALTER TABLE [dbo].[tblImage]  WITH CHECK ADD  CONSTRAINT [FK_tblProject_tblImage] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[tblProject] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblImage] CHECK CONSTRAINT [FK_tblProject_tblImage]
GO
ALTER TABLE [dbo].[tblInappropriate]  WITH CHECK ADD  CONSTRAINT [FK_tblReview_tblInappropriate] FOREIGN KEY([ReviewId])
REFERENCES [dbo].[tblReview] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblInappropriate] CHECK CONSTRAINT [FK_tblReview_tblInappropriate]
GO
ALTER TABLE [dbo].[tblInappropriate]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblInappropriate] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([Id])
GO
ALTER TABLE [dbo].[tblInappropriate] CHECK CONSTRAINT [FK_tblUser_tblInappropriate]
GO
ALTER TABLE [dbo].[tblIntroductoryVideo]  WITH CHECK ADD  CONSTRAINT [FK_tblProject_tblIntroductoryVideo] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[tblProject] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblIntroductoryVideo] CHECK CONSTRAINT [FK_tblProject_tblIntroductoryVideo]
GO
ALTER TABLE [dbo].[tblInventory]  WITH CHECK ADD  CONSTRAINT [FK_tblMasterInventory_tblInventory] FOREIGN KEY([MasterInventoryId])
REFERENCES [dbo].[tblMasterInventory] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblInventory] CHECK CONSTRAINT [FK_tblMasterInventory_tblInventory]
GO
ALTER TABLE [dbo].[tblInventory]  WITH CHECK ADD  CONSTRAINT [FK_tblProject_tblInventory] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[tblProject] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblInventory] CHECK CONSTRAINT [FK_tblProject_tblInventory]
GO
ALTER TABLE [dbo].[tblLegalClarity]  WITH CHECK ADD  CONSTRAINT [FK_tblMasterLegalClarity_tblLegalClarity] FOREIGN KEY([MasterLegalClarityId])
REFERENCES [dbo].[tblMasterLegalClarity] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblLegalClarity] CHECK CONSTRAINT [FK_tblMasterLegalClarity_tblLegalClarity]
GO
ALTER TABLE [dbo].[tblLegalClarity]  WITH CHECK ADD  CONSTRAINT [FK_tblProject_tblLegalClarity] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[tblProject] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblLegalClarity] CHECK CONSTRAINT [FK_tblProject_tblLegalClarity]
GO
ALTER TABLE [dbo].[tblLivability]  WITH CHECK ADD  CONSTRAINT [FK_tblMasterLivability_tblLivability] FOREIGN KEY([MasterLivabilityId])
REFERENCES [dbo].[tblMasterLivability] ([Id])
GO
ALTER TABLE [dbo].[tblLivability] CHECK CONSTRAINT [FK_tblMasterLivability_tblLivability]
GO
ALTER TABLE [dbo].[tblLivability]  WITH CHECK ADD  CONSTRAINT [FK_tblProject_tblLivability] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[tblProject] ([Id])
GO
ALTER TABLE [dbo].[tblLivability] CHECK CONSTRAINT [FK_tblProject_tblLivability]
GO
ALTER TABLE [dbo].[tblLocation]  WITH CHECK ADD  CONSTRAINT [FK_tblCity_tblLocation] FOREIGN KEY([CityId])
REFERENCES [dbo].[tblCity] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblLocation] CHECK CONSTRAINT [FK_tblCity_tblLocation]
GO
ALTER TABLE [dbo].[tblLocation]  WITH CHECK ADD  CONSTRAINT [FK_tblProject_tblLocation] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[tblProject] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblLocation] CHECK CONSTRAINT [FK_tblProject_tblLocation]
GO
ALTER TABLE [dbo].[tblProjectInformation]  WITH CHECK ADD  CONSTRAINT [FK_tblMasterProjectInformation] FOREIGN KEY([MasterProjectInformationId])
REFERENCES [dbo].[tblMasterProjectInformation] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblProjectInformation] CHECK CONSTRAINT [FK_tblMasterProjectInformation]
GO
ALTER TABLE [dbo].[tblProjectInformation]  WITH CHECK ADD  CONSTRAINT [FK_tblProject] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[tblProject] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblProjectInformation] CHECK CONSTRAINT [FK_tblProject]
GO
ALTER TABLE [dbo].[tblRecentlyViewed]  WITH CHECK ADD  CONSTRAINT [FK_tblProject_tblRecentlyViewed] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[tblProject] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblRecentlyViewed] CHECK CONSTRAINT [FK_tblProject_tblRecentlyViewed]
GO
ALTER TABLE [dbo].[tblRecentlyViewed]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblRecentlyViewed] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblRecentlyViewed] CHECK CONSTRAINT [FK_tblUser_tblRecentlyViewed]
GO
ALTER TABLE [dbo].[tblReview]  WITH CHECK ADD  CONSTRAINT [FK_tblProject_tblReview] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[tblProject] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblReview] CHECK CONSTRAINT [FK_tblProject_tblReview]
GO
ALTER TABLE [dbo].[tblReview]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblReview] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblReview] CHECK CONSTRAINT [FK_tblUser_tblReview]
GO
ALTER TABLE [dbo].[tblReviewDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblReview_tblReviewDetails] FOREIGN KEY([ReviewId])
REFERENCES [dbo].[tblReview] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblReviewDetails] CHECK CONSTRAINT [FK_tblReview_tblReviewDetails]
GO
ALTER TABLE [dbo].[tblReviewDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblReviewDetails] FOREIGN KEY([ReviewedUserId])
REFERENCES [dbo].[tblUser] ([Id])
GO
ALTER TABLE [dbo].[tblReviewDetails] CHECK CONSTRAINT [FK_tblUser_tblReviewDetails]
GO
ALTER TABLE [dbo].[tblReviewRatingDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblMasterReview_tblReviewRatingDetails] FOREIGN KEY([MasterReviewId])
REFERENCES [dbo].[tblMasterReview] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblReviewRatingDetails] CHECK CONSTRAINT [FK_tblMasterReview_tblReviewRatingDetails]
GO
ALTER TABLE [dbo].[tblReviewRatingDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblReview_tblReviewRatingDetails] FOREIGN KEY([ReviewId])
REFERENCES [dbo].[tblReview] ([Id])
GO
ALTER TABLE [dbo].[tblReviewRatingDetails] CHECK CONSTRAINT [FK_tblReview_tblReviewRatingDetails]
GO
ALTER TABLE [dbo].[tblUpdatedVideo]  WITH CHECK ADD  CONSTRAINT [FK_tblProject_tblUpdatedVideo] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[tblProject] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblUpdatedVideo] CHECK CONSTRAINT [FK_tblProject_tblUpdatedVideo]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblLevel_tblUser] FOREIGN KEY([LevelId])
REFERENCES [dbo].[tblLevel] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblLevel_tblUser]
GO
USE [master]
GO
ALTER DATABASE [dbRealEstate] SET  READ_WRITE 
GO
