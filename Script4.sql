CREATE PROCEDURE ObtenerPatenteCamionAsignado
--parametros de entrada
    @dni_chofer VARCHAR(20),
    @fecha_consulta DATETIME,
--parametros de salida
    @patente_chofer VARCHAR(20) OUTPUT,
    @nombre_chofer VARCHAR(50) OUTPUT,
    @apellido_chofer VARCHAR(50) OUTPUT
AS
BEGIN
-- variables para guardar los resultados de las búsquedas
    DECLARE @nombre VARCHAR(50);
    DECLARE @apellido VARCHAR(50);
    DECLARE @patente VARCHAR(20);


    IF EXISTS (
            SELECT 1
            FROM choferes c
            JOIN choferes_camiones cc ON c.id_chofer = cc.id_chofer
            JOIN camiones ca ON cc.id_camion = ca.id_camion
            WHERE c.dni = @dni_chofer
                AND @fecha_consulta BETWEEN cc.tiempo_inicio AND ISNULL(cc.tiempo_fin, @fecha_consulta + 1)
        )
    BEGIN
        SELECT TOP 1
            @nombre = c.nombre,
            @apellido = c.apellido,
            @patente = ca.patente
        FROM choferes c
        JOIN choferes_camiones cc ON c.id_chofer = cc.id_chofer
        JOIN camiones ca ON cc.id_camion = ca.id_camion
        WHERE c.dni = @dni_chofer
            AND @fecha_consulta BETWEEN cc.tiempo_inicio AND ISNULL(cc.tiempo_fin, @fecha_consulta + 1);

		
        -- parametros de salida

		-- esto responde a la consigna 5.a)
        SET @nombre_chofer = ISNULL(@nombre, 'No existe el chofer');
        SET @apellido_chofer = ISNULL(@apellido, 'No existe el chofer');
        -- esto responde a la consigna 5.b)
		SET @patente_chofer = ISNULL(@patente, 'No tiene camión asignado');
    END
    ELSE
    BEGIN	

        -- parametros de salida sin valor encontrado

        -- esto responde a la consigna 5.a)
		SET @nombre_chofer = 'No existe el chofer';
        SET @apellido_chofer = 'No existe el chofer';
        -- esto responde a la consigna 5.b)
		SET @patente_chofer = 'No tiene camión asignado';
    END
END;
