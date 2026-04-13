CREATE TABLE empleados(
id_empleados int PRIMARY key,
id_gerente int null,
puesto varchar(50) not NULL null
);

insert into empleados 
(id_empleados,id_gerente,puesto)
values 
(1001, null, 'presidente'),
(2002, 101, 'director'),
(3003, 101, 'gerente'),
(4004, 202, 'ingeniero'),
(5005, 202, 'contador'),
(6006, 202, 'administrador');

with RECURSIVE jerarquia as(
SELECT id_empleados,id_gerente,puesto, 0 AS nivel
FROM empleados
where id_empleados is NULL 
UNION all 
SELECT e.id_empleados ,e.id_gerente,e.puesto, j.nivel +1
from empleados e
join jerarquia j on e.id_gerente = j.id_empleados 
) select * from  jerarquia order by nivel, id_empleados;