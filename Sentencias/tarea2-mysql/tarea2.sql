 use practica_joins;

CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT PRIMARY KEY AUTOINCREMENT,
    nombre varchar(20),
    direccion varchar (20)
);

INSERT INTO clientes (nombre, direccion) VALUES
    ('Cliente 1', 'Dirección 1'),
    ('Cliente 2', 'Dirección 2'),
    ('Cliente 3', 'Dirección 3'),
    ('Cliente 4', 'Dirección 4'),
    ('Cliente 5', 'Dirección 5'),
    ('Cliente 6', 'Dirección 6'),
    ('Cliente 7', 'Dirección 7'),
    ('Cliente 8', 'Dirección 8'),
    ('Cliente 9', 'Dirección 9'),
    ('Cliente 10', 'Dirección 10'),
    ('Cliente 11', 'Dirección 11'),
    ('Cliente 12', 'Dirección 12'),
    ('Cliente 13', 'Dirección 13'),
    ('Cliente 14', 'Dirección 14'),
    ('Cliente 15', 'Dirección 15'),
    ('Cliente 16', 'Dirección 16'),
    ('Cliente 17', 'Dirección 17'),
    ('Cliente 18', 'Dirección 18'),
    ('Cliente 19', 'Dirección 19'),
    ('Cliente 20', 'Dirección 20');

CREATE TABLE IF NOT EXISTS productos (
    id_producto INT PRIMARY KEY AUTOINCREMENT,
    nombre varchar(20),
    precio numeric(10,2)
);

INSERT INTO productos (nombre, precio) VALUES
    ('Producto 1', 10.99),
    ('Producto 2', 20.50),
    ('Producto 3', 30.99),
    ('Producto 4', 40.50),
    ('Producto 5', 50.99),
    ('Producto 6', 60.50),
    ('Producto 7', 70.99),
    ('Producto 8', 80.50),
    ('Producto 9', 90.99),
    ('Producto 10', 100.50),
    ('Producto 11', 110.99),
    ('Producto 12', 120.50),
    ('Producto 13', 130.99),
    ('Producto 14', 140.50),
    ('Producto 15', 150.99),
    ('Producto 16', 160.50),
    ('Producto 17', 170.99),
    ('Producto 18', 180.50),
    ('Producto 19', 190.99),
    ('Producto 20', 200.50);

