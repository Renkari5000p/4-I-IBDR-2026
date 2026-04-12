CREATE TABLE Concatenar(
	secuencia int NOT NULL,
	sintaxis varchar(50) NOT NULL,
PRIMARY KEY (secuencia,sintaxis)
);


INSERT INTO Concatenar 
values
	(1,'SELECT'),
	(2,'Producto,'),
	(3,'Precio,'),
	(4,'Disponibilidad,'),
	(5,'FROM'),
	(6,'Productos'),
	(7,'WHERE'),
	(8,'Precio'),
	(9,'>100');
	
	SELECT GROUP_CONCAT(sintaxis SEPARATOR ', ') AS secuencia
FROM Concatenar;
	
	
