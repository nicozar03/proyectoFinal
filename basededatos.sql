USE [master]
GO
/****** Object:  Database [Vip Papelera Database]    Script Date: 29/4/2022 11:19:46 ******/
CREATE DATABASE [Vip Papelera Database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Vip Papelera Database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Vip Papelera Database.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Vip Papelera Database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Vip Papelera Database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Vip Papelera Database] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Vip Papelera Database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Vip Papelera Database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Vip Papelera Database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Vip Papelera Database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Vip Papelera Database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Vip Papelera Database] SET ARITHABORT OFF 
GO
ALTER DATABASE [Vip Papelera Database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Vip Papelera Database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Vip Papelera Database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Vip Papelera Database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Vip Papelera Database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Vip Papelera Database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Vip Papelera Database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Vip Papelera Database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Vip Papelera Database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Vip Papelera Database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Vip Papelera Database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Vip Papelera Database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Vip Papelera Database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Vip Papelera Database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Vip Papelera Database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Vip Papelera Database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Vip Papelera Database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Vip Papelera Database] SET RECOVERY FULL 
GO
ALTER DATABASE [Vip Papelera Database] SET  MULTI_USER 
GO
ALTER DATABASE [Vip Papelera Database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Vip Papelera Database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Vip Papelera Database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Vip Papelera Database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Vip Papelera Database] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Vip Papelera Database', N'ON'
GO
ALTER DATABASE [Vip Papelera Database] SET QUERY_STORE = OFF
GO
USE [Vip Papelera Database]
GO
/****** Object:  User [alumno]    Script Date: 29/4/2022 11:19:46 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 29/4/2022 11:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[userId] [int] NOT NULL,
	[Nombre] [nchar](50) NOT NULL,
	[Direccion] [nchar](60) NOT NULL,
	[Password] [varchar](8) NOT NULL,
	[Email] [nchar](60) NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 29/4/2022 11:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Imagen] [varchar](100) NOT NULL,
	[Stock] [int] NOT NULL,
	[Precio] [float] NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Vip Papelera Database] SET  READ_WRITE 
GO
