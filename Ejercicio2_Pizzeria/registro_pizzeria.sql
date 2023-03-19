USE `pizzeria` ;

INSERT INTO Provincia VALUES (1,"Barcelona");
INSERT INTO Provincia VALUES (2,"Tarragona");
INSERT INTO Provincia VALUES (3,"Gerona");
INSERT INTO Provincia VALUES (4,"Lerida");

INSERT INTO Localidad VALUES (1,"Badalona",1);
INSERT INTO Localidad VALUES (2,"Barcelona",1);
INSERT INTO Localidad VALUES (3,"Terrasa",1);
INSERT INTO Localidad VALUES (4,"Hospitalet de Llobregat",1);
INSERT INTO Localidad VALUES (5,"Premier de Mar",1);
SELECT * FROM Localidad;

INSERT INTO Cliente VALUES (1,"Daniel","Herman","Pacocha","C/ Venus","08906",1);
INSERT INTO Cliente VALUES (2,"Ismael","Lemke","Rutherford","C/ Saturno","08905",2);
INSERT INTO Cliente VALUES (3,'Esther', 'Spencer', 'Lakin','C/ Plutón',"08106",3);
INSERT INTO Cliente VALUES (4,'Manolo', 'Hamill', 'Kozey','C/ Duero',"08002",2);
INSERT INTO Cliente VALUES (5,'Micaela', 'Monahan', 'Murray','C/ Veleta',"08456",1);

INSERT INTO Tienda VALUES (1,'C/ Picos de Europa','08734',1);
INSERT INTO Tienda VALUES (2,'C/ Sierra de Gádor','08788',2);
INSERT INTO Tienda VALUES (3,'C/ Quinto pino','08458',2);
INSERT INTO Tienda VALUES (4,'C/ Cabo de Gata','08905',1);
SELECT * FROM Tienda;

INSERT INTO Empleado VALUES (1,'Sonia','Ruiz','85135690V','678812017','cocinero',1);
INSERT INTO Empleado VALUES (2,'Irene', 'Hernández','64753215G','628452384','repartidor',2);
INSERT INTO Empleado VALUES (3,'Antonio', 'Domínguez','41491230N','626652498','repartidor',3);
INSERT INTO Empleado VALUES (4,'Juan', 'Gutiérrez','79089577Y','678652431','cocinero',1);
SELECT * FROM Empleado;

INSERT INTO Categoria_pizza VALUES (1,'Napolitana');
INSERT INTO Categoria_pizza VALUES (2, 'Vegetariana');
INSERT INTO Categoria_pizza VALUES (3, 'Hawaiana');
INSERT INTO Categoria_pizza VALUES (4, 'Pepperoni');
INSERT INTO Categoria_pizza VALUES (5, 'Barbacoa');
SELECT * FROM Categoria_pizza;

INSERT INTO Pedido VALUES (1,'2023-01-12 15:30:00','domicilio',12.1,1,1, null, null);
INSERT INTO Pedido VALUES (2,'2023-02-12 15:30:00','recojo',15.5,2,2,2,'2023-02-12 16:30:00');
INSERT INTO Pedido VALUES (3,'2023-03-12 15:30:00','domicilio',16.4,3,1, null, null);
INSERT INTO Pedido VALUES (4,'2023-01-12 15:30:00','domicilio',30.9,4,1, null, null);
SELECT * FROM Pedido;

INSERT INTO Producto VALUES (1, 'bebida','cocacola', 'gaseosa', 'imagen1',1.1,null);
INSERT INTO Producto VALUES (2, 'hamburguesa','doble', 'hamburguesa con doble carne', 'imagen2',4.1,null);
INSERT INTO Producto VALUES (3, 'pizza','pizza', 'pizza con queso', 'imagen3',4.5,2);
INSERT INTO Producto VALUES (4, 'pizza', 'hawaiana', 'pizza con jamón y piña', 'imagen4', 5.0,3);
INSERT INTO Producto VALUES (5, 'pizza', 'napolitana suprema', 'pizza con queso e ingeredientes dobles', 'imagen5', 7.5, 1);
INSERT INTO Producto VALUES (6, 'bebida', 'pepsi', 'gaseosa', 'imagen6', 1.2, null);
INSERT INTO Producto VALUES (7, 'bebida', 'aquarius', 'gaseosa', 'imagen7', 1.2, null);
INSERT INTO Producto VALUES (8, 'hamburguesa','suprema', 'hamburguesa con triple carne', 'imagen8',5.1,null);
SELECT * FROM Producto;

INSERT INTO Pedido_has_Producto VALUES (1,3,1);
INSERT INTO Pedido_has_Producto VALUES (1,1,2);
INSERT INTO Pedido_has_Producto VALUES (2,5,1);
INSERT INTO Pedido_has_Producto VALUES (2,6,1);
INSERT INTO Pedido_has_Producto VALUES (3,8,1);
INSERT INTO Pedido_has_Producto VALUES (3,7,2);
INSERT INTO Pedido_has_Producto VALUES (3,5,1);

SELECT * FROM Pedido_has_Producto;


