 - Actualizar el nivel de Bulbasaur.
 sqlite> select * from pokemon as p where p.nombre = 'Bulbasaur';
+----+-----------+---------+-------+
| id |  nombre   | id_tipo | nivel |
+----+-----------+---------+-------+
| 1  | Bulbasaur | 3       | 10    |
+----+-----------+---------+-------+

sqlite> update pokemon set  nivel = 15 where nombre = 'Bulbasaur';
sqlite> select * from pokemon as p where p.nombre = 'Bulbasaur';
+----+-----------+---------+-------+
| id |  nombre   | id_tipo | nivel |
+----+-----------+---------+-------+
| 1  | Bulbasaur | 3       | 15    |
+----+-----------+---------+-------+

 - Cambiar el tipo de Pikachu a "Eléctrico/Rojo".
 sqlite> select * from tipo as t, pokemon as p where p.nombre  = 'Pikachu' and p.id_tipo = t.id;
+----+-----------+----+---------+---------+-------+
| id |  nombre   | id | nombre  | id_tipo | nivel |
+----+-----------+----+---------+---------+-------+
| 4  | Eléctrico | 4  | Pikachu | 4       | 15    |
+----+-----------+----+---------+---------+-------+



 - Incrementar el nivel de todos los Pokémon de tipo Agua.
 sqlite> select p.nombre as nombre, p.nivel as nivel, t.nombre as nombre from pokemon as p, tipo as t where t.nombre = 'Agua' and p.id_tipo = t.id;
+-----------+-------+--------+
|  nombre   | nivel | nombre |
+-----------+-------+--------+
| Squirtle  | 8     | Agua   |
| Vaporeon  | 25    | Agua   |
| Gyarados  | 30    | Agua   |
| Blastoise | 55    | Agua   |
+-----------+-------+--------+
sqlite> update pokemon set nivel = 70 where id_tipo = 1;
sqlite> select p.nombre as nombre, p.nivel as nivel, t.nombre as nombre from pokemon as p, tipo as t where t.nombre = 'Agua' and p.id_tipo = t.id;
+-----------+-------+--------+
|  nombre   | nivel | nombre |
+-----------+-------+--------+
| Squirtle  | 70    | Agua   |
| Vaporeon  | 70    | Agua   |
| Gyarados  | 70    | Agua   |
| Blastoise | 70    | Agua   |
+-----------+-------+--------+

 - Eliminar a Jynx de la lista de Pokémon.
 sqlite> delete from pokemon where nombre = 'Jynx';

 - Eliminar el tipo "Hielo" de la lista de tipos de Pokémon.
 sqlite> delete from tipo where nombre = 'Hielo';

 - Obtener todos los Pokémon.
 sqlite> select * from pokemon;
+----+------------+---------+-------+
| id |   nombre   | id_tipo | nivel |
+----+------------+---------+-------+
| 1  | Bulbasaur  | 3       | 15    |
| 2  | Charmander | 2       | 12    |
| 3  | Squirtle   | 1       | 70    |
| 4  | Pikachu    | 4       | 15    |

 - Obtener el nombre y nivel de los Pokémon de tipo Fuego.
sqlite> select p.nombre as nombre, p.nivel as nivel from pokemon as p where p.id_tipo = 2;
+------------+-------+
|   nombre   | nivel |
+------------+-------+
| Charmander | 12    |
| Flareon    | 27    |
| Arcanine   | 35    |
| Charizard  | 50    |
| Dragonite  | 60    |
| Flareon    | 65    |
+------------+-------+ 

 - Obtener el nombre de los Pokémon que tienen un nivel superior a 30.
 sqlite> select p.nombre as nombre,p.nivel as nivel from pokemon as p where p.nivel > 30;
+------------+-------+
|   nombre   | nivel |
+------------+-------+
| Squirtle   | 70    |
| Vaporeon   | 70    |
| Gyarados   | 70    |
| Arcanine   | 35    |

 - Obtener el nombre de los Pokémon ordenados por nivel de forma descendente.
sqlite> select p.nombre as nombre,p.nivel as nivel from pokemon as p order by nivel desc;
+------------+-------+
|   nombre   | nivel |
+------------+-------+
| Rhydon     | 80    |
| Zapdos     | 75    |
| Squirtle   | 70    |
| Vaporeon   | 70    |
| Gyarados   | 70    |
| Blastoise  | 70    |
| Venusaur   | 70    |
| Flareon    | 65    |
| Dragonite  | 60    |
| Rhydon     | 52    |
| Charizard  | 50    |
| Electabuzz | 48    |
| Venusaur   | 45    |
| Exeggutor  | 40    |
| Raichu     | 38    |
| Arcanine   | 35    |
| Sandslash  | 33    |
| Flareon    | 27    |
| Jolteon    | 22    |
| Ivysaur    | 18    |
| Bulbasaur  | 15    |
| Pikachu    | 15    |
| Cubone     | 14    |
| Charmander | 12    |
| Geodude    | 11    |
+------------+-------+


 - Obtener la cantidad de Pokémon por tipo.
 sqlite> SELECT
  t.nombre AS tipo,
  (SELECT COUNT(*) FROM pokemon p WHERE p.id_tipo = t.id) AS cantidad_de_pokemon
FROM tipo t;
+-----------+---------------------+
|   tipo    | cantidad_de_pokemon |
+-----------+---------------------+
| Agua      | 4                   |
| Fuego     | 6                   |
| Planta    | 5                   |
| Electrico | 5                   |
| Tierra    | 5                   |
+-----------+---------------------+


 - Obtener la información completa de un Pokémon específico. Selecciona el que desees.
 sqlite> select * from pokemon as p,tipo as t where p.nombre = 'Bulbasaur' and p.id_tipo = t.id;
