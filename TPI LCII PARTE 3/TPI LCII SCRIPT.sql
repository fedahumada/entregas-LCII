USE [master]
GO
/****** Object:  Database [AUTOMOTRIZ]    Script Date: 23/10/2022 23:02:20 ******/
CREATE DATABASE [AUTOMOTRIZ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AUTOMOTRIZ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AUTOMOTRIZ.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AUTOMOTRIZ_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AUTOMOTRIZ_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AUTOMOTRIZ] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AUTOMOTRIZ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AUTOMOTRIZ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AUTOMOTRIZ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AUTOMOTRIZ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AUTOMOTRIZ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AUTOMOTRIZ] SET ARITHABORT OFF 
GO
ALTER DATABASE [AUTOMOTRIZ] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AUTOMOTRIZ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AUTOMOTRIZ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AUTOMOTRIZ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AUTOMOTRIZ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AUTOMOTRIZ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AUTOMOTRIZ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AUTOMOTRIZ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AUTOMOTRIZ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AUTOMOTRIZ] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AUTOMOTRIZ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AUTOMOTRIZ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AUTOMOTRIZ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AUTOMOTRIZ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AUTOMOTRIZ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AUTOMOTRIZ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AUTOMOTRIZ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AUTOMOTRIZ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AUTOMOTRIZ] SET  MULTI_USER 
GO
ALTER DATABASE [AUTOMOTRIZ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AUTOMOTRIZ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AUTOMOTRIZ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AUTOMOTRIZ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AUTOMOTRIZ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AUTOMOTRIZ] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AUTOMOTRIZ] SET QUERY_STORE = OFF
GO
USE [AUTOMOTRIZ]
GO
/****** Object:  Table [dbo].[BARRIOS]    Script Date: 23/10/2022 23:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BARRIOS](
	[id_barrio] [int] IDENTITY(1,1) NOT NULL,
	[barrio] [varchar](100) NOT NULL,
	[id_ciudad] [int] NOT NULL,
 CONSTRAINT [pk_barrios] PRIMARY KEY CLUSTERED 
(
	[id_barrio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CIUDADES]    Script Date: 23/10/2022 23:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CIUDADES](
	[id_ciudad] [int] IDENTITY(1,1) NOT NULL,
	[ciudad] [varchar](100) NOT NULL,
	[id_provincia] [int] NOT NULL,
 CONSTRAINT [pk_ciudades] PRIMARY KEY CLUSTERED 
(
	[id_ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTES]    Script Date: 23/10/2022 23:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTES](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[id_persona] [int] NOT NULL,
	[id_tipo_cliente] [int] NOT NULL,
 CONSTRAINT [pk_clientes] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLES]    Script Date: 23/10/2022 23:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLES](
	[id_detalle] [int] IDENTITY(1,1) NOT NULL,
	[id_factura] [int] NULL,
	[id_pedido] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[precio_unitario] [numeric](10, 2) NOT NULL,
	[cantidad] [smallint] NOT NULL,
 CONSTRAINT [pk_detalles] PRIMARY KEY CLUSTERED 
(
	[id_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMPLEADOS]    Script Date: 23/10/2022 23:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLEADOS](
	[id_empleado] [int] IDENTITY(1,1) NOT NULL,
	[id_persona] [int] NOT NULL,
	[id_tipo_empleado] [int] NOT NULL,
	[cuit] [bigint] NOT NULL,
 CONSTRAINT [pk_empleados] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACTURAS]    Script Date: 23/10/2022 23:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACTURAS](
	[id_factura] [int] IDENTITY(1,1) NOT NULL,
	[fecha_factura] [datetime] NOT NULL,
	[id_metodo_pago] [int] NOT NULL,
	[id_tipo_envio] [int] NULL,
 CONSTRAINT [pk_facturas] PRIMARY KEY CLUSTERED 
(
	[id_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARCAS]    Script Date: 23/10/2022 23:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARCAS](
	[id_marca] [int] IDENTITY(1,1) NOT NULL,
	[marca] [varchar](100) NOT NULL,
 CONSTRAINT [pk_marcas] PRIMARY KEY CLUSTERED 
(
	[id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[METODO_PAGOS]    Script Date: 23/10/2022 23:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[METODO_PAGOS](
	[id_metodo_pago] [int] IDENTITY(1,1) NOT NULL,
	[metodo_pago] [varchar](100) NULL,
 CONSTRAINT [pk_metodo_pagos] PRIMARY KEY CLUSTERED 
(
	[id_metodo_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PEDIDOS]    Script Date: 23/10/2022 23:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PEDIDOS](
	[id_pedido] [int] IDENTITY(1,1) NOT NULL,
	[id_factura] [int] NULL,
	[id_empleado] [int] NOT NULL,
	[id_cliente] [int] NOT NULL,
	[fecha_pedido] [datetime] NOT NULL,
	[fecha_entrega] [datetime] NOT NULL,
 CONSTRAINT [pk_pedidos] PRIMARY KEY CLUSTERED 
(
	[id_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERSONAS]    Script Date: 23/10/2022 23:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSONAS](
	[id_persona] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[documento] [bigint] NULL,
	[contacto] [varchar](200) NULL,
	[dire_persona] [varchar](100) NULL,
	[id_barrio] [int] NULL,
 CONSTRAINT [pk_personas] PRIMARY KEY CLUSTERED 
(
	[id_persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTOS]    Script Date: 23/10/2022 23:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTOS](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[anio] [int] NOT NULL,
	[stock] [bit] NOT NULL,
	[precio_vta] [numeric](10, 2) NOT NULL,
	[id_marca] [int] NOT NULL,
	[id_tipo_producto] [int] NOT NULL,
 CONSTRAINT [pk_productos] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVINCIAS]    Script Date: 23/10/2022 23:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVINCIAS](
	[id_provincia] [int] IDENTITY(1,1) NOT NULL,
	[provincia] [varchar](100) NOT NULL,
 CONSTRAINT [pk_provincias] PRIMARY KEY CLUSTERED 
(
	[id_provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_CLIENTES]    Script Date: 23/10/2022 23:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_CLIENTES](
	[id_tipo_cliente] [int] IDENTITY(1,1) NOT NULL,
	[tipo_cliente] [varchar](100) NOT NULL,
	[razon_social] [varchar](100) NULL,
	[dire_empresa] [varchar](100) NULL,
	[cuit] [bigint] NULL,
	[contacto] [varchar](200) NULL,
	[descuento] [numeric](5, 2) NULL,
	[id_barrio] [int] NULL,
 CONSTRAINT [pk_tipo_clientes] PRIMARY KEY CLUSTERED 
(
	[id_tipo_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_EMPLEADOS]    Script Date: 23/10/2022 23:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_EMPLEADOS](
	[id_tipo_empleado] [int] IDENTITY(1,1) NOT NULL,
	[tipo_empleado] [varchar](100) NOT NULL,
 CONSTRAINT [pk_tipo_empleados] PRIMARY KEY CLUSTERED 
(
	[id_tipo_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_ENVIOS]    Script Date: 23/10/2022 23:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_ENVIOS](
	[id_tipo_envio] [int] IDENTITY(1,1) NOT NULL,
	[tipo_envio] [varchar](100) NULL,
 CONSTRAINT [pk_tipo_envios] PRIMARY KEY CLUSTERED 
(
	[id_tipo_envio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_PRODUCTOS]    Script Date: 23/10/2022 23:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_PRODUCTOS](
	[id_tipo_producto] [int] IDENTITY(1,1) NOT NULL,
	[tipo_producto] [varchar](100) NOT NULL,
 CONSTRAINT [pk_tipo_productos] PRIMARY KEY CLUSTERED 
(
	[id_tipo_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BARRIOS]  WITH CHECK ADD  CONSTRAINT [fk_barrios_ciudades] FOREIGN KEY([id_ciudad])
REFERENCES [dbo].[CIUDADES] ([id_ciudad])
GO
ALTER TABLE [dbo].[BARRIOS] CHECK CONSTRAINT [fk_barrios_ciudades]
GO
ALTER TABLE [dbo].[CIUDADES]  WITH CHECK ADD  CONSTRAINT [fk_ciudades_provincias] FOREIGN KEY([id_provincia])
REFERENCES [dbo].[PROVINCIAS] ([id_provincia])
GO
ALTER TABLE [dbo].[CIUDADES] CHECK CONSTRAINT [fk_ciudades_provincias]
GO
ALTER TABLE [dbo].[CLIENTES]  WITH CHECK ADD  CONSTRAINT [fk_clientes_personas] FOREIGN KEY([id_persona])
REFERENCES [dbo].[PERSONAS] ([id_persona])
GO
ALTER TABLE [dbo].[CLIENTES] CHECK CONSTRAINT [fk_clientes_personas]
GO
ALTER TABLE [dbo].[CLIENTES]  WITH CHECK ADD  CONSTRAINT [fk_clientes_tipo_clientes] FOREIGN KEY([id_tipo_cliente])
REFERENCES [dbo].[TIPO_CLIENTES] ([id_tipo_cliente])
GO
ALTER TABLE [dbo].[CLIENTES] CHECK CONSTRAINT [fk_clientes_tipo_clientes]
GO
ALTER TABLE [dbo].[DETALLES]  WITH CHECK ADD  CONSTRAINT [fk_detalles_facturas] FOREIGN KEY([id_factura])
REFERENCES [dbo].[FACTURAS] ([id_factura])
GO
ALTER TABLE [dbo].[DETALLES] CHECK CONSTRAINT [fk_detalles_facturas]
GO
ALTER TABLE [dbo].[DETALLES]  WITH CHECK ADD  CONSTRAINT [fk_detalles_pedidos] FOREIGN KEY([id_pedido])
REFERENCES [dbo].[PEDIDOS] ([id_pedido])
GO
ALTER TABLE [dbo].[DETALLES] CHECK CONSTRAINT [fk_detalles_pedidos]
GO
ALTER TABLE [dbo].[DETALLES]  WITH CHECK ADD  CONSTRAINT [fk_detalles_productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[PRODUCTOS] ([id_producto])
GO
ALTER TABLE [dbo].[DETALLES] CHECK CONSTRAINT [fk_detalles_productos]
GO
ALTER TABLE [dbo].[EMPLEADOS]  WITH CHECK ADD  CONSTRAINT [fk_empleados_personas] FOREIGN KEY([id_persona])
REFERENCES [dbo].[PERSONAS] ([id_persona])
GO
ALTER TABLE [dbo].[EMPLEADOS] CHECK CONSTRAINT [fk_empleados_personas]
GO
ALTER TABLE [dbo].[EMPLEADOS]  WITH CHECK ADD  CONSTRAINT [fk_empleados_tipo_empleados] FOREIGN KEY([id_tipo_empleado])
REFERENCES [dbo].[TIPO_EMPLEADOS] ([id_tipo_empleado])
GO
ALTER TABLE [dbo].[EMPLEADOS] CHECK CONSTRAINT [fk_empleados_tipo_empleados]
GO
ALTER TABLE [dbo].[FACTURAS]  WITH CHECK ADD  CONSTRAINT [fk_facturas_metodo_pagos] FOREIGN KEY([id_metodo_pago])
REFERENCES [dbo].[METODO_PAGOS] ([id_metodo_pago])
GO
ALTER TABLE [dbo].[FACTURAS] CHECK CONSTRAINT [fk_facturas_metodo_pagos]
GO
ALTER TABLE [dbo].[FACTURAS]  WITH CHECK ADD  CONSTRAINT [fk_facturas_tipo_envios] FOREIGN KEY([id_tipo_envio])
REFERENCES [dbo].[TIPO_ENVIOS] ([id_tipo_envio])
GO
ALTER TABLE [dbo].[FACTURAS] CHECK CONSTRAINT [fk_facturas_tipo_envios]
GO
ALTER TABLE [dbo].[PEDIDOS]  WITH CHECK ADD  CONSTRAINT [fk_pedidos_clientes] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[CLIENTES] ([id_cliente])
GO
ALTER TABLE [dbo].[PEDIDOS] CHECK CONSTRAINT [fk_pedidos_clientes]
GO
ALTER TABLE [dbo].[PEDIDOS]  WITH CHECK ADD  CONSTRAINT [fk_pedidos_empleados] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[EMPLEADOS] ([id_empleado])
GO
ALTER TABLE [dbo].[PEDIDOS] CHECK CONSTRAINT [fk_pedidos_empleados]
GO
ALTER TABLE [dbo].[PEDIDOS]  WITH CHECK ADD  CONSTRAINT [fk_pedidos_facturas] FOREIGN KEY([id_factura])
REFERENCES [dbo].[FACTURAS] ([id_factura])
GO
ALTER TABLE [dbo].[PEDIDOS] CHECK CONSTRAINT [fk_pedidos_facturas]
GO
ALTER TABLE [dbo].[PERSONAS]  WITH CHECK ADD  CONSTRAINT [fk_personas_barrios] FOREIGN KEY([id_barrio])
REFERENCES [dbo].[BARRIOS] ([id_barrio])
GO
ALTER TABLE [dbo].[PERSONAS] CHECK CONSTRAINT [fk_personas_barrios]
GO
ALTER TABLE [dbo].[PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [fk_productos_marcas] FOREIGN KEY([id_marca])
REFERENCES [dbo].[MARCAS] ([id_marca])
GO
ALTER TABLE [dbo].[PRODUCTOS] CHECK CONSTRAINT [fk_productos_marcas]
GO
ALTER TABLE [dbo].[PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [fk_productos_tipo_productos] FOREIGN KEY([id_tipo_producto])
REFERENCES [dbo].[TIPO_PRODUCTOS] ([id_tipo_producto])
GO
ALTER TABLE [dbo].[PRODUCTOS] CHECK CONSTRAINT [fk_productos_tipo_productos]
GO
ALTER TABLE [dbo].[TIPO_CLIENTES]  WITH CHECK ADD  CONSTRAINT [fk_tipo_clientes_barrios] FOREIGN KEY([id_barrio])
REFERENCES [dbo].[BARRIOS] ([id_barrio])
GO
ALTER TABLE [dbo].[TIPO_CLIENTES] CHECK CONSTRAINT [fk_tipo_clientes_barrios]
GO
/****** Object:  StoredProcedure [dbo].[SP_AHUMADA_1]    Script Date: 23/10/2022 23:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_AHUMADA_1]
AS
begin
select e2.empleado'EMPLEADO', year(f.fecha_factura)'AÑO', month(f.fecha_factura)'MES', prov.provincia'PROVINCIA', convert(int,avg(d.cantidad*d.precio_unitario))'PROMEDIO FACTURACION', sum(d.cantidad*d.precio_unitario)'FACTURACION', count(f.id_factura)'CANT. VENTAS'
from pedidos p
join facturas f on p.id_factura = f.id_factura
join detalles d on p.id_pedido = d.id_pedido
join clientes c on p.id_cliente = c.id_cliente
join personas per on per.id_persona = c.id_persona
join barrios b on b.id_barrio = per.id_barrio
join ciudades ciu on ciu.id_ciudad = b.id_ciudad
join provincias prov on prov.id_provincia = ciu.id_provincia
join
(select c.id_cliente
from clientes c
join tipo_clientes tc on tc.id_tipo_cliente = c.id_tipo_cliente
where tc.tipo_cliente = 'concesionario'
) as c2 on c2.id_cliente = c.id_cliente
join
(select e.id_empleado,upper(substring(p.nombre,1,1))+'.'+
upper(substring(p.apellido,1,1))+lower(substring(p.apellido,2,100))'empleado'
from empleados e
join personas p on p.id_persona = e.id_persona
join tipo_empleados te on te.id_tipo_empleado = e.id_tipo_empleado
where te.tipo_empleado = 'empleado'
and id_empleado in (select id_empleado
from pedidos
where id_factura is not null
)
) as e2 on e2.id_empleado = p.id_empleado
where datediff(month,f.fecha_factura,getdate())<2 and d.id_factura is not null
and prov.provincia = 'Córdoba'
group by e2.empleado, year(f.fecha_factura), month(f.fecha_factura),prov.provincia
having avg(d.cantidad*d.precio_unitario)>=
(select avg(d.cantidad*d.precio_unitario)
from facturas f
join detalles d on d.id_factura = f.id_factura
where datediff(month,f.fecha_factura,getdate())=2
)
end;
GO
/****** Object:  StoredProcedure [dbo].[SP_AHUMADA_2]    Script Date: 23/10/2022 23:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_AHUMADA_2]
AS
BEGIN
select c2.tcliente TIPO, upper(substring(p.nombre,1,1))+lower(substring(p.apellido,2,100))+' '+
upper(substring(p.apellido,1,1))+lower(substring(p.apellido,2,100))CLIENTE,
prov.provincia PROVINCIA, ciu.ciudad CIUDAD, upper(substring(b.barrio,1,1))+
lower(substring(b.barrio,2,100)) BARRIO, lower(tc.contacto) CONTACTO,'17%' DESCUENTO
from personas p
join clientes c on p.id_persona = c.id_persona
join tipo_clientes tc on tc.id_tipo_cliente = c.id_tipo_cliente
join barrios b on b.id_barrio = p.id_barrio
join ciudades ciu on ciu.id_ciudad = b.id_ciudad
join provincias prov on prov.id_provincia = ciu.id_provincia
join
(select c.id_cliente, tc.tipo_cliente 'tcliente'
from clientes c
join tipo_clientes tc on tc.id_tipo_cliente = c.id_tipo_cliente
where tc.tipo_cliente = 'consumidor final'
) as c2 on c2.id_cliente = c.id_cliente
where c.id_cliente in (select id_cliente
from pedidos pe
join facturas f on pe.id_factura = f.id_factura
where datediff(day,f.fecha_factura,getdate())<=30
)
and tc.contacto LIKE '%@%' and tc.contacto is not null
union
select c2.tcliente, upper(substring(p.nombre,1,1))+lower(substring(p.apellido,2,100))+' '+
upper(substring(p.apellido,1,1))+lower(substring(p.apellido,2,100)),
prov.provincia, ciu.ciudad, upper(substring(b.barrio,1,1))+
lower(substring(b.barrio,2,100)), lower(tc.contacto),'13%'
from personas p
join clientes c on p.id_persona = c.id_persona
join tipo_clientes tc on tc.id_tipo_cliente = c.id_tipo_cliente
join barrios b on b.id_barrio = p.id_barrio
join ciudades ciu on ciu.id_ciudad = b.id_ciudad
join provincias prov on prov.id_provincia = ciu.id_provincia
join
(select c.id_cliente, tc2.tipo_cliente 'tcliente'
from clientes c
join tipo_clientes tc2 on tc2.id_tipo_cliente = c.id_tipo_cliente
where tc2.tipo_cliente = 'autopartes'
) as c2 on c2.id_cliente = c.id_cliente
where c.id_cliente in (select id_cliente
from pedidos pe
join facturas f on pe.id_factura = f.id_factura
where datediff(day,f.fecha_factura,getdate())<=30
)
and tc.contacto LIKE '%@%' and tc.contacto is not null
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_GUIZZO_1]    Script Date: 23/10/2022 23:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GUIZZO_1]
as
BEGIN
select year(p.fecha_pedido) 'AÑO'
,MONTH(p.fecha_pedido) 'MES'
,ma.marca 'MARCA'
,UPPER(SUBSTRING(pr.descripcion,1,1))+LOWER(SUBSTRING(pr.descripcion,2,LEN(pr.descripcion)-1)) 'PRODUCTOS'
,m.metodo_pago 'METODO_DE_PAGO'
,round(convert(money,sum(dp.precio_unitario * dp.cantidad)),2) 'IMPORTE'
,(case m.metodo_pago when 'efectivo' then round(convert(money,sum(dp.precio_unitario * dp.cantidad)/ 300,1),2) else round(0,2) end) 'DOLARES A COMPRAR'   
from
detalles dp
join PEDIDOS p on dp.id_pedido= p.id_pedido
join FACTURAS f on p.id_factura= f.id_factura
join METODO_PAGOS m on f.id_metodo_pago = m.id_metodo_pago
join PRODUCTOS pr on pr.id_producto = dp.id_producto
join MARCAS ma on pr.id_marca = ma.id_marca
where year(p.fecha_pedido) = YEAR(GETDATE())
group by  year(p.fecha_pedido)
,MONTH(p.fecha_pedido)
,m.metodo_pago
,ma.marca
,UPPER(SUBSTRING(pr.descripcion,1,1))+LOWER(SUBSTRING(pr.descripcion,2,len(pr.descripcion)-1))
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_GUIZZO_2]    Script Date: 23/10/2022 23:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[SP_GUIZZO_2]
as
begin
select year(fecha_pedido) as 'Año',pf.apellido 'Apellido'
,sum(cantidad*precio_unitario) as 'Importe total'
, count (cantidad) as 'Unidades Vendidas'
, round(convert(money,avg (cantidad*precio_unitario)),2) as 'Promedio'
, iif(sum(cantidad*precio_unitario) > 1000000, 0.15, 0.10) 'Porcentaje del Bono'
,round(convert(money,(avg (cantidad*precio_unitario) * iif(sum(cantidad*precio_unitario) > 1000000, 0.15, 0.10))),2) 'Importe del Bono'
	from PEDIDOS P join DETALLES dp on p.id_pedido=dp.id_pedido
	join empleados e on p.id_empleado=e.id_empleado
	join PERSONAS pf on e.id_empleado = pf.id_persona
	Where exists ( select p1.id_empleado
	               from detalles dp1
				   inner join PEDIDOS p1 on p1.id_pedido=dp1.id_pedido
	               inner join FACTURAS f on f.id_factura=dp1.id_factura
				   where year(f.fecha_factura) = year(getdate())
				   and datediff(month,f.fecha_factura,getdate())< 6)	                      
	group by year(fecha_pedido),pf.apellido
	having sum(cantidad*precio_unitario)/count(distinct p.id_pedido)<
								(select sum(cantidad*precio_unitario)/count(distinct p.id_pedido)
									from PEDIDOS p1 
									join DETALLES dp1 on p1.id_pedido = dp1.id_pedido
									where year(p1.fecha_pedido) = year(p.fecha_pedido))
end;
GO
/****** Object:  StoredProcedure [dbo].[SP_VILLARRUEL_1]    Script Date: 23/10/2022 23:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VILLARRUEL_1]
AS
BEGIN
select c.id_cliente as 'Id cliente', pers.apellido +', '+pers.nombre as 'Cliente',
SUM(d.cantidad*d.precio_unitario) as 'Total mensual',
AVG(d.cantidad*d.precio_unitario) as 'Promedio mensual',
AVG(d.precio_unitario) as 'Precio promedio por producto',
MONTH(f.fecha_factura) as 'Mes'
from DETALLES d inner join PRODUCTOS p on d.id_producto=p.id_producto
inner join FACTURAS f on f.id_factura=d.id_detalle inner join PEDIDOS ped on ped.id_factura = f.id_factura
inner join CLIENTES c on c.id_cliente=ped.id_cliente inner join PERSONAS pers on
pers.id_persona = c.id_persona
where DAY(f.fecha_factura) between 1 and 30 and MONTH(f.fecha_factura) between 1 and 8
group by c.id_cliente, pers.apellido,pers.nombre,MONTH(f.fecha_factura)
having SUM(d.cantidad*d.precio_unitario)>= AVG(d.cantidad*d.precio_unitario)
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_VILLARRUEL_2]    Script Date: 23/10/2022 23:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SP_VILLARRUEL_2]
as
begin
select top 3 e.id_empleado as 'id vendedor', pers.apellido +', '+pers.nombre as 'Vendedor', 
       SUM(d.cantidad*d.precio_unitario) as 'Total Anual',
	   YEAR(f.fecha_factura) as 'Año'
from DETALLES d inner join PRODUCTOS p on d.id_producto=p.id_producto
     inner join FACTURAS f on f.id_factura=d.id_detalle inner join PEDIDOS ped on ped.id_factura = f.id_factura
	 inner join EMPLEADOS e on e.id_empleado=ped.id_empleado inner join PERSONAS pers on 
	 pers.id_persona = e.id_persona
group by e.id_empleado, pers.apellido,pers.nombre, YEAR(f.fecha_factura)
having AVG(d.precio_unitario*d.cantidad)<(select AVG(d.precio_unitario*d.cantidad)
                                          from DETALLES d inner join FACTURAS f 
										  on d.id_factura= f.id_factura
                                            )
end
GO
/****** Object:  StoredProcedure [dbo].[SP_VITELLI_1]    Script Date: 23/10/2022 23:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_VITELLI_1]
AS

SELECT	p.id_producto as 'Id. Producto', 
		p.descripcion as 'Producto', 
		COUNT(d.id_producto) as 'Ventas en mes pasado',
		SUM(d.cantidad*p.precio_vta) as 'Valor total en mes pasado'

FROM PRODUCTOS p JOIN DETALLES d on d.id_producto=p.id_producto
				 JOIN FACTURAS f on d.id_factura=f.id_factura 

WHERE	p.stock=0 and 
		YEAR(f.fecha_factura)= YEAR(GETDATE()) and 
		MONTH(f.fecha_factura)= MONTH(GETDATE())

GROUP BY p.id_producto, p.descripcion

HAVING	COUNT(d.id_producto) =	(SELECT COUNT(d.id_producto)
								 FROM DETALLES d JOIN FACTURAS f on d.id_factura=f.id_factura
								 WHERE  YEAR(f.fecha_factura)= YEAR(GETDATE()) and 
										MONTH(f.fecha_factura)= MONTH(GETDATE())-1
								)
								AND
		SUM(d.cantidad*p.precio_vta) = (SELECT SUM(d.cantidad*p.precio_vta)
										FROM PRODUCTOS p JOIN DETALLES d on d.id_producto=p.id_producto
														 JOIN FACTURAS f on d.id_factura=f.id_factura 
										WHERE YEAR(f.fecha_factura)= YEAR(GETDATE())-1 and 
										MONTH(f.fecha_factura)= MONTH(GETDATE())				 
								)
GO
/****** Object:  StoredProcedure [dbo].[SP_VITELLI_2]    Script Date: 23/10/2022 23:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_VITELLI_2]
AS
SELECT	p.id_producto as 'Id. Producto SIN STOCK',
		p.descripcion as 'Descripción',
		COUNT(d.id_producto) as 'Vendidos año anterior'
FROM PRODUCTOS p	JOIN DETALLES d on d.id_producto=p.id_producto
					JOIN FACTURAS f on d.id_factura=f.id_factura	
WHERE p.precio_vta < 5000 and stock= 0 and
not exists	(SELECT p.id_producto
			FROM PRODUCTOS p	JOIN DETALLES d on d.id_producto=p.id_producto
			JOIN FACTURAS f on d.id_factura=f.id_factura
			WHERE	YEAR(f.fecha_factura)= YEAR(GETDATE()) and
					MONTH(f.fecha_factura) BETWEEN MONTH(GETDATE()) and
					MONTH(GETDATE())-2	)											
GROUP BY p.id_producto, p.descripcion
HAVING COUNT(d.id_producto) < (SELECT COUNT(d.id_producto)
		 FROM DETALLES d JOIN FACTURAS f on d.id_factura=f.id_factura
		 WHERE YEAR(f.fecha_factura)=YEAR(GETDATE())-1  )

	UNION

SELECT	p.id_producto as 'Id. Producto STOCK MENOR A 3 U.',
		p.descripcion as 'Descripción',
		COUNT(d.id_producto) as 'Vendidos año anterior'
FROM PRODUCTOS p	JOIN DETALLES d on d.id_producto=p.id_producto
					JOIN FACTURAS f on d.id_factura=f.id_factura	
WHERE p.precio_vta < 5000 and stock < 5 and
not exists	(SELECT p.id_producto
			FROM PRODUCTOS p	JOIN DETALLES d on d.id_producto=p.id_producto
			JOIN FACTURAS f on d.id_factura=f.id_factura
			WHERE	YEAR(f.fecha_factura)= YEAR(GETDATE()) and
					MONTH(f.fecha_factura) BETWEEN MONTH(GETDATE()) and
					MONTH(GETDATE())-2	)											
GROUP BY p.id_producto, p.descripcion
HAVING COUNT(d.id_producto) < (SELECT COUNT(d.id_producto)
		 FROM DETALLES d JOIN FACTURAS f on d.id_factura=f.id_factura
		 WHERE YEAR(f.fecha_factura)=YEAR(GETDATE())-1  )
	
GO
USE [master]
GO
ALTER DATABASE [AUTOMOTRIZ] SET  READ_WRITE 
GO
