USE [master]
GO
/****** Object:  Database [Practica2]    Script Date: 03/03/2020 10:46:27 p. m. ******/
CREATE DATABASE [Practica2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Practica2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Practica2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Practica2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Practica2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Practica2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Practica2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Practica2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Practica2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Practica2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Practica2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Practica2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Practica2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Practica2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Practica2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Practica2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Practica2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Practica2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Practica2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Practica2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Practica2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Practica2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Practica2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Practica2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Practica2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Practica2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Practica2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Practica2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Practica2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Practica2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Practica2] SET  MULTI_USER 
GO
ALTER DATABASE [Practica2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Practica2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Practica2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Practica2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Practica2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Practica2] SET QUERY_STORE = OFF
GO
USE [Practica2]
GO
/****** Object:  Table [dbo].[Abarrotes]    Script Date: 03/03/2020 10:46:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abarrotes](
	[vAbarrotesComestibles] [varchar](50) NOT NULL,
	[iNumerodeAC] [int] NULL,
	[vAbarrotesNoComestibles] [varchar](50) NOT NULL,
	[iNumerodeAN] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 03/03/2020 10:46:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[vVarcharNombre] [varchar](50) NOT NULL,
	[iIdEmpleado] [int] NULL,
	[vSeccionTrabajo] [varchar](50) NOT NULL,
	[fSueldoMensual] [float] NULL,
	[cSexo] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FrutasyVerduras]    Script Date: 03/03/2020 10:46:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FrutasyVerduras](
	[vTipoFruta] [varchar](50) NOT NULL,
	[vTipoVerduras] [varchar](50) NOT NULL,
	[iCantidad] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operaciones]    Script Date: 03/03/2020 10:46:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operaciones](
	[iNumerodeCajeros] [int] NULL,
	[iNumerodeCaja] [int] NULL,
	[fPrecioProductos] [float] NULL,
	[iFacturas] [int] NULL,
	[iConsumoInterno] [int] NULL,
	[vConsumoInterno] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Variedades]    Script Date: 03/03/2020 10:46:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Variedades](
	[vMarcaElectronica] [varchar](50) NOT NULL,
	[vMedicinaFarmacia] [varchar](50) NOT NULL,
	[iCantidad] [int] NULL,
	[vMarcaRopa] [varchar](50) NOT NULL,
	[iCantidadR] [int] NULL,
	[vMarcaDeportes] [varchar](50) NOT NULL,
	[iCantidadD] [int] NULL,
	[vMarcaPapeleria] [varchar](50) NOT NULL,
	[iCantidadP] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [indx_vAbarrotesComestibles]    Script Date: 03/03/2020 10:46:29 p. m. ******/
CREATE NONCLUSTERED INDEX [indx_vAbarrotesComestibles] ON [dbo].[Abarrotes]
(
	[vAbarrotesComestibles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [indx_vAbarrotesNoComestibles]    Script Date: 03/03/2020 10:46:29 p. m. ******/
CREATE NONCLUSTERED INDEX [indx_vAbarrotesNoComestibles] ON [dbo].[Abarrotes]
(
	[vAbarrotesNoComestibles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [indx_Hombres]    Script Date: 03/03/2020 10:46:29 p. m. ******/
CREATE NONCLUSTERED INDEX [indx_Hombres] ON [dbo].[Empleados]
(
	[cSexo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [indx_Mujeres]    Script Date: 03/03/2020 10:46:29 p. m. ******/
CREATE NONCLUSTERED INDEX [indx_Mujeres] ON [dbo].[Empleados]
(
	[cSexo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [indx_vTipoFruta]    Script Date: 03/03/2020 10:46:29 p. m. ******/
CREATE NONCLUSTERED INDEX [indx_vTipoFruta] ON [dbo].[FrutasyVerduras]
(
	[vTipoFruta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [indx_vTipoVerdura]    Script Date: 03/03/2020 10:46:29 p. m. ******/
CREATE NONCLUSTERED INDEX [indx_vTipoVerdura] ON [dbo].[FrutasyVerduras]
(
	[vTipoVerduras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indx_Clientes]    Script Date: 03/03/2020 10:46:29 p. m. ******/
CREATE NONCLUSTERED INDEX [indx_Clientes] ON [dbo].[Operaciones]
(
	[iNumerodeCajeros] ASC,
	[iNumerodeCaja] ASC,
	[fPrecioProductos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [indx_Tienda]    Script Date: 03/03/2020 10:46:29 p. m. ******/
CREATE NONCLUSTERED INDEX [indx_Tienda] ON [dbo].[Operaciones]
(
	[iFacturas] ASC,
	[iConsumoInterno] ASC,
	[vConsumoInterno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [indx_Deportes]    Script Date: 03/03/2020 10:46:29 p. m. ******/
CREATE NONCLUSTERED INDEX [indx_Deportes] ON [dbo].[Variedades]
(
	[vMarcaDeportes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [indx_Electronica]    Script Date: 03/03/2020 10:46:29 p. m. ******/
CREATE NONCLUSTERED INDEX [indx_Electronica] ON [dbo].[Variedades]
(
	[vMarcaElectronica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [indx_Medicina]    Script Date: 03/03/2020 10:46:29 p. m. ******/
CREATE NONCLUSTERED INDEX [indx_Medicina] ON [dbo].[Variedades]
(
	[vMedicinaFarmacia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [indx_Papeleria]    Script Date: 03/03/2020 10:46:29 p. m. ******/
CREATE NONCLUSTERED INDEX [indx_Papeleria] ON [dbo].[Variedades]
(
	[vMarcaPapeleria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [indx_Ropa]    Script Date: 03/03/2020 10:46:29 p. m. ******/
CREATE NONCLUSTERED INDEX [indx_Ropa] ON [dbo].[Variedades]
(
	[vMarcaRopa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Practica2] SET  READ_WRITE 
GO
