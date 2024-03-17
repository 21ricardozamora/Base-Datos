-- Completa aquello que falte
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre_cliente VARCHAR(100),
    ciudad_cliente VARCHAR(100)
);

CREATE TABLE ordenes (
    id_orden INT PRIMARY KEY,
    id_cliente INT,
    fecha_orden DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    precio_producto DECIMAL(10, 2)
);

CREATE TABLE detalles_ordenes (
    id_detalle INT PRIMARY KEY,
    id_orden INT,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_orden) REFERENCES ordenes(id_orden),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

INSERT INTO clientes (id_cliente, nombre_cliente, ciudad_cliente) VALUES
(1, 'Juan', 'Ciudad A'),
(2, 'María', 'Ciudad B'),
(3, 'Pedro', 'Ciudad C');

INSERT INTO ordenes (id_orden, id_cliente, fecha_orden) VALUES
(1, 1, '2024-03-01'),
(2, 2, '2024-03-02'),
(3, 3, '2024-03-03');

INSERT INTO productos (id_producto, nombre_producto, precio_producto) VALUES
(1, 'Producto A', 50.00),
(2, 'Producto B', 75.00),
(3, 'Producto C', 100.00);

INSERT INTO detalles_ordenes (id_detalle, id_orden, id_producto, cantidad) VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 3);

--Realiza las siguientes consultas:

--  Mostrar todos los clientes.
mysql> select * from clientes;
+------------+----------------+----------------+
| id_cliente | nombre_cliente | ciudad_cliente |
+------------+----------------+----------------+
|          1 | Juan           | Ciudad A       |
|          2 | María          | Ciudad B       |
|          3 | Pedro          | Ciudad C       |
+------------+----------------+----------------+
--    Mostrar todas las órdenes.
mysql> select * from ordenes;
+----------+------------+-------------+
| id_orden | id_cliente | fecha_orden |
+----------+------------+-------------+
|        1 |          1 | 2024-03-01  |
|        2 |          2 | 2024-03-02  |
|        3 |          3 | 2024-03-03  |
+----------+------------+-------------+

--    Mostrar todos los productos.
mysql> select * from productos;
+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           1 | Producto A      |           50.00 |
|           2 | Producto B      |           75.00 |
|           3 | Producto C      |          100.00 |
+-------------+---a--------------+-----------------+

--    Mostrar todos los detalles de las órdenes.
mysql> select * from detalles_ordenes;
+------------+----------+-------------+----------+
| id_detalle | id_orden | id_producto | cantidad |
+------------+----------+-------------+----------+
|          1 |        1 |           1 |        2 |
|          2 |        2 |           2 |        1 |
|          3 |        3 |           3 |        3 |
+------------+----------+-------------+----------+

--    Mostrar los primeros 5 clientes ordenados por nombre.
mysql> select cl.nombre_cliente as name from clientes as cl order by cl.nombre_cliente limit 5;
+--------+
| name   |
+--------+
| Juan   |
| María  |
| Pedro  |
+--------+

--    Mostrar los productos con un precio mayor a 50.
mysql> select * from productos as pro where pro.precio_producto > 50;
+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           2 | Producto B      |           75.00 |
|           3 | Producto C      |          100.00 |
+-------------+-----------------+-----------------+

--    Mostrar todas las órdenes realizadas por el cliente con ID 1.
mysql> select * from ordenes as ord join clientes as cl on ord.id_cliente = cl.id_cliente and cl.id_cliente = 1;
+----------+------------+-------------+------------+----------------+----------------+
| id_orden | id_cliente | fecha_orden | id_cliente | nombre_cliente | ciudad_cliente |
+----------+------------+-------------+------------+----------------+----------------+
|        1 |          1 | 2024-03-01  |          1 | Juan           | Ciudad A       |
+----------+------------+-------------+------------+----------------+----------------+

--    Mostrar los clientes cuyos nombres comienzan con la letra "A".
mysql> select * from clientes as cl where cl.nombre_cliente regexp '^A';

--    Mostrar las órdenes que contienen más de 2 productos.^
ysql> select * from detalles_ordenes as dor right join productos as pro on dor.id_producto = pro.id_producto where dor.cantidad > 2;
+------------+----------+-------------+----------+-------------+-----------------+-----------------+
| id_detalle | id_orden | id_producto | cantidad | id_producto | nombre_producto | precio_producto |
+------------+----------+-------------+----------+-------------+-----------------+-----------------+
|          3 |        3 |           3 |        3 |           3 | Producto C      |          100.00 |
+------------+----------+-------------+----------+-------------+-----------------+-----------------+

