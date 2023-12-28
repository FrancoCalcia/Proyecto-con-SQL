CREATE PROCEDURE ActualizarViajeEnvios
	@codigo_viaje INT,
	@nueva_fecha_llegada DATETIME

AS
BEGIN
	
	IF NOT EXISTS (
		SELECT 1
		FROM viajes
		WHERE cod_viaje = @codigo_viaje
		AND fecha_llegada IS NULL
	)
	BEGIN
		PRINT 'El viaje ya cuenta con una fecha de llegada'
	END;

	UPDATE viajes
	SET fecha_llegada = @nueva_fecha_llegada
	WHERE cod_viaje = @codigo_viaje
	IF @@ROWCOUNT = 0
	BEGIN
		PRINT 'No existe un registro de viaje con ese código'
	END
		
END;
--select * from viajes
