-- creacion de tablas

CREATE TABLE tipo_proyectos
(
  id_tipo_proyecto serial,
  descripcion character varying(100),
  CONSTRAINT tipo_proyectos_pkey PRIMARY KEY (id_tipo_proyecto)
);

CREATE TABLE tipo_identificaciones
(
  id_tipo_identificacion serial,
  descripcion character varying(100),
  CONSTRAINT tipo_identificaciones_pkey PRIMARY KEY (id_tipo_identificacion)
);

CREATE TABLE municipios
(
  id_municipio integer,
  id_departamento integer ,
  codigo_municipio integer,
  nombre character varying(70),
  CONSTRAINT municipios_pkey PRIMARY KEY (id_municipio)
);

CREATE TABLE departamentos
(
  id_departamento integer,
  codigo_departamento integer,
  nombre character varying (70),
  CONSTRAINT departamentos_pkey PRIMARY KEY (id_departamento)
);

CREATE TABLE tipo_usuarios
(
  id_tipo_usuario serial,
  descripcion character varying(50),
  CONSTRAINT tipo_usuarios_pkey PRIMARY KEY (id_tipo_usuario)
);

CREATE TABLE archivos_adjuntos
(
  id_archivo_adjunto serial,
  id_organizacion integer,
  id_tipo_adjunto integer,
  nombre_adjunto character varying(150),
  url character varying(200),
  CONSTRAINT archivos_adjuntos_pkey PRIMARY KEY (id_archivo_adjunto)
);

CREATE TABLE tipo_adjuntos
(
  id_tipo_adjunto serial,
  descripcion character varying(200),
  CONSTRAINT tipo_adjuntos_pkey PRIMARY KEY (id_tipo_adjunto)
);

CREATE TABLE usuarios
(
  id_usuario serial,
  nombres_apellidos character varying(200),
  id_tipo_identificacion integer,
  identificacion character varying(15),
  id_tipo_usuario integer,
  id_organizacion integer,
  email character varying(150),
  clave character varying(70),
  estado boolean,
  telefono character varying(20),
  CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario)
);

CREATE TABLE organizaciones
(
  id_organizacion serial,
  nombre character varying(250),
  nit_cc character varying(15),
  representante_legal character varying(200),
  id_tipo_identificacion integer,
  identificacion character varying(15),
  telefono character varying(20),
  email character varying(150),
  id_municipio integer,
  resguardo_cabildo character varying(200),
  CONSTRAINT organizaciones_pkey PRIMARY KEY (id_organizacion)
);

CREATE TABLE proyectos
(
  id_proyecto serial,
  nombre character varying(300),
  id_tipo_proyecto integer,
  ubicacion character varying(200),
  valor_letras character varying(200),
  valor_numeros integer,
  nombre_estructurador character varying(200),
  telefono_estructurador character varying(20),
  direccion_estructurador character varying(200),
  email_estructurador character varying(150),
  nombre_registrador character varying(200),
  telefono_registrador character varying(20),
  direccion_registrador character varying(200),
  email_registrador character varying(150),
  estado boolean,
  id_usuario int,
  id_tipo_adjunto int,
  id_archivo_adjunto int,
  CONSTRAINT proyectos_pkey PRIMARY KEY (id_proyecto)
);

-- creacion de realacion de llaves foraneas

ALTER TABLE municipios
  ADD CONSTRAINT departamentos_fkey
  FOREIGN KEY (id_departamento)
  REFERENCES departamentos (id_departamento);

ALTER TABLE organizaciones 
  ADD CONSTRAINT tipo_identificacion_fkey
  FOREIGN KEY (id_tipo_identificacion)
  REFERENCES tipo_identificaciones (id_tipo_identificacion);

ALTER TABLE organizaciones 
  ADD CONSTRAINT municipio_fkey
  FOREIGN KEY (id_municipio)
  REFERENCES municipios (id_municipio);

ALTER TABLE archivos_adjuntos
  ADD CONSTRAINT organizacion_fkey
  FOREIGN KEY (id_organizacion)
  REFERENCES organizaciones(id_organizacion);

ALTER TABLE archivos_adjuntos 
  ADD CONSTRAINT tipo_adjunto_fkey
  FOREIGN KEY (id_tipo_adjunto)
  REFERENCES tipo_adjuntos(id_tipo_adjunto);

ALTER TABLE usuarios
  ADD CONSTRAINT tipo_identificacion_fkey
  FOREIGN KEY (id_tipo_identificacion)
  REFERENCES tipo_identificaciones(id_tipo_identificacion);

ALTER TABLE usuarios
  ADD CONSTRAINT tipo_usuario_fkey
  FOREIGN kEY (id_tipo_usuario)
  REFERENCES tipo_usuarios(id_tipo_usuario);

ALTER TABLE usuarios
  ADD CONSTRAINT organizacion_fkey
  FOREIGN KEY (id_organizacion)
  REFERENCES organizaciones(id_organizacion);

ALTER TABLE proyectos
  ADD CONSTRAINT tipo_proyecto_fkey 
  FOREIGN kEY (id_tipo_proyecto)
  REFERENCES tipo_proyectos(id_tipo_proyecto);

ALTER TABLE proyectos
  ADD CONSTRAINT usuario_pkey 
  FOREIGN kEY (id_usuario)
  REFERENCES usuarios(id_usuario);

ALTER TABLE proyectos
  ADD CONSTRAINT tipo_adjunto_fkey
  FOREIGN kEY (id_tipo_adjunto)
  REFERENCES tipo_adjuntos(id_tipo_adjunto);

ALTER TABLE proyectos
  ADD CONSTRAINT archivos_adjuntos_fkey
  FOREIGN kEY(id_archivo_adjunto)
  REFERENCES archivos_adjuntos(id_archivo_adjunto);

-- Insert

INSERT INTO tipo_proyectos
  (descripcion)
VALUES
  ('Infraestructura');
INSERT INTO tipo_proyectos
  (descripcion)
VALUES
  ('Ambiente');
INSERT INTO tipo_proyectos
  (descripcion)
VALUES
  ('Cultura');
INSERT INTO tipo_proyectos
  (descripcion)
VALUES
  ('Deporte');
INSERT INTO tipo_proyectos
  (descripcion)
VALUES
  ('Identidad');
INSERT INTO tipo_proyectos
  (descripcion)
VALUES
  ('Jovenes');
INSERT INTO tipo_proyectos
  (descripcion)
VALUES
  ('Mujer');
INSERT INTO tipo_proyectos
  (descripcion)
VALUES
  ('Víctimas');
INSERT INTO tipo_proyectos
  (descripcion)
VALUES
  ('Seguridad alimentaria');
INSERT INTO tipo_proyectos
  (descripcion)
VALUES
  ('adulto mayor');
INSERT INTO tipo_proyectos
  (descripcion)
VALUES
  ('población con discapacidad');
INSERT INTO tipo_proyectos
  (descripcion)
VALUES
  ('Derecho propio');

INSERT INTO tipo_identificaciones
  (descripcion)
VALUES
  ('Cédula de ciudadanía');
INSERT INTO tipo_identificaciones
  (descripcion)
VALUES
  ('Tarjeta de identidad');
INSERT INTO tipo_identificaciones
  (descripcion)
VALUES
  ('Cédula de extranjería');
INSERT INTO tipo_identificaciones
  (descripcion)
VALUES
  ('Otro');

INSERT INTO tipo_adjuntos
  (descripcion)
VALUES
  ('Ficha MGA y anexos');
INSERT INTO tipo_adjuntos
  (descripcion)
VALUES
  ('Ficha EBI');
INSERT INTO tipo_adjuntos
  (descripcion)
VALUES
  ('Certificado de banco de proyectos del municipio');
INSERT INTO tipo_adjuntos
  (descripcion)
VALUES
  ('Certificado de disponibilidad presupuestal (Municipio, Departamento, Nación, Otro)');
INSERT INTO tipo_adjuntos
  (descripcion)
VALUES
  ('Certificado de banco de proyectos del municipio');


INSERT INTO tipo_usuarios
  (descripcion)
VALUES
  ('SuperAdmin');
INSERT INTO tipo_usuarios
  (descripcion)
VALUES
  ('Admin');
INSERT INTO tipo_usuarios
  (descripcion)
VALUES
  ('Operador');

INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('1', '05' , 'ANTIOQUIA');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('2', '08' , 'ATLANTICO');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('3', '11' , 'BOGOTA');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('4', '13' , 'BOLIVAR');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('5', '15' , 'BOYACA');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('6', '17' , 'CALDAS');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('7', '18' , 'CAQUETA');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('8', '19' , 'CAUCA');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('9', '20' , 'CESAR');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('10', '23' , 'CORDOBA');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('11', '25' , 'CUNDINAMARCA');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('12', '27' , 'CHOCO');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('13', '41' , 'HUILA');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('14', '44' , 'LA GUAJIRA');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('15', '47' , 'MAGDALENA');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('16', '50' , 'META');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('17', '52' , 'NARIÑO');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('18', '54' , 'NORTE DE SANTANDER');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('19', '63' , 'QUINDO');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('20', '66' , 'RISARALDA');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('21', '68' , 'SANTANDER');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('22', '70' , 'SUCRE');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('23', '73' , 'TOLIMA');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('24', '76' , 'VALLE');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('40', '81' , 'ARAUCA');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('48', '85' , 'CASANARE');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('49', '86' , 'PUTUMAYO');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('50', '88' , 'SAN ANDRES');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('51', '91' , 'AMAZONAS');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('52', '94' , 'GUAINIA');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('53', '95' , 'GUAVIARE');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('54', '97' , 'VAUPES');
INSERT INTO departamentos
  (id_departamento, codigo_departamento, nombre)
VALUES
  ('55', '99' , 'VICHADA');


INSERT INTO municipios
VALUES
  ('1', '1', '001', 'MEDELLIN');
INSERT INTO municipios
VALUES
  ('2', '1', '002', 'ABEJORRAL');
INSERT INTO municipios
VALUES
  ('3', '1', '004', 'ABRIAQUI');
INSERT INTO municipios
VALUES
  ('4', '1', '021', 'ALEJANDRIA');
INSERT INTO municipios
VALUES
  ('5', '1', '030', 'AMAGA');
INSERT INTO municipios
VALUES
  ('6', '1', '031', 'AMALFI');
INSERT INTO municipios
VALUES
  ('7', '1', '034', 'ANDES');
INSERT INTO municipios
VALUES
  ('8', '1', '036', 'ANGELOPOLIS');
INSERT INTO municipios
VALUES
  ('9', '1', '038', 'ANGOSTURA');
INSERT INTO municipios
VALUES
  ('10', '1', '040', 'ANORI');
INSERT INTO municipios
VALUES
  ('11', '1', '042', 'SANTAFE DE ANTIOQUIA');
INSERT INTO municipios
VALUES
  ('12', '1', '044', 'ANZA');
INSERT INTO municipios
VALUES
  ('13', '1', '045', 'APARTADO');
INSERT INTO municipios
VALUES
  ('14', '1', '051', 'ARBOLETES');
INSERT INTO municipios
VALUES
  ('15', '1', '055', 'ARGELIA');
INSERT INTO municipios
VALUES
  ('16', '1', '059', 'ARMENIA');
INSERT INTO municipios
VALUES
  ('17', '1', '079', 'BARBOSA');
INSERT INTO municipios
VALUES
  ('18', '1', '086', 'BELMIRA');
INSERT INTO municipios
VALUES
  ('19', '1', '088', 'BELLO');
INSERT INTO municipios
VALUES
  ('20', '1', '091', 'BETANIA');
INSERT INTO municipios
VALUES
  ('21', '1', '093', 'BETULIA');
INSERT INTO municipios
VALUES
  ('22', '1', '101', 'BOLIVAR');
INSERT INTO municipios
VALUES
  ('23', '1', '107', 'BRICEO');
INSERT INTO municipios
VALUES
  ('24', '1', '113', 'BURITICA');
INSERT INTO municipios
VALUES
  ('25', '1', '120', 'CACERES');
INSERT INTO municipios
VALUES
  ('26', '1', '125', 'CAICEDO');
INSERT INTO municipios
VALUES
  ('27', '1', '129', 'CALDAS');
INSERT INTO municipios
VALUES
  ('28', '1', '134', 'CAMPAMENTO');
INSERT INTO municipios
VALUES
  ('29', '1', '138', 'CAASGORDAS');
INSERT INTO municipios
VALUES
  ('30', '1', '142', 'CARACOLI');
INSERT INTO municipios
VALUES
  ('31', '1', '145', 'CARAMANTA');
INSERT INTO municipios
VALUES
  ('32', '1', '147', 'CAREPA');
INSERT INTO municipios
VALUES
  ('33', '1', '148', 'CARMEN DE VIBORAL');
INSERT INTO municipios
VALUES
  ('34', '1', '150', 'CAROLINA');
INSERT INTO municipios
VALUES
  ('35', '1', '154', 'CAUCASIA');
INSERT INTO municipios
VALUES
  ('36', '1', '172', 'CHIGORODO');
INSERT INTO municipios
VALUES
  ('37', '1', '190', 'CISNEROS');
INSERT INTO municipios
VALUES
  ('38', '1', '197', 'COCORNA');
INSERT INTO municipios
VALUES
  ('39', '1', '206', 'CONCEPCION');
INSERT INTO municipios
VALUES
  ('40', '1', '209', 'CONCORDIA');
INSERT INTO municipios
VALUES
  ('41', '1', '212', 'COPACABANA');
INSERT INTO municipios
VALUES
  ('42', '1', '234', 'DABEIBA');
INSERT INTO municipios
VALUES
  ('43', '1', '237', 'DON MATIAS');
INSERT INTO municipios
VALUES
  ('44', '1', '240', 'EBEJICO');
INSERT INTO municipios
VALUES
  ('45', '1', '250', 'EL BAGRE');
INSERT INTO municipios
VALUES
  ('46', '1', '264', 'ENTRERRIOS');
INSERT INTO municipios
VALUES
  ('47', '1', '266', 'ENVIGADO');
INSERT INTO municipios
VALUES
  ('48', '1', '282', 'FREDONIA');
INSERT INTO municipios
VALUES
  ('49', '1', '284', 'FRONTINO');
INSERT INTO municipios
VALUES
  ('50', '1', '306', 'GIRALDO');
INSERT INTO municipios
VALUES
  ('51', '1', '308', 'GIRARDOTA');
INSERT INTO municipios
VALUES
  ('52', '1', '310', 'GOMEZ PLATA');
