-- Creación de tablas:
-- Tabla Productos:

CREATE TABLE productos (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    categoria TEXT,
    precio REAL
);

-- Tabla Ventas:

CREATE TABLE ventas (
    id INTEGER PRIMARY KEY,
    id_producto INTEGER,
    cantidad INTEGER,
    fecha DATE,
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);

-- Inserción de los productos:

INSERT INTO productos (id, nombre, categoria, precio) VALUES 
    (1, 'Arroz', 'Alimentos', 2.5),
    (2, 'Leche', 'Lácteos', 1.8),
    (3, 'Pan', 'Panadería', 1.2),
    (4, 'Manzanas', 'Frutas', 3.0),
    (5, 'Pollo', 'Carnes', 5.5),
    (6, 'Huevos', 'Lácteos', 1.0),
    (7, 'Yogurt', 'Lácteos', 2.0),
    (8, 'Tomates', 'Verduras', 2.2),
    (9, 'Queso', 'Lácteos', 4.0),
    (10, 'Cereal', 'Desayuno', 3.5),
    (11, 'Papel Higiénico', 'Hogar', 1.5),
    (12, 'Cepillo de Dientes', 'Higiene', 2.0),
    (13, 'Detergente', 'Limpieza', 2.8),
    (14, 'Galletas', 'Snacks', 1.7),
    (15, 'Aceite de Oliva', 'Cocina', 4.5),
    (16, 'Café', 'Bebidas', 5.0),
    (17, 'Sopa enlatada', 'Conservas', 2.3),
    (18, 'Jabón de Baño', 'Higiene', 1.2),
    (19, 'Botellas de Agua', 'Bebidas', 1.0),
    (20, 'Cerveza', 'Bebidas', 3.8);

-- Inserción de las ventas:

INSERT INTO ventas (id_producto, cantidad, fecha) VALUES 
    (1, 5, '2024-01-17'),
    (2, 3, '2024-01-17'),
    (4, 2, '2024-01-17'),
    (5, 1, '2024-01-17'),
    (6, 10, '2024-01-18'),
    (8, 4, '2024-01-18'),
    (10, 2, '2024-01-18'),
    (14, 7, '2024-01-19'),
    (16, 3, '2024-01-19'),
    (18, 6, '2024-01-20');

-- Consultas:


    Mostrar todos los productos de la categoría "Bebidas".
    sqlite> select p.nombre from productos as p where p.categoria = "Bebidas";
+------------------+
|      nombre      |
+------------------+
| Café             |
| Botellas de Agua |
| Cerveza          |
+------------------+

    Listar los productos ordenados por precio de forma descendente.
    +----+--------------------+-----------+--------+
| 5  | Pollo              | Carnes    | 5.5    |
| 16 | Café               | Bebidas   | 5.0    |
| 15 | Aceite de Oliva    | Cocina    | 4.5    |
| 9  | Queso              | Lácteos   | 4.0    |
| 20 | Cerveza            | Bebidas   | 3.8    |

    Calcular el precio total de todos los productos en la tabla "productos".
    sqlite> select sum(p.precio) as "precio total" from productos as p;
+--------------+
| precio total |
+--------------+
| 52.5         |
+--------------+

    Encontrar los productos con un nombre que contenga la letra 'a'.
    sqlite> select * from productos as p where p.nombre like '%a%';
+----+------------------+-----------+--------+
| id |      nombre      | categoria | precio |
+----+------------------+-----------+--------+
| 1  | Arroz            | Alimentos | 2.5    |
| 3  | Pan              | Panadería | 1.2    |
| 4  | Manzanas         | Frutas    | 3.0    |
| 8  | Tomates          | Verduras  | 2.2    |

    Obtener la cantidad total de productos vendidos en todas las fechas.
    sqlite> select v.cantidad, v.fecha from ventas as v;
+----------+------------+
| cantidad |   fecha    |
+----------+------------+
| 5        | 2024-01-17 |
| 3        | 2024-01-17 |

    Encontrar el producto más caro en cada categoría.
    sqlite> select max(p.nombre) as "producto caro", p.categoria,p.precio from productos as p group by categoria;
