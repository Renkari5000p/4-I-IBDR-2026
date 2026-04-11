#Promedio de ventas mensuales

CREATE TABLE Ventas(
 id_orden int NOT NULL,
 id_cliente int NOT NULL,
 fecha date NOT NULL,
 total int NOT NULL,
 estado varchar(25) NOT NULL ,
  PRIMARY KEY (id_orden,id_cliente)
);

INSERT INTO Ventas
VALUES
	(1, 1001 ,'2025-01-01' ,100, 'JAL'),
	(2 ,1001 ,'2025-01-01' ,150 ,'JAL'),
	(3, 1001 ,'2025-01-01' ,75 ,'JAL'),
	(4, 1001 ,'2025-01-02' ,100 ,'JAL'),
	(5, 1001 ,'2025-01-03' ,100 ,'JAL'),
	(6, 2002 ,'2025-01-02' ,75 ,'JAL'),
	(7, 2002 ,'2025-01-02' ,150 ,'JAL'),
	(8, 3003 ,'2025-01-01' ,100 ,'CDMX'),
	(9, 3003 ,'2025-01-02' ,100 ,'CDMX'),
	(10, 3003 ,'2025-01-03' ,100 ,'CDMX'),
	(11, 4004 ,'2025-01-04' ,100 ,'CDMX'),
	(12, 4004 ,'2025-01-05' ,50 ,'CDMX'),
	(13, 4004 ,'2025-01-05' ,100 ,'CDMX');

SELECT estado FROM Ventas WHERE total = (SELECT MAX(total) FROM Ventas) limit 1;
