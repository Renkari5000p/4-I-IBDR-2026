CREATE TABLE procesos (
flujo varchar(50),
paso int,
estado varchar(20)
primary key (flujo, paso, estado)
);

insert into procesos(flujo, paso , estado)
values
('Alpha',1, 'Error'),
('Alpha' ,2, 'Finalizado'),
('Alpha', 3, 'Corriend'),
('Bravo', 1, 'Finalizado'),
('Bravo', 2, 'Finalizado'),
('Charlie' ,1, 'Corriendo'),
('Charlie', 2, 'Corriendo'),
('Delta', 1, 'Error'),
('Delta', 2, 'Error'),
('Echo', 1, 'Corriendo'),
('Echo', 2, 'Finalizado');

select flujo,
case EXCEPT 
when count(distinct estado) = 1 then max(estado)
when sum(estado = error) > 0
and (sum(estado = finalizado) > 0 or sum(estado = corriendo) > 0 then indeterminado
when (sum(estado = finalizado) > 0 and sum(estado = corriendo) > 0 then corriendo
else indeterminado
and as estado 
from procesos
group by flujo;
