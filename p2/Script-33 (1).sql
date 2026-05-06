-- Eliminar tablas
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS numeros;
-- Crear tabla productos
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    producto VARCHAR(20),
    cantidad INT
);


INSERT INTO productos (producto, cantidad) VALUES
('Lápiz', 3),
('Borrador', 4),
('Cuaderno', 2);


CREATE TABLE numeros (
    n INT PRIMARY KEY
);

INSERT INTO numeros (n) VALUES
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10);


SELECT 
    p.producto,
    1 AS cantidad
FROM productos p
JOIN numeros n 
    ON n.n <= p.cantidad
ORDER BY p.id, n.n;


-- PArte 2 ---

--  Eliminar tabla si existe
DROP TABLE IF EXISTS asientos;
DROP TABLE IF EXISTS numeros;

--  Crear tabla con PRIMARY KEY
CREATE TABLE asientos (
    num_asiento INT PRIMARY KEY
);

--  Insertar datos
INSERT INTO asientos VALUES
(7),(13),(14),(15),(27),(28),(29),(30),(31),(32),
(33),(34),(35),(52),(53),(54);

--  Tabla de números
CREATE TABLE numeros (
    n INT PRIMARY KEY
);

INSERT INTO numeros (n) VALUES
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),
(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),
(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),
(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),
(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),
(51),(52),(53),(54),(55),(56),(57),(58),(59),(60);


WITH libres AS (
    SELECT n
    FROM numeros
    WHERE n NOT IN (SELECT num_asiento FROM asientos)
),
grupos AS (
    SELECT 
        n,
        n - ROW_NUMBER() OVER (ORDER BY n) AS grupo
    FROM libres
)
SELECT 
    MIN(n) AS espacio_inicio,
    MAX(n) AS espacio_final
FROM grupos
GROUP BY grupo
ORDER BY espacio_inicio;  -- 🔥 CLAVE


SELECT COUNT(*) AS disponibles
FROM numeros
WHERE n NOT IN (SELECT num_asiento FROM asientos);



SELECT 
    tipo,
    total
FROM (
    SELECT 
        CASE 
            WHEN num_asiento % 2 = 0 THEN 'pares'
            ELSE 'impares'
        END AS tipo,
        COUNT(*) AS total
    FROM asientos
    GROUP BY tipo
) t
ORDER BY 
    CASE 
        WHEN tipo = 'pares' THEN 1
        ELSE 2
    END;



-- Parte 3 --


-- Eliminar tabla
DROP TABLE IF EXISTS periodos;

-- Crear tabla
CREATE TABLE periodos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    inicio DATE,
    final DATE
);

--  Insertar datos
INSERT INTO periodos (inicio, final) VALUES
('2025-01-01','2025-01-05'),
('2025-01-03','2025-01-09'),
('2025-01-10','2025-01-11'),
('2025-01-12','2025-01-16'),
('2025-01-15','2025-01-19');



WITH ordenados AS (
    SELECT 
        inicio,
        final,
        ROW_NUMBER() OVER (ORDER BY inicio) AS rn
    FROM periodos
),
grupos AS (
    SELECT 
        inicio,
        final,
        MAX(final) OVER (ORDER BY inicio ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS max_final
    FROM ordenados
),
marcados AS (
    SELECT 
        inicio,
        final,
        CASE 
            WHEN inicio > LAG(max_final) OVER (ORDER BY inicio) 
            THEN 1 ELSE 0 
        END AS nuevo_grupo
    FROM grupos
),
acumulado AS (
    SELECT 
        inicio,
        final,
        SUM(nuevo_grupo) OVER (ORDER BY inicio) AS grupo
    FROM marcados
)
SELECT 
    MIN(inicio) AS inicio,
    MAX(final) AS final
FROM acumulado
GROUP BY grupo
ORDER BY inicio;

-- David Iyari García Herrera 4°I --
-- 2026-A 4-I IDBRSI Implementa Bases de Datos Relacionales --