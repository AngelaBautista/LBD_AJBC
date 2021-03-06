USE [master]
GO
/****** Object:  Database [PuntoDeVenta]    Script Date: 22/05/2020 02:46:27 a. m. ******/
CREATE DATABASE [PuntoDeVenta]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PuntoDeVenta', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PuntoDeVenta.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PuntoDeVenta_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PuntoDeVenta_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PuntoDeVenta] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PuntoDeVenta].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PuntoDeVenta] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET ARITHABORT OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PuntoDeVenta] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PuntoDeVenta] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PuntoDeVenta] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PuntoDeVenta] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PuntoDeVenta] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PuntoDeVenta] SET  MULTI_USER 
GO
ALTER DATABASE [PuntoDeVenta] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PuntoDeVenta] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PuntoDeVenta] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PuntoDeVenta] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PuntoDeVenta] SET QUERY_STORE = OFF
GO
USE [PuntoDeVenta]
GO
/****** Object:  UserDefinedFunction [dbo].[SueldoAnual]    Script Date: 22/05/2020 02:46:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[SueldoAnual] (@iPuestosId int)
returns float 
as begin 
declare @Sueldo float
select @Sueldo=(fSueldo*12) from Puestos where iPuestosId=@iPuestosId
return @Sueldo
end 
GO
/****** Object:  UserDefinedFunction [dbo].[Total]    Script Date: 22/05/2020 02:46:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[Total] (@iProductosId int)
returns float 
as begin
declare @Total float 
select @Total=(fPrecio * iCantidad) from Productos where iProductosId=@iProductosId 
return @Total
end
GO
/****** Object:  Table [dbo].[Puestos]    Script Date: 22/05/2020 02:46:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puestos](
	[iPuestosId] [int] NOT NULL,
	[vDescripcion] [varchar](50) NULL,
	[fSueldo] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[iPuestosId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 22/05/2020 02:46:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[iEmpleadoId] [int] NOT NULL,
	[vNombre] [varchar](20) NULL,
	[vApPat] [varchar](20) NULL,
	[vApMat] [varchar](20) NULL,
	[vNomCompleto]  AS (([vNombre]+[vApPat])+[vApMat]),
	[cTurno] [char](1) NULL,
	[iTelefono] [int] NULL,
	[dFechaNac] [datetime] NOT NULL,
	[Edad]  AS (datediff(year,[dFechaNac],getdate())),
	[iPuesto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iEmpleadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vista_Empleados]    Script Date: 22/05/2020 02:46:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vista_Empleados] as select Empleados.vNombre, Puestos.fSueldo from Empleados left join Puestos on Empleados.iEmpleadoId=Puestos.iPuestosId
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 22/05/2020 02:46:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[iProductosId] [int] NOT NULL,
	[vNombre] [varchar](30) NULL,
	[vMarca] [varchar](30) NULL,
	[fPrecio] [float] NULL,
	[iCantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iProductosId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 22/05/2020 02:46:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[iProveedorId] [int] NOT NULL,
	[iProducto] [int] NULL,
	[vNombre] [varchar](30) NULL,
	[vEmpresa] [varchar](30) NULL,
	[fCosto] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[iProveedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vista_Empresas]    Script Date: 22/05/2020 02:46:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vista_Empresas] as select Productos.vNombre, Proveedores.vEmpresa from Productos left join Proveedores on Productos.iProductosId=Proveedores.iProveedorId
GO
/****** Object:  View [dbo].[vista_ProductoP]    Script Date: 22/05/2020 02:46:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vista_ProductoP] as select AVG(fPrecio) Precio from Productos group by fPrecio having AVG(fPrecio)>15.00
GO
/****** Object:  View [dbo].[vista_PuestoSueldo]    Script Date: 22/05/2020 02:46:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vista_PuestoSueldo] as select AVG(fSueldo) Sueldo from Puestos group by fSueldo having AVG(fSueldo)<2000.00
GO
/****** Object:  Table [dbo].[PedidoDetalle]    Script Date: 22/05/2020 02:46:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidoDetalle](
	[iPedidoDetalleId] [int] NOT NULL,
	[iPedRef] [int] NULL,
	[vProdPedido] [varchar](50) NULL,
	[iCantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iPedidoDetalleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vista_Detalle]    Script Date: 22/05/2020 02:46:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vista_Detalle] as select AVG(iCantidad) Cantidad from PedidoDetalle group by vProdPedido having AVG(iCantidad)<10
GO
/****** Object:  Table [dbo].[Domicilio]    Script Date: 22/05/2020 02:46:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Domicilio](
	[iDomicilioId] [int] NOT NULL,
	[vCalle] [varchar](20) NULL,
	[tNumero] [tinyint] NULL,
	[vColonia] [varchar](20) NULL,
	[vCiudad] [varchar](20) NULL,
	[iCodPostal] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iDomicilioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Informacion]    Script Date: 22/05/2020 02:46:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Informacion](
	[Nombre] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 22/05/2020 02:46:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[iInventarioId] [int] NOT NULL,
	[iSucursal] [int] NULL,
	[iProducto] [int] NULL,
	[iCantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iInventarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Negocio]    Script Date: 22/05/2020 02:46:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Negocio](
	[iNegocioId] [int] NOT NULL,
	[iResponsable] [int] NULL,
	[iTelefono] [int] NULL,
	[iDomicilio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iNegocioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 22/05/2020 02:46:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[iPedidoId] [int] NOT NULL,
	[iProveedor] [int] NULL,
	[dtPedFecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[iPedidoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursales]    Script Date: 22/05/2020 02:46:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursales](
	[iSucursalId] [int] NOT NULL,
	[iGerente] [int] NULL,
	[iDomiciolio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iSucursalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 22/05/2020 02:46:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[iTicketId] [int] NOT NULL,
	[dtFechaCompra] [datetime] NULL,
	[iNegocio] [int] NULL,
	[iEmpleado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iTicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketDetalle]    Script Date: 22/05/2020 02:46:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketDetalle](
	[iTickDetalleId] [int] NOT NULL,
	[iTickRef] [int] NULL,
	[iProducto] [int] NULL,
	[iCantidad] [int] NULL,
	[fPrecio] [float] NULL,
	[fTotal] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[iTickDetalleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoPago]    Script Date: 22/05/2020 02:46:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoPago](
	[iTipoPagoId] [int] NOT NULL,
	[vDescripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[iTipoPagoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Domicilio] ([iDomicilioId], [vCalle], [tNumero], [vColonia], [vCiudad], [iCodPostal]) VALUES (1, N'´Mayas', 4, N'Lagos de Zirándaro', N'Juárez', 67277)
INSERT [dbo].[Domicilio] ([iDomicilioId], [vCalle], [tNumero], [vColonia], [vCiudad], [iCodPostal]) VALUES (2, N'Reynosa', 5, N'Revolucion', N'Guadaulpe', 78596)
INSERT [dbo].[Domicilio] ([iDomicilioId], [vCalle], [tNumero], [vColonia], [vCiudad], [iCodPostal]) VALUES (3, N'Callejon Rendon', 6, N'Arcos', N'Juarez', 74125)
INSERT [dbo].[Domicilio] ([iDomicilioId], [vCalle], [tNumero], [vColonia], [vCiudad], [iCodPostal]) VALUES (4, N'Balcones', 7, N'Portal', N'Juarez', 25896)
INSERT [dbo].[Domicilio] ([iDomicilioId], [vCalle], [tNumero], [vColonia], [vCiudad], [iCodPostal]) VALUES (5, N'Azteca', 8, N'Enredadera', N'San Nicolas', 58963)
INSERT [dbo].[Domicilio] ([iDomicilioId], [vCalle], [tNumero], [vColonia], [vCiudad], [iCodPostal]) VALUES (6, N'San Francisco', 9, N'Hector Caballero', N'Escobedo', 48978)
INSERT [dbo].[Domicilio] ([iDomicilioId], [vCalle], [tNumero], [vColonia], [vCiudad], [iCodPostal]) VALUES (7, N'Rendon', 10, N'Privadas del Rey', N'China', 28964)
INSERT [dbo].[Domicilio] ([iDomicilioId], [vCalle], [tNumero], [vColonia], [vCiudad], [iCodPostal]) VALUES (8, N'Verano', 11, N'Tres Caminos', N'Guadalupe', 15893)
INSERT [dbo].[Domicilio] ([iDomicilioId], [vCalle], [tNumero], [vColonia], [vCiudad], [iCodPostal]) VALUES (9, N'Olmeca', 12, N'Olmos', N'Guadalupe', 54782)
INSERT [dbo].[Domicilio] ([iDomicilioId], [vCalle], [tNumero], [vColonia], [vCiudad], [iCodPostal]) VALUES (10, N'Asia', 13, N'Azteca', N'Apodaca', 123456)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (1, N'Jose', N'Luna', N'Carranza', N'N', 81, CAST(N'2000-10-22T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (2, N'Alberto', N'Becerra', N'Ramírez', N'M', 45796423, CAST(N'1994-07-27T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (3, N'Adalberto', N'Leal', N'Ramírez', N'V', 27598645, CAST(N'1997-10-08T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (4, N'Valeria', N'Bautista', N'Acosta', N'V', 58963214, CAST(N'2002-12-12T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (5, N'Laura', N'Cruz', N'Montero', N'M', 27416389, CAST(N'1974-04-29T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (6, N'Ruben', N'Bautista', N'Rodriguez', N'N', 29684572, CAST(N'1977-03-15T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (7, N'Kaleb', N'Pérez', N'Villareal', N'M', 45961287, CAST(N'1998-06-13T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (8, N'Karina', N'Buentello', N'López', N'N', 12345678, CAST(N'2000-02-27T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (9, N'Vanessa', N'Caballero', N'Zapata', N'N', 78945612, CAST(N'1996-01-31T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (10, N'Zurisadai', N'Vielma', N'Reyna', N'M', 45789632, CAST(N'2000-09-30T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (11, N'Kaleb', N'Mendoza', N'Puentes', N'V', 59273641, CAST(N'2001-08-06T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (12, N'Kira', N'Barrientos', N'Padilla', N'M', 12789645, CAST(N'1989-05-10T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (13, N'Nala', N'Castillo', N'Villafuerte', N'N', 45782319, CAST(N'1999-06-12T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (14, N'Oscar', N'Ríos', N'Villanueva', N'M', 12457836, CAST(N'1991-12-24T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (15, N'Edson', N'Martínez', N'Leija', N'V', 69584712, CAST(N'1992-10-10T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (16, N'Astrid', N'Peña', N'Flor', N'V', 14253689, CAST(N'1994-09-07T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (17, N'Karen', N'Ortiz', N'De Lira', N'M', 412457812, CAST(N'1993-04-20T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Informacion] ([Nombre]) VALUES (N'Café')
INSERT [dbo].[Informacion] ([Nombre]) VALUES (N'Chips fuego')
INSERT [dbo].[Informacion] ([Nombre]) VALUES (N'Condimento alimenticio')
INSERT [dbo].[Informacion] ([Nombre]) VALUES (N'Galletas')
INSERT [dbo].[Informacion] ([Nombre]) VALUES (N'Harina')
INSERT [dbo].[Informacion] ([Nombre]) VALUES (N'Leche entera')
INSERT [dbo].[Informacion] ([Nombre]) VALUES (N'Pan')
INSERT [dbo].[Informacion] ([Nombre]) VALUES (N'Pan blanco')
INSERT [dbo].[Informacion] ([Nombre]) VALUES (N'Refreso de cola')
INSERT [dbo].[Informacion] ([Nombre]) VALUES (N'Sopa de trigo')
INSERT [dbo].[Inventario] ([iInventarioId], [iSucursal], [iProducto], [iCantidad]) VALUES (1, 1, 1, 50)
INSERT [dbo].[Inventario] ([iInventarioId], [iSucursal], [iProducto], [iCantidad]) VALUES (2, 2, 2, 45)
INSERT [dbo].[Inventario] ([iInventarioId], [iSucursal], [iProducto], [iCantidad]) VALUES (3, 3, 3, 40)
INSERT [dbo].[Inventario] ([iInventarioId], [iSucursal], [iProducto], [iCantidad]) VALUES (4, 4, 4, 35)
INSERT [dbo].[Inventario] ([iInventarioId], [iSucursal], [iProducto], [iCantidad]) VALUES (5, 5, 5, 30)
INSERT [dbo].[Inventario] ([iInventarioId], [iSucursal], [iProducto], [iCantidad]) VALUES (6, 6, 6, 30)
INSERT [dbo].[Inventario] ([iInventarioId], [iSucursal], [iProducto], [iCantidad]) VALUES (7, 7, 7, 35)
INSERT [dbo].[Inventario] ([iInventarioId], [iSucursal], [iProducto], [iCantidad]) VALUES (8, 8, 8, 40)
INSERT [dbo].[Inventario] ([iInventarioId], [iSucursal], [iProducto], [iCantidad]) VALUES (9, 9, 9, 45)
INSERT [dbo].[Inventario] ([iInventarioId], [iSucursal], [iProducto], [iCantidad]) VALUES (10, 10, 10, 50)
INSERT [dbo].[Negocio] ([iNegocioId], [iResponsable], [iTelefono], [iDomicilio]) VALUES (1, 4, 89562314, 1)
INSERT [dbo].[Negocio] ([iNegocioId], [iResponsable], [iTelefono], [iDomicilio]) VALUES (2, 5, 12457836, 2)
INSERT [dbo].[Negocio] ([iNegocioId], [iResponsable], [iTelefono], [iDomicilio]) VALUES (3, 6, 35781429, 3)
INSERT [dbo].[Negocio] ([iNegocioId], [iResponsable], [iTelefono], [iDomicilio]) VALUES (4, 10, 15987530, 4)
INSERT [dbo].[Negocio] ([iNegocioId], [iResponsable], [iTelefono], [iDomicilio]) VALUES (5, 11, 56782143, 5)
INSERT [dbo].[Negocio] ([iNegocioId], [iResponsable], [iTelefono], [iDomicilio]) VALUES (6, 12, 37681942, 6)
INSERT [dbo].[Negocio] ([iNegocioId], [iResponsable], [iTelefono], [iDomicilio]) VALUES (7, 13, 12985437, 7)
INSERT [dbo].[Negocio] ([iNegocioId], [iResponsable], [iTelefono], [iDomicilio]) VALUES (8, 14, 13467790, 8)
INSERT [dbo].[Negocio] ([iNegocioId], [iResponsable], [iTelefono], [iDomicilio]) VALUES (9, 17, 37681204, 9)
INSERT [dbo].[Negocio] ([iNegocioId], [iResponsable], [iTelefono], [iDomicilio]) VALUES (10, 16, 3142730, 10)
INSERT [dbo].[Pedido] ([iPedidoId], [iProveedor], [dtPedFecha]) VALUES (1, 1, CAST(N'2010-07-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Pedido] ([iPedidoId], [iProveedor], [dtPedFecha]) VALUES (2, 2, CAST(N'2011-11-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Pedido] ([iPedidoId], [iProveedor], [dtPedFecha]) VALUES (3, 3, CAST(N'2012-11-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Pedido] ([iPedidoId], [iProveedor], [dtPedFecha]) VALUES (4, 4, CAST(N'2013-11-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Pedido] ([iPedidoId], [iProveedor], [dtPedFecha]) VALUES (5, 5, CAST(N'2014-11-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Pedido] ([iPedidoId], [iProveedor], [dtPedFecha]) VALUES (6, 6, CAST(N'2015-11-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Pedido] ([iPedidoId], [iProveedor], [dtPedFecha]) VALUES (7, 7, CAST(N'2014-07-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Pedido] ([iPedidoId], [iProveedor], [dtPedFecha]) VALUES (8, 8, CAST(N'2015-10-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Pedido] ([iPedidoId], [iProveedor], [dtPedFecha]) VALUES (9, 9, CAST(N'2018-06-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Pedido] ([iPedidoId], [iProveedor], [dtPedFecha]) VALUES (10, 10, CAST(N'2020-03-27T00:00:00.000' AS DateTime))
INSERT [dbo].[PedidoDetalle] ([iPedidoDetalleId], [iPedRef], [vProdPedido], [iCantidad]) VALUES (1, 1, N'Refesco de cola', 1)
INSERT [dbo].[PedidoDetalle] ([iPedidoDetalleId], [iPedRef], [vProdPedido], [iCantidad]) VALUES (2, 2, N'Leche Entera', 3)
INSERT [dbo].[PedidoDetalle] ([iPedidoDetalleId], [iPedRef], [vProdPedido], [iCantidad]) VALUES (3, 3, N'Harina', 2)
INSERT [dbo].[PedidoDetalle] ([iPedidoDetalleId], [iPedRef], [vProdPedido], [iCantidad]) VALUES (4, 4, N'Chips Fuego', 5)
INSERT [dbo].[PedidoDetalle] ([iPedidoDetalleId], [iPedRef], [vProdPedido], [iCantidad]) VALUES (5, 5, N'Sopa de trigo', 10)
INSERT [dbo].[PedidoDetalle] ([iPedidoDetalleId], [iPedRef], [vProdPedido], [iCantidad]) VALUES (6, 6, N'Pan Blanco', 2)
INSERT [dbo].[PedidoDetalle] ([iPedidoDetalleId], [iPedRef], [vProdPedido], [iCantidad]) VALUES (7, 7, N'Cafe', 4)
INSERT [dbo].[PedidoDetalle] ([iPedidoDetalleId], [iPedRef], [vProdPedido], [iCantidad]) VALUES (8, 8, N'Galletas', 6)
INSERT [dbo].[PedidoDetalle] ([iPedidoDetalleId], [iPedRef], [vProdPedido], [iCantidad]) VALUES (9, 9, N'Condimento alimenticio', 9)
INSERT [dbo].[PedidoDetalle] ([iPedidoDetalleId], [iPedRef], [vProdPedido], [iCantidad]) VALUES (10, 10, N'Pan', 3)
INSERT [dbo].[Productos] ([iProductosId], [vNombre], [vMarca], [fPrecio], [iCantidad]) VALUES (1, N'Refreso de cola', N'Coca-Cola', 25, 50)
INSERT [dbo].[Productos] ([iProductosId], [vNombre], [vMarca], [fPrecio], [iCantidad]) VALUES (2, N'Leche entera', N'Lala', 15, 50)
INSERT [dbo].[Productos] ([iProductosId], [vNombre], [vMarca], [fPrecio], [iCantidad]) VALUES (3, N'Harina', N'Selecta', 20, 30)
INSERT [dbo].[Productos] ([iProductosId], [vNombre], [vMarca], [fPrecio], [iCantidad]) VALUES (4, N'Chips fuego', N'Barcel', 13, 80)
INSERT [dbo].[Productos] ([iProductosId], [vNombre], [vMarca], [fPrecio], [iCantidad]) VALUES (5, N'Sopa de trigo', N'Moderna', 10, 100)
INSERT [dbo].[Productos] ([iProductosId], [vNombre], [vMarca], [fPrecio], [iCantidad]) VALUES (6, N'Pan blanco', N'Bimbo', 30, 50)
INSERT [dbo].[Productos] ([iProductosId], [vNombre], [vMarca], [fPrecio], [iCantidad]) VALUES (7, N'Café', N'Nescafe', 15, 50)
INSERT [dbo].[Productos] ([iProductosId], [vNombre], [vMarca], [fPrecio], [iCantidad]) VALUES (8, N'Galletas', N'Gamesa', 14, 50)
INSERT [dbo].[Productos] ([iProductosId], [vNombre], [vMarca], [fPrecio], [iCantidad]) VALUES (9, N'Condimento alimenticio', N'Knor', 5, 50)
INSERT [dbo].[Productos] ([iProductosId], [vNombre], [vMarca], [fPrecio], [iCantidad]) VALUES (10, N'Pan', N'Marinela', 15, 45)
INSERT [dbo].[Proveedores] ([iProveedorId], [iProducto], [vNombre], [vEmpresa], [fCosto]) VALUES (1, 1, N'Coca Cola', N'Coca Cola Company', 15.25)
INSERT [dbo].[Proveedores] ([iProveedorId], [iProducto], [vNombre], [vEmpresa], [fCosto]) VALUES (2, 2, N'Lala', N'Grupo Lala', 10.68)
INSERT [dbo].[Proveedores] ([iProveedorId], [iProducto], [vNombre], [vEmpresa], [fCosto]) VALUES (3, 3, N'Selecta', N'Molinera de México', 10.5)
INSERT [dbo].[Proveedores] ([iProveedorId], [iProducto], [vNombre], [vEmpresa], [fCosto]) VALUES (4, 4, N'Barcel', N'Barcel', 8.69)
INSERT [dbo].[Proveedores] ([iProveedorId], [iProducto], [vNombre], [vEmpresa], [fCosto]) VALUES (5, 5, N'Moderna', N'La Moderna', 5.25)
INSERT [dbo].[Proveedores] ([iProveedorId], [iProducto], [vNombre], [vEmpresa], [fCosto]) VALUES (6, 6, N'Bimbo', N'Grupo Bimbo', 15.45)
INSERT [dbo].[Proveedores] ([iProveedorId], [iProducto], [vNombre], [vEmpresa], [fCosto]) VALUES (7, 7, N'Nescafe', N'Nestlé', 7.29)
INSERT [dbo].[Proveedores] ([iProveedorId], [iProducto], [vNombre], [vEmpresa], [fCosto]) VALUES (8, 8, N'Gamesa', N'Grupo Gamesa', 8.69)
INSERT [dbo].[Proveedores] ([iProveedorId], [iProducto], [vNombre], [vEmpresa], [fCosto]) VALUES (9, 9, N'Knor', N'Knorr', 3.25)
INSERT [dbo].[Proveedores] ([iProveedorId], [iProducto], [vNombre], [vEmpresa], [fCosto]) VALUES (10, 10, N'Marinela', N'Marinela Mexico', 7.45)
INSERT [dbo].[Puestos] ([iPuestosId], [vDescripcion], [fSueldo]) VALUES (1, N'Cajero', 1400.5)
INSERT [dbo].[Puestos] ([iPuestosId], [vDescripcion], [fSueldo]) VALUES (2, N'Limpieza', 1100.68)
INSERT [dbo].[Puestos] ([iPuestosId], [vDescripcion], [fSueldo]) VALUES (3, N'Vendedor', 1200.25)
INSERT [dbo].[Puestos] ([iPuestosId], [vDescripcion], [fSueldo]) VALUES (4, N'Distribuidor', 1500.23)
INSERT [dbo].[Puestos] ([iPuestosId], [vDescripcion], [fSueldo]) VALUES (5, N'Gerente', 2100.58)
INSERT [dbo].[Puestos] ([iPuestosId], [vDescripcion], [fSueldo]) VALUES (6, N'Chofer', 1400.49)
INSERT [dbo].[Puestos] ([iPuestosId], [vDescripcion], [fSueldo]) VALUES (7, N'Supervisor', 6000.74)
INSERT [dbo].[Puestos] ([iPuestosId], [vDescripcion], [fSueldo]) VALUES (8, N'Sub-gerente', 1500.78)
INSERT [dbo].[Puestos] ([iPuestosId], [vDescripcion], [fSueldo]) VALUES (9, N'Soporte Tecnico', 3000.25)
INSERT [dbo].[Puestos] ([iPuestosId], [vDescripcion], [fSueldo]) VALUES (10, N'Asistente telefónico', 2000)
INSERT [dbo].[Sucursales] ([iSucursalId], [iGerente], [iDomiciolio]) VALUES (1, 4, 1)
INSERT [dbo].[Sucursales] ([iSucursalId], [iGerente], [iDomiciolio]) VALUES (2, 5, 2)
INSERT [dbo].[Sucursales] ([iSucursalId], [iGerente], [iDomiciolio]) VALUES (3, 6, 3)
INSERT [dbo].[Sucursales] ([iSucursalId], [iGerente], [iDomiciolio]) VALUES (4, 10, 4)
INSERT [dbo].[Sucursales] ([iSucursalId], [iGerente], [iDomiciolio]) VALUES (5, 11, 5)
INSERT [dbo].[Sucursales] ([iSucursalId], [iGerente], [iDomiciolio]) VALUES (6, 12, 6)
INSERT [dbo].[Sucursales] ([iSucursalId], [iGerente], [iDomiciolio]) VALUES (7, 13, 7)
INSERT [dbo].[Sucursales] ([iSucursalId], [iGerente], [iDomiciolio]) VALUES (8, 14, 8)
INSERT [dbo].[Sucursales] ([iSucursalId], [iGerente], [iDomiciolio]) VALUES (9, 15, 9)
INSERT [dbo].[Sucursales] ([iSucursalId], [iGerente], [iDomiciolio]) VALUES (10, 16, 10)
INSERT [dbo].[Ticket] ([iTicketId], [dtFechaCompra], [iNegocio], [iEmpleado]) VALUES (1, CAST(N'2015-12-24T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Ticket] ([iTicketId], [dtFechaCompra], [iNegocio], [iEmpleado]) VALUES (2, CAST(N'2016-01-12T00:00:00.000' AS DateTime), 2, 2)
INSERT [dbo].[Ticket] ([iTicketId], [dtFechaCompra], [iNegocio], [iEmpleado]) VALUES (3, CAST(N'2017-08-29T00:00:00.000' AS DateTime), 3, 3)
INSERT [dbo].[Ticket] ([iTicketId], [dtFechaCompra], [iNegocio], [iEmpleado]) VALUES (4, CAST(N'2017-09-13T00:00:00.000' AS DateTime), 4, 4)
INSERT [dbo].[Ticket] ([iTicketId], [dtFechaCompra], [iNegocio], [iEmpleado]) VALUES (5, CAST(N'2018-02-01T00:00:00.000' AS DateTime), 5, 5)
INSERT [dbo].[Ticket] ([iTicketId], [dtFechaCompra], [iNegocio], [iEmpleado]) VALUES (6, CAST(N'2019-10-22T00:00:00.000' AS DateTime), 6, 6)
INSERT [dbo].[Ticket] ([iTicketId], [dtFechaCompra], [iNegocio], [iEmpleado]) VALUES (7, CAST(N'2020-11-20T00:00:00.000' AS DateTime), 7, 7)
INSERT [dbo].[Ticket] ([iTicketId], [dtFechaCompra], [iNegocio], [iEmpleado]) VALUES (8, CAST(N'2020-01-25T00:00:00.000' AS DateTime), 8, 8)
INSERT [dbo].[Ticket] ([iTicketId], [dtFechaCompra], [iNegocio], [iEmpleado]) VALUES (9, CAST(N'2020-07-07T00:00:00.000' AS DateTime), 9, 9)
INSERT [dbo].[Ticket] ([iTicketId], [dtFechaCompra], [iNegocio], [iEmpleado]) VALUES (10, CAST(N'2020-07-16T00:00:00.000' AS DateTime), 10, 10)
INSERT [dbo].[TicketDetalle] ([iTickDetalleId], [iTickRef], [iProducto], [iCantidad], [fPrecio], [fTotal]) VALUES (1, 1, 1, 2, 50, 50)
INSERT [dbo].[TicketDetalle] ([iTickDetalleId], [iTickRef], [iProducto], [iCantidad], [fPrecio], [fTotal]) VALUES (2, 2, 2, 1, 15, 15)
INSERT [dbo].[TicketDetalle] ([iTickDetalleId], [iTickRef], [iProducto], [iCantidad], [fPrecio], [fTotal]) VALUES (3, 3, 3, 1, 20, 20)
INSERT [dbo].[TicketDetalle] ([iTickDetalleId], [iTickRef], [iProducto], [iCantidad], [fPrecio], [fTotal]) VALUES (4, 4, 4, 4, 52, 52)
INSERT [dbo].[TicketDetalle] ([iTickDetalleId], [iTickRef], [iProducto], [iCantidad], [fPrecio], [fTotal]) VALUES (5, 5, 5, 10, 100, 100)
INSERT [dbo].[TicketDetalle] ([iTickDetalleId], [iTickRef], [iProducto], [iCantidad], [fPrecio], [fTotal]) VALUES (7, 7, 7, 1, 15, 15)
INSERT [dbo].[TicketDetalle] ([iTickDetalleId], [iTickRef], [iProducto], [iCantidad], [fPrecio], [fTotal]) VALUES (8, 8, 8, 3, 42, 42)
INSERT [dbo].[TicketDetalle] ([iTickDetalleId], [iTickRef], [iProducto], [iCantidad], [fPrecio], [fTotal]) VALUES (9, 9, 9, 5, 25, 25)
INSERT [dbo].[TicketDetalle] ([iTickDetalleId], [iTickRef], [iProducto], [iCantidad], [fPrecio], [fTotal]) VALUES (10, 10, 10, 2, 30, 30)
INSERT [dbo].[tipoPago] ([iTipoPagoId], [vDescripcion]) VALUES (1, N'Efectivo')
INSERT [dbo].[tipoPago] ([iTipoPagoId], [vDescripcion]) VALUES (3, N'Tarjeta')
INSERT [dbo].[tipoPago] ([iTipoPagoId], [vDescripcion]) VALUES (4, N'Vales de despensa')
INSERT [dbo].[tipoPago] ([iTipoPagoId], [vDescripcion]) VALUES (7, N'Tarjeta')
INSERT [dbo].[tipoPago] ([iTipoPagoId], [vDescripcion]) VALUES (8, N'Vales de despensa')
INSERT [dbo].[tipoPago] ([iTipoPagoId], [vDescripcion]) VALUES (9, N'Efectivo')
/****** Object:  Index [indx_dFechaNac]    Script Date: 22/05/2020 02:46:30 a. m. ******/
CREATE NONCLUSTERED INDEX [indx_dFechaNac] ON [dbo].[Empleados]
(
	[dFechaNac] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Productos_vNombre]    Script Date: 22/05/2020 02:46:30 a. m. ******/
