# SESION 3

# -- RETO 0 ---------------------------------------------------------  
# Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.
# 1. Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?
select e.nombre, e.apellido_paterno, e.apellido_materno from empleado as e 
WHERE e.id_puesto in (
SELECT p.id_puesto FROM puesto as p where p.salario < 10000
);

# 2. ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
SELECT id_empleado, min(total_ventas), max(total_ventas)
FROM
 (SELECT clave, id_empleado, count(*) total_ventas
      FROM venta
      GROUP BY clave, id_empleado) AS sq
GROUP BY id_empleado;

# 3. ¿Cuál es el nombre del puesto de cada empleado?
SELECT e.nombre, e.apellido_paterno, (SELECT p.nombre FROM puesto AS p where p.id_puesto=e.id_puesto) 
FROM empleado as e;

# -- RETO 1 ---------------------------------------------------------  
# Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.
# 1. ¿Cuál es el nombre de los empleados que realizaron cada venta?
SELECT v.clave, e.nombre, e.apellido_paterno
FROM venta as v
JOIN empleado as e
ON v.id_venta = e.id_empleado
ORDER BY clave; 
 
# 2. ¿Cuál es el nombre de los artículos que se han vendido?
select v.clave, a.nombre 
FROM venta as v
JOIN articulo as a
ON v.id_venta = a.id_articulo 
order by a.nombre;

#3. ¿Cuál es el total de cada venta?
SELECT v.clave, SUM(a.precio) AS total_venta
FROM venta as v
JOIN articulo as a 
ON v.id_articulo = a.id_articulo
GROUP BY v.clave; 


# -- RETO 2 ---------------------------------------------------------  
# Usando la base de datos tienda, define las siguientes vistas que permitan obtener la siguiente información.
# 1. Obtener el puesto de un empleado.
CREATE VIEW puestos_157 AS
SELECT concat(e.nombre, ' ', e.apellido_paterno, ' ', e.apellido_materno) AS nombre_empleado, p.nombre
FROM empleado as e 
JOIN puesto as p
ON p.id_puesto = e.id_puesto; 

# 2. Saber qué artículos ha vendido cada empleado.
SELECT e.nombre, e.apellido_paterno, a.nombre
FROM venta v 
JOIN empleado e
ON v.id_empleado =  e.id_empleado 
JOIN articulo as a 
ON v.id_articulo = a.id_articulo
ORDER BY e.id_empleado;

# 3. Saber qué puesto ha tenido más ventas.
SELECT p.nombre, count(v.clave) as ventas_por_puesto
FROM venta  v 
JOIN empleado e
ON e.id_empleado=v.id_empleado 
JOIN puesto  p
ON p.id_puesto = e.id_empleado 
GROUP BY p.nombre 
ORDER BY ventas_por_puesto DESC;