CREATE TABLE IF NOT EXISTS ordenes (
    id_orden INT PRIMARY KEY AUTOINCREMENT,
    id_cliente INT,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

INSERT INTO ordenes (id_cliente, id_producto, cantidad) VALUES
    (1, 1, 2),
    (2, 2, 1),
    (3, 3, 3),
    (4, 4, 2),
    (5, 5, 1),
    (6, 6, 2),
    (7, 7, 3),
    (8, 8, 2),
    (9, 9, 1),
    (10, 10, 2),
    (11, 11, 3),
    (12, 12, 2),
    (13, 13, 1),
    (14, 14, 2),
    (15, 15, 3),
    (16, 16, 2),
    (17, 17, 1),
    (18, 18, 2),
    (19, 19, 3),
    (20, 20, 2);




--    Consultas simples:
--            Mostrar todos los clientes.
mysql> select * from clientes;
+------------+------------+---------------+
| id_cliente | nombre     | direccion     |
+------------+------------+---------------+
|          1 | Cliente 1  | Dirección 1   |
|          2 | Cliente 2  | Dirección 2   |
|          3 | Cliente 3  | Dirección 3   |
|          4 | Cliente 4  | Dirección 4   |
|          5 | Cliente 5  | Dirección 5   |
|          6 | Cliente 6  | Dirección 6   |
|          7 | Cliente 7  | Dirección 7   |
|          8 | Cliente 8  | Dirección 8   |
|          9 | Cliente 9  | Dirección 9   |
|         10 | Cliente 10 | Dirección 10  |
|         11 | Cliente 11 | Dirección 11  |
|         12 | Cliente 12 | Dirección 12  |
|         13 | Cliente 13 | Dirección 13  |
|         14 | Cliente 14 | Dirección 14  |
|         15 | Cliente 15 | Dirección 15  |
|         16 | Cliente 16 | Dirección 16  |
|         17 | Cliente 17 | Dirección 17  |
|         18 | Cliente 18 | Dirección 18  |
|         19 | Cliente 19 | Dirección 19  |
|         20 | Cliente 20 | Dirección 20  |
+------------+------------+---------------+
--            Mostrar todos los productos.
mysql> select * from productos;
+-------------+-------------+--------+
| id_producto | nombre      | precio |
+-------------+-------------+--------+
|           1 | Producto 1  |  10.99 |
|           2 | Producto 2  |  20.50 |
|           3 | Producto 3  |  30.99 |
|           4 | Producto 4  |  40.50 |
|           5 | Producto 5  |  50.99 |
|           6 | Producto 6  |  60.50 |
|           7 | Producto 7  |  70.99 |
|           8 | Producto 8  |  80.50 |
|           9 | Producto 9  |  90.99 |
|          10 | Producto 10 | 100.50 |
|          11 | Producto 11 | 110.99 |
|          12 | Producto 12 | 120.50 |
|          13 | Producto 13 | 130.99 |
|          14 | Producto 14 | 140.50 |
|          15 | Producto 15 | 150.99 |
|          16 | Producto 16 | 160.50 |
|          17 | Producto 17 | 170.99 |
|          18 | Producto 18 | 180.50 |
|          19 | Producto 19 | 190.99 |
|          20 | Producto 20 | 200.50 |
+-------------+-------------+--------+
--            Mostrar todas las órdenes.
mysql> select * from ordenes;
+----------+------------+-------------+----------+
| id_orden | id_cliente | id_producto | cantidad |
+----------+------------+-------------+----------+
|        1 |          1 |           1 |        2 |
|        2 |          2 |           2 |        1 |
|        3 |          3 |           3 |        3 |
|        4 |          4 |           4 |        2 |
|        5 |          5 |           5 |        1 |
|        6 |          6 |           6 |        2 |
|        7 |          7 |           7 |        3 |
|        8 |          8 |           8 |        2 |
|        9 |          9 |           9 |        1 |
|       10 |         10 |          10 |        2 |
|       11 |         11 |          11 |        3 |
|       12 |         12 |          12 |        2 |
|       13 |         13 |          13 |        1 |
|       14 |         14 |          14 |        2 |
|       15 |         15 |          15 |        3 |
|       16 |         16 |          16 |        2 |
|       17 |         17 |          17 |        1 |
|       18 |         18 |          18 |        2 |
|       19 |         19 |          19 |        3 |
|       20 |         20 |          20 |        2 |
+----------+------------+-------------+----------+
--            Mostrar los primeros 5 clientes ordenados por nombre.
--            Mostrar los productos con un precio mayor a 50.
mysql> select * from productos as pro where pro.precio > 50;
+-------------+-------------+--------+
| id_producto | nombre      | precio |
+-------------+-------------+--------+
|           5 | Producto 5  |  50.99 |
|           6 | Producto 6  |  60.50 |
|           7 | Producto 7  |  70.99 |
|           8 | Producto 8  |  80.50 |
|           9 | Producto 9  |  90.99 |
|          10 | Producto 10 | 100.50 |
|          11 | Producto 11 | 110.99 |
|          12 | Producto 12 | 120.50 |
|          13 | Producto 13 | 130.99 |
|          14 | Producto 14 | 140.50 |
|          15 | Producto 15 | 150.99 |
|          16 | Producto 16 | 160.50 |
|          17 | Producto 17 | 170.99 |
|          18 | Producto 18 | 180.50 |
|          19 | Producto 19 | 190.99 |
|          20 | Producto 20 | 200.50 |
+-------------+-------------+--------+
--            Mostrar todas las órdenes realizadas por el cliente con ID 1.
mysql> select * from ordenes as o join clientes as cl on o.id_cliente = cl.id_cliente and cl.id_cliente = 1;
+----------+------------+-------------+----------+------------+-----------+--------------+
| id_orden | id_cliente | id_producto | cantidad | id_cliente | nombre    | direccion    |
+----------+------------+-------------+----------+------------+-----------+--------------+
|        1 |          1 |           1 |        2 |          1 | Cliente 1 | Dirección 1  |
+----------+------------+-------------+----------+------------+-----------+--------------+
--            Mostrar los clientes cuyos nombres comienzan con la letra "M".
mysql> select * from clientes as cl where cl.nombre regexp '^M';
--            Mostrar las órdenes que contienen más de 2 productos.

--            Mostrar los productos ordenados por precio de forma descendente.
mysql> select * from productos as pro order by pro.precio desc;
+-------------+-------------+--------+
| id_producto | nombre      | precio |
+-------------+-------------+--------+
|          20 | Producto 20 | 200.50 |
|          19 | Producto 19 | 190.99 |
|          18 | Producto 18 | 180.50 |
|          17 | Producto 17 | 170.99 |
|          16 | Producto 16 | 160.50 |
|          15 | Producto 15 | 150.99 |
|          14 | Producto 14 | 140.50 |
|          13 | Producto 13 | 130.99 |
|          12 | Producto 12 | 120.50 |
|          11 | Producto 11 | 110.99 |
|          10 | Producto 10 | 100.50 |
|           9 | Producto 9  |  90.99 |
|           8 | Producto 8  |  80.50 |
|           7 | Producto 7  |  70.99 |
|           6 | Producto 6  |  60.50 |
|           5 | Producto 5  |  50.99 |
|           4 | Producto 4  |  40.50 |
|           3 | Producto 3  |  30.99 |
|           2 | Producto 2  |  20.50 |
|           1 | Producto 1  |  10.99 |
+-------------+-------------+--------+


--    Consultas de ejemplo para practicar joins
--            Seleccionar todos los clientes y sus órdenes, incluso si no tienen órdenes
mysql> select * from clientes as cl left join ordenes as ord on cl.id_cliente = ord.id_cliente;
+------------+------------+---------------+----------+------------+-------------+----------+
| id_cliente | nombre     | direccion     | id_orden | id_cliente | id_producto | cantidad |
+------------+------------+---------------+----------+------------+-------------+----------+
|          1 | Cliente 1  | Dirección 1   |        1 |          1 |           1 |        2 |
|          2 | Cliente 2  | Dirección 2   |        2 |          2 |           2 |        1 |
|          3 | Cliente 3  | Dirección 3   |        3 |          3 |           3 |        3 |
|          4 | Cliente 4  | Dirección 4   |        4 |          4 |           4 |        2 |
|          5 | Cliente 5  | Dirección 5   |        5 |          5 |           5 |        1 |
|          6 | Cliente 6  | Dirección 6   |        6 |          6 |           6 |        2 |
|          7 | Cliente 7  | Dirección 7   |        7 |          7 |           7 |        3 |
|          8 | Cliente 8  | Dirección 8   |        8 |          8 |           8 |        2 |
|          9 | Cliente 9  | Dirección 9   |        9 |          9 |           9 |        1 |
|         10 | Cliente 10 | Dirección 10  |       10 |         10 |          10 |        2 |
|         11 | Cliente 11 | Dirección 11  |       11 |         11 |          11 |        3 |
|         12 | Cliente 12 | Dirección 12  |       12 |         12 |          12 |        2 |
|         13 | Cliente 13 | Dirección 13  |       13 |         13 |          13 |        1 |
|         14 | Cliente 14 | Dirección 14  |       14 |         14 |          14 |        2 |
|         15 | Cliente 15 | Dirección 15  |       15 |         15 |          15 |        3 |
|         16 | Cliente 16 | Dirección 16  |       16 |         16 |          16 |        2 |
|         17 | Cliente 17 | Dirección 17  |       17 |         17 |          17 |        1 |
|         18 | Cliente 18 | Dirección 18  |       18 |         18 |          18 |        2 |
|         19 | Cliente 19 | Dirección 19  |       19 |         19 |          19 |        3 |
|         20 | Cliente 20 | Dirección 20  |       20 |         20 |          20 |        2 |
+------------+------------+---------------+----------+------------+-------------+----------+
--            Seleccionar todas las órdenes junto con los productos correspondientes
mysql> select * from ordenes as ord right join productos as pro on ord.id_producto = pro.id_producto;
+----------+------------+-------------+----------+-------------+-------------+--------+
| id_orden | id_cliente | id_producto | cantidad | id_producto | nombre      | precio |
+----------+------------+-------------+----------+-------------+-------------+--------+
|        1 |          1 |           1 |        2 |           1 | Producto 1  |  10.99 |
|        2 |          2 |           2 |        1 |           2 | Producto 2  |  20.50 |
|        3 |          3 |           3 |        3 |           3 | Producto 3  |  30.99 |
|        4 |          4 |           4 |        2 |           4 | Producto 4  |  40.50 |
|        5 |          5 |           5 |        1 |           5 | Producto 5  |  50.99 |
|        6 |          6 |           6 |        2 |           6 | Producto 6  |  60.50 |
|        7 |          7 |           7 |        3 |           7 | Producto 7  |  70.99 |
|        8 |          8 |           8 |        2 |           8 | Producto 8  |  80.50 |
|        9 |          9 |           9 |        1 |           9 | Producto 9  |  90.99 |
|       10 |         10 |          10 |        2 |          10 | Producto 10 | 100.50 |
|       11 |         11 |          11 |        3 |          11 | Producto 11 | 110.99 |
|       12 |         12 |          12 |        2 |          12 | Producto 12 | 120.50 |
|       13 |         13 |          13 |        1 |          13 | Producto 13 | 130.99 |
|       14 |         14 |          14 |        2 |          14 | Producto 14 | 140.50 |
|       15 |         15 |          15 |        3 |          15 | Producto 15 | 150.99 |
|       16 |         16 |          16 |        2 |          16 | Producto 16 | 160.50 |
|       17 |         17 |          17 |        1 |          17 | Producto 17 | 170.99 |
|       18 |         18 |          18 |        2 |          18 | Producto 18 | 180.50 |
|       19 |         19 |          19 |        3 |          19 | Producto 19 | 190.99 |
|       20 |         20 |          20 |        2 |          20 | Producto 20 | 200.50 |
+----------+------------+-------------+----------+-------------+-------------+--------+
--            Mostrar el nombre de los clientes que han realizado órdenes de productos que cuestan más de 50
mysql> select cl.nombre as name, pro.precio as price from clientes as cl right join productos as pro on cl.id_cliente = pro.id_producto left join ordenes as ord on cl.id_cliente = ord.id_cliente where pro.precio > 50;
+------------+--------+
| name       | price  |
+------------+--------+
| Cliente 5  |  50.99 |
| Cliente 6  |  60.50 |
| Cliente 7  |  70.99 |
| Cliente 8  |  80.50 |
| Cliente 9  |  90.99 |
| Cliente 10 | 100.50 |
| Cliente 11 | 110.99 |
| Cliente 12 | 120.50 |
| Cliente 13 | 130.99 |
| Cliente 14 | 140.50 |
| Cliente 15 | 150.99 |
| Cliente 16 | 160.50 |
| Cliente 17 | 170.99 |
| Cliente 18 | 180.50 |
| Cliente 19 | 190.99 |
| Cliente 20 | 200.50 |
+------------+--------+
--            Obtener el nombre de los productos que no se han ordenado aún
--            Mostrar el nombre del cliente, el producto y la cantidad para todas las órdenes
mysql> select cl.nombre as name, ord.cantidad as cantidad from clientes as cl right join productos as pro on cl.id_cliente = pro.id_producto left join ordenes as ord on cl.id_cliente = or
d.id_cliente;
+------------+----------+
| name       | cantidad |
+------------+----------+
| Cliente 1  |        2 |
| Cliente 2  |        1 |
| Cliente 3  |        3 |
| Cliente 4  |        2 |
| Cliente 5  |        1 |
| Cliente 6  |        2 |
| Cliente 7  |        3 |
| Cliente 8  |        2 |
| Cliente 9  |        1 |
| Cliente 10 |        2 |
| Cliente 11 |        3 |
| Cliente 12 |        2 |
| Cliente 13 |        1 |
| Cliente 14 |        2 |
| Cliente 15 |        3 |
| Cliente 16 |        2 |
| Cliente 17 |        1 |
| Cliente 18 |        2 |
| Cliente 19 |        3 |
| Cliente 20 |        2 |
--            Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos
--            Mostrar todas las órdenes con sus clientes y productos, incluso si no hay órdenes
mysql> select * from clientes as cl left join ordenes as ord on cl.id_cliente = ord.id_cliente right join productos as pro on ord.id_producto = pro.id_producto;
+------------+------------+---------------+----------+------------+-------------+----------+-------------+-------------+--------+
| id_cliente | nombre     | direccion     | id_orden | id_cliente | id_producto | cantidad | id_producto | nombre      | precio |
+------------+------------+---------------+----------+------------+-------------+----------+-------------+-------------+--------+
|          1 | Cliente 1  | Dirección 1   |        1 |          1 |           1 |        2 |           1 | Producto 1  |  10.99 |
|          2 | Cliente 2  | Dirección 2   |        2 |          2 |           2 |        1 |           2 | Producto 2  |  20.50 |
|          3 | Cliente 3  | Dirección 3   |        3 |          3 |           3 |        3 |           3 | Producto 3  |  30.99 |
|          4 | Cliente 4  | Dirección 4   |        4 |          4 |           4 |        2 |           4 | Producto 4  |  40.50 |
|          5 | Cliente 5  | Dirección 5   |        5 |          5 |           5 |        1 |           5 | Producto 5  |  50.99 |
|          6 | Cliente 6  | Dirección 6   |        6 |          6 |           6 |        2 |           6 | Producto 6  |  60.50 |
|          7 | Cliente 7  | Dirección 7   |        7 |          7 |           7 |        3 |           7 | Producto 7  |  70.99 |
|          8 | Cliente 8  | Dirección 8   |        8 |          8 |           8 |        2 |           8 | Producto 8  |  80.50 |
|          9 | Cliente 9  | Dirección 9   |        9 |          9 |           9 |        1 |           9 | Producto 9  |  90.99 |
|         10 | Cliente 10 | Dirección 10  |       10 |         10 |          10 |        2 |          10 | Producto 10 | 100.50 |
|         11 | Cliente 11 | Dirección 11  |       11 |         11 |          11 |        3 |          11 | Producto 11 | 110.99 |
|         12 | Cliente 12 | Dirección 12  |       12 |         12 |          12 |        2 |          12 | Producto 12 | 120.50 |
|         13 | Cliente 13 | Dirección 13  |       13 |         13 |          13 |        1 |          13 | Producto 13 | 130.99 |
|         14 | Cliente 14 | Dirección 14  |       14 |         14 |          14 |        2 |          14 | Producto 14 | 140.50 |
|         15 | Cliente 15 | Dirección 15  |       15 |         15 |          15 |        3 |          15 | Producto 15 | 150.99 |
|         16 | Cliente 16 | Dirección 16  |       16 |         16 |          16 |        2 |          16 | Producto 16 | 160.50 |
|         17 | Cliente 17 | Dirección 17  |       17 |         17 |          17 |        1 |          17 | Producto 17 | 170.99 |
|         18 | Cliente 18 | Dirección 18  |       18 |         18 |          18 |        2 |          18 | Producto 18 | 180.50 |
|         19 | Cliente 19 | Dirección 19  |       19 |         19 |          19 |        3 |          19 | Producto 19 | 190.99 |
|         20 | Cliente 20 | Dirección 20  |       20 |         20 |          20 |        2 |          20 | Producto 20 | 200.50 |
+------------+------------+---------------+----------+------------+-------------+----------+-------------+-------------+--------+
--            Obtener el nombre de los clientes junto con el número total de órdenes que han realizado

--            Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto
--            Mostrar todas las órdenes con sus productos y clientes, incluso si no hay información de cliente.
--            Obtener el nombre de los productos junto con el nombre de los clientes que han realizado órdenes de esos productos, incluyendo los productos que no han sido ordenados
--            Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto, incluyendo las órdenes sin productos
--            Obtener el nombre de los clientes junto con el número total de órdenes que han realizado, incluyendo los clientes que no han realizado órdenes.
--            Mostrar todas las órdenes con sus clientes y productos, incluyendo las órdenes y productos que no tienen información.
