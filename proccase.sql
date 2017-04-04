delimiter //

drop procedure if exists proccase//
create procedure proccase(IN param1 int)
comment 'ejemplo de uso de case'
begin
	CASE param1
		when 0 then
			insert into t values(-1);
		when 1 then
			insert into t values(param1);
		else
			insert into t values(param1*100);
	END CASE;
end//

delimiter ;
