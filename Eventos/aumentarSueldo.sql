delimiter //

drop event if exists aumentarSueldo//
create event if not exists aumentarSueldo 
on schedule EVERY 5 second  
STARTS current_timestamp() + INTERVAL 5 second
ENDS current_timestamp() + INTERVAL 30 second
on completion preserve
comment 'aumento sueldo de jugadores'
do
begin
	declare ultimaFecha date;
	update jugador set salario = salario*1.10;
end//

delimiter ;
