Se pide:

    Realiza la carga de la BBDD de Sakila, tal y como se muestra en los enlaces proporcionados.
    Realiza cada una de las siguientes consultas:
        Actores que tienen de primer nombre Scarlett.
        mysql> select * from actor as ac where ac.first_name = 'Scarlett';
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|       81 | SCARLETT   | DAMON     | 2006-02-15 04:34:33 |
|      124 | SCARLETT   | BENING    | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+
        Actores que tienen de apellido Johansson.
        mysql> select * from actor as ac where ac.last_name = 'Johansson';
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|        8 | MATTHEW    | JOHANSSON | 2006-02-15 04:34:33 |
|       64 | RAY        | JOHANSSON | 2006-02-15 04:34:33 |
|      146 | ALBERT     | JOHANSSON | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+
        Actores que contengan una O en su nombre.
        mysql> select * from actor as ac where ac.first_name regexp '[o]';
+----------+-------------+--------------+---------------------+
| actor_id | first_name  | last_name    | last_update         |
+----------+-------------+--------------+---------------------+
|        1 | PENELOPE    | GUINESS      | 2006-02-15 04:34:33 |
|        5 | JOHNNY      | LOLLOBRIGIDA | 2006-02-15 04:34:33 |
|        9 | JOE         | SWANK        | 2006-02-15 04:34:33 |
|       11 | ZERO        | CAGE         | 2006-02-15 04:34:33 |
|       19 | BOB         | FAWCETT      | 2006-02-15 04:34:33 |
|       24 | CAMERON     | STREEP       | 2006-02-15 04:34:33 |
|       28 | WOODY       | HOFFMAN      | 2006-02-15 04:34:33 |
|       38 | TOM         | MCKELLEN     | 2006-02-15 04:34:33 |
|       39 | GOLDIE      | BRODY        | 2006-02-15 04:34:33 |
|       40 | JOHNNY      | CAGE         | 2006-02-15 04:34:33 |
|       41 | JODIE       | DEGENERES    | 2006-02-15 04:34:33 |
|       42 | TOM         | MIRANDA      | 2006-02-15 04:34:33 |
|       54 | PENELOPE    | PINKETT      | 2006-02-15 04:34:33 |
|       63 | CAMERON     | WRAY         | 2006-02-15 04:34:33 |
|       78 | GROUCHO     | SINATRA      | 2006-02-15 04:34:33 |
|       82 | WOODY       | JOLIE        | 2006-02-15 04:34:33 |
|       91 | CHRISTOPHER | BERRY        | 2006-02-15 04:34:33 |
|      104 | PENELOPE    | CRONYN       | 2006-02-15 04:34:33 |
|      106 | GROUCHO     | DUNST        | 2006-02-15 04:34:33 |
|      111 | CAMERON     | ZELLWEGER    | 2006-02-15 04:34:33 |
|      113 | MORGAN      | HOPKINS      | 2006-02-15 04:34:33 |
|      114 | MORGAN      | MCDORMAND    | 2006-02-15 04:34:33 |
|      115 | HARRISON    | BALE         | 2006-02-15 04:34:33 |
|      120 | PENELOPE    | MONROE       | 2006-02-15 04:34:33 |
|      137 | MORGAN      | WILLIAMS     | 2006-02-15 04:34:33 |
|      140 | WHOOPI      | HURT         | 2006-02-15 04:34:33 |
|      151 | GEOFFREY    | HESTON       | 2006-02-15 04:34:33 |
|      162 | OPRAH       | KILMER       | 2006-02-15 04:34:33 |
|      163 | CHRISTOPHER | WEST         | 2006-02-15 04:34:33 |
|      171 | OLYMPIA     | PFEIFFER     | 2006-02-15 04:34:33 |
|      172 | GROUCHO     | WILLIAMS     | 2006-02-15 04:34:33 |
|      176 | JON         | CHASE        | 2006-02-15 04:34:33 |
|      188 | ROCK        | DUKAKIS      | 2006-02-15 04:34:33 |
|      191 | GREGORY     | GOODING      | 2006-02-15 04:34:33 |
|      192 | JOHN        | SUVARI       | 2006-02-15 04:34:33 |
|      200 | THORA       | TEMPLE       | 2006-02-15 04:34:33 |
+----------+-------------+--------------+---------------------+
        Actores que contengan una O en su nombre y en una A en su apellido.
        mysql> select * from actor as ac where ac.first_name regexp '[o]' and ac.last_name regexp '[a]';
