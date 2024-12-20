-- Descripción de la Vista vw_ventas_empleado_local.
-- La vista vw_ventas_empleado_local fue creada para facilitar la consulta de las ventas totales realizadas por cada empleado, mostrando su nombre y apellido, junto con el total de ventas de los locales donde trabajan. Esta vista consolida la información necesaria para analizar el rendimiento de los empleados y los locales en una sola consulta. 

USE es_deportes; 

DROP VIEW IF EXISTS es_deportes.vw_ventas_empleado_local;

CREATE OR REPLACE VIEW es_deportes.vw_ventas_empleado_local AS
SELECT 
    e.nombre AS empleado_nombre,
    e.apellido AS empleado_apellido,
    SUM(c.precio * c.cantidad) AS total_ventas_empleado,
    SUM(c2.precio * c2.cantidad) AS total_ventas_local
FROM empleados AS e
LEFT JOIN local_empleados AS le
    ON e.id_empleados = le.id_empleados
LEFT JOIN compra AS c 
    ON le.id_local = c.id_local
LEFT JOIN compra AS c2 
    ON c2.id_local = le.id_local
GROUP BY e.id_empleados
ORDER BY total_ventas_empleado DESC;

SELECT * FROM es_deportes.vw_ventas_empleado_local;

-- -----------------------------------------------------------------------------------------------------

-- Descripción de la Vista vw_compras_completadas.
--La vista vw_compras_completadas proporciona un análisis claro y detallado del desempeño de los locales. Responde a preguntas clave como:
--¿Cuántas compras completadas ha realizado cada local?
--¿Cuál es el total de ventas generado por estas compras?. 


USE es_deportes; 

DROP VIEW IF EXISTS es_deportes.vw_compras_completadas;
CREATE 
	OR REPLACE
    VIEW es_deportes.vw_compras_completadas AS
SELECT 
    l.direccion,
    COUNT(c.id_compra) AS cantidad_compras,
    SUM(c.precio * c.cantidad) AS total_ventas
FROM local l
LEFT JOIN compra c 
    ON l.id_local = c.id_local
WHERE c.estado_de_compra = 'Completada'
GROUP BY l.id_local
ORDER BY total_ventas DESC;

SELECT * FROM es_deportes.vw_compras_completadas;

-- -----------------------------------------------------------------------------------------

-- Vista: vw_stock_productos
-- Descripción: Proporciona una lista de productos con su stock actual, incluyendo el nombre de la categoría y el proveedor. Esta vista es útil para monitorear la disponibilidad de productos y facilitar la gestión de inventario.

USE es_deportes;

DROP VIEW IF EXISTS es_deportes.vw_stock_productos;
CREATE VIEW es_deportes.vw_stock_productos AS
SELECT 
    p.nombre AS producto_nombre,
    p.descripcion AS producto_descripcion,
    p.stock AS stock_actual,
    cp.nombre AS categoria_nombre,
    pr.nombre AS proveedor_nombre
FROM productos p
LEFT JOIN categoria_productos cp
 ON p.id_categoria_productos = cp.id_categoria_productos
LEFT JOIN proveedores pr
 ON p.id_proveedores = pr.id_proveedores;

SELECT * FROM es_deportes.vw_stock_productos;

-- -----------------------------------------------------------------------------------------------

-- Vista: vw_historial_compras_clientes
-- Descripción: Muestra el historial de compras de cada cliente, incluyendo detalles como el nombre del cliente, fecha de compra, estado de la compra y el total gastado. Esta vista es útil para analizar el comportamiento de compra de los clientes y evaluar su valor para el negocio.

USE es_deportes;

DROP VIEW IF EXISTS es_deportes.vw_historial_compras_clientes;
CREATE VIEW es_deportes.vw_historial_compras_clientes AS
SELECT 
    c.nombre AS cliente_nombre,
    c.apellido AS cliente_apellido,
    co.fecha_de_compra,
    co.estado_de_compra,
    (co.precio * co.cantidad) AS total_gastado
FROM cliente c
LEFT JOIN compra co ON c.id_cliente = co.id_cliente;

SELECT * FROM  es_deportes.vw_historial_compras_clientes;

-- -----------------------------------------------------------------------------------------------------

-- Vista: vw_ventas_por_categoria
-- Descripción: Resume las ventas totales por categoría de producto, mostrando el nombre de la categoría, la cantidad total vendida y el ingreso total generado. Esta vista es útil para identificar las categorías de productos más vendidas y orientar estrategias de marketing y ventas.

USE es_deportes;

DROP VIEW IF EXISTS es_deportes.vw_ventas_por_categoria;
CREATE VIEW es_deportes.vw_ventas_por_categoria AS
SELECT 
    cp.nombre AS categoria_nombre,
    SUM(co.cantidad) AS cantidad_total_vendida,
    SUM(co.precio * co.cantidad) AS ingreso_total
FROM categoria_productos cp
LEFT JOIN productos p 
ON cp.id_categoria_productos = p.id_categoria_productos
LEFT JOIN compra co
 ON p.id_productos = co.id_productos
GROUP BY cp.nombre;

SELECT * FROM  es_deportes.vw_ventas_por_categoria;