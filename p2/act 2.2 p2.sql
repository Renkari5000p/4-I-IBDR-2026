create table desarrollos(
desarrollo varchar(20),
etapa int,
finalizado date default null,
primary key (desarrollo, etapa)
);

insert into desarrollos(desarrollo, etapa, finalizado) VALUES 
('RestAPI',1, '2024-02-01'),
('RestAPI',2, '2024-05-30'),
('RestAPI',3, '2024-06-29'),
('web',1,'2024-10-28'),
('web',2,'2024-11-20'),
('web',3,null),
('app',1,'2024-01-30'),
('app',2,null);

select DISTINCT desarrollo
from desarrollos 
where finalizado  is null;