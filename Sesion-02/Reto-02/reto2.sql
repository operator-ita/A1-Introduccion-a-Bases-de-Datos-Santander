# Reto 02 
USE tienda;
SHOW TABLES; 
DESCRIBE empleado; 
DESCRIBE articulo;
describe puesto; 
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
