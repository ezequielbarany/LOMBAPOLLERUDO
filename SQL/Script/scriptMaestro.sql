USE [GD2C2014]
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
	[idEstado] [int] NOT NULL,
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
	[idFuncionalidad] [int] NOT NULL,
	[descripcion] [nvarchar](255) NULL,
 CONSTRAINT [PK_Funcionalidad] PRIMARY KEY CLUSTERED 
(
	[idFuncionalidad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


----------------------------------------------------------------------------------------------------------------
-- HABITACION --
CREATE TABLE [dbo].[Habitacion](
	[idHotel] [int] NOT NULL,
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
	[idHotel] [int] NOT NULL,
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
	[idHotel] [int] NOT NULL,
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
	[idMedioPago] [int] NOT NULL,
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
	[codigo] [int] NOT NULL,
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
	[idRol] [int] NOT NULL,
	[nombre] [nvarchar](255) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
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
	[tipoIdentificacion] [int] NOT NULL,
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





/*
--------------------------------
-- CARGA DE DATOS FROM MASTER --
--------------------------------


------------------------------------------------------------------------------------------------
-- TABLA CLIENTES --
------------------------------------------------------------------------------------------------
INSERT INTO [GD2C2014].[dbo].[Cliente]
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
FROM [GD2C2014].[gd_esquema].[Maestra]				
) conNroFilaDocu
where nroFilaDocu = 1
)conNroFIlaMail
where nroFilaMail = 1
------------------------------------------------------------------------------------------------
-- TABLA CONSUMIBLES --
------------------------------------------------------------------------------------------------
INSERT INTO [GD2C2014].[dbo].[Consumible]
SELECT DISTINCT [Consumible_Codigo],[Consumible_Descripcion],[Consumible_Precio] 
FROM [GD2C2014].[gd_esquema].[Maestra]
WHERE [Consumible_Codigo] IS NOT NULL
ORDER BY 1
------------------------------------------------------------------------------------------------
-- TABLA TIPOIDENTIFICACION --
------------------------------------------------------------------------------------------------
INSERT INTO [GD2C2014].[dbo].[TipoIdentificacion]  
SELECT 1,'PAS','Pasaporte'
union
SELECT 2,'DNI','Documento Nacional de Identidad'




*/