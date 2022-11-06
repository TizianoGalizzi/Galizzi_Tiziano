CREATE TABLE departamentos ( 
iddepartamento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
nombre VARCHAR(100) NOT NULL, 
presupuesto DOUBLE NOT NULL,
estado  boolean NOT NULL
);
CREATE TABLE empleados ( idemplaedo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cuil_cuit VARCHAR(15) NOT NULL UNIQUE, nombre VARCHAR(100) NOT NULL, apellido VARCHAR(100) NOT NULL, id_departamento INT UNSIGNED,
estado BOOLEAN,
FOREIGN KEY (id_departamento) REFERENCES departamentos(iddepartamento)
);
CREATE TABLE clientes (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
ciudad VARCHAR(100),
categoría INT UNSIGNED
); CREATE TABLE vendedores (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
comisión FLOAT
);
CREATE TABLE pedidos (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cantidad DOUBLE NOT NULL,
fecha DATE,
id_cliente INT UNSIGNED NOT NULL,
id_vendedor INT UNSIGNED NOT NULL,

FOREIGN KEY (id_cliente) REFERENCES clientes(id),
FOREIGN KEY (id_vendedor) REFERENCES vendedores(id)
);

-- EJERCICIOS
-- 1) Agregar las entidades paises (id, nombre), 
-- provincias (id, nombre, idpais) 
-- y localidades (id,nombre, cp,id_provincia). 

CREATE TABLE paises (
id INT UNSIGNED NOT NULL  auto_increment PRIMARY KEY,
nombre VARCHAR(30)
);
CREATE TABLE provincias (
idprovincias INT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
nombre VARCHAR(30),
idpais INT UNSIGNED,
FOREIGN KEY (idpais) references paises(id) 
);
CREATE TABLE localidades (
id INT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
nombre VARCHAR(40),
cp INT NOT NULL,
id_provincia INT UNSIGNED,
FOREIGN KEY (id_provincia) REFERENCES provincias(idprovincias)
);

-- 2) Modificar la tabla empleados usando ALTER TABLE y agregar los campos:
-- direccion (varchar)
-- id_localidad (pk localidad) –Esta es un relación con la tabla localidades	email
-- telefono
-- fecha_ingreso
-- tms (timestamp)
ALTER TABLE empleados ADD direccion VARCHAR(70);
ALTER TABLE empleados ADD id_localidad INT UNSIGNED;
ALTER TABLE empleados ADD FOREIGN KEY (id_localidad) REFERENCES localidades(id);
ALTER TABLE empleados ADD email VARCHAR (60);
ALTER TABLE empleados ADD telefono VARCHAR(50);
ALTER TABLE empleados ADD fecha_ingreso DATE;
ALTER TABLE empleados ADD tms TIMESTAMP;

-- 3) Modificar la tabla de departamentos  usando ALTER TABLE y agregar los campos:
-- gasto (double)
-- tms (timestamp)

ALTER TABLE departamentos ADD (
gasto DOUBLE,
tms TIMESTAMP
);

-- 4)Insertar 5 registros en cada tabla de: paises, provincias, localidades, departamentos, empleados.

INSERT INTO paises (nombre) VALUES
('Argentina'),
('España'),
('México'),
('Canadá'),
('Brasil');
INSERT INTO provincias (nombre,idpais) VALUES
('San Juan',1),
('Misiones',1),
('Córdoba', 1),
('Córdoba',2 ),
('Puebla',3);
INSERT INTO localidades (nombre, cp, id_provincia)VALUES
('9 de julio',5400 ,1),
('Posadas',3300 ,2),
('Agua de oro',5107 ,3),
('Adamuz',14430 ,4),
('Acocota',72377 ,5);
INSERT INTO departamentos (nombre,presupuesto,estado,gasto,tms)VALUES
('I+D', 14000, 1, 7500, '2017-07-23 10:00:00' ),
('Contabilidad', 8000, 0, 7500, '2014-07-23 11:00:00' ),
('DevOps', 6000, 1, 3500, '2012-07-23 09:00:00' ),
('FrontEnd', 8000,1, 4500, '2010-07-23 08:00:00'),
('Marketing', 11000, 1, 8500, '2008-07-23 06:00:00' );
SELECT * FROM empleados;
ALTER TABLE empleados ADD fecha_nacimiento DATE;
INSERT INTO empleados (cuil_cuit,nombre,apellido,id_departamento,estado,direccion,id_localidad,email,telefono,fecha_ingreso,tms,fecha_nacimiento)VALUES
( '23-46241068-9', 'Empleado1', 'Apellido1', 2, 1, 'parachi', 3, 'correo1@gmail.com', '3764703356', '2020-08-08', '1970-01-01 00:00:00' , '2002-09-12'),
('21-43241068-4', 'Empleado2', 'Apellido2', 4, 1, 'parachicu', 4, 'correo2@gmail.com', '3765233376', '2019-05-07', '1970-01-01 00:00:00','2000-02-10'),
('23-47241068-9', 'Empleado3', 'Apellido3', 4, 1, 'parachicudo', 4, 'correo3@gmail.com', '376735656', '2020-08-08', '1970-01-01 00:00:00','1990-03-12'),
('21-32951068-9', 'Empleado4', 'Apellido4', 5, 1, 'parachipu', 1, 'correo4@gmail.com', '3764405123', '2018-08-08', '1970-01-01 00:00:00','1995-04-12'),
('22-20241068-9', 'Empleado5', 'Apellido5', 1, 0, 'parachite', 5, 'correo5@gmail.com', '3764215790', '1990-08-08', '1970-01-01 00:00:00','1962-02-13');

