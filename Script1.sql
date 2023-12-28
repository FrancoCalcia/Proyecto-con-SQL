CREATE DATABASE Transportes;
GO

USE Transportes;
GO

---------------------INICIO DE CREACION DE TABLAS Y RELACIONES-----------------------

CREATE TABLE choferes (
    id_chofer           INT PRIMARY KEY IDENTITY(1,1),
    nombre              VARCHAR(22),
    apellido            VARCHAR(22),
    dni                 VARCHAR(10),
    direccion           VARCHAR(50),
    tel_celular         VARCHAR(15),
    tel_fijo            VARCHAR(15),
    edad                INT,
    mail                VARCHAR(50),
    cod_reg_aut         VARCHAR(36)
);

CREATE TABLE marca (
    id_marca            INT PRIMARY KEY IDENTITY(1,1),
    nombre              VARCHAR(15)
);

CREATE TABLE modelo (
    cod_modelo          INT PRIMARY KEY IDENTITY(1,1),
    nombre              VARCHAR(15),
    id_marca            INT

    FOREIGN KEY (id_marca) REFERENCES marca(id_marca)
);


CREATE TABLE tipo_remolque (
    cod_tipo_remolque   INT PRIMARY KEY IDENTITY(1,1),
    tipo_remolque       VARCHAR(50)
);


CREATE TABLE camiones (
    id_camion           INT PRIMARY KEY IDENTITY(1,1),
	cod_modelo          INT,
    anio                INT,
    patente             VARCHAR(9),
    cod_tipo_remolque   INT,        

    FOREIGN KEY (cod_tipo_remolque) REFERENCES tipo_remolque(cod_tipo_remolque),
    FOREIGN KEY (cod_modelo) REFERENCES modelo(cod_modelo)
);

CREATE TABLE choferes_camiones (
    id_chofer           INT PRIMARY KEY,
    id_camion           INT,
    tiempo_inicio       DATETIME,
    tiempo_fin          DATETIME
    
	FOREIGN KEY (id_chofer) REFERENCES choferes(id_chofer),
    FOREIGN KEY (id_camion) REFERENCES camiones(id_camion)
);


CREATE TABLE clientes (
    cod_cliente         INT PRIMARY KEY IDENTITY(1,1),
    nombre              VARCHAR(22),
    apellido            VARCHAR(22),
    dni                 VARCHAR(10),
    direccion           VARCHAR(50),
    telefono            VARCHAR(22),
    mail                VARCHAR(50),
    tipo                VARCHAR(10) NOT NULL,
    razon_social        VARCHAR(22) NULL,
    cuit                VARCHAR(15) NULL,

    CHECK ((tipo = 'Empresa' AND cuit IS NOT NULL AND razon_social IS NOT NULL) OR
        (tipo = 'Persona' AND cuit IS NULL AND razon_social IS NULL))
);

CREATE TABLE provincias (
    id_provincia        INT PRIMARY KEY IDENTITY(1,1),
    nombre              VARCHAR(50)
);

CREATE TABLE ciudades (
    id_ciudad           INT PRIMARY KEY IDENTITY(1,1),
    id_provincia        INT,
    ciudad              VARCHAR(75),

    FOREIGN KEY (id_provincia) REFERENCES provincias(id_provincia)
);

CREATE TABLE viajes (
    cod_viaje           INT PRIMARY KEY IDENTITY(1,1), 
    kilometros          FLOAT,
    cod_cliente         INT,
    id_chofer           INT,
    fecha_salida        DATETIME,
    fecha_llegada       DATETIME,
    id_ciudad_origen    INT,
    id_ciudad_destino   INT,
    id_camion           INT,
    direccion           VARCHAR(100),

    FOREIGN KEY (cod_cliente) REFERENCES clientes(cod_cliente),
    FOREIGN KEY (id_chofer) REFERENCES choferes(id_chofer),
    FOREIGN KEY (id_ciudad_origen) REFERENCES ciudades(id_ciudad),
    FOREIGN KEY (id_ciudad_destino) REFERENCES ciudades(id_ciudad),
    FOREIGN KEY (id_camion) REFERENCES camiones(id_camion)
);



---------------------INICIO DE INSERCION DE DATOS EN LAS TABLAS-----------------------

SET NOCOUNT ON;

