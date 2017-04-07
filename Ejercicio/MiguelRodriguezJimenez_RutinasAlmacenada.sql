delimiter //

-- Ejercicio1 diaSemana(n int) #############################
drop function if exists diaSemana//

create function diaSemana(n int)
returns varchar(10)
comment 'Recibe un numero entero entre 1 y 7 y devuelve el dia de la semana, si lo introducido no es [1-7] devuelve null'
DETERMINISTIC
begin
	declare nombreSemana varchar(10) default null;
	CASE n
		when 1 then
			set nombreSemana='Lunes';
		when 2 then
			set nombreSemana='Martes';
		when 3 then
			set nombreSemana='Miercoles';
		when 4 then
			set nombreSemana='Jueves';
		when 5 then
			set nombreSemana='Viernes';
		when 6 then
			set nombreSemana='Sabado';
		when 7 then
			set nombreSemana='Domingo';
		else
			set nombreSemana=null;
	END CASE;
	return nombreSemana;
end//

-- Ejercicio2 maxTres(n1 int, n2 int, n3 int) ########################
drop function if exists maxTres//

create function maxTres(n1 int, n2 int, n3 int)
returns int
comment 'Recibe tres numeros y devuelve el mayor de los tres'
DETERMINISTIC
begin
	IF n1 > n2 and n1 > n3 THEN
		return n1;
	ELSEIF n2 > n1 and n2 > n3 THEN
		return n2;
	ELSE
		return n3;
	END IF;
end//

-- Ejercico3.1 esPalindromo(cadena varchar(255)) ####################
drop function if exists esPalindromo//

create function esPalindromo(cadena varchar(255))
returns bool
comment 'comprueba si una cadena es palindromo 0 falso 1 true'
DETERMINISTIC
begin
	declare cadena2 varchar(255) default '';
	declare contador int default 0;
	declare caracter char(1) default ' ';
	declare caracterInvalido char(1) default ' ';
	declare lenght int default 0;
	set lenght = CHAR_LENGTH(cadena);
	
	WHILE contador <= lenght DO
		set caracter = (select substr(cadena,lenght,1));
		IF caracter <> caracterInvalido THEN
			set cadena2 = concat(cadena2,caracter);		
		END IF;
		set lenght = lenght-1;
	END WHILE;

	IF replace(cadena," ","") = cadena2 THEN
		return true;
	ELSE
		return false;
	END IF;
end//

-- Ejercicio3.2 esPalindromoReverse(cadena varchar(255)) ############
drop function if exists esPalindromoReverse//

create function esPalindromoReverse(cadena varchar(255))
returns bool
comment 'comprueba si una cadena es palindromo 0 falso 1 true'
DETERMINISTIC
begin
	IF replace(cadena," ","") = replace(reverse(cadena)," ","") THEN
		return true;
	ELSE
		return false;
	END if;
end//

-- Ejercicio4 actualizarPuntos() ###########################
drop procedure if exists actualizarPuntos//

create procedure actualizarPuntos()
comment 'Actualizar puntos'
begin
	declare puntosLocal int default 0;
	declare puntosVisit int default 0;
	declare contador int default 1;
	declare numMaxEquipo int default 0;
	declare puntosSuma int default 0;

	set numMaxEquipo = (select max(id) from equipo);
	
	WHILE contador <= numMaxEquipo DO
		set puntosLocal = (select sum(substring_index(resultado,'-',1)) from partido where elocal = contador);
		set puntosVisit = (select sum(substring_index(resultado,'-',-1)) from partido where evisitante = contador);

		IF puntosLocal is null THEN
			set puntosSuma = puntosVisit;
		ELSEIF puntosVisit is null THEN
			set puntosSuma = puntosLocal;
		ELSE
			set puntosSuma = puntosLocal+PuntosVisit;
		END IF;

		update equipo set puntos=puntosSuma where id=contador;
		set contador = contador+1;
	END WHILE;
	select id,nombre,ciudad,puntos from equipo;
end//

-- Ejercicio5 sumaN(n int) #####################################
drop function if exists sumaN//

create function sumaN(n int)
returns int
comment 'devuelve la suma de los n primeros numeros indicados'
DETERMINISTIC
begin
	declare numero int default 0;
	declare suma int default 0;

	WHILE n > 0 DO
		set numero = numero + 1;
		set suma = suma + numero;
		set n = n-1;
	END WHILE;
	return suma;
end//

-- Ejercicio6 sucesion(m int) ##################################
drop function if exists sucesion//

