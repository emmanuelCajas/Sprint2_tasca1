DROP DATABASE IF EXISTS optica;
CREATE DATABASE optica;
USE  optica;

CREATE TABLE direccion(
	id_direccion INT AUTO_INCREMENT PRIMARY KEY,
    calle VARCHAR(30),
    numero VARCHAR(15),
    piso VARCHAR(15),
    puerta	VARCHAR(15),
    ciudad VARCHAR(15),
    codigo_postal VARCHAR(15),
    pais VARCHAR(15)
      
);



CREATE TABLE marca_gafas(
	id_marca INT  AUTO_INCREMENT PRIMARY KEY,
    nombre_marca VARCHAR(15)
);

CREATE TABLE empleado(
	id_empleado INT  AUTO_INCREMENT PRIMARY KEY,
	nombre_empleado  VARCHAR(15),
    apellido_empleado VARCHAR(20),
    nif_empleado VARCHAR(9) UNIQUE
);

CREATE TABLE cliente(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(20),
    apellido_cliente VARCHAR(20),
    codigo_postal VARCHAR(5),
    telefono VARCHAR(9),
    email VARCHAR(20),
    fecha_registro DATE,
    cliente_derivado INT
    
    /*FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) */
);

CREATE TABLE proveedor(
	id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proveedor VARCHAR(30),
    id_direccion INT,
    telefono VARCHAR(9),
    fax VARCHAR(9),
	nif VARCHAR(9),
    FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion)
);

CREATE TABLE gafas(
id_gafas INT AUTO_INCREMENT PRIMARY KEY,
id_marca INT,
id_proveedor INT,
graduacion_cristal_der double,
graduacion_cristal_iz double,
tipo_montura ENUM('flotante','pasta','metalica'),
color_montura VARCHAR(15),
color_vidrio_der VARCHAR(15),
precio DOUBLE,

 FOREIGN KEY (id_marca) REFERENCES marca_gafas(id_marca), 
 FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor) 
);

CREATE TABLE venta(
	id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_gafas INT,
    id_cliente INT,
    id_empleado INT,
    fecha_venta DATE,
	
    FOREIGN KEY (id_gafas) REFERENCES gafas(id_gafas),
	FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);


INSERT INTO direccion VALUES(1,'isabel la catolica','123','E','1','holspitalet','089906','España');

INSERT INTO marca_gafas VALUES(1,'Ray-Ban');
INSERT INTO marca_gafas VALUES(2,'Tous');
INSERT INTO marca_gafas VALUES(3,'Cartier');
INSERT INTO marca_gafas VALUES(4,'Cebe');

INSERT INTO empleado VALUES(1,'Jesus','gamarra','12345678Y');
INSERT INTO empleado VALUES(2,'juan','Cortez','12345678J');
INSERT INTO empleado VALUES(3,'Karina','Fernandez','87613245U');
INSERT INTO empleado VALUES(4,'Carla','Bustamante','87565342P');
INSERT INTO empleado VALUES(5,'Manuel','Herrera','87653493K');

INSERT INTO proveedor VALUES(1,'Perico Leon',1,'611343276','611343276','H76514284');

INSERT INTO cliente VALUES(1,'Salvador','Sanchez','08905','123456789','salvador@gmail.com','2023-05-02',2);
INSERT INTO cliente VALUES(2,'Juan','Saenz','08906','123456765','juan@hotmail.com','2023-02-01',1);

INSERT INTO gafas VALUES(1,1,1,0.2,0.5,'pasta','rojo','negro',150.0);
INSERT INTO gafas VALUES(2,3,1,0.4,0.2,'metalica','verde','azul',200.0);

INSERT INTO venta VALUES(1,2,1,1,'2023-02-07');
INSERT INTO venta VALUES(2,1,2,2,'2023-01-13');
INSERT INTO venta VALUES(3,1,2,2,'2022-09-10');

SELECT * FROM marca_gafas;
SELECT * FROM venta;
SELECT * FROM direccion;
SELECT * FROM gafas;
SELECT * FROM cliente;
SELECT * FROM proveedor;

/*Lista el total de facturas de un cliente/a en un periodo determinado.*/
SELECT * FROM venta WHERE id_cliente=2 AND fecha_venta BETWEEN '2022-01-01' and '2023-02-15';

/*Lista los diferentes modelos de gafas que ha vendido un empleado/a durante un año.*/
SELECT * FROM venta WHERE id_empleado=2 AND YEAR(fecha_venta)='2022';

/*Lista los diferentes proveedores que han suministrado gafas vendidas con éxito por la óptica.*/
SELECT * FROM venta;
SELECT * FROM proveedor;
SELECT * FROM gafas;

SELECT  p.id_proveedor, p.nombre_proveedor, g.id_gafas, g.id_marca, v.fecha_venta  FROM venta v 
JOIN gafas g ON v.id_gafas=g.id_gafas 
JOIN proveedor p ON p.id_proveedor = g.id_proveedor
