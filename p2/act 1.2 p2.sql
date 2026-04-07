SELECT
c1.producto as "articulos del productosA"
c2.pro as "articulos del productosB"
from articulosA c1
left join articulosB on c1.producto = c2.producto
UNION 
SELECT 
c1.producto as "articulos del productosA"
c2.producto as "articulos del productosB"
from articulosA c1
left join articulosB on c1.producto = c2.producto

