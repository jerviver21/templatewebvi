
--create language plpgsql;
DROP TABLE aud_users;
CREATE TABLE aud_users (
    id bigserial,
    usr character varying(300),
    pwd character varying(250),
    nombre character varying(1500),
    mail character varying(1500),
    estado integer,
    fecha_hora timestamp without time zone DEFAULT now() NOT NULL,
    operacion character varying(1500),
    usuario character varying(1500),
    num_id character varying(25)
);

ALTER TABLE ONLY aud_users
    ADD CONSTRAINT aud_users_pk PRIMARY KEY (id);


DROP TRIGGER trg_aud_users on users;
create or replace function aud_users_func() returns trigger as $$
	begin
		IF TG_OP = 'DELETE' THEN
			INSERT INTO aud_users (usr, pwd, nombre, mail, num_id, estado, operacion, usuario)
			VALUES (OLD.usr, OLD.pwd, OLD.nombre, OLD.mail, OLD.num_id, OLD.estado, TG_OP, current_user);
		END IF; 
		IF (TG_OP = 'INSERT' OR  TG_OP = 'UPDATE') THEN
			INSERT INTO aud_users (usr, pwd, nombre, mail, num_id, estado, operacion, usuario)
			VALUES (NEW.usr, NEW.pwd, NEW.nombre, NEW.mail,  NEW.num_id, NEW.estado, TG_OP, current_user);
		END IF;	
	return null;
end; $$ language plpgsql;
CREATE TRIGGER trg_aud_users after INSERT OR UPDATE OR DELETE ON users for each row execute procedure aud_users_func();
