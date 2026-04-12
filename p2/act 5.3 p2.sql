create table marcador(
jugadorA int not null,
jugadorB int not null,
marca int not NULL,
primary key (jugadorA, jugadorB,marca)
);

insert into marcador(jugadorA, jugadorB, marca)
values (1001, 2002, 150),(3003, 4004, 15),(4004, 3003, 125);

select 
case 
	when jugadorA < jugadorB
	then jugadorA
	else jugadorB
	end as jugador_A
when jugadorA > jugadorB
then jugadorB
end as jugador_B;
sum(marcador) as marcador
from marcador
group by jugador_A, juagdor_B;