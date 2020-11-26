# Retos Sesion 1 

## Reto 1: Estructura de una tabla

- Consulta la estructura de las tavlas en la base de datos `tienda`

```mysql
USE tienda;
SHOW TABLES; 
DESCRIBE puesto;
DESCRIBE articulo;
DESCRIBE empleado;
DESCRIBE venta;
```

## Reto 2: Estructura básica de una consulta

```
USE tienda; 
```

* ¿Cuál es el nombre de los empleados con el puesto 4?
```mysql
SELECT nombre 
FROM empleado
WHERE id_puesto = 4;
```
* ¿Qué puestos tienen un salario mayor a $10,000?
```mysql
SELECT nombre
FROM puesto
WHERE salario>10000;
```

* ¿Qué articulos tienen un precio mayor a $1,000 y un iva mayor a 100?
```mysql
SELECT nombre
FROM articulo
WHERE precio >1000 AND iva>100; 
```

* ¿Qué ventas incluyen los artículo 135 o 963 y fueron hechas por los empleados 835 o 369?
```mysql
SELECT id_venta
FROM venta
WHERE id_articulo IN (135,963)
AND id_empleado IN (835,369);
```

### Reto 3: Ordenamientos y Límites

Usando la base de datos tienda, escribe una consulta que permita obtener el top 5 de puestos por salarios.

```mysql
USE tienda; 
SELECT * 
FROM puesto
ORDER BY salario desc
LIMIT 5;
```




