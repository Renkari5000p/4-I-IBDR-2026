create TABLE  tabla_original(
customer_id int not null,
type_phone varchar(20) not null,
numb varchar(20) not null,
primary key(customer_id, type_phone, numb)
);

insert into tabla_original  (customer_id, type_phone, numb) values
(1, 'celular', '33-1045-2302'),
(1, 'trabajo', '33-1234-5678'),
(2, 'casa', '33-2345-6789'),
(2, 'celular', '33-3456-7890'),
(3, 'trabajo', '33-4567-8901');

create table tabla_trasformada (
customer_id int not NULL,
celular varchar(20),
trabajo varchar(20),
casa varchar(20),
primary key (customer_id)
);

insert into tabla_trasformada (customer_id, celular, trabajo, casa)
SELECT 
customer_id,
MAX(case when type_phone = 'celular' THEN  numb end) as celular,
MAX(case when type_phone = 'trabajo' THEN  numb end) as trabajo,
MAX(case when type_phone = 'casa' THEN numb end)as casa
FROM 
tabla_original 
group by 
customer_id