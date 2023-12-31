USE [master]
GO
/****** Object:  Database [TP 9 - Ecommerce]    Script Date: 19/11/2020 16:13:03 ******/
CREATE DATABASE [TP 9 - Ecommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TP 9 - Ecommerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\TP 9 - Ecommerce.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TP 9 - Ecommerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\TP 9 - Ecommerce_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TP 9 - Ecommerce] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TP 9 - Ecommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TP 9 - Ecommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET  MULTI_USER 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TP 9 - Ecommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TP 9 - Ecommerce] SET QUERY_STORE = OFF
GO
USE [TP 9 - Ecommerce]
GO
/****** Object:  Table [dbo].[AuditoriaReal]    Script Date: 19/11/2020 16:13:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditoriaReal](
	[IdAuditoria] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Tabla] [varchar](50) NOT NULL,
	[FechaHora] [datetime] NULL,
	[Campo] [varchar](50) NOT NULL,
	[AccionRealizada] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AuditoriaReal] PRIMARY KEY CLUSTERED 
(
	[IdAuditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 19/11/2020 16:13:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compras](
	[IdCompra] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NULL,
	[ImporteFinal] [float] NOT NULL,
 CONSTRAINT [PK_Compras] PRIMARY KEY CLUSTERED 
(
	[IdCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleCompra]    Script Date: 19/11/2020 16:13:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleCompra](
	[Importe] [float] NOT NULL,
	[Stock] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[IdCompra] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 19/11/2020 16:13:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[IdRubro] [int] NOT NULL,
	[Imagen] [varchar](50) NULL,
	[Titulo] [varchar](100) NOT NULL,
	[Descripcion] [varchar](300) NULL,
	[Importe] [float] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rubros]    Script Date: 19/11/2020 16:13:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rubros](
	[IdRubro] [int] IDENTITY(1,1) NOT NULL,
	[Icono] [varchar](50) NULL,
	[nombreRubro] [varchar](50) NULL,
 CONSTRAINT [PK_Rubros] PRIMARY KEY CLUSTERED 
(
	[IdRubro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 19/11/2020 16:13:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](150) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AuditoriaReal] ON 

INSERT [dbo].[AuditoriaReal] ([IdAuditoria], [IdUsuario], [Tabla], [FechaHora], [Campo], [AccionRealizada]) VALUES (2, 1, N'Rubros', CAST(N'2020-11-19T16:07:59.157' AS DateTime), N'3', N'UPDATE')
INSERT [dbo].[AuditoriaReal] ([IdAuditoria], [IdUsuario], [Tabla], [FechaHora], [Campo], [AccionRealizada]) VALUES (3, 1, N'Rubros', CAST(N'2020-11-19T16:08:57.167' AS DateTime), N'2', N'UPDATE')
INSERT [dbo].[AuditoriaReal] ([IdAuditoria], [IdUsuario], [Tabla], [FechaHora], [Campo], [AccionRealizada]) VALUES (4, 1, N'Rubros', CAST(N'2020-11-19T16:09:01.497' AS DateTime), N'3', N'UPDATE')
INSERT [dbo].[AuditoriaReal] ([IdAuditoria], [IdUsuario], [Tabla], [FechaHora], [Campo], [AccionRealizada]) VALUES (5, 1, N'Rubros', CAST(N'2020-11-19T16:09:24.343' AS DateTime), N'3', N'UPDATE')
SET IDENTITY_INSERT [dbo].[AuditoriaReal] OFF
GO
SET IDENTITY_INSERT [dbo].[Compras] ON 

INSERT [dbo].[Compras] ([IdCompra], [Fecha], [ImporteFinal]) VALUES (1, CAST(N'2020-01-25' AS Date), 1690)
INSERT [dbo].[Compras] ([IdCompra], [Fecha], [ImporteFinal]) VALUES (2, CAST(N'2020-09-01' AS Date), 1690)
INSERT [dbo].[Compras] ([IdCompra], [Fecha], [ImporteFinal]) VALUES (3, CAST(N'2020-03-16' AS Date), 1690)
INSERT [dbo].[Compras] ([IdCompra], [Fecha], [ImporteFinal]) VALUES (4, CAST(N'2020-11-13' AS Date), 6990)
INSERT [dbo].[Compras] ([IdCompra], [Fecha], [ImporteFinal]) VALUES (5, CAST(N'2020-10-03' AS Date), 2590)
SET IDENTITY_INSERT [dbo].[Compras] OFF
GO
INSERT [dbo].[DetalleCompra] ([Importe], [Stock], [IdProducto], [IdCompra]) VALUES (1690, 1, 17, 1)
INSERT [dbo].[DetalleCompra] ([Importe], [Stock], [IdProducto], [IdCompra]) VALUES (1690, 1, 17, 2)
INSERT [dbo].[DetalleCompra] ([Importe], [Stock], [IdProducto], [IdCompra]) VALUES (1690, 1, 17, 3)
INSERT [dbo].[DetalleCompra] ([Importe], [Stock], [IdProducto], [IdCompra]) VALUES (6990, 1, 12, 4)
INSERT [dbo].[DetalleCompra] ([Importe], [Stock], [IdProducto], [IdCompra]) VALUES (2590, 1, 1, 5)
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([IdProducto], [IdRubro], [Imagen], [Titulo], [Descripcion], [Importe], [Cantidad]) VALUES (1, 1, N'aritosa.jpg', N'Aritos Abridores', N'Aritos Abridores bañados en oro y plata diseñados en el sur de Italia.', 2590, 10)
INSERT [dbo].[Productos] ([IdProducto], [IdRubro], [Imagen], [Titulo], [Descripcion], [Importe], [Cantidad]) VALUES (2, 1, N'indian.jpg', N'Pulseras indian', N'Pulseras de oro diseñadas en la India por diseñadores de primera clase.', 3590, 5)
INSERT [dbo].[Productos] ([IdProducto], [IdRubro], [Imagen], [Titulo], [Descripcion], [Importe], [Cantidad]) VALUES (3, 1, N'aritosrg.jpg', N'Aritos Rose Gold', N'Aritos de oro carmin, con sentellos de oro blanco fabricados en Italia.', 2990, 2)
INSERT [dbo].[Productos] ([IdProducto], [IdRubro], [Imagen], [Titulo], [Descripcion], [Importe], [Cantidad]) VALUES (4, 1, N'aritosaq.jpg', N'Aritos Acero Quirurgico', N'Aritos de Acero Quirurgico bañados en oro y plata.', 2590, 6)
INSERT [dbo].[Productos] ([IdProducto], [IdRubro], [Imagen], [Titulo], [Descripcion], [Importe], [Cantidad]) VALUES (5, 1, N'hebillasmr.jpg', N'Hebillas Marmol Rose', N'Hebillas tamaños chico y mediano de color Marmol Rose y Light Rose.', 1990, 2)
INSERT [dbo].[Productos] ([IdProducto], [IdRubro], [Imagen], [Titulo], [Descripcion], [Importe], [Cantidad]) VALUES (6, 1, N'pulserasop.jpg', N'Pulseras oro y plata', N'ulseras enchapadas de oro y plata diseñadas en Italia, regulables.', 2590, 6)
INSERT [dbo].[Productos] ([IdProducto], [IdRubro], [Imagen], [Titulo], [Descripcion], [Importe], [Cantidad]) VALUES (7, 2, N'moonlight.jpg', N'Vestido Moonlight', N'Vestido de tirantes corte A, de color negro, hasta la rodilla, talles
                        XS, XL.', 7990, 2)
INSERT [dbo].[Productos] ([IdProducto], [IdRubro], [Imagen], [Titulo], [Descripcion], [Importe], [Cantidad]) VALUES (8, 2, N'cebra.jpg', N'Vestido Cebra Corte V', N'Vestido estampado cebra, corte V, manga larga suelto, talles
                        XS, S, M, L, XL.', 4590, 20)
INSERT [dbo].[Productos] ([IdProducto], [IdRubro], [Imagen], [Titulo], [Descripcion], [Importe], [Cantidad]) VALUES (9, 2, N'verdemusgo.jpg', N'Vestido Verde Musgo Corte V', N'Vestido estampado musgoso, corte V, manga corta con bolsillos en la cintura, talles
                        S, L, XL.', 5190, 1)
INSERT [dbo].[Productos] ([IdProducto], [IdRubro], [Imagen], [Titulo], [Descripcion], [Importe], [Cantidad]) VALUES (11, 2, N'voladospuntos.jpg', N'Vestido de Volados y Puntos', N'Vestido de Volados, manga larga, corte V, color beige/rosa, con puntos
                    negros, talles S, M, L.', 6990, 2)
INSERT [dbo].[Productos] ([IdProducto], [IdRubro], [Imagen], [Titulo], [Descripcion], [Importe], [Cantidad]) VALUES (12, 2, N'blancomg.jpg', N'Vestido Blando Manga Larga', N'Vestido Blanco Manga Laga de Tela gruesa, corte cuello alto, talles S, 
                    M, L, XL.', 6990, 5)
INSERT [dbo].[Productos] ([IdProducto], [IdRubro], [Imagen], [Titulo], [Descripcion], [Importe], [Cantidad]) VALUES (13, 2, N'azulmarino.jpg', N'Vestido Azul Marino Corte V', N'Vestido Azul Marino, corte en V con volados, de tela fina, 
                    talles, XS, S, L, XL.', 5190, 2)
INSERT [dbo].[Productos] ([IdProducto], [IdRubro], [Imagen], [Titulo], [Descripcion], [Importe], [Cantidad]) VALUES (14, 3, N'tirantes.jpg', N'Remera de Tirantes Lisa', N'Remera de tirantes lisa, corte A, suelta, tela fina, color beige, talles,
                        XS, S, M, L, XL.', 2990, 6)
INSERT [dbo].[Productos] ([IdProducto], [IdRubro], [Imagen], [Titulo], [Descripcion], [Importe], [Cantidad]) VALUES (15, 3, N'lisaverde.jpg', N'Remera lisa Verde', N'Remera lisa, manga corta, corte A, color verde opaco, talles S, M, L', 1190, 8)
INSERT [dbo].[Productos] ([IdProducto], [IdRubro], [Imagen], [Titulo], [Descripcion], [Importe], [Cantidad]) VALUES (16, 3, N'voladosmicrotul.jpg', N'Remera de volados microtul rosa', N'Remera, manga 3/4 de tela microtul, semitransparente, color rosa, talles,
                        XS, M, L, XL.', 2990, 6)
INSERT [dbo].[Productos] ([IdProducto], [IdRubro], [Imagen], [Titulo], [Descripcion], [Importe], [Cantidad]) VALUES (17, 3, N'camouflage.jpg', N'Remera camouflage', N'Remera de estampado camouflage, manga larga, tela gruesa
                    talles, XS, S, M, L, XL.', 1690, 0)
INSERT [dbo].[Productos] ([IdProducto], [IdRubro], [Imagen], [Titulo], [Descripcion], [Importe], [Cantidad]) VALUES (18, 3, N'lazobeige.jpg', N'Remera con lazo beige', N'Remera con lazo beige corte al cuello, manga corta, talles, S, 
                    M, L, XL.', 1590, 2)
INSERT [dbo].[Productos] ([IdProducto], [IdRubro], [Imagen], [Titulo], [Descripcion], [Importe], [Cantidad]) VALUES (19, 3, N'sinmangaslisa.jpg', N'Remera sin mangas lila', N'Remera sin mangas, cuello alto, pegada al cuerpo, color lila, talles, 
                    XS, S, M, L, XL.', 1590, 7)
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Rubros] ON 

INSERT [dbo].[Rubros] ([IdRubro], [Icono], [nombreRubro]) VALUES (1, N'accesorios.jpg', N'Accesorios')
INSERT [dbo].[Rubros] ([IdRubro], [Icono], [nombreRubro]) VALUES (2, N'vestidos.jpg', N'Vestidos')
INSERT [dbo].[Rubros] ([IdRubro], [Icono], [nombreRubro]) VALUES (3, N'remeras.jpg', N'Remeras')
SET IDENTITY_INSERT [dbo].[Rubros] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre]) VALUES (1, N'Marina')
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre]) VALUES (2, N'Angela')
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre]) VALUES (3, N'Belen')
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre]) VALUES (4, N'Leo')
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre]) VALUES (5, N'Ezequiel')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[AuditoriaReal]  WITH CHECK ADD  CONSTRAINT [FK_AuditoriaReal_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[AuditoriaReal] CHECK CONSTRAINT [FK_AuditoriaReal_Usuarios]
GO
ALTER TABLE [dbo].[DetalleCompra]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCompra_Compras] FOREIGN KEY([IdCompra])
REFERENCES [dbo].[Compras] ([IdCompra])
GO
ALTER TABLE [dbo].[DetalleCompra] CHECK CONSTRAINT [FK_DetalleCompra_Compras]
GO
ALTER TABLE [dbo].[DetalleCompra]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCompra_Productos] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
ALTER TABLE [dbo].[DetalleCompra] CHECK CONSTRAINT [FK_DetalleCompra_Productos]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Rubros] FOREIGN KEY([IdRubro])
REFERENCES [dbo].[Rubros] ([IdRubro])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Rubros]
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarProducto]    Script Date: 19/11/2020 16:13:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_EliminarProducto]
	@idProducto int
AS
BEGIN
DELETE FROM Productos
WHERE idProducto=@idProducto
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarRubro]    Script Date: 19/11/2020 16:13:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_EliminarRubro]
	@idRubro int
AS
BEGIN
DELETE FROM Rubros
WHERE idRubro=@idRubro
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarProducto]    Script Date: 19/11/2020 16:13:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertarProducto]
	-- Add the parameters for the stored procedure here
	@IdRubro int, @imagen varchar(50), @titulo varchar(100), @descripcion varchar(300), @importe float, @cant int
AS
BEGIN
	INSERT INTO Productos (IdRubro, Imagen, Titulo, Descripcion, Importe, Cantidad)
	VALUES ( @IdRubro, @imagen, @titulo, @descripcion, @importe, @cant)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarRubro]    Script Date: 19/11/2020 16:13:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertarRubro]
	-- Add the parameters for the stored procedure here
	@Icono varchar(50), @nombreRubro varchar(50)
AS
BEGIN
	INSERT INTO Rubros (Icono, nombreRubro)
	VALUES ( @Icono, @nombreRubro)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarProductos]    Script Date: 19/11/2020 16:13:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ListarProductos]
	@idProducto int, @idRubro int
AS
BEGIN
SELECT Productos.*
	FROM Productos 
	LEFT JOIN Rubros On Rubros.IdRubro = Productos.IdRubro
	Where (Rubros.IdRubro = @idRubro OR @idRubro IS NULL) AND (Productos.IdProducto = @idProducto OR @IdProducto IS NULL)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarRubros]    Script Date: 19/11/2020 16:13:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ListarRubros]
	@IdRubro int
AS
BEGIN
	SELECT Productos.*
	FROM Productos
	LEFT JOIN Rubros On Rubros.IdRubro = Productos.IdRubro
	Where (Rubros.IdRubro = @idRubro OR @idRubro IS NULL)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarProducto]    Script Date: 19/11/2020 16:13:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ModificarProducto]
	-- Add the parameters for the stored procedure here
@IdProducto int,
@IdRubro int,
@Imagen varchar(50),
@Titulo varchar(100),
@Descripcion varchar(300),
@Importe float,
@Cantidad int

AS
BEGIN

Update Productos
SET IdRubro=@IdRubro,
	Imagen = @Imagen,
	Titulo= @Titulo,
	Descripcion = @Descripcion,
	Importe= @Importe,
	Cantidad= @Cantidad
WHERE IdProducto = @IdProducto
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarRubro]    Script Date: 19/11/2020 16:13:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ModificarRubro]
	-- Add the parameters for the stored procedure here
@IdRubro int,
@Icono varchar(50),
@nombreRubro varchar(50)

AS
BEGIN

Update Rubros
SET Icono=@Icono,
	nombreRubro = @nombreRubro
WHERE IdRubro = @IdRubro
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarCompra]    Script Date: 19/11/2020 16:13:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RegistrarCompra] 
	-- Add the parameters for the stored procedure here
	@Fecha date, @ImporteFinal float
AS
BEGIN
	INSERT INTO Compras (Fecha, ImporteFinal)
	VALUES ( @Fecha, @ImporteFinal)
	SELECT @@IDENTITY
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarDetalleCompra]    Script Date: 19/11/2020 16:13:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RegistrarDetalleCompra] 
	-- Add the parameters for the stored procedure here
	@Importe float, @Stock int, @IdProducto int, @IdCompra int
AS
BEGIN
	INSERT INTO DetalleCompra(Importe, Stock, IdProducto, IdCompra)
	VALUES (@Importe, @Stock, @IdProducto, @IdCompra)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_VerAuditoria]    Script Date: 19/11/2020 16:13:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_VerAuditoria]
	-- Add the parameters for the stored procedure here
@IdAuditoria int, 
@IdUsuario int, 
@Tabla Varchar(50), 
@FechaHora datetime, 
@Campo Varchar(50), 
@AccionRealizada Varchar(50)

AS
BEGIN
SELECT AuditoriaReal.*
FROM AuditoriaReal 
WHERE (AuditoriaReal.IdAuditoria = @IdAuditoria OR @IdAuditoria IS NULL)
        AND (AuditoriaReal.IdUsuario = @IdUsuario OR @IdUsuario IS NULL)
        AND (AuditoriaReal.Tabla = @Tabla OR @Tabla IS NULL)
        AND (AuditoriaReal.FechaHora = @FechaHora OR @FechaHora IS NULL)
        AND (AuditoriaReal.Campo = @Campo OR @Campo IS NULL)
		AND (AuditoriaReal.AccionRealizada = @AccionRealizada OR @AccionRealizada IS NULL)
END
GO
USE [master]
GO
ALTER DATABASE [TP 9 - Ecommerce] SET  READ_WRITE 
GO
