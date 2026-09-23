-- =============================================
-- PROYECTO: GOLDEN GYM - DATA WAREHOUSE
-- ARCHIVO: 05_consultas_analisis.sql
-- DESCRIPCIÓN: Consultas para analizar clientes,
-- membresías e ingresos de GOLDEN GYM
-- =============================================

USE golden_gym;


-- =============================================
-- CONSULTA 1: VER TODOS LOS CLIENTES
-- =============================================

SELECT *
FROM clientes;


-- =============================================
-- CONSULTA 2: CONTAR TOTAL DE CLIENTES
-- =============================================

SELECT COUNT(*) AS total_clientes
FROM clientes;


-- =============================================
-- CONSULTA 3: CONTAR MEMBRESÍAS ACTIVAS
-- =============================================

SELECT COUNT(*) AS membresias_activas
FROM membresias
WHERE estado = 'ACTIVA';


-- =============================================
-- CONSULTA 4: CONTAR MEMBRESÍAS VENCIDAS
-- =============================================

SELECT COUNT(*) AS membresias_vencidas
FROM membresias
WHERE estado = 'VENCIDA';

-- =============================================
-- CONSULTA 5: INGRESOS TOTALES DE GOLDEN GYM
-- =============================================

SELECT SUM(valor_pago) AS ingresos_totales
FROM membresias;


-- =============================================
-- CONSULTA 6: INGRESOS DE MEMBRESÍAS ACTIVAS
-- =============================================

SELECT SUM(valor_pago) AS ingresos_membresias_activas
FROM membresias
WHERE estado = 'ACTIVA';


-- =============================================
-- CONSULTA 7: INGRESOS POR PLAN
-- =============================================

SELECT 
    p.nombre_plan,
    COUNT(m.id_membresia) AS total_membresias,
    SUM(m.valor_pago) AS ingresos_totales
FROM membresias AS m
INNER JOIN planes AS p
    ON m.id_plan = p.id_plan
GROUP BY p.nombre_plan
ORDER BY ingresos_totales DESC;


-- =============================================
-- CONSULTA 8: PLAN MÁS VENDIDO
-- =============================================

SELECT 
    p.nombre_plan,
    COUNT(m.id_membresia) AS total_ventas
FROM membresias AS m
INNER JOIN planes AS p
    ON m.id_plan = p.id_plan
GROUP BY p.nombre_plan
ORDER BY total_ventas DESC
LIMIT 1;

-- =============================================
-- CONSULTA 9: VER CLIENTES CON SUS MEMBRESÍAS
-- =============================================

SELECT
    c.id_cliente,
    c.nombre,
    c.apellido,
    p.nombre_plan,
    m.fecha_inicio,
    m.fecha_fin,
    m.valor_pago,
    m.estado
FROM clientes AS c
INNER JOIN membresias AS m
    ON c.id_cliente = m.id_cliente
INNER JOIN planes AS p
    ON m.id_plan = p.id_plan
ORDER BY c.id_cliente;


-- =============================================
-- CONSULTA 10: CANTIDAD DE CLIENTES POR EDAD
-- =============================================

SELECT
    edad,
    COUNT(*) AS cantidad_clientes
FROM clientes
GROUP BY edad
ORDER BY edad;


-- =============================================
-- CONSULTA 11: TOP 10 MEMBRESÍAS MÁS COSTOSAS
-- =============================================

SELECT
    c.nombre,
    c.apellido,
    p.nombre_plan,
    m.valor_pago,
    m.estado
FROM clientes AS c
INNER JOIN membresias AS m
    ON c.id_cliente = m.id_cliente
INNER JOIN planes AS p
    ON m.id_plan = p.id_plan
ORDER BY m.valor_pago DESC
LIMIT 10;


-- =============================================
-- CONSULTA 12: CANTIDAD DE CLIENTES POR PLAN
-- =============================================

SELECT
    p.nombre_plan,
    COUNT(m.id_cliente) AS cantidad_clientes
FROM planes AS p
INNER JOIN membresias AS m
    ON p.id_plan = m.id_plan
GROUP BY p.nombre_plan
ORDER BY cantidad_clientes DESC;

-- =============================================
-- CONSULTA 13: PROMEDIO DE EDAD DE LOS CLIENTES
-- =============================================

SELECT
    ROUND(AVG(edad), 2) AS promedio_edad
FROM clientes;


-- =============================================
-- CONSULTA 14: CLIENTE MÁS JOVEN Y MÁS ADULTO
-- =============================================

SELECT
    'Cliente más joven' AS categoria,
    nombre,
    apellido,
    edad
FROM clientes
WHERE edad = (SELECT MIN(edad) FROM clientes)

UNION ALL

SELECT
    'Cliente más adulto' AS categoria,
    nombre,
    apellido,
    edad
FROM clientes
WHERE edad = (SELECT MAX(edad) FROM clientes);


-- =============================================
-- CONSULTA 15: INGRESOS POR ESTADO DE MEMBRESÍA
-- =============================================

SELECT
    estado,
    COUNT(*) AS total_membresias,
    SUM(valor_pago) AS ingresos
FROM membresias
GROUP BY estado
ORDER BY ingresos DESC;


-- =============================================
-- CONSULTA 16: CLIENTES CON MEMBRESÍAS ACTIVAS
-- =============================================

SELECT
    c.id_cliente,
    c.nombre,
    c.apellido,
    p.nombre_plan,
    m.fecha_inicio,
    m.fecha_fin,
    m.valor_pago
FROM clientes AS c
INNER JOIN membresias AS m
    ON c.id_cliente = m.id_cliente
INNER JOIN planes AS p
    ON m.id_plan = p.id_plan
WHERE m.estado = 'ACTIVA'
ORDER BY m.valor_pago DESC;