+-----------------+-----------+--------+
|  producto caro  | categoria | precio |
+-----------------+-----------+--------+
| Arroz           | Alimentos | 2.5    |
| Cerveza         | Bebidas   | 3.8    |
| Pollo           | Carnes    | 5.5    |
| Aceite de Oliva | Cocina    | 4.5    |

    Listar los productos que no han sido vendidos.
    select v.cantidad,p.nombre from ventas as v, productos as p  where cantidad = 0 and p.id = v.id_producto;
    Calcular el precio promedio de los productos en la categoría "Snacks".
    sqlite> select avg(precio) as promedio, p.nombre as nombre, p.precio as precio from productos as p where categoria = 'Snacks';
+----------+----------+--------+
| promedio |  nombre  | precio |
+----------+----------+--------+
| 1.7      | Galletas | 1.7    |
+----------+----------+--------+

    Encontrar los productos que han sido vendidos más de 5 veces.
    sqlite> select p.nombre as nombre, v.cantidad as cantidad from ventas as v, productos as p where v.cantidad > 5 and p.id = v.id_producto;
+---------------+----------+
|    nombre     | cantidad |
+---------------+----------+
| Huevos        | 10       |
| Galletas      | 7        |
| Jabón de Baño | 6        |
+---------------+----------+

    Mostrar la fecha y la cantidad de ventas para cada producto.
    sqlite> select p.nombre as nombre, v.fecha as fecha, v.cantidad as cantidad from productos as p, ventas as v where p.id = v.id_producto order by cantidad;
+---------------+------------+----------+
|    nombre     |   fecha    | cantidad |
+---------------+------------+----------+
| Pollo         | 2024-01-17 | 1        |
| Manzanas      | 2024-01-17 | 2        |
| Cereal        | 2024-01-18 | 2        |
| Leche         | 2024-01-17 | 3        |
| Café          | 2024-01-19 | 3        |
| Tomates       | 2024-01-18 | 4        |

    Encontrar los productos que tienen un precio menor o igual a 2.
    sqlite> select p.nombre as nombre, p.precio as precio from productos as p where precio <= 2 order by precio;
+--------------------+--------+
|       nombre       | precio |
+--------------------+--------+
| Huevos             | 1.0    |
| Botellas de Agua   | 1.0    |
| Pan                | 1.2    |
| Jabón de Baño      | 1.2    |
| Papel Higiénico    | 1.5    |

    Calcular la cantidad total de ventas para cada fecha.
    sqlite> select sum(v.cantidad) as cantidad, v.fecha as fecha from ventas as v group by fecha;
+----------+------------+
| cantidad |   fecha    |
+----------+------------+
| 11       | 2024-01-17 |
| 16       | 2024-01-18 |
| 10       | 2024-01-19 |
| 6        | 2024-01-20 |
+----------+------------+

    Listar los productos cuyo nombre comienza con la letra 'P'.
sqlite> select p.nombre from productos as p where p.nombre like 'P%';
+-----------------+
|     nombre      |
+-----------------+
| Pan             |
| Pollo           |
| Papel Higiénico |
+-----------------+

    Obtener el producto más vendido en términos de cantidad.
    sqlite> select max(v.cantidad) as cantidad,p.nombre as nombre from productos as p,ventas as v;
+----------+--------+
| cantidad | nombre |
+----------+--------+
| 10       | Arroz  |
+----------+--------+

    Mostrar los productos que fueron vendidos en la fecha '2024-01-18'.
    sqlite> select p.nombre as nombre, v.cantidad as cantidad, v.fecha as fecha from productos as p, ventas as v where fecha = '2024-01-18' and p.id = v.id_producto;
+---------+----------+------------+
| nombre  | cantidad |   fecha    |
+---------+----------+------------+
| Huevos  | 10       | 2024-01-18 |
| Tomates | 4        | 2024-01-18 |
| Cereal  | 2        | 2024-01-18 |
+---------+----------+------------+

    Calcular el total de ventas para cada producto.
    sqlite> select v.cantidad as cantidad, p.nombre as nombre, p.precio as precio from ventas as v, productos as p where p.id = v.id_producto order by cantidad;
+----------+---------------+--------+
| cantidad |    nombre     | precio |
+----------+---------------+--------+
| 1        | Pollo         | 5.5    |
| 2        | Manzanas      | 3.0    |
| 2        | Cereal        | 3.5    |

    Encontrar los productos con un precio entre 3 y 4.
    sqlite> select p.nombre as nombre, p.precio as precio from productos as p where precio between 3 and 4;
