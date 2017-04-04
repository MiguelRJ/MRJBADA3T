delimiter //

drop procedure if exists selectCatalogo//

create procedure selectCatalogo(codi smallint(6), titu varchar(40), arti varchar(30), pa char(2), comp varchar(4), precTope decimal(6,2), an char(4), OUT resul tinyint(1))
comment 'Select en la base de datos Catalogo. (Resultado 0) ==> ok, (Resultado -1) ==> Error)'
begin
	declare filtro varchar(255) default '';
	
	set @orden = 'select codigo, titulo, artista, pais, compania, precio, anio from dvd';
	
	if codi is not null then
		set filtro = concat(' where codigo=',codi);
	end if;

	if titu is not null then
		if filtro = '' then
			set filtro = concat(' where titulo rlike "',titu,'"');
		else
			set filtro = concat(filtro,'and titulo rlike"',titu,'"');
		end if;
	end if;

	if arti is not null then
		if filtro = '' then
			set filtro = concat(' where artista rlike "',arti,'"');
		else
			set filtro = concat(filtro,'and artista rlike"',arti,'"');
		end if;
	end if;

	if pa is not null then
		if filtro = '' then
			set filtro = concat(' where pais rlike "',pa,'"');
		else
			set filtro = concat(filtro,'and pais rlike"',pa,'"');
		end if;
	end if;

	if comp is not null then
		if filtro = '' then
			set filtro = concat(' where compania rlike "',comp,'"');
		else
			set filtro = concat(filtro,'and compania rlike"',comp,'"');
		end if;
	end if;

	if precTope is not null then
		if filtro = '' then
			set filtro = concat(' where precio < "',precTope,'"');
		else
			set filtro = concat(filtro,'and precio <"',precTope,'"');
		end if;
	end if;

	if an is not null then
		if filtro = '' then
			set filtro = concat(' where anio="',an,'"');
		else
			set filtro = concat(filtro,'and anio="',an,'"');
		end if;
	end if;

	set @orden = concat(@orden, filtro);
	
	select @orden;

	PREPARE sentencia from @orden;
	EXECUTE sentencia;
	DEALLOCATE PREPARE sentencia;

	set resul = 0;
end//

delimiter ;
