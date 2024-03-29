USE [master]
GO
/****** Object:  Database [commonCause]    Script Date: 21.08.2019 11:35:42 ******/
CREATE DATABASE [commonCause]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'commonCause', FILENAME = N'D:\projects\C#\CommonCause\db\db.mssql' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'commonCause_log', FILENAME = N'D:\projects\C#\CommonCause\db\db_log.mssql' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [commonCause] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [commonCause].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [commonCause] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [commonCause] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [commonCause] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [commonCause] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [commonCause] SET ARITHABORT OFF 
GO
ALTER DATABASE [commonCause] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [commonCause] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [commonCause] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [commonCause] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [commonCause] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [commonCause] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [commonCause] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [commonCause] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [commonCause] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [commonCause] SET  DISABLE_BROKER 
GO
ALTER DATABASE [commonCause] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [commonCause] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [commonCause] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [commonCause] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [commonCause] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [commonCause] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [commonCause] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [commonCause] SET RECOVERY FULL 
GO
ALTER DATABASE [commonCause] SET  MULTI_USER 
GO
ALTER DATABASE [commonCause] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [commonCause] SET DB_CHAINING OFF 
GO
ALTER DATABASE [commonCause] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [commonCause] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [commonCause] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'commonCause', N'ON'
GO
USE [commonCause]
GO
/****** Object:  Table [dbo].[cities]    Script Date: 21.08.2019 11:35:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cities](
	[id_city] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](100) NOT NULL,
	[id_region] [int] NOT NULL,
 CONSTRAINT [PK_cities] PRIMARY KEY CLUSTERED 
(
	[id_city] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[establishments]    Script Date: 21.08.2019 11:35:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[establishments](
	[id_establishment] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](500) NOT NULL,
	[id_type] [int] NOT NULL,
	[id_city] [int] NOT NULL,
	[contact_info] [nchar](1000) NOT NULL,
 CONSTRAINT [PK_establishments] PRIMARY KEY CLUSTERED 
(
	[id_establishment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[groups]    Script Date: 21.08.2019 11:35:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[groups](
	[id_group] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](100) NOT NULL,
	[id_establishment] [int] NOT NULL,
 CONSTRAINT [PK_groups] PRIMARY KEY CLUSTERED 
(
	[id_group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[lessons]    Script Date: 21.08.2019 11:35:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lessons](
	[id_lesson] [int] IDENTITY(1,1) NOT NULL,
	[id_establishment] [int] NOT NULL,
	[id_group] [int] NOT NULL,
	[id_topic] [int] NOT NULL,
	[begin_lesson] [datetime] NOT NULL,
	[end_lesson] [datetime] NULL,
	[id_teacher] [int] NOT NULL,
	[status] [bit] NULL,
	[descript] [nchar](1000) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[regions]    Script Date: 21.08.2019 11:35:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[regions](
	[id_region] [int] IDENTITY(1,1) NOT NULL,
	[id_parent] [int] NULL,
	[name] [nchar](100) NOT NULL,
 CONSTRAINT [PK_regions] PRIMARY KEY CLUSTERED 
(
	[id_region] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[roles]    Script Date: 21.08.2019 11:35:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id_role] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](100) NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[id_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[teachers]    Script Date: 21.08.2019 11:35:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teachers](
	[id_teacher] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](100) NOT NULL,
 CONSTRAINT [PK_teachers] PRIMARY KEY CLUSTERED 
(
	[id_teacher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[topics]    Script Date: 21.08.2019 11:35:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[topics](
	[id_topic] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](100) NOT NULL,
	[descript] [nchar](1000) NOT NULL,
 CONSTRAINT [PK_topics] PRIMARY KEY CLUSTERED 
(
	[id_topic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[type_establishments]    Script Date: 21.08.2019 11:35:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type_establishments](
	[id_type_establishment] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](100) NOT NULL,
 CONSTRAINT [PK_type_establishments] PRIMARY KEY CLUSTERED 
(
	[id_type_establishment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 21.08.2019 11:35:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](100) NOT NULL,
	[id_role] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[cities]  WITH CHECK ADD  CONSTRAINT [FK_cities_regions] FOREIGN KEY([id_region])
REFERENCES [dbo].[regions] ([id_region])
GO
ALTER TABLE [dbo].[cities] CHECK CONSTRAINT [FK_cities_regions]
GO
ALTER TABLE [dbo].[establishments]  WITH CHECK ADD  CONSTRAINT [FK_establishments_cities] FOREIGN KEY([id_city])
REFERENCES [dbo].[cities] ([id_city])
GO
ALTER TABLE [dbo].[establishments] CHECK CONSTRAINT [FK_establishments_cities]
GO
ALTER TABLE [dbo].[establishments]  WITH CHECK ADD  CONSTRAINT [FK_establishments_type_establishments] FOREIGN KEY([id_type])
REFERENCES [dbo].[type_establishments] ([id_type_establishment])
GO
ALTER TABLE [dbo].[establishments] CHECK CONSTRAINT [FK_establishments_type_establishments]
GO
ALTER TABLE [dbo].[groups]  WITH CHECK ADD  CONSTRAINT [FK_groups_establishments] FOREIGN KEY([id_establishment])
REFERENCES [dbo].[establishments] ([id_establishment])
GO
ALTER TABLE [dbo].[groups] CHECK CONSTRAINT [FK_groups_establishments]
GO
ALTER TABLE [dbo].[lessons]  WITH CHECK ADD  CONSTRAINT [FK_lessons_establishments] FOREIGN KEY([id_establishment])
REFERENCES [dbo].[establishments] ([id_establishment])
GO
ALTER TABLE [dbo].[lessons] CHECK CONSTRAINT [FK_lessons_establishments]
GO
ALTER TABLE [dbo].[lessons]  WITH CHECK ADD  CONSTRAINT [FK_lessons_groups] FOREIGN KEY([id_group])
REFERENCES [dbo].[groups] ([id_group])
GO
ALTER TABLE [dbo].[lessons] CHECK CONSTRAINT [FK_lessons_groups]
GO
ALTER TABLE [dbo].[lessons]  WITH CHECK ADD  CONSTRAINT [FK_lessons_teachers] FOREIGN KEY([id_teacher])
REFERENCES [dbo].[teachers] ([id_teacher])
GO
ALTER TABLE [dbo].[lessons] CHECK CONSTRAINT [FK_lessons_teachers]
GO
ALTER TABLE [dbo].[lessons]  WITH CHECK ADD  CONSTRAINT [FK_lessons_topics] FOREIGN KEY([id_topic])
REFERENCES [dbo].[topics] ([id_topic])
GO
ALTER TABLE [dbo].[lessons] CHECK CONSTRAINT [FK_lessons_topics]
GO
ALTER TABLE [dbo].[regions]  WITH CHECK ADD  CONSTRAINT [FK_regions_regions] FOREIGN KEY([id_parent])
REFERENCES [dbo].[regions] ([id_region])
GO
ALTER TABLE [dbo].[regions] CHECK CONSTRAINT [FK_regions_regions]
GO
USE [master]
GO
ALTER DATABASE [commonCause] SET  READ_WRITE 
GO
