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

TEMA 1. Introducción a la comunicación
Antes y después en la promoción turística.
Antes…
-La promoción turística se basaba principalmente en la publicidad en medios masivos, como la televisión y los periódicos, dirigida a un público amplio. El turismo de masa y la oferta turística eran las claves para la promoción turística. 
Además consistía en editar folletos, participar en ferias turísticas y realizar campañas de publicidad.
-Los destinos turísticos construían una oferta pensada para un mercado de masa a partir de sus recursos turísticos y atractivos. Los turistas se adaptaban a esta oferta sin poder intervenir en el proceso de construcción y producción de sus viajes.
-El marketing de destinos consistía en la comunicación de los atractivos, bellezas y recursos del destino. No existía comunicación directa entre el destino y el turista-
Ahora…
-La promoción turística ha evolucionado hacia una comunicación más específica y personalizada, con enfoques en el turismo sostenible y la experiencia del usuario. Se ha dado paso a la segmentación de mercado, donde se busca llegar a un público específico, y se utiliza la tecnología para crear campañas más eficaces.
-El turista accede directamente a la información sobre el destino, obviando la información estructurada de los medios de comunicación tradicionales. Ademas, accede a la oferta sin intermediarios turísticos.
-Crecimiento exponencial de la demanda (número de turistas) y de la oferta(destinos) en el mercado turístico.
-Aparición de nuevos canales de comunicación y de comercialización y nuevas tipologías de demanda.
-El marketing tiene que satisfacer las necesidades de unos turistas informados y empeñados en personalizar al máximo las propuestas turísticas, según sus intereses y deseos. (ej, paquetes dinámicos)
El marketing turístico tiene que seducir, informar, construir engagement y relaciones de confianza.  Los destinos deben aparecer humanos, personalizados y adaptados a la demanda. Debemos adaptar nuestras estrategias de comunicación y de promoción a ese nuevo modelo de transmisión de la información.
La nueva comunicación: comunicación multiinteractiva.
La comunicación turística ha evolucionado hacia una comunicación multiinteractiva, donde la interacción entre los usuarios es clave. La tecnología ha permitido el uso de herramientas como las redes sociales y las aplicaciones móviles, donde los turistas pueden compartir sus experiencias, recomendar lugares y generar contenido.
-EMR (emisor-mensaje-receptor) emisores múltiples y simúltáneos, con capacidad de emitir y recibir mensajes, informaciones, etc. Más personalizados que institucionalizados, con una mayor autonomía tanto en la emisión como en la recepción.
-Mensajes: diversos, instantáneos, bidireccionales y más personalizados que generan contenidos en muchas direcciones (diálogos sincrónicos, asicrónicos, virtuales) y que pueden ser de distinta naturaleza;informaciones, diálogos comunicacionales, saberes y conocimiento compartidos, elaborados de forma hipertextual y multimedia.
-TIC y medios masivos: medios con soportes tecnológicos diferentes (digitales, telemático, interactivo) que se interconectan entre ellos en una red virtual (la web), donde se integran imágenes, voz, texto en un espacio global, y que cada vez ganan más en ubicuidad al no estar sujetos a cableados fijos y depender más de tecnologías móviles como los teléfonos inteligentes, las computadoras portátiles y las memorias flash.
-Efectos diversos, varios y no unidireccionales, de influencia recíproca y compartida entre unos receptores-usuarios/emisores múltiples que pueden ser conocidos o no entre ellos y con el emisor. Están unidos entre ellos por una relación de cercanía sicológica. Experimentan diferentes opciones de recepción: de uno a muchos, de muchos a muchos y de muchos a uno; pero sus prácticas de consumo suelen ser mas individualizadas y privatizadas.
Nuevos usuarios: cómo son
Los nuevos usuarios son personas que buscan una experiencia turística personalizada y auténtica. Son viajeros que buscan lugares menos turísticos y más auténticos. Además, son usuarios que utilizan la tecnología como herramienta de búsqueda y reserva.
LOS MILLENIALS:
Los millennials son una generación que ha crecido con la tecnología, y son expertos en su uso (nacidos entre principios de los años 80 y mitad de los 90).
Son viajeros que buscan experiencias auténticas y locales, y están dispuestos a pagar más por ellas. Además, son usuarios activos en redes sociales y generadores de contenido. 
El colectivo clave para el mercado actual…    
El 46% de ellos participa en debates o actividades relacionadas con la televisión en una segunda pantalla como parte de su experiencia visual de la programación televisiva.
Se informan cada vez menos por los medios convencionales, como prensa, radio y tv
Las redes sociales representan la principal fuente de información de los millenials…         
Los millenials se alejan de las formas tradicionales periodísticas y buscan vías de información alternativas.
La preferencia de este colectivo por las pantallas digitales, por los soportes móviles y por las noticias breves es evidente, pues las redes sociales se han convertido para los millenials más jóvenes en su principal fuente de información.
Comunicación del destino en la web 2.0
La web 2.0 es un término que se refiere a la segunda generación de la web, donde los usuarios tienen un papel activo en la creación y el intercambio de contenido. La web 2.0 ha revolucionado la forma en que las empresas de turismo interactúan con los clientes, permitiendo una comunicación más directa y personalizada.
Los destinos no son percibidos en el mercado a partir de lo que cuentan de sí mismos, sino por lo que el mercado cuenta de ellos.
Hoy en día, la comunicación turística más eficaz es la que logra mayor número de recomendaciones por parte del público. Este fenómeno, siempre ha sido importante en turismo (parientes y amigos directos)
La cola multibroadcasting 
Es un término que se refiere a la forma en que la comunicación en línea se propaga a través de diferentes canales, como las redes sociales y los blogs. La cola multibroadcasting es una herramienta poderosa para la promoción turística, ya que permite llegar a un público más amplio y diverso.
 
