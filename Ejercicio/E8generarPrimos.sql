delimiter //

drop procedure if exists generarPrimos//

create procedure generarPrimos(m int, out salida int)
comment 'muestra m numeros primos, y salida muestra el numero total mostrado'
begin
	declare numSeguidos int default 2;
	declare numDePrimos int default 0;
	-- ############################## calcular primos del ejercicio 7
	declare contador int default 2;
	declare divisor bool default true;

	truncate primos;
	WHILE numSeguidos <= m DO
		WHILE contador <= numSeguidos/2 DO
			IF (numSeguidos % contador = 0) THEN
				set divisor = false;
			END IF;
			set contador=contador+1;
		END WHILE;
	-- ##############################

		IF divisor is true THEN
			insert into primos (numero) values (numSeguidos);
			set numDePrimos = numDePrimos+1;
		END IF;

		set divisor = true;
		set contador = 2;
		set numSeguidos = numSeguidos+1;

	END WHILE;
	set salida = numDePrimos;
end//

delimiter ;
