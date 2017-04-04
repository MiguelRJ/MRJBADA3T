delimiter //

drop function if exists esPalindromo//

create function esPalindromo(cadena varchar(255))
returns bool
comment 'comprueba si una cadena es palindromo 0 falso 1 true'
DETERMINISTIC
begin
	declare cadena2 varchar(255) default '';
	declare contador int default 0;
	declare lenght int default 0;
	set lenght = CHAR_LENGTH(cadena);
	
	WHILE contador <= lenght DO
		set cadena2 = concat(cadena2,(select substr(cadena,lenght,1)));
		set lenght = lenght-1;
	END WHILE;

	IF cadena = cadena2 THEN
		return true;
	ELSE
		return false;
	END IF;
end//

drop function if exists esPalindromoReverse//

create function esPalindromoReverse(cadena varchar(255))
returns bool
comment 'comprueba si una cadena es palindromo 0 falso 1 true'
DETERMINISTIC
begin
	IF cadena = reverse(cadena) THEN
		return true;
	ELSE
		return false;
	END if;
end//

delimiter ;
