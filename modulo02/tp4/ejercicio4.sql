
CREATE TABLE cliente(
id_cliente BIGINT NOT NULL auto_increment,
dni VARCHAR(45) NOT NULL,
nombre VARCHAR(45) NOT NULL,
direccion VARCHAR(55) NOT NULL,
telefono VARCHAR(45) NOT NULL,
PRIMARY KEY(id_cliente)

);
CREATE TABLE reserva(
num_id BIGINT NOT NULL auto_increment,
fecha_i DATE NOT NULL,
fecha_f DATE NOT NULL,
precio_total BIGINT,
id_cliente BIGINT,
litros_i INT,
PRIMARY KEY(num_id),
CONSTRAINT `fk_clientes_id` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
CONSTRAINT `fk_coches_id` FOREIGN KEY (`coche_id`) REFERENCES `coche` (`coche_id`)
);

CREATE TABLE coche(
coche_id BIGINT NOT NULL auto_increment,
matricula VARCHAR(45) NOT NULL ,
modelo VARCHAR(55) NOT NULL,
color VARCHAR(45),
marca VARCHAR(45),
precio_alquiler INT, 
PRIMARY KEY(coche_id),
CONSTRAINT `fk_marca` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`),
CONSTRAINT `fk_precio_alquiler` FOREIGN KEY (`id_alquiler`) REFERENCES `coche_alquiler` (`id_alquiler`)

);
CREATE TABLE coche_alquiler(
id_alquiler BIGINT NOT NULL auto_increment,
precio_h INT,
PRIMARY KEY(id_alquiler)
);
CREATE TABLE marca(
id_marca BIGINT NOT NULL auto_increment,
nombre VARCHAR(45),
PRIMARY KEY(id_marca)
);

INSERT INTO cliente (dni, nombre, direccion, telefono) VALUES 
('35241068','tiziano','Florencio Sanchez 3787','3764701038'),
('23050068','manuel','Av. San martin','3764809749'),
('32241010','pedro','Av. martin fierro','3765693334'),
('22241068','alberto','Club educacion','376591039');

INSERT INTO reserva(fecha_i, fecha_f, precio_total, id_cliente, litros_i, id_coche) VALUES
('10-09-22', '11-09-22', 5000, 1,2,1), -- reservas cliente 1
('12-09-22', '13-09-22', 4000, 1,3,2), -- reservas cliente 1
('13-09-22', '14-09-22', 4000, 2,2,2), -- reservas cliente 2
('15-09-22', '16-09-22', 5000, 3,4,4), -- reservas cliente 3
('16-09-22', '17-09-22', 5000, 4,5,3), -- reservas cliente 4
('17-09-22', '18-09-22', 5000, 4,5,1); -- reservas cliente 4

INSERT INTO coche (matricula, modelo, color, marca, precio_alquiler) VALUES
('AB 123 CD','modelo1','rojo', 1 ,'1'),
('CD 706 FD','modelo4','azul', 2 ,'2'),
('FD 163 HE','modelo3','blanco', 3 ,'3'),
('OY 562 UD','modelo2','rojo', 4 ,'4');

INSERT INTO marca (nombre) VALUES
('Toyota'),
('Ford'),
('Volkswagen'),
('Citroen');

INSERT INTO coche_alquiler (precio_h) VALUES
('200'),
('250'),
('350'),
('300');