--    Mostrar los productos ordenados por precio de forma descendente.
mysql> select * from productos as pro order by pro.precio_producto desc;
+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           3 | Producto C      |          100.00 |
|           2 | Producto B      |           75.00 |
|           1 | Producto A      |           50.00 |
+-------------+-----------------+-----------------+

--    Seleccionar todos los clientes y sus órdenes, incluso si no tienen órdenes.
mysql> select * from  clientes as cl left join ordenes as ord on cl.id_cliente = ord.id_cliente;
+------------+----------------+----------------+----------+------------+-------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden |
+------------+----------------+----------------+----------+------------+-------------+
|          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |
|          2 | María          | Ciudad B       |        2 |          2 | 2024-03-02  |
|          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |
+------------+----------------+----------------+----------+------------+-------------+

--    Seleccionar todas las órdenes junto con los productos correspondientes.
mysql> select * from productos as pro left join detalles_ordenes as dor on pro.id_producto = dor.id_producto join ordenes as ord on dor.id_orden = ord.id_orden;
+-------------+-----------------+-----------------+------------+----------+-------------+----------+----------+------------+-------------+
| id_producto | nombre_producto | precio_producto | id_detalle | id_orden | id_producto | cantidad | id_orden | id_cliente | fecha_orden |
+-------------+-----------------+-----------------+------------+----------+-------------+----------+----------+------------+-------------+
|           1 | Producto A      |           50.00 |          1 |        1 |           1 |        2 |        1 |          1 | 2024-03-01  |
|           2 | Producto B      |           75.00 |          2 |        2 |           2 |        1 |        2 |          2 | 2024-03-02  |
|           3 | Producto C      |          100.00 |          3 |        3 |           3 |        3 |        3 |          3 | 2024-03-03  |
+-------------+-----------------+-----------------+------------+----------+-------------+----------+----------+------------+-------------+

--    Mostrar el nombre de los clientes que han realizado órdenes de productos que cuestan más de 50.
pro.precio_producto > 50;
+--------+------+-----------------+-----------------+
| name   | id   | nombre_producto | precio_producto |
+--------+------+-----------------+-----------------+
| María  |    2 | Producto B      |           75.00 |
| Pedro  |    3 | Producto C      |          100.00 |
+--------+------+-----------------+-----------------+

--    Obtener el nombre de los productos que no se han ordenado aún.
mysql> select pro.nombre_producto as name_producto from productos as pro where pro.id_producto not in (select pro1.id_producto from productos  as pro1 left join detalles_ordenes as dor on pro1.id_producto = dor.id_producto  join ordenes as ord on dor.id_orden = ord.id_orden);

--    Mostrar el nombre del cliente, el producto y la cantidad para todas las órdenes.
mysql> select cl.nombre_cliente as name_cliente, pro.nombre_producto as name_producto, dor.cantidad as cantidad from clientes as cl right join ordenes as ord
on cl.id_cliente = ord.id_cliente right join detalles_ordenes as dor on dor.id_orden = ord.id_orden right join productos as pro on dor.id_producto = pro.id_producto;
+--------------+---------------+----------+
| name_cliente | name_producto | cantidad |
+--------------+---------------+----------+
| Juan         | Producto A    |        2 |
| María        | Producto B    |        1 |
| Pedro        | Producto C    |        3 |
+--------------+---------------+----------+

--    Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos.
mysql> select cl.nombre_cliente as name_cliente, pro.nombre_producto as name_producto, ord.id_orden as id, dor.cantidad as cantidad from clientes as cl right
join ordenes as ord on cl.id_cliente = ord.id_cliente right join detalles_ordenes as dor on dor.id_orden = ord.id_orden right join productos as pro on dor.id_producto = pro.id_producto;
+--------------+---------------+------+----------+
| name_cliente | name_producto | id   | cantidad |
+--------------+---------------+------+----------+
| Juan         | Producto A    |    1 |        2 |
| María        | Producto B    |    2 |        1 |
| Pedro        | Producto C    |    3 |        3 |
+--------------+---------------+------+----------+

