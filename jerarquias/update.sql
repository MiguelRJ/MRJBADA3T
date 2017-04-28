delimiter //

drop trigger if exists BeforeUpdateA//
create trigger BeforeUpdateA before update on A
for each row
begin
	declare error_clave_primaria condition for SQLSTATE '77779';

	if exists (select * from B where ca = new.ca) or exists (select * from C where ca = new.ca) then
		signal error_clave_primaria set message_text='Clave primaria ya existente';
	end if;
end//

drop trigger if exists AfterUpdateA//
create trigger AfterUpdateA after update on A
for each row
begin
	if old.ca <> new.ca then
		update B set ca = new.ca where ca = old.ca;
		update C set ca = new.ca where ca = old.ca;
	end if;		
end//

drop trigger if exists BeforeUpdateB//
create trigger BeforeUpdateB before update on B
for each row
begin
	declare clave_primaria_no_modificable condition for SQLSTATE '77780';

	if not exists (select * from A where ca = new.ca) then
		signal clave_primaria_no_modificable set message_text = 'No esta permitido cambiar la clave primaria en esta entidad';
	end if;
end//

drop trigger if exists BeforeUpdateC//
create trigger BeforeUpdateC before update on C
for each row
begin
	declare clave_primaria_no_modificable condition for SQLSTATE '77780';

	if not exists (select * from A where ca = new.ca) then
		signal clave_primaria_no_modificable set message_text = 'No esta permitido cambiar la clave primaria en esta entidad';
	end if;
end//

delimiter ;
