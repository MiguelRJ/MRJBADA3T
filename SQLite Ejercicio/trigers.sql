select case when date(new.fechaD) > date(new.fechaH) then
	Raise(abort,'fechad debe ser menor que fechah')
end;

select case when exists (select * from alquila where date(new.fechad) < date(fechad) and date(new.fechah) >= date(fechad) and new.idcasa = idcasa) then
	Raise(abort, 'fecha alquiler solapa con el inicio...')

select case when exists (select * from alquila where nfd >= fd and nfd <= fh and new.idcasa = idcasa) then 
	Raise()

select case when (select new.dni in (select dni from aluila where deuda >0 ))

-- si se trata de una modificacion para el clietne actual hay que borrar el alquiler

select * from dueno where dni in (select dni from group by dni having(count(*) >=3)) con agregacion