INSERT INTO municipios
VALUES
  ('53', '1', '313', 'GRANADA');
INSERT INTO municipios
VALUES
  ('54', '1', '315', 'GUADALUPE');
INSERT INTO municipios
VALUES
  ('55', '1', '318', 'GUARNE');
INSERT INTO municipios
VALUES
  ('56', '1', '321', 'GUATAPE');
INSERT INTO municipios
VALUES
  ('57', '1', '347', 'HELICONIA');
INSERT INTO municipios
VALUES
  ('58', '1', '353', 'HISPANIA');
INSERT INTO municipios
VALUES
  ('59', '1', '360', 'ITAGUI');
INSERT INTO municipios
VALUES
  ('60', '1', '361', 'ITUANGO');
INSERT INTO municipios
VALUES
  ('61', '1', '364', 'JARDIN');
INSERT INTO municipios
VALUES
  ('62', '1', '368', 'JERICO');
INSERT INTO municipios
VALUES
  ('63', '1', '376', 'LA CEJA');
INSERT INTO municipios
VALUES
  ('64', '1', '380', 'LA ESTRELLA');
INSERT INTO municipios
VALUES
  ('65', '1', '390', 'LA PINTADA');
INSERT INTO municipios
VALUES
  ('66', '1', '400', 'LA UNION');
INSERT INTO municipios
VALUES
  ('67', '1', '411', 'LIBORINA');
INSERT INTO municipios
VALUES
  ('68', '1', '425', 'MACEO');
INSERT INTO municipios
VALUES
  ('69', '1', '440', 'MARINILLA');
INSERT INTO municipios
VALUES
  ('70', '1', '467', 'MONTEBELLO');
INSERT INTO municipios
VALUES
  ('71', '1', '475', 'MURINDO');
INSERT INTO municipios
VALUES
  ('72', '1', '480', 'MUTATA');
INSERT INTO municipios
VALUES
  ('73', '1', '483', 'NARIO');
INSERT INTO municipios
VALUES
  ('74', '1', '490', 'NECOCLI');
INSERT INTO municipios
VALUES
  ('75', '1', '495', 'NECHI');
INSERT INTO municipios
VALUES
  ('76', '1', '501', 'OLAYA');
INSERT INTO municipios
VALUES
  ('77', '1', '541', 'PEOL');
INSERT INTO municipios
VALUES
  ('78', '1', '543', 'PEQUE');
INSERT INTO municipios
VALUES
  ('79', '1', '576', 'PUEBLORRICO');
INSERT INTO municipios
VALUES
  ('80', '1', '579', 'PUERTO BERRIO');
INSERT INTO municipios
VALUES
  ('81', '1', '585', 'PUERTO NARE(LAMAGDALENA');;
INSERT INTO municipios
VALUES
  ('82', '1', '591', 'PUERTO TRIUNFO');
INSERT INTO municipios
VALUES
  ('83', '1', '604', 'REMEDIOS');
INSERT INTO municipios
VALUES
  ('84', '1', '607', 'RETIRO');
INSERT INTO municipios
VALUES
  ('85', '1', '615', 'RIONEGRO');
INSERT INTO municipios
VALUES
  ('86', '1', '628', 'SABANALARGA');
INSERT INTO municipios
VALUES
  ('87', '1', '631', 'SABANETA');
INSERT INTO municipios
VALUES
  ('88', '1', '642', 'SALGAR');
INSERT INTO municipios
VALUES
  ('89', '1', '647', 'SAN ANDRES');
INSERT INTO municipios
VALUES
  ('90', '1', '649', 'SAN CARLOS');
INSERT INTO municipios
VALUES
  ('91', '1', '652', 'SAN FRANCISCO');
INSERT INTO municipios
VALUES
  ('92', '1', '656', 'SAN JERONIMO');
INSERT INTO municipios
VALUES
  ('93', '1', '658', 'SAN JOSE DE LA MONTAA');
INSERT INTO municipios
VALUES
  ('94', '1', '659', 'SAN JUAN DE URABA');
INSERT INTO municipios
VALUES
  ('95', '1', '660', 'SAN LUIS');
INSERT INTO municipios
VALUES
  ('96', '1', '664', 'SAN PEDRO');
INSERT INTO municipios
VALUES
  ('97', '1', '665', 'SAN PEDRO DE URABA');
INSERT INTO municipios
VALUES
  ('98', '1', '667', 'SAN RAFAEL');
INSERT INTO municipios
VALUES
  ('99', '1', '670', 'SAN ROQUE');
INSERT INTO municipios
VALUES
  ('100', '1', '674', 'SAN VICENTE');
INSERT INTO municipios
VALUES
  ('101', '1', '679', 'SANTA BARBARA');
INSERT INTO municipios
VALUES
  ('102', '1', '686', 'SANTA ROSA DE OSOS');
INSERT INTO municipios
VALUES
  ('103', '1', '690', 'SANTO DOMINGO');
INSERT INTO municipios
VALUES
  ('104', '1', '697', 'EL SANTUARIO');
INSERT INTO municipios
VALUES
  ('105', '1', '736', 'SEGOVIA');
INSERT INTO municipios
VALUES
  ('106', '1', '756', 'SONSON');
INSERT INTO municipios
VALUES
  ('107', '1', '761', 'SOPETRAN');
INSERT INTO municipios
VALUES
  ('108', '1', '789', 'TAMESIS');
INSERT INTO municipios
VALUES
  ('109', '1', '790', 'TARAZA');
INSERT INTO municipios
VALUES
  ('110', '1', '792', 'TARSO');
INSERT INTO municipios
VALUES
  ('111', '1', '809', 'TITIRIBI');
INSERT INTO municipios
VALUES
  ('112', '1', '819', 'TOLEDO');
INSERT INTO municipios
VALUES
  ('113', '1', '837', 'TURBO');
INSERT INTO municipios
VALUES
  ('114', '1', '842', 'URAMITA');
INSERT INTO municipios
VALUES
  ('115', '1', '847', 'URRAO');
INSERT INTO municipios
VALUES
  ('116', '1', '854', 'VALDIVIA');
INSERT INTO municipios
VALUES
  ('117', '1', '856', 'VALPARAISO');
INSERT INTO municipios
VALUES
  ('118', '1', '858', 'VEGACHI');
INSERT INTO municipios
VALUES
  ('119', '1', '861', 'VENECIA');
INSERT INTO municipios
VALUES
  ('120', '1', '873', 'VIGIA DEL FUERTE');
INSERT INTO municipios
VALUES
  ('121', '1', '885', 'YALI');
INSERT INTO municipios
VALUES
  ('122', '1', '887', 'YARUMAL');
INSERT INTO municipios
VALUES
  ('123', '1', '890', 'YOLOMBO');
INSERT INTO municipios
VALUES
  ('124', '1', '893', 'YONDO');
INSERT INTO municipios
VALUES
  ('125', '1', '895', 'ZARAGOZA');
INSERT INTO municipios
VALUES
  ('126', '1', '991', 'ALTAMIRA');
INSERT INTO municipios
VALUES
  ('127', '1', '992', 'SAN CRISTOBAL');
INSERT INTO municipios
VALUES
  ('129', '2', '001', 'BARRANQUILLA');
INSERT INTO municipios
VALUES
  ('130', '2', '078', 'BARANOA');
INSERT INTO municipios
VALUES
  ('131', '2', '137', 'CAMPO DE LA CRUZ');
INSERT INTO municipios
VALUES
  ('132', '2', '141', 'CANDELARIA');
INSERT INTO municipios
VALUES
  ('133', '2', '296', 'GALAPA');
INSERT INTO municipios
VALUES
  ('134', '2', '372', 'JUAN DE ACOSTA');
INSERT INTO municipios
VALUES
  ('135', '2', '421', 'LURUACO');
INSERT INTO municipios
VALUES
  ('136', '2', '433', 'MALAMBO');
INSERT INTO municipios
VALUES
  ('137', '2', '436', 'MANATI');
INSERT INTO municipios
VALUES
  ('138', '2', '520', 'PALMAR DE VARELA');
INSERT INTO municipios
VALUES
  ('139', '2', '549', 'PIOJO');
INSERT INTO municipios
VALUES
  ('140', '2', '558', 'POLONUEVO');
INSERT INTO municipios
VALUES
  ('141', '2', '560', 'PONEDERA');
INSERT INTO municipios
VALUES
  ('142', '2', '573', 'PUERTO COLOMBIA');
INSERT INTO municipios
VALUES
  ('143', '2', '606', 'REPELON');
INSERT INTO municipios
VALUES
  ('144', '2', '634', 'SABANAGRANDE');
INSERT INTO municipios
VALUES
  ('145', '2', '638', 'SABANALARGA');
INSERT INTO municipios
VALUES
  ('146', '2', '675', 'SANTA LUCIA');
INSERT INTO municipios
VALUES
  ('147', '2', '685', 'SANTO TOMAS');
INSERT INTO municipios
VALUES
  ('148', '2', '758', 'SOLEDAD');
INSERT INTO municipios
VALUES
  ('149', '2', '770', 'SUAN');
INSERT INTO municipios
VALUES
  ('150', '2', '832', 'TUBARA');
INSERT INTO municipios
VALUES
  ('151', '2', '849', 'USIACURI');
INSERT INTO municipios
VALUES
  ('152', '3', '001', 'SANTAFE DE BOGOTA D.');
INSERT INTO municipios
VALUES
  ('154', '4', '001', 'CARTAGENA');
INSERT INTO municipios
VALUES
  ('155', '4', '006', 'ACHI');
INSERT INTO municipios
VALUES
  ('156', '4', '030', 'ALTOS DEL ROSARIO');
INSERT INTO municipios
VALUES
  ('157', '4', '042', 'ARENAL');
INSERT INTO municipios
VALUES
  ('158', '4', '052', 'ARJONA');
INSERT INTO municipios
VALUES
  ('159', '4', '062', 'ARROYOHONDO');
INSERT INTO municipios
VALUES
  ('160', '4', '074', 'BARRANCO DE LOBA');
INSERT INTO municipios
VALUES
  ('161', '4', '140', 'CALAMAR');
INSERT INTO municipios
VALUES
  ('162', '4', '160', 'CANTAGALLO');
INSERT INTO municipios
VALUES
  ('163', '4', '188', 'CICUCO');
INSERT INTO municipios
VALUES
  ('164', '4', '212', 'CORDOBA');
INSERT INTO municipios
VALUES
  ('165', '4', '222', 'CLEMENCIA');
INSERT INTO municipios
VALUES
  ('166', '4', '244', 'EL CARMEN DE BOLIVAR');
INSERT INTO municipios
VALUES
  ('167', '4', '248', 'EL GUAMO');
INSERT INTO municipios
VALUES
  ('168', '4', '268', 'EL PEON');
INSERT INTO municipios
VALUES
  ('169', '4', '300', 'HATILLO DE LOBA');
INSERT INTO municipios
VALUES
  ('170', '4', '430', 'MAGANGUE');
INSERT INTO municipios
VALUES
  ('171', '4', '433', 'MAHATES');
INSERT INTO municipios
VALUES
  ('172', '4', '440', 'MARGARITA');
INSERT INTO municipios
VALUES
  ('173', '4', '442', 'MARIA LA BAJA');
INSERT INTO municipios
VALUES
  ('174', '4', '458', 'MONTECRISTO');
INSERT INTO municipios
VALUES
  ('175', '4', '468', 'MOMPOS');
INSERT INTO municipios
VALUES
  ('176', '4', '473', 'MORALES');
INSERT INTO municipios
VALUES
  ('177', '4', '549', 'PINILLOS');
INSERT INTO municipios
VALUES
  ('178', '4', '580', 'REGIDOR');
INSERT INTO municipios
VALUES
  ('179', '4', '600', 'RIO VIEJO');
INSERT INTO municipios
VALUES
  ('180', '4', '620', 'SAN CRISTOBAL');
INSERT INTO municipios
VALUES
  ('181', '4', '647', 'SAN ESTANISLAO');
INSERT INTO municipios
VALUES
  ('182', '4', '650', 'SAN FERNANDO');
INSERT INTO municipios
VALUES
  ('183', '4', '654', 'SAN JACINTO');
INSERT INTO municipios
VALUES
  ('184', '4', '655', 'SAN JACINTO DEL CAUCA');
INSERT INTO municipios
VALUES
  ('185', '4', '657', 'SAN JUAN NEPOMUCENO');
INSERT INTO municipios
VALUES
  ('186', '4', '667', 'SAN MARTIN DE LOBA');
INSERT INTO municipios
VALUES
  ('187', '4', '670', 'SAN PABLO');
INSERT INTO municipios
VALUES
  ('188', '4', '673', 'SANTA CATALINA');
INSERT INTO municipios
VALUES
  ('189', '4', '683', 'SANTA ROSA');
INSERT INTO municipios
VALUES
  ('190', '4', '688', 'SANTA ROSA DEL SUR');
INSERT INTO municipios
VALUES
  ('191', '4', '744', 'SIMITI');
INSERT INTO municipios
VALUES
  ('192', '4', '760', 'SOPLAVIENTO');
INSERT INTO municipios
VALUES
  ('193', '4', '780', 'TALAIGUA NUEVO');
INSERT INTO municipios
VALUES
  ('194', '4', '810', 'TIQUISIO');
INSERT INTO municipios
VALUES
  ('195', '4', '836', 'TURBACO');
INSERT INTO municipios
VALUES
  ('196', '4', '838', 'TURBANA');
INSERT INTO municipios
VALUES
  ('197', '4', '873', 'VILLANUEVA');
INSERT INTO municipios
VALUES
  ('198', '4', '894', 'ZAMBRANO');
INSERT INTO municipios
VALUES
  ('199', '5', '001', 'TUNJA');
INSERT INTO municipios
VALUES
  ('200', '5', '022', 'ALMEIDA');
INSERT INTO municipios
VALUES
  ('201', '5', '047', 'AQUITANIA');
INSERT INTO municipios
VALUES
  ('202', '5', '051', 'ARCABUCO');
INSERT INTO municipios
VALUES
  ('203', '5', '087', 'BELEN');
INSERT INTO municipios
VALUES
  ('204', '5', '090', 'BERBEO');
INSERT INTO municipios
VALUES
  ('205', '5', '092', 'BETEITIVA');
INSERT INTO municipios
VALUES
  ('206', '5', '097', 'BOAVITA');
INSERT INTO municipios
VALUES
  ('207', '5', '104', 'BOYACA');
INSERT INTO municipios
VALUES
  ('208', '5', '106', 'BRICENO');
