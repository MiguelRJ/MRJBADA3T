delimiter //

drop function if exists sucesion//

create function sucesion(m int)
returns decimal(20,19)
comment 'devuelve la sucesion de 1/n numeros'
DETERMINISTIC
begin
	declare suma decimal(20,19) default 0;
	WHILE m > 1 DO
		set suma = suma + 1/m;
		set m = m-1;
	END WHILE;
	return suma;
end//

delimiter ;
