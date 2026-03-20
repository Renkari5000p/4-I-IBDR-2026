CREATE TABLE productos(
id_producto int  NOT NULL,
fecha DATE    NOT NULL,
precio float NOT NULL,
PRIMARY key (id_producto,fecha,precio)
);

INSERT INTO productos 
(id_producto,fecha,precio)
values
(1001, '2025-01-01', 19.99),
(1001, '2025-04-15', 59.99),
(1001, '2025-06-08', 79.99),
(2002, '2025-04-17', 39.99),
(2002, '2025-05-19', 59.99);



SELECT * FROM productos where fecha BETWEEN   ('2025-04-08') AND ('2025-05-19');