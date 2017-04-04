delimiter //

drop procedure if exists proc3//

create procedure proc3(INOUT p int)
comment 'Multiplicamos por dos'
begin
	set p=p*2;
end//

delimiter ;
