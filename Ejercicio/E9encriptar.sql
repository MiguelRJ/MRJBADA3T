delimiter //

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

	WHILE contador < lenCadena DO
		set caracter = substr(cadena,contador,1);
		set numCaracter = ASCII(caracter);
		set cadena2 = concat(cadena2,CHAR(numCaracter+1));
		set contador = contador+1;
	END WHILE;
	select cadena2;
end//

delimiter ;
