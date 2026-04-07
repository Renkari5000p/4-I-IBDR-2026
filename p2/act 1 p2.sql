create table articulosA(
producto varchar(20) NOT  NULL,
primary key (producto)
);

create table articulosB(
producto varchar(20) NOT  NULL,
primary key (producto)
);

INSERT INTO articulosA 
values 
('azucar'),
('pan'),
('jugo'),
('refresco'),
('harina');

INSERT INTO articulosB
values 
('azucar'),
('pan'),
('mantequilla'),
('queso'),
('manzana');

SELECT *
FROM articulosB
full OUTER JOIN articulosA
ON articulosA.producto  = articulosB.producto;