-- Insertar datos en la tabla "choferes"
INSERT INTO choferes VALUES 
('Lionel','Messi','20102312','Juan Manuel de Rosas 186','3412636465','3124578120',34,'liomessi@gmail.com','124587965412354698784512354687541236'),--	id_chofer (automatico)
('Claudio','Bravo','15742312','San Juan 100','3412636465','3124578120',18,'cbravo@gmail.com','88894965412354698784512354687541236'),
('Luis','Suarez','20102333','Tucuman 23','3412636465','3124578120',35,'lsuarez@gmail.com','124584561212354698784512354687541236'),
('Neymar','Jr','23202212','Cordoba 24','3412636465','3124578120',30,'neymar@gmail.com','124587965412354698756987412687541236'),
('Sergio','Busquets','23402512','La rioja 40','3412636465','3124578120',32,'sbusi@gmail.com','124582223412354698784512354687541236'),
('Sergi','Roberto','20106352','Irigoyen 186','3412636465','3124578120',25,'sroberto@gmail.com','998747965412354698784512354687541236'),
('Javier','Mascherano','27182312','Santa Fe 20','3412636465','3124578120',20,'pelamasche@gmail.com','335647965412354698784518874687541236'),
('Daniel','Alves','50105552','Diego Milito 14','3412636465','3124578120',30,'dani_alv@gmail.com','124587965412357774184512354687541236'),	
('Ivan','Rakitic','30145612','Ovidio Lagos 7','3412636465','3124578120',27,'irakitic@gmail.com','887744965412354698784512354687541236'),	
('Jeremy','Mathieu','45102312','Buenos Aires 30','3412636465','3124578120',28,'jmathieu@gmail.com','23547965412354698784512354687541236');


-- Insertar datos en la tabla "marca"
INSERT INTO marca (nombre) VALUES
('Toyota'),
('Ford'),
('Honda'),
('Chevrolet'),
('Nissan'),
('Hyundai'),
('Kia'),
('Subaru');

-- Insertar datos en la tabla "modelo"
INSERT INTO modelo (nombre, id_marca) VALUES
('Corolla', 1),
('Focus', 2),
('Civic', 3),
('Malibu', 4),
('Altima', 5),
('Elantra', 6),
('Optima', 7),
('Impreza', 8);

-- Insertar datos en la tabla "tipo_remolque"
INSERT INTO tipo_remolque VALUES
('Remolque de Caja Seca'),
('Remolque de Plataforma'),
('Remolque de Volteo'),
('Remolque Refrigerado'),
('Remolque Cisterna'),
('Remolque de Autocarga');

-- Insertar datos en la tabla "camiones"
INSERT INTO camiones VALUES
(1, 2018, 'ABC 123', 1),
(2, 2019, 'XYZ 789', 2),
(3, 2017, 'DEF 456', 3),
(4, 2016, 'LMN 234', 4),
(5, 2020, 'PQR 567', 5),
(6, 2015, 'UVW 901', 6),
(7, 2018, 'JKL 345', 5),
(8, 2019, 'MNO 678', 4);

-- Insertar datos en la tabla "choferes_camiones"
INSERT INTO choferes_camiones (id_chofer, id_camion, tiempo_inicio, tiempo_fin)
VALUES
(1, 1, '2023-11-01 08:00:00', '2023-11-03 16:30:00'),
(2, 2,  '2023-02-05 10:15:00', '2023-02-05 10:15:00'),
(3, 3,  '2023-11-10 12:30:00', '2023-11-12 18:20:00'),
(4, 4,  '2023-11-14 14:45:00', '2023-11-16 20:10:00'),
(5, 5,  '2023-11-18 16:20:00', '2023-11-20 22:40:00'),
(6, 6, '2023-11-23 18:40:00', '2023-11-25 23:15:00') ,
(7, 7,  '2023-11-27 20:05:00', '2023-11-29 01:30:00'),
(8, 8,  '2023-12-02 22:15:00', '2023-12-04 03:45:00');
	  