Conyuntura turística:
En el paisaje actual, la coyuntura turística global se presenta como un escenario dinámico, donde factores económicos, sociales y medioambientales convergen para dar forma a la industria del turismo a nivel mundial. 
 
-Impacto de la pandemia: resiliencia y recuperación
-Experiencias sostenibles 
-Tecnología innovadora
-Transformación digital y redes sociales
-Cambio climático 
-Overturismo
 
Link sobre la comunicación en la actualidad y caso nespresso
TEMA 1.2Introducción a la comunicación.
El marketing tradicional no funciona
-Crisis del marketing tradicional…
Todos estos fenómenos han obligado a un cambio de paradigma en el marketing.
Los factores que han causado este profundo cambio en el paradigma de marketing radican en la revolución digital.
-FACTORES ESTRUCTURALES
•	Globalización
•	Sociedad red
•	Era del acceso
•	Sociedad del entretenimiento
•	Cultura de la gratuidad
•	Crisis económica
 
-FACTORES DEL ECOSISTEMA DE MERCADO
•	Proliferación de dispositivos
•	Fragmentación audiencias
•	Internet
•	Nuevos hábitos en el consumo de medios
•	Fragmentación del mercado publicitario
-FACTORES DE MERCADO
•	Proliferación de la oferta de servicios y productos
•	Comoditizacion
•	Canales de distribución
•	Papel preponderante de las marcas 

