drop trigger if exists BeforeInsertCasa;

create trigger BeforeInsertCasa before insert on casa
for each row
begin
	
	SELECT CASE WHEN not exists (select * from dueno where dni=new.dueno) THEN
		RAISE(Abort,'ERROR: No existe ningun dueño con ese dni.')	
	end;

end;