INSERT INTO municipios
VALUES
  ('209', '5', '109', 'BUENAVISTA');
INSERT INTO municipios
VALUES
  ('210', '5', '114', 'BUSBANZA');
INSERT INTO municipios
VALUES
  ('211', '5', '131', 'CALDAS');
INSERT INTO municipios
VALUES
  ('212', '5', '135', 'CAMPOHERMOSO');
INSERT INTO municipios
VALUES
  ('213', '5', '162', 'CERINZA');
INSERT INTO municipios
VALUES
  ('214', '5', '172', 'CHINAVITA');
INSERT INTO municipios
VALUES
  ('215', '5', '176', 'CHIQUINQUIRA');
INSERT INTO municipios
VALUES
  ('216', '5', '180', 'CHISCAS');
INSERT INTO municipios
VALUES
  ('217', '5', '183', 'CHITA');
INSERT INTO municipios
VALUES
  ('218', '5', '185', 'CHITARAQUE');
INSERT INTO municipios
VALUES
  ('219', '5', '187', 'CHIVATA');
INSERT INTO municipios
VALUES
  ('220', '5', '189', 'CIENEGA');
INSERT INTO municipios
VALUES
  ('221', '5', '204', 'COMBITA');
INSERT INTO municipios
VALUES
  ('222', '5', '212', 'COPER');
INSERT INTO municipios
VALUES
  ('223', '5', '215', 'CORRALES');
INSERT INTO municipios
VALUES
  ('224', '5', '218', 'COVARACHIA');
INSERT INTO municipios
VALUES
  ('225', '5', '223', 'CUBARA');
INSERT INTO municipios
VALUES
  ('226', '5', '224', 'CUCAITA');
INSERT INTO municipios
VALUES
  ('227', '5', '226', 'CUITIVA');
INSERT INTO municipios
VALUES
  ('228', '5', '232', 'CHIQUIZA');
INSERT INTO municipios
VALUES
  ('229', '5', '236', 'CHIVOR');
INSERT INTO municipios
VALUES
  ('230', '5', '238', 'DUITAMA');
INSERT INTO municipios
VALUES
  ('231', '5', '244', 'EL COCUY');
INSERT INTO municipios
VALUES
  ('232', '5', '248', 'EL ESPINO');
INSERT INTO municipios
VALUES
  ('233', '5', '272', 'FIRAVITOBA');
INSERT INTO municipios
VALUES
  ('234', '5', '276', 'FLORESTA');
INSERT INTO municipios
VALUES
  ('235', '5', '293', 'GACHANTIVA');
INSERT INTO municipios
VALUES
  ('236', '5', '296', 'GAMEZA');
INSERT INTO municipios
VALUES
  ('237', '5', '299', 'GARAGOA');
INSERT INTO municipios
VALUES
  ('238', '5', '317', 'GUACAMAYAS');
INSERT INTO municipios
VALUES
  ('239', '5', '322', 'GUATEQUE');
INSERT INTO municipios
VALUES
  ('240', '5', '325', 'GUAYATA');
INSERT INTO municipios
VALUES
  ('241', '5', '332', 'GUICAN');
INSERT INTO municipios
VALUES
  ('242', '5', '362', 'IZA');
INSERT INTO municipios
VALUES
  ('243', '5', '367', 'JENESANO');
INSERT INTO municipios
VALUES
  ('244', '5', '368', 'JERICO');
INSERT INTO municipios
VALUES
  ('245', '5', '377', 'LABRANZAGRANDE');
INSERT INTO municipios
VALUES
  ('246', '5', '380', 'LA CAPILLA');
INSERT INTO municipios
VALUES
  ('247', '5', '401', 'LA VICTORIA');
INSERT INTO municipios
VALUES
  ('248', '5', '403', 'LA UVITA');
INSERT INTO municipios
VALUES
  ('249', '5', '407', 'VILLA DE LEYVA');
INSERT INTO municipios
VALUES
  ('250', '5', '425', 'MACANAL');
INSERT INTO municipios
VALUES
  ('251', '5', '442', 'MARIPI');
INSERT INTO municipios
VALUES
  ('252', '5', '455', 'MIRAFLORES');
INSERT INTO municipios
VALUES
  ('253', '5', '464', 'MONGUA');
INSERT INTO municipios
VALUES
  ('254', '5', '466', 'MONGUI');
INSERT INTO municipios
VALUES
  ('255', '5', '469', 'MONIQUIRA');
INSERT INTO municipios
VALUES
  ('256', '5', '476', 'MOTAVITA');
INSERT INTO municipios
VALUES
  ('257', '5', '480', 'MUZO');
INSERT INTO municipios
VALUES
  ('258', '5', '491', 'NOBSA');
INSERT INTO municipios
VALUES
  ('259', '5', '494', 'NUEVO COLON');
INSERT INTO municipios
VALUES
  ('260', '5', '500', 'OICATA');
INSERT INTO municipios
VALUES
  ('261', '5', '507', 'OTANCHE');
INSERT INTO municipios
VALUES
  ('262', '5', '511', 'PACHAVITA');
INSERT INTO municipios
VALUES
  ('263', '5', '514', 'PAEZ');
INSERT INTO municipios
VALUES
  ('264', '5', '516', 'PAIPA');
INSERT INTO municipios
VALUES
  ('265', '5', '518', 'PAJARITO');
INSERT INTO municipios
VALUES
  ('266', '5', '522', 'PANQUEBA');
INSERT INTO municipios
VALUES
  ('267', '5', '531', 'PAUNA');
INSERT INTO municipios
VALUES
  ('268', '5', '533', 'PAYA');
INSERT INTO municipios
VALUES
  ('269', '5', '537', 'PAZ DE RIO');
INSERT INTO municipios
VALUES
  ('270', '5', '542', 'PESCA');
INSERT INTO municipios
VALUES
  ('271', '5', '550', 'PISBA');
INSERT INTO municipios
VALUES
  ('272', '5', '572', 'PUERTO BOYACA');
INSERT INTO municipios
VALUES
  ('273', '5', '580', 'QUIPAMA');
INSERT INTO municipios
VALUES
  ('274', '5', '599', 'RAMIRIQUI');
INSERT INTO municipios
VALUES
  ('275', '5', '600', 'RAQUIRA');
INSERT INTO municipios
VALUES
  ('276', '5', '621', 'RONDON');
INSERT INTO municipios
VALUES
  ('277', '5', '632', 'SABOYA');
INSERT INTO municipios
VALUES
  ('278', '5', '638', 'SACHICA');
INSERT INTO municipios
VALUES
  ('279', '5', '646', 'SAMACA');
INSERT INTO municipios
VALUES
  ('280', '5', '660', 'SAN EDUARDO');
INSERT INTO municipios
VALUES
  ('281', '5', '664', 'SAN JOSE DE PARE');
INSERT INTO municipios
VALUES
  ('282', '5', '667', 'SAN LUIS DE GACENO');
INSERT INTO municipios
VALUES
  ('283', '5', '673', 'SAN MATEO');
INSERT INTO municipios
VALUES
  ('284', '5', '676', 'SAN MIGUEL DE SEMA');
INSERT INTO municipios
VALUES
  ('285', '5', '681', 'SAN PABLO DE BORBUR');
INSERT INTO municipios
VALUES
  ('286', '5', '686', 'SANTANA');
INSERT INTO municipios
VALUES
  ('287', '5', '690', 'SANTA MARIA');
INSERT INTO municipios
VALUES
  ('288', '5', '693', 'SANTA ROSA DE VITERB');
INSERT INTO municipios
VALUES
  ('289', '5', '696', 'SANTA SOFIA');
INSERT INTO municipios
VALUES
  ('290', '5', '720', 'SATIVANORTE');
INSERT INTO municipios
VALUES
  ('291', '5', '723', 'SATIVASUR');
INSERT INTO municipios
VALUES
  ('292', '5', '740', 'SIACHOQUE');
INSERT INTO municipios
VALUES
  ('293', '5', '753', 'SOATA');
INSERT INTO municipios
VALUES
  ('294', '5', '755', 'SOCOTA');
INSERT INTO municipios
VALUES
  ('295', '5', '757', 'SOCHA');
INSERT INTO municipios
VALUES
  ('296', '5', '759', 'SOGAMOSO');
INSERT INTO municipios
VALUES
  ('297', '5', '761', 'SOMONDOCO');
INSERT INTO municipios
VALUES
  ('298', '5', '762', 'SORA');
INSERT INTO municipios
VALUES
  ('299', '5', '763', 'SOTAQUIRA');
INSERT INTO municipios
VALUES
  ('300', '5', '764', 'SORACA');
INSERT INTO municipios
VALUES
  ('301', '5', '774', 'SUSACON');
INSERT INTO municipios
VALUES
  ('302', '5', '776', 'SUTAMARCHAN');
INSERT INTO municipios
VALUES
  ('303', '5', '778', 'SUTATENZA');
INSERT INTO municipios
VALUES
  ('304', '5', '790', 'TASCO');
INSERT INTO municipios
VALUES
  ('305', '5', '798', 'TENZA');
INSERT INTO municipios
VALUES
  ('306', '5', '804', 'TIBANA');
INSERT INTO municipios
VALUES
  ('307', '5', '806', 'TIBASOSA');
INSERT INTO municipios
VALUES
  ('308', '5', '808', 'TINJACA');
INSERT INTO municipios
VALUES
  ('309', '5', '810', 'TIPACOQUE');
INSERT INTO municipios
VALUES
  ('310', '5', '814', 'TOCA');
INSERT INTO municipios
VALUES
  ('311', '5', '816', 'TOGUI');
INSERT INTO municipios
VALUES
  ('312', '5', '820', 'TOPAGA');
INSERT INTO municipios
VALUES
  ('313', '5', '822', 'TOTA');
INSERT INTO municipios
VALUES
  ('314', '5', '832', 'TUNUNGUA');
INSERT INTO municipios
VALUES
  ('315', '5', '835', 'TURMEQUE');
INSERT INTO municipios
VALUES
  ('316', '5', '837', 'TUTA');
INSERT INTO municipios
VALUES
  ('317', '5', '839', 'TUTASA');
INSERT INTO municipios
VALUES
  ('318', '5', '842', 'UMBITA');
INSERT INTO municipios
VALUES
  ('319', '5', '861', 'VENTAQUEMADA');
INSERT INTO municipios
VALUES
  ('320', '5', '879', 'VIRACACHA');
INSERT INTO municipios
VALUES
  ('321', '5', '897', 'ZETAQUIRA');
INSERT INTO municipios
VALUES
  ('322', '6', '001', 'MANIZALES');
INSERT INTO municipios
VALUES
  ('323', '6', '013', 'AGUADAS');
INSERT INTO municipios
VALUES
  ('324', '6', '042', 'ANSERMA');
INSERT INTO municipios
VALUES
  ('325', '6', '050', 'ARANZAZU');
INSERT INTO municipios
VALUES
  ('326', '6', '088', 'BELALCAZAR');
INSERT INTO municipios
VALUES
  ('327', '6', '174', 'CHINCHINA');
INSERT INTO municipios
VALUES
  ('328', '6', '272', 'FILADELFIA');
INSERT INTO municipios
VALUES
  ('329', '6', '380', 'LA DORADA');
INSERT INTO municipios
VALUES
  ('330', '6', '388', 'LA MERCED');
INSERT INTO municipios
VALUES
  ('331', '6', '433', 'MANZANARES');
INSERT INTO municipios
VALUES
  ('332', '6', '442', 'MARMATO');
INSERT INTO municipios
VALUES
  ('333', '6', '444', 'MARQUETALIA');
INSERT INTO municipios
VALUES
  ('334', '6', '446', 'MARULANDA');
INSERT INTO municipios
VALUES
  ('335', '6', '486', 'NEIRA');
INSERT INTO municipios
VALUES
  ('336', '6', '495', 'NORCASIA');
INSERT INTO municipios
VALUES
  ('337', '6', '513', 'PACORA');
INSERT INTO municipios
VALUES
  ('338', '6', '524', 'PALESTINA');
INSERT INTO municipios
VALUES
  ('339', '6', '541', 'PENSILVANIA');
INSERT INTO municipios
VALUES
  ('340', '6', '614', 'RIOSUCIO');
INSERT INTO municipios
VALUES
  ('341', '6', '616', 'RISARALDA');
INSERT INTO municipios
VALUES
  ('342', '6', '653', 'SALAMINA');
INSERT INTO municipios
VALUES
  ('343', '6', '662', 'SAMANA');
INSERT INTO municipios
VALUES
  ('344', '6', '665', 'SAN JOSE');
INSERT INTO municipios
VALUES
  ('345', '6', '777', 'SUPIA');
INSERT INTO municipios
VALUES
  ('346', '6', '867', 'VICTORIA');
INSERT INTO municipios
VALUES
  ('347', '6', '873', 'VILLAMARIA');
INSERT INTO municipios
VALUES
  ('348', '6', '877', 'VITERBO');
INSERT INTO municipios
VALUES
  ('349', '6', '991', 'ARAUCA');
INSERT INTO municipios
VALUES
  ('350', '6', '992', 'BOLIVIA');
INSERT INTO municipios
VALUES
  ('351', '6', '993', 'FLORENCIA');
INSERT INTO municipios
VALUES
  ('352', '6', '995', 'SAN FELIX');
INSERT INTO municipios
VALUES
  ('353', '6', '996', 'SAN JOSE DE RISARALDA');
INSERT INTO municipios
VALUES
  ('354', '6', '998', 'ARBOLEDA');
INSERT INTO municipios
VALUES
  ('355', '7', '001', 'FLORENCIA');
INSERT INTO municipios
VALUES
  ('356', '7', '029', 'ALBANIA');
INSERT INTO municipios
VALUES
  ('357', '7', '094', 'BELEN DE LOS ANDAQUI');
INSERT INTO municipios
VALUES
  ('358', '7', '150', 'CARTAGENA DEL CHAIRA');
INSERT INTO municipios
VALUES
  ('359', '7', '205', 'CURILLO');
INSERT INTO municipios
VALUES
  ('360', '7', '247', 'EL DONCELLO');
INSERT INTO municipios
VALUES
  ('361', '7', '256', 'EL PAUJIL');
INSERT INTO municipios
VALUES
  ('362', '7', '410', 'LA MONTAITA');
INSERT INTO municipios
VALUES
  ('363', '7', '460', 'MILAN');
INSERT INTO municipios
VALUES
  ('364', '7', '479', 'MORELIA');
INSERT INTO municipios
VALUES
  ('365', '7', '592', 'PUERTO RICO');
