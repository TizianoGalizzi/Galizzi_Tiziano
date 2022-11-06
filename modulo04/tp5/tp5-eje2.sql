-- 										CONSIGNAS RESUELTAS DEL EJERCICIO 2

-- 1) Devuelve un listado con todos los pedidos que se han realizado. 
-- Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
SELECT * FROM pedidos ORDER BY fecha DESC;

-- 2) Devuelve todos los datos de los dos pedidos de mayor valor.
SELECT * FROM pedidos ORDER BY cantidad DESC limit 2;

-- 3) Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. 
-- Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
SELECT DISTINCT id_cliente FROM pedidos;

-- 4) Devuelve un listado de todos los pedidos que se realizaron durante el año 2022, 
-- cuya cantidad total sea superior a $500.
SELECT * FROM pedidos WHERE (fecha LIKE '%2022%' AND cantidad > 500);

-- 5) Devuelve un listado con el nombre y apellido de los vendedores que tienen una comisión entre 0.05 y 0.11.
SELECT concat_ws(' ', nombre, apellido) AS vendedor, comisión FROM vendedores WHERE comisión BETWEEN 0.05 AND 0.11;

-- 6) Devuelve el valor de la comisión de mayor valor que existe en la tabla vendedores.
SELECT concat_ws(' ', nombre, apellido) AS vendedor, max(comisión) FROM vendedores;

-- 7) Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo cuitcuil no es NULL. 
-- El listado deberá estar ordenado alfabéticamente por apellido y nombre.
SELECT id, nombre, apellido FROM clientes WHERE cuitcuil != 0 ORDER BY apellido, nombre ASC; -- Apellido con prioridad de orden alfabetico

-- 8) Devuelve un listado de los nombres de los clientes que empiezan por “A” y terminan por “n” y también los nombres que empiezan por “P”. 
-- El listado deberá estar ordenado alfabéticamente.
SELECT nombre FROM clientes WHERE 
(nombre LIKE 'A%' AND 
nombre LIKE '%n' OR
nombre LIKE 'P%') ORDER BY nombre ASC;

-- 9) Devuelve un listado de los nombres de los clientes que no empiezan por “A”. El listado deberá estar ordenado alfabéticamente.
SELECT nombre FROM clientes WHERE NOT (nombre LIKE 'A%') ORDER BY nombre ASC;

-- 10) Devuelve un listado con los nombres de los vendedores que terminan por “el” o “o”. Tenga en cuenta que se deberán eliminar los nombres repetidos. 
SELECT nombre AS nombre_vendedores FROM vendedores WHERE (nombre LIKE '%el' OR nombre LIKE '%o');

-- 11) Devuelve un listado con el identificador, nombre y apellido de todos los clientes que han realizado algún pedido. 
-- El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
SELECT DISTINCT c.id, c.nombre,c.apellido FROM pedidos AS p INNER JOIN clientes AS c ON p.id_cliente =c.id ORDER BY nombre, apellido ASC;

-- 12) Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. 
-- El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
SELECT  c.id, concat_ws(' ', c.nombre, c.apellido) AS cliente, c.cuitcuil, c.ciudad ,p.id, p.cantidad, p.fecha, p.id_vendedor FROM pedidos AS p 
INNER JOIN clientes AS c ON p.id_cliente = c.id 
ORDER BY c.nombre, c.apellido ASC;

-- 13) Devuelve un listado que muestre todos los pedidos en los que ha participado un vendedor. 
-- El resultado debe mostrar todos los datos de los pedidos y de los vendedores. El listado debe mostrar los datos de los vendedores  ordenados alfabéticamente.
SELECT p.id AS id_pedido, p.cantidad, p.fecha, p.id_cliente, concat_ws(' ', v.nombre, v.apellido ) AS vendedor, v.cuitcuil, v.comisión 
FROM pedidos AS p INNER JOIN vendedores AS v ON  p.id_vendedor = v.id ORDER BY v.nombre, v.apellido ASC;

-- 14) Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los vendedores asociados a cada pedido.
SELECT concat_ws(' ', c.nombre, c.apellido) AS cliente, p.id AS id_pedido, p.cantidad, p.fecha, concat_ws(' ', v.nombre, v.apellido ) AS vendedor, v.cuitcuil, v.comisión 
FROM pedidos AS p INNER JOIN vendedores AS v ON  p.id_vendedor = v.id INNER JOIN clientes AS c ON p.id_cliente = c.id ORDER BY v.nombre, v.apellido ASC;

-- 15) Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2022, cuyo monto esté entre $300  y $1000.
SELECT concat_ws(' ', c.nombre, c.apellido) AS cliente, p.id AS id_pedido ,p.fecha, p.cantidad FROM clientes AS c INNER JOIN pedidos AS p ON p.id_cliente = c.id WHERE fecha LIKE '2022%' AND cantidad between 300 AND 1000 ;

