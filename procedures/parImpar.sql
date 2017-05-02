delimiter //

drop function if exists parImpar//

create function parImpar(valor char(32))
returns bool
comment 'devuelve como cadena "par" o "impar" depende del numero pasado'
DETERMINISTIC /*poner esto siempre o el NOT DETERMINISTIC*/
begin
	declare resultado bool;
/*	IF valor not rlike '^[-+]{0,}[0-9]+$' THEN
		SET resultado = null; */
	IF CONVERT(valor, signed) not like valor or valor is null THEN
		SET resultado = null;
	ELSEIF valor%2=0 THEN
		SET resultado=1;
	ELSE
		SET resultado=0;
	END IF;
	RETURN resultado;
	
end//

drop procedure if exists insertar//

create procedure insertar(p1 char(32))
comment 'inserta en la tabla test.numeros'
begin
	IF parImpar(p1) is not null THEN
		IF parImpar(p1) THEN
			insert into numeros (pares ,impares) values (p1,null);
		ELSE
			insert into numeros (pares ,impares) values (null,p1);
		END IF;
	END IF;
end//

delimiter ;
