delimiter //

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

delimiter ;