INSERT INTO municipios
VALUES
  ('366', '7', '610', 'SAN JOSE DE FRAGUA');
INSERT INTO municipios
VALUES
  ('367', '7', '753', 'SAN VICENTE DEL CAGU');
INSERT INTO municipios
VALUES
  ('368', '7', '765', 'SOLANO');
INSERT INTO municipios
VALUES
  ('369', '7', '785', 'SOLITA');
INSERT INTO municipios
VALUES
  ('370', '7', '860', 'VALPARAISO');
INSERT INTO municipios
VALUES
  ('371', '8', '001', 'POPAYAN');
INSERT INTO municipios
VALUES
  ('372', '8', '022', 'ALMAGUER');
INSERT INTO municipios
VALUES
  ('373', '8', '050', 'ARGELIA');
INSERT INTO municipios
VALUES
  ('374', '8', '075', 'BALBOA');
INSERT INTO municipios
VALUES
  ('375', '8', '100', 'BOLIVAR');
INSERT INTO municipios
VALUES
  ('376', '8', '110', 'BUENOS AIRES');
INSERT INTO municipios
VALUES
  ('377', '8', '130', 'CAJIBIO');
INSERT INTO municipios
VALUES
  ('378', '8', '137', 'CALDONO');
INSERT INTO municipios
VALUES
  ('379', '8', '142', 'CALOTO');
INSERT INTO municipios
VALUES
  ('380', '8', '212', 'CORINTO');
INSERT INTO municipios
VALUES
  ('381', '8', '256', 'EL TAMBO');
INSERT INTO municipios
VALUES
  ('382', '8', '290', 'FLORENCIA');
INSERT INTO municipios
VALUES
  ('383', '8', '318', 'GUAPI');
INSERT INTO municipios
VALUES
  ('384', '8', '355', 'INZA');
INSERT INTO municipios
VALUES
  ('385', '8', '364', 'JAMBALO');
INSERT INTO municipios
VALUES
  ('386', '8', '392', 'LA SIERRA');
INSERT INTO municipios
VALUES
  ('387', '8', '397', 'LA VEGA');
INSERT INTO municipios
VALUES
  ('388', '8', '418', 'LOPEZ');
INSERT INTO municipios
VALUES
  ('389', '8', '450', 'MERCADERES');
INSERT INTO municipios
VALUES
  ('390', '8', '455', 'MIRANDA');
INSERT INTO municipios
VALUES
  ('391', '8', '473', 'MORALES');
INSERT INTO municipios
VALUES
  ('392', '8', '513', 'PADILLA');
INSERT INTO municipios
VALUES
  ('393', '8', '517', 'PAEZ');
INSERT INTO municipios
VALUES
  ('394', '8', '532', 'PATIA(EL BORDO)');
INSERT INTO municipios
VALUES
  ('395', '8', '533', 'PIAMONTE');
INSERT INTO municipios
VALUES
  ('396', '8', '548', 'PIENDAMO');
INSERT INTO municipios
VALUES
  ('397', '8', '573', 'PUERTO TEJADA');
INSERT INTO municipios
VALUES
  ('398', '8', '585', 'PURACE');
INSERT INTO municipios
VALUES
  ('399', '8', '622', 'ROSAS');
INSERT INTO municipios
VALUES
  ('400', '8', '693', 'SAN SEBASTIAN');
INSERT INTO municipios
VALUES
  ('401', '8', '698', 'SANTANDER DE QUILICH');
INSERT INTO municipios
VALUES
  ('402', '8', '701', 'SANTA ROSA');
INSERT INTO municipios
VALUES
  ('403', '8', '743', 'SILVIA');
INSERT INTO municipios
VALUES
  ('404', '8', '760', 'SOTARA');
INSERT INTO municipios
VALUES
  ('405', '8', '780', 'SUAREZ');
INSERT INTO municipios
VALUES
  ('406', '8', '785', 'SUCRE');
INSERT INTO municipios
VALUES
  ('407', '8', '807', 'TIMBIO');
INSERT INTO municipios
VALUES
  ('408', '8', '809', 'TIMBIQUI');
INSERT INTO municipios
VALUES
  ('409', '8', '821', 'TORIBIO');
INSERT INTO municipios
VALUES
  ('410', '8', '824', 'TOTORO');
INSERT INTO municipios
VALUES
  ('411', '8', '845', 'VILLA RICA');
INSERT INTO municipios
VALUES
  ('412', '9', '001', 'VALLEDUPAR');
INSERT INTO municipios
VALUES
  ('413', '9', '011', 'AGUACHICA');
INSERT INTO municipios
VALUES
  ('414', '9', '013', 'AGUSTIN CODAZZI');
INSERT INTO municipios
VALUES
  ('415', '9', '032', 'ASTREA');
INSERT INTO municipios
VALUES
  ('416', '9', '045', 'BECERRIL');
INSERT INTO municipios
VALUES
  ('417', '9', '060', 'BOSCONIA');
INSERT INTO municipios
VALUES
  ('418', '9', '175', 'CHIMICHAGUA');
INSERT INTO municipios
VALUES
  ('419', '9', '178', 'CHIRIGUANA');
INSERT INTO municipios
VALUES
  ('420', '9', '228', 'CURUMANI');
INSERT INTO municipios
VALUES
  ('421', '9', '238', 'EL COPEY');
INSERT INTO municipios
VALUES
  ('422', '9', '250', 'EL PASO');
INSERT INTO municipios
VALUES
  ('423', '9', '295', 'GAMARRA');
INSERT INTO municipios
VALUES
  ('424', '9', '310', 'GONZALEZ');
INSERT INTO municipios
VALUES
  ('425', '9', '383', 'LA GLORIA');
INSERT INTO municipios
VALUES
  ('426', '9', '400', 'LA JAGUA DE IBIRICO');
INSERT INTO municipios
VALUES
  ('427', '9', '443', 'MANAURE BALCON DL CE');
INSERT INTO municipios
VALUES
  ('428', '9', '517', 'PAILITAS');
INSERT INTO municipios
VALUES
  ('429', '9', '550', 'PELAYA');
INSERT INTO municipios
VALUES
  ('430', '9', '570', 'PUEBLO BELLO');
INSERT INTO municipios
VALUES
  ('431', '9', '614', 'RIO DE ORO');
INSERT INTO municipios
VALUES
  ('432', '9', '621', 'LA PAZ');
INSERT INTO municipios
VALUES
  ('433', '9', '710', 'SAN ALBERTO');
INSERT INTO municipios
VALUES
  ('434', '9', '750', 'SAN DIEGO');
INSERT INTO municipios
VALUES
  ('435', '9', '770', 'SAN MARTIN');
INSERT INTO municipios
VALUES
  ('436', '9', '787', 'TAMALAMEQUE');
INSERT INTO municipios
VALUES
  ('437', '10', '001', 'MONTERIA');
INSERT INTO municipios
VALUES
  ('438', '10', '068', 'AYAPEL');
INSERT INTO municipios
VALUES
  ('439', '10', '079', 'BUENAVISTA');
INSERT INTO municipios
VALUES
  ('440', '10', '090', 'CANALETE');
INSERT INTO municipios
VALUES
  ('441', '10', '162', 'CERETE');
INSERT INTO municipios
VALUES
  ('442', '10', '168', 'CHIMA');
INSERT INTO municipios
VALUES
  ('443', '10', '182', 'CHINU');
INSERT INTO municipios
VALUES
  ('444', '10', '189', 'CIENAGA DE ORO');
INSERT INTO municipios
VALUES
  ('445', '10', '300', 'COTORRA');
INSERT INTO municipios
VALUES
  ('446', '10', '350', 'LA APARTADA');
INSERT INTO municipios
VALUES
  ('447', '10', '417', 'LORICA');
INSERT INTO municipios
VALUES
  ('448', '10', '419', 'LOS CORDOBAS');
INSERT INTO municipios
VALUES
  ('449', '10', '464', 'MOMIL');
INSERT INTO municipios
VALUES
  ('450', '10', '466', 'MONTELIBANO');
INSERT INTO municipios
VALUES
  ('451', '10', '500', 'MOITOS');
INSERT INTO municipios
VALUES
  ('452', '10', '555', 'PLANETA RICA');
INSERT INTO municipios
VALUES
  ('453', '10', '570', 'PUEBLO NUEVO');
INSERT INTO municipios
VALUES
  ('454', '10', '574', 'PUERTO ESCONDIDO');
INSERT INTO municipios
VALUES
  ('455', '10', '580', 'PUERTO LIBERTADOR');
INSERT INTO municipios
VALUES
  ('456', '10', '586', 'PURISIMA');
INSERT INTO municipios
VALUES
  ('457', '10', '660', 'SAHAGUN');
INSERT INTO municipios
VALUES
  ('458', '10', '670', 'SAN ANDRES SOTAVENTO');
INSERT INTO municipios
VALUES
  ('459', '10', '672', 'SAN ANTERO');
INSERT INTO municipios
VALUES
  ('460', '10', '675', 'SAN BERNARDO DEL VIE');
INSERT INTO municipios
VALUES
  ('461', '10', '678', 'SAN CARLOS');
INSERT INTO municipios
VALUES
  ('462', '10', '686', 'SAN PELAYO');
INSERT INTO municipios
VALUES
  ('463', '10', '807', 'TIERRALTA');
INSERT INTO municipios
VALUES
  ('464', '10', '855', 'VALENCIA');
INSERT INTO municipios
VALUES
  ('465', '11', '001', 'AGUA DE DIOS');
INSERT INTO municipios
VALUES
  ('466', '11', '019', 'ALBAN');
INSERT INTO municipios
VALUES
  ('467', '11', '035', 'ANAPOIMA');
INSERT INTO municipios
VALUES
  ('468', '11', '040', 'ANOLAIMA');
INSERT INTO municipios
VALUES
  ('469', '11', '053', 'ARBELAEZ');
INSERT INTO municipios
VALUES
  ('470', '11', '086', 'BELTRAN');
INSERT INTO municipios
VALUES
  ('471', '11', '095', 'BITUIMA');
INSERT INTO municipios
VALUES
  ('472', '11', '099', 'BOJACA');
INSERT INTO municipios
VALUES
  ('473', '11', '120', 'CABRERA');
INSERT INTO municipios
VALUES
  ('474', '11', '123', 'CACHIPAY');
INSERT INTO municipios
VALUES
  ('475', '11', '126', 'CAJICA');
INSERT INTO municipios
VALUES
  ('476', '11', '148', 'CAPARRAPI');
INSERT INTO municipios
VALUES
  ('477', '11', '151', 'CAQUEZA');
INSERT INTO municipios
VALUES
  ('478', '11', '154', 'CARMEN DE CARUPA');
INSERT INTO municipios
VALUES
  ('479', '11', '168', 'CHAGUANI');
INSERT INTO municipios
VALUES
  ('480', '11', '175', 'CHIA');
INSERT INTO municipios
VALUES
  ('481', '11', '178', 'CHIPAQUE');
INSERT INTO municipios
VALUES
  ('482', '11', '181', 'CHOACHI');
INSERT INTO municipios
VALUES
  ('483', '11', '183', 'CHOCONTA');
INSERT INTO municipios
VALUES
  ('484', '11', '200', 'COGUA');
INSERT INTO municipios
VALUES
  ('485', '11', '214', 'COTA');
INSERT INTO municipios
VALUES
  ('486', '11', '224', 'CUCUNUBA');
INSERT INTO municipios
VALUES
  ('487', '11', '245', 'EL COLEGIO');
INSERT INTO municipios
VALUES
  ('488', '11', '258', 'EL PENON');
INSERT INTO municipios
VALUES
  ('489', '11', '260', 'EL ROSAL');
INSERT INTO municipios
VALUES
  ('490', '11', '269', 'FACATATIVA');
INSERT INTO municipios
VALUES
  ('491', '11', '279', 'FOMEQUE');
INSERT INTO municipios
VALUES
  ('492', '11', '281', 'FOSCA');
INSERT INTO municipios
VALUES
  ('493', '11', '286', 'FUNZA');
INSERT INTO municipios
VALUES
  ('494', '11', '288', 'FUQUENE');
INSERT INTO municipios
VALUES
  ('495', '11', '290', 'FUSAGASUGA');
INSERT INTO municipios
VALUES
  ('496', '11', '293', 'GACHALA');
INSERT INTO municipios
VALUES
  ('497', '11', '295', 'GACHANCIPA');
INSERT INTO municipios
VALUES
  ('498', '11', '297', 'GACHETA');
INSERT INTO municipios
VALUES
  ('499', '11', '299', 'GAMA');
INSERT INTO municipios
VALUES
  ('500', '11', '307', 'GIRARDOT');
INSERT INTO municipios
VALUES
  ('501', '11', '312', 'GRANADA');
INSERT INTO municipios
VALUES
  ('502', '11', '317', 'GUACHETA');
INSERT INTO municipios
VALUES
  ('503', '11', '320', 'GUADUAS');
INSERT INTO municipios
VALUES
  ('504', '11', '322', 'GUASCA');
INSERT INTO municipios
VALUES
  ('505', '11', '324', 'GUATAQUI');
INSERT INTO municipios
VALUES
  ('506', '11', '326', 'GUATAVITA');
INSERT INTO municipios
VALUES
  ('507', '11', '328', 'GUAYABAL DE SIQUIMA');
INSERT INTO municipios
VALUES
  ('508', '11', '335', 'GUAYABETAL');
INSERT INTO municipios
VALUES
  ('509', '11', '339', 'GUTIERREZ');
INSERT INTO municipios
VALUES
  ('510', '11', '368', 'JERUSALEN');
INSERT INTO municipios
VALUES
  ('511', '11', '372', 'JUNIN');
INSERT INTO municipios
VALUES
  ('512', '11', '377', 'LA CALERA');
INSERT INTO municipios
VALUES
  ('513', '11', '386', 'LA MESA');
INSERT INTO municipios
VALUES
  ('514', '11', '394', 'LA PALMA');
INSERT INTO municipios
VALUES
  ('515', '11', '398', 'LA PEA');
INSERT INTO municipios
VALUES
  ('516', '11', '402', 'LA VEGA');
INSERT INTO municipios
VALUES
  ('517', '11', '407', 'LENGUAZAQUE');
INSERT INTO municipios
VALUES
  ('518', '11', '426', 'MACHETA');
INSERT INTO municipios
VALUES
  ('519', '11', '430', 'MADRID');
INSERT INTO municipios
VALUES
  ('520', '11', '436', 'MANTA');
INSERT INTO municipios
VALUES
  ('521', '11', '438', 'MEDINA');
