delimiter //

drop procedure if exists proc4//

create procedure proc4()
comment 'Ejemplo de ambito de alcance de variables'
begin
	declare x1 char(25) default 'fuera de alcance';
	begin
		declare x1 char(25) default 'dentro de ambito';
		select x1;
	end;
	select x1;
end//

delimiter ;