+----------+--------+
|  nombre  | precio |
+----------+--------+
| Manzanas | 3.0    |
| Queso    | 4.0    |
| Cereal   | 3.5    |
| Cerveza  | 3.8    |
+----------+--------+

    Listar los productos y sus categorías ordenados alfabéticamente por categoría.
    sqlite> select p.nombre as nombre, p.categoria as categoria from productos as p order by categoria;
+--------------------+-----------+
|       nombre       | categoria |
+--------------------+-----------+
| Arroz              | Alimentos |
| Café               | Bebidas   |
| Botellas de Agua   | Bebidas   |
| Cerveza            | Bebidas   |
| Pollo              | Carnes    |

    Calcular el precio total de los productos vendidos en la fecha '2024-01-19'.
    sqlite> select sum(p.precio) as precio, v.fecha as fecha from productos as p, ventas as v where fecha = '2024-01-19' and p.id = v.id_producto;
+--------+------------+
| precio |   fecha    |
+--------+------------+
| 6.7    | 2024-01-19 |
+--------+------------+

    Mostrar los productos que no pertenecen a la categoría "Higiene".
    sqlite> select p.nombre as nombre, p.categoria as categoria from productos as p where categoria not in ('Higiene') order by categoria;
+------------------+-----------+
|      nombre      | categoria |
+------------------+-----------+
| Arroz            | Alimentos |
| Café             | Bebidas   |
| Botellas de Agua | Bebidas   |
| Cerveza          | Bebidas   |
| Pollo            | Carnes    |

    Encontrar la cantidad total de productos en cada categoría.
    sqlite> select p.categoria as categoria, count(*) as cantidad_total from productos as p group by categoria;
+-----------+----------------+
| categoria | cantidad_total |
+-----------+----------------+
| Alimentos | 1              |
| Bebidas   | 3              |
| Carnes    | 1              |

    Listar los productos que tienen un precio igual a la media de precios.
    select p.nombre as nombre from productos as p where precio = (select avg(p.precio) from productos as p);

    Calcular el precio total de los productos vendidos en cada fecha.
    sqlite> select v.fecha as fecha, sum(p.precio) as precio_total from ventas as v, productos as p group by fecha;
+------------+--------------+
|   fecha    | precio_total |
+------------+--------------+
| 2024-01-17 | 210.0        |
| 2024-01-18 | 157.5        |
| 2024-01-19 | 105.0        |
| 2024-01-20 | 52.5         |
+------------+--------------+

    Mostrar los productos con un nombre que termina con la letra 'o'.
    sqlite> select p.nombre as nombre from productos as p where p.nombre like '%o';
+-----------------+
|     nombre      |
+-----------------+
| Pollo           |
| Queso           |
| Papel Higiénico |
| Jabón de Baño   |
+-----------------+

    Encontrar los productos que han sido vendidos en más de una fecha.
    
    Listar los productos cuya categoría comienza con la letra 'L'.
    +---------------+------------+
sqlite> select p.nombre as nombre from productos as p where p.nombre like 'L%';
+--------+
| nombre |
+--------+
| Leche  |
+--------+

    Calcular el total de ventas para cada producto en la fecha '2024-01-17'.
    sqlite> select p.nombre as nombre, v.cantidad as cantidad, v.fecha as fecha from productos as p, ventas as v where fecha in ('2024-01-17') and p.id = v.id_producto;
+----------+----------+------------+
|  nombre  | cantidad |   fecha    |
+----------+----------+------------+
| Arroz    | 5        | 2024-01-17 |
| Leche    | 3        | 2024-01-17 |
| Manzanas | 2        | 2024-01-17 |
| Pollo    | 1        | 2024-01-17 |
+----------+----------+------------+

    Mostrar los productos cuyo nombre tiene al menos 5 caracteres.

    Encontrar los productos que tienen un precio superior al precio máximo en la tabla "productos".
    select p.nombre as nombre, p.precio as precio from productos as p where p.precio > (select max(p.precio) as precio from productos as p);

-- Hacer los updates, delete, etc para practicar
