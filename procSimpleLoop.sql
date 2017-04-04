delimiter //

drop procedure if exists procSimpleLoop//
create procedure procSimpleLoop(IN hasta int)
comment 'ejemplo de uso de SimpleLoop'
begin
	declare contador int;
	set contador=hasta;
	salida: LOOP
		Select concat('Valor contador: ',contador);	
		set contador=contador-1;
		IF contador <= 0 then 
			LEAVE salida; 
		END IF;
	END LOOP;
end//

delimiter ;
