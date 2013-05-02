
--create language plpgsql;
DROP TRIGGER trg_aud_users on users;
create or replace function aud_users_func() returns trigger as $$
	begin
		IF TG_OP = 'DELETE' THEN
			INSERT INTO aud_users (usr, pwd, nombre, mail, estado, operacion, usuario)
			VALUES (OLD.usr, OLD.pwd, OLD.nombre, OLD.mail, OLD.estado, TG_OP, current_user);
		END IF; 
		IF (TG_OP = 'INSERT' OR  TG_OP = 'UPDATE') THEN
			INSERT INTO aud_users (usr, pwd, nombre, mail, estado, operacion, usuario)
			VALUES (NEW.usr, NEW.pwd, NEW.nombre, NEW.mail, NEW.estado, TG_OP, current_user);
		END IF;	
	return null;
end; $$ language plpgsql;
CREATE TRIGGER trg_aud_users after INSERT OR UPDATE OR DELETE ON users for each row execute procedure aud_users_func();