ALTER TABLE [dbo].[Productos] ADD  CONSTRAINT [UC_Productos_vNombre] UNIQUE NONCLUSTERED 
(
	[vNombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [indx_Productos]    Script Date: 22/05/2020 02:46:30 a. m. ******/
CREATE NONCLUSTERED INDEX [indx_Productos] ON [dbo].[Productos]
(
	[vNombre] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Proveedores_vEmpresa]    Script Date: 22/05/2020 02:46:30 a. m. ******/
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [UC_Proveedores_vEmpresa] UNIQUE NONCLUSTERED 
(
	[vEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UC_Sucursales_iGerente]    Script Date: 22/05/2020 02:46:30 a. m. ******/
ALTER TABLE [dbo].[Sucursales] ADD  CONSTRAINT [UC_Sucursales_iGerente] UNIQUE NONCLUSTERED 
(
	[iGerente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD FOREIGN KEY([iPuesto])
REFERENCES [dbo].[Puestos] ([iPuestosId])
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD FOREIGN KEY([iProducto])
REFERENCES [dbo].[Productos] ([iProductosId])
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD FOREIGN KEY([iSucursal])
REFERENCES [dbo].[Sucursales] ([iSucursalId])
GO
ALTER TABLE [dbo].[Negocio]  WITH CHECK ADD FOREIGN KEY([iDomicilio])
REFERENCES [dbo].[Domicilio] ([iDomicilioId])
GO
ALTER TABLE [dbo].[Negocio]  WITH CHECK ADD FOREIGN KEY([iResponsable])
REFERENCES [dbo].[Empleados] ([iEmpleadoId])
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD FOREIGN KEY([iProveedor])
REFERENCES [dbo].[Proveedores] ([iProveedorId])
GO
ALTER TABLE [dbo].[PedidoDetalle]  WITH CHECK ADD FOREIGN KEY([iPedRef])
REFERENCES [dbo].[Pedido] ([iPedidoId])
GO
ALTER TABLE [dbo].[Proveedores]  WITH CHECK ADD FOREIGN KEY([iProducto])
REFERENCES [dbo].[Productos] ([iProductosId])
GO
ALTER TABLE [dbo].[Sucursales]  WITH CHECK ADD FOREIGN KEY([iDomiciolio])
REFERENCES [dbo].[Domicilio] ([iDomicilioId])
GO
ALTER TABLE [dbo].[Sucursales]  WITH CHECK ADD FOREIGN KEY([iGerente])
REFERENCES [dbo].[Empleados] ([iEmpleadoId])
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([iEmpleado])
REFERENCES [dbo].[Empleados] ([iEmpleadoId])
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([iNegocio])
REFERENCES [dbo].[Negocio] ([iNegocioId])
GO
ALTER TABLE [dbo].[TicketDetalle]  WITH CHECK ADD FOREIGN KEY([iProducto])
REFERENCES [dbo].[Productos] ([iProductosId])
GO
ALTER TABLE [dbo].[TicketDetalle]  WITH CHECK ADD FOREIGN KEY([iTickRef])
REFERENCES [dbo].[Ticket] ([iTicketId])
GO
/****** Object:  StoredProcedure [dbo].[Detalle_SP]    Script Date: 22/05/2020 02:46:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Detalle_SP] @iCantidad int
as select Cantidad from vista_Detalle where Cantidad=@iCantidad
GO
/****** Object:  StoredProcedure [dbo].[Empleados_SP]    Script Date: 22/05/2020 02:46:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Empleados_SP] @vNombre varchar(20)
as select vNombre, fSueldo from vista_Empleados where vNombre=@vNombre 
GO
/****** Object:  StoredProcedure [dbo].[EmpleadoSueldo_SP]    Script Date: 22/05/2020 02:46:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[EmpleadoSueldo_SP] @fsueldo float 
as select Sueldo from vista_PuestoSueldo where Sueldo=@fsueldo
GO
/****** Object:  StoredProcedure [dbo].[Empresas_SP]    Script Date: 22/05/2020 02:46:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Empresas_SP] @vEmpresa varchar(20)
as select vNombre, vEmpresa from vista_Empresas where vEmpresa=@vEmpresa
GO
/****** Object:  StoredProcedure [dbo].[ProductoP_SP]    Script Date: 22/05/2020 02:46:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ProductoP_SP] @fPrecio float
as select Precio from vista_ProductoP where Precio=@fPrecio
GO
/****** Object:  Trigger [dbo].[aviso]    Script Date: 22/05/2020 02:46:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[aviso] on [dbo].[Empleados] instead of insert as print 'Nuevo cambio en la tabla';
GO
ALTER TABLE [dbo].[Empleados] ENABLE TRIGGER [aviso]
GO
/****** Object:  Trigger [dbo].[productoagotado]    Script Date: 22/05/2020 02:46:31 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[productoagotado] on [dbo].[Inventario] after update as if (select iCantidad from Inventario) < 10 begin print 'Producto por agotar' end
GO
ALTER TABLE [dbo].[Inventario] ENABLE TRIGGER [productoagotado]
GO
USE [master]
GO
ALTER DATABASE [PuntoDeVenta] SET  READ_WRITE 
GO