INSERT INTO municipios
VALUES
  ('522', '11', '473', 'MOSQUERA');
INSERT INTO municipios
VALUES
  ('523', '11', '483', 'NARIÑO');
INSERT INTO municipios
VALUES
  ('524', '11', '486', 'NEMOCON');
INSERT INTO municipios
VALUES
  ('525', '11', '488', 'NILO');
INSERT INTO municipios
VALUES
  ('526', '11', '489', 'NIMAIMA');
INSERT INTO municipios
VALUES
  ('527', '11', '491', 'NOCAIMA');
INSERT INTO municipios
VALUES
  ('528', '11', '506', 'VENECIA');
INSERT INTO municipios
VALUES
  ('529', '11', '513', 'PACHO');
INSERT INTO municipios
VALUES
  ('530', '11', '518', 'PAIME');
INSERT INTO municipios
VALUES
  ('531', '11', '524', 'PANDI');
INSERT INTO municipios
VALUES
  ('532', '11', '530', 'PARATEBUENO');
INSERT INTO municipios
VALUES
  ('533', '11', '535', 'PASCA');
INSERT INTO municipios
VALUES
  ('534', '11', '572', 'PUERTO SALGAR');
INSERT INTO municipios
VALUES
  ('535', '11', '580', 'PULI');
INSERT INTO municipios
VALUES
  ('536', '11', '592', 'QUEBRADANEGRA');
INSERT INTO municipios
VALUES
  ('537', '11', '594', 'QUETAME');
INSERT INTO municipios
VALUES
  ('538', '11', '596', 'QUIPILE');
INSERT INTO municipios
VALUES
  ('539', '11', '599', 'APULO');
INSERT INTO municipios
VALUES
  ('540', '11', '612', 'RICAURTE');
INSERT INTO municipios
VALUES
  ('541', '11', '645', 'S.ANTONIO TEQUENDAMA');
INSERT INTO municipios
VALUES
  ('542', '11', '649', 'SAN BERNARDO');
INSERT INTO municipios
VALUES
  ('543', '11', '653', 'SAN CAYETANO');
INSERT INTO municipios
VALUES
  ('544', '11', '658', 'SAN FRANCISCO');
INSERT INTO municipios
VALUES
  ('545', '11', '662', 'SAN JUAN DE RIO SECO');
INSERT INTO municipios
VALUES
  ('546', '11', '718', 'SASAIMA');
INSERT INTO municipios
VALUES
  ('547', '11', '736', 'SESQUILE');
INSERT INTO municipios
VALUES
  ('548', '11', '740', 'SIBATE');
INSERT INTO municipios
VALUES
  ('549', '11', '743', 'SILVANIA');
INSERT INTO municipios
VALUES
  ('550', '11', '745', 'SIMIJACA');
INSERT INTO municipios
VALUES
  ('551', '11', '754', 'SOACHA');
INSERT INTO municipios
VALUES
  ('552', '11', '758', 'SOPO');
INSERT INTO municipios
VALUES
  ('553', '11', '769', 'SUBACHOQUE');
INSERT INTO municipios
VALUES
  ('554', '11', '772', 'SUESCA');
INSERT INTO municipios
VALUES
  ('555', '11', '777', 'SUPATA');
INSERT INTO municipios
VALUES
  ('556', '11', '779', 'SUSA');
INSERT INTO municipios
VALUES
  ('557', '11', '781', 'SUTATAUSA');
INSERT INTO municipios
VALUES
  ('558', '11', '785', 'TABIO');
INSERT INTO municipios
VALUES
  ('559', '11', '793', 'TAUSA');
INSERT INTO municipios
VALUES
  ('560', '11', '797', 'TENA');
INSERT INTO municipios
VALUES
  ('561', '11', '799', 'TENJO');
INSERT INTO municipios
VALUES
  ('562', '11', '805', 'TIBACUY');
INSERT INTO municipios
VALUES
  ('563', '11', '807', 'TIBIRITA');
INSERT INTO municipios
VALUES
  ('564', '11', '815', 'TOCAIMA');
INSERT INTO municipios
VALUES
  ('565', '11', '817', 'TOCANCIPA');
INSERT INTO municipios
VALUES
  ('566', '11', '823', 'TOPAIPI');
INSERT INTO municipios
VALUES
  ('567', '11', '839', 'UBALA');
INSERT INTO municipios
VALUES
  ('568', '11', '841', 'UBAQUE');
INSERT INTO municipios
VALUES
  ('569', '11', '843', '(UBATE) VILLA DE SANDIEGO DE UBATE');
INSERT INTO municipios
VALUES
  ('570', '11', '845', 'UNE');
INSERT INTO municipios
VALUES
  ('571', '11', '851', 'UTICA');
INSERT INTO municipios
VALUES
  ('572', '11', '862', 'VERGARA');
INSERT INTO municipios
VALUES
  ('573', '11', '867', 'VIANI');
INSERT INTO municipios
VALUES
  ('574', '11', '871', 'VILLAGOMEZ');
INSERT INTO municipios
VALUES
  ('575', '11', '873', 'VILLAPINZON');
INSERT INTO municipios
VALUES
  ('576', '11', '875', 'VILLETA');
INSERT INTO municipios
VALUES
  ('577', '11', '878', 'VIOTA');
INSERT INTO municipios
VALUES
  ('578', '11', '885', 'YACOPI');
INSERT INTO municipios
VALUES
  ('579', '11', '898', 'ZIPACON');
INSERT INTO municipios
VALUES
  ('580', '11', '899', 'ZIPAQUIRA');
INSERT INTO municipios
VALUES
  ('581', '12', '001', 'QUIBDO');
INSERT INTO municipios
VALUES
  ('582', '12', '006', 'ACANDI');
INSERT INTO municipios
VALUES
  ('583', '12', '025', 'ALTO BAUDO');
INSERT INTO municipios
VALUES
  ('584', '12', '050', 'ATRATO');
INSERT INTO municipios
VALUES
  ('585', '12', '073', 'BAGADO');
INSERT INTO municipios
VALUES
  ('586', '12', '075', 'BAHIA SOLANO');
INSERT INTO municipios
VALUES
  ('587', '12', '077', 'BAJO BAUDO');
INSERT INTO municipios
VALUES
  ('588', '12', '082', 'BAJO SAN JUAN');
INSERT INTO municipios
VALUES
  ('589', '12', '086', 'BELEN DE BAJIRA');
INSERT INTO municipios
VALUES
  ('590', '12', '099', 'BOJAYA');
INSERT INTO municipios
VALUES
  ('591', '12', '135', 'EL CANTON DE SAN PABLO');
INSERT INTO municipios
VALUES
  ('592', '12', '150', 'CARMEN DEL DARIEN');
INSERT INTO municipios
VALUES
  ('593', '12', '160', 'CERTEGUI');
INSERT INTO municipios
VALUES
  ('594', '12', '205', 'CONDOTO');
INSERT INTO municipios
VALUES
  ('595', '12', '245', 'EL CARMEN DE ATRATO');
INSERT INTO municipios
VALUES
  ('596', '12', '250', 'EL LITORAL DEL SAN JUAN');
INSERT INTO municipios
VALUES
  ('597', '12', '361', 'ITSMINA');
INSERT INTO municipios
VALUES
  ('598', '12', '372', 'JURADO');
INSERT INTO municipios
VALUES
  ('599', '12', '413', 'LLORO');
INSERT INTO municipios
VALUES
  ('600', '12', '425', 'MEDIO ATRATO');
INSERT INTO municipios
VALUES
  ('601', '12', '430', 'MEDIO BAUD');
INSERT INTO municipios
VALUES
  ('602', '12', '450', 'MEDIO SAN JUAN');
INSERT INTO municipios
VALUES
  ('603', '12', '491', 'NOVITA');
INSERT INTO municipios
VALUES
  ('604', '12', '495', 'NUQUI');
INSERT INTO municipios
VALUES
  ('605', '12', '580', 'RO IRO');
INSERT INTO municipios
VALUES
  ('606', '12', '600', 'RO QUITO');
INSERT INTO municipios
VALUES
  ('607', '12', '615', 'RIOSUCIO');
INSERT INTO municipios
VALUES
  ('608', '12', '660', 'SAN JOSE DEL PALMAR');
INSERT INTO municipios
VALUES
  ('609', '12', '745', 'SIPI');
INSERT INTO municipios
VALUES
  ('610', '12', '787', 'TADO');
INSERT INTO municipios
VALUES
  ('611', '12', '800', 'UNGUIA');
INSERT INTO municipios
VALUES
  ('612', '12', '810', 'UNIN PANAMERICANA');
INSERT INTO municipios
VALUES
  ('613', '13', '001', 'NEIVA');
INSERT INTO municipios
VALUES
  ('614', '13', '006', 'ACEVEDO');
INSERT INTO municipios
VALUES
  ('615', '13', '013', 'AGRADO');
INSERT INTO municipios
VALUES
  ('616', '13', '016', 'AIPE');
INSERT INTO municipios
VALUES
  ('617', '13', '020', 'ALGECIRAS');
INSERT INTO municipios
VALUES
  ('618', '13', '026', 'ALTAMIRA');
INSERT INTO municipios
VALUES
  ('619', '13', '078', 'BARAYA');
INSERT INTO municipios
VALUES
  ('620', '13', '132', 'CAMPOALEGRE');
INSERT INTO municipios
VALUES
  ('621', '13', '206', 'COLOMBIA');
INSERT INTO municipios
VALUES
  ('622', '13', '244', 'ELIAS');
INSERT INTO municipios
VALUES
  ('623', '13', '298', 'GARZON');
INSERT INTO municipios
VALUES
  ('624', '13', '306', 'GIGANTE');
INSERT INTO municipios
VALUES
  ('625', '13', '319', 'GUADALUPE');
INSERT INTO municipios
VALUES
  ('626', '13', '349', 'HOBO');
INSERT INTO municipios
VALUES
  ('627', '13', '357', 'IQUIRA');
INSERT INTO municipios
VALUES
  ('628', '13', '359', 'ISNOS');
INSERT INTO municipios
VALUES
  ('629', '13', '378', 'LA ARGENTINA');
INSERT INTO municipios
VALUES
  ('630', '13', '396', 'LA PLATA');
INSERT INTO municipios
VALUES
  ('631', '13', '483', 'NATAGA');
INSERT INTO municipios
VALUES
  ('632', '13', '503', 'OPORAPA');
INSERT INTO municipios
VALUES
  ('633', '13', '518', 'PAICOL');
INSERT INTO municipios
VALUES
  ('634', '13', '524', 'PALERMO');
INSERT INTO municipios
VALUES
  ('635', '13', '530', 'PALESTINA');
INSERT INTO municipios
VALUES
  ('636', '13', '548', 'PITAL');
INSERT INTO municipios
VALUES
  ('637', '13', '551', 'PITALITO');
INSERT INTO municipios
VALUES
  ('638', '13', '615', 'RIVERA');
INSERT INTO municipios
VALUES
  ('639', '13', '660', 'SALADOBLANCO');
INSERT INTO municipios
VALUES
  ('640', '13', '668', 'SAN AGUSTIN');
INSERT INTO municipios
VALUES
  ('641', '13', '676', 'SANTA MARIA');
INSERT INTO municipios
VALUES
  ('642', '13', '770', 'SUAZA');
INSERT INTO municipios
VALUES
  ('643', '13', '791', 'TARQUI');
INSERT INTO municipios
VALUES
  ('644', '13', '797', 'TESALIA');
INSERT INTO municipios
VALUES
  ('645', '13', '799', 'TELLO');
INSERT INTO municipios
VALUES
  ('646', '13', '801', 'TERUEL');
INSERT INTO municipios
VALUES
  ('647', '13', '807', 'TIMANA');
INSERT INTO municipios
VALUES
  ('648', '13', '872', 'VILLAVIEJA');
INSERT INTO municipios
VALUES
  ('649', '13', '885', 'YAGUARA');
INSERT INTO municipios
VALUES
  ('650', '14', '001', 'RIOHACHA');
INSERT INTO municipios
VALUES
  ('651', '14', '035', 'ALBANIA');
INSERT INTO municipios
VALUES
  ('652', '14', '078', 'BARRANCAS');
INSERT INTO municipios
VALUES
  ('653', '14', '090', 'DIBULLA');
INSERT INTO municipios
VALUES
  ('654', '14', '098', 'DISTRACCIÓN');
INSERT INTO municipios
VALUES
  ('655', '14', '110', 'EL MOLINO');
INSERT INTO municipios
VALUES
  ('656', '14', '279', 'FONSECA');
INSERT INTO municipios
VALUES
  ('657', '14', '378', 'HATONUEVO');
INSERT INTO municipios
VALUES
  ('658', '14', '420', 'LA JAGUA DEL PILAR');
INSERT INTO municipios
VALUES
  ('659', '14', '430', 'MAICAO');
INSERT INTO municipios
VALUES
  ('660', '14', '560', 'MANAURE');
INSERT INTO municipios
VALUES
  ('661', '14', '650', 'SAN JUAN DEL CESAR');
INSERT INTO municipios
VALUES
  ('662', '14', '847', 'URIBIA');
INSERT INTO municipios
VALUES
  ('663', '14', '855', 'URUMITA');
INSERT INTO municipios
VALUES
  ('664', '14', '874', 'VILLANUEVA');
INSERT INTO municipios
VALUES
  ('665', '15', '001', 'SANTA MARTA');
INSERT INTO municipios
VALUES
  ('666', '15', '030', 'ALGARROBO');
INSERT INTO municipios
VALUES
  ('667', '15', '053', 'ARACATACA');
INSERT INTO municipios
VALUES
  ('668', '15', '058', 'ARIGUANI');
INSERT INTO municipios
VALUES
  ('669', '15', '161', 'CERRO SAN ANTONIO');
INSERT INTO municipios
VALUES
  ('670', '15', '170', 'CHIVOLO');
INSERT INTO municipios
VALUES
  ('671', '15', '189', 'CIENAGA');
INSERT INTO municipios
VALUES
  ('672', '15', '205', 'CONCORDIA');
INSERT INTO municipios
VALUES
  ('673', '15', '245', 'EL BANCO');
INSERT INTO municipios
VALUES
  ('674', '15', '258', 'EL PION');
INSERT INTO municipios
VALUES
  ('675', '15', '268', 'EL RETN');
INSERT INTO municipios
VALUES
  ('676', '15', '288', 'FUNDACION');
INSERT INTO municipios
VALUES
  ('677', '15', '318', 'GUAMAL');
