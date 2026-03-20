CREATE TABLE jugadores(
jugadorA int PRIMARY KEY not null,
jugadorB int NOT NULL ,
marcador int not NULL 
);


INSERT INTO jugadores
(jugadorA,jugadorB,marcador)
values
(1001,2002,150),
(3003,4004,15),
(4004,3003,125);


SELECT 
CASE 
	when jugadorA < jugadorB
	THEN jugadorA
	ELSE jugadorB
  END as jugador_A,
CASE 
	when jugadorA > jugadorB
	THEN jugadorA
	else jugadorB
  END as jugador_B,
SUM(marcador) as marcador
FROM  jugadores 
GROUP BY jugador_A ,jugador_B;