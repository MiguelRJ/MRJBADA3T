delimiter //

drop procedure if exists proc1//
create procedure proc1(IN p int)
comment 'Ej. de pa con parametro de entrada'
begin 
	set @x = p; /* Esto es peligroso, efectos colaterales */
	set p = 2*p; /* Esta sentencia no sirve para nada*/
end//

drop procedure if exists proc2//
create procedure proc2(IN entrada int, OUT salida int)
comment 'Ej. de pa con parametro de salida'
begin
	set salida = 2*entrada; /* Esta sentencia sirve para algo */
end//

drop procedure if exists nProvincias//
create procedure nProvincias(tabla varchar(32), OUT numero int)
comment 'Recogemos el numero de filas de la tabla provincia'
begin
	declare tb=concat(tabla, '');
	select count(*) into numero from tb;
end//

delimiter ;
