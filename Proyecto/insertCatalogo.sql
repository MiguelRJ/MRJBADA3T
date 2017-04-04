delimiter //

drop procedure if exists insertCatalogo//
create procedure insertCatalogo(codi smallint(6), titu varchar(40), arti varchar(30), pa char(2), comp varchar(4), prec decimal(6,2), an smallint(6), OUT resul tinyint(1))
comment 'Insertar en la base de datos Catalogo. (Resultado 0) ==> ok, (Resultado -1) ==> Error)'
begin
	declare pkError condition for SQLSTATE '23000';
	declare encontrado int;
	declare paisError int;
	
	-- select codigo into encontrado from dvd where codigo = codi;
	-- set encontrado2 = (select count(*) from dvd where codigo = codi);
	select count(*) into encontrado from dvd where codigo = codi;
	-- select encontrado;

	select count(*) into paisError from pais where iso2 = pa;

	if encontrado <> 0 then
		SIGNAL pkError 
		SET MESSAGE_TEXT = 'Código de disco repetido', MYSQL_ERRNO = 1062;
	elseif paisError = 0 then
		signal pkError
		set MESSAGE_TEXT = 'Codigo de pais desconocido', MYSQL_ERRNO = 1452;
	else
		insert into dvd (codigo, titulo, artista, pais, compania ,precio, anio) values (codi, titu, arti, pa, comp ,prec, an);
	end if;

	set resul = 0;
end//

delimiter ;