--    Mostrar todas las órdenes con sus clientes y productos, incluso si no hay órdenes.
mysql> select * from ordenes as ord left join clientes as cl on ord.id_cliente = cl.id_cliente left join detalles_ordenes as dor on ord.id_orden = dor.id_orden left join productos as pro on dor.id_producto = pro.id_producto;
+----------+------------+-------------+------------+----------------+----------------+------------+----------+-------------+----------+-------------+-----------------+-----------------+
| id_orden | id_cliente | fecha_orden | id_cliente | nombre_cliente | ciudad_cliente | id_detalle | id_orden | id_producto | cantidad | id_producto | nombre_producto | precio_producto |
+----------+------------+-------------+------------+----------------+----------------+------------+----------+-------------+----------+-------------+-----------------+-----------------+
|        1 |          1 | 2024-03-01  |          1 | Juan           | Ciudad A       |          1 |        1 |           1 |        2 |           1 | Producto A      |           50.00 |
|        2 |          2 | 2024-03-02  |          2 | María          | Ciudad B       |          2 |        2 |           2 |        1 |           2 | Producto B      |           75.00 |
|        3 |          3 | 2024-03-03  |          3 | Pedro          | Ciudad C       |          3 |        3 |           3 |        3 |           3 | Producto C      |          100.00 |
+----------+------------+-------------+------------+----------------+----------------+------------+----------+-------------+----------+-------------+-----------------+-----------------+

--    Obtener el nombre de los clientes junto con el número total de órdenes que han realizado.
mysql> select cl.nombre_cliente as name, dor.cantidad as cantidad from clientes as cl right join ordenes as ord on cl.id_Cliente = ord.id_cliente right join detalles_ordenes as dor on ord.id_orden = dor.id_orden;
+--------+----------+
| name   | cantidad |
+--------+----------+
| Juan   |        2 |
| María  |        1 |
| Pedro  |        3 |
+--------+----------+

--    Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto.
mysql> select cl.nombre_cliente as name_cliente, pro.nombre_producto as name_producto, dor.cantidad as cantidad from clientes as cl right join ordenes as ord
on cl.id_cliente = ord.id_cliente right join detalles_ordenes as dor on dor.id_orden = ord.id_orden right join productos as pro on dor.id_producto = pro.id_producto;
+--------------+---------------+----------+
| name_cliente | name_producto | cantidad |
+--------------+---------------+----------+
| Juan         | Producto A    |        2 |
| María        | Producto B    |        1 |
| Pedro        | Producto C    |        3 |
+--------------+---------------+----------+

--   Mostrar todas las órdenes con sus productos y clientes, incluso si no hay información de cliente.
mysql> select * from ordenes as ord right join clientes as cl on ord.id_cliente = cl.id_cliente right join detalles_ordenes as dor on ord.id_orden = dor.id_or
den right join productos as pro on dor.id_producto = pro.id_producto;
+----------+------------+-------------+------------+----------------+----------------+------------+----------+-------------+----------+-------------+-----------------+-----------------+
| id_orden | id_cliente | fecha_orden | id_cliente | nombre_cliente | ciudad_cliente | id_detalle | id_orden | id_producto | cantidad | id_producto | nombre_producto | precio_producto |
+----------+------------+-------------+------------+----------------+----------------+------------+----------+-------------+----------+-------------+-----------------+-----------------+
|        1 |          1 | 2024-03-01  |          1 | Juan           | Ciudad A       |          1 |        1 |           1 |        2 |           1 | Producto A      |           50.00 |
|        2 |          2 | 2024-03-02  |          2 | María          | Ciudad B       |          2 |        2 |           2 |        1 |           2 | Producto B      |           75.00 |
|        3 |          3 | 2024-03-03  |          3 | Pedro          | Ciudad C       |          3 |        3 |           3 |        3 |           3 | Producto C      |          100.00 |
+----------+------------+-------------+------------+----------------+----------------+------------+----------+-------------+----------+-------------+-----------------+-----------------+

--    Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos, incluyendo los productos que no han sido ordenados.
mysql> select dor.cantidad as cantidad, pro.nombre_producto as name_producto, cl.nombre_cliente as name_cliente from productos as pro left join detalles_orden
es as dor on pro.id_producto = dor.id_producto left join ordenes as ord on dor.id_orden = ord.id_orden left join clientes as cl on ord.id_cliente = cl.id_clie
nte;
+----------+---------------+--------------+
| cantidad | name_producto | name_cliente |
+----------+---------------+--------------+
|        2 | Producto A    | Juan         |
|        1 | Producto B    | María        |
|        3 | Producto C    | Pedro        |
+----------+---------------+--------------+

--    Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto, incluyendo las órdenes sin productos.
mysql> select ord.id_orden as id, dor.cantidad as cantidad, pro.nombre_producto as name_producto, cl.nombre_cliente as name_cliente from productos as pro left
 join detalle
cliente = cl.id_cliente;
+------+----------+---------------+--------------+
| id   | cantidad | name_producto | name_cliente |
+------+----------+---------------+--------------+
|    1 |        2 | Producto A    | Juan         |
|    2 |        1 | Producto B    | María        |
|    3 |        3 | Producto C    | Pedro        |
+------+----------+---------------+--------------+

