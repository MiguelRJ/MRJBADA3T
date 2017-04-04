delimiter //

drop procedure if exists procWhile//
create procedure procWhile(IN hasta int)
comment 'ejemplo de uso de While'
begin
	declare contador int;
	set contador=hasta;
		
	WHILE contador > 0 DO
		Select concat('Valor contador: ',contador);	
		set contador=contador-1;
	END WHILE;
end//

delimiter ;