-- 16) Devuelve el nombre y apellido de todos los vendedores que han participado en algún pedido realizado por María Santana.
SELECT concat_ws(' ', c.nombre, c.apellido) AS cliente, concat_ws(' ', v.nombre, v.apellido) AS vendedor FROM pedidos AS p 
INNER JOIN vendedores AS v ON p.id_vendedor = v.id 
INNER JOIN clientes AS c ON p.id_cliente = c.id
WHERE (c.nombre = 'Maria' AND c.apellido = 'Santana')
;

-- 17) Devuelve el nombre de todos los clientes que han realizado algún pedido con el vendedor Daniel Sáez.
SELECT c.nombre AS cliente, concat_ws(' ', v.nombre, v.apellido) AS vendedor FROM pedidos AS p 
INNER JOIN vendedores AS v ON p.id_vendedor = v.id 
INNER JOIN clientes AS c ON p.id_cliente = c.id
WHERE (v.nombre = 'Daniel' AND v.apellido = 'Sáez');

-- 18) Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. 
-- Este listado también debe incluir los clientes que no han realizado ningún pedido. 
-- El listado debe estar ordenado alfabéticamente por el apellido y nombre de los clientes.
SELECT concat_ws(' ', c.nombre, c.apellido) AS cliente, p.id AS id_pedido, p.fecha, p.cantidad, p.id_vendedor  FROM pedidos AS p 
INNER JOIN vendedores AS v ON p.id_vendedor = v.id 
RIGHT JOIN clientes AS c ON p.id_cliente = c.id
ORDER BY c.nombre, c.apellido ASC;

-- 19) Devuelve un listado con todos los vendedores junto con los datos de los pedidos que han realizado. 
-- Este listado también debe incluir los vendedores que no han realizado ningún pedido. 
-- El listado debe estar ordenado alfabéticamente por el apellido y nombre de los vendedores.
SELECT concat_ws(' ', v.nombre, v.apellido) AS vendedor, p.id AS id_pedido, p.fecha, p.cantidad, p.id_cliente FROM pedidos AS p
RIGHT JOIN vendedores AS v ON p.id_vendedor = v.id
ORDER BY v.nombre, v.apellido ASC;

-- 20) Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
SELECT concat_ws(' ', c.nombre, c.apellido) AS cliente, p.id AS id_pedido FROM pedidos AS p 
RIGHT JOIN clientes AS c ON c.id = p.id_cliente WHERE p.id IS NULL;

-- 21) Devuelve un listado que solamente muestre los vendedores que no han realizado ningún pedido.
SELECT concat_ws(' ', v.nombre, v.apellido) AS vendedor, p.id AS id_pedido FROM pedidos AS p 
RIGHT JOIN vendedores AS v ON v.id = p.id_vendedor WHERE p.id IS NULL;

-- 22) Devuelve un listado con los clientes que no han realizado ningún pedido y de los vendedores que no han participado en ningún pedido. 
-- Ordene el listado alfabéticamente por el apellido y el nombre. 
-- En el listado deberá diferenciar de algún modo los clientes y los vendedores.
SELECT concat_ws(' ', c.nombre, c.apellido) AS cliente ,concat_ws(' ', v.nombre, v.apellido) AS vendedor, p.id AS id_pedido FROM pedidos AS p 
RIGHT JOIN vendedores AS v ON p.id_vendedor = v.id
RIGHT JOIN clientes AS c ON p.id_cliente = c.id WHERE p.id IS NULL; 

-- 23) Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
SELECT sum(cantidad) AS cantidad_total FROM pedidos AS p;

-- 24) Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
SELECT avg(cantidad) AS cantidad_promedio FROM pedidos AS p;

-- 25) Calcula el número total de vendedores distintos que aparecen en la tabla pedido
SELECT  count(DISTINCT id_vendedor) AS num_total_vendedores FROM pedidos  ;

-- 26) Calcula el número total de clientes que aparecen en la tabla cliente.
SELECT count(nombre) AS total_clientes FROM clientes;

-- 27) Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
SELECT  max(cantidad) AS mayor_cantidad FROM pedidos AS p ;

-- 28) Calcula cuál es la menor cantidad que aparece en la tabla pedido.
SELECT  min(cantidad) AS menor_cantidad FROM pedidos AS p ;

-- 29) Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
SELECT  max(categoría) AS valor_maximo_categoria FROM clientes AS c;

-- 30) Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. 
-- Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. 
-- Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. 
-- Muestra el identificador del cliente, nombre, apellido, la fecha y el valor de la cantidad.
SELECT c.id AS id_cliente ,c.nombre, c.apellido , p.id AS id_pedido, p.fecha, max(p.cantidad) AS cantidad FROM pedidos AS p
INNER JOIN clientes AS c ON p.id_cliente = c.id WHERE fecha = '2022-10-05' AND p.id_cliente =  2 AND cantidad > 2000; -- con estas 2 condiciones, especificamos el dia de realizacion del pedido y que cliente lo hizo. Para que nos devuelva unicamente la mayor compra en ese dia, por ese cliente.

-- 31) Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, 
-- teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de $2000 .
SELECT c.id AS id_cliente ,c.nombre, c.apellido , p.id AS id_pedido, p.fecha, max(p.cantidad) AS cantidad FROM pedidos AS p
INNER JOIN clientes AS c ON p.id_cliente = c.id GROUP BY id_cliente ;

