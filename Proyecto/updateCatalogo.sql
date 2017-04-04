delimiter //

drop procedure if exists updateCatalogo//

create procedure updateCatalogo(codi smallint(6), titu varchar(40), arti varchar(30), pa char(2), comp varchar(4), precTope decimal(6,2), an char(4), OUT resul tinyint(1))
comment 'Update de la base de datos Resultado = 0 || Resultado = 1'
begin
	declare unAnio char(4) default null;

	if an <= year(now()) then
		set unAnio = an;
	end if;

	update dvd
	set titulo = titu,
	    artista = arti,
	    pais = pa,
	    compania = comp,
	    precio = precTope,
	    anio = unAnio
	where codigo = codi;
	
	set resul = 0;
end//

delimiter ;
