delimiter //

/* select distinct dni,nombre,apellido from clientes where not exists (select *from ventas v1 where dni in (select dni from clientes where nombre='LUIS' and apellido='GARCIA') and not exists (select * from ventas v2 where v2.codcoche=v1.codcoche and clientes.dni = v2.dni))// */

drop procedure if exists clienteCopion//

create procedure clienteCopion(in nomCliente varchar(10), in apeCliente varchar(25))
comment 'DNI de clientes que han comprado almenos los mismos coches que nomCliente apeCliente'
begin
	declare fin1 bool default false;
	declare fin2 bool default false;
	
	declare vcodcoche varchar(3);
	declare candidato varchar(4);
	declare descartado bool default false;

	declare c1 CURSOR for select dni from clientes;
	declare c2 CURSOR for select distinct codcoche from ventas where dni in (select dni from clientes where nombre=nomCliente and apellido=apeCliente);

	declare CONTINUE HANDLER for NOT FOUND set fin1 = true;

	create temporary table clienteCopion(dni varchar(4));
	
	open c1;
	repeat
		fetch c1 into candidato;
		set fin2 = fin1;
		if not fin1 then

			open c2;
			repeat
				fetch c2 into vcodcoche;
					if not fin1 and not exists (select * from ventas where dni=candidato and codcoche=vcodcoche) then
						set descartado = true;
					end if;
			until fin1 or descartado end repeat;
			close c2;

			if not descartado then
				insert into clienteCopion values (candidato);
			end if;
			set descartado = false;
		end if;
		set fin1 = fin2;
	until fin1 end repeat;
	close c1;
	select * from clienteCopion;
	drop table clienteCopion;
end//
					

delimiter ;