-- 32) Calcula el máximo valor de los pedidos realizados para cada uno de los vendedores durante la fecha 2021-08-17. Muestra el identificador del vendedor, nombre, apellido y total.
SELECT v.id AS id_vendedor, v.nombre, v.apellido , p.id AS id_pedido, p.fecha, max(p.cantidad) AS total FROM pedidos AS p
INNER JOIN vendedores AS v ON p.id_vendedor = v.id WHERE fecha = '2021-08-17' GROUP BY id_vendedor;

-- 33) Devuelve un listado con el identificador de cliente, nombre y apellido y el número total de pedidos que ha realizado cada uno de los clientes. 
-- Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. 
-- Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.
SELECT c.id AS id_cliente, c.nombre, c.apellido, count(p.id_cliente)AS cantidad_pedidos FROM pedidos AS p 
RIGHT JOIN clientes AS c ON p.id_cliente = c.id GROUP BY p.id_cliente;

-- 34) Devuelve un listado con el identificador de cliente, nombre, apellido y el número total de pedidos que ha realizado cada uno de clientes durante el año 2020.
SELECT c.id AS id_cliente, c.nombre, c.apellido, count(p.id_cliente)AS cantidad_pedidos FROM pedidos AS p 
RIGHT JOIN clientes AS c ON p.id_cliente = c.id WHERE fecha LIKE '2020%' GROUP BY p.id_cliente;

-- 35) Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
SELECT p.fecha ,max(p.cantidad) AS mayor_pedido FROM pedidos AS p GROUP BY fecha ;

-- 36) Devuelve el número total de pedidos que se han realizado cada año.
SELECT count(p.id) AS total_pedidos, p.fecha FROM pedidos  AS p  GROUP BY fecha ;

-- 37) Devuelve un listado con todos los pedidos que ha realizado Adela Salas. (Sin utilizar INNER JOIN).
SELECT p.id AS id_pedido, p.fecha, p.cantidad, concat_ws(' ', v.nombre, v.apellido) AS vendedor , concat_ws(' ', c.nombre, c.apellido) AS cliente FROM pedidos AS p 
RIGHT JOIN clientes AS c ON p.id_cliente = c.id 
RIGHT JOIN vendedores AS v ON p.id_vendedor = v.id
WHERE c.nombre LIKE 'Adela' AND c.apellido LIKE 'Salas';

-- 38) Devuelve el número de pedidos en los que ha participado el vendedor Daniel Sáe. (Sin utilizar INNER JOIN)
SELECT count(p.id) AS cantidad_pedidos, concat_ws(' ', v.nombre, v.apellido) AS vendedor FROM pedidos AS p RIGHT JOIN vendedores AS v ON p.id_vendedor = v.id GROUP BY v.nombre HAVING v.nombre LIKE 'Daniel';

-- 39) Devuelve los datos del cliente que realizó el pedido más caro en el año 2020. (Sin utilizar INNER JOIN)
SELECT max(p.cantidad) AS mayor_cantidad, p.fecha ,c.id AS id_cliente, c.nombre, c.apellido, c.cuitcuil, c.ciudad, c.categoría FROM pedidos AS p LEFT JOIN clientes AS c ON p.id_cliente = c.id WHERE p.fecha LIKE '2020%';

-- 40) Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
SELECT p.fecha, p.cantidad, concat_ws(' ', c.nombre, c.apellido)AS cliente FROM pedidos AS p 
INNER JOIN clientes AS c ON p.id_cliente = c.id 
WHERE c.nombre LIKE 'Pepe%' AND c.apellido LIKE '%Ruíz%' 
ORDER BY cantidad DESC LIMIT 1;

-- 41) Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
SELECT p.id , concat_ws(' ', c.nombre, c.apellido)AS cliente FROM pedidos AS p 
RIGHT JOIN clientes AS c ON p.id_cliente = c.id 
WHERE COALESCE(p.id_cliente, '') IN ('') 
ORDER BY p.id ; 

-- 42)Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando IN o NOT IN).
SELECT DISTINCT p.id, concat_ws(' ', v.nombre, v.apellido)AS vendedor FROM pedidos AS p 
RIGHT JOIN vendedores AS v ON p.id_cliente = v.id 
WHERE COALESCE (p.id_vendedor, '') IN ('') 
ORDER BY p.id ; 

-- 43) Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT DISTINCT p.id, concat_ws(' ', c.nombre, c.apellido)AS cliente FROM pedidos AS p 
RIGHT JOIN clientes AS c ON p.id_cliente = c.id 
WHERE NOT EXISTS (SELECT * FROM clientes AS c WHERE p.id_cliente = c.id)
ORDER BY p.id ; 

-- 44) Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT DISTINCT p.id, concat_ws(' ', v.nombre, v.apellido)AS vendedor FROM pedidos AS p 
RIGHT JOIN vendedores AS v ON p.id_cliente = v.id 
WHERE NOT EXISTS (SELECT v.nombre FROM vendedores AS v WHERE p.id_vendedor = v.id)
ORDER BY p.id ; 

-- --------------------------------------------------------------------------------------------------------