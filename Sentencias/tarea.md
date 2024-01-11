-- Creación de tablas

    Tabla Propietarios
sqlite> create table Propietarios (
   ...> ID integer primary key autoincrement,
   ...> Nombre text not null,
   ...> Apellido text not null,
   ...> DNI unicode
   ...> );

    Tabla Vehiculos
sqlite> create table Vehiculos (
   ...> ID integer primary key autoincrement,
   ...> Marca text not null,
   ...> Modelo text not null,
   ...> Año integer not null,
   ...> ID_Propietarios integer references Propietarios(ID)
   ...> );


-- Creación de los Inserts

    Inserts Propietarios

sqlite> insert into Propietarios (ID,Nombre,Apellido,DNI) values (1,'Juan','Pere
z','12345678A');
sqlite> insert into Propietarios (ID,Nombre,Apellido,DNI) values (2,'Maria','Lop
ez','87654321B');
sqlite> insert into Propietarios (ID,Nombre,Apellido,DNI) values (3,'Carlos','Ruiz','11111111C');
sqlite> insert into Propietarios (ID,Nombre,Apellido,DNI) values (4,'Laura','Gomez','22222222D');
sqlite> insert into Propietarios (ID,Nombre,Apellido,DNI) values (5,'Pedro','Mar
tinez','33333333E');
sqlite> insert into Propietarios (ID,Nombre,Apellido,DNI) values (6,'Ana','Ferna
ndez','44444444F');
sqlite> insert into Propietarios (ID,Nombre,Apellido,DNI) values (7,'Diego','San
chez','55555555G');
sqlite> insert into Propietarios (ID,Nombre,Apellido,DNI) values (8,'Sofía','Tor
res','66666666H');
sqlite> insert into Propietarios (ID,Nombre,Apellido,DNI) values (9,'Javier','Le
on','77777777I');
sqlite> insert into Propietarios (ID,Nombre,Apellido,DNI) values (10,'Lucía','Ca
stillo','88888888J');
sqlite> insert into Propietarios (ID,Nombre,Apellido,DNI) values (11,'Luis','Gon
zalez','99999999K');
sqlite> insert into Propietarios (ID,Nombre,Apellido,DNI) values (12,'Marta','Di
az','10101010L');
sqlite> insert into Propietarios (ID,Nombre,Apellido,DNI) values (13,'Victor','V
argas','11111112M');
sqlite> insert into Propietarios (ID,Nombre,Apellido,DNI) values (14,'Elena','Ca
stro','12121212N');
sqlite> insert into Propietarios (ID,Nombre,Apellido,DNI) values (15,'Roberto','
Blanco','13131313O');
sqlite> insert into Propietarios (ID,Nombre,Apellido,DNI) values (16,'Natalia','
Paredes','14141414P');
sqlite> insert into Propietarios (ID,Nombre,Apellido,DNI) values (17,'Fernando',
'Herrera','15151515Q');
sqlite> insert into Propietarios (ID,Nombre,Apellido,DNI) values (18,'Clara','So
to','16161616R');
sqlite> insert into Propietarios (ID,Nombre,Apellido,DNI) values (19,'Sergio','M
endoza','17171717R');
sqlite> insert into Propietarios (ID,Nombre,Apellido,DNI) values (20,'Patricia',
'Navarro','18181818T');

    Inserts Vehículos

INSERT INTO Vehiculos VALUES(1,'Ford','Fiesta',2019,1);
INSERT INTO Vehiculos VALUES(2,'Toyota','Corolla',2018,2);
INSERT INTO Vehiculos VALUES(3,'Nissan','Sentra',2020,3);
INSERT INTO Vehiculos VALUES(4,'Chevrolet','Spark',2017,4);
INSERT INTO Vehiculos VALUES(5,'Honda','Civic',2016,5);
INSERT INTO Vehiculos VALUES(6,'Ford','Mustang',2021,6);
INSERT INTO Vehiculos VALUES(7,'Toyota','RAV4',2019,7);
INSERT INTO Vehiculos VALUES(8,'Volkswagen','Golf',2020,8);
INSERT INTO Vehiculos VALUES(9,'Honda','CR-V',2018,9);
INSERT INTO Vehiculos VALUES(10,'Nissan','Altima',2017,10);
INSERT INTO Vehiculos VALUES(11,'Chevrolet','Malibu',2019,11);
INSERT INTO Vehiculos VALUES(12,'Toyota','Camry',2020,12);
INSERT INTO Vehiculos VALUES(13,'Honda','Accord',2018,13);
INSERT INTO Vehiculos VALUES(14,'Ford','Explorer',2021,14);
INSERT INTO Vehiculos VALUES(15,'Nissan','Rogue',2017,15);
INSERT INTO Vehiculos VALUES(16,'Volkswagen','Jetta',2019,16);
INSERT INTO Vehiculos VALUES(17,'Chevrolet','Equinox',2018,17);
INSERT INTO Vehiculos VALUES(18,'Toyota','Highlander',2020,18);
INSERT INTO Vehiculos VALUES(19,'Honda','Odyssey',2016,19);
INSERT INTO Vehiculos VALUES(20,'Nissan','Murano',2019,20);

-- Tips

En mi caso se me olvidó rellenar la columna ID_Propietario, por lo que antes de borrar todo lo que hay en la tabla donde tengo el error ejecuto los siguientes comandos:

sqlite> .output export.sql
Este comando lo que hace es volcar toda la información que tenemos en nuestra base de datos en un fichero a elegir añadiendo la extensión ".sql"
sqlite> .dump 
Aquí con este comando volcamos toda la información que queremos de nuestra base de datos, en mi caso, todo
sqlite> .exit
Salimos de la base de datos.
En nuestro IDE veremos el fichero que creamos con la extension ".sql" donde está toda la información de nuestra base de datos.
Vamos a los Inserts donde cometí el error, y lo rellenamos con los datos correspondientes.
Copiamos todos los Inserts y regresamos a nuestra base de datos, pegamos los Inserts nuevos modificados y ejecutamos, hemos rellenado todos los Inserts sin necesidad de ir uno por uno.

sqlite> select * from Vehiculos where Marca = 'Ford' and Modelo = 'Fiesta';
┌────┬───────┬────────┬──────┬─────────────────┐
│ ID │ Marca │ Modelo │ Año  │ ID_Propietarios │
├────┼───────┼────────┼──────┼─────────────────┤
│ 1  │ Ford  │ Fiesta │ 2019 │ 1               │
└────┴───────┴────────┴──────┴─────────────────┘
sqlite> select * from Propietarios where DNI = '12345678A';
┌────┬────────┬──────────┬───────────┐
│ ID │ Nombre │ Apellido │    DNI    │
├────┼────────┼──────────┼───────────┤
│ 1  │ Juan   │ Perez    │ 12345678A │
└────┴────────┴──────────┴───────────┘
sqlite> select * from Vehiculos where ID_Propietarios = '5';
┌────┬───────┬────────┬──────┬─────────────────┐
│ ID │ Marca │ Modelo │ Año  │ ID_Propietarios │
├────┼───────┼────────┼──────┼─────────────────┤
│ 5  │ Honda │ Civic  │ 2016 │ 5               │
└────┴───────┴────────┴──────┴─────────────────┘
sqlite> 

sqlite> select * from Propietarios where Apellido = 'Perez';
┌────┬────────┬──────────┬───────────┐
│ ID │ Nombre │ Apellido │    DNI    │
├────┼────────┼──────────┼───────────┤
│ 1  │ Juan   │ Perez    │ 12345678A │
└────┴────────┴──────────┴───────────┘
sqlite> select * from Vehiculos where Año = '2019';
┌────┬────────────┬────────┬──────┬─────────────────┐
│ ID │   Marca    │ Modelo │ Año  │ ID_Propietarios │
├────┼────────────┼────────┼──────┼─────────────────┤
│ 1  │ Ford       │ Fiesta │ 2019 │ 1               │
│ 7  │ Toyota     │ RAV4   │ 2019 │ 7               │
│ 11 │ Chevrolet  │ Malibu │ 2019 │ 11              │
│ 16 │ Volkswagen │ Jetta  │ 2019 │ 16              │
│ 20 │ Nissan     │ Murano │ 2019 │ 20              │
└────┴────────────┴────────┴──────┴─────────────────┘