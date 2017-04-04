delimiter //

drop procedure if exists procRepeatUntil//
create procedure procRepeatUntil(IN hasta int)
comment 'ejemplo de uso de Repeat Until'
begin
	declare contador int;
	set contador=hasta;
		
	REPEAT
		Select concat('Valor contador: ',contador);	
		set contador=contador-1;
	UNTIL contador <= 0 END REPEAT;
end//

delimiter ;
