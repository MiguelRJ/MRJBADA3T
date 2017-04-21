delimiter //

drop trigger if exists BefIns_equipo_ligaUrlOk//
create trigger BefIns_equipo_ligaUrlOk before insert on equipo
for each row
begin
	IF new.web_oficial is not null THEN
		IF new.web_oficial not rlike '^http://' THEN
			set new.web_oficial = concat('http://',new.web_oficial);
		END IF;
	ELSE 
		set new.web_oficial = '<desconocido>';
	END IF;
end//

delimiter ;
