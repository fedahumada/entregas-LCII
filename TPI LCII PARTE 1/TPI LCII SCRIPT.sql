CREATE DATABASE AUTOMOTRIZ
GO
USE AUTOMOTRIZ;
GO

--CREACION TABLAS

CREATE TABLE PROVINCIAS(
id_provincia	int IDENTITY(1,1),
provincia		varchar(100) NOT NULL,
	CONSTRAINT pk_provincias PRIMARY KEY (id_provincia)
)

CREATE TABLE CIUDADES(
id_ciudad		int IDENTITY(1,1),
ciudad			varchar(100) NOT NULL,
id_provincia	int NOT NULL,
	CONSTRAINT pk_ciudades PRIMARY KEY (id_ciudad)
	CONSTRAINT fk_ciudades_provincias FOREIGN KEY (id_provincia)
		REFERENCES PROVINCIAS (id_provincia)
)

CREATE TABLE BARRIOS(
id_barrio	int IDENTITY(1,1),
barrio		varchar(100) NOT NULL,
id_ciudad	int NOT NULL,
	CONSTRAINT pk_barrios PRIMARY KEY (id_barrio)
	CONSTRAINT fk_barrios_ciudades FOREIGN KEY (id_ciudad)
		REFERENCES CIUDADES (id_ciudad)
)

CREATE TABLE PERSONAS(
id_persona		int IDENTITY(1,1),
nombre			varchar(100) NOT NULL,
apellido		varchar(100) NOT NULL,
documento		int NOT NULL,
dire_persona	varchar(100) NOT NULL,
id_barrio		int NOT NULL,
	CONSTRAINT pk_personas PRIMARY KEY (id_persona)
	CONSTRAINT fk_personas_barrios FOREIGN KEY (id_barrio)
		REFERENCES BARRIOS (id_barrio)
)

CREATE TABLE EMPRESAS(
id_empresa		int IDENTITY(1,1),
razon_social	varchar(100) NOT NULL,
dire_empresa	varchar(100) NOT NULL,
cuit			int NOT NULL,
id_barrio		int NOT NULL,
	CONSTRAINT pk_empresas PRIMARY KEY (id_empresa)
	CONSTRAINT fk_empresas_barrios FOREIGN KEY (id_barrio)
		REFERENCES BARRIOS (id_barrio)
)

CREATE TABLE TIPO_EMPLEADOS(
id_tipo_empleado	int IDENTITY(1,1),
tipo_empleado		varchar(100) NOT NULL,
	CONSTRAINT pk_tipo_empleados PRIMARY KEY (id_tipo_empleado)
)

CREATE TABLE EMPLEADOS(
id_empleado			int IDENTITY(1,1),
id_tipo_empleado	int NOT NULL,
cuit				int NOT NULL,
	CONSTRAINT pk_empleados PRIMARY KEY (id_empleado)
	CONSTRAINT fk_empleados_tipo_empleados FOREIGN KEY (id_tipo_empleado)
		REFERENCES TIPO_EMPLEADOS (id_tipo_empleado)
)




CREATE TABLE MARCAS(
id_marca	int IDENTITY(1,1),
marca		varchar(100) NOT NULL,
	CONSTRAINT pk_marcas PRIMARY KEY (id_marca)
)

CREATE TABLE TIPO_PRODUCTOS(
id_tipo_producto	int IDENTITY(1,1),
tipo_producto		varchar(100) NOT NULL,
	CONSTRAINT pk_tipo_productos PRIMARY KEY (id_tipo_producto)
)

CREATE TABLE PRODUCTOS(
id_producto			int IDENTITY(1,1),
modelo				varchar(100) NOT NULL,
anio				int NOT NULL,
id_marca			int NOT NULL,	
id_tipo_producto	int NOT NULL,
	CONSTRAINT pk_productos PRIMARY KEY (id_producto)
	CONSTRAINT fk_productos_marcas FOREIGN KEY (id_marca)
		REFERENCES MARCAS (id_marca)
	CONSTRAINT fk_productos_tipo_productos FOREIGN KEY (id_tipo_producto)
		REFERENCES TIPO_PRODUCTOS (id_tipo_producto)
)


