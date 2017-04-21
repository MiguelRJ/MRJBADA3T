delimiter //

drop procedure if exists clienteFiel//
create procedure clienteFiel(in concesionario varchar(4))
comment ''
begin
	declare sigue bool default true;
	declare vdni varchar(4);

	declare c1 CURSOR for select distinct dni from ventas where cifc = concesionario;
	declare CONTINUE HANDLER for NOT FOUND set sigue = true;

	drop table if exists clienteFiel;
	create temporary table clienteFiel(dni varchar(4));
	OPEN c1;
	REPEAT
		FETCH c1 into vdni;
		IF sigue THEN
			IF not exists (select * from ventas where cifc <> concesionario and dni = vdni) THEN
				insert into clienteFiel values (vdni);
			END IF;
		END IF;
	UNTIL sigue = false
	END REPEAT;
	CLOSE c1;
	select * from clienteFiel;
	drop table clienteFiel;
end//

delimiter ;
