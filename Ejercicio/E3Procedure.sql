delimiter //

drop procedure if exists esPalindromo//

create procedure esPalindromo(cadena varchar(255))
comment 'comprueba si una cadena es palindromo 0 falso 1 true'
begin
	declare cadena2 varchar(255) default '';
	declare contador int default 0;
	declare lenght int default 0;
	set lenght = CHAR_LENGTH(cadena);
	
	WHILE contador <= lenght DO
		set cadena2 = concat(cadena2,(select substr(cadena,lenght,1)));
		set lenght = lenght-1;
	END WHILE;

	select cadena;
	select cadena2;

	IF cadena = cadena2 THEN
		select 'true';
	ELSE
		select 'false';
	END IF;
end//

delimiter ;
