delimiter //
use liga//

drop procedure if exists actualizarPuntos//
create function actualizarPuntos(n int)
comment 'Actualizar puntos'
DETERMINISTIC
begin
	-- select sum(substring_index(resultado,'-',1)) from partido where elocal = 1;
end//

delimiter ;