INSERT INTO municipios
VALUES
  ('678', '15', '460', 'NUEVA GRANADA');
INSERT INTO municipios
VALUES
  ('679', '15', '541', 'PEDRAZA');
INSERT INTO municipios
VALUES
  ('680', '15', '545', 'PIJIO DEL CARMEN');
INSERT INTO municipios
VALUES
  ('681', '15', '551', 'PIVIJAY');
INSERT INTO municipios
VALUES
  ('682', '15', '555', 'PLATO');
INSERT INTO municipios
VALUES
  ('683', '15', '570', 'PUEBLOVIEJO');
INSERT INTO municipios
VALUES
  ('684', '15', '605', 'REMOLINO');
INSERT INTO municipios
VALUES
  ('685', '15', '660', 'SABANAS DE SAN ANGEL');
INSERT INTO municipios
VALUES
  ('686', '15', '675', 'SALAMINA');
INSERT INTO municipios
VALUES
  ('687', '15', '692', 'SAN SEBASTIAN BUENAV');
INSERT INTO municipios
VALUES
  ('688', '15', '703', 'SAN ZENON');
INSERT INTO municipios
VALUES
  ('689', '15', '707', 'SANTA ANA');
INSERT INTO municipios
VALUES
  ('690', '15', '720', 'SANTA BRBARA DE PINTO');
INSERT INTO municipios
VALUES
  ('691', '15', '745', 'SITIONUEVO');
INSERT INTO municipios
VALUES
  ('692', '15', '798', 'TENERIFE');
INSERT INTO municipios
VALUES
  ('693', '15', '960', 'ZAPAYN');
INSERT INTO municipios
VALUES
  ('694', '15', '980', 'ZONA BANANERA');
INSERT INTO municipios
VALUES
  ('695', '16', '001', 'VILLAVICENCIO');
INSERT INTO municipios
VALUES
  ('696', '16', '006', 'ACACIAS');
INSERT INTO municipios
VALUES
  ('697', '16', '110', 'BARRANCA DE UPIA');
INSERT INTO municipios
VALUES
  ('698', '16', '124', 'CABUYARO');
INSERT INTO municipios
VALUES
  ('699', '16', '150', 'CASTILLA LA NUEVA');
INSERT INTO municipios
VALUES
  ('700', '16', '223', 'CUBARRAL');
INSERT INTO municipios
VALUES
  ('701', '16', '226', 'CUMARAL');
INSERT INTO municipios
VALUES
  ('702', '16', '245', 'EL CALVARIO');
INSERT INTO municipios
VALUES
  ('703', '16', '251', 'EL CASTILLO');
INSERT INTO municipios
VALUES
  ('704', '16', '270', 'EL DORADO');
INSERT INTO municipios
VALUES
  ('705', '16', '287', 'FUENTE DE ORO');
INSERT INTO municipios
VALUES
  ('706', '16', '313', 'GRANADA');
INSERT INTO municipios
VALUES
  ('707', '16', '318', 'GUAMAL');
INSERT INTO municipios
VALUES
  ('708', '16', '325', 'MAPIRIPAN');
INSERT INTO municipios
VALUES
  ('709', '16', '330', 'MESETAS');
INSERT INTO municipios
VALUES
  ('710', '16', '350', 'LA MACARENA');
INSERT INTO municipios
VALUES
  ('711', '16', '370', 'LA URIBE');
INSERT INTO municipios
VALUES
  ('712', '16', '400', 'LEJANIAS');
INSERT INTO municipios
VALUES
  ('713', '16', '450', 'PUERTO CONCORDIA');
INSERT INTO municipios
VALUES
  ('714', '16', '568', 'PUERTO GAITAN');
INSERT INTO municipios
VALUES
  ('715', '16', '573', 'PUERTO LOPEZ');
INSERT INTO municipios
VALUES
  ('716', '16', '577', 'PUERTO LLERAS');
INSERT INTO municipios
VALUES
  ('717', '16', '590', 'PUERTO RICO');
INSERT INTO municipios
VALUES
  ('718', '16', '606', 'RESTREPO');
INSERT INTO municipios
VALUES
  ('719', '16', '680', 'SAN CARLOS GUAROA');
INSERT INTO municipios
VALUES
  ('720', '16', '683', 'SAN JUAN DE ARAMA');
INSERT INTO municipios
VALUES
  ('721', '16', '686', 'SAN JUANITO');
INSERT INTO municipios
VALUES
  ('722', '16', '689', 'SAN MARTIN');
INSERT INTO municipios
VALUES
  ('723', '16', '711', 'VISTA HERMOSA');
INSERT INTO municipios
VALUES
  ('724', '17', '001', 'PASTO');
INSERT INTO municipios
VALUES
  ('725', '17', '019', 'ALBAN');
INSERT INTO municipios
VALUES
  ('726', '17', '022', 'ALDANA');
INSERT INTO municipios
VALUES
  ('727', '17', '036', 'ANCUYA');
INSERT INTO municipios
VALUES
  ('728', '17', '051', 'ARBOLEDA');
INSERT INTO municipios
VALUES
  ('729', '17', '079', 'BARBACOAS');
INSERT INTO municipios
VALUES
  ('730', '17', '083', 'BELEN');
INSERT INTO municipios
VALUES
  ('731', '17', '110', 'BUESACO');
INSERT INTO municipios
VALUES
  ('732', '17', '111', 'BUESAQUILLO');
INSERT INTO municipios
VALUES
  ('733', '17', '203', 'COLON');
INSERT INTO municipios
VALUES
  ('734', '17', '207', 'CONSACA');
INSERT INTO municipios
VALUES
  ('735', '17', '210', 'CONTADERO');
INSERT INTO municipios
VALUES
  ('736', '17', '215', 'CORDOBA');
INSERT INTO municipios
VALUES
  ('737', '17', '224', 'CUASPUD');
INSERT INTO municipios
VALUES
  ('738', '17', '227', 'CUMBAL');
INSERT INTO municipios
VALUES
  ('739', '17', '233', 'CUMBITARA');
INSERT INTO municipios
VALUES
  ('740', '17', '240', 'CHACHAGUI');
INSERT INTO municipios
VALUES
  ('741', '17', '250', 'EL CHARCO');
INSERT INTO municipios
VALUES
  ('742', '17', '254', 'EL PEOL');
INSERT INTO municipios
VALUES
  ('743', '17', '256', 'EL ROSARIO');
INSERT INTO municipios
VALUES
  ('744', '17', '258', 'EL TABLON DE GOMEZ');
INSERT INTO municipios
VALUES
  ('745', '17', '260', 'EL TAMBO');
INSERT INTO municipios
VALUES
  ('746', '17', '287', 'FUNES');
INSERT INTO municipios
VALUES
  ('747', '17', '317', 'GUACHUCAL');
INSERT INTO municipios
VALUES
  ('748', '17', '320', 'GUAITARILLA');
INSERT INTO municipios
VALUES
  ('749', '17', '323', 'GUALMATAN');
INSERT INTO municipios
VALUES
  ('750', '17', '352', 'ILES');
INSERT INTO municipios
VALUES
  ('751', '17', '354', 'IMUES');
INSERT INTO municipios
VALUES
  ('752', '17', '356', 'IPIALES');
INSERT INTO municipios
VALUES
  ('753', '17', '378', 'LA CRUZ');
INSERT INTO municipios
VALUES
  ('754', '17', '381', 'LA FLORIDA');
INSERT INTO municipios
VALUES
  ('755', '17', '385', 'LA LLANADA');
INSERT INTO municipios
VALUES
  ('756', '17', '390', 'LA TOLA');
INSERT INTO municipios
VALUES
  ('757', '17', '399', 'LA UNION');
INSERT INTO municipios
VALUES
  ('758', '17', '405', 'LEIVA');
INSERT INTO municipios
VALUES
  ('759', '17', '411', 'LINARES');
INSERT INTO municipios
VALUES
  ('760', '17', '418', 'LOS ANDES');
INSERT INTO municipios
VALUES
  ('761', '17', '427', 'MAGUI');
INSERT INTO municipios
VALUES
  ('762', '17', '435', 'MALLAMA');
INSERT INTO municipios
VALUES
  ('763', '17', '473', 'MOSQUERA');
INSERT INTO municipios
VALUES
  ('764', '17', '480', 'NARIO');
INSERT INTO municipios
VALUES
  ('765', '17', '490', 'OLAYA HERRERA');
INSERT INTO municipios
VALUES
  ('766', '17', '506', 'OSPINA');
INSERT INTO municipios
VALUES
  ('767', '17', '520', 'FRANCISCO PIZARRO');
INSERT INTO municipios
VALUES
  ('768', '17', '540', 'POLICARPA');
INSERT INTO municipios
VALUES
  ('769', '17', '560', 'POTOSI');
INSERT INTO municipios
VALUES
  ('770', '17', '565', 'PROVIDENCIA');
INSERT INTO municipios
VALUES
  ('771', '17', '573', 'PUERRES');
INSERT INTO municipios
VALUES
  ('772', '17', '585', 'PUPIALES');
INSERT INTO municipios
VALUES
  ('773', '17', '612', 'RICAURTE');
INSERT INTO municipios
VALUES
  ('774', '17', '621', 'ROBERTO PAYAN');
INSERT INTO municipios
VALUES
  ('775', '17', '678', 'SAMANIEGO');
INSERT INTO municipios
VALUES
  ('776', '17', '683', 'SANDONA');
INSERT INTO municipios
VALUES
  ('777', '17', '685', 'SAN BERNARDO');
INSERT INTO municipios
VALUES
  ('778', '17', '687', 'SAN LORENZO');
INSERT INTO municipios
VALUES
  ('779', '17', '693', 'SAN PABLO');
INSERT INTO municipios
VALUES
  ('780', '17', '694', 'SAN PEDRO DE CARTAGO');
INSERT INTO municipios
VALUES
  ('781', '17', '696', 'SANTA BARBARA');
INSERT INTO municipios
VALUES
  ('782', '17', '699', 'SANTACRUZ');
INSERT INTO municipios
VALUES
  ('783', '17', '720', 'SAPUYES');
INSERT INTO municipios
VALUES
  ('784', '17', '786', 'TAMINANGO');
INSERT INTO municipios
VALUES
  ('785', '17', '788', 'TANGUA');
INSERT INTO municipios
VALUES
  ('786', '17', '835', 'TUMACO');
INSERT INTO municipios
VALUES
  ('787', '17', '838', 'TUQUERRES');
INSERT INTO municipios
VALUES
  ('788', '17', '885', 'YACUANQUER');
INSERT INTO municipios
VALUES
  ('789', '18', '001', 'CUCUTA');
INSERT INTO municipios
VALUES
  ('790', '18', '003', 'ABREGO');
INSERT INTO municipios
VALUES
  ('791', '18', '051', 'ARBOLEDAS');
INSERT INTO municipios
VALUES
  ('792', '18', '099', 'BOCHALEMA');
INSERT INTO municipios
VALUES
  ('793', '18', '109', 'BUCARASICA');
INSERT INTO municipios
VALUES
  ('794', '18', '125', 'CACOTA');
INSERT INTO municipios
VALUES
  ('795', '18', '128', 'CACHIRA');
INSERT INTO municipios
VALUES
  ('796', '18', '172', 'CHINACOTA');
INSERT INTO municipios
VALUES
  ('797', '18', '174', 'CHITAGA');
INSERT INTO municipios
VALUES
  ('798', '18', '206', 'CONVENCION');
INSERT INTO municipios
VALUES
  ('799', '18', '223', 'CUCUTILLA');
INSERT INTO municipios
VALUES
  ('800', '18', '239', 'DURANIA');
INSERT INTO municipios
VALUES
  ('801', '18', '245', 'EL CARMEN');
INSERT INTO municipios
VALUES
  ('802', '18', '250', 'EL TARRA');
INSERT INTO municipios
VALUES
  ('803', '18', '261', 'EL ZULIA');
INSERT INTO municipios
VALUES
  ('804', '18', '313', 'GRAMALOTE');
INSERT INTO municipios
VALUES
  ('805', '18', '344', 'HACARI');
INSERT INTO municipios
VALUES
  ('806', '18', '347', 'HERRAN');
INSERT INTO municipios
VALUES
  ('807', '18', '377', 'LABATECA');
INSERT INTO municipios
VALUES
  ('808', '18', '385', 'LA ESPERANZA');
INSERT INTO municipios
VALUES
  ('809', '18', '398', 'LA PLAYA');
INSERT INTO municipios
VALUES
  ('810', '18', '405', 'LOS PATIOS');
INSERT INTO municipios
VALUES
  ('811', '18', '418', 'LOURDES');
INSERT INTO municipios
VALUES
  ('812', '18', '480', 'MUTISCUA');
INSERT INTO municipios
VALUES
  ('813', '18', '498', 'OCAA');
INSERT INTO municipios
VALUES
  ('814', '18', '518', 'PAMPLONA');
INSERT INTO municipios
VALUES
  ('815', '18', '520', 'PAMPLONITA');
INSERT INTO municipios
VALUES
  ('816', '18', '553', 'PUERTO SANTANDER');
INSERT INTO municipios
VALUES
  ('817', '18', '599', 'RAGONVALIA');
INSERT INTO municipios
VALUES
  ('818', '18', '660', 'SALAZAR');
INSERT INTO municipios
VALUES
  ('819', '18', '670', 'SAN CALIXTO');
INSERT INTO municipios
VALUES
  ('820', '18', '673', 'SAN CAYETANO');
INSERT INTO municipios
VALUES
  ('821', '18', '680', 'SANTIAGO');
INSERT INTO municipios
VALUES
  ('822', '18', '720', 'SARDINATA');
INSERT INTO municipios
VALUES
  ('823', '18', '743', 'SILOS');
INSERT INTO municipios
VALUES
  ('824', '18', '800', 'TEORAMA');
INSERT INTO municipios
VALUES
  ('825', '18', '810', 'TIBU');
INSERT INTO municipios
VALUES
  ('826', '18', '820', 'TOLEDO');
INSERT INTO municipios
VALUES
  ('827', '18', '871', 'VILLA CARO');
INSERT INTO municipios
VALUES
  ('828', '18', '874', 'VILLA DEL ROSARIO');
INSERT INTO municipios
VALUES
  ('829', '19', '001', 'ARMENIA');
INSERT INTO municipios
VALUES
  ('830', '19', '111', 'BUENAVISTA');
INSERT INTO municipios
VALUES
  ('831', '19', '130', 'CALARCA');
INSERT INTO municipios
VALUES
  ('832', '19', '190', 'CIRCASIA');
