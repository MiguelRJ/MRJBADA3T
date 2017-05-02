delimiter //

drop procedure if exists holaMundo//

create DEFINER=CURRENT_USER procedure holaMundo()
comment 'Primer'
SQL SECURITY INVOKER
READS SQL DATA	
begin
	select max(id)+1 as hola from equipo;
	select 'hola Mundo desde mariadb';
	select * from jugador;
	insert into equipo (id,nombre,idcapitan,ciudad,web_oficial,puntos) 
		values (99,'fuenla melilla', null, 'melilla', null ,10);
end//

delimiter ;