-- 5) Modificar el nombre de la tabla “pedidos” por “movimientos”. RENAME TABLE
RENAME TABLE pedidos TO movimientos;

-- 6) Agregar las entidades:
-- Productos (id, nombre, descripcion, id_marca fk, stock, precio, estado, tms)
-- Marcas (id, nombre, descripción, imagen, id_proveedor, estado, tms)
-- Proveedores (id, razon_social, nombre, apellido, naturaleza (fisica o juridica), cuit,id_localidad fk, estado,tms)
-- Cajas (id,horainicio(datatime),horacierre(datatime), estado, tms)

CREATE TABLE cajas( -- CREADA CON EXITO
id BIGINT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
horainicio datetime,
horacierre datetime,
estado BOOLEAN,
tms timestamp
);
DROP TABLE IF EXISTS proveedores;
CREATE TABLE proveedores( -- CREADA CON EXITO
id BIGINT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
razon_social VARCHAR(100),
nombre VARCHAR(40),
apellido VARCHAR(40),
naturaleza VARCHAR(30),
cuit VARCHAR(50),
id_localidad INT UNSIGNED,
estado BOOLEAN,
tms timestamp,
FOREIGN KEY (id_localidad) REFERENCES localidades(id)

); 
CREATE TABLE marcas( -- CREADA CON EXITO
id INT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
nombre VARCHAR(30),
descripcion VARCHAR(300),
imagen VARCHAR(100),
id_proveedor INT,
estado BOOLEAN,
tms timestamp
);
CREATE TABLE marca_producto( -- CREADA CON EXITO
id INT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
id_productos INT UNSIGNED,
id_marca INT UNSIGNED,
FOREIGN KEY(id_productos) REFERENCES productos(id),
FOREIGN KEY(id_marca) REFERENCES marcas(id)
); 
-- Dedici crear una tabla intermediaria entre marcas y productos, ya que al intentar 
-- establecer Constraints de Foreign Key dentro de cada una de las tablas me tiraba
-- un error al referenciar una con otra. 
CREATE TABLE productos( -- CREADA CON EXITO
id INT UNSIGNED NOT NULL auto_increment,
nombre VARCHAR(40),
descripcion VARCHAR(300),
imagen VARCHAR(300),
stock INT,
precio INT,
estado BOOLEAN,
tms timestamp,
primary key (id)
);



-- 7) Insertar 5 registros en cada tabla del punto 6. Tener en cuenta que el script debe ejecutarse secuencialmente y no fallar.
INSERT INTO productos(nombre, descripcion,imagen,stock,precio,estado,tms) VALUES 
('Head-SoundsHK','Auricular inalambrico', 'auricular.jpg',52,3500, true, '2022-10-04 06:00:00'),
('Kit arduino uno','Kit de componentes arduino uno', 'kit_arduino_uno.jpg',102,12500, true, '2021-09-12 09:30:00'),
('Kit arduino','Kit de componentes arduino', 'kit_arduino.jpg',102,12500, false, '2021-09-12 09:30:00'),
('Mouse gamer','Mouse gamer luces led', 'mouse_gamer.jpg',31,9300, true, '2019-03-25 08:00:00'),
('Teclado mecanico','Teclado mecanico', 'teclado_mecanico.jpg',20,6500, true, '2018-03-25 12:00:00');


