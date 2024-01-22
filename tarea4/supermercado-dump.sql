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
    
    Calcular el precio promedio de los productos en la categoría "Snacks".
    Encontrar los productos que han sido vendidos más de 5 veces.
    Mostrar la fecha y la cantidad de ventas para cada producto.
    Encontrar los productos que tienen un precio menor o igual a 2.
    Calcular la cantidad total de ventas para cada fecha.
    Listar los productos cuyo nombre comienza con la letra 'P'.
    Obtener el producto más vendido en términos de cantidad.
    Mostrar los productos que fueron vendidos en la fecha '2024-01-18'.
    Calcular el total de ventas para cada producto.
    Encontrar los productos con un precio entre 3 y 4.
    Listar los productos y sus categorías ordenados alfabéticamente por categoría.
    Calcular el precio total de los productos vendidos en la fecha '2024-01-19'.
    Mostrar los productos que no pertenecen a la categoría "Higiene".
    Encontrar la cantidad total de productos en cada categoría.
    Listar los productos que tienen un precio igual a la media de precios.
    Calcular el precio total de los productos vendidos en cada fecha.
    Mostrar los productos con un nombre que termina con la letra 'o'.
    Encontrar los productos que han sido vendidos en más de una fecha.
    Listar los productos cuya categoría comienza con la letra 'L'.
    Calcular el total de ventas para cada producto en la fecha '2024-01-17'.
    Mostrar los productos cuyo nombre tiene al menos 5 caracteres.
    Encontrar los productos que tienen un precio superior al precio máximo en la tabla "productos".