+----------+------------+--------------+---------------------+
| actor_id | first_name | last_name    | last_update         |
+----------+------------+--------------+---------------------+
|        5 | JOHNNY     | LOLLOBRIGIDA | 2006-02-15 04:34:33 |
|        9 | JOE        | SWANK        | 2006-02-15 04:34:33 |
|       11 | ZERO       | CAGE         | 2006-02-15 04:34:33 |
|       19 | BOB        | FAWCETT      | 2006-02-15 04:34:33 |
|       28 | WOODY      | HOFFMAN      | 2006-02-15 04:34:33 |
|       40 | JOHNNY     | CAGE         | 2006-02-15 04:34:33 |
|       42 | TOM        | MIRANDA      | 2006-02-15 04:34:33 |
|       63 | CAMERON    | WRAY         | 2006-02-15 04:34:33 |
|       78 | GROUCHO    | SINATRA      | 2006-02-15 04:34:33 |
|      114 | MORGAN     | MCDORMAND    | 2006-02-15 04:34:33 |
|      115 | HARRISON   | BALE         | 2006-02-15 04:34:33 |
|      137 | MORGAN     | WILLIAMS     | 2006-02-15 04:34:33 |
|      172 | GROUCHO    | WILLIAMS     | 2006-02-15 04:34:33 |
|      176 | JON        | CHASE        | 2006-02-15 04:34:33 |
|      188 | ROCK       | DUKAKIS      | 2006-02-15 04:34:33 |
|      192 | JOHN       | SUVARI       | 2006-02-15 04:34:33 |
+----------+------------+--------------+---------------------+
        Actores que contengan dos O en su nombre y en una A en su apellido.
        mysql> select * from actor as ac where ac.first_name regexp 'o{2}';
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|       28 | WOODY      | HOFFMAN   | 2006-02-15 04:34:33 |
|       82 | WOODY      | JOLIE     | 2006-02-15 04:34:33 |
|      140 | WHOOPI     | HURT      | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+
        Actores donde su tercera letra sea B.
        mysql> select * from actor as ac where ac.first_name regexp '..b';
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|       15 | CUBA       | OLIVIER   | 2006-02-15 04:34:33 |
|       19 | BOB        | FAWCETT   | 2006-02-15 04:34:33 |
|      118 | CUBA       | ALLEN     | 2006-02-15 04:34:33 |
|      125 | ALBERT     | NOLTE     | 2006-02-15 04:34:33 |
|      146 | ALBERT     | JOHANSSON | 2006-02-15 04:34:33 |
|      182 | DEBBIE     | AKROYD    | 2006-02-15 04:34:33 |
|      189 | CUBA       | BIRCH     | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+
        Ciudades que empiezan por a.
        mysql> select * from city as ct where ct.city regexp '^A';
