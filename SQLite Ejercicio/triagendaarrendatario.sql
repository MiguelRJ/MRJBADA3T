drop trigger if exists BeforeInsertAgendaarrendatario;

create trigger BeforeInsertAgendaarrendatario insert on agendaarrendatario
for each row
begin

	SELECT CASE WHEN not exists (select * from arrendatario where dni=new.dni) then
		Raise(abort, 'ERROR: No existe ningun dni como el indicado en la tabla arrendatario.')
	END;
	
	SELECT CASE WHEN not exists (select * from agenda where num=new.num) then
		Raise(abort, 'ERROR: No existe ningun numero como el indicado en la tabla agenda.')
	END;

end;
