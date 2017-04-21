delimiter //

drop procedure if exists notin//
create procedure notin(in elCif varchar(4))
comment 'fieles al concesionario X'
begin
	-- manual
	declare vcliente varchar(4);
	declare hayDatos bool default true;
	declare c1 CURSOR for select dni from ventas v1 where dni not in(select dni from ventas where cifc<>elCif);
	declare CONTINUE HANDLER for NOT FOUND SET hayDatos = false;

	OPEN c1;
	WHILE hayDatos DO
		FETCH c1 into vcliente;
		if hayDatos THEN
			select vcliente;
		END IF;
	END WHILE;
	CLOSE c1;
end//

delimiter ;