INSERT INTO municipios
VALUES
  ('833', '19', '212', 'CORDOBA');
INSERT INTO municipios
VALUES
  ('834', '19', '272', 'FILANDIA');
INSERT INTO municipios
VALUES
  ('835', '19', '302', 'GENOVA');
INSERT INTO municipios
VALUES
  ('836', '19', '401', 'LA TEBAIDA');
INSERT INTO municipios
VALUES
  ('837', '19', '470', 'MONTENEGRO');
INSERT INTO municipios
VALUES
  ('838', '19', '548', 'PIJAO');
INSERT INTO municipios
VALUES
  ('839', '19', '594', 'QUIMBAYA');
INSERT INTO municipios
VALUES
  ('840', '19', '690', 'SALENTO');
INSERT INTO municipios
VALUES
  ('841', '20', '001', 'PEREIRA');
INSERT INTO municipios
VALUES
  ('842', '20', '045', 'APIA');
INSERT INTO municipios
VALUES
  ('843', '20', '075', 'BALBOA');
INSERT INTO municipios
VALUES
  ('844', '20', '088', 'BELEN DE UMBRIA');
INSERT INTO municipios
VALUES
  ('845', '20', '170', 'DOS QUEBRADAS');
INSERT INTO municipios
VALUES
  ('846', '20', '318', 'GUATICA');
INSERT INTO municipios
VALUES
  ('847', '20', '383', 'LA CELIA');
INSERT INTO municipios
VALUES
  ('848', '20', '400', 'LA VIRGINIA');
INSERT INTO municipios
VALUES
  ('849', '20', '440', 'MARSELLA');
INSERT INTO municipios
VALUES
  ('850', '20', '456', 'MISTRATO');
INSERT INTO municipios
VALUES
  ('851', '20', '572', 'PUEBLO RICO');
INSERT INTO municipios
VALUES
  ('852', '20', '594', 'QUINCHIA');
INSERT INTO municipios
VALUES
  ('853', '20', '682', 'SANTA ROSA DE CABAL');
INSERT INTO municipios
VALUES
  ('854', '20', '687', 'SANTUARIO');
INSERT INTO municipios
VALUES
  ('855', '21', '001', 'BUCARAMANGA');
INSERT INTO municipios
VALUES
  ('856', '21', '013', 'AGUADA');
INSERT INTO municipios
VALUES
  ('857', '21', '020', 'ALBANIA');
INSERT INTO municipios
VALUES
  ('858', '21', '051', 'ARATOCA');
INSERT INTO municipios
VALUES
  ('859', '21', '077', 'BARBOSA');
INSERT INTO municipios
VALUES
  ('860', '21', '079', 'BARICHARA');
INSERT INTO municipios
VALUES
  ('861', '21', '081', 'BARRANCABERMEJA');
INSERT INTO municipios
VALUES
  ('862', '21', '092', 'BETULIA');
INSERT INTO municipios
VALUES
  ('863', '21', '101', 'BOLIVAR');
INSERT INTO municipios
VALUES
  ('864', '21', '121', 'CABRERA');
INSERT INTO municipios
VALUES
  ('865', '21', '132', 'CALIFORNIA');
INSERT INTO municipios
VALUES
  ('866', '21', '147', 'CAPITANEJO');
INSERT INTO municipios
VALUES
  ('867', '21', '152', 'CARCASI');
INSERT INTO municipios
VALUES
  ('868', '21', '160', 'CEPITA');
INSERT INTO municipios
VALUES
  ('869', '21', '162', 'CERRITO');
INSERT INTO municipios
VALUES
  ('870', '21', '167', 'CHARALA');
INSERT INTO municipios
VALUES
  ('871', '21', '169', 'CHARTA');
INSERT INTO municipios
VALUES
  ('872', '21', '176', 'CHIMA');
INSERT INTO municipios
VALUES
  ('873', '21', '179', 'CHIPATA');
INSERT INTO municipios
VALUES
  ('874', '21', '190', 'CIMITARRA');
INSERT INTO municipios
VALUES
  ('875', '21', '207', 'CONCEPCION');
INSERT INTO municipios
VALUES
  ('876', '21', '209', 'CONFINES');
INSERT INTO municipios
VALUES
  ('877', '21', '211', 'CONTRATACION');
INSERT INTO municipios
VALUES
  ('878', '21', '217', 'COROMORO');
INSERT INTO municipios
VALUES
  ('879', '21', '229', 'CURITI');
INSERT INTO municipios
VALUES
  ('880', '21', '235', 'EL CARMEN');
INSERT INTO municipios
VALUES
  ('881', '21', '245', 'EL GUACAMAYO');
INSERT INTO municipios
VALUES
  ('882', '21', '250', 'EL PEN');
INSERT INTO municipios
VALUES
  ('883', '21', '255', 'EL PLAYON');
INSERT INTO municipios
VALUES
  ('884', '21', '264', 'ENCINO');
INSERT INTO municipios
VALUES
  ('885', '21', '266', 'ENCISO');
INSERT INTO municipios
VALUES
  ('886', '21', '271', 'FLORIAN');
INSERT INTO municipios
VALUES
  ('887', '21', '276', 'FLORIDABLANCA');
INSERT INTO municipios
VALUES
  ('888', '21', '296', 'GALAN');
INSERT INTO municipios
VALUES
  ('889', '21', '298', 'GAMBITA');
INSERT INTO municipios
VALUES
  ('890', '21', '307', 'GIRON');
INSERT INTO municipios
VALUES
  ('891', '21', '318', 'GUACA');
INSERT INTO municipios
VALUES
  ('892', '21', '320', 'GUADALUPE');
INSERT INTO municipios
VALUES
  ('893', '21', '322', 'GUAPOTA');
INSERT INTO municipios
VALUES
  ('894', '21', '324', 'GUAVATA');
INSERT INTO municipios
VALUES
  ('895', '21', '327', 'GUEPSA');
INSERT INTO municipios
VALUES
  ('896', '21', '344', 'HATO');
INSERT INTO municipios
VALUES
  ('897', '21', '368', 'JESUS MARIA');
INSERT INTO municipios
VALUES
  ('898', '21', '370', 'JORDAN');
INSERT INTO municipios
VALUES
  ('899', '21', '377', 'LA BELLEZA');
INSERT INTO municipios
VALUES
  ('900', '21', '385', 'LANDAZURI');
INSERT INTO municipios
VALUES
  ('901', '21', '397', 'LA PAZ');
INSERT INTO municipios
VALUES
  ('902', '21', '406', 'LEBRIJA');
INSERT INTO municipios
VALUES
  ('903', '21', '418', 'LOS SANTOS');
INSERT INTO municipios
VALUES
  ('904', '21', '425', 'MACARAVITA');
INSERT INTO municipios
VALUES
  ('905', '21', '432', 'MALAGA');
INSERT INTO municipios
VALUES
  ('906', '21', '444', 'MATANZA');
INSERT INTO municipios
VALUES
  ('907', '21', '464', 'MOGOTES');
INSERT INTO municipios
VALUES
  ('908', '21', '468', 'MOLAGAVITA');
INSERT INTO municipios
VALUES
  ('909', '21', '498', 'OCAMONTE');
INSERT INTO municipios
VALUES
  ('910', '21', '500', 'OIBA');
INSERT INTO municipios
VALUES
  ('911', '21', '502', 'ONZAGA');
INSERT INTO municipios
VALUES
  ('912', '21', '522', 'PALMAR');
INSERT INTO municipios
VALUES
  ('913', '21', '524', 'PALMAS DEL SOCORRO');
INSERT INTO municipios
VALUES
  ('914', '21', '533', 'PARAMO');
INSERT INTO municipios
VALUES
  ('915', '21', '547', 'PIEDECUESTA');
INSERT INTO municipios
VALUES
  ('916', '21', '549', 'PINCHOTE');
INSERT INTO municipios
VALUES
  ('917', '21', '572', 'PUENTE NACIONAL');
INSERT INTO municipios
VALUES
  ('918', '21', '573', 'PUERTO PARRA');
INSERT INTO municipios
VALUES
  ('919', '21', '575', 'PUERTO WILCHES');
INSERT INTO municipios
VALUES
  ('920', '21', '615', 'RIONEGRO');
INSERT INTO municipios
VALUES
  ('921', '21', '655', 'SABANA DE TORRES');
INSERT INTO municipios
VALUES
  ('922', '21', '669', 'SAN ANDRES');
INSERT INTO municipios
VALUES
  ('923', '21', '673', 'SAN BENITO');
INSERT INTO municipios
VALUES
  ('924', '21', '679', 'SAN GIL');
INSERT INTO municipios
VALUES
  ('925', '21', '682', 'SAN JOAQUIN');
INSERT INTO municipios
VALUES
  ('926', '21', '684', 'SAN JOSE DE MIRANDA');
INSERT INTO municipios
VALUES
  ('927', '21', '686', 'SAN MIGUEL');
INSERT INTO municipios
VALUES
  ('928', '21', '689', 'SAN VICENTE DE CHUCURI');
INSERT INTO municipios
VALUES
  ('929', '21', '705', 'SANTA BARBARA');
INSERT INTO municipios
VALUES
  ('930', '21', '720', 'SANTA HELENA DEL OPON');
INSERT INTO municipios
VALUES
  ('931', '21', '745', 'SIMACOTA');
INSERT INTO municipios
VALUES
  ('932', '21', '755', 'SOCORRO');
INSERT INTO municipios
VALUES
  ('933', '21', '770', 'SUAITA');
INSERT INTO municipios
VALUES
  ('934', '21', '773', 'SUCRE');
INSERT INTO municipios
VALUES
  ('935', '21', '780', 'SURATA');
INSERT INTO municipios
VALUES
  ('936', '21', '820', 'TONA');
INSERT INTO municipios
VALUES
  ('937', '21', '855', 'VALLE DE SAN JOSE');
INSERT INTO municipios
VALUES
  ('938', '21', '861', 'VELEZ');
INSERT INTO municipios
VALUES
  ('939', '21', '867', 'VETAS');
INSERT INTO municipios
VALUES
  ('940', '21', '872', 'VILLANUEVA');
INSERT INTO municipios
VALUES
  ('941', '21', '895', 'ZAPATOCA');
INSERT INTO municipios
VALUES
  ('942', '22', '001', 'SINCELEJO');
INSERT INTO municipios
VALUES
  ('943', '22', '110', 'BUENAVISTA');
INSERT INTO municipios
VALUES
  ('944', '22', '124', 'CAIMITO');
INSERT INTO municipios
VALUES
  ('945', '22', '204', 'COLOSO');
INSERT INTO municipios
VALUES
  ('946', '22', '215', 'COROZAL');
INSERT INTO municipios
VALUES
  ('947', '22', '221', 'COVEAS');
INSERT INTO municipios
VALUES
  ('948', '22', '230', 'CHALAN');
INSERT INTO municipios
VALUES
  ('949', '22', '233', 'EL ROBLE');
INSERT INTO municipios
VALUES
  ('950', '22', '235', 'GALERAS');
INSERT INTO municipios
VALUES
  ('951', '22', '265', 'GUARANDA');
INSERT INTO municipios
VALUES
  ('952', '22', '400', 'LA UNION');
INSERT INTO municipios
VALUES
  ('953', '22', '418', 'LOS PALMITOS');
INSERT INTO municipios
VALUES
  ('954', '22', '429', 'MAJAGUAL');
INSERT INTO municipios
VALUES
  ('955', '22', '473', 'MORROA');
INSERT INTO municipios
VALUES
  ('956', '22', '508', 'OVEJAS');
INSERT INTO municipios
VALUES
  ('957', '22', '523', 'PALMITO');
INSERT INTO municipios
VALUES
  ('958', '22', '670', 'SAMPUES');
INSERT INTO municipios
VALUES
  ('959', '22', '678', 'SAN BENITO ABAD');
INSERT INTO municipios
VALUES
  ('960', '22', '702', 'SAN JUAN DE BETULIA');
INSERT INTO municipios
VALUES
  ('961', '22', '708', 'SAN MARCOS');
INSERT INTO municipios
VALUES
  ('962', '22', '713', 'SAN ONOFRE');
INSERT INTO municipios
VALUES
  ('963', '22', '717', 'SAN PEDRO');
INSERT INTO municipios
VALUES
  ('964', '22', '742', 'SINCE');
INSERT INTO municipios
VALUES
  ('965', '22', '771', 'SUCRE');
INSERT INTO municipios
VALUES
  ('966', '22', '820', 'SANTIAGO DE TOLU (TOLU)');
INSERT INTO municipios
VALUES
  ('967', '22', '823', 'TOLUVIEJO');
INSERT INTO municipios
VALUES
  ('968', '23', '001', 'IBAGUE');
INSERT INTO municipios
VALUES
  ('969', '23', '024', 'ALPUJARRA');
INSERT INTO municipios
VALUES
  ('970', '23', '026', 'ALVARADO');
INSERT INTO municipios
VALUES
  ('971', '23', '030', 'AMBALEMA');
INSERT INTO municipios
VALUES
  ('972', '23', '043', 'ANZOATEGUI');
INSERT INTO municipios
VALUES
  ('973', '23', '055', 'ARMERO');
INSERT INTO municipios
VALUES
  ('974', '23', '067', 'ATACO');
INSERT INTO municipios
VALUES
  ('975', '23', '124', 'CAJAMARCA');
INSERT INTO municipios
VALUES
  ('976', '23', '148', 'CARMEN DE APICALA');
INSERT INTO municipios
VALUES
  ('977', '23', '152', 'CASABIANCA');
INSERT INTO municipios
VALUES
  ('978', '23', '168', 'CHAPARRAL');
INSERT INTO municipios
VALUES
  ('979', '23', '200', 'COELLO');
INSERT INTO municipios
VALUES
  ('980', '23', '217', 'COYAIMA');
INSERT INTO municipios
VALUES
  ('981', '23', '226', 'CUNDAY');
INSERT INTO municipios
VALUES
  ('982', '23', '236', 'DOLORES');
INSERT INTO municipios
VALUES
  ('983', '23', '268', 'ESPINAL');
INSERT INTO municipios
VALUES
  ('984', '23', '270', 'FALAN');
INSERT INTO municipios
VALUES
  ('985', '23', '275', 'FLANDES');
INSERT INTO municipios
VALUES
  ('986', '23', '283', 'FRESNO');
INSERT INTO municipios
VALUES
  ('987', '23', '319', 'GUAMO');
INSERT INTO municipios
VALUES
  ('988', '23', '347', 'HERVEO');
