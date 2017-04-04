delimiter //

drop procedure if exists insertCatalogo2//
create procedure insertCatalogo2(codi smallint(6), titu varchar(40), arti varchar(30), pa char(2), comp varchar(4), prec decimal(6,2), an smallint(6), OUT resul tinyint(1))
comment 'Insertar en la base de datos Catalogo. (Resultado 0) ==> ok, (Resultado -1) ==> Error)'
begin
	declare CONTINUE HANDLER
		insert into dvd (codigo, titulo, artista, pais, compania ,precio, anio) values (codi, titu, arti, pa, comp ,prec, an);
	end if;

	set resul = 0;
end//

delimiter ;
