delimiter //

drop trigger if exists bi_acoount//
create trigger bi_account before update on account
for each row
begin
	IF NEW.amount < 0 THEN
		SET NEW.amount = 0;
	ELSEIF NEW.amount > 100 THEN
		SET NEW.amount = 100;
	END IF;
end//

delimiter ;
