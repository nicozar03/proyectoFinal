USE [master]
GO
/****** Object:  Database [papeleraVipDatabase]    Script Date: 1/7/2022 10:32:05 ******/
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
/****** Object:  User [alumno]    Script Date: 1/7/2022 10:32:05 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[categorias]    Script Date: 1/7/2022 10:32:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categorias](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_categorias] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 1/7/2022 10:32:05 ******/
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
/****** Object:  Table [dbo].[productos]    Script Date: 1/7/2022 10:32:05 ******/
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
	[idCategoria] [int] NULL,
 CONSTRAINT [PK_productos] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[categorias] ON 

INSERT [dbo].[categorias] ([idCategoria], [nombre]) VALUES (1, N'cuadernos')
INSERT [dbo].[categorias] ([idCategoria], [nombre]) VALUES (2, N'lapices')
INSERT [dbo].[categorias] ([idCategoria], [nombre]) VALUES (3, N'reglas')
INSERT [dbo].[categorias] ([idCategoria], [nombre]) VALUES (4, N'lapiceras')
INSERT [dbo].[categorias] ([idCategoria], [nombre]) VALUES (5, N'marcadores')
INSERT [dbo].[categorias] ([idCategoria], [nombre]) VALUES (6, N'hojas')
INSERT [dbo].[categorias] ([idCategoria], [nombre]) VALUES (7, N'cartulinas')
INSERT [dbo].[categorias] ([idCategoria], [nombre]) VALUES (8, N'gomas')
INSERT [dbo].[categorias] ([idCategoria], [nombre]) VALUES (9, N'resaltadores')
INSERT [dbo].[categorias] ([idCategoria], [nombre]) VALUES (10, N'tijeras')
INSERT [dbo].[categorias] ([idCategoria], [nombre]) VALUES (11, N'cartuchos')
INSERT [dbo].[categorias] ([idCategoria], [nombre]) VALUES (12, N'toners')
INSERT [dbo].[categorias] ([idCategoria], [nombre]) VALUES (13, N'mouse y teclado')
INSERT [dbo].[categorias] ([idCategoria], [nombre]) VALUES (14, N'cuaderno de caligrafia')
INSERT [dbo].[categorias] ([idCategoria], [nombre]) VALUES (15, N'escuadras')
INSERT [dbo].[categorias] ([idCategoria], [nombre]) VALUES (16, N'lapices graduados')
INSERT [dbo].[categorias] ([idCategoria], [nombre]) VALUES (17, N'transportadores')
INSERT [dbo].[categorias] ([idCategoria], [nombre]) VALUES (18, N'adhesivo')
SET IDENTITY_INSERT [dbo].[categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[clientes] ON 

INSERT [dbo].[clientes] ([idCliente], [nombre], [direccion], [password], [mail]) VALUES (1, N'David Canovas', N'Bulnes 3060', N'David1234', N'davidcanovas@gmail.com')
INSERT [dbo].[clientes] ([idCliente], [nombre], [direccion], [password], [mail]) VALUES (4, N'Martin perez disalvo', N'Humboldt 1141', N'CoscuArmy', N'coscu@gmail.com')
INSERT [dbo].[clientes] ([idCliente], [nombre], [direccion], [password], [mail]) VALUES (5, N'Uriel Rabih', N'Yatay 240', N'RABIH', N'urielcarlosrabih@gmail.com')
SET IDENTITY_INSERT [dbo].[clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[productos] ON 

INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idCategoria]) VALUES (3, N'Voligoma', N'Adhesivo Sintético Voligoma Original 30ml Por Unidad', N'https://inkgenio.com.ar/2291-large_default/voligoma-x-30-ml.jpg', N'POXIPOL', 107, 47, 1, 18)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idCategoria]) VALUES (4, N'Lapicera Filgo Fast Track', N' Bolígrafo retráctil con tinta suave a base de aceite', N'https://filgo.com.ar/uploads/imgynisV5ayW.png', N'Filgo', 60, 50, 1, 4)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idCategoria]) VALUES (6, N'Cuaderno Exito Tapa dura 48 hojas', N'Cuaderno Exito Tapa Dura 48 Hojas Lunares O Colores Araña', N'https://http2.mlstatic.com/D_NQ_NP_600526-MLA46183181176_052021-O.jpg', N'Éxito', 500, 13, 1, 1)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idCategoria]) VALUES (15, N'Globo terraqueo  Gloter Elbrus', N'Globo Terráqueo Elbrus
-Globo terráqueo con base de madera
-Altura: 42 cm
-Diametro: 30 cm
-Peso: 1,225 gr
-Base: Madera
-Ideal decoración, hogar, oficinas
Marca: Gloter
Origen: Argentina', N'https://cdn.shopify.com/s/files/1/1086/1234/products/257W_opt_1024x1024.jpg?v=1579740224', N' Gloter Elbrus', 16000, 1, 0, NULL)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idCategoria]) VALUES (16, N'Cuaderno Rivadavia Abc Espiralado 100h Rayado', N'Cuaderno ABC con Espiral Tapa Cartón x 100 hojas Rayadas

Formato 21 x 27cm
Hojas rayadas, sin perforar ni micropuntillar.
Diseños de tapas no elegibles.', N'https://d3ugyf2ht6aenh.cloudfront.net/stores/001/398/366/products/cuaderno-rivadavia-abc-espiralado-x100h-pack-x5-d_nq_np_898125-mla25375422554_022017-f1-9a987ba3b7097a47ba15478488850974-1024-102421-6de97cc4d08cd778a316062236436449-1024-1024.jpg', N'Rivadavia', 1069, 10, 0, 1)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idCategoria]) VALUES (22, N'Lapicera Roller Simball Genio Plus Tinta borrable Azul', N'Lapicera Roller Simball Genio Plus Tinta borrable Azul', N'https://www.lahorquetacopy.com.ar/wp-content/uploads/Lapicera-Roller-Simball-Genio-Plus-Tinta-borrable-Azul.jpg', N'Simball', 250, 15, 0, 4)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idCategoria]) VALUES (23, N'Lapicera BIC trazo medio AZUL', N'Lapicera BIC trazo medio AZUL', N'https://www.bikabik.com.ar/wp-content/uploads/2020/07/boligrafo-bic-azul-trazo-grueso-1mm-opaco-x50-unid-D_NQ_NP_897138-MLA31037651428_062019-F-min.jpg', N'BIC', 80, 13, 0, 4)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idCategoria]) VALUES (24, N'Block Anotador Congreso A5 40 Hojas Rayado', N'Block anotador Congreso

Rayado - 40 Hojas - Papel Obra 70 g- 160x210 mm
', N'https://http2.mlstatic.com/D_NQ_NP_917831-MLA48956532675_012022-O.webp', N'Congreso', 230, 14, 0, 6)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idCategoria]) VALUES (25, N'LAPIZ GRAFITO STAEDTLER TRADITION HB', N'LAPIZ GRAFITO STAEDTLER TRADITION HB', N'https://unipack.com.ar/wp-content/uploads/2018/01/LAPTRADHB.jpg', N'STAEDTLER', 249, 12, 0, 2)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idCategoria]) VALUES (34, N'Regla Galleti 30 Cm 100% Acrílico Grabada Transparente', N'Ideal para trabajos de dibujo técnico, arquitectura o trabajos artísticos
estas reglas se destacan por ser 100% de acrílico y los números están grabados sobre el mismo permitiendo así, su conservación en el tiempo.

• Marca: Galetti
• Largo: 30 cm
•', N'https://http2.mlstatic.com/D_NQ_NP_827663-MLA41138443283_032020-O.webp', N'Galleti', 330, 10, 0, 3)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idCategoria]) VALUES (38, N'Marcadores Touch Star Linea Clasica X 36 Unidades', N'Son permanentes, cada uno tiene punta amplia y punta fina, lo que le permite dibujar trazos gruesos y delgados, diseñados para durar y no desvanecerse fácilmente.', N'https://http2.mlstatic.com/D_NQ_NP_710546-MLA48366220616_112021-O.webp', N'Touch Star', 3745, 14, 0, 5)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idCategoria]) VALUES (40, N'Set Resaltadores Trabi Pasteles + Fluo / 18 Unidades
', N'Set Resaltadores Trabi Pasteles + Fluo / 18 Unidades
', N'https://http2.mlstatic.com/D_NQ_NP_998939-MLA46760026026_072021-O.webp', N'Trabi', 1799, 18, 0, 9)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idCategoria]) VALUES (41, N'Tijera Escolar Maped Cosmic Kids 13 Cm', N'Tijera Escolar Maped Cosmic Kids', N'https://http2.mlstatic.com/D_NQ_NP_739467-MLA48889057239_012022-O.webp', N'Maped', 319, 20, 0, 10)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idCategoria]) VALUES (50, N'Cartulina Escolar Luma 45x63cm Varios Colores ', N'Cartulina Escolar Luma 45x63cm Varios Colores Calidad X 10un', N'https://http2.mlstatic.com/D_NQ_NP_754069-MLA47327725304_092021-O.webp', N'Luma', 500, 16, 0, 7)
SET IDENTITY_INSERT [dbo].[productos] OFF
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD  CONSTRAINT [FK_productos_categorias] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[categorias] ([idCategoria])
GO
ALTER TABLE [dbo].[productos] CHECK CONSTRAINT [FK_productos_categorias]
GO
USE [master]
GO
ALTER DATABASE [papeleraVipDatabase] SET  READ_WRITE 
GO
