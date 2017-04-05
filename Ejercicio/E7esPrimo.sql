delimiter //

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

delimiter ;
