create table iteracones(
desarrollo varchar(20),
terminacion DATE,
primary key (desarrollo, terminacion)
);

insert into iteracones(desarrollo, terminacion)
values
('RestAPI','2024-06-01'),
('RestAPI','2024-06-14'),
('RestAPI','2024-06-15'),
('web','2026-06-01'),
('web','2026-06-02'),
('web','2026-06-19'),
('app','2026-06-01'),
('app','2024-06-15'),
('app','2024-06-30');

WITH cte as (
select
desarrollo,
terminacion,
lag(terminacion)over (partition by desarrollo order by terminacion) AS terminacion_previa
from iteraciones
)
select desarrollo.
AVG(datediff(terminacion, terminacion_previa)) as promedio
from cte 
where terminacion_previa is not null
GROUP  by desarrollo;