create table casos_de_prueba(
id int auto_increment primary key,
caso varchar(10) not NULL 
);

insert into casos_de_prueba (caso)
values ('A'),('B'),('C');

WITH recursive permutacion (perm, restantes) as (
select
caso as perm,
replace(
(select GROUP_CONCAT(caso order by caso separator ',')
from casos_de_prueba),
caso,
) as restantes
from casos_de_prueba
union all 
select
concat_ws(',',p.perm, c.caso) as perm,
replace(p.restantes, c.caso, '')as restantes
from permutaciones p
join casos_de_prueba c
on locate(c,caso,p.restantes) > 0
)
select perm as permutacion
from permutacion
where length(replace(perm, ',','')) = (
select sum(length(caso))
from casos_de_prueba
) order by perm;
