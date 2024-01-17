CREATE TABLE empleados (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    salario REAL,
    departamento TEXT
);

INSERT INTO empleados (nombre, salario, departamento) VALUES ('Juan', 50000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('María', 60000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carlos', 55000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Ana', 48000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Pedro', 70000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Laura', 52000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Javier', 48000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carmen', 65000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Miguel', 51000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Elena', 55000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Diego', 72000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Sofía', 49000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Andrés', 60000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Isabel', 53000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Raúl', 68000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Patricia', 47000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Alejandro', 71000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Natalia', 54000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Roberto', 49000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Beatriz', 63000, 'TI');



-- Sentencias:



--Funciones UPPER y LOWER:
--Muestra el nombre de todos los empleados en mayúsculas.

sqlite> select upper(nombre) from empleados;
+---------------+
| upper(nombre) |
+---------------+
| JUAN          |
| MARíA         |
| CARLOS        |


--Funciones Numéricas:
--Calcula el valor absoluto del salario de todos los empleados.

sqlite> select abs(salario) from empleados;
+--------------+
| abs(salario) |
+--------------+
| 50000.0      |
| 60000.0      |
| 55000.0      |



--Funciones de Fecha y Hora:
--Muestra la fecha actual.

sqlite> select current_date from empleados;
+--------------+
| current_date |
+--------------+
| 2024-01-17   |
| 2024-01-17   |
| 2024-01-17   |



--Funciones de Agregación:
--Calcula el promedio de salarios de todos los empleados.
sqlite> select avg(salario) from empleados;
+--------------+
| avg(salario) |
+--------------+
| 57000.0      |
+--------------+

--Convierte la cadena '123' a un valor entero.
sqlite> select cast('123' as integer) as numero;
+--------+
| numero |
+--------+
| 123    |
+--------+

--Funciones de Manipulación de Cadenas:
--Concatena el nombre y el departamento de cada empleado.
sqlite> select nombre || ' ' || departamento as name_dep from empleados;
+---------------------------+
|         name_dep          |
+---------------------------+
| Juan Ventas               |
| María TI                  |
| Carlos Ventas             |



--Funciones de Manipulación de Cadenas (CONCAT_WS):
--Concatena el nombre y el departamento de cada empleado con un guion como separador.

sqlite> select nombre || '-' || departamento as name_dep from empleados;
+---------------------------+
|         name_dep          |
+---------------------------+
| Juan-Ventas               |
| María-TI                  |
| Carlos-Ventas             |



--Funciones de Control de Flujo (CASE):
--Categoriza a los empleados según sus salarios.

sqlite> select salario from empleados order by salario;
+---------+
| salario |
+---------+
| 47000.0 |
| 48000.0 |
| 48000.0 |



--Funciones de Agregación (SUM):
--Calcula la suma total de salarios de todos los empleados.
sqlite> select sum(salario) from empleados;
+--------------+
| sum(salario) |
+--------------+
| 1140000.0    |
+--------------+



--Funciones Numéricas (ROUND):
--Redondea el salario de todos los empleados a dos decimales.

sqlite> select round(salario,2) as salario from empleados;
+---------+
| salario |
+---------+
| 50000.0 |
| 60000.0 |
| 55000.0 |



--Funciones de Manipulación de Cadenas (LENGTH):
--Muestra la longitud de cada nombre de empleado.
sqlite> select length(nombre) as longitud from empleados;
+----------+
| longitud |
+----------+
| 4        |
| 5        |
| 6        |



--Funciones de Agregación (COUNT):
--Cuenta el número total de empleados en cada departamento.

sqlite> select departamento,count(departamento) as departamento from empleados g
roup by departamento;
+------------------+--------------+
|   departamento   | departamento |
+------------------+--------------+
| Recursos Humanos | 6            |
| TI               | 7            |
| Ventas           | 7            |
+------------------+--------------+



--Funciones de Fecha y Hora (CURRENT_TIME):
--Muestra la hora actual.
sqlite> select current_time as 'hora actual';
+-------------+
| hora actual |
+-------------+
| 19:27:45    |
+-------------+



--Funciones de Conversión (CAST):
--Convierte el salario a un valor de punto flotante.

sqlite> select cast(salario as float) as salario from empleados;
+---------+
| salario |
+---------+
| 50000.0 |
| 60000.0 |
| 55000.0 |



--Funciones de Manipulación de Cadenas (SUBSTR):
--Muestra los primeros tres caracteres de cada nombre de empleado.

sqlite> select nombre, substr(nombre, 1, 3) as nombre from empleados;
+-----------+--------+
|  nombre   | nombre |
+-----------+--------+
| Juan      | Jua    |
| María     | Mar    |
| Carlos    | Car    |



Order By and Like.

--Empleados en el departamento de 'Ventas' con salarios superiores a 52000.
sqlite> select nombre,departamento,salario from empleados where departamento = 'Ventas' and salario > 52000;
+---------+--------------+---------+
| nombre  | departamento | salario |
+---------+--------------+---------+
| Carlos  | Ventas       | 55000.0 |
| Raúl    | Ventas       | 68000.0 |
| Natalia | Ventas       | 54000.0 |
+---------+--------------+---------+

--Empleados cuyos nombres contienen la letra 'a' y tienen salarios ordenados de manera ascendente.
sqlite> select nombre, salario from empleados where nombre regexp 'a' and salario order by salario desc;
+-----------+---------+
|  nombre   | salario |
+-----------+---------+
| Alejandro | 71000.0 |
| Raúl      | 68000.0 |
| Carmen    | 65000.0 |
--Empleados en el departamento 'Recursos Humanos' con salarios entre 45000 y 55000.
sqlite> select nombre, departamento,salario from empleados where departamento = 'Recursos Humanos' and salario between 45000 and 55000;
+----------+------------------+---------+
|  nombre  |   departamento   | salario |
+----------+------------------+---------+
| Ana      | Recursos Humanos | 48000.0 |
| Javier   | Recursos Humanos | 48000.0 |
| Elena    | Recursos Humanos | 55000.0 |
| Patricia | Recursos Humanos | 47000.0 |
| Roberto  | Recursos Humanos | 49000.0 |
+----------+------------------+---------+
--Empleados con salarios en orden descendente, limitando a los primeros 5 resultados.
sqlite> select nombre, salario from empleados salario order by salario desc limit 5;
+-----------+---------+
|  nombre   | salario |
+-----------+---------+
| Diego     | 72000.0 |
| Alejandro | 71000.0 |
| Pedro     | 70000.0 |
| Raúl      | 68000.0 |
| Carmen    | 65000.0 |
+-----------+---------+
--Empleados cuyos nombres comienzan con 'M' o 'N' y tienen salarios superiores a 50000.
sqlite> select nombre, salario from empleados where nombre regexp '^M' or nombre regexp '^N' and salario > 50000;
+---------+---------+
| nombre  | salario |
+---------+---------+
| María   | 60000.0 |
| Miguel  | 51000.0 |
| Natalia | 54000.0 |
+---------+---------+
--Empleados en el departamento 'TI' o 'Ventas' ordenados alfabéticamente por nombre.
sqlite> select nombre,departamento from empleados where departamento = 'TI' or departamento = 'Ventas' order by nombre;
+-----------+--------------+
|  nombre   | departamento |
+-----------+--------------+
| Alejandro | TI           |
| Beatriz   | TI           |
| Carlos    | Ventas       |
--Empleados con salarios únicos (eliminando duplicados) en orden ascendente.
--Empleados cuyos nombres terminan con 'o' o 'a' y están en el departamento 'Ventas'.
--Empleados con salarios fuera del rango de 55000 a 70000, ordenados por departamento.
--Empleados en el departamento 'Recursos Humanos' con nombres que no contienen la letra 'e'.



































