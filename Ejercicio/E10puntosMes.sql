delimiter //

drop procedure if exists puntosMes//


create procedure puntosMes(n int)
comment 'Calculo los puntos al mes de cada equipo, crea la table si no esta creada, la muestra y la elimina.'
begin
	-- select substring_index(substring_index('2011-10-20','-',2),'-',-1); solo de 1 a 12
	declare puntosLocal int default 0;
	declare puntosVisit int default 0;
	declare contador int default 1;
	declare numMaxEquipo int default 0;
	declare puntosSuma int default 0;
	
	drop table if exists puntosMes;
	create temporary table puntosMes (id int,puntos int);
	set numMaxEquipo = (select max(id) from equipo);
	
	WHILE contador <= numMaxEquipo DO
		set puntosLocal = (select sum(substring_index(resultado,'-',1)) from partido where elocal = contador and substring_index(substring_index(fecha,'-',2),'-',-1) = n);
		set puntosVisit = (select sum(substring_index(resultado,'-',-1)) from partido where evisitante = contador and substring_index(substring_index(fecha,'-',2),'-',-1) = n);

		IF puntosLocal is null and puntosVisit is null THEN
			set puntosSuma = 0;
		ELSEIF puntosLocal is null THEN
			set puntosSuma = puntosVisit;
		ELSEIF puntosVisit is null THEN
			set puntosSuma = puntosLocal;
		ELSE
			set puntosSuma = puntosLocal+PuntosVisit;
		END IF;
		
		insert into puntosMes (id, puntos) values (contador, puntosSuma);
		set contador = contador+1;
	END WHILE;
	select * from puntosMes;
	drop table puntosMes;
end//

delimiter ;
