delimiter //

drop trigger if exists ai_jugador
create definer=current_user trigger ai_jugador after update on jugador
for each row
begin
	if (new.salario>=1.20*old.salario) or (new.salario<=0.80*old.salario) then
		insert into log values (curdate(),curtime(),substring_index(current_user(),'@',1),(select host from information_schema.processlist where id=connection_id()),new.id);
	end if;
end//

delimiter ;
