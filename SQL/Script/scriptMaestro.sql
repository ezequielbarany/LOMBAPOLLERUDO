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
	[numeroIdentificacion] [NUMERIC](18, 0) NOT NULL,
	[tipoIdentificacion] [INT] NOT NULL,
	[nombre] [NVARCHAR](255) NULL,
	[apellido] [NVARCHAR](255) NULL,
	[fechaNacimiento] [DATETIME] NULL,
	[mail] [NVARCHAR](255) NULL,
	[direccion] [NVARCHAR](255) NULL,
	[altura] [NUMERIC](18, 0) NULL,
	[piso] [NUMERIC](18, 0) NULL,
	[depto] [NVARCHAR](50) NULL,
	[nacionalidad] [NVARCHAR](255) NULL,
	[telefono] [NVARCHAR](50) NULL,
	[localidad] [NVARCHAR](255) NULL,
	[habilitado] [BIT] NULL,
	[tieneDuplicados] [BIT] NULL,
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
-- CLIENTE_ERROR --
CREATE TABLE [dbo].[Cliente_ERROR](
	[numeroIdentificacion] [NUMERIC](18, 0) NOT NULL,
	[tipoIdentificacion] [INT] NOT NULL,
	[nombre] [NVARCHAR](255) NULL,
	[apellido] [NVARCHAR](255) NULL,
	[fechaNacimiento] [DATETIME] NULL,
	[mail] [NVARCHAR](255) NULL,
	[direccion] [NVARCHAR](255) NULL,
	[altura] [NUMERIC](18, 0) NULL,
	[piso] [NUMERIC](18, 0) NULL,
	[depto] [NVARCHAR](50) NULL,
	[nacionalidad] [NVARCHAR](255) NULL,
	[telefono] [NVARCHAR](50) NULL,
	[localidad] [NVARCHAR](255) NULL,
	[habilitado] [BIT] NULL
)
----------------------------------------------------------------------------------------------------------------
-- CONSUMIBLE --

CREATE TABLE [dbo].[Consumible](
	[codigo] [NUMERIC](18, 0) NOT NULL,
	[descripcion] [NVARCHAR](255) NOT NULL,
	[precio] [NUMERIC](18, 2) NOT NULL,
 CONSTRAINT [PK_Consumibles] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]




----------------------------------------------------------------------------------------------------------------
-- ESTADORESERVA --
CREATE TABLE [dbo].[EstadoReserva](
	[idEstado] [INT] IDENTITY(1,1) NOT NULL,
	[descripcion] [NVARCHAR](255) NULL,
 CONSTRAINT [PK_EstadoReserva}] PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


