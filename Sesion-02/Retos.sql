# ----- RETO 1 ------------------------------------

# ¿Qué artículos incluyen la palabra Pasta en su nombre?
SELECT * FROM articulo WHERE nombre LIKE '%Pasta%'; 
# ¿Qué artículos incluyen la palabra Cannelloni en su nombre?
SELECT * FROM articulo WHERE nombre LIKE '%Cannelloni%'; 
# ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
SELECT * FROM articulo WHERE nombre LIKE '%-%'; 
# ¿Qué puestos incluyen la palabra Designer?
SELECT * FROM puesto WHERE nombre LIKE '%Designer%'; 
# ¿Qué puestos incluyen la palabra Developer?
SELECT * FROM puesto WHERE nombre LIKE '%Developer%'; 

# ----- RETO 2 ------------------------------------

# ¿Cuál es el promedio de salario de los puestos?
SELECT AVG(salario) FROM puesto;   
# ¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT count(*) FROM articulo WHERE nombre LIKE '%Pasta%';   
# ¿Cuál es el salario mínimo y máximo?
SELECT min(salario) as "Min",  max(salario) as "Max" FROM puesto;  
# ¿Cuál es la suma del salario de los últimos cinco puestos agregados? (Opción 1 - Para id_puesto de tipo int)
SELECT sum(salario) FROM puesto where id_puesto > (SELECT max(id_puesto) - 5 FROM puesto);
# ¿Cuál es la suma del salario de los últimos cinco puestos agregados? (Opción 2 - Para id_puesto de tipo char)
SELECT sum(salario) FROM (SELECT salario FROM puesto ORDER BY id_puesto DESC LIMIT 5) as lastfive;

# ----- RETO 3 ------------------------------------

# ¿Cuántos registros hay por cada uno de los puestos?
SELECT nombre, count(*) as total FROM puesto group by nombre;
# ¿Cuánto dinero se paga en total por puesto?
SELECT nombre, sum(salario) as total_salario FROM puesto group by nombre;
# ¿Cuál es el número total de ventas por vendedor?
SELECT id_empleado, count(*) as total_ventas FROM venta group by id_empleado;
# ¿Cuál es el número total de ventas por artículo?
SELECT id_articulo, count(*) as total_ventas FROM venta group by id_articulo; 