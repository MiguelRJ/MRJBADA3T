drop trigger if exists BeforeInsertAgenda;

create trigger BeforeInsertAgenda before insert on agenda
for each row
begin
	-- not glob para cuando no cumpla el patron indicado
	SELECT CASE WHEN new.num not GLOB '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' THEN
			RAISE(abort,'ERROR: numero incorrecto, escriba 9 numeros.')
	END;

end;