-Cambios en el comportamiento del consumidor: Los consumidores han desarrollado nuevos hábitos, especialmente en el mundo digital.
-Dominio de las redes sociales: El marketing tradicional a menudo no alcanza la inmediatez y autenticidad que exigen las redes sociales.
-Saturación publicitaria: La sobreexposición a la publicidad tradicional conduce a la saturación.
-Marketing de contenidos: Crear contenido valioso y relevante es esencial para atraer y retener la atención de su audiencia vs el marketing tradicional.
-Personalización y experiencia del cliente: los consumidores quieren personalización y una experiencia auténtica vs las estrategias tradicionales suelen ser genéricas, mientras q 
-Medición de resultados: la digitalización puede medir con mayor precisión el retorno de la inversión (ROI) en marketing. Las estrategias tradicionales a menudo no logran proporcionar datos concretos sobre la efectividad de las campañas.
-Nuevas tecnologías: La introducción de tecnologías como la inteligencia artificial, la realidad aumentada y la realidad virtual abren nuevas oportunidades de marketing. Las empresas que no adopten estas innovaciones corren el riesgo de quedarse atrás.ue el marketing moderno se centra en la personalización y la conexión emocional.
Del consumidor al prosumidor
El prosumidor es un consumidor que, a través de su acción activa, agrega valor al producto. Este es un cliente empoderado.
De consumidores a prosumidores: la imagen de los prosumidores es particularmente prominente. Son consumidores activos que no sólo compran productos, sino que también aportan valor a través de su propia participación. Este empoderamiento de los consumidores significa una mayor influencia en las configuraciones de productos y servicios.
¿Cómo llegamos a este nuevo consumidor?
-Marketing racional, experiencial, co-creativo(huésped-anfitrión)
-Uso de estrategias pull frente a las push
-Utilizar la marca como herramienta generadora de confianza.
-Establecer una relación entre el consumidor/cliente y la marca en la que cada uno de ellos percibe al otro como proveedor de valor.
-Buscar el engagement, el compromiso, con el consumidor/cliente
El marketing tradicional persigue a los clientes… el nuevo marketing los atrae…
TEMA 2. Herramientas de comunicación tradicional
1.	PROMOCIÓN DE VENTAS
La promoción de ventas incluye todo el conjunto de actividades que, mediante la utilización de incentivos materiales o económicos, tratan de estimular la demanda a corto plazo de un producto o servicio turístico.
- Incorpora, siempre, un incentivo para aumentar el deseo de compra del consumidor turístico: muestras, cupones, reembolsos, descuento, primas, concursos, bienes gratuitos, publicidad cooperativa y bonos
- Consigue rápidos resultados de respuesta
- Se autofinancia, dado que el coste de la promoción queda compensado por los aumentos de las ventas turísticas
- Debe ayudar al posicionamiento y a la construcción de la marca
La excesiva promoción de ventas puede convertir a un producto bien diferenciado en un commodity o en un producto de uso ordinario.
La promoción de ventas se emplea para resolver distintos problemas de marketing, como: 
•	apoyar el lanzamiento de un nuevo producto
•	aumentar las ventas
•	incentivar la fidelidad del turista
•	reaccionar a acciones de marketing de la competencia
Las empresas turísticas pueden recurrir a diferentes tipos de promoción de ventas según el destinatario del incentivo: 
  
Red de intermediarios	Primas u otros incentivos económicos; concursos para premiar a los mejores vendedores de la campaña; incentivos indirectos como la invitación a convenciones y similares; artículos gratuitos, incentivos monetarios, etc 
Compradores habituales	Descuento inmediato; vale de descuento para compras futuras; oferta de producto adicional (una noche extra); entrega de un regalo; posibilidad de sumar compras para conseguir un regalo; compensaciones por fidelidad; etc. 
Equipos de venta	bonos, primas y premios 
Público en general	Muestras; cupones y vales de descuento; paquetes de producto a precio reducido; obsequios; promociones en el punto de venta o sorteos; juegos y concursos. 

