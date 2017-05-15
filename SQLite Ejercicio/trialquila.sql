drop trigger if exists BeforeInsertAlquila;

create trigger BeforeInsertAlquila before insert on alquila
for each row
begin
	-- Cuando no encuentra el dni del arrendatario
	SELECT CASE WHEN not exists (select * from arrendatario where dni=new.arrendatario) THEN
		RAISE(Abort,'ERROR: No existe ningun arrendatario con ese dni.')
	END;

	-- Cuando no encuentra el id de la casa
	SELECT CASE WHEN not exists (select * from casa where id=new.id) THEN
		RAISE(Abort,'ERROR: No existe ninguna casa con ese id')
	END;

	-- Cuando la fechaD es mayor a fechaH
	SELECT CASE WHEN date(new.fechaD) >= date(new.fechaH) THEN
		RAISE(Abort,'ERROR: La fechaDesde no puede ser mayor a la fechaHasta.')
	END;

	-- Cuando hay un alquiler entre los dias seleccionados
	SELECT CASE WHEN exists (select * from alquila where 
		date(new.fechaD) >= date(fechaD) and
		date(new.fechaD) <= date(fechaH) and
		date(new.fechaH) <= date(fechaH) and
		date(new.fechaH) >= date(fechaD) and
		id=new.id) THEN
		RAISE(Abort,'ERROR: Casa ya alquilada, hay un alquiler entre los dias seleccionados.')
	END;

	-- Cuando la fechaH solapa con un alquiler
	SELECT CASE WHEN exists (select * from alquila where 
		date(new.fechaD) <= date(fechaD) and
		-- date(new.fechaD) <= date(fechaH) and
		date(new.fechaH) >= date(fechaD) and
		date(new.fechaH) <= date(fechaH) and
		id=new.id) THEN
		RAISE(Abort,'ERROR: Casa ya alquilada durante la fechaHasta.')
	END;

	-- Cuando la fechaD solapa con un alquiler
	SELECT CASE WHEN exists (select * from alquila where 
		date(new.fechaD) >= date(fechaD) and
		date(new.fechaD) <= date(fechaH) and
		-- date(new.fechaH) >= date(fechaD) and
		date(new.fechaH) >= date(fechaH) and
		id=new.id) THEN
		RAISE(Abort,'ERROR: Casa ya alquilada durante la fechaDesde.')
	END;

	-- Cuando tus fechas estan dentro de otro alquiler
	SELECT CASE WHEN exists (select * from alquila where 
		date(new.fechaD) <= date(fechaD) and
		date(new.fechaD) <= date(fechaH) and
		date(new.fechaH) >= date(fechaD) and
		date(new.fechaH) >= date(fechaH) and
		id=new.id) THEN
		RAISE(Abort,'ERROR: Casa ya alquilada, tus fechas estan dentro de otro alquiler.')
	END;
	
end;
