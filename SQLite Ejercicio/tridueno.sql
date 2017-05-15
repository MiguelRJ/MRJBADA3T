drop trigger if exists BeforeInsertDueno;

create trigger BeforeInsertDueno before insert on dueno
for each row
begin
	-- not glob para cuando no cumpla el patron indicado
	SELECT CASE WHEN new.dni not GLOB '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]' THEN
			RAISE(abort,'ERROR: dni incorrecto, 8 numeros y 1 letra mayuscula.')
	END;

end;
