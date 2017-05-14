drop trigger if exists BeforeInsertArrendatario;

create trigger BeforeInsertArrendatario before insert on arrendatario
for each row
begin
	
	SELECT CASE new.dni
		WHEN length(new.dni) <> 9 THEN
			RAISE(abort,'ERROR: longitud de dni incorrecta.')
	END;

end;
