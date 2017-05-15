drop trigger if exists BeforeInsertAgendadueno;

create trigger BeforeInsertAgendadueno before insert on agendadueno
for each row
begin
	
	SELECT CASE WHEN not exists (select * from dueno where dni=new.dni) then
		Raise(abort, 'ERROR: No existe ningun dni como el indicado en la tabla duenos.')
	END;

	SELECT CASE WHEN not exists (select * from agenda where num=new.num) then
		Raise(abort, 'ERROR: No existe ningun numero como el indicado en la tabla agenda.')
	END;	

end;
