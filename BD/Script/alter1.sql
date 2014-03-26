
DROP TABLE a;
DROP TABLE b;
CREATE TABLE licencia (
	id bigserial NOT NULL,
	no_licencia varchar(10),
	fecha_inicio date DEFAULT now(),
	fecha_fin date,
	owner varchar(1000)
);
ALTER TABLE licencia ADD CONSTRAINT licencia_pk PRIMARY KEY(id);
CREATE UNIQUE INDEX licencia_ui1 ON licencia (no_licencia);
ALTER TABLE users ADD id_licencia bigint;
ALTER TABLE users ADD CONSTRAINT licencia_usr FOREIGN KEY (id_licencia) REFERENCES licencia(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