+---------+-------------------------+------------+---------------------+
| city_id | city                    | country_id | last_update         |
+---------+-------------------------+------------+---------------------+
|       1 | A Coruña (La Coruña)    |         87 | 2006-02-15 04:45:25 |
|       2 | Abha                    |         82 | 2006-02-15 04:45:25 |
|       3 | Abu Dhabi               |        101 | 2006-02-15 04:45:25 |
|       4 | Acuña                   |         60 | 2006-02-15 04:45:25 |
|       5 | Adana                   |         97 | 2006-02-15 04:45:25 |
|       6 | Addis Abeba             |         31 | 2006-02-15 04:45:25 |
|       7 | Aden                    |        107 | 2006-02-15 04:45:25 |
|       8 | Adoni                   |         44 | 2006-02-15 04:45:25 |
|       9 | Ahmadnagar              |         44 | 2006-02-15 04:45:25 |
|      10 | Akishima                |         50 | 2006-02-15 04:45:25 |
|      11 | Akron                   |        103 | 2006-02-15 04:45:25 |
|      12 | al-Ayn                  |        101 | 2006-02-15 04:45:25 |
|      13 | al-Hawiya               |         82 | 2006-02-15 04:45:25 |
|      14 | al-Manama               |         11 | 2006-02-15 04:45:25 |
|      15 | al-Qadarif              |         89 | 2006-02-15 04:45:25 |
|      16 | al-Qatif                |         82 | 2006-02-15 04:45:25 |
|      17 | Alessandria             |         49 | 2006-02-15 04:45:25 |
|      18 | Allappuzha (Alleppey)   |         44 | 2006-02-15 04:45:25 |
|      19 | Allende                 |         60 | 2006-02-15 04:45:25 |
|      20 | Almirante Brown         |          6 | 2006-02-15 04:45:25 |
|      21 | Alvorada                |         15 | 2006-02-15 04:45:25 |
|      22 | Ambattur                |         44 | 2006-02-15 04:45:25 |
|      23 | Amersfoort              |         67 | 2006-02-15 04:45:25 |
|      24 | Amroha                  |         44 | 2006-02-15 04:45:25 |
|      25 | Angra dos Reis          |         15 | 2006-02-15 04:45:25 |
|      26 | Anápolis                |         15 | 2006-02-15 04:45:25 |
|      27 | Antofagasta             |         22 | 2006-02-15 04:45:25 |
|      28 | Aparecida de Goiânia    |         15 | 2006-02-15 04:45:25 |
|      29 | Apeldoorn               |         67 | 2006-02-15 04:45:25 |
|      30 | Araçatuba               |         15 | 2006-02-15 04:45:25 |
|      31 | Arak                    |         46 | 2006-02-15 04:45:25 |
|      32 | Arecibo                 |         77 | 2006-02-15 04:45:25 |
|      33 | Arlington               |        103 | 2006-02-15 04:45:25 |
|      34 | Ashdod                  |         48 | 2006-02-15 04:45:25 |
|      35 | Ashgabat                |         98 | 2006-02-15 04:45:25 |
|      36 | Ashqelon                |         48 | 2006-02-15 04:45:25 |
|      37 | Asunción                |         73 | 2006-02-15 04:45:25 |
|      38 | Athenai                 |         39 | 2006-02-15 04:45:25 |
|      39 | Atšinsk                 |         80 | 2006-02-15 04:45:25 |
|      40 | Atlixco                 |         60 | 2006-02-15 04:45:25 |
|      41 | Augusta-Richmond County |        103 | 2006-02-15 04:45:25 |
|      42 | Aurora                  |        103 | 2006-02-15 04:45:25 |
|      43 | Avellaneda              |          6 | 2006-02-15 04:45:25 |
+---------+-------------------------+------------+---------------------+
        Ciudades que acaban por s.
        mysql> select * from city as ct where ct.city regexp 's%';
        Ciudades del country 61.
        mysql> select * from city as ct where ct.city_id = 61;
+---------+--------+------------+---------------------+
| city_id | city   | country_id | last_update         |
+---------+--------+------------+---------------------+
|      61 | Baybay |         75 | 2006-02-15 04:45:25 |
+---------+--------+------------+---------------------+
        Ciudades del country Spain.
        mysql> select * from country as cou join city as ct on cou.country_id = ct.city_id and cou.country = 'Spain';
+------------+---------+---------------------+---------+------------+------------+---------------------+
| country_id | country | last_update         | city_id | city       | country_id | last_update         |
+------------+---------+---------------------+---------+------------+------------+---------------------+
|         87 | Spain   | 2006-02-15 04:44:00 |      87 | Botshabelo |         85 | 2006-02-15 04:45:25 |
+------------+---------+---------------------+---------+------------+------------+---------------------+
        Ciudades con nombres compuestos.
        
        Películas con una duración entre 80 y 100.
        Peliculas con un rental_rate entre 1 y 3.
        Películas con un titulo de más de 12 letras.
        Peliculas con un rating de PG o G.
        Peliculas que no tengan un rating de NC-17.
        Peliculas con un rating PG y duracion de más de 120.
        ¿Cuantos actores hay?
        ¿Cuántas ciudades tiene el country Spain?
        ¿Cuántos countries hay que empiezan por a?
        Media de duración de peliculas con PG.
        Suma de rental_rate de todas las peliculas.
        Pelicula con mayor duración.
        Película con menor duración.
        Mostrar las ciudades del country Spain (multitabla).
        Mostrar el nombre de la película y el nombre de los actores.
        Mostrar el nombre de la película y el de sus categorías.
        Mostrar el country, la ciudad y dirección de cada miembro del staff.
        Mostrar el country, la ciudad y dirección de cada customer.
        Numero de películas de cada rating
        Cuantas películas ha realizado el actor ED CHASE.
        Media de duración de las películas cada categoría.
