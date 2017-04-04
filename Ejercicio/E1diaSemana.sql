delimiter //

drop function if exists diaSemana//

create function diaSemana(n int)
returns varchar(10)
comment 'Recibe un numero entero entre 1 y 7 y devuelve el dia de la semana, si lo introducido no es [1-7] devuelve null'
DETERMINISTIC
begin
	declare nombreSemana varchar(10) default null;
	CASE n
		when 1 then
			set nombreSemana='Lunes';
		when 2 then
			set nombreSemana='Martes';
		when 3 then
			set nombreSemana='Miercoles';
		when 4 then
			set nombreSemana='Jueves';
		when 5 then
			set nombreSemana='Viernes';
		when 6 then
			set nombreSemana='Sabado';
		when 7 then
			set nombreSemana='Domingo';
		else
			set nombreSemana=null;
	END CASE;
	return nombreSemana;
end//

delimiter ;
