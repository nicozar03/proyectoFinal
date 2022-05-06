USE [master]
GO
/****** Object:  Database [Papelera Vip Database]    Script Date: 6/5/2022 10:35:15 ******/
CREATE DATABASE [Papelera Vip Database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Papelera Vip Database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Papelera Vip Database.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Papelera Vip Database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Papelera Vip Database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Papelera Vip Database] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Papelera Vip Database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Papelera Vip Database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Papelera Vip Database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Papelera Vip Database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Papelera Vip Database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Papelera Vip Database] SET ARITHABORT OFF 
GO
ALTER DATABASE [Papelera Vip Database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Papelera Vip Database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Papelera Vip Database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Papelera Vip Database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Papelera Vip Database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Papelera Vip Database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Papelera Vip Database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Papelera Vip Database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Papelera Vip Database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Papelera Vip Database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Papelera Vip Database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Papelera Vip Database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Papelera Vip Database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Papelera Vip Database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Papelera Vip Database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Papelera Vip Database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Papelera Vip Database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Papelera Vip Database] SET RECOVERY FULL 
GO
ALTER DATABASE [Papelera Vip Database] SET  MULTI_USER 
GO
ALTER DATABASE [Papelera Vip Database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Papelera Vip Database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Papelera Vip Database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Papelera Vip Database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Papelera Vip Database] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Papelera Vip Database', N'ON'
GO
ALTER DATABASE [Papelera Vip Database] SET QUERY_STORE = OFF
GO
USE [Papelera Vip Database]
GO
/****** Object:  User [alumno]    Script Date: 6/5/2022 10:35:15 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 6/5/2022 10:35:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](48) NOT NULL,
	[direccion] [varchar](64) NOT NULL,
	[password] [varchar](16) NOT NULL,
	[mail] [varchar](64) NOT NULL,
 CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 6/5/2022 10:35:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](56) NOT NULL,
	[descripcion] [varchar](80) NOT NULL,
	[foto] [varchar](256) NOT NULL,
	[marca] [varchar](32) NOT NULL,
	[precio] [float] NOT NULL,
	[stock] [int] NOT NULL,
 CONSTRAINT [PK_productos] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Papelera Vip Database] SET  READ_WRITE 
GO
