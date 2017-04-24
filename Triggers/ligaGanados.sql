delimiter //

drop trigger if exists au_partido//
create trigger au_partido after insert on partido
for each row 
begin
	if cast(substring_index(new.resultado,'-',1)as integer) > cast(substring_index(new.resultado,'-',-1) as integer) then
	update estadistica set vLocal=vLocal+1 where idEquipo=new.eLocal;
	else
	update estadistica set vVisitante=vVisitante+1 where idEquipo=new.eVisitante;
	end if;
end//

delimiter ;
