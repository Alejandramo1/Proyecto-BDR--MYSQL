USE rappi;

-- Creacion vista de top de productos más vendidos
CREATE OR REPLACE VIEW Vw_productos_vendidos AS
(SELECT p.nombre AS Nombre_producto,cantidad AS Unidades_vendidas,total_orden AS Ingresos
	FROM detalle_orden AS d
	JOIN productos AS p 
    ON d.id_producto=p.id_producto
    GROUP BY nombre
    ORDER BY d.total_orden DESC);
    
-- Creacion vista top de rappitenderos con mayores ordenes 
CREATE OR REPLACE VIEW Vw_top_rappitenderos AS
(SELECT CONCAT(r.nombre_rappi, ' ', r.apellido_rappi) As Rappitendero, COUNT(o.id_orden) AS Numero_ordenes, o.total AS Total_ordenes
FROM rappitenderos AS r
INNER JOIN orden AS o ON r.id_rappi=o.id_rappi
GROUP BY r.nombre_rappi
ORDER BY Numero_ordenes DESC);

-- Medios de pago más usados 
CREATE OR REPLACE VIEW Vw_top_metodo_pago AS
(SELECT p.metodo_pago, COUNT(p.id_pago) AS numero_veces_usado, o.total
FROM pagos AS p
INNER JOIN orden AS o
ON p.id_pago=o.id_pago
GROUP BY p.metodo_pago)
ORDER BY numero_veces_usado DESC;

-- Vendedores con más numero de ordenes
CREATE OR REPLACE VIEW Vw_top_vendedores AS
(SELECT v.nombre, COUNT(o.id_orden) AS numero_ordenes, o.total
FROM vendedor AS v
INNER JOIN orden AS o
ON v.id_vendedor=o.id_vendedor
GROUP BY v.nombre)
ORDER BY numero_ordenes DESC;

-- Usuarios con más numero de ordenes en rappi

CREATE OR REPLACE VIEW Vw_top_usuarios AS
(SELECT CONCAT(u.nombre_usuario, ' ', u.apellido_usuario) As Usuarios, COUNT(o.id_orden) AS numero_ordenes, o.total AS Total_ordenes
FROM usuarios AS u
INNER JOIN orden AS o
ON u.id_usuario=o.id_usuario
GROUP BY u.nombre_usuario
ORDER BY numero_ordenes DESC);
