delimiter //

drop procedure if exists actualizarPuntos//

create procedure actualizarPuntos()
comment 'Actualizar puntos'
begin
	declare puntosLocal int default 0;
	declare puntosVisit int default 0;
	declare contador int default 1;
	declare numMaxEquipo int default 0;
	declare puntosSuma int default 0;

	set numMaxEquipo = (select max(id) from equipo);
	
	WHILE contador <= numMaxEquipo DO
		set puntosLocal = (select sum(substring_index(resultado,'-',1)) from partido where elocal = contador);
		set puntosVisit = (select sum(substring_index(resultado,'-',-1)) from partido where evisitante = contador);

		IF puntosLocal is null THEN
			set puntosSuma = puntosVisit;
		ELSEIF puntosVisit is null THEN
			set puntosSuma = puntosLocal;
		ELSE
			set puntosSuma = puntosLocal+PuntosVisit;
		END IF;

		update equipo set puntos=puntosSuma where id=contador;
		set contador = contador+1;
	END WHILE;
	select id,nombre,ciudad,puntos from equipo;
end//

delimiter ;