create function sucesion(m int)
returns decimal(20,19)
comment 'devuelve la sucesion de 1/n numeros'
DETERMINISTIC
begin
	declare suma decimal(20,19) default 0;
	WHILE m > 1 DO
		set suma = suma + 1/m;
		set m = m-1;
	END WHILE;
	return suma;
end//

-- Ejercicio7 esPrimo(n int) ###################################
drop function if exists esPrimo//

create function esPrimo(n int)
returns bool
comment 'Funcion que determina si un numero es primo o no '
DETERMINISTIC
begin
	declare contador int default 2;
	declare divisor bool default true;
	IF n < 2 THEN
		return null;
	ELSE
		WHILE contador <= n/2 DO
			IF (n % contador = 0) THEN
				set divisor = false;
				return divisor;
			END IF;
			set contador=contador+1;
		END WHILE;
	END IF;
	return divisor;
end//

-- Ejercicio8 generarPrimos(m int,out salida int) ######################
drop procedure if exists generarPrimos//

create table if not exists prueba.primos (numero int)//

create procedure generarPrimos(m int, out salida int)
comment 'muestra m numeros primos, y salida muestra el numero total mostrado'
begin
	declare numSeguidos int default 2;
	declare numDePrimos int default 0;

	-- ############################## calcular primos del ejercicio 7
	declare contador int default 2;
	declare divisor bool default true;

	truncate prueba.primos;
	WHILE numSeguidos <= m DO
		WHILE contador <= numSeguidos/2 DO
			IF (numSeguidos % contador = 0) THEN
				set divisor = false;
			END IF;
			set contador=contador+1;
		END WHILE;
	-- ############################## 

		IF divisor is true THEN
			insert into prueba.primos (numero) values (numSeguidos);
			set numDePrimos = numDePrimos+1;
		END IF;

		set divisor = true;
		set contador = 2;
		set numSeguidos = numSeguidos+1;

	END WHILE;
	set salida = numDePrimos;
end//

-- Ejercicio9 encriptar(cadena varchar(255)) ############################
drop procedure if exists encriptar//

create procedure encriptar(cadena varchar(255))
comment 'devuele la cadena encriptada un caracter mas del ascii'
begin
	declare cadena2 varchar(255) default '';
	declare caracter char(1) default ' ';
	declare numCaracter int default 0;
	declare lenCadena int default 0;
	declare contador int default 1;

	set lenCadena = CHAR_LENGTH(cadena);

	WHILE contador <= lenCadena DO
		set caracter = substr(cadena,contador,1);
		set numCaracter = ASCII(caracter);
		set cadena2 = concat(cadena2,CHAR(numCaracter+1));
		set contador = contador+1;
	END WHILE;
	select cadena2;
end//

-- Ejercicio10 puntosMes(n int) ################################
drop procedure if exists puntosMes//

create procedure puntosMes(n int)
comment 'Calculo los puntos al mes de cada equipo, crea la table si no esta creada, la muestra y la elimina.'
begin
	declare puntosLocal int default 0;
	declare puntosVisit int default 0;
	declare contador int default 1;
	declare numMaxEquipo int default 0;
	declare puntosSuma int default 0;
	
	IF n BETWEEN 1 and 12 THEN
		drop table if exists puntosMes;
		create temporary table puntosMes (id int,puntos int);
		set numMaxEquipo = (select max(id) from equipo);
	
		WHILE contador <= numMaxEquipo DO
			set puntosLocal = (select sum(substring_index(resultado,'-',1)) from partido where elocal = contador and substring_index(substring_index(fecha,'-',2),'-',-1) = n);
			set puntosVisit = (select sum(substring_index(resultado,'-',-1)) from partido where evisitante = contador and substring_index(substring_index(fecha,'-',2),'-',-1) = n);

			IF puntosLocal is null and puntosVisit is null THEN
				set puntosSuma = 0;
			ELSEIF puntosLocal is null THEN
				set puntosSuma = puntosVisit;
			ELSEIF puntosVisit is null THEN
				set puntosSuma = puntosLocal;
			ELSE
				set puntosSuma = puntosLocal+PuntosVisit;
			END IF;
		
			insert into puntosMes (id, puntos) values (contador, puntosSuma);
			set contador = contador+1;
		END WHILE;
		select * from puntosMes;
		drop table puntosMes;
	ELSE
		select 'Parametro incorrecto';
	END IF;
end//

delimiter ;
