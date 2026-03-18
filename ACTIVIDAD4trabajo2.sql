CREATE TABLE procesos(
	proceso varchar(50)NOT NULL,
	mensaje varchar(40)NOT NULL,
	Ocurrencia int NOT NULL,
	PRIMARY KEY (proceso,mensaje,Ocurrencia)
	);

INSERT INTO procesos
 values 
('Web','Error: No se puede dividir por 0',3),
('RestAPI','Error: Fallo la conversión ',5), 
('App','Error: Fallo la conversión ',7), 
('RestAPI','Error: Error sin identificar',9), 
('Web','Error: Error sin identificar',1), 
('App','Error: Error sin identificar',10), 
('Web','Estado Completado ',8), 
('RestAP',' Estado Completado',6);

SELECT * FROM procesos WHERE mensaje = 'Error: No se puede dividir por 0' and Ocurrencia = (
SELECT  max(Ocurrencia)  FROM procesos WHERE mensaje = 'Error: No se puede dividir por 0')
UNION SELECT * FROM procesos WHERE mensaje = 'Error: Fallo la conversión ' and Ocurrencia = (
SELECT  max(Ocurrencia)  FROM procesos WHERE mensaje = 'Error: Fallo la conversión ')
UNION SELECT * FROM procesos WHERE mensaje = 'Error: Error sin identificar' and Ocurrencia = (
SELECT  max(Ocurrencia)  FROM procesos WHERE mensaje = 'Error: Error sin identificar')
UNION SELECT * FROM procesos WHERE mensaje = 'Estado Completado ' and Ocurrencia = (
SELECT  max(Ocurrencia)  FROM procesos WHERE mensaje = 'Estado Completado ');
 
SELECT * FROM procesos WHERE mensaje = 'Error: Error sin identificar' and Ocurrencia = (
SELECT  max(Ocurrencia)  FROM procesos WHERE mensaje = 'Error: Error sin identificar')


  








