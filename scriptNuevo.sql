USE [master]
GO
/****** Object:  Database [papeleraVipDatabase]    Script Date: 20/5/2022 10:20:53 ******/
CREATE DATABASE [papeleraVipDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'papeleraVipDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\papeleraVipDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'papeleraVipDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\papeleraVipDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [papeleraVipDatabase] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [papeleraVipDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [papeleraVipDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [papeleraVipDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [papeleraVipDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [papeleraVipDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [papeleraVipDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [papeleraVipDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [papeleraVipDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [papeleraVipDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [papeleraVipDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [papeleraVipDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'papeleraVipDatabase', N'ON'
GO
ALTER DATABASE [papeleraVipDatabase] SET QUERY_STORE = OFF
GO
USE [papeleraVipDatabase]
GO
/****** Object:  User [alumno]    Script Date: 20/5/2022 10:20:53 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 20/5/2022 10:20:53 ******/
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
/****** Object:  Table [dbo].[productos]    Script Date: 20/5/2022 10:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](56) NOT NULL,
	[descripcion] [varchar](256) NULL,
	[foto] [varchar](256) NOT NULL,
	[marca] [varchar](32) NOT NULL,
	[precio] [float] NOT NULL,
	[stock] [int] NOT NULL,
	[destacado] [bit] NULL,
 CONSTRAINT [PK_productos] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[clientes] ON 

INSERT [dbo].[clientes] ([idCliente], [nombre], [direccion], [password], [mail]) VALUES (1, N'David Canovas', N'Bulnes 3060', N'David1234', N'davidcanovas@gmail.com')
INSERT [dbo].[clientes] ([idCliente], [nombre], [direccion], [password], [mail]) VALUES (4, N'Martin perez disalvo', N'Humboldt 1141', N'CoscuArmy', N'coscu@gmail.com')
INSERT [dbo].[clientes] ([idCliente], [nombre], [direccion], [password], [mail]) VALUES (5, N'Uriel Rabih', N'Yatay 240', N'RABIH', N'urielcarlosrabih@gmail.com')
SET IDENTITY_INSERT [dbo].[clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[productos] ON 

INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado]) VALUES (3, N'Voligoma', N'Adhesivo Sintético Voligoma Original 30ml Por Unidad', N'https://inkgenio.com.ar/2291-large_default/voligoma-x-30-ml.jpg', N'POXIPOL', 107, 47, 1)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado]) VALUES (4, N'Lapicera Filgo Fast Track', N' Bolígrafo retráctil con tinta suave a base de aceite', N'https://filgo.com.ar/uploads/imgynisV5ayW.png', N'Filgo', 60, 50, 1)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado]) VALUES (6, N'Cuaderno Exito Tapa dura 48 hojas', N'Cuaderno Exito Tapa Dura 48 Hojas Lunares O Colores Araña', N'https://http2.mlstatic.com/D_NQ_NP_600526-MLA46183181176_052021-O.jpg', N'Éxito', 500, 13, 1)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado]) VALUES (15, N'Globo terraqueo  Gloter Elbrus', N'Globo Terráqueo Elbrus
-Globo terráqueo con base de madera
-Altura: 42 cm
-Diametro: 30 cm
-Peso: 1,225 gr
-Base: Madera
-Ideal decoración, hogar, oficinas
Marca: Gloter
Origen: Argentina', N'https://cdn.shopify.com/s/files/1/1086/1234/products/257W_opt_1024x1024.jpg?v=1579740224', N' Gloter Elbrus', 16000, 1, 0)
SET IDENTITY_INSERT [dbo].[productos] OFF
GO
USE [master]
GO
ALTER DATABASE [papeleraVipDatabase] SET  READ_WRITE 
GO
