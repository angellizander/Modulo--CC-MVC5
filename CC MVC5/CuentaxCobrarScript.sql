USE [master]
GO
/****** Object:  Database [CuentasxCobrar]    Script Date: 9/12/2017 4:04:54 p.m. ******/
CREATE DATABASE [CuentasxCobrar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CuentasxCobrar', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CuentasxCobrar.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CuentasxCobrar_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CuentasxCobrar_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CuentasxCobrar] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CuentasxCobrar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CuentasxCobrar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CuentasxCobrar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CuentasxCobrar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CuentasxCobrar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CuentasxCobrar] SET ARITHABORT OFF 
GO
ALTER DATABASE [CuentasxCobrar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CuentasxCobrar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CuentasxCobrar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CuentasxCobrar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CuentasxCobrar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CuentasxCobrar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CuentasxCobrar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CuentasxCobrar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CuentasxCobrar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CuentasxCobrar] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CuentasxCobrar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CuentasxCobrar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CuentasxCobrar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CuentasxCobrar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CuentasxCobrar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CuentasxCobrar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CuentasxCobrar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CuentasxCobrar] SET RECOVERY FULL 
GO
ALTER DATABASE [CuentasxCobrar] SET  MULTI_USER 
GO
ALTER DATABASE [CuentasxCobrar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CuentasxCobrar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CuentasxCobrar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CuentasxCobrar] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CuentasxCobrar] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CuentasxCobrar]
GO
/****** Object:  Table [dbo].[Asientos]    Script Date: 9/12/2017 4:04:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Asientos](
	[IDAsientos] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](20) NULL,
	[IDClientes] [int] NULL,
	[Cuenta] [int] NULL,
	[TipoMovimiento] [char](2) NULL,
	[FechaAsiento] [datetime] NULL,
	[MontoAsiento] [decimal](4, 0) NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_Asientos] PRIMARY KEY CLUSTERED 
(
	[IDAsientos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 9/12/2017 4:04:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clientes](
	[IDClientes] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](40) NULL,
	[Cedula] [varchar](15) NOT NULL,
	[Credito] [float] NULL,
	[Limite] [float] NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDClientes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CuentasContable]    Script Date: 9/12/2017 4:04:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentasContable](
	[IDCuentasContables] [int] IDENTITY(1,1) NOT NULL,
	[CuentasContables] [int] NULL,
 CONSTRAINT [PK_CuentasContable] PRIMARY KEY CLUSTERED 
(
	[IDCuentasContables] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoDocumentos]    Script Date: 9/12/2017 4:04:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoDocumentos](
	[IDDocumentos] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](90) NULL,
	[Cuentacontable] [int] NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDDocumentos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transacciones]    Script Date: 9/12/2017 4:04:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transacciones](
	[IDTransacciones] [int] IDENTITY(1,1) NOT NULL,
	[TipoMovimiento] [char](2) NULL,
	[IDTipoDocumento] [int] NULL,
	[IDCliente] [int] NULL,
	[Fecha] [datetime] NULL,
	[Monto] [decimal](5, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDTransacciones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 9/12/2017 4:04:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Usuario] [varchar](8) NULL,
	[Password] [varchar](10) NULL,
	[Privilegio] [char](2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Asientos]  WITH CHECK ADD  CONSTRAINT [FK_Asientos_Clientes] FOREIGN KEY([IDClientes])
REFERENCES [dbo].[Clientes] ([IDClientes])
GO
ALTER TABLE [dbo].[Asientos] CHECK CONSTRAINT [FK_Asientos_Clientes]
GO
ALTER TABLE [dbo].[TipoDocumentos]  WITH CHECK ADD  CONSTRAINT [FK_TipoDocumentos_CuentasContable] FOREIGN KEY([Cuentacontable])
REFERENCES [dbo].[CuentasContable] ([IDCuentasContables])
GO
ALTER TABLE [dbo].[TipoDocumentos] CHECK CONSTRAINT [FK_TipoDocumentos_CuentasContable]
GO
USE [master]
GO
ALTER DATABASE [CuentasxCobrar] SET  READ_WRITE 
GO