-- Insertar datos en la tabla "clientes"
INSERT INTO clientes VALUES
('Juan', 'Pérez', '12345678', 'Calle A 123', '555-1234', 'juan@example.com', 'Persona', NULL, NULL),
('María', 'López', '23456789', 'Av. B 456', '555-5678', 'maria@example.com', 'Persona', NULL, NULL),
('Empresa A', 'S.A.', '34567890', 'Plaza C 789', '555-6789', 'info@empresaA.com', 'Empresa', 'Empresa A S.A.', '12345678901'),
('Empresa B', 'S.R.L.', '45678901', 'Calle D 1011', '555-7890', 'contacto@empresaB.com', 'Empresa', 'Empresa B S.R.L.', '23456789012'),
('Carlos', 'Rodríguez', '56789012', 'Av. E 1112', '555-8901', 'carlos@example.com', 'Persona', NULL, NULL),
('Laura', 'Martínez', '67890123', 'Plaza F 1314', '555-9012', 'laura@example.com', 'Persona', NULL, NULL),
('Empresa C', 'S.A.', '78901234', 'Calle G 1516', '555-0123', 'contacto@empresaC.com', 'Empresa', 'Empresa C S.A.', '34567890123'),
('Martín', 'González', '89012345', 'Av. H 1718', '555-2345', 'martin@example.com', 'Persona', NULL, NULL),
('Sofia', 'Fernández', '90123456', 'Plaza I 1920', '555-3456', 'sofia@example.com', 'Persona', NULL, NULL),
('Empresa D', 'S.R.L.', '12345678', 'Calle J 2122', '555-4567', 'info@empresaD.com', 'Empresa', 'Empresa D S.R.L.', '45678901234'),
('Ricardo', 'Ramirez', '23456789', 'Av. K 2324', '555-5678', 'ricardo@example.com', 'Persona', NULL, NULL),
('Empresa E', 'S.A.', '34567890', 'Plaza L 2526', '555-6789', 'contacto@empresaE.com', 'Empresa', 'Empresa E S.A.', '56789012345'),
('Laura', 'Rodríguez', '45678901', 'Calle M 2728', '555-7890', 'laura.rodriguez@gmail.com', 'Persona', NULL, NULL),
('Empresa F', 'S.R.L.', '56789012', 'Av. N 2930', '555-8901', 'info@empresaF.com', 'Empresa', 'Empresa F S.R.L.', '67890123456'),
('Pablo', 'Sánchez', '67890123', 'Plaza O 3132', '555-9012', 'pablo@example.com', 'Persona', NULL, NULL),
('Empresa G', 'S.A.', '78901234', 'Calle P 3334', '555-0123', 'info@empresaG.com', 'Empresa', 'Empresa G S.A.', '78901234567'),
('Carla', 'Martínez', '89012345', 'Av. Q 3536', '555-2345', 'carla@example.com', 'Persona', NULL, NULL),
('Empresa H', 'S.R.L.', '90123456', 'Plaza R 3738', '555-3456', 'info@empresaH.com', 'Empresa', 'Empresa H S.R.L.', '89012345678'),
('Andrés', 'Torres', '12345678', 'Calle S 3940', '555-4567', 'andres@example.com', 'Persona', NULL, NULL),
('Empresa I', 'S.A.', '23456789', 'Av. T 4142', '555-5678', 'info@empresaI.com', 'Empresa', 'Empresa I S.A.', '90123456789');



-- Insertar datos en la tabla "provincias"
INSERT INTO provincias VALUES
('Buenos Aires'), 
('Catamarca'),
('Chaco'),
('Chubut'),
('Córdoba'),	 
('Corrientes'),
('Entre Ríos'),
('Formosa'),	 
('Jujuy'),
('La Pampa'),
('La Rioja'),
('Mendoza'),	 
('Misiones'),
('Neuquén'),	 
('Río Negro'),
('Salta'),
('San Juan'),
('San Luis'),
('Santa Cruz'),
('Santa Fe'),
('Santiago del Estero'), 
('Tierra del Fuego'),
('Tucumán');

-- Insertar datos en la tabla "ciudades"
INSERT INTO ciudades VALUES
(1,'Buenos Aires'),
(1,'La Plata'),
(5,'Córdoba'),
(5,'Villa María'),
(20,'Rosario'),
(20,'Santa Fe'),
(12,'Mendoza'),
(23,'San Rafael'),
(23,'San Miguel de Tucumán'),
(7,'Concepción'),
(16,'Salta'),
(16,'Cafayate'),
(7,'Paraná'),
(7,'Gualeguaychú'),
(14,'Neuquén'),
(12,'Mendoza'),
(18,'San Luis'),
(10,'La Pampa')


