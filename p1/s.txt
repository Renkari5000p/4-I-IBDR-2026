/* 
Implementacion de una base de datos en un sistema de informacion
2025/02/19 4-I
Juan Antonio Ortega Sandoval
Nombre de la practica
*/


CREATE TABLE BOOKS (
	ID INT PRIMARY KEY IDENTITY (1, 1),
	NAME VARCHAR(50) NOT NULL,
	PRICE INT,
	CATEGORYID INT,
	AUTHORID INT
);

CREATE TABLE CATEGORIES (ID INT PRIMARY KEY, NAME VARCHAR(50) NOT NULL,);

CREATE TABLE AUTHORS (ID INT PRIMARY KEY, NAME VARCHAR(50) NOT NULL,);

INSERT INTO
	CATEGORIES
VALUES
	(1, 'Cat-A'),
	(2, 'Cat-B'),
	(3, 'Cat-C'),
	(7, 'Cat-D'),
	(8, 'Cat-E'),
	(4, 'Cat-F'),
	(10, 'Cat-G'),
	(12, 'Cat-H'),
	(6, 'Cat-I');

INSERT INTO
	AUTHORS
VALUES
	(1, 'Author-A'),
	(2, 'Author-B'),
	(3, 'Author-C'),
	(10, 'Author-D'),
	(12, 'Author-E');

INSERT INTO
	BOOKS
VALUES
	('Book-A', 100, 1, 2),
	('Book-B', 200, 2, 2),
	('Book-C', 150, 3, 2),
	('Book-D', 100, 3, 1),
	('Book-E', 200, 3, 1),
	('Book-F', 150, 4, 1),
	('Book-G', 100, 5, 5),
	('Book-H', 200, 5, 6),
	('Book-I', 150, 7, 8);
	

/** Encontrar los fallos en el script, hacer las correcciones, realizar las siguientes operaciones y guardar las consultas**/
 --INNER JOIN
 --LEFT OUTER JOIN
 --RIGHT OUTER JOIN
 --JOIN NATURAL
 --LEFT EXCLUDING JOIN
 --LEFT EXCLUDING JOIN