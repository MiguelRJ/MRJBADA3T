delimiter //

drop trigger if exists AfterDeleteA//
create trigger AfterDeleteA after delete on A
for each row
begin
	delete from B where ca = old.ca;
	delete from C where ca = old.ca;
end//

drop trigger if exists BeforeDeleteB//
create trigger BeforeDeleteB before delete on B
for each row
begin
	declare borrado_no_permitido condition for SQLSTATE '77781';
	if exists (select * from A where ca = old.ca) then
		signal borrado_no_permitido set message_text='No esta permitido borrar en esta entidad';
	end if;
end//

drop trigger if exists BeforeDeleteC//
create trigger BeforeDeleteC before delete on C
for each row
begin
	declare borrado_no_permitido condition for SQLSTATE '77781';
	if exists (select * from A where ca = old.ca) then
		signal borrado_no_permitido set message_text='No esta permitido borrar en esta entidad';
	end if;
end//

delimiter ;