--    Obtener el nombre de los clientes junto con el número total de órdenes que han realizado, incluyendo los clientes que no han realizado órdenes.
mysql> select cl.nombre_cliente as name, dor.cantidad as cantidad from clientes as cl left join ordenes as ord on cl.id_cliente = ord.id_cliente join detalles_ordenes as dor on ord.id_orden = dor.id_orden;
+--------+----------+
| name   | cantidad |
+--------+----------+
| Juan   |        2 |
| María  |        1 |
| Pedro  |        3 |
+--------+----------+

--    Mostrar todas las órdenes con sus clientes y productos, incluyendo las órdenes y productos que no tienen información.
--    Realizar un inner join entre clientes y órdenes.
mysql> select * from clientes as cl join ordenes as ord on cl.id_cliente = ord.id_cliente;
+------------+----------------+----------------+----------+------------+-------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden |
+------------+----------------+----------------+----------+------------+-------------+
|          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |
|          2 | María          | Ciudad B       |        2 |          2 | 2024-03-02  |
|          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |
+------------+----------------+----------------+----------+------------+-------------+

--    Realizar un left join entre órdenes y detalles de órdenes.
mysql> select * from ordenes as ord left join detalles_ordenes as dor on ord.id_orden = dor.id_orden;
+----------+------------+-------------+------------+----------+-------------+----------+
| id_orden | id_cliente | fecha_orden | id_detalle | id_orden | id_producto | cantidad |
+----------+------------+-------------+------------+----------+-------------+----------+
|        1 |          1 | 2024-03-01  |          1 |        1 |           1 |        2 |
|        2 |          2 | 2024-03-02  |          2 |        2 |           2 |        1 |
|        3 |          3 | 2024-03-03  |          3 |        3 |           3 |        3 |
+----------+------------+-------------+------------+----------+-------------+----------+

--    Realizar un right join entre productos y detalles de órdenes.
mysql> select * from productos as pro right join detalles_ordenes as dor on pro.id_producto = dor.id_producto;
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
| id_producto | nombre_producto | precio_producto | id_detalle | id_orden | id_producto | cantidad |
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
|           1 | Producto A      |           50.00 |          1 |        1 |           1 |        2 |
|           2 | Producto B      |           75.00 |          2 |        2 |           2 |        1 |
|           3 | Producto C      |          100.00 |          3 |        3 |           3 |        3 |
+-------------+-----------------+-----------------+------------+----------+-------------+----------+

--    Realizar un full join entre clientes y órdenes.
mysql> select * from clientes as cl left join ordenes as ord on cl.id_cliente = ord.id_cliente union select * from clientes as cl right join ordenes as ord on
 cl.id_cliente = ord.id_cliente where cl.id_cliente is null;
+------------+----------------+----------------+----------+------------+-------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden |
+------------+----------------+----------------+----------+------------+-------------+
|          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |
|          2 | María          | Ciudad B       |        2 |          2 | 2024-03-02  |
|          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |
+------------+----------------+----------------+----------+------------+-------------+

--    Realizar un full join entre órdenes y detalles de órdenes.
mysql> select * from ordenes as ord left join detalles_ordenes as dor on ord.id_orden = dor.id_orden union select * from ordenes as ord right join detalles_ordenes as dor on ord.id_orden = dor.id_orden where ord.id_orden is null;
+----------+------------+-------------+------------+----------+-------------+----------+
| id_orden | id_cliente | fecha_orden | id_detalle | id_orden | id_producto | cantidad |
+----------+------------+-------------+------------+----------+-------------+----------+
|        1 |          1 | 2024-03-01  |          1 |        1 |           1 |        2 |
|        2 |          2 | 2024-03-02  |          2 |        2 |           2 |        1 |
|        3 |          3 | 2024-03-03  |          3 |        3 |           3 |        3 |
+----------+------------+-------------+------------+----------+-------------+----------+

--    Realizar un full join entre productos y detalles de órdenes.
mysql> select * from productos as pro left join detalles_ordenes as dor on pro.id_producto = dor.id_producto union select * from productos as pro right join detalles_ordenes as dor on pro.id_producto = dor.id_producto where pro.id_producto is null;
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
| id_producto | nombre_producto | precio_producto | id_detalle | id_orden | id_producto | cantidad |
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
|           1 | Producto A      |           50.00 |          1 |        1 |           1 |        2 |
|           2 | Producto B      |           75.00 |          2 |        2 |           2 |        1 |
|           3 | Producto C      |          100.00 |          3 |        3 |           3 |        3 |
+-------------+-----------------+-----------------+------------+----------+-------------+----------+

