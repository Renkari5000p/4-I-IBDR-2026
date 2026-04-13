create table inverntario(
fechas date PRIMARY key,
ajuste int 
);

insert into inverntario  (fechas, ajuste)
VALUES 
('2025-01-03',100),
('2025-01-04',75),
('2025-01-05',-150),
('2025-01-06',50),
('2025-01-07',-70);

select fecha, ajuste, SUM(ajuste) over (order by fecha) as invertario from invertario;