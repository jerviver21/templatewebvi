CREATE TABLE aud_sesion (
	id bigserial NOT NULL DEFAULT nextval('aud_sesion_id_seq'::regclass),
	usr varchar(300) NOT NULL,
	operacion varchar(10) NOT NULL,
	fecha_hora timestamp NOT NULL DEFAULT now()
);
ALTER TABLE aud_sesion ADD CONSTRAINT aud_sesion_pk PRIMARY KEY(id);
CREATE TABLE parametro (
	id bigserial NOT NULL DEFAULT nextval('parametro_id_seq'::regclass),
	nombre varchar(50) NOT NULL,
	valor text NOT NULL,
	tipo varchar(20)
);
ALTER TABLE parametro ADD CONSTRAINT parametros_pk PRIMARY KEY(id);
CREATE UNIQUE INDEX parametros_ui1 ON parametro (nombre,tipo);
CREATE TABLE campos_validacion (
	id serial NOT NULL DEFAULT nextval('campos_validacion_id_seq'::regclass),
	id_campo int4,
	id_validacion int4
);
ALTER TABLE campos_validacion ADD CONSTRAINT campos_validaciones_pk PRIMARY KEY(id);
CREATE UNIQUE INDEX campos_validaciones_ui1 ON campos_validacion (id_campo,id_validacion);
CREATE TABLE archivo (
	nombre varchar(100) NOT NULL,
	nombre_archivo varchar(2000) NOT NULL,
	nombre_jasper varchar(1000) NOT NULL,
	id_tipo_archivo int4 NOT NULL,
	id_reporte int4
);
ALTER TABLE archivo ADD CONSTRAINT archivo_fk PRIMARY KEY(nombre);
CREATE TABLE validaciones_formulario (
	id serial NOT NULL DEFAULT nextval('validaciones_formulario_id_seq'::regclass),
	id_campo_formulario int4 NOT NULL
);
ALTER TABLE validaciones_formulario ADD CONSTRAINT validaciones_formulario_pk PRIMARY KEY(id);
CREATE TABLE group_rol (
	id serial NOT NULL DEFAULT nextval('group_rol_id_seq'::regclass),
	id_rol int8 NOT NULL,
	id_group int8 NOT NULL
);
ALTER TABLE group_rol ADD CONSTRAINT group_rol_pk PRIMARY KEY(id);
CREATE TABLE b (
	a int4,
	b int4
);
CREATE TABLE user_group (
	id serial NOT NULL DEFAULT nextval('user_group_id_seq'::regclass),
	id_user int8 NOT NULL,
	id_group int8 NOT NULL
);
ALTER TABLE user_group ADD CONSTRAINT user_group_pk PRIMARY KEY(id);
CREATE TABLE a (
	a int4,
	b int4
);
CREATE TABLE groups (
	id bigserial NOT NULL DEFAULT nextval('groups_id_seq'::regclass),
	codigo varchar(100) NOT NULL,
	descripcion varchar(300)
);
ALTER TABLE groups ADD CONSTRAINT rol_pk PRIMARY KEY(id);
CREATE UNIQUE INDEX rol_ui1 ON groups (codigo);
CREATE TABLE tipo_proceso_reporte (
	id int4 NOT NULL,
	nombre varchar(1000)
);
ALTER TABLE tipo_proceso_reporte ADD CONSTRAINT procesos_reportes_pk PRIMARY KEY(id);
CREATE TABLE aud_users (
	id bigserial NOT NULL DEFAULT nextval('aud_users_id_seq'::regclass),
	usr varchar(300),
	pwd varchar(250),
	nombre varchar(1500),
	mail varchar(1500),
	estado int4,
	fecha_hora timestamp NOT NULL DEFAULT now(),
	operacion varchar(1500),
	usuario varchar(1500),
	num_id varchar(25)
);
ALTER TABLE aud_users ADD CONSTRAINT aud_users_pk PRIMARY KEY(id);
CREATE TABLE rol (
	id bigserial NOT NULL DEFAULT nextval('rol_id_seq'::regclass),
	codigo varchar(100) NOT NULL,
	descripcion varchar(2000)
);
ALTER TABLE rol ADD CONSTRAINT perfil_pk PRIMARY KEY(id);
CREATE UNIQUE INDEX perfil_ui1 ON rol (codigo);
CREATE TABLE tipo_id (
	id int4 NOT NULL,
	codigo varchar(100)
);
ALTER TABLE tipo_id ADD CONSTRAINT tipo_id_pk PRIMARY KEY(id);
CREATE TABLE data (
	nombre varchar(100) NOT NULL,
	descripcion varchar(1000),
	id int4 NOT NULL
);
ALTER TABLE data ADD CONSTRAINT data_pk PRIMARY KEY(id);
CREATE TABLE campos_formulario (
	id serial NOT NULL DEFAULT nextval('campos_formulario_id_seq'::regclass),
	id_formulario int4 NOT NULL
);
ALTER TABLE campos_formulario ADD CONSTRAINT campos_formulario_pk PRIMARY KEY(id);
CREATE TABLE aud_mail (
	id bigserial NOT NULL DEFAULT nextval('aud_mail_id_seq'::regclass),
	destinatario varchar(1000) NOT NULL,
	asunto varchar(1000) NOT NULL,
	mensaje text NOT NULL,
	fecha_hora timestamp NOT NULL DEFAULT now()
);
ALTER TABLE aud_mail ADD CONSTRAINT aud_mail_pk PRIMARY KEY(id);
CREATE TABLE formulario (
	id serial NOT NULL DEFAULT nextval('formulario_id_seq'::regclass),
	nombre varchar(250) NOT NULL,
	descripcion text NOT NULL
);
ALTER TABLE formulario ADD CONSTRAINT formularios_pk PRIMARY KEY(id);
CREATE TABLE festivos (
	fecha date NOT NULL
);
ALTER TABLE festivos ADD CONSTRAINT festivos_pk PRIMARY KEY(fecha);
CREATE TABLE reporte (
	nombre varchar(100) NOT NULL,
	roles text NOT NULL DEFAULT 'ALL'::text,
	id_proceso int4,
	id int4 NOT NULL
);
ALTER TABLE reporte ADD CONSTRAINT reporte_pk PRIMARY KEY(id);
CREATE TABLE resource (
	id bigserial NOT NULL DEFAULT nextval('resource_id_seq'::regclass),
	nombre varchar(2000) NOT NULL,
	descripcion varchar(300),
	id_menu int8 NOT NULL,
	url varchar(500) NOT NULL,
	idioma varchar(2)
);
ALTER TABLE resource ADD CONSTRAINT recurso_pk PRIMARY KEY(id);
CREATE UNIQUE INDEX recurso_ui1 ON resource (nombre,id_menu);
CREATE TABLE users (
	id bigserial NOT NULL DEFAULT nextval('users_id_seq'::regclass),
	usr varchar(300) NOT NULL,
	pwd varchar(250) NOT NULL,
	nombre varchar(1500),
	mail varchar(1500),
	estado int4 NOT NULL,
	cod_restauracion varchar(255),
	clave varchar(255),
	nro_usuario varchar(25),
	num_id varchar(25)
);
ALTER TABLE users ADD CONSTRAINT usuario_pk PRIMARY KEY(id);
CREATE UNIQUE INDEX usuario_ui1 ON users (usr);
CREATE TABLE idiomas (
	id varchar(2) NOT NULL,
	nombre varchar(255) NOT NULL
);
ALTER TABLE idiomas ADD CONSTRAINT idiomas_pk PRIMARY KEY(id);
CREATE TABLE rol_resource (
	id bigserial NOT NULL DEFAULT nextval('rol_resource_id_seq'::regclass),
	id_resource int8 NOT NULL,
	id_rol int8
);
ALTER TABLE rol_resource ADD CONSTRAINT perfil_recurso_pk PRIMARY KEY(id);
CREATE TABLE menu (
	id bigserial NOT NULL DEFAULT nextval('menu_id_seq'::regclass),
	nombre varchar(2000) NOT NULL,
	id_menu int8,
	idioma varchar(2),
	descripcion varchar(2000)
);
ALTER TABLE menu ADD CONSTRAINT menu_pk PRIMARY KEY(id);
CREATE UNIQUE INDEX menu_ui1 ON menu (nombre);
CREATE TABLE tipo_archivo (
	id int4 NOT NULL,
	tipo varchar(100)
);
ALTER TABLE tipo_archivo ADD CONSTRAINT tipo_archivo_pk PRIMARY KEY(id);
CREATE TABLE parametros_reporte (
	nombre varchar(100) NOT NULL,
	etiqueta varchar(1000) NOT NULL,
	id_tipo int4 NOT NULL,
	id int4 NOT NULL,
	id_data int4,
	id_reporte int4
);
ALTER TABLE parametros_reporte ADD CONSTRAINT parametro_reporte_pk PRIMARY KEY(id);
CREATE TABLE tipo_parametro_reporte (
	tipo varchar(100) NOT NULL,
	id int4 NOT NULL,
	descripcion varchar(1000)
);
ALTER TABLE tipo_parametro_reporte ADD CONSTRAINT tipo_parametro_reporte_pk PRIMARY KEY(id);
ALTER TABLE archivo ADD CONSTRAINT archivo_reporte_fk FOREIGN KEY (id_reporte) REFERENCES reporte(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE archivo ADD CONSTRAINT arch_tipo_arch_fk FOREIGN KEY (id_tipo_archivo) REFERENCES tipo_archivo(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE group_rol ADD CONSTRAINT group_group_rol_fk FOREIGN KEY (id_group) REFERENCES groups(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE group_rol ADD CONSTRAINT rol_group_rol_fk FOREIGN KEY (id_rol) REFERENCES rol(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE user_group ADD CONSTRAINT group_user_fk FOREIGN KEY (id_group) REFERENCES groups(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE user_group ADD CONSTRAINT user_group_fk FOREIGN KEY (id_user) REFERENCES users(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE reporte ADD CONSTRAINT reporte_proceso_fk FOREIGN KEY (id_proceso) REFERENCES tipo_proceso_reporte(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE resource ADD CONSTRAINT recurso_menu_fk FOREIGN KEY (id_menu) REFERENCES menu(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE rol_resource ADD CONSTRAINT resource_rol_res_fk FOREIGN KEY (id_resource) REFERENCES resource(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE rol_resource ADD CONSTRAINT rol_rol_res_fk FOREIGN KEY (id_rol) REFERENCES rol(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE menu ADD CONSTRAINT menu_fk FOREIGN KEY (id_menu) REFERENCES menu(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE parametros_reporte ADD CONSTRAINT data_param_rep_fk FOREIGN KEY (id_data) REFERENCES data(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE parametros_reporte ADD CONSTRAINT param_rep_reporte_fk FOREIGN KEY (id_reporte) REFERENCES reporte(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE parametros_reporte ADD CONSTRAINT param_tipo_param_fk FOREIGN KEY (id_tipo) REFERENCES tipo_parametro_reporte(id) ON DELETE CASCADE ON UPDATE CASCADE;
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
