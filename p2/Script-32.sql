-- Crear tabla jugadores
CREATE TABLE jugadores (
    id_jugador INT PRIMARY KEY,
    marcador INT
); 

-- Insertar datos
INSERT INTO jugadores (id_jugador, marcador) VALUES
(1001, 2343),
(2002, 9432),
(3003, 6548),
(4004, 1054),
(5005, 6832);

-- Crear tabla ranking
CREATE TABLE ranking (
    id_jugador INT PRIMARY KEY,
    marcador INT,
    posicion INT
);

-- Insertar ranking correctamente
INSERT INTO ranking (id_jugador, marcador, posicion)
SELECT 
    id_jugador,
    marcador,
    ROW_NUMBER() OVER (ORDER BY marcador DESC) AS posicion
FROM jugadores;

-- Crear tabla Practice
CREATE TABLE Practice (
    id_jugador INT PRIMARY KEY,
    marcador INT NOT NULL,
    posicion INT NOT NULL
);

-- Insertar datos con ranking
INSERT INTO Practice (id_jugador, marcador, posicion)
SELECT 
    id_jugador,
    marcador,
    ROW_NUMBER() OVER (ORDER BY marcador DESC) AS posicion
FROM jugadores;

-- Crear tabla total
CREATE TABLE total_jugadores (
    total INT PRIMARY KEY
);

-- Insertar total
INSERT INTO total_jugadores (total)
SELECT COUNT(*) FROM Practice;

-- Consulta final (categorías)
SELECT 
    CASE 
        WHEN p.posicion <= t.total / 2.0 THEN 1
        ELSE 2
    END AS categoria,
    p.id_jugador,
    p.marcador
FROM Practice p
CROSS JOIN total_jugadores t
ORDER BY p.posicion;

-- Execise 2 --

CREATE TABLE Ordenes (
    id_orden INT AUTO_INCREMENT PRIMARY KEY,
    id_clientes INT NOT NULL,
    fecha DATE  NOT NULL,
    cantidad DECIMAL(10,2) NOT NULL, 
    Estado VARCHAR(10) NOT NULL
);

-- Insertarlos datos --
INSERT INTO Ordenes (id_orden, id_clientes, fecha, cantidad, estado) VALUES
(1,1001,'2025-01-01',100,'JAL'),
(2,3003,'2025-01-01',100,'COL'),
(3,1001,'2025-01-03',100,'JAL'),
(4,2002,'2025-01-02',150,'JAL'),
(5,1001,'2025-01-02',100,'JAL'),
(6,4004,'2025-01-05',50,'COL'),
(7,1001,'2025-01-01',150,'JAL'),
(8,3003,'2025-01-03',100,'COL'),
(9,4004,'2025-01-04',100,'COL'),
(10,1001,'2025-01-01',75,'JAL'),
(11,2002,'2025-01-02',75,'JAL'),
(12,3003,'2025-01-02',100,'COL'),
(13,4004,'2025-01-05',100,'COL');


-- Metodo de tablas "ordenar" --
SELECT *
FROM Ordenes 

ORDER BY id_orden;

-- Ultima consulta --
SELECT *
FROM Ordenes  
ORDER BY id_orden
LIMIT 5 OFFSET 4;



-- Exercise --

-- Agregar columna (solo si no existe)
ALTER TABLE Ordenes
ADD COLUMN Proveedor VARCHAR(50);

-- IMPORTANTE: primero limpia por si ya hiciste pruebas
UPDATE Ordenes
SET Proveedor = NULL;

-- Asignar proveedores correctamente
UPDATE Ordenes
SET Proveedor = 'IBM'
WHERE id_clientes = 1001;

UPDATE Ordenes
SET Proveedor = 'Amazon'
WHERE id_clientes = 2002;

-- Verificar (opcional)
SELECT id_clientes, Proveedor
FROM Ordenes
WHERE id_clientes IN (1001, 2002);

-- Consulta final (lo que quieres)
SELECT DISTINCT id_clientes AS Id_cliente, Proveedor
FROM Ordenes
WHERE Proveedor IS NOT NULL
ORDER BY id_clientes
;




-- David Iyari García Herrera --
-- 2026-A 4-I IDBRSI --
-- Implementa Bases de Datos Relacionales --