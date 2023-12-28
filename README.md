# Proyecto de Base de Datos "Transportes" con SQLServer
## Descripción
Este proyecto incluye los scripts SQL necesarios para crear la base de datos "Transportes" y realizar operaciones relacionadas con un sistema de gestión de transporte. La base de datos incluye tablas para conductores, vehículos, clientes, viajes y entidades relacionadas. También se han añadido índices para mejorar el rendimiento de ciertas consultas.

### *Script 1: Creación de la Base de Datos y Tablas*
Este script crea la base de datos "Transportes" y las tablas necesarias, como "choferes", "marca", "modelo", "tipo_remolque", "camiones", "choferes_camiones", "clientes", "provincias", "ciudades" y "viajes". Además, se insertan datos de muestra en estas tablas.

### *Script 2: Consultas SQL*
Este script contiene consultas SQL que responden a diferentes preguntas y escenarios:

- Contar la cantidad de viajes realizados desde la provincia de Santa Fe.
- Obtener detalles de viajes que salieron de Córdoba antes de junio de 2023.
- Encontrar los tres choferes que han recorrido más kilómetros en 2023.
- Listar los viajes de 2023 ordenados por la cantidad de kilómetros recorridos.

### *Script 3: Creación del procedimiento Almacenado ActualizarViajeEnvios*
Este procedimiento almacenado actualiza la fecha de llegada de un viaje específico, siempre que aún no tenga una fecha de llegada registrada. Se valida si el viaje existe y no tiene una fecha de llegada antes de realizar la actualización.

### *Script 4: Creación del procedimiento Almacenado ObtenerPatenteCamionAsignado*
Este procedimiento almacenado busca la patente del camión asignado a un chofer en una fecha determinada. Se proporciona la información del chofer, incluyendo nombre y apellido. Si no se encuentra información, se devuelve un mensaje indicando que el chofer no existe o no tiene un camión asignado.

### *Script 5: Ejecución del Procedimiento ActualizarViajeEnvios*
Este script ejecuta el procedimiento almacenado ActualizarViajeEnvios para actualizar la fecha de llegada de un viaje específico (en este caso, el viaje con el código 5).

### *Script 6: Ejecución del Procedimiento ObtenerPatenteCamionAsignado*
Este script ejecuta el procedimiento almacenado ObtenerPatenteCamionAsignado para obtener información sobre el camión asignado a un chofer en una fecha específica. Los resultados se imprimen en la consola.

### *Índices*
Se han agregado índices para mejorar el rendimiento de ciertas consultas. Estos incluyen índices en los campos "dni" de la tabla "choferes", "id_marca" de la tabla "modelo", "cod_modelo" de la tabla "camiones", y los campos "id_camion", "id_ciudad_origen" y "id_ciudad_destino" de la tabla "viajes".

### *Diagrama Entidad-Relación*
Se puede observar el archivo PDF con el diagrama realizado para comprender mejor el trabajo.


## *Instrucciones*
- Ejecute el Script 1 para crear la base de datos "Transportes".
- Explore las consultas del Script 2 para obtener información sobre los viajes y choferes.
- Ejecute el Script 3 y 5 para actualizar la fecha de llegada de un viaje específico.
- Ejecute el Script 4 y 6 para obtener información sobre el camión asignado a un chofer en una fecha específica.
- Explore los resultados de las ejecuciones en la consola.