-- Insertar datos en la tabla "viajes"
INSERT INTO viajes VALUES 
(1000, 14, 1,'2023-11-01 08:00:00', '2023-11-03 16:30:00',	9,	1	,1 ,'Av. Corrientes 123'),
(1087, 5, 2, '2023-02-05 10:15:00', NULL,					3,	2	,2 ,'Calle 7 890'),
(868, 4, 4,	 '2023-11-10 12:30:00', '2023-11-12 18:20:00',	17,	3	,3 ,'Av. Colón 456'),
(845, 10, 9, '2023-11-14 14:45:00', '2023-11-16 20:10:00',	16,	4	,4 ,'Calle San Martín 789'),
(877, 9, 10, '2023-11-18 16:20:00', '2023-11-20 22:40:00',	14,	5	,5 ,'Av. Pellegrini 1011'),
(827, 7, 6, '2023-11-23 18:40:00', '2023-11-25 23:15:00',	3,	6	,6 ,'Calle San Jerónimo 1213'),
(730, 6, 2,	 '2023-11-27 20:05:00', '2023-11-29 01:30:00',	15,	7	,7 ,'Av. San Martín 1415'),
(800, 15, 1, '2023-12-02 22:15:00', '2023-12-04 03:45:00',	2,	8	,8,'Calle Mitre 1617'),
(550, 12, 7, '2023-12-06 00:30:00', NULL,					11,	9	,7 , 'Av. Sarmiento 1819'),
(760, 8, 7,	 '2023-12-11 02:45:00', '2023-12-13 08:25:00',	16,	10	,6 ,'Calle Belgrano 2021'),
(990, 2, 7,	'2023-12-15 05:00:00', '2023-12-17 10:30:00',	3,	11	,5 ,'Av. San Martín 2223'),
(457, 1, 4,	'2023-03-20 07:15:00', '2023-03-22 12:45:00',	4,	12	,4 ,'Calle San Carlos 2325'),
(688, 13, 8,'2023-12-24 09:30:00', '2023-12-26 15:00:00',	5,	13	,3 ,'Av. Ramírez 2427'),
(977, 11, 5,'2023-12-29 11:45:00', NULL,					6,	14	,2 ,'Calle Uruguay 2529'),
(1200, 3, 3, '2024-01-02 14:00:00', '2024-01-04 19:30:00',	7,	15	,1 ,'Av. Argentina 2631'),
(990, 2, 7,	 '2024-01-07 16:15:00', '2024-01-09 21:45:00',	2,	16	,2 ,'La Rioja 200'),
(457, 1, 4,	 '2024-01-11 18:30:00', '2024-01-13 00:00:00',	4,	17	,3 ,'Rio Negro 23'),
(688, 13, 8,'2024-01-16 20:45:00', '2024-01-18 02:15:00',	11,	18	,4 ,'Avellaneda 9'),
(977, 11, 5,'2024-01-20 23:00:00', '2024-01-22 04:30:00',	12,	16	,5 , 'Avellaneda 9'),
(1200, 3, 3, '2024-01-25 01:15:00', NULL,					1,	12	,6 ,'Calle Belgrano 2021'),
(857, 4, 5, '2023-12-11 03:30:00', '2023-12-13 09:00:00',	5,	10	,7 ,'Av. San Martín 2223'),
(940, 10, 1, '2023-11-27 05:45:00', '2023-11-29 11:15:00',	3,	8	,8 ,'Calle Belgrano 2021'),
(340, 13, 7, '2023-12-27 08:00:00', '2023-12-29 13:30:00',	18,	6	,7 ,'Av. San Martín 2223');

	

--Indice en la tabla choferes para el campo dni:
CREATE INDEX idx_choferes_dni ON choferes(dni);

--Indice en la tabla modelo para el campo id_marca:
CREATE INDEX idx_modelo_id_marca ON modelo(id_marca);

--Indice en la tabla camiones para el campo cod_modelo:
CREATE INDEX idx_camiones_cod_modelo ON camiones(cod_modelo);

--Indice en la tabla viajes para el campo id_camion:
CREATE INDEX idx_viajes_id_camion ON viajes(id_camion);

--Indice en la tabla viajes para los campos id_ciudad_origen e id_ciudad_destino:
CREATE INDEX idx_viajes_ciudades ON viajes(id_ciudad_origen, id_ciudad_destino);


---------------------FIN DE CAMBIOS---------------------


PRINT 'Script ejecutado correctamente. Se ha creado la base de datos Transportes'

select * from clientes
select * from choferes
select * from camiones
select * from marca
select * from modelo
select * from tipo_remolque
select * from choferes_camiones
select * from viajes
select * from provincias
select * from ciudades



