delimiter //

drop function if exists esPrimo//

create function esPrimo(numero int)
returns bool
comment 'Comprueba si un numero es primo o no'
DETERMINISTIC
begin
	declare encontrarDivisor bool;
	declare contador int;
	set encontrarDivisor = true;
	set contador = 2;
	IF numero < 2 THEN
		return null;
	ELSE
		WHILE contador <= numero/2 DO
			IF (numero % contador = 0) THEN
				set encontrarDivisor = false;
				return encontrarDivisor;
			END IF;
			set contador=contador+1;
		END WHILE;
	END IF;
	return encontrarDivisor;
end//

delimiter ;
