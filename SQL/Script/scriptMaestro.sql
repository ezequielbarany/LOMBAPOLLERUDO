--USE [GD2C2014]
GO
SET NOCOUNT ON
GO
BEGIN TRANSACTION
GO
	
	/* Creacion de TABLAS */
----------------------------------------------------------------------------------------------------------------
-- CLIENTE --
CREATE TABLE [dbo].[Cliente](
	[numeroIdentificacion] [numeric](18, 0) NOT NULL,
	[tipoIdentificacion] [int] NOT NULL,
	[nombre] [nvarchar](255) NULL,
	[apellido] [nvarchar](255) NULL,
	[fechaNacimiento] [datetime] NULL,
	[mail] [nvarchar](255) NULL,
	[direccion] [nvarchar](255) NULL,
	[altura] [numeric](18, 0) NULL,
	[piso] [numeric](18, 0) NULL,
	[depto] [nvarchar](50) NULL,
	[nacionalidad] [nvarchar](255) NULL,
	[telefono] [nvarchar](50) NULL,
	[localidad] [nvarchar](255) NULL,
	[habilitado] [bit] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[numeroIdentificacion] ASC,
	[tipoIdentificacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ__Cliente__mail] UNIQUE NONCLUSTERED 
(
	[mail] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/*
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_TipoIdentificacion] FOREIGN KEY([tipoIdentificacion])
REFERENCES [dbo].[TipoIdentificacion] ([tipoIdentificacion])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_TipoIdentificacion]
GO
*/





----------------------------------------------------------------------------------------------------------------
-- CONSUMIBLE --

CREATE TABLE [dbo].[Consumible](
	[codigo] [numeric](18, 0) NOT NULL,
	[descripcion] [nvarchar](255) NOT NULL,
	[precio] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_Consumibles] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]




----------------------------------------------------------------------------------------------------------------
-- ESTADORESERVA --
CREATE TABLE [dbo].[EstadoReserva](
	[idEstado] [int] identity(1,1) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
 CONSTRAINT [PK_EstadoReserva}] PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


----------------------------------------------------------------------------------------------------------------
-- FACTURA --
CREATE TABLE [dbo].[Factura](
	[numeroFactura] [numeric](18, 0) NOT NULL,
	[fecha] [datetime] NULL,
	[total] [numeric](18, 2) NULL,
	[codigoReserva] [numeric](18, 0) NULL,
	[idMedioPago] [int] NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[numeroFactura] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/*
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_MedioDePago] FOREIGN KEY([idMedioPago])
REFERENCES [dbo].[MedioDePago] ([idMedioPago])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_MedioDePago]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Reserva] FOREIGN KEY([numeroFactura])
REFERENCES [dbo].[Reserva] ([codigoReserva])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Reserva]
GO
*/

----------------------------------------------------------------------------------------------------------------
-- FUNCIONALIDAD --
CREATE TABLE [dbo].[Funcionalidad](
	[idFuncionalidad] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
 CONSTRAINT [PK_Funcionalidad] PRIMARY KEY CLUSTERED 
(
	[idFuncionalidad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ__Funcionalidad__Descripcion] UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)ON [PRIMARY]
GO


----------------------------------------------------------------------------------------------------------------
-- HABITACION --
CREATE TABLE [dbo].[Habitacion](
	[idHotel] [int]  NOT NULL,
	[numeroHabitacion] [numeric](18, 0) NOT NULL,
	[piso] [numeric](18, 0) NULL,
	[ubicacion] [nvarchar](50) NULL,
	[idTipoHabitacion] [numeric](18, 0) NULL,
	[descripcion] [nvarchar](255) NULL,
	[comodidades] [nvarchar](255) NULL,
	[habilitada] [bit] NULL,
 CONSTRAINT [PK_Habitacion] PRIMARY KEY CLUSTERED 
(
	[idHotel] ASC,
	[numeroHabitacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/*
ALTER TABLE [dbo].[Habitacion]  WITH CHECK ADD  CONSTRAINT [FK_Habitacion_Hotel] FOREIGN KEY([idHotel])
REFERENCES [dbo].[Hotel] ([idHotel])
GO
ALTER TABLE [dbo].[Habitacion] CHECK CONSTRAINT [FK_Habitacion_Hotel]
GO
ALTER TABLE [dbo].[Habitacion]  WITH CHECK ADD  CONSTRAINT [FK_Habitacion_TipoDeHabitacion] FOREIGN KEY([idTipoHabitacion])
REFERENCES [dbo].[TipoDeHabitacion] ([idTipoHabitacion])
GO
ALTER TABLE [dbo].[Habitacion] CHECK CONSTRAINT [FK_Habitacion_TipoDeHabitacion]
GO
*/

----------------------------------------------------------------------------------------------------------------
-- HISTORIALHOTEL --
CREATE TABLE [dbo].[HistorialHotel](
	[idHotel] [int]  NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFin] [datetime] NOT NULL,
	[motivo] [nvarchar](255) NULL,
 CONSTRAINT [PK_HistorialHotel] PRIMARY KEY CLUSTERED 
(
	[idHotel] ASC,
	[fechaInicio] ASC,
	[fechaFin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/*
ALTER TABLE [dbo].[HistorialHotel]  WITH CHECK ADD  CONSTRAINT [FK_HistorialHotel_Hotel] FOREIGN KEY([idHotel])
REFERENCES [dbo].[Hotel] ([idHotel])
GO
ALTER TABLE [dbo].[HistorialHotel] CHECK CONSTRAINT [FK_HistorialHotel_Hotel]
GO
*/

----------------------------------------------------------------------------------------------------------------
-- HOTEL --
CREATE TABLE [dbo].[Hotel](
	[idHotel] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NULL,
	[mail] [nvarchar](255) NULL,
	[telefono] [nvarchar](255) NULL,
	[calle] [nvarchar](255) NULL,
	[nroCalle] [numeric](18, 0) NULL,
	[cantidadEstrellas] [numeric](18, 0) NULL,
	[ciudad] [nvarchar](255) NULL,
	[pais] [nvarchar](255) NULL,
	[recargaEstrella] [numeric](18, 0) NULL,
	[fechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[idHotel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

----------------------------------------------------------------------------------------------------------------
-- MEDIODEPAGO --
CREATE TABLE [dbo].[MedioDePago](
	[idMedioPago] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
	[numeroTarjeta] [nvarchar](255) NULL,
 CONSTRAINT [PK_MedioDePago] PRIMARY KEY CLUSTERED 
(
	[idMedioPago] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



----------------------------------------------------------------------------------------------------------------
-- REGIMEN --
CREATE TABLE [dbo].[Regimen](
	[codigo] [int] identity(1,1) NOT NULL,
	[descripcion] [nvarchar](255) NOT NULL,
	[precio] [numeric](18, 2) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_Regimen] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

----------------------------------------------------------------------------------------------------------------
-- REGIMENXHOTEL --
CREATE TABLE [dbo].[RegimenxHotel](
	[idHotel] [int] NOT NULL,
	[codigoRegimen] [int] NOT NULL,
 CONSTRAINT [PK_RegimenxHotel] PRIMARY KEY CLUSTERED 
(
	[idHotel] ASC,
	[codigoRegimen] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/*
ALTER TABLE [dbo].[RegimenxHotel]  WITH CHECK ADD  CONSTRAINT [FK_RegimenxHotel_Hotel] FOREIGN KEY([idHotel])
REFERENCES [dbo].[Hotel] ([idHotel])
GO
ALTER TABLE [dbo].[RegimenxHotel] CHECK CONSTRAINT [FK_RegimenxHotel_Hotel]
GO
ALTER TABLE [dbo].[RegimenxHotel]  WITH CHECK ADD  CONSTRAINT [FK_RegimenxHotel_Regimen] FOREIGN KEY([codigoRegimen])
REFERENCES [dbo].[Regimen] ([codigo])
GO
ALTER TABLE [dbo].[RegimenxHotel] CHECK CONSTRAINT [FK_RegimenxHotel_Regimen]
GO
*/


----------------------------------------------------------------------------------------------------------------
-- RESERVA --
CREATE TABLE [dbo].[Reserva](
	[codigoReserva] [numeric](18, 0) NOT NULL,
	[fechaDesde] [datetime] NULL,
	[cantidadNoches] [numeric](18, 0) NULL,
	[fechaHasta] [datetime] NULL,
	[fechaRealizacion] [datetime] NULL,
	[idEstadoReserva] [int] NULL,
	[numeroIdentificacion] [numeric](18, 0) NULL,
	[tipoIdentificacion] [int] NULL,
	[precioParcial] [numeric](18, 2) NULL,
	[fechaInicioEstadia] [datetime] NULL,
	[fechaFinEstadia] [datetime] NULL,
	[username] [nvarchar](50) NULL,
	[codigoRegimen] [int] NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[codigoReserva] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

----------------------------------------------------------------------------------------------------------------
-- RESERVAXCLIENTE --
CREATE TABLE [dbo].[ReservaxCliente](
	[codigoReserva] [numeric](18, 0) NOT NULL,
	[numeroIdentificacionCliente] [numeric](18, 0) NOT NULL,
	[tipoIdentificacionCliente] [int] NOT NULL,
 CONSTRAINT [PK_ReservaxCliente] PRIMARY KEY CLUSTERED 
(
	[codigoReserva] ASC,
	[numeroIdentificacionCliente] ASC,
	[tipoIdentificacionCliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

----------------------------------------------------------------------------------------------------------------
-- RESERVAXCONSUMIBLE --
CREATE TABLE [dbo].[ReservaxConsumible](
	[codigoReserva] [numeric](18, 0) NOT NULL,
	[codigoConsumible] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_ReservaxConsumible] PRIMARY KEY CLUSTERED 
(
	[codigoReserva] ASC,
	[codigoConsumible] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

----------------------------------------------------------------------------------------------------------------
-- RESERVAXHABITACION --
CREATE TABLE [dbo].[ReservaxHabitacion](
	[codigoReserva] [numeric](18, 0) NOT NULL,
	[idHotel] [int] NOT NULL,
	[numeroHabitacion] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_ReservaxHabitacion] PRIMARY KEY CLUSTERED 
(
	[codigoReserva] ASC,
	[idHotel] ASC,
	[numeroHabitacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

----------------------------------------------------------------------------------------------------------------
-- ROL --
CREATE TABLE [dbo].[Rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
) ON [PRIMARY]

GO

----------------------------------------------------------------------------------------------------------------
-- ROLXFUNCIONALIDAD --
CREATE TABLE [dbo].[RolxFuncionalidad](
	[idRol] [int] NOT NULL,
	[idFuncionalidad] [int] NOT NULL,
 CONSTRAINT [PK_RolxFuncionalidad] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC,
	[idFuncionalidad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/*
ALTER TABLE [dbo].[RolxFuncionalidad]  WITH CHECK ADD  CONSTRAINT [FK_RolxFuncionalidad_Funcionalidad] FOREIGN KEY([idFuncionalidad])
REFERENCES [dbo].[Funcionalidad] ([idFuncionalidad])
GO

ALTER TABLE [dbo].[RolxFuncionalidad] CHECK CONSTRAINT [FK_RolxFuncionalidad_Funcionalidad]
GO

ALTER TABLE [dbo].[RolxFuncionalidad]  WITH CHECK ADD  CONSTRAINT [FK_RolxFuncionalidad_Rol] FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO

ALTER TABLE [dbo].[RolxFuncionalidad] CHECK CONSTRAINT [FK_RolxFuncionalidad_Rol]
GO
*/

----------------------------------------------------------------------------------------------------------------
-- ROLXUSUARIO --

CREATE TABLE [dbo].[RolxUsuario](
	[idRol] [int] NOT NULL,
	[username] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RolxUsuario] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC,
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

----------------------------------------------------------------------------------------------------------------
-- TIPODEHABITACION --
CREATE TABLE [dbo].[TipoDeHabitacion](
	[idTipoHabitacion] [numeric](18, 0) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
	[tipoPorcentual] [numeric](18, 2) NULL,
	[capacidad] [int] NULL,
 CONSTRAINT [PK_TipoDeHabitacion] PRIMARY KEY CLUSTERED 
(
	[idTipoHabitacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

----------------------------------------------------------------------------------------------------------------
-- TIPOIDENTIFICACION --
CREATE TABLE [dbo].[TipoIdentificacion](
	[tipoIdentificacion] [int] IDENTITY(1,1) NOT NULL,
	[descripcionCorta] [nvarchar](5) NULL,
	[descripcionLarga] [nvarchar](50) NULL,
 CONSTRAINT [PK_TipoIdentificacion] PRIMARY KEY CLUSTERED 
(
	[tipoIdentificacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO




----------------------------------------------------------------------------------------------------------------
-- USUARIO --
CREATE TABLE [dbo].[Usuario](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](max) NULL,
	[intentosFallidos] [int] NULL,
	[documento] [nvarchar](50) NULL,
	[tipoDocumento] [nvarchar](50) NULL,
	[nombre] [nvarchar](50) NULL,
	[apellido] [nvarchar](50) NULL,
	[mail] [nvarchar](50) NULL,
	[tel] [nvarchar](50) NULL,
	[direccion] [nvarchar](50) NULL,
	[fechaNacimiento] [datetime] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


----------------------------------------------------------------------------------------------------------------
-- USUARIOXHOTEL --
CREATE TABLE [dbo].[UsuarioxHotel](
	[username] [nvarchar](50) NOT NULL,
	[idHotel] [int] NOT NULL,
 CONSTRAINT [PK_UsuarioxHotel] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[idHotel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO




COMMIT
GO




/*
--------------------------------
-- CARGA DE DATOS FROM MASTER --
--------------------------------
--   
--  
--          --
                      --
-- IMPORTANTE - NO ESTAN EN ORDEN - -  - - - -
-- - -
  -- 
  ---  --- - - 
  --  
   -- - 
    
    --

------------------------------------------------------------------------------------------------
-- TABLA CLIENTES --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[Cliente]
select numeroIdentificacion,
		tipoIdentificacion,
		nombre,
		apellido,
		fechaNacimiento,
		mail,
		direccion,
		altura,
		piso,
		depto,
		nacionalidad,
		telefono,
		localidad,
		habilitado,
		tieneDuplicados
		from 
		(
SELECT	ROW_NUMBER()OVER(PARTITION BY mail ORDER BY fechaNacimiento ASC) as 'nroFilaMail',
		numeroIdentificacion,
		tipoIdentificacion,
		nombre,
		apellido,
		fechaNacimiento,
		mail,
		direccion,
		altura,
		piso,
		depto,
		nacionalidad,
		telefono,
		localidad,
		habilitado,
		tieneDuplicados
from
(SELECT		ROW_NUMBER()
			OVER(PARTITION BY [Cliente_Pasaporte_Nro] ORDER BY [Cliente_Fecha_Nac] ASC) as 'nroFilaDocu', 
				[Cliente_Pasaporte_Nro] AS numeroIdentificacion,
				[Cliente_Mail] as mail,
				(SELECT tipoIdentificacion FROM TipoIdentificacion WHERE UPPER(descripcionLarga) LIKE '%PASAPORTE%') AS tipoIdentificacion,
				[Cliente_Nombre] as nombre,
				[Cliente_Apellido] as apellido,
				[Cliente_Fecha_Nac] as fechaNacimiento,
				[Cliente_Dom_Calle] as direccion,
				[Cliente_Nro_Calle] as altura,
				[Cliente_Piso] as piso,
				[Cliente_Depto] as depto,
				[Cliente_Nacionalidad] as nacionalidad,
				'' as telefono,
				'' as localidad,
				1 as habilitado,
				0 as tieneDuplicados
FROM [GD2C2014].[gd_esquema].[Maestra]				
) conNroFilaDocu
where nroFilaDocu = 1
)conNroFIlaMail
where nroFilaMail = 1
----------------------------------------------------------------------
UPDATEO LOS QUE TIENEN DUPLICADOS (POR NRO PASAPORTE IDENTIFICACION)
----------------------------------------------------------------------
update [dbo].[Cliente]
set tieneDuplicados = 1
where numeroIdentificacion in 
(select distinct numeroIdentificacion from (SELECT		ROW_NUMBER()
			OVER(PARTITION BY [Cliente_Pasaporte_Nro] ORDER BY [Cliente_Fecha_Nac] ASC) as 'nroFilaDocu', 
				[Cliente_Pasaporte_Nro] AS numeroIdentificacion,
				[Cliente_Mail] as mail,
				1 AS tipoIdentificacion,
				[Cliente_Nombre] as nombre,
				[Cliente_Apellido] as apellido,
				[Cliente_Fecha_Nac] as fechaNacimiento,
				[Cliente_Dom_Calle] as direccion,
				[Cliente_Nro_Calle] as altura,
				[Cliente_Piso] as piso,
				[Cliente_Depto] as depto,
				[Cliente_Nacionalidad] as nacionalidad,
				'' as telefono,
				'' as localidad,
				1 as habilitado,
				0 as tieneDuplicados
FROM [GD2C2014].gd_esquema.Maestra				
) conNroFilaDocu
where nroFilaDocu > 6)

------------------------------------------------------------------------------------------------
-- TABLA CONSUMIBLES --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[Consumible]
SELECT DISTINCT [Consumible_Codigo],[Consumible_Descripcion],[Consumible_Precio] 
FROM [GD2C2014].[gd_esquema].[Maestra]
WHERE [Consumible_Codigo] IS NOT NULL
ORDER BY 1
------------------------------------------------------------------------------------------------
-- TABLA ESTADORESERVA --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[EstadoReserva]
SELECT 'Reserva correcta'
INSERT INTO [dbo].[EstadoReserva]
SELECT 'Reserva con Ingreso'
INSERT INTO [dbo].[EstadoReserva]
SELECT 'Reserva modifica'
UNION
SELECT 'Reserva cancelada por recepcion'
UNION
SELECT 'Reserva cancelada por cliente'
UNION
SELECT 'Reserva cancelada por No-Show'

------------------------------------------------------------------------------------------------
-- TABLA FUNCIONALIDAD --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[Funcionalidad]
SELECT 'ABM Cliente'
UNION
SELECT 'ABM Hotel'
UNION
SELECT 'Todo'
------------------------------------------------------------------------------------------------
-- TABLA HOTEL --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[HOTEL]
SELECT DISTINCT 
		NULL						nombre
		,NULL						mail
		,NULL						telefono
		,[Hotel_Calle]				calle
		,[Hotel_Nro_Calle]			nroCalle
		,[Hotel_CantEstrella]		cantidadEstrellas
		,[Hotel_Ciudad]				ciudad
		,NULL						pais
		,[Hotel_Recarga_Estrella]	recargaEstrella
		,GETDATE()					fechaCreacion
FROM [GD2C2014].[gd_esquema].[Maestra]
------------------------------------------------------------------------------------------------
-- TABLA MEDIODEPAGO --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[MEDIODEPAGO]
SELECT 'NO DISPONIBLE','NO DISPONIBLE'
------------------------------------------------------------------------------------------------
-- TABLA REGIMEN --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[REGIMEN]
SELECT DISTINCT Regimen_Descripcion as descripcion,Regimen_Precio as precio ,1 as estado
FROM [GD2C2014].[gd_esquema].[Maestra]
------------------------------------------------------------------------------------------------
-- TABLA REGIMENxhotel --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[REGIMENXHOTEL]
SELECT H.idHotel as idHotel, R.codigo as codigoRegimen --rXh.Regimen_Descripcion,rXh.Regimen_Precio,
  FROM dbo.Hotel H, dbo.Regimen R ,(SELECT DISTINCT [Hotel_Ciudad]
											,[Hotel_Calle]
											,[Hotel_Nro_Calle]
											,[Hotel_CantEstrella]
											,[Hotel_Recarga_Estrella]
											,[Regimen_Descripcion]
											,[Regimen_Precio]
									FROM [GD2C2014].[gd_esquema].[Maestra]
									) rXh
/* JOIN's */
where	H.calle = rXh.Hotel_Calle
		and H.nroCalle = rXh.Hotel_Nro_Calle
		and H.ciudad = rXh.Hotel_Ciudad
		and H.cantidadEstrellas = rXh.Hotel_CantEstrella
		and R.descripcion = rXh.Regimen_Descripcion
		and R.precio = rXh.Regimen_Precio
------------------------------------------------------------------------------------------------
-- TABLA ROL --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[ROL]
SELECT 'Admin','1'
union
SELECT 'Conserje','1'
union
SELECT 'Empleado','1'
------------------------------------------------------------------------------------------------
-- TABLA TIPODEHABITACION --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[TIPODEHABITACION]
SELECT DISTINCT Habitacion_Tipo_Codigo AS idTipoHabitacion
				,Habitacion_Tipo_Descripcion as descricion
				,Habitacion_Tipo_Porcentual as tipoPorcentual
				,''
FROM [GD2C2014].[gd_esquema].[Maestra]
------------------------------------------------------------------------------------------------
-- TABLA TIPOIDENTIFICACION --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[TipoIdentificacion]  
SELECT 'PAS','Pasaporte'
UNION
SELECT 'DNI','Documento Nacional de Identidad'
------------------------------------------------------------------------------------------------
-- TABLA USUARIO --                                            HAY QUE HASHEAR LA PASSWORD
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[USUARIO]  
SELECT 'scriptMigracion','script',0,'99999999','DNI','SQL','SERVER','scriptloco@gmail.com','0800-SCRIPT','Av. SQL 123','1950-01-04 00:00:00.000'
union
SELECT 'admin','adm123',0,'36200300','DNI','Roberto','Gomez','rob@gmail.com','4804-2020','Av. Rivadavia 3045','1980-11-02 00:00:00.000'
UNION
SELECT 'aperez','1234',0,'36999300','DNI','Adalberto','Perez','rob@gmail.com','4804-2020','Av. Directorio 3242','1991-12-12 00:00:00.000'


------------------------------------------------------------------------------------------------
-- TABLA USUARIOXHOTEL --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[USUARIOXHOTEL]  
SELECT DISTINCT 'admin', idHotel from Hotel
union 
select 'aperez',2
------------------------------------------------------------------------------------------------
-- TABLA ROLxUSUARIO --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[ROLxUSUARIO]  
SELECT DISTINCT idRol,'admin' from Rol
union 
select 2,'aperez'
------------------------------------------------------------------------------------------------
-- TABLA ROLxFUNCIONALIDAD --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[ROLxFuncionalidad]  
SELECT 1,3
union 
select 2,2
union
select 2,1
------------------------------------------------------------------------------------------------
-- TABLA HABITACION --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[habitacion]  
SELECT	 H.idHotel as idHotel
		,habXhot.Habitacion_Numero as numeroHabitacion
		,habXhot.Habitacion_Piso as piso
		,habXhot.Habitacion_Frente as ubicacion
		,habXhot.Habitacion_Tipo_Codigo as idTipoHabitacion
		,NULL as descripcion
		,NULL as comodidades
		,1 as habilitada
  FROM dbo.Hotel H ,(SELECT DISTINCT 
			[Hotel_Ciudad],[Hotel_Calle],[Hotel_Nro_Calle],[Hotel_CantEstrella],[Hotel_Recarga_Estrella]
			,[Habitacion_Numero],[Habitacion_Piso],[Habitacion_Frente]
			,[Habitacion_Tipo_Codigo]
					FROM [GD2C2014].[gd_esquema].[Maestra]
					) habXhot
/* JOIN's */
where	H.calle = habXhot.Hotel_Calle
		and H.nroCalle = habXhot.Hotel_Nro_Calle
		and H.ciudad = habXhot.Hotel_Ciudad
		and H.cantidadEstrellas = habXhot.Hotel_CantEstrella
------------------------------------------------------------------------------------------------
-- TABLA RESERVA --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[RESERVA] 
SELECT	codigoReserva,fechaDesde,cantidadNoches,fechaHasta,fechaRealizacion
		,(Case
			when fechaInicioEstadia IS NULL  then 1
			else 2
			end)																	as idEstadoReserva
		,numeroIdentificacion,tipoIdentificacion,precioParcial,fechaInicioEstadia,fechaFinEstadia,username,codigoRegimen
FROM
(
SELECT  *
		,(select top 1 [Estadia_Fecha_Inicio]	
			FROM [GD2C2014].[gd_esquema].[Maestra]
			where Reserva_Codigo = codigoReserva 
			and Estadia_Fecha_Inicio is not null)									as fechaInicioEstadia
		 ,DATEADD(DAY
					,(select top 1 [Estadia_Cant_Noches]	
						FROM [GD2C2014].[gd_esquema].[Maestra]
						where Reserva_Codigo = codigoReserva 
						and Estadia_Cant_Noches is not null)
					,(select top 1 [Estadia_Fecha_Inicio]	
						FROM [GD2C2014].[gd_esquema].[Maestra]
						where Reserva_Codigo = codigoReserva 
						and Estadia_Fecha_Inicio is not null))						as fechaFinEstadia
from 
(
SELECT distinct
		[Reserva_Codigo]															as codigoReserva
		,[Reserva_Fecha_Inicio]														as fechaDesde
		,[Reserva_Cant_Noches]														as cantidadNoches
		,DATEADD(DAY,isnull([Reserva_Cant_Noches],0),[Reserva_Fecha_Inicio])		as fechaHasta
		,NULL																		as fechaRealizacion
		,[Cliente_Pasaporte_Nro]													as numeroIdentificacion
		,1																			as tipoIdentificacion
		,CAST(0.00 AS NUMERIC(18,2))												as precioParcial
        ,'scriptMigracion'															as username
		,(Select codigo from Regimen 
			where descripcion=[Regimen_Descripcion] and precio=[Regimen_Precio])	as codigoRegimen
FROM [GD2C2014].[gd_esquema].[Maestra]
) a
) b








*/