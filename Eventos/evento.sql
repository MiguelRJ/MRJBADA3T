delimiter //

drop event if exists copiaSeguridadPartidos//
create event if not exists copiaSeguridadPartidos 
on schedule EVERY 1 week 
STARTS '2017-09-03 22:00' 
ENDS '2018-06-30 22:00'
comment 'Volcado de seguridad de partidos jugados cada domingo a las 22:00h'
do
begin
	declare ultimaFecha date;
	create table if not exists PartidoTmp  (
		elocal smallint(6),
		evisitante smallint(6),
		resultado char(7),
		fecha date,
		arbitro smallint(6) );
insert into PartidoTmp select elocal,evisitante,resultado,fecha,arbiro from partido where fecha > (select max(fecha) from PartidoTmb);
end//

delimiter ;