INSERT INTO municipios
VALUES
  ('989', '23', '349', 'HONDA');
INSERT INTO municipios
VALUES
  ('990', '23', '352', 'ICONONZO');
INSERT INTO municipios
VALUES
  ('991', '23', '408', 'LERIDA');
INSERT INTO municipios
VALUES
  ('992', '23', '411', 'LIBANO');
INSERT INTO municipios
VALUES
  ('993', '23', '443', 'MARIQUITA');
INSERT INTO municipios
VALUES
  ('994', '23', '449', 'MELGAR');
INSERT INTO municipios
VALUES
  ('995', '23', '461', 'MURILLO');
INSERT INTO municipios
VALUES
  ('996', '23', '483', 'NATAGAIMA');
INSERT INTO municipios
VALUES
  ('997', '23', '504', 'ORTEGA');
INSERT INTO municipios
VALUES
  ('998', '23', '520', 'PALOCABILDO');
INSERT INTO municipios
VALUES
  ('999', '23', '547', 'PIEDRAS');
INSERT INTO municipios
VALUES
  ('1000', '23', '555', 'PLANADAS');
INSERT INTO municipios
VALUES
  ('1001', '23', '563', 'PRADO');
INSERT INTO municipios
VALUES
  ('1002', '23', '585', 'PURIFICACION');
INSERT INTO municipios
VALUES
  ('1003', '23', '616', 'RIOBLANCO');
INSERT INTO municipios
VALUES
  ('1004', '23', '622', 'RONCESVALLES');
INSERT INTO municipios
VALUES
  ('1005', '23', '624', 'ROVIRA');
INSERT INTO municipios
VALUES
  ('1006', '23', '671', 'SALDAA');
INSERT INTO municipios
VALUES
  ('1007', '23', '675', 'SAN ANTONIO');
INSERT INTO municipios
VALUES
  ('1008', '23', '678', 'SAN LUIS');
INSERT INTO municipios
VALUES
  ('1009', '23', '686', 'SANTA ISABEL');
INSERT INTO municipios
VALUES
  ('1010', '23', '770', 'SUAREZ');
INSERT INTO municipios
VALUES
  ('1011', '23', '854', 'VALLE DE SAN JUAN');
INSERT INTO municipios
VALUES
  ('1012', '23', '861', 'VENADILLO');
INSERT INTO municipios
VALUES
  ('1013', '23', '870', 'VILLAHERMOSA');
INSERT INTO municipios
VALUES
  ('1014', '23', '873', 'VILLARRICA');
INSERT INTO municipios
VALUES
  ('1015', '23', '993', 'HERRERA');
INSERT INTO municipios
VALUES
  ('1016', '23', '997', 'SANTIAGO PEREZ');
INSERT INTO municipios
VALUES
  ('1017', '24', '001', 'CALI');
INSERT INTO municipios
VALUES
  ('1018', '24', '020', 'ALCALA');
INSERT INTO municipios
VALUES
  ('1019', '24', '036', 'ANDALUCIA');
INSERT INTO municipios
VALUES
  ('1020', '24', '041', 'ANSERMANUEVO');
INSERT INTO municipios
VALUES
  ('1021', '24', '054', 'ARGELIA');
INSERT INTO municipios
VALUES
  ('1022', '24', '100', 'BOLIVAR');
INSERT INTO municipios
VALUES
  ('1023', '24', '109', 'BUENAVENTURA');
INSERT INTO municipios
VALUES
  ('1024', '24', '111', 'GUADALAJARA DE BUGA (BUGA)');
INSERT INTO municipios
VALUES
  ('1025', '24', '113', 'BUGALAGRANDE');
INSERT INTO municipios
VALUES
  ('1026', '24', '122', 'CAICEDONIA');
INSERT INTO municipios
VALUES
  ('1027', '24', '126', 'CALIMA');
INSERT INTO municipios
VALUES
  ('1028', '24', '130', 'CANDELARIA');
INSERT INTO municipios
VALUES
  ('1029', '24', '147', 'CARTAGO');
INSERT INTO municipios
VALUES
  ('1030', '24', '233', 'DAGUA');
INSERT INTO municipios
VALUES
  ('1031', '24', '243', 'EL AGUILA');
INSERT INTO municipios
VALUES
  ('1032', '24', '246', 'EL CAIRO');
INSERT INTO municipios
VALUES
  ('1033', '24', '248', 'EL CERRITO');
INSERT INTO municipios
VALUES
  ('1034', '24', '250', 'EL DOVIO');
INSERT INTO municipios
VALUES
  ('1035', '24', '275', 'FLORIDA');
INSERT INTO municipios
VALUES
  ('1036', '24', '306', 'GINEBRA');
INSERT INTO municipios
VALUES
  ('1037', '24', '318', 'GUACARI');
INSERT INTO municipios
VALUES
  ('1038', '24', '364', 'JAMUNDI');
INSERT INTO municipios
VALUES
  ('1039', '24', '377', 'LA CUMBRE');
INSERT INTO municipios
VALUES
  ('1040', '24', '400', 'LA UNION');
INSERT INTO municipios
VALUES
  ('1041', '24', '403', 'LA VICTORIA');
INSERT INTO municipios
VALUES
  ('1042', '24', '497', 'OBANDO');
INSERT INTO municipios
VALUES
  ('1043', '24', '520', 'PALMIRA');
INSERT INTO municipios
VALUES
  ('1044', '24', '563', 'PRADERA');
INSERT INTO municipios
VALUES
  ('1045', '24', '606', 'RESTREPO');
INSERT INTO municipios
VALUES
  ('1046', '24', '616', 'RIOFRIO');
INSERT INTO municipios
VALUES
  ('1047', '24', '622', 'ROLDANILLO');
INSERT INTO municipios
VALUES
  ('1048', '24', '670', 'SAN PEDRO');
INSERT INTO municipios
VALUES
  ('1049', '24', '736', 'SEVILLA');
INSERT INTO municipios
VALUES
  ('1050', '24', '823', 'TORO');
INSERT INTO municipios
VALUES
  ('1051', '24', '828', 'TRUJILLO');
INSERT INTO municipios
VALUES
  ('1052', '24', '834', 'TULUA');
INSERT INTO municipios
VALUES
  ('1053', '24', '845', 'ULLOA');
INSERT INTO municipios
VALUES
  ('1054', '24', '863', 'VERSALLES');
INSERT INTO municipios
VALUES
  ('1055', '24', '869', 'VIJES');
INSERT INTO municipios
VALUES
  ('1056', '24', '890', 'YOTOCO');
INSERT INTO municipios
VALUES
  ('1057', '24', '892', 'YUMBO');
INSERT INTO municipios
VALUES
  ('1058', '24', '895', 'ZARZAL');
INSERT INTO municipios
VALUES
  ('1059', '40', '001', 'ARAUCA');
INSERT INTO municipios
VALUES
  ('1060', '40', '065', 'ARAUQUITA');
INSERT INTO municipios
VALUES
  ('1061', '40', '220', 'CRAVO NORTE');
INSERT INTO municipios
VALUES
  ('1062', '40', '300', 'FORTUL');
INSERT INTO municipios
VALUES
  ('1063', '40', '591', 'PUERTO RONDON');
INSERT INTO municipios
VALUES
  ('1064', '40', '736', 'SARAVENA');
INSERT INTO municipios
VALUES
  ('1065', '40', '794', 'TAME');
INSERT INTO municipios
VALUES
  ('1066', '48', '001', 'YOPAL');
INSERT INTO municipios
VALUES
  ('1067', '48', '010', 'AGUAZUL');
INSERT INTO municipios
VALUES
  ('1068', '48', '015', 'CHAMEZA');
INSERT INTO municipios
VALUES
  ('1069', '48', '125', 'HATO COROZAL');
INSERT INTO municipios
VALUES
  ('1070', '48', '136', 'LA SALINA');
INSERT INTO municipios
VALUES
  ('1071', '48', '139', 'MANI');
INSERT INTO municipios
VALUES
  ('1072', '48', '162', 'MONTERREY');
INSERT INTO municipios
VALUES
  ('1073', '48', '225', 'NUNCHIA');
INSERT INTO municipios
VALUES
  ('1074', '48', '230', 'OROCUE');
INSERT INTO municipios
VALUES
  ('1075', '48', '250', 'PAZ DE ARIPORO');
INSERT INTO municipios
VALUES
  ('1076', '48', '263', 'PORE');
INSERT INTO municipios
VALUES
  ('1077', '48', '279', 'RECETOR');
INSERT INTO municipios
VALUES
  ('1078', '48', '300', 'SABANALARGA');
INSERT INTO municipios
VALUES
  ('1079', '48', '315', 'SACAMA');
INSERT INTO municipios
VALUES
  ('1080', '48', '325', 'SAN LUIS DE PALENQUE');
INSERT INTO municipios
VALUES
  ('1081', '48', '400', 'TAMARA');
INSERT INTO municipios
VALUES
  ('1082', '48', '410', 'TAURAMENA');
INSERT INTO municipios
VALUES
  ('1083', '48', '430', 'TRINIDAD');
INSERT INTO municipios
VALUES
  ('1084', '48', '440', 'VILLANUEVA');
INSERT INTO municipios
VALUES
  ('1085', '49', '001', 'MOCOA');
INSERT INTO municipios
VALUES
  ('1086', '49', '219', 'COLON');
INSERT INTO municipios
VALUES
  ('1087', '49', '320', 'ORITO');
INSERT INTO municipios
VALUES
  ('1088', '49', '568', 'PUERTO ASIS');
INSERT INTO municipios
VALUES
  ('1089', '49', '569', 'PUERTO CAICEDO');
INSERT INTO municipios
VALUES
  ('1090', '49', '571', 'PUERTO GUZMN');
INSERT INTO municipios
VALUES
  ('1091', '49', '573', 'LEGUIZAMO (PUERTO LEGUIZAMO)');
INSERT INTO municipios
VALUES
  ('1092', '49', '749', 'SIBUNDOY');
INSERT INTO municipios
VALUES
  ('1093', '49', '755', 'SAN FRANCISCO');
INSERT INTO municipios
VALUES
  ('1094', '49', '757', 'SAN MIGUEL');
INSERT INTO municipios
VALUES
  ('1095', '49', '760', 'SANTIAGO');
INSERT INTO municipios
VALUES
  ('1096', '49', '865', 'VALLE DEL GUAMUEZ');
INSERT INTO municipios
VALUES
  ('1097', '49', '885', 'VILLAGARZON');
INSERT INTO municipios
VALUES
  ('1098', '50', '001', 'SAN ANDRES');
INSERT INTO municipios
VALUES
  ('1099', '50', '564', 'PROVIDENCIA');
INSERT INTO municipios
VALUES
  ('1100', '51', '001', 'LETICIA');
INSERT INTO municipios
VALUES
  ('1101', '51', '263', 'EL ENCANTO');
INSERT INTO municipios
VALUES
  ('1102', '51', '405', 'LA CHORRERA');
INSERT INTO municipios
VALUES
  ('1103', '51', '407', 'LA PEDRERA');
INSERT INTO municipios
VALUES
  ('1104', '51', '430', 'LA VICTORIA');
INSERT INTO municipios
VALUES
  ('1105', '51', '460', 'MIRITI-PARANA');
INSERT INTO municipios
VALUES
  ('1106', '51', '530', 'PUERTO ALEGRA');
INSERT INTO municipios
VALUES
  ('1107', '51', '536', 'PUERTO ARICA');
INSERT INTO municipios
VALUES
  ('1108', '51', '540', 'PUERTO NARIO');
INSERT INTO municipios
VALUES
  ('1109', '51', '669', 'PUERTO SANTANDER');
INSERT INTO municipios
VALUES
  ('1110', '51', '798', 'TARAPACA');
INSERT INTO municipios
VALUES
  ('1111', '52', '001', 'INIRIDA');
INSERT INTO municipios
VALUES
  ('1112', '52', '343', 'BARRANCO MINAS');
INSERT INTO municipios
VALUES
  ('1113', '52', '663', 'MAPIRIPANA');
INSERT INTO municipios
VALUES
  ('1114', '52', '883', 'SAN FELIPE');
INSERT INTO municipios
VALUES
  ('1115', '52', '884', 'PUERTO COLOMBIA');
INSERT INTO municipios
VALUES
  ('1116', '52', '885', 'LA GUADALUPE');
INSERT INTO municipios
VALUES
  ('1117', '52', '886', 'CACAHUAL');
INSERT INTO municipios
VALUES
  ('1118', '52', '887', 'PANA PANA');
INSERT INTO municipios
VALUES
  ('1119', '52', '888', 'MORICHAL');
INSERT INTO municipios
VALUES
  ('1120', '53', '001', 'SAN JOSE DEL GUAVIAR');
INSERT INTO municipios
VALUES
  ('1121', '53', '015', 'CALAMAR');
INSERT INTO municipios
VALUES
  ('1122', '53', '025', 'EL RETORNO');
INSERT INTO municipios
VALUES
  ('1123', '53', '200', 'MIRAFLORES');
INSERT INTO municipios
VALUES
  ('1124', '53', '220', 'MORICHAL');
INSERT INTO municipios
VALUES
  ('1125', '54', '001', 'MITU');
INSERT INTO municipios
VALUES
  ('1126', '54', '161', 'CARURU');
INSERT INTO municipios
VALUES
  ('1127', '54', '511', 'PACOA');
INSERT INTO municipios
VALUES
  ('1128', '54', '666', 'TARAIRA');
INSERT INTO municipios
VALUES
  ('1129', '54', '777', 'PAPUNAUA');
INSERT INTO municipios
VALUES
  ('1130', '54', '889', 'YAVARATE');
INSERT INTO municipios
VALUES
  ('1131', '55', '001', 'PUERTO CARRENO');
INSERT INTO municipios
VALUES
  ('1132', '55', '524', 'LA PRIMAVERA');
INSERT INTO municipios
VALUES
  ('1133', '55', '572', 'SANTA RITA');
INSERT INTO municipios
VALUES
  ('1134', '55', '624', 'SANTA ROSALA');
INSERT INTO municipios
VALUES
  ('1135', '55', '760', 'SAN JOSE DE OCUNE');
INSERT INTO municipios
VALUES
  ('1136', '55', '773', 'CUMARIBO');






-- reiniciar el contador de una tabla);
TRUNCATE TABLE tipo_proyectos
RESTART IDENTITY CASCADE;


SELECT *
FROM departamentos AS d, municipios AS m
WHERE d.id_departamento = m.id_departamento
  AND d.id_departamento = 17;
