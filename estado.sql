delimiter //

create function estado(valor char(1))
returns varchar(20)
comment 'valor = "P" -> caducado, valor = "O" -> activo, valor = "N" -> nuevo'
DETERMINISTIC /*poner esto siempre o el NOT DETERMINISTIC*/
begin
	declare estado varchar(20);
	
	IF valor='p' THEN
		SET estado='caducado';
	ELSEIF valor = 'O' THEN
		SET estado='activo';
	ELSEIF valor='N' THEN
		SET estado='nuevo';
	ELSE
		SET estado='desconocido';
	END IF;
	
	RETURN estado;
end//

delimiter ;