----------------------------------------------------------------------------------------------------------------
-- FACTURA --
CREATE TABLE [dbo].[Factura](
	[numeroFactura] [NUMERIC](18, 0) NOT NULL,
	[fecha] [DATETIME] NULL,
	[total] [NUMERIC](18, 2) NULL,
	[codigoReserva] [NUMERIC](18, 0) NULL,
	[idMedioPago] [INT] NULL,
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
	[idFuncionalidad] [INT] IDENTITY(1,1) NOT NULL,
	[descripcion] [NVARCHAR](255) NULL,
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
	[idHotel] [INT]  NOT NULL,
	[numeroHabitacion] [NUMERIC](18, 0) NOT NULL,
	[piso] [NUMERIC](18, 0) NULL,
	[ubicacion] [NVARCHAR](50) NULL,
	[idTipoHabitacion] [NUMERIC](18, 0) NULL,
	[descripcion] [NVARCHAR](255) NULL,
	[comodidades] [NVARCHAR](255) NULL,
	[habilitada] [BIT] NULL,
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
	[idHotel] [INT]  NOT NULL,
	[fechaInicio] [DATETIME] NOT NULL,
	[fechaFin] [DATETIME] NOT NULL,
	[motivo] [NVARCHAR](255) NULL,
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
	[idHotel] [INT] IDENTITY(1,1) NOT NULL,
	[nombre] [NVARCHAR](255) NULL,
	[mail] [NVARCHAR](255) NULL,
	[telefono] [NVARCHAR](255) NULL,
	[calle] [NVARCHAR](255) NULL,
	[nroCalle] [NUMERIC](18, 0) NULL,
	[cantidadEstrellas] [NUMERIC](18, 0) NULL,
	[ciudad] [NVARCHAR](255) NULL,
	[pais] [NVARCHAR](255) NULL,
	[recargaEstrella] [NUMERIC](18, 0) NULL,
	[fechaCreacion] [DATETIME] NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[idHotel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

----------------------------------------------------------------------------------------------------------------
-- MEDIODEPAGO --
CREATE TABLE [dbo].[MedioDePago](
	[idMedioPago] [INT] IDENTITY(1,1) NOT NULL,
	[descripcion] [NVARCHAR](255) NULL,
	[numeroTarjeta] [NVARCHAR](255) NULL,
 CONSTRAINT [PK_MedioDePago] PRIMARY KEY CLUSTERED 
(
	[idMedioPago] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



----------------------------------------------------------------------------------------------------------------
-- REGIMEN --
CREATE TABLE [dbo].[Regimen](
	[codigo] [INT] IDENTITY(1,1) NOT NULL,
	[descripcion] [NVARCHAR](255) NOT NULL,
	[precio] [NUMERIC](18, 2) NOT NULL,
	[estado] [BIT] NOT NULL,
 CONSTRAINT [PK_Regimen] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

----------------------------------------------------------------------------------------------------------------
-- REGIMENXHOTEL --
CREATE TABLE [dbo].[RegimenxHotel](
	[idHotel] [INT] NOT NULL,
	[codigoRegimen] [INT] NOT NULL,
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
	[codigoReserva] [NUMERIC](18, 0) NOT NULL,
	[fechaDesde] [DATETIME] NULL,
	[cantidadNoches] [NUMERIC](18, 0) NULL,
	[fechaHasta] [DATETIME] NULL,
	[fechaRealizacion] [DATETIME] NULL,
	[idEstadoReserva] [INT] NULL,
	[numeroIdentificacion] [NUMERIC](18, 0) NULL,
	[tipoIdentificacion] [INT] NULL,
	[precioParcial] [NUMERIC](18, 2) NULL,
	[fechaInicioEstadia] [DATETIME] NULL,
	[fechaFinEstadia] [DATETIME] NULL,
	[username] [NVARCHAR](50) NULL,
	[codigoRegimen] [INT] NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[codigoReserva] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

----------------------------------------------------------------------------------------------------------------
-- RESERVAXCLIENTE --
CREATE TABLE [dbo].[ReservaxCliente](
	[codigoReserva] [NUMERIC](18, 0) NOT NULL,
	[numeroIdentificacionCliente] [NUMERIC](18, 0) NOT NULL,
	[tipoIdentificacionCliente] [INT] NOT NULL,
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
	[codigoReserva] [NUMERIC](18, 0) NOT NULL,
	[codigoConsumible] [NUMERIC](18, 0) NOT NULL,
	[cantidadItems] TINYINT NOT NULL
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
	[codigoReserva] [NUMERIC](18, 0) NOT NULL,
	[idHotel] [INT] NOT NULL,
	[numeroHabitacion] [NUMERIC](18, 0) NOT NULL,
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
	[idRol] [INT] IDENTITY(1,1) NOT NULL,
	[nombre] [NVARCHAR](255) NULL,
	[estado] [BIT] NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
) ON [PRIMARY]

GO

----------------------------------------------------------------------------------------------------------------
-- ROLXFUNCIONALIDAD --
CREATE TABLE [dbo].[RolxFuncionalidad](
	[idRol] [INT] NOT NULL,
	[idFuncionalidad] [INT] NOT NULL,
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
	[idRol] [INT] NOT NULL,
	[username] [NVARCHAR](50) NOT NULL,
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
	[idTipoHabitacion] [NUMERIC](18, 0) NOT NULL,
	[descripcion] [NVARCHAR](255) NULL,
	[tipoPorcentual] [NUMERIC](18, 2) NULL,
	[capacidad] [INT] NULL,
 CONSTRAINT [PK_TipoDeHabitacion] PRIMARY KEY CLUSTERED 
(
	[idTipoHabitacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

----------------------------------------------------------------------------------------------------------------
-- TIPOIDENTIFICACION --
CREATE TABLE [dbo].[TipoIdentificacion](
	[tipoIdentificacion] [INT] IDENTITY(1,1) NOT NULL,
	[descripcionCorta] [NVARCHAR](5) NULL,
	[descripcionLarga] [NVARCHAR](50) NULL,
 CONSTRAINT [PK_TipoIdentificacion] PRIMARY KEY CLUSTERED 
(
	[tipoIdentificacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO




----------------------------------------------------------------------------------------------------------------
-- USUARIO --
CREATE TABLE [dbo].[Usuario](
	[username] [NVARCHAR](50) NOT NULL,
	[password] [NVARCHAR](MAX) NULL,
	[intentosFallidos] [INT] NULL,
	[documento] [NVARCHAR](50) NULL,
	[tipoDocumento] [NVARCHAR](50) NULL,
	[nombre] [NVARCHAR](50) NULL,
	[apellido] [NVARCHAR](50) NULL,
	[mail] [NVARCHAR](50) NULL,
	[tel] [NVARCHAR](50) NULL,
	[direccion] [NVARCHAR](50) NULL,
	[fechaNacimiento] [DATETIME] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


----------------------------------------------------------------------------------------------------------------
-- USUARIOXHOTEL --
CREATE TABLE [dbo].[UsuarioxHotel](
	[username] [NVARCHAR](50) NOT NULL,
	[idHotel] [INT] NOT NULL,
 CONSTRAINT [PK_UsuarioxHotel] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[idHotel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO




COMMIT
GO


BEGIN TRANSACTION
GO
-----------------------------------------------------------------------------------------------
-- TABLA ROL --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[ROL]
SELECT 'Admin','1'
UNION
SELECT 'Conserje','1'
UNION
SELECT 'Empleado','1'
------------------------------------------------------------------------------------------------
-- TABLA TIPODEHABITACION --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[TIPODEHABITACION]
SELECT DISTINCT Habitacion_Tipo_Codigo AS idTipoHabitacion
				,Habitacion_Tipo_Descripcion AS descricion
				,Habitacion_Tipo_Porcentual AS tipoPorcentual
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
-- TABLA CLIENTES --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[Cliente]
SELECT numeroIdentificacion,
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
		FROM 
		(
SELECT	ROW_NUMBER()OVER(PARTITION BY mail ORDER BY fechaNacimiento ASC) AS 'nroFilaMail',
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
FROM
(SELECT		ROW_NUMBER()
			OVER(PARTITION BY [Cliente_Pasaporte_Nro] ORDER BY [Cliente_Fecha_Nac] ASC) AS 'nroFilaDocu', 
				[Cliente_Pasaporte_Nro] AS numeroIdentificacion,
				[Cliente_Mail] AS mail,
				(SELECT tipoIdentificacion FROM TipoIdentificacion WHERE UPPER(descripcionLarga) LIKE '%PASAPORTE%') AS tipoIdentificacion,
				[Cliente_Nombre] AS nombre,
				[Cliente_Apellido] AS apellido,
				[Cliente_Fecha_Nac] AS fechaNacimiento,
				[Cliente_Dom_Calle] AS direccion,
				[Cliente_Nro_Calle] AS altura,
				[Cliente_Piso] AS piso,
				[Cliente_Depto] AS depto,
				[Cliente_Nacionalidad] AS nacionalidad,
				'' AS telefono,
				'' AS localidad,
				1 AS habilitado,
				0 AS tieneDuplicados
FROM [GD2C2014].[gd_esquema].[Maestra]				
) conNroFilaDocu
WHERE nroFilaDocu = 1
)conNroFIlaMail
WHERE nroFilaMail = 1
----------------------------------------------------------------------
--UPDATEO LOS QUE TIENEN DUPLICADOS (POR NRO PASAPORTE IDENTIFICACION)
----------------------------------------------------------------------
UPDATE [dbo].[Cliente]
SET tieneDuplicados = 1
WHERE numeroIdentificacion IN 
(SELECT DISTINCT numeroIdentificacion FROM (SELECT		ROW_NUMBER()
			OVER(PARTITION BY [Cliente_Pasaporte_Nro] ORDER BY [Cliente_Fecha_Nac] ASC) AS 'nroFilaDocu', 
				[Cliente_Pasaporte_Nro] AS numeroIdentificacion,
				[Cliente_Mail] AS mail,
				1 AS tipoIdentificacion,
				[Cliente_Nombre] AS nombre,
				[Cliente_Apellido] AS apellido,
				[Cliente_Fecha_Nac] AS fechaNacimiento,
				[Cliente_Dom_Calle] AS direccion,
				[Cliente_Nro_Calle] AS altura,
				[Cliente_Piso] AS piso,
				[Cliente_Depto] AS depto,
				[Cliente_Nacionalidad] AS nacionalidad,
				'' AS telefono,
				'' AS localidad,
				1 AS habilitado,
				0 AS tieneDuplicados
FROM [GD2C2014].gd_esquema.Maestra				
) conNroFilaDocu
WHERE nroFilaDocu > 6)
----------------------------------------------------------------------
-- CARGAMOS TABLA ERRORES por PASAPORTE duplicados
----------------------------------------------------------------------
INSERT INTO [dbo].[Cliente_ERROR]
SELECT DISTINCT
				[Cliente_Pasaporte_Nro] AS numeroIdentificacion,
				(SELECT tipoIdentificacion FROM TipoIdentificacion WHERE UPPER(descripcionLarga) LIKE '%PASAPORTE%') AS tipoIdentificacion,
				[Cliente_Nombre] AS nombre,
				[Cliente_Apellido] AS apellido,
				[Cliente_Fecha_Nac] AS fechaNacimiento,
				[Cliente_Mail] AS mail,
				[Cliente_Dom_Calle] AS direccion,
				[Cliente_Nro_Calle] AS altura,
				[Cliente_Piso] AS piso,
				[Cliente_Depto] AS depto,
				[Cliente_Nacionalidad] AS nacionalidad,
				'' AS telefono,
				'' AS localidad,
				1 AS habilitado
FROM [GD2C2014].gd_esquema.Maestra
WHERE [Cliente_Pasaporte_Nro] in 
(
SELECT DISTINCT numeroIdentificacion FROM (SELECT		ROW_NUMBER()
			OVER(PARTITION BY [Cliente_Pasaporte_Nro] ORDER BY [Cliente_Fecha_Nac] ASC) AS 'nroFilaDocu', 
				[Cliente_Pasaporte_Nro] AS numeroIdentificacion,
				[Cliente_Mail] AS mail,
				1 AS tipoIdentificacion,
				[Cliente_Nombre] AS nombre,
				[Cliente_Apellido] AS apellido,
				[Cliente_Fecha_Nac] AS fechaNacimiento,
				[Cliente_Dom_Calle] AS direccion,
				[Cliente_Nro_Calle] AS altura,
				[Cliente_Piso] AS piso,
				[Cliente_Depto] AS depto,
				[Cliente_Nacionalidad] AS nacionalidad,
				'' AS telefono,
				'' AS localidad,
				1 AS habilitado,
				0 AS tieneDuplicados
FROM [GD2C2014].gd_esquema.Maestra				
) conNroFilaDocu
WHERE nroFilaDocu > 6
)
----------------------------------------------------------------------
-- CARGAMOS TABLA ERRORES por MAILS duplicados
----------------------------------------------------------------------
SELECT DISTINCT mails.Cliente_Mail AS mail, a.Cliente_Pasaporte_Nro AS numeroIdentificacion
INTO #TEMPORAL
FROM [GD2C2014].gd_esquema.Maestra a
JOIN (
SELECT Cliente_Mail FROM [GD2C2014].gd_esquema.Maestra 
GROUP BY Cliente_Mail 
HAVING COUNT(DISTINCT Cliente_Pasaporte_Nro)>1) mails ON mails.Cliente_Mail = a.Cliente_Mail ORDER BY 1


INSERT INTO [dbo].[Cliente_ERROR] 
SELECT DISTINCT
				[Cliente_Pasaporte_Nro] AS numeroIdentificacion,
				(SELECT tipoIdentificacion FROM TipoIdentificacion WHERE UPPER(descripcionLarga) LIKE '%PASAPORTE%') AS tipoIdentificacion,
				[Cliente_Nombre] AS nombre,
				[Cliente_Apellido] AS apellido,
				[Cliente_Fecha_Nac] AS fechaNacimiento,
				[Cliente_Mail] AS mail,
				[Cliente_Dom_Calle] AS direccion,
				[Cliente_Nro_Calle] AS altura,
				[Cliente_Piso] AS piso,
				[Cliente_Depto] AS depto,
				[Cliente_Nacionalidad] AS nacionalidad,
				'' AS telefono,
				'' AS localidad,
				1 AS habilitado
FROM [GD2C2014].gd_esquema.Maestra
WHERE [Cliente_Pasaporte_Nro] IN (SELECT numeroIdentificacion FROM #TEMPORAL)
AND [Cliente_Mail] IN (SELECT mail FROM #TEMPORAL)

UPDATE [dbo].[Cliente]
SET tieneDuplicados = 1
WHERE numeroIdentificacion IN (SELECT numeroIdentificacion FROM #TEMPORAL)
AND mail IN (SELECT mail FROM #TEMPORAL)


DROP TABLE #TEMPORAL

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
WHERE	H.calle = rXh.Hotel_Calle
		AND H.nroCalle = rXh.Hotel_Nro_Calle
		AND H.ciudad = rXh.Hotel_Ciudad
		AND H.cantidadEstrellas = rXh.Hotel_CantEstrella
		AND R.descripcion = rXh.Regimen_Descripcion
		AND R.precio = rXh.Regimen_Precio
------------------------------------------------------------------------------------------------
-- TABLA USUARIO --                                            HAY QUE HASHEAR LA PASSWORD
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[USUARIO]  
SELECT 'scriptMigracion','script',0,'99999999','DNI','SQL','SERVER','scriptloco@gmail.com','0800-SCRIPT','Av. SQL 123','1950-01-04 00:00:00.000'
UNION
SELECT 'admin','adm123',0,'36200300','DNI','Roberto','Gomez','rob@gmail.com','4804-2020','Av. Rivadavia 3045','1980-11-02 00:00:00.000'
UNION
SELECT 'aperez','1234',0,'36999300','DNI','Adalberto','Perez','rob@gmail.com','4804-2020','Av. Directorio 3242','1991-12-12 00:00:00.000'


------------------------------------------------------------------------------------------------
-- TABLA USUARIOXHOTEL --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[USUARIOXHOTEL]  
SELECT DISTINCT 'admin', idHotel FROM Hotel
UNION 
SELECT 'aperez',2
------------------------------------------------------------------------------------------------
-- TABLA ROLxUSUARIO --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[ROLxUSUARIO]  
SELECT DISTINCT idRol,'admin' FROM Rol
UNION 
SELECT 2,'aperez'
------------------------------------------------------------------------------------------------
-- TABLA ROLxFUNCIONALIDAD --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[ROLxFuncionalidad]  
SELECT 1,3
UNION 
SELECT 2,2
UNION
SELECT 2,1
------------------------------------------------------------------------------------------------
-- TABLA HABITACION --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[habitacion]  
SELECT	 H.idHotel AS idHotel
		,habXhot.Habitacion_Numero AS numeroHabitacion
		,habXhot.Habitacion_Piso AS piso
		,habXhot.Habitacion_Frente AS ubicacion
		,habXhot.Habitacion_Tipo_Codigo AS idTipoHabitacion
		,NULL AS descripcion
		,NULL AS comodidades
		,1 AS habilitada
  FROM dbo.Hotel H ,(SELECT DISTINCT 
			[Hotel_Ciudad],[Hotel_Calle],[Hotel_Nro_Calle],[Hotel_CantEstrella],[Hotel_Recarga_Estrella]
			,[Habitacion_Numero],[Habitacion_Piso],[Habitacion_Frente]
			,[Habitacion_Tipo_Codigo]
					FROM [GD2C2014].[gd_esquema].[Maestra]
					) habXhot
/* JOIN's */
WHERE	H.calle = habXhot.Hotel_Calle
		AND H.nroCalle = habXhot.Hotel_Nro_Calle
		AND H.ciudad = habXhot.Hotel_Ciudad
		AND H.cantidadEstrellas = habXhot.Hotel_CantEstrella
------------------------------------------------------------------------------------------------
-- TABLA RESERVA --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[RESERVA] 
SELECT	codigoReserva,fechaDesde,cantidadNoches,fechaHasta,fechaRealizacion
		,(CASE
			WHEN fechaInicioEstadia IS NULL  THEN 1
			ELSE 2
			END)																	AS idEstadoReserva
		,numeroIdentificacion,tipoIdentificacion,precioParcial,fechaInicioEstadia,fechaFinEstadia,username,codigoRegimen
FROM
(
SELECT  *
		,(SELECT TOP 1 [Estadia_Fecha_Inicio]	
			FROM [GD2C2014].[gd_esquema].[Maestra]
			WHERE Reserva_Codigo = codigoReserva 
			AND Estadia_Fecha_Inicio IS NOT NULL)									AS fechaInicioEstadia
		 ,DATEADD(DAY
					,(SELECT TOP 1 [Estadia_Cant_Noches]	
						FROM [GD2C2014].[gd_esquema].[Maestra]
						WHERE Reserva_Codigo = codigoReserva 
						AND Estadia_Cant_Noches IS NOT NULL)
					,(SELECT TOP 1 [Estadia_Fecha_Inicio]	
						FROM [GD2C2014].[gd_esquema].[Maestra]
						WHERE Reserva_Codigo = codigoReserva 
						AND Estadia_Fecha_Inicio IS NOT NULL))						AS fechaFinEstadia
FROM 
(
SELECT DISTINCT
		[Reserva_Codigo]															AS codigoReserva
		,[Reserva_Fecha_Inicio]														AS fechaDesde
		,[Reserva_Cant_Noches]														AS cantidadNoches
		,DATEADD(DAY,ISNULL([Reserva_Cant_Noches],0),[Reserva_Fecha_Inicio])		AS fechaHasta
		,NULL																		AS fechaRealizacion
		,[Cliente_Pasaporte_Nro]													AS numeroIdentificacion
		,1																			AS tipoIdentificacion
		,CAST(0.00 AS NUMERIC(18,2))												AS precioParcial
        ,'scriptMigracion'															AS username
		,(SELECT codigo FROM Regimen 
			WHERE descripcion=[Regimen_Descripcion] AND precio=[Regimen_Precio])	AS codigoRegimen
FROM [GD2C2014].[gd_esquema].[Maestra]
) a
) b

------------------------------------------------------------------------------------------------
-- TABLA RESERVAxCONSUMIBLE --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[RESERVAxCONSUMIBLE] 
SELECT	Reserva_Codigo AS codigoReserva, 
		Consumible_Codigo AS codigoConsumible,
		COUNT(*) AS cantidadItems
FROM [GD2C2014].[gd_esquema].[Maestra]
WHERE Consumible_Codigo IS NOT NULL
GROUP BY Reserva_Codigo,Consumible_Codigo
------------------------------------------------------------------------------------------------
-- TABLA RESERVAxHABITACION --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[RESERVAxHABITACION] 
SELECT DISTINCT Mae.Reserva_Codigo AS codigoReserva,
				hot.idHotel AS idHotel,
				Mae.Habitacion_Numero AS numeroHabitacion
FROM [GD2C2014].[gd_esquema].[Maestra] Mae
	JOIN [dbo].[Hotel] hot ON 
				Mae.Hotel_Calle = hot.calle
				AND Mae.Hotel_Nro_Calle = hot.nroCalle
				AND Mae.Hotel_Ciudad = hot.ciudad
				AND Mae.Hotel_CantEstrella = hot.cantidadEstrellas
------------------------------------------------------------------------------------------------
-- TABLA FACTURA --
------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[FACTURA] 
SELECT DISTINCT Factura_Nro,Factura_Fecha,Factura_Total,Reserva_Codigo,mp.idMedioPago 
FROM [GD2C2014].[gd_esquema].[Maestra]
	JOIN [dbo].[MedioDePago] mp ON mp.descripcion LIKE '%no disponible%'
	WHERE Factura_Nro IS NOT NULL
	
	
COMMIT