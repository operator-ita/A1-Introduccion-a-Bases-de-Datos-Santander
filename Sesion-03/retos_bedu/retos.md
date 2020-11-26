# Retos Sesion 3

## Reto 1: Subconsultas

Usando `tienda`  contesta:

- ¿Cuál es el nombre de los empleados cuyo sueldo es mayor a $100,000?

  ```
  SELECT nombre, apellido_paterno
  FROM empleado
  WHERE id_puesto IN
   (SELECT id_puesto
        FROM puesto
        WHERE salario > 100000);

  ```

  ​

- ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?

  ```
  SELECT id_empleado, min(total_ventas), max(total_ventas)
  FROM
   (SELECT clave, id_empleado, count(*) total_ventas
        FROM venta
        GROUP BY clave, id_empleado) AS sq
  GROUP BY id_empleado;
  ```

  ​

- ¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?

```
SELECT clave, id_articulo FROM venta
 WHERE id_articulo IN (
 SELECT id_articulo FROM
 articulo WHERE precio > 5000);

```

## Reto 2: Joins

- ¿Cuál es el nombre de los empleados que realizaron cada venta?

  ```mysql
  SELECT clave, nombre, apellido_paterno
  FROM venta AS v
  JOIN empleado AS e
    ON v.id_empleado = e.id_empleado
  ORDER BY clave;
  ```

- ¿Cuál es el nombre de los artículos que se han vendido?

  ```mysql
  SELECT clave, nombre
  FROM venta AS v
  JOIN articulo AS a
    ON v.id_articulo = a.id_articulo
  ORDER BY clave
  ```

- ¿Cuál es el total de cada venta?

```mysql
SELECT clave, round(sum(precio),2) AS total
FROM venta AS v
JOIN articulo AS a
  ON v.id_articulo = a.id_articulo
GROUP BY clave
ORDER BY clave;
```

##  Reto 3: Views

  Usando `tienda`  contesta:

- Obtener el puesto de un empleado.

  ```
  CREATE VIEW puestos_por_empleado AS
  SELECT concat(emp.nombre, ' ', emp.apellido_paterno), p.nombre
  FROM empleado emp
  JOIN puesto p
    ON emp.id_puesto = p.id_puesto;
  ```

- Relacionando datos de emplado con ventas en una vista 

  ```
  CREATE VIEW ventas_por_empleado AS
  SELECT v.clave, concat(emp.nombre, ' ', emp.apellido_paterno) nombre, a.nombre articulo
  FROM venta v
  JOIN empleado emp
    ON v.id_empleado = emp.id_empleado
  JOIN articulo a
    ON v.id_articulo = a.id_articulo
  ORDER BY v.clave;
  ```

- Saber qué puesto ha tenido más ventas.

```
SELECT *
FROM ventas_por_empleado
ORDER BY total DESC
LIMIT 1;
```

* Saber qué artículos ha vendido cada empleado.

  ```
  SELECT *
  FROM  empleado_articulo;
  ```

  ​