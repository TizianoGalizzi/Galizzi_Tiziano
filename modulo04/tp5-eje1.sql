
-- En este Archivo.sql se encuentran todas las consultas realizadas del TP-05.
-- 1) Lista el apellido de todos los empleados.
SELECT apellido FROM empleados;
-- 2) Lista el apellido de los empleados eliminando los apellidos que estén repetidos.
SELECT  idemplaedo, nombre, apellido FROM empleados GROUP BY apellido;
-- 3) Lista todas las columnas de la tabla empleados.
SELECT * FROM empleados;
-- 4) Lista el nombre y apellido de todos los empleados.
SELECT nombre, apellido FROM empleados;
-- 5) Lista el cuit/cuil de los departamentos de los empleados que aparecen en la tabla empleados.
SELECT cuil_cuit FROM empleados;
-- 6) Lista el nombre y apellido de los empleados en una única columna.
SELECT concat_ws(' ', nombre, apellido) AS Empleado FROM empleados;
-- 7) Lista el nombre y apellido de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula
SELECT UCASE((concat_ws(' ', nombre, apellido) )) as Empleado FROM empleados;
-- 8) Lista el nombre y apellido de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
SELECT LCASE((concat_ws(' ', nombre, apellido) )) as Empleado FROM empleados;
-- 9) Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
SELECT nombre, presupuesto FROM departamentos ORDER BY presupuesto ASC;
-- 10) Lista el nombre de todos los departamentos ordenados de forma ascendente.
SELECT nombre as departamento FROM departamentos ORDER BY departamento ASC;
-- 11) Lista el nombre de todos los departamentos ordenados de forma descendente.
SELECT nombre as departamento FROM departamentos ORDER BY departamento DESC;
-- 12) Lista el apellido y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta en primer lugar su apellido y luego su nombre.
SELECT apellido, nombre FROM empleados ORDER BY apellido ASC, nombre ASC;
-- 13) Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
SELECT nombre AS nombre_departamento, presupuesto FROM departamentos ORDER BY presupuesto DESC LIMIT 3;
-- 14) Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
SELECT nombre AS nombre_departamento, presupuesto FROM departamentos ORDER BY presupuesto ASC LIMIT 3;
-- 15) Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a $150000.
SELECT nombre AS nombre_departamento, presupuesto FROM departamentos WHERE presupuesto >= 150000;
-- 16) Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto entre $100000 y $200000. Sin utilizar el operador BETWEEN.
SELECT nombre AS nombre_departamento, presupuesto FROM departamentos WHERE (presupuesto >= 150000 AND presupuesto <= 200000);
-- 17) Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre $100000 y $200000. Sin utilizar el operador BETWEEN.
SELECT nombre AS nombre_departamento, presupuesto FROM departamentos WHERE NOT (presupuesto >= 150000 AND presupuesto <= 200000);
-- 18) Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre $100000 y $200000. Utilizando el operador BETWEEN.
SELECT nombre AS nombre_departamento, presupuesto FROM departamentos WHERE presupuesto BETWEEN 100000 AND 200000;
-- 19) Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre $100000 y $200000. Utilizando el operador BETWEEN.
SELECT nombre AS nombre_departamento, presupuesto FROM departamentos WHERE NOT presupuesto BETWEEN 100000 AND 200000;
-- 20) Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
SELECT concat_ws(' ', e.nombre, e.apellido)AS empleado, d.nombre AS nombre_departamento, d.presupuesto FROM empleados AS e INNER JOIN departamentos AS d ON e.id_departamento = d.iddepartamento;
-- 21) Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. Ordena el resultado, en primer lugar por el nombre del departamento (en orden alfabético) y en segundo lugar por apellido y el nombre de los empleados.
SELECT concat_ws(' ', e.nombre, e.apellido)AS empleado, d.nombre AS nombre_departamento, d.presupuesto 
FROM empleados AS e INNER JOIN departamentos AS d ON e.id_departamento = d.iddepartamento
ORDER BY nombre_departamento, e.apellido, e.nombre ASC;
-- 22) Devuelve un listado con el código y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.
SELECT d.iddepartamento, d.nombre AS departamento FROM departamentos AS d INNER JOIN empleados AS e ON d.iddepartamento = e.id_departamento;
-- 23) Devuelve el nombre del departamento donde trabaja el empleado que tiene el cuit 27-38382980-3.
SELECT d.nombre AS nombre_departamento, concat_ws(' ', e.nombre, e.apellido) AS empleado, e.cuil_cuit 
FROM departamentos AS d INNER JOIN empleados AS e ON d.iddepartamento = e.id_departamento
WHERE e.cuil_cuit LIKE '%27-38382980-3%';
-- 24) Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz.
SELECT d.nombre AS nombre_departamento, concat_ws(' ', e.nombre, e.apellido) AS empleado 
FROM departamentos AS d INNER JOIN empleados AS e ON d.iddepartamento = e.id_departamento
WHERE e.nombre LIKE '%pepe%';
-- 25) Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.
SELECT concat_ws(' ', e.nombre, e.apellido) AS empleado, e.cuil_cuit, d.nombre AS nombre_departamento
FROM empleados AS e INNER JOIN departamentos AS d ON e.id_departamento = d.iddepartamento 
WHERE d.nombre LIKE '%I+D%' ORDER BY empleado ASC;
-- 26) Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.
SELECT concat_ws(' ', e.nombre, e.apellido) AS empleado, e.cuil_cuit, d.nombre AS nombre_departamento
FROM empleados AS e INNER JOIN departamentos AS d ON e.id_departamento = d.iddepartamento 
WHERE (d.nombre LIKE '%Sistemas%' OR
		d.nombre LIKE '%Contabilidad%' OR 
        d.nombre LIKE '%I+D%')
 ORDER BY empleado ASC;
-- 27) Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre $100000 y $200000.
SELECT concat_ws(' ', e.nombre, e.apellido) AS empleado, d.nombre AS nombre_departamento, d.presupuesto
FROM empleados AS e INNER JOIN departamentos AS d ON e.id_departamento = d.iddepartamento 
WHERE NOT presupuesto BETWEEN 100000 AND 200000;
SELECT * FROM departamentos;
SELECT * FROM empleados;