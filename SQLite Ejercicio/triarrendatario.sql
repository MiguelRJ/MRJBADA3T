drop trigger if exists BeforeInsertArrendatario;

create trigger BeforeInsertArrendatario before insert on arrendatario
for each row
begin
	-- not glob para cuando no cumpla el patron indicado
	SELECT CASE WHEN new.dni not GLOB '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]' THEN
			RAISE(abort,'ERROR: dni incorrecto, 8 numeros y 1 letra mayuscula.')
	END;

	SELECT CASE WHEN new.nombre GLOB '*[0-9]*' THEN
		RAISE(abort,'ERROR: El nombre no puede contener numeros.')
	END;

end;
