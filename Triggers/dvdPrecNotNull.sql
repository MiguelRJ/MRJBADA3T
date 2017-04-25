delimiter //

drop trigger if exists bu_dvd//
create trigger bu_dvd before update on dvd
for each row
begin
	if new.precio is null then
		set new.precio= 0.0;
	end if;
	if new.anio is null then
		set new.anio = year(curdate());
	end if;
end//

delimiter ;