+----+-----------+---------+-------+----+--------+
| id |  nombre   | id_tipo | nivel | id | nombre |
+----+-----------+---------+-------+----+--------+
| 1  | Bulbasaur | 3       | 15    | 3  | Planta |

 - Obtener el promedio de niveles de todos los Pokémon.
 sqlite> select avg(nivel) as promedio from pokemon;
+----------+
| promedio |
+----------+
| 44.2     |
+----------+

 - Obtener el nombre del Pokémon de mayor nivel.
 sqlite> select p.nombre as nombre, max(nivel) as nivel from pokemon as p;
+--------+-------+
| nombre | nivel |
+--------+-------+
| Rhydon | 80    |
+--------+-------+

 - Actualizar el nombre de Bulbasaur a "Bulbasaur Nv. 15":
 sqlite> update pokemon set nombre = 'Bulbasaur Nv. 15' where nombre = 'Bulbasaur';
sqlite> select * from pokemon where id = 1;
+----+------------------+---------+-------+
| id |      nombre      | id_tipo | nivel |
+----+------------------+---------+-------+
| 1  | Bulbasaur Nv. 15 | 3       | 15    |
+----+------------------+---------+-------+

 - Obtener los Pokémon cuyo nivel es igual a 50.
sqlite> select p.nombre as nombre, p.nivel as nivel from pokemon as p where p.nivel = 50;
+-----------+-------+
|  nombre   | nivel |
+-----------+-------+
| Charizard | 50    |
+-----------+-------+ 

 - Eliminar todos los Pokémon de nivel 40.
 qlite> select p.nombre as nombre, p.nivel as nivel from pokemon as p where p.nivel = 40;
+-----------+-------+
|  nombre   | nivel |
+-----------+-------+
| Exeggutor | 40    |
+-----------+-------+
sqlite> delete from pokemon where nivel = 40;
sqlite> select p.nombre as nombre, p.nivel as nivel from pokemon as p where p.nivel = 40;

 - Obtener el tipo y nivel de Pikachu.
 sqlite> select p.nombre as nombre, p.nivel as nivel, t.nombre as tipo from pokemon as p, tipo as t where p.nombre = 'Pikachu' and p.id_tipo = t.id;
+---------+-------+-----------+
| nombre  | nivel |   tipo    |
+---------+-------+-----------+
| Pikachu | 15    | Electrico |
+---------+-------+-----------+

 - Obtener los Pokémon de tipo Planta con nivel superior a 20:
 sqlite> select p.nombre as nombre, p.nivel as nivel, t.nombre as tipo from pokemon as p, tipo as t where p.nivel > 20 and t.nombre = 'Planta' and p.id_tipo = t.id;
+----------+-------+--------+
|  nombre  | nivel |  tipo  |
+----------+-------+--------+
| Venusaur | 45    | Planta |
| Venusaur | 70    | Planta |
+----------+-------+--------+

 - Actualizar el tipo de Pikachu a "Eléctrico/Azul":

 - Eliminar todos los Pokémon de tipo Planta.
 sqlite> delete from pokemon where id_tipo = 3

 - Obtener los Pokémon con nombre y tipo ordenados alfabéticamente.
sqlite> select p.nombre as nombre from pokemon as p order by nombre;
+------------+
|   nombre   |
+------------+
| Arcanine   |
| Blastoise  |
| Charizard  |
| Charmander |
| Cubone     |
| Dragonite  |
| Electabuzz |
| Flareon    |
| Flareon    |
| Geodude    |
| Gyarados   |
| Jolteon    |
| Pikachu    |
| Raichu     |
| Rhydon     |
| Rhydon     |
| Sandslash  |
| Squirtle   |
| Vaporeon   |
| Zapdos     |
+------------+
 - Obtén todos los Pokémon cuyos nombres contienen las letras 'sa'.
 sqlite> select p.nombre as nombre from pokemon as p where p.nombre like '%sa%';
+-----------+
|  nombre   |
+-----------+
| Sandslash |
+-----------+

 - Encuentra todos los Pokémon cuyo nivel es 40, 50 o 60.
 sqlite> select p.nombre as nombre, p.nivel as nivel from pokemon as p where p.nivel = 40 or p.nivel = 50 or p.nivel = 60;
+-----------+-------+
|  nombre   | nivel |
+-----------+-------+
| Charizard | 50    |
| Dragonite | 60    |
+-----------+-------+

 - Obtén todos los Pokémon de tipo Fuego cuyos nombres comienzan con la letra 'C'.
 sqlite> select p.nombre as nombre from pokemon as p where p.nombre like 'C%';
+------------+
|   nombre   |
+------------+
| Charmander |
| Cubone     |
| Charizard  |
+------------+

 - Encuentra los nombres y tipos de los Pokémon cuyo nivel es mayor que el promedio de todos los Pokémon en la base de datos.
 sqlite> select p.nombre as nombre, t.nombre as tipo, p.nivel as nivel from pokemon as p, tipo as t where p.nivel > (select avg(nivel) from pokemon) and p.id_tipo = t.id;
+------------+-----------+-------+
|   nombre   |   tipo    | nivel |
+------------+-----------+-------+
| Squirtle   | Agua      | 70    |
| Vaporeon   | Agua      | 70    |
| Gyarados   | Agua      | 70    |
| Charizard  | Fuego     | 50    |
| Blastoise  | Agua      | 70    |
| Electabuzz | Electrico | 48    |
| Rhydon     | Tierra    | 52    |
| Dragonite  | Fuego     | 60    |
| Flareon    | Fuego     | 65    |
| Zapdos     | Electrico | 75    |
| Rhydon     | Tierra    | 80    |
+------------+-----------+-------+