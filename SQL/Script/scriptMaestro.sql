--USE [GD2C2014]
GO
SET NOCOUNT ON
GO
BEGIN TRANSACTION TOTAL
GO
BEGIN TRANSACTION
GO
	
	/* Creacion de SCHEMA */
CREATE SCHEMA LOMBAPOLLERUDO 
GO 
COMMIT TRANSACTION
GO
BEGIN TRANSACTION
GO
	
	/* Creacion de TABLAS */

----------------------------------------------------------------------------------------------------------------
-- USUARIO --
CREATE TABLE [LOMBAPOLLERUDO].[Usuario](
	[username] [NVARCHAR](50) NOT NULL,
	[password] [NVARCHAR](MAX) NULL,
	[intentosFallidos] [INT] DEFAULT 0 NULL,
	[documento] [NVARCHAR](50) NULL,
	[tipoDocumento] [NVARCHAR](50) NULL,
	[nombre] [NVARCHAR](50) NULL,
	[apellido] [NVARCHAR](50) NULL,
	[mail] [NVARCHAR](50) NULL,
	[tel] [NVARCHAR](50) NULL,
	[direccion] [NVARCHAR](50) NULL,
	[fechaNacimiento] [DATETIME] NULL,
	[baja] [Bit] DEFAULT 0 NULL
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

----------------------------------------------------------------------------------------------------------------
-- TIPODEHABITACION --
CREATE TABLE [LOMBAPOLLERUDO].[TipoDeHabitacion](
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
-- HOTEL --
CREATE TABLE [LOMBAPOLLERUDO].[Hotel](
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
CREATE TABLE [LOMBAPOLLERUDO].[MedioDePago](
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
-- TIPOIDENTIFICACION --
CREATE TABLE [LOMBAPOLLERUDO].[TipoIdentificacion](
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
-- CLIENTE --
CREATE TABLE [LOMBAPOLLERUDO].[Cliente](
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
-- ,CONSTRAINT [UQ__Cliente__mail] UNIQUE NONCLUSTERED 
--(
--	[mail] ASC
--)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [LOMBAPOLLERUDO].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_TipoIdentificacion] FOREIGN KEY([tipoIdentificacion])
REFERENCES [LOMBAPOLLERUDO].[TipoIdentificacion] ([tipoIdentificacion])
GO
ALTER TABLE [LOMBAPOLLERUDO].[Cliente] CHECK CONSTRAINT [FK_Cliente_TipoIdentificacion]
GO


----------------------------------------------------------------------------------------------------------------
-- CLIENTE_ERROR --
CREATE TABLE [LOMBAPOLLERUDO].[Cliente_ERROR](
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

CREATE TABLE [LOMBAPOLLERUDO].[Consumible](
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
CREATE TABLE [LOMBAPOLLERUDO].[EstadoReserva](
	[idEstado] [INT] IDENTITY(1,1) NOT NULL,
	[descripcion] [NVARCHAR](255) NULL,
 CONSTRAINT [PK_EstadoReserva}] PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


----------------------------------------------------------------------------------------------------------------
-- FUNCIONALIDAD --
CREATE TABLE [LOMBAPOLLERUDO].[Funcionalidad](
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
CREATE TABLE [LOMBAPOLLERUDO].[Habitacion](
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

ALTER TABLE [LOMBAPOLLERUDO].[Habitacion]  WITH CHECK ADD  CONSTRAINT [FK_Habitacion_Hotel] FOREIGN KEY([idHotel])
REFERENCES [LOMBAPOLLERUDO].[Hotel] ([idHotel])
GO
ALTER TABLE [LOMBAPOLLERUDO].[Habitacion] CHECK CONSTRAINT [FK_Habitacion_Hotel]
GO
ALTER TABLE [LOMBAPOLLERUDO].[Habitacion]  WITH CHECK ADD  CONSTRAINT [FK_Habitacion_TipoDeHabitacion] FOREIGN KEY([idTipoHabitacion])
REFERENCES [LOMBAPOLLERUDO].[TipoDeHabitacion] ([idTipoHabitacion])
GO
ALTER TABLE [LOMBAPOLLERUDO].[Habitacion] CHECK CONSTRAINT [FK_Habitacion_TipoDeHabitacion]
GO


----------------------------------------------------------------------------------------------------------------
-- HISTORIALHOTEL --
CREATE TABLE [LOMBAPOLLERUDO].[HistorialHotel](
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

ALTER TABLE [LOMBAPOLLERUDO].[HistorialHotel]  WITH CHECK ADD  CONSTRAINT [FK_HistorialHotel_Hotel] FOREIGN KEY([idHotel])
REFERENCES [LOMBAPOLLERUDO].[Hotel] ([idHotel])
GO
ALTER TABLE [LOMBAPOLLERUDO].[HistorialHotel] CHECK CONSTRAINT [FK_HistorialHotel_Hotel]
GO



----------------------------------------------------------------------------------------------------------------
-- REGIMEN --
CREATE TABLE [LOMBAPOLLERUDO].[Regimen](
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
CREATE TABLE [LOMBAPOLLERUDO].[RegimenxHotel](
	[idHotel] [INT] NOT NULL,
	[codigoRegimen] [INT] NOT NULL,
 CONSTRAINT [PK_RegimenxHotel] PRIMARY KEY CLUSTERED 
(
	[idHotel] ASC,
	[codigoRegimen] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [LOMBAPOLLERUDO].[RegimenxHotel]  WITH CHECK ADD  CONSTRAINT [FK_RegimenxHotel_Hotel] FOREIGN KEY([idHotel])
REFERENCES [LOMBAPOLLERUDO].[Hotel] ([idHotel])
GO
ALTER TABLE [LOMBAPOLLERUDO].[RegimenxHotel] CHECK CONSTRAINT [FK_RegimenxHotel_Hotel]
GO
ALTER TABLE [LOMBAPOLLERUDO].[RegimenxHotel]  WITH CHECK ADD  CONSTRAINT [FK_RegimenxHotel_Regimen] FOREIGN KEY([codigoRegimen])
REFERENCES [LOMBAPOLLERUDO].[Regimen] ([codigo])
GO
ALTER TABLE [LOMBAPOLLERUDO].[RegimenxHotel] CHECK CONSTRAINT [FK_RegimenxHotel_Regimen]
GO



----------------------------------------------------------------------------------------------------------------
-- RESERVA --
CREATE TABLE [LOMBAPOLLERUDO].[Reserva](
	[codigoReserva] [NUMERIC](18, 0) NOT NULL,
	[fechaDesde] [DATETIME] NULL,
	[cantidadNoches] [NUMERIC](18, 0) NULL,
	[fechaHasta] [DATETIME] NULL,
	[fechaRealizacion] [DATETIME] NULL,
	[idEstadoReserva] [INT] NULL,
	[numeroIdentificacion] [NUMERIC](18, 0) NOT NULL,
	[tipoIdentificacion] [INT] NOT NULL,
	[precioParcial] [NUMERIC](18, 2) NULL,
--	[fechaInicioEstadia] [DATETIME] NULL,
--	[fechaFinEstadia] [DATETIME] NULL,
	[username] [NVARCHAR](50) NOT NULL,
	[codigoRegimen] [INT] NOT NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[codigoReserva] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [LOMBAPOLLERUDO].[Reserva] WITH CHECK ADD  CONSTRAINT [FK_Reserva_Regimen] FOREIGN KEY([codigoRegimen])
REFERENCES [LOMBAPOLLERUDO].[Regimen] ([codigo])
GO
ALTER TABLE [LOMBAPOLLERUDO].[Reserva] WITH CHECK ADD  CONSTRAINT [FK_Reserva_Usuarios] FOREIGN KEY([username])
REFERENCES [LOMBAPOLLERUDO].[Usuario] ([username])
GO
ALTER TABLE [LOMBAPOLLERUDO].[Reserva] WITH CHECK ADD  CONSTRAINT [FK_Reserva_Cliente] FOREIGN KEY([numeroIdentificacion],[tipoIdentificacion])
REFERENCES [LOMBAPOLLERUDO].[Cliente] ([numeroIdentificacion],[tipoIdentificacion])
GO



----------------------------------------------------------------------------------------------------------------
-- ESTADIA --
CREATE TABLE [LOMBAPOLLERUDO].[Estadia](
	[codigoEstadia] [NUMERIC](18, 0) NOT NULL,
	[fechaInicioEstadia] [DATETIME] NOT NULL,
	[cantNoches] [INT] null,
	[fechaFinEstadia] [DATETIME] NULL,
CONSTRAINT [PK_Estadia] PRIMARY KEY CLUSTERED 
(
	[codigoEstadia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [LOMBAPOLLERUDO].[Estadia]  WITH CHECK ADD  CONSTRAINT [FK_Estadia_Reserva] FOREIGN KEY([codigoEstadia])
REFERENCES [LOMBAPOLLERUDO].[Reserva] ([codigoReserva])
GO

GO
----------------------------------------------------------------------------------------------------------------
-- CLIENTEXESTADIA --
CREATE TABLE [LOMBAPOLLERUDO].[ClientexEstadia](
	[codigoEstadia] [NUMERIC](18, 0) NOT NULL,
	[numeroIdentificacionCliente] [NUMERIC](18, 0) NOT NULL,
	[tipoIdentificacionCliente] [INT] NOT NULL,
 CONSTRAINT [PK_ClientexEstadia] PRIMARY KEY CLUSTERED 
(
	[codigoEstadia] ASC,
	[numeroIdentificacionCliente] ASC,
	[tipoIdentificacionCliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/*

FK S								F A L T A N T E S

*/

----------------------------------------------------------------------------------------------------------------
-- CONSUMIBLEXESTADIA --
CREATE TABLE [LOMBAPOLLERUDO].[ConsumiblexEstadia](
	[codigoEstadia] [NUMERIC](18, 0) NOT NULL,
	[codigoConsumible] [NUMERIC](18, 0) NOT NULL,
	[cantidadItems] TINYINT NOT NULL
 CONSTRAINT [PK_ConsumiblexEstadia] PRIMARY KEY CLUSTERED 
(
	[codigoEstadia] ASC,
	[codigoConsumible] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [LOMBAPOLLERUDO].[ConsumiblexEstadia]  WITH CHECK ADD  CONSTRAINT [FK_ConsumiblexEstadia_Estadia] FOREIGN KEY([codigoEstadia])
REFERENCES [LOMBAPOLLERUDO].[Estadia] ([codigoEstadia])
GO
ALTER TABLE [LOMBAPOLLERUDO].[ConsumiblexEstadia]  WITH CHECK ADD  CONSTRAINT [FK_ConsumiblexEstadia_Consumible] FOREIGN KEY([codigoConsumible])
REFERENCES [LOMBAPOLLERUDO].[Consumible] ([codigo])
GO

----------------------------------------------------------------------------------------------------------------
-- RESERVAXHABITACION --
CREATE TABLE [LOMBAPOLLERUDO].[ReservaxHabitacion](
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
ALTER TABLE [LOMBAPOLLERUDO].[ReservaxHabitacion]  WITH CHECK ADD  CONSTRAINT [FK_ReservaxHabitacion_Reserva] FOREIGN KEY([codigoReserva])
REFERENCES [LOMBAPOLLERUDO].[Reserva] ([codigoReserva])
GO
ALTER TABLE [LOMBAPOLLERUDO].[ReservaxHabitacion]  WITH CHECK ADD  CONSTRAINT [FK_ReservaxHabitacion_Habitacion] FOREIGN KEY([idHotel],[numeroHabitacion])
REFERENCES [LOMBAPOLLERUDO].[Habitacion] ([idHotel],[numeroHabitacion])
GO



----------------------------------------------------------------------------------------------------------------
-- ROL --
CREATE TABLE [LOMBAPOLLERUDO].[Rol](
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
CREATE TABLE [LOMBAPOLLERUDO].[RolxFuncionalidad](
	[idRol] [INT] NOT NULL,
	[idFuncionalidad] [INT] NOT NULL,
 CONSTRAINT [PK_RolxFuncionalidad] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC,
	[idFuncionalidad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [LOMBAPOLLERUDO].[RolxFuncionalidad]  WITH CHECK ADD  CONSTRAINT [FK_RolxFuncionalidad_Funcionalidad] FOREIGN KEY([idFuncionalidad])
REFERENCES [LOMBAPOLLERUDO].[Funcionalidad] ([idFuncionalidad])
GO

ALTER TABLE [LOMBAPOLLERUDO].[RolxFuncionalidad] CHECK CONSTRAINT [FK_RolxFuncionalidad_Funcionalidad]
GO

ALTER TABLE [LOMBAPOLLERUDO].[RolxFuncionalidad]  WITH CHECK ADD  CONSTRAINT [FK_RolxFuncionalidad_Rol] FOREIGN KEY([idRol])
REFERENCES [LOMBAPOLLERUDO].[Rol] ([idRol])
GO

ALTER TABLE [LOMBAPOLLERUDO].[RolxFuncionalidad] CHECK CONSTRAINT [FK_RolxFuncionalidad_Rol]
GO


----------------------------------------------------------------------------------------------------------------
-- ROLXUSUARIO --

CREATE TABLE [LOMBAPOLLERUDO].[RolxUsuario](
	[idRol] [INT] NOT NULL,
	[username] [NVARCHAR](50) NOT NULL,
 CONSTRAINT [PK_RolxUsuario] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC,
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [LOMBAPOLLERUDO].[RolxUsuario]  WITH CHECK ADD  CONSTRAINT [FK_RolxUsuario_Rol] FOREIGN KEY([idRol])
REFERENCES [LOMBAPOLLERUDO].[Rol] ([idRol])
GO
ALTER TABLE [LOMBAPOLLERUDO].[RolxUsuario]  WITH CHECK ADD  CONSTRAINT [FK_RolxUsuario_Usuario] FOREIGN KEY([username])
REFERENCES [LOMBAPOLLERUDO].[Usuario] ([username])
GO



----------------------------------------------------------------------------------------------------------------
-- USUARIOXHOTEL --
CREATE TABLE [LOMBAPOLLERUDO].[UsuarioxHotel](
	[username] [NVARCHAR](50) NOT NULL,
	[idHotel] [INT] NOT NULL,
 CONSTRAINT [PK_UsuarioxHotel] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[idHotel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [LOMBAPOLLERUDO].[UsuarioxHotel]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioxHotel_Usuario] FOREIGN KEY([username])
REFERENCES [LOMBAPOLLERUDO].[Usuario] ([username])
GO
ALTER TABLE [LOMBAPOLLERUDO].[UsuarioxHotel]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioxHotel_Hotel] FOREIGN KEY([idHotel])
REFERENCES [LOMBAPOLLERUDO].[Hotel] ([idHotel])
GO

----------------------------------------------------------------------------------------------------------------
-- FACTURA --
CREATE TABLE [LOMBAPOLLERUDO].[Factura](
	[numeroFactura] [NUMERIC](18, 0) NOT NULL,
	[fecha] [DATETIME] NULL,
	[total] [NUMERIC](18, 2) NULL,
	[codigoEstadia] [NUMERIC](18, 0) NOT NULL,
	[idMedioPago] [INT] NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[numeroFactura] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [LOMBAPOLLERUDO].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_MedioDePago] FOREIGN KEY([idMedioPago])
REFERENCES [LOMBAPOLLERUDO].[MedioDePago] ([idMedioPago])
GO
ALTER TABLE [LOMBAPOLLERUDO].[Factura] CHECK CONSTRAINT [FK_Factura_MedioDePago]
GO
ALTER TABLE [LOMBAPOLLERUDO].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Estadia] FOREIGN KEY([codigoEstadia])
REFERENCES [LOMBAPOLLERUDO].[Estadia] ([codigoEstadia])
GO
ALTER TABLE [LOMBAPOLLERUDO].[Factura] CHECK CONSTRAINT [FK_Factura_Estadia]
GO


COMMIT
GO


BEGIN TRANSACTION
GO
-----------------------------------------------------------------------------------------------
-- TABLA ROL --
------------------------------------------------------------------------------------------------
INSERT INTO [LOMBAPOLLERUDO].[ROL]
SELECT 'Admin','1'
UNION
SELECT 'Conserje','1'
UNION
SELECT 'Empleado','1'
------------------------------------------------------------------------------------------------
-- TABLA TIPODEHABITACION --
------------------------------------------------------------------------------------------------
INSERT INTO [LOMBAPOLLERUDO].[TIPODEHABITACION]
SELECT DISTINCT Habitacion_Tipo_Codigo AS idTipoHabitacion
				,Habitacion_Tipo_Descripcion AS descricion
				,Habitacion_Tipo_Porcentual AS tipoPorcentual
				,''
FROM [GD2C2014].[gd_esquema].[Maestra]
------------------------------------------------------------------------------------------------
-- TABLA TIPOIDENTIFICACION --
------------------------------------------------------------------------------------------------
INSERT INTO [LOMBAPOLLERUDO].[TipoIdentificacion]  
SELECT 'PAS','Pasaporte'
UNION
SELECT 'DNI','Documento Nacional de Identidad'

------------------------------------------------------------------------------------------------
-- TABLA CLIENTES --
------------------------------------------------------------------------------------------------
INSERT INTO [LOMBAPOLLERUDO].[Cliente]
SELECT	numeroIdentificacion,
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
				(SELECT tipoIdentificacion FROM [LOMBAPOLLERUDO].TipoIdentificacion WHERE UPPER(descripcionLarga) LIKE '%PASAPORTE%') AS tipoIdentificacion,
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
----------------------------------------------------------------------
--UPDATEO LOS QUE TIENEN DUPLICADOS (POR NRO PASAPORTE IDENTIFICACION)
----------------------------------------------------------------------
UPDATE [LOMBAPOLLERUDO].[Cliente]
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
INSERT INTO [LOMBAPOLLERUDO].[Cliente_ERROR]
SELECT DISTINCT
				[Cliente_Pasaporte_Nro] AS numeroIdentificacion,
				(SELECT tipoIdentificacion FROM [LOMBAPOLLERUDO].TipoIdentificacion WHERE UPPER(descripcionLarga) LIKE '%PASAPORTE%') AS tipoIdentificacion,
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
--SELECT DISTINCT mails.Cliente_Mail AS mail, a.Cliente_Pasaporte_Nro AS numeroIdentificacion
--INTO #TEMPORAL
--FROM [GD2C2014].gd_esquema.Maestra a
--JOIN (
--SELECT Cliente_Mail FROM [GD2C2014].gd_esquema.Maestra 
--GROUP BY Cliente_Mail 
--HAVING COUNT(DISTINCT Cliente_Pasaporte_Nro)>1) mails ON mails.Cliente_Mail = a.Cliente_Mail ORDER BY 1


--INSERT INTO [LOMBAPOLLERUDO].[Cliente_ERROR] 
--SELECT DISTINCT
--				[Cliente_Pasaporte_Nro] AS numeroIdentificacion,
--				(SELECT tipoIdentificacion FROM [LOMBAPOLLERUDO].TipoIdentificacion WHERE UPPER(descripcionLarga) LIKE '%PASAPORTE%') AS tipoIdentificacion,
--				[Cliente_Nombre] AS nombre,
--				[Cliente_Apellido] AS apellido,
--				[Cliente_Fecha_Nac] AS fechaNacimiento,
--				[Cliente_Mail] AS mail,
--				[Cliente_Dom_Calle] AS direccion,
--				[Cliente_Nro_Calle] AS altura,
--				[Cliente_Piso] AS piso,
--				[Cliente_Depto] AS depto,
--				[Cliente_Nacionalidad] AS nacionalidad,
--				'' AS telefono,
--				'' AS localidad,
--				1 AS habilitado
--FROM [GD2C2014].gd_esquema.Maestra
--WHERE [Cliente_Pasaporte_Nro] IN (SELECT numeroIdentificacion FROM #TEMPORAL)
--AND [Cliente_Mail] IN (SELECT mail FROM #TEMPORAL)

--UPDATE [LOMBAPOLLERUDO].[Cliente]
--SET tieneDuplicados = 1
--WHERE numeroIdentificacion IN (SELECT numeroIdentificacion FROM #TEMPORAL)
--AND mail IN (SELECT mail FROM #TEMPORAL)


--DROP TABLE #TEMPORAL

------------------------------------------------------------------------------------------------
-- TABLA CONSUMIBLES --
------------------------------------------------------------------------------------------------
INSERT INTO [LOMBAPOLLERUDO].[Consumible]
SELECT DISTINCT [Consumible_Codigo],[Consumible_Descripcion],[Consumible_Precio] 
FROM [GD2C2014].[gd_esquema].[Maestra]
WHERE [Consumible_Codigo] IS NOT NULL
ORDER BY 1
------------------------------------------------------------------------------------------------
-- TABLA ESTADORESERVA --
------------------------------------------------------------------------------------------------
INSERT INTO [LOMBAPOLLERUDO].[EstadoReserva]
SELECT 'Reserva correcta'
INSERT INTO [LOMBAPOLLERUDO].[EstadoReserva]
SELECT 'Reserva con Ingreso'
INSERT INTO [LOMBAPOLLERUDO].[EstadoReserva]
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
INSERT INTO [LOMBAPOLLERUDO].[Funcionalidad]
SELECT 'ABM Cliente'
UNION
SELECT 'ABM Hotel'
UNION
SELECT 'Todo'
------------------------------------------------------------------------------------------------
-- TABLA HOTEL --
------------------------------------------------------------------------------------------------
INSERT INTO [LOMBAPOLLERUDO].[HOTEL]
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
INSERT INTO [LOMBAPOLLERUDO].[MEDIODEPAGO]
SELECT 'NO DISPONIBLE','NO DISPONIBLE'
------------------------------------------------------------------------------------------------
-- TABLA REGIMEN --
------------------------------------------------------------------------------------------------
INSERT INTO [LOMBAPOLLERUDO].[REGIMEN]
SELECT DISTINCT Regimen_Descripcion as descripcion,Regimen_Precio as precio ,1 as estado
FROM [GD2C2014].[gd_esquema].[Maestra]
------------------------------------------------------------------------------------------------
-- TABLA REGIMENxhotel --
------------------------------------------------------------------------------------------------
INSERT INTO [LOMBAPOLLERUDO].[REGIMENXHOTEL]
SELECT H.idHotel as idHotel, R.codigo as codigoRegimen --rXh.Regimen_Descripcion,rXh.Regimen_Precio,
  FROM [LOMBAPOLLERUDO].Hotel H, [LOMBAPOLLERUDO].Regimen R ,(SELECT DISTINCT [Hotel_Ciudad]
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
INSERT INTO [LOMBAPOLLERUDO].[USUARIO]  
SELECT 'scriptMigracion','script',0,'99999999','DNI','SQL','SERVER','scriptloco@gmail.com','0800-SCRIPT','Av. SQL 123','1950-01-04 00:00:00.000',0
UNION
SELECT 'admin','adm123',0,'36200300','DNI','Roberto','Gomez','rob@gmail.com','4804-2020','Av. Rivadavia 3045','1980-11-02 00:00:00.000',0
UNION
SELECT 'aperez','1234',0,'36999300','DNI','Adalberto','Perez','rob@gmail.com','4804-2020','Av. Directorio 3242','1991-12-12 00:00:00.000',1


------------------------------------------------------------------------------------------------
-- TABLA USUARIOXHOTEL --
------------------------------------------------------------------------------------------------
INSERT INTO [LOMBAPOLLERUDO].[USUARIOXHOTEL]  
SELECT DISTINCT 'admin', idHotel FROM [LOMBAPOLLERUDO].Hotel
UNION 
SELECT 'aperez',2
------------------------------------------------------------------------------------------------
-- TABLA ROLxUSUARIO --
------------------------------------------------------------------------------------------------
INSERT INTO [LOMBAPOLLERUDO].[ROLxUSUARIO]  
SELECT DISTINCT idRol,'admin' FROM [LOMBAPOLLERUDO].Rol
UNION 
SELECT 2,'aperez'
------------------------------------------------------------------------------------------------
-- TABLA ROLxFUNCIONALIDAD --
------------------------------------------------------------------------------------------------
INSERT INTO [LOMBAPOLLERUDO].[ROLxFuncionalidad]  
SELECT 1,3
UNION 
SELECT 2,2
UNION
SELECT 2,1 
------------------------------------------------------------------------------------------------
-- TABLA HABITACION --
------------------------------------------------------------------------------------------------
INSERT INTO [LOMBAPOLLERUDO].[habitacion]  
SELECT	 H.idHotel AS idHotel
		,habXhot.Habitacion_Numero AS numeroHabitacion
		,habXhot.Habitacion_Piso AS piso
		,habXhot.Habitacion_Frente AS ubicacion
		,habXhot.Habitacion_Tipo_Codigo AS idTipoHabitacion
		,NULL AS descripcion
		,NULL AS comodidades
		,1 AS habilitada
  FROM [LOMBAPOLLERUDO].Hotel H ,(SELECT DISTINCT 
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
INSERT INTO [LOMBAPOLLERUDO].[RESERVA] 
SELECT	codigoReserva,fechaDesde,cantidadNoches,fechaHasta,fechaRealizacion
		,(CASE
			WHEN fechaInicioEstadia IS NULL  THEN 1
			ELSE 2
			END)																	AS idEstadoReserva
		,numeroIdentificacion,tipoIdentificacion,precioParcial,username,codigoRegimen
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
		,(SELECT codigo FROM [LOMBAPOLLERUDO].Regimen 
			WHERE descripcion=[Regimen_Descripcion] AND precio=[Regimen_Precio])	AS codigoRegimen
FROM [GD2C2014].[gd_esquema].[Maestra]
) a
) b


------------------------------------------------------------------------------------------------
-- TABLA ESTADIA --
------------------------------------------------------------------------------------------------
INSERT INTO [LOMBAPOLLERUDO].[ESTADIA] 
SELECT DISTINCT [Reserva_Codigo] AS codigoEstadia
      ,[Estadia_Fecha_Inicio] AS fechaInicioEstadia
      ,[Estadia_Cant_Noches] as cantNoches
      ,DATEADD(DAY,[Estadia_Cant_Noches],[Estadia_Fecha_Inicio]) as fechaFinEstadia
  FROM [GD2C2014].[gd_esquema].[Maestra]
  where Estadia_Fecha_Inicio is not null



------------------------------------------------------------------------------------------------
-- TABLA CONSUMIBLExESTADIA --
------------------------------------------------------------------------------------------------
INSERT INTO [LOMBAPOLLERUDO].[CONSUMIBLExESTADIA] 
SELECT	Reserva_Codigo AS codigoEstadia, 
		Consumible_Codigo AS codigoConsumible,
		COUNT(*) AS cantidadItems
FROM [GD2C2014].[gd_esquema].[Maestra]
WHERE Consumible_Codigo IS NOT NULL
GROUP BY Reserva_Codigo,Consumible_Codigo
------------------------------------------------------------------------------------------------
-- TABLA RESERVAxHABITACION --
------------------------------------------------------------------------------------------------
INSERT INTO [LOMBAPOLLERUDO].[RESERVAxHABITACION] 
SELECT DISTINCT Mae.Reserva_Codigo AS codigoReserva,
				hot.idHotel AS idHotel,
				Mae.Habitacion_Numero AS numeroHabitacion
FROM [GD2C2014].[gd_esquema].[Maestra] Mae
	JOIN [LOMBAPOLLERUDO].[Hotel] hot ON 
				Mae.Hotel_Calle = hot.calle
				AND Mae.Hotel_Nro_Calle = hot.nroCalle
				AND Mae.Hotel_Ciudad = hot.ciudad
				AND Mae.Hotel_CantEstrella = hot.cantidadEstrellas
------------------------------------------------------------------------------------------------
-- TABLA CLIENTExESTADIA --
------------------------------------------------------------------------------------------------
INSERT INTO [LOMBAPOLLERUDO].[CLIENTExESTADIA] 
SELECT DISTINCT
		[Reserva_Codigo]				AS codigoReserva
		,[Cliente_Pasaporte_Nro]		AS numeroIdentificacion
		,1								AS tipoIdentificacion
FROM [GD2C2014].[gd_esquema].[Maestra]
------------------------------------------------------------------------------------------------
-- TABLA FACTURA --
------------------------------------------------------------------------------------------------
INSERT INTO [LOMBAPOLLERUDO].[FACTURA] 
SELECT DISTINCT Factura_Nro,Factura_Fecha,Factura_Total,Reserva_Codigo,mp.idMedioPago 
FROM [GD2C2014].[gd_esquema].[Maestra]
	JOIN [LOMBAPOLLERUDO].[MedioDePago] mp ON mp.descripcion LIKE '%no disponible%'
	WHERE Factura_Nro IS NOT NULL
	
COMMIT

COMMIT TRANSACTION TOTAL