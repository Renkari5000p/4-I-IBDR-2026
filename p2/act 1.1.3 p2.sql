create table entregas(
id int not null PRIMARY KEY,
id_cliente int not null,
id_orden int not NULL,
estado_destino varchar (10) not null,
costo double not null
);


insert into entregas
(id_cliente,id_orden,estado_destino,costo)
values
(1001, 1, 'JAL', 987),
(1001, 2, 'CDMX', 400),
(1001, 3, 'CDMX', 545),
(1001, 4, 'CDMX', 321),
(2002, 5, 'MTY', 324),
(3003, 6, 'JAL', 931),
(4004, 7, 'JAL', 876),
(5005, 8, 'CDMX', 567);

select o.id_cliente, o.id_orden, o.estado_destino, o.costo
from ordenes o
where o.estado_destino = 'CDMX'
   and o.id_clientes in (
   select distinct is_cientes
   from ordenes
   where estado_destino = 'JAL'
);