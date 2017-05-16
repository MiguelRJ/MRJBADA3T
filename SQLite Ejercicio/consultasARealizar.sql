-- Miguel Rodriguez Jimenez SQLite alquileres
SELECT 'Archivo "consultasARealizar.sql" ----------------------------------------';
SELECT 'Miguel Rodriguez Jimenez SQLite Ejercicio de alquileres';

-- 1- Obtener los arrendatarios que alquilan la casa de calle Cómpeta, 28, 1C
SELECT '1- Obtener los arrendatarios que alquilan la casa de calle Cómpeta, 28, 1C';
	SELECT * FROM arrendatario WHERE dni IN (SELECT arrendatario FROM alquila WHERE id=(SELECT id FROM casa WHERE direccion='Cómpeta, 28, 1C'));

-- 2- ¿Cuánto dinero le deben a María Pérez?
SELECT '2- ¿Cuánto dinero le deben a María Pérez?';
	SELECT sum(deuda) FROM alquila WHERE id IN (SELECT id FROM casa WHERE dueno = (SELECT dni FROM dueno WHERE nombre='María Pérez'));

-- 3- ¿Cuál es la deuda total para cada dueño?
SELECT '3- ¿Cuál es la deuda total para cada dueño?';
	SELECT sum(a.deuda),d.dni, d.nombre FROM alquila a INNER JOIN casa c ON c.id = a.id INNER JOIN dueno d ON d.dni = c.dueno GROUP BY d.dni;

-- 4- Listar todas las personas que hay dadas de alta en la base de datos.
SELECT '4- Listar todas las personas que hay dadas de alta en la base de datos.';
	SELECT * FROM dueno UNION SELECT * FROM arrendatario;

-- 5- Indica los dueños que poseen tres o más casas (con / sin usar agregaciones)
SELECT '5- Indica los dueños que poseen tres o más casas (con / sin usar agregaciones)';
	SELECT * FROM dueno WHERE dni IN (SELECT dueno FROM casa GROUP BY dueno HAVING(count(*) >= 3));

-- 6- Listar los dueños que tengan deudores en todas sus casas.
SELECT '6- Listar los dueños que tengan deudores en todas sus casas.';
	SELECT DISTINCT dni,nombre FROM dueno WHERE dni IN (SELECT DISTINCT dueno FROM casa WHERE NOT dueno IN (SELECT DISTINCT dueno FROM casa WHERE id NOT IN (SELECT DISTINCT id FROM alquila WHERE deuda >0)));