INSERT INTO marcas(nombre, descripcion, imagen, id_proveedor, estado, tms) VALUES 
('Pedrinos','Venta de insumos electronicos', 'Pedrinos.jpg',1, true,'2000-03-25 08:00:00' ),
('Medrinas','Venta de insumos electronicos', 'Medrinas.jpg',1, true,'2004-03-25 06:00:00' ),
('Tericus','Venta de insumos alimenticios', 'Tericus.jpg',2, true,'2000-03-25 07:00:00' ),
('Pericos','Venta de insumos electronicos', 'Pericos.jpg',1, false,'2002-03-25 06:30:00' ),
('TuyCo','Venta de juguetes infantiles', 'TuyCo.jpg',3, true,'1995-01-25 05:30:00' );

INSERT INTO proveedores(razon_social,nombre,apellido,naturaleza,cuit, id_localidad, estado, tms) VALUES
('Distribucion de insumos electronicos','Pepe', 'Argento','Juridica','22-10241068-9',2,true,'1985-01-25 07:30:00'),
('Distribucion de insumos alimenticios','Pipa', 'Ricuria','Juridica','22-35241068-9',2,true,'1980-01-25 09:30:00'),
('Distribucion de juguetes','Pop', 'Oloroso','Juridica','22-21241068-9',3,false,'1990-01-25 08:30:00'),
('Distribucion de insumos','Juan', 'Caballero','Juridica','22-19241068-9',5,true,'1989-01-25 10:30:00'),
('Distribucion de insumos','Pedro', 'Almirante','Juridica','22-17241068-9',4,true,'1999-01-25 12:30:00');
INSERT INTO cajas(horainicio, horacierre, estado, tms) VALUES
('2022-08-01 06:00:01','2022-08-01 13:00:01',true, '2022-08-01 06:00:01'),
('2022-08-05 08:00:01','2022-08-05 16:00:01',true, '2022-08-05 08:00:01'),
('2022-09-01 10:00:01','2022-09-01 18:00:01',true, '2022-09-01 10:00:01'),
('2022-04-01 04:00:01','2022-04-01 12:00:01',true, '2022-04-01 04:00:01'),
('2021-03-01 05:00:01','2021-03-01 10:00:01',true, '2021-03-01 05:00:01');


INSERT INTO marca_producto (id_productos, id_marca) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);
-- 8 Listar	el	nombre,	presupuesto,	gastos	y	diferencia(presupuesto-gasto) de todos los departamentos con estado activo o 1.
SELECT nombre, presupuesto, gasto, (presupuesto - gasto) AS diferencia FROM departamentos WHERE estado = 1;

-- 9) Listar todas todas las localidades agrupadas por pais. En la vista se deberia ver el nombre del pais y el nombre de la localidad
SELECT p.nombre AS pais, l.nombre AS localidad FROM localidades AS l 
LEFT JOIN provincias AS pr ON l.id_provincia = pr.idprovincias
INNER JOIN paises AS p ON pr.idpais = p.id; 

-- 10) Modificar (UPDATE): el telefono de un empleado cuando el id es igual a uno que hayan declarado. El fecha_ingreso y la localidad de otro empleado.
UPDATE empleados SET telefono = '376539393982' WHERE idemplaedo = 3;
UPDATE empleados SET fecha_ingreso= '2018-08-08' WHERE idemplaedo = 1;
UPDATE empleados SET id_localidad = '2' WHERE idemplaedo = 2;

-- 11)Insertar 5 vendedores.
INSERT INTO vendedores(nombre,apellido,cuitcuil,comisión) VALUES
('Elias','Alfonso','22-46191062-9', 1),
('Manuel','Galizzi','22-44191062-9', 2),
('Lucas','Galeano','22-49191062-9', 3),
('Santiago','Echegaray','22-42191062-9', 3),
('Julian','Correa','22-42191062-9', 2);

-- 12)Modificar	la	tabla	movimientos	y	agregar	los	campos:	id_producto	fk,	estado, tms(timestamp), tipo_movimiento (ingreso, egreso, pedido)

ALTER TABLE movimientos ADD (
id_producto INT UNSIGNED,
estado BOOLEAN,
tms timestamp,
tipo_movimiento VARCHAR(20),
FOREIGN KEY (id_producto) REFERENCES productos(id)
);

-- 13) insertar 5 movimientos distintos.

INSERT INTO movimientos (cantidad, fecha, id_cliente, id_vendedor,id_producto, estado, tms, tipo_movimiento) VALUES
(5001345, '2018-05-10',5, 3,5, true, '2010-05-22 00:00:00', 'ingreso'),
(34631354, '2020-01-04',5, 5,4, true, '2009-05-22 00:00:00', 'egreso'),
(57434, '2022-03-14',2, 3,3, false, '2012-05-22 00:00:00', 'egro'),
(13613, '2019-05-24',5, 3, 3,true, '2008-05-22 00:00:00', 'pedido'),
(13566, '2019-05-24',4, 5,1, false, '2009-05-22 00:00:00', 'pedido');
SELECT * FROM movimientos;
SELECT * FROM paises;
SELECT * FROM localidades;
SELECT * FROM provincias;

SELECT count(p.nombre),p.nombre AS pais, l.nombre AS localidad, p.estado FROM localidades AS l 
LEFT JOIN provincias AS pr ON l.id_provincia = pr.idprovincias
INNER JOIN paises AS p ON pr.idpais = p.id GROUP BY pais ; 


-- 14) Borrar lógicamente (UPDATE de la columna estado): ● 2 movimientos que fueron cargados mal.   Un pais que tenga al menos 3 localidades
UPDATE movimientos SET estado = 0 WHERE id = 40;
UPDATE movimientos SET estado = 0 WHERE id = 38;
UPDATE provincias SET estado = 0 WHERE idpais = 1;

-- 15) Modificar el campo stock de la tabla productos teniendo en cuenta la cantidad de la tabla de movimientos. Sumar el stock si es un ingreso, restar si es un egreso. 
-- Esto hacerlo de manera manual en base los 5 movimientos insertados en el punto 13. Es decir deben haber5 updates de la tabla producto.
UPDATE productos SET stock = (stock + 13566) WHERE id = 1;
UPDATE productos SET stock = (stock - 57434 ) WHERE id = 2;
UPDATE productos SET stock = (stock + 13613) WHERE id = 3;
UPDATE productos SET stock = (stock - 34531354) WHERE id = 4;
UPDATE productos SET stock = (stock + 5001345) WHERE id = 5;

-- 16)Cear la tabla parametros (id, tms,cosas(json), id_usuario

CREATE TABLE parametros(
id INT NOT NULL auto_increment PRIMARY KEY,
tms TIMESTAMP,
cosas JSON,
id_usuario INT
);
-- 17) Insertar en la tabla parametros teniendo en cuenta la columna cosas:
-- {"idDeLaCosa": 101, "permisos": "PUT, GET"}
-- {"vistasPermitidas":"menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente", “grupo": "ventas"}
-- {"zonaHoraria": "America/Argentina/BuenosAires"}
-- {"fechaInicioActividades":	01/01/2019,	"mesAperturaCaja":	"Enero",	"mesCierreCaja": "Diciembre"}
-- {"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93","egreso": "3732538,75"},"2020":{"ingreso": "27442665,12","egreso": "8522331,82"},"2021": {"ingreso": "31634912,57","egreso": "9757142,66"}}} Nota: Rellenar a criterio los campos id, tms,id_usuario
SELECT * FROM parametros;
INSERT INTO parametros (tms, cosas, id_usuario) VALUES  ('2009-05-22 00:00:00','{"idDeLaCosa": 101, "permisos": "PUT, GET" }', 1);
INSERT INTO parametros (tms, cosas, id_usuario) VALUES  ('2006-02-22 00:00:00','{"vistasPermitidas": "menuPrincipal,menuSecundario, ventas, estadisticaVentas, listaCliente", "grupo": "ventas" }', 3);
INSERT INTO parametros (tms, cosas, id_usuario) VALUES ('2007-10-12 00:00:00','{"zonaHoraria":"America/Argentina/BuenosAires"}', 2);
INSERT INTO parametros (tms, cosas, id_usuario) VALUES ('2019-09-09 00:00:00','{"fechaInicioActividades":"01/01/2019", "mesAperturaCaja": "Enero", "mesCierreCaja": "Diciembre"  }', 4);
INSERT INTO parametros (tms, cosas, id_usuario) VALUES ('2010-12-01 00:00:00','{"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93","egreso": "3732538,75"},"2020":{"ingreso": "27442665,12","egreso": "8522331,82"},"2021": {"ingreso": "31634912,57","egreso": "9757142,66"}}} ', 5);

