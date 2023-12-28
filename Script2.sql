--Pregunta A)
SELECT COUNT(cod_viaje) 'Viajes realizados' 
FROM viajes v
JOIN ciudades c ON c.id_ciudad = v.id_ciudad_origen
JOIN provincias p ON c.id_provincia = p.id_provincia
WHERE p.nombre = 'Santa Fe'

--Pregunta B)
SELECT
	cli.nombre as 'Nombre del cliente',
	cli.apellido as 'Apellido del cliente',
	cli.dni as 'DNI del cliente',
	cli.telefono as 'Contacto del cliente',
	c.nombre as 'Nombre del chofer',
	c.apellido as 'Apellido del chofer',
	c.tel_celular as 'Contacto del chofer',
	c.dni as 'DNI del chofer',
	v.kilometros as 'Kilometros recorridos',
	v.fecha_salida as 'Fecha de salida',
	v.fecha_llegada as 'Fecha de llegada',
	ciu.ciudad as 'Ciudad de salida',
	p.nombre as 'Provincia de salida',
	ciu2.ciudad as 'Ciudad de destino',
	p2.nombre as 'Provincia de destino',
	t.tipo_remolque as 'Tipo de remolque',
	ma.nombre 'Marca del vehiculo',
	mo.nombre as 'Modelo del vehiculo',
	ve.anio as 'Año del vehiculo'
	

FROM viajes v
JOIN clientes cli ON v.cod_cliente = cli.cod_cliente
JOIN choferes c ON v.id_chofer = c.id_chofer
JOIN camiones ve ON v.id_camion = ve.id_camion
JOIN tipo_remolque t ON ve.cod_tipo_remolque = t.cod_tipo_remolque
JOIN ciudades ciu ON ciu.id_ciudad = v.id_ciudad_origen
JOIN ciudades ciu2 ON ciu2.id_ciudad = v.id_ciudad_destino
JOIN provincias p ON ciu.id_provincia = p.id_provincia
JOIN provincias p2 ON ciu2.id_provincia = p2.id_provincia
JOIN modelo mo ON ve.cod_modelo = mo.cod_modelo
JOIN marca ma ON mo.id_marca = ma.id_marca


WHERE p.nombre = 'Córdoba'
AND MONTH(v.fecha_salida)<= 6
AND YEAR(v.fecha_salida) = 2023

--Pregunta C)
SELECT TOP 3
 c.nombre as 'Nombre del chofer',
 c.apellido as 'Apellido del chofer',
 SUM(v.kilometros) as 'KM recorridos'

FROM choferes c
JOIN viajes v ON c.id_chofer = v.id_chofer

WHERE YEAR(v.fecha_salida) = 2023
GROUP BY c.nombre, c.apellido
ORDER BY 'KM recorridos' DESC

--Pregunta D)
SELECT
	cli.nombre as 'Nombre cliente',
	cli.apellido as 'Apellido cliente',
	c.nombre as 'Nombre del chofer',
	c.apellido as 'Apellido del chofer',
	v.kilometros as 'KM recorridos'

FROM viajes v
JOIN clientes cli ON v.cod_cliente = cli.cod_cliente
JOIN choferes c ON v.id_chofer = c.id_chofer

WHERE YEAR(v.fecha_salida) = 2023
ORDER BY 'KM recorridos' DESC