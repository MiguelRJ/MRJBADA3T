delimiter //

drop trigger if exists BeforeInsertA//
create trigger BeforeInsertA before insert on A
for each row
begin
	declare violacion_jerarquia_total condition for SQLSTATE '77777';
	declare error_clave_primaria condition for SQLSTATE '77779';
	
	-- Si no esta en b ni en c no se debe insertar
	if not exists (select * from B where ca = new.ca) and not exists (select * from C where ca = new.ca) then
		signal violacion_jerarquia_total set message_text='Operacion no permitida en tabla A';
	end if;

	-- Se debe comprobar que no esta ya en a
	if exists (select * from A where ca=new.ca) then
		signal error_clave_primaria set message_text='Error clave primaria';
	end if;
end//

drop trigger if exists BeforeInsertB//
create trigger BeforeInsertB before insert on B
for each row
begin
	declare violacion_jerarquia_total condition for SQLSTATE '77778';

	if exists (select * from A where ca = new.ca) then
		signal violacion_jerarquia_total set message_text='Registro duplicado';
	end if;
end//

drop trigger if exists BeforeInsertC//
create trigger BeforeInsertC before insert on C
for each row
begin
	declare violacion_jerarquia_total condition for SQLSTATE '77778';

	if exists (select * from A where ca = new.ca) then
		signal violacion_jerarquia_total set message_text='Registro duplicado';
	end if;
end//

drop trigger if exists AfterInsertB//
create trigger AfterInsertB after insert on B
for each row
begin
	insert into A (ca) values (new.ca);
end//

drop trigger if exists AfterInsertC//
create trigger AfterInsertC after insert on C
for each row
begin
	insert into A (ca) values (new.ca);
end//

delimiter ;
