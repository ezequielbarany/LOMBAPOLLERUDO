--SE AGREGA CAMPO BAJA EN TALBA USUARIO



CREATE TYPE dbo.RolList
AS TABLE
(
  idRol INT
);
GO

CREATE TYPE dbo.HotelList
AS TABLE
(
  idHotel INT
);
GO


CREATE PROCEDURE [dbo].[Usuario_UI](
	@username			nvarchar(50)	= null,
	@password	 		nvarchar(max)	= null,
	@nombre				nvarchar(50)	= null,			
	@apellido			nvarchar(50)	= null, 
	@tipoDocumento		nvarchar(50)	= null,
	@documento			nvarchar(50)	= null, 
	@mail				nvarchar(50)	= null, 
	@tel				nvarchar(50)	= null,  
	@direccion			nvarchar(50)	= null, 
	@fechaNacimiento	datetime		= null,
	@idHotelList		dbo.HotelList READONLY,
	@idRolList			dbo.RolList READONLY)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @IdentityOutput nvarchar(50) ;
    IF (SELECT COUNT(*) FROM Usuario WHERE username = @username) = 0
		BEGIN
			INSERT INTO Usuario ([username], [password], [nombre],	[apellido],[tipoDocumento],[documento],[mail],	[tel],	[direccion],[fechaNacimiento], [baja]) 
			VALUES				(@username, @password,	@nombre,	@apellido,	@tipoDocumento, @documento,	@mail,	@tel,	@direccion,	@fechaNacimiento, 0)
			SET @IdentityOutput=(SELECT IDENT_CURRENT('Usuario'));
		END
    ELSE
		BEGIN
			SET @IdentityOutput=@username;
			UPDATE Usuario SET password=@password, nombre=@nombre,apellido=@apellido,
				   tipoDocumento=@tipoDocumento,documento=@documento,mail=@mail,tel=@tel,direccion=@direccion,fechaNacimiento=@fechaNacimiento
		    WHERE username=@username;
			-- Borro los roles por y los hoteles por usuario
			DELETE FROM RolxUsuario		WHERE username=@username;
			DELETE FROM UsuarioxHotel	WHERE username=@username;
		END
	
	-- Inserto los roles y los hoteles por usuario 
	INSERT INTO RolxUsuario (username,idRol) (select @IdentityOutput,idRol FROM @idRolList where idRol is not null)
	INSERT INTO UsuarioxHotel (username,idHotel) (select @IdentityOutput,idHotel FROM @idHotelList where idHotel is not null)
			
END
