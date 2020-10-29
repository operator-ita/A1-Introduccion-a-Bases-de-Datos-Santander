# Reto 3
USE tienda; 
describe puesto;

# ¿Cuántos registros hay por cada uno de los puestos?
SELECT nombre, count(*) as total FROM puesto group by nombre;

# ¿Cuánto dinero se paga en total por puesto?
SELECT nombre, sum(salario) as total_salario FROM puesto group by nombre;

# ¿Cuál es el número total de ventas por vendedor?
SELECT id_empleado, count(*) as total_ventas FROM venta group by id_empleado;

# ¿Cuál es el número total de ventas por artículo?
SELECT id_articulo, count(*) as total_ventas FROM venta group by id_articulo; 