2.	VENTA PERSONAL
La venta personal es la realizada por los vendedores o fuerza de venta. Puede definirse como una forma de comunicación oral que transmite información de forma directa y personal a un cliente-potencial específico.
El vendedor es el que representa la empresa y atiende al comprador potencial. Representa a la empresa y gracias a su relación tan directa con el cliente obtiene mucha información acerca de este. 
Es una herramienta muy efectiva para una empresa turística y a su vez es la más cara que utiliza la empresa.
Tipos de venta personal: 
Ventas a través de intermediarios	Contacto directo y seguimiento sistemático de las agencias de viajes y de los turoperadores. 
Ventas internas	En una organización turística, cualquier persona que esté en contacto con el cliente puede ser un vendedor: mostrador, recepción, restaurante, etc 
Ventas directas	Los vendedores salen de la empresa cuando deben llevar a cabo negociaciones con otras empresas o con compradores de capacidad como los turoperadores. En el caso de las reservas directas telefónicas, pueden realizarse sin que los vendedores de la organización se desplacen 
El coste de una visita de ventas varía dependiendo de la empresa, pero siempre es alto.
Además, la mayoría de los pedidos no se cierran en la primera visita o en la primera llamada telefónica. Frecuentemente, se requieren muchas más visitas o llamadas, especialmente para pedidos importantes.
Se estima que hace falta una media de cinco visitas o llamadas para cerrar un acuerdo con un cliente.
Tareas del vendedor:
•	Prospección→ buscan nuevos clientes y afianzan su relación con ellos.
•	Comunicación→ proporcionan información sobre los servicios y productos de una empresa.
•	Venta→ conocen el arte de la venta: precontacto, presentación, respuestas ante las objeciones de los clientes y cierre de la venta, entre otras.
•	Servicios→ proporcionan servicios a los clientes: consultoría, asistencia técnica, etc. Recogida de información→obtienen información del mercado
•	Mantenimiento de las relaciones con socios clave→Los vendedores con más experiencia proveen un apoyo muy valioso en el proceso de planificación.
•	Seguimiento postventa→Para asegurarse la satisfacción del cliente, después del cierre de la operación, los vendedores deben vigilar que se respeten los detalles acordados.
3.	MARKETING DIRECTO
El marketing directo consiste en la comunicación directa con consumidores individuales cuidadosamente seleccionados, tanto para obtener una respuesta inmediata como para cultivar relaciones duraderas
Las empresas que recurren al marketing directo se comunican directamente con los clientes, a menudo de uno a uno. Utilizando bases de datos detalladas, estas empresas personalizan sus ofertas y su comunicación de marketing. Con el marketing directo las empresas buscan una respuesta del consumidor directa, inmediata y medible
Principales formas:
•	Marketing por correo directo: Consiste en el envío de una oferta, un anuncio, un recordatorio u otro artículo a una persona, utilizando listas de direcciones muy selectas.
•	Marketing telefónico (telemarketing) : ventajas para el consumidor como la comodidad de la compra y la mayor información sobre el producto y servicio.
•	Kiosk marketing: Consiste en instalar máquinas de hacer pedidos en tiendas, aeropuertos, recepciones de hoteles y otros lugares. Ej.: dispositivos de facturación y autoservicio de hoteles y compañías aéreas.

4.	Otras herramientas tradicionales de comunicación
•	Feria de turismo: es útil para establecer contactos (networking), estudiar a la competencia y para difundir la imagen del destino o la empresa turística. Es imprescindible saber elegir el evento que mejor se adapta a las características de nuestro destino (rural, cultural, nieve, etc…)
Ventajas:
- mayor acercamiento al cliente del producto/servicio turístico
- la actitud del visitante es más favorable a la compra
- se logra reducir el coste por contrato, debido a que estos se producen en un periodo breve de tiempo
•	Promoción del destino: Consiste en informar al turista, una vez que este haya alcanzado el destino, acerca de todas las opciones de ocio, actividades, itinerarios, visitas,etc. Los objetivos de esta acción es incrementar el gasto medio del turista en el destino.
•	Viajes de familiarización (FAM trips): viajes de información y promoción a los que se invita a participar a intermediarios, líderes de opinión, periodistas, etc. para dar a conocer un destino, sus productos y recursos. La organización de estas estancias debe ser gratuita e impecable.
-Si es un destino emergente: invitación de turoperadores y grandes proveedores que se ocupan de elegir los contenidos de los catálogos.
-Si es un destino consolidado: organización del viaje al detalle para los vendedores, para que tengan más motivación para vender el producto de la empresa.

