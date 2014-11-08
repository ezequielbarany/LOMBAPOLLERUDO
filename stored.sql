USE GD2C2014


CREATE TYPE dbo.FuncionalidadList
AS TABLE
(
  idFuncionalidad INT
);
GO

USE [GD2C2014]
GO
/****** Object:  StoredProcedure [dbo].[AltaModificacionRol]    Script Date: 11/08/2014 15:36:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AltaModificacionRol](
	-- Add the parameters for the stored procedure here
	@idRol int =0,
	@nombre nvarchar(255) =null,
	@estado bit =1,
	@idFuncionalidadList dbo.FuncionalidadList READONLY)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @IdentityOutput int ;

    -- Insert statements for procedure here
    IF @idRol='0'
		BEGIN
			INSERT INTO Rol ([nombre],[estado]) VALUES (@nombre,@estado);
			SET @IdentityOutput=(SELECT IDENT_CURRENT('Rol'));
		END
    ELSE
		BEGIN
			SET @IdentityOutput=@idRol;
			UPDATE Rol SET nombre=@nombre,estado=@estado WHERE idRol=@idRol;
			-- Borro los roles por funcionalidad
			DELETE FROM RolxFuncionalidad WHERE idRol=@idRol;
		END
	
	-- Inserto los roles por funcionalidad
	INSERT INTO RolxFuncionalidad (idRol,idFuncionalidad) (select @IdentityOutput,idFuncionalidad FROM @idFuncionalidadList where idFuncionalidad is not null)
			
END
