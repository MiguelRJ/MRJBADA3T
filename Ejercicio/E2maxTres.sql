delimiter //

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

delimiter ;
