delimiter //

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

delimiter ;
