CREATE table requisitos(
descripcion varchar(20) PRIMARY KEY 
);

insert into requisitos (descripcion)values 
('geologo'),
('astronomo'),
('tecnico');

create table candidatos(
id_candidatos int not null,
descripcion varchar(20) not null,
primary key (id_candidatos, descripcion)
);

INSERT into candidatos (id_candidatos,descripcion) values
(1001,'geologo'),
(1001,'astronomo'),
(1001,'bioquimico'),
(1001,'tecnico'),
(2002,'cirujano'),
(2002,'medico'),
(2002,'geologo'),
(3003,'geologo'),
(3003,'astronomo'),
(4004,'ingeniero');

select id_candidatos
from candidatos
where descripcion in (select descripcion from requisitos)
group by id_candidatos 
HAVING COUNT (distinct descripcion ) = (select count (*) from requisitos);