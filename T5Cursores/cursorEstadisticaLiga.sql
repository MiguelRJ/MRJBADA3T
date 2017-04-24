-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER //

drop procedure if exists setupEstadistica//

CREATE DEFINER=`root`@`localhost` PROCEDURE `setupEstadistica`()
    COMMENT 'Inicializar la tabla estadistica con los calroes actuales'
BEGIN
	declare vLoc smallint(6);
	declare vVis smallint(6);
	declare vGanaLocal bool;
	declare fin bool default false;

	declare c1 cursor for select p.mLocal, p.mVisitante, p.mLocal>p.mVisitante from (select cast(substring_index(resultado,'-',1)as integer) as mLocal, cast(substring_index(resultado,'-',-1)as integer)as mVisitante from partido)as p where mLocal<>mVisitante;

	declare continue handler for not found set fin=1;

	truncate estadistica;
	insert into estadistica (idEquipo) select id from equipo;

	open c1;
	while not fin do

		fetch c1 into vLoc,vVis,vGanaLocal;
			select vLoc,vVis,vGanaLocal;
		if not fin then 
			if vGanaLocal then
				update estadistica set vLocal=vLocal+1 where idEquipo=vLoc;
				select 'ganalocal';
			else
				update estadistica set vVisitante=vVisitante+1 where idEquipo=vVis;
				select 'ganavisitante';
			end if;
		end if;

	end while;
	close c1;
	select * from estadistica;
END// 
delimiter ;
