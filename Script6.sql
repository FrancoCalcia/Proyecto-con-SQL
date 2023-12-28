-- variables para guardar los resultados de las búsquedas
    DECLARE @patente_chofer VARCHAR(15);
    DECLARE @nombre_chofer VARCHAR(20);
    DECLARE @apellido_chofer VARCHAR(20);

EXEC ObtenerPatenteCamionAsignado
    @dni_chofer = '20102312',
    @fecha_consulta = '2023-11-02 08:00:00.000',
    @patente_chofer = @patente_chofer OUTPUT,
    @nombre_chofer = @nombre_chofer OUTPUT,
    @apellido_chofer = @apellido_chofer OUTPUT;

PRINT 'Resultado del procedimiento almacenado:';
PRINT 'Nombre del chofer: ' + @nombre_chofer;
PRINT 'Apellido del chofer: ' + @apellido_chofer;
PRINT 'Patente del camión asignado: ' + @patente_chofer;

