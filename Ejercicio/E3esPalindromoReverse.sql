delimiter //

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

delimiter ;
