delimiter //

drop procedure if exists listaPorEquipo//
create procedure listaPorEquipo(in elEquipo int)
comment 'Ej de cursor que recorre todos los jugadores dado el quipo del parametro'
begin
	declare vid int;
	declare vnombre varchar(102);
	declare valtura decimal(3,2);

	declare vnomEquipo varchar(25);
	declare vciudad varchar (50);
	declare vpuntos smallint(6);

	declare hayDatos bool default true;

	declare c1 CURSOR for select id, concat(apellido,',', nombre), altura from jugador where equipo = elEquipo;
	declare c2 CURSOR for select nombre, ciudad, puntos from equipo where id = elEquipo;
	declare CONTINUE HANDLER for NOT FOUND SET hayDatos = false;

	OPEN c1;
	WHILE hayDatos DO
		FETCH c1 into vid, vnombre, valtura;
		if hayDatos THEN
			select vid, vnombre, valtura;
		END IF;
	END WHILE;
	CLOSE c1;
	
	set hayDatos = true;

	OPEN c2;
	WHILE hayDatos DO
		FETCH c2 into vnomEquipo, vciudad, vpuntos;
		if hayDatos THEN
			select vnomEquipo, vciudad, vpuntos;
		END IF;
	END WHILE;
	CLOSE c2;
	
end//

delimiter ;
