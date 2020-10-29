# Usando la base de datos tienda, escribe una consulta que permita obtener el top 5 de puestos por salarios.

USE tienda; 
SELECT * 
FROM puesto
ORDER BY salario desc
LIMIT 5;