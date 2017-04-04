delimiter //

drop procedure if exists deleteCatalogo//

create procedure deleteCatalogo(in codDesde smallint, in codHasta smallint, OUT resul tinyint(1))
comment 'Eliminacion en la base de datos Catalogo. (Resultado 0) ==> ok, (Resultado -1) ==> Error)'
begin
	declare filtro varchar(255) default '';
	
	set @orden = 'delete from dvd';
	
	if codHasta is not null and codDesde is not null and codHasta > codDesde then
		set filtro = concat(' where codigo between ',codDesde,' and ',codHasta);
	elseif codDesde is not null and codHasta is null then
		set filtro = concat(' where codigo = ',codDesde);
	elseif codDesde is not null or codHasta is not null then
		set filtro = concat(' where codigo is null');
	end if;


	set @orden = concat(@orden, filtro);
	
	select @orden;

	PREPARE sentencia from @orden;
	
	DEALLOCATE PREPARE sentencia;

	set resul = 0;
end//

delimiter ;
