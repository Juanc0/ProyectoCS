USE proyectocs;
DROP TABLE If EXISTS Usuario;
DROP TABLE If EXISTS item;
DROP TABLE If EXISTS item_cliente;
DROP TABLE If EXISTS cliente;
DROP TABLE IF EXISTS deletedClient; -- xxx
DROP TABLE If EXISTS orden_compra;
DROP TABLE If EXISTS orden_compra_espec;
DROP TABLE If EXISTS trazabilidad;
DROP TABLE IF EXISTS resumen_estadistico;
DROP TABLE If EXISTS certificado;
DROP TABLE IF EXISTS valMax; -- xxx
DROP TABLE If EXISTS humedad;
DROP TABLE If EXISTS termhighum;
DROP TABLE If EXISTS camhum;
DROP TABLE If EXISTS temperatura;
DROP TABLE If EXISTS termhigtem;
DROP TABLE If EXISTS camtem;
DROP TABLE IF EXISTS estBa;
DROP TABLE IF EXISTS zonaBa;
DROP TABLE If EXISTS bloque;
DROP TABLE If EXISTS vidrio;
DROP TABLE If EXISTS analogo;
DROP TABLE If EXISTS digital;
DROP TABLE IF EXISTS bono;

-- Creando tablas 
CREATE TABLE usuario
(
  Usu_id INT NOT NULL AUTO_INCREMENT,
  Usu_ccnit VARCHAR(50) NOT NULL,
  Usu_nombre VARCHAR(50) NULL,
  Usu_contra VARCHAR(50) NOT NULL,
  Usu_Cli_nit VARCHAR(50) NULL DEFAULT NULL REFERENCES cliente (Cli_nit),
  Usu_Ases_id INT NULL DEFAULT NULL,
  Usu_Lab_id INT NULL DEFAULT NULL,
  Usu_esMetrologo BOOLEAN NOT NULL DEFAULT FALSE,
  Usu_esGerente BOOLEAN NOT NULL DEFAULT FALSE,
  Usu_esSu BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (Usu_id)
) ENGINE=InnoDB;

CREATE TABLE item  
(
	Itm_id		VARCHAR(50)	NOT NULL,
	Itm_nom		VARCHAR(100)	NOT NULL,
	Itm_mar		VARCHAR(50)	NOT NULL,
	Itm_mod		VARCHAR(50)	NOT NULL,
	Itm_ran		VARCHAR(50)	NOT NULL,
	Itm_magn	VARCHAR(50)	NOT NULL,
	Itm_almax	VARCHAR(50)	NOT NULL,
	Itm_almin	VARCHAR(50)	NOT NULL,
	Itm_res 	DOUBLE 		NOT NULL,
	PRIMARY KEY(Itm_id)
) ENGINE=InnoDB;

CREATE TABLE item_cliente
(
	ItmC_id 	VARCHAR(50)	NOT NULL,
	ItmC_Cli_nit VARCHAR(50)	NOT NULL REFERENCES cliente(Cli_nit),
	ItmC_Itm_id	VARCHAR(50)	NOT NULL REFERENCES item(Itm_id),
	ItmC_uso	VARCHAR(50)	NOT NULL,
	ItmC_ran	VARCHAR(50)	NOT NULL,
	PRIMARY KEY(ItmC_id)
) ENGINE=InnoDB;

CREATE TABLE cliente
(
	Cli_nit		VARCHAR(45)	NOT NULL,
	Cli_emp		VARCHAR(100)	NOT NULL,
	Cli_cont_carg	VARCHAR(50)	NULL,
	Cli_tel		VARCHAR(50)	NOT NULL,
	Cli_fax		VARCHAR(50)	NULL,
	Cli_email	VARCHAR(100)	NULL,
	Cli_ciu		VARCHAR(25)	NOT NULL,
	Cli_dir		VARCHAR(100)	NOT NULL,
	Cli_idart	VARCHAR(45) NULL,
	PRIMARY KEY(Cli_nit)
) ENGINE=InnoDB;

CREATE TABLE deletedClient
(
	Cli_emp VARCHAR(100) NOT NULL,
	Cli_tel INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE orden_compra
(
	Ordc_id	 	INT NOT NULL AUTO_INCREMENT,
	Ordc_pcal	VARCHAR(100)	NOT NULL,
	Ordc_serv	VARCHAR(25)	NOT NULL,
	Ordc_numord	INT		NOT NULL,
	Ordc_preciotol	INT		NOT NULL,
	Ordc_fec	DATE		NOT NULL,
	Ordc_obs	VARCHAR(100) 	NULL,
	Ordc_met	VARCHAR(300)	NOT NULL,
	Ordc_estado	VARCHAR(50)	NOT NULL,
    Ordc_Ases_id INT NULL REFERENCES usuario(Usu_id),
    Ordc_Cli_id INT NOT NULL REFERENCES usuario(Usu_id),
	PRIMARY KEY(Ordc_id)
) ENGINE=InnoDB;

CREATE TABLE bono
(
	bon_Cli_emp VARCHAR(40) NOT NULL,
	bon_desc INT NOT NULL,
	PRIMARY KEY(bon_Cli_emp)
) ENGINE=InnoDB;

CREATE TABLE orden_compra_espec
(
	OrdEs_idmov		INT	NOT NULL AUTO_INCREMENT,
	OrdEs_Ordc_id		INT 		NOT NULL REFERENCES orden_compra(Ordc_id) ,
	OrdEs_ItemC_id	VARCHAR(50)	NOT NULL REFERENCES item_cliente(ItmC_id),
	OrdEs_calp		VARCHAR(20) 	NOT NULL,
	OrdEs_preciopun	DOUBLE		NOT NULL,
	OrdEs_ranc		VARCHAR(100)	NOT NULL,
	OrdEs_estado		VARCHAR(50)	NOT NULL,
	PRIMARY KEY(OrdEs_idmov)
) ENGINE=InnoDB;

CREATE TABLE trazabilidad
(
	Traz_Cert_num 	DOUBLE 		NOT NULL REFERENCES certificado(Cert_num),
	Traz_Cert_let 	VARCHAR(10) 	NOT NULL REFERENCES certificado(Cert_let),
	Traz_p1		VARCHAR(100)	NOT NULL,
	Traz_p2		VARCHAR(100)	NULL,
	Traz_med	VARCHAR(100)	NULL,
	Traz_s1	 	VARCHAR(100)	NULL,
	Traz_s2 	VARCHAR(100)	NULL,
	Traz_s3 	VARCHAR(100)	NULL,
	Traz_s4 	VARCHAR(100)	NULL,
	Traz_s5		VARCHAR(100)	NULL,
	Traz_s6		VARCHAR(100)	NULL,
	Traz_s7		VARCHAR(100)	NULL,
	Traz_s8		VARCHAR(100)	NULL,
	PRIMARY KEY(Traz_Cert_num,Traz_Cert_let )
) ENGINE=InnoDB;

CREATE TABLE resumen_estadistico(
	Est_Cert_num 	INT NOT NULL REFERENCES certificado(Cert_num),
	Est_Cert_let 	VARCHAR(10)  NOT NULL REFERENCES certificado(Cert_let),
	Est_prog 	    DOUBLE 	NOT NULL,
	Est_Hum_maxp1 	DOUBLE 		NULL,
	Est_Hum_minp1 	DOUBLE 		NULL,
	Est_Hum_maxp2 	DOUBLE 		NULL,
	Est_Hum_minp2	DOUBLE 		NULL,
	Est_Hum_promp1 	DOUBLE 		NULL,
	Est_Hum_promp2 	DOUBLE 		NULL,
	Est_Hum_desvp1 	DOUBLE 		NULL,
	Est_Hum_desvp2 	DOUBLE 		NULL,
	Est_Tem_maxp1 	DOUBLE 		NULL,
	Est_Tem_minp1 	DOUBLE 		NULL,
	Est_Tem_maxp2 	DOUBLE 		NULL,
	Est_Tem_minp2 	DOUBLE 		NULL,
	Est_Tem_promp1 	DOUBLE		NULL,
	Est_Tem_promp2 	DOUBLE		NULL,
	Est_Tem_desvp1 	DOUBLE		NULL,
	Est_Tem_desvp2 	DOUBLE		NULL,
	PRIMARY KEY (Est_Cert_num,Est_Cert_let,Est_prog)
)ENGINE=InnoDB;

CREATE TABLE certificado
(
	Cert_num		INT	 	NOT NULL AUTO_INCREMENT,
	Cert_let		VARCHAR(10)	NOT NULL,
	Cert_OrdEs_idmov 	INT		NOT NULL REFERENCES orden_compra_espec(OrdEs_idmov),
	Cert_temax		DOUBLE		NOT NULL, 
	Cert_temin		DOUBLE		NOT NULL,
	Cert_humax		DOUBLE		NOT NULL,
	Cert_humin		DOUBLE		NOT NULL,
	Cert_Lab_id 	INT NOT NULL REFERENCES usuario(Usu_id),
	PRIMARY KEY(Cert_num,Cert_let)
) ENGINE=InnoDB;

CREATE TABLE valMax(
	fecha DATE,
	Cert_num	INT	AUTO_INCREMENT NOT NULL,
	Cert_let	VARCHAR(5)	NOT NULL,
	Cert_temax	DOUBLE	NOT NULL, 
	Cert_humax	DOUBLE	NOT NULL,
	PRIMARY KEY (Cert_num)
) ENGINE=InnoDB;

CREATE TABLE humedad
(
	Hum_Cert_num 	INT	NOT NULL REFERENCES certificado(Cert_num),
	Hum_Cert_let 	VARCHAR(10) 	NOT NULL REFERENCES certificado(Cert_let),
	Hum_prog	DOUBLE		NOT NULL,
	Hum_promIBC	DOUBLE		NOT NULL,
	Hum_maxIBC	DOUBLE,
	Hum_minIBC	DOUBLE,
	Hum_desvIBC	DOUBLE,
	Hum_incert	DOUBLE		NOT NULL,
	Hum_corr	DOUBLE		NOT NULL,
	PRIMARY KEY (Hum_Cert_num,Hum_Cert_let,Hum_prog)
) ENGINE=InnoDB;

CREATE TABLE termhighum
(
	TermhigHum_Hum_Cert_num INT	NOT NULL REFERENCES humedad(Hum_Cert_num),
	TermhigHum_Hum_Cert_let VARCHAR(10) 	NOT NULL REFERENCES humedad(Hum_Cert_let),
	TermhigHum_Hum_prog 	DOUBLE 		NOT NULL REFERENCES humedad(Hum_prog),
	TermhigHum_estp1	DOUBLE		NOT NULL,
	TermhigHum_estp2	DOUBLE		NOT NULL,
	TermhigHum_unifex	DOUBLE		NOT NULL,
	PRIMARY KEY (TermhigHum_Hum_Cert_num,TermhigHum_Hum_Cert_let,TermhigHum_Hum_prog)
) ENGINE=InnoDB;

CREATE TABLE camhum 
(
	Camhum_Hum_Cert_num 	INT 	NOT NULL REFERENCES humedad(Hum_Cert_num),
	Camhum_Hum_Cert_let 	VARCHAR(10) 	NOT NULL REFERENCES humedad(Hum_Cert_let),
	Camhum_Hum_prog 	DOUBLE 		NOT NULL REFERENCES humedad(Hum_prog),
	Camhum_efcar		DOUBLE		NOT NULL,
	Camhum_inest		DOUBLE		NOT NULL,
	Camhum_inohom		DOUBLE		NOT NULL,
	PRIMARY KEY (Camhum_Hum_Cert_num,Camhum_Hum_Cert_let,CamHum_Hum_prog)
) ENGINE=InnoDB;

CREATE TABLE temperatura
(
	Tem_Cert_num	INT 		NOT NULL REFERENCES certificado(Cert_num),
	Tem_Cert_let 	VARCHAR(10) 	NOT NULL REFERENCES certificado(Cert_let),
	Tem_prog	DOUBLE		NOT NULL,
	Tem_promIBC	DOUBLE		NOT NULL,
	Tem_maxIBC	DOUBLE		NOT NULL,
	Tem_minIBC	DOUBLE		NOT NULL,
	Tem_desvIBC	DOUBLE		NOT NULL,
	Tem_incert	DOUBLE		NOT NULL,
	Tem_corr	DOUBLE		NOT NULL,
	PRIMARY KEY(Tem_Cert_num,Tem_Cert_let,Tem_prog)
) ENGINE=InnoDB;

CREATE TABLE termhigtem
(
	TermhigTem_Tem_Cert_num INT 		NOT NULL REFERENCES temperatura(Tem_Cert_num),
	TermhigTem_Tem_Cert_let VARCHAR(10) 	NOT NULL REFERENCES temperatura(Tem_Cert_let),
	TermhigTem_Tem_prog	DOUBLE		NOT NULL REFERENCES temperatura(Tem_prog),
	TermhigTem_estp1	DOUBLE		NOT NULL,
	TermhigTem_estp2	DOUBLE		NOT NULL,
	TermhigTem_unifex	DOUBLE		NOT NULL,
	PRIMARY KEY(Termhigtem_Tem_Cert_num,Termhigtem_Tem_Cert_let,TermhigTem_Tem_prog)
) ENGINE=InnoDB;

CREATE TABLE camtem
(
	Camtem_Tem_Cert_num 	INT 		NOT NULL REFERENCES temperatura(Tem_Cert_num),
	Camtem_Tem_Cert_let 	VARCHAR(10) 	NOT NULL REFERENCES temperatura(Tem_Cert_let),
	Camtem_Tem_prog		DOUBLE		NOT NULL REFERENCES temperatura(Tem_prog),
	Camtem_efcar		DOUBLE		NOT NULL,
	Camtem_inest		DOUBLE		NOT NULL,
	Camtem_efrad		DOUBLE		NOT NULL,
	Camtem_inohom		DOUBLE		NOT NULL,
	PRIMARY KEY (Camtem_Tem_Cert_num,Camtem_Tem_Cert_let,Camtem_Tem_prog)
) ENGINE=InnoDB;


CREATE TABLE estBa(
	EstBa_Tem_Cert_num 	INT 		NOT NULL REFERENCES temperatura(Tem_Cert_num),
	EstBa_Tem_Cert_let 	VARCHAR(10) 	NOT NULL REFERENCES temperatura(Tem_Cert_let),
	EstBa_Tem_prog		DOUBLE		NOT NULL REFERENCES temperatura(Tem_prog),
	EstBa_estp		DOUBLE		NOT NULL,
	EstBa_incert		DOUBLE		NOT NULL,
	Estab_facor		DOUBLE		NOT NULL,
	PRIMARY KEY(EstBa_Tem_Cert_num,EstBa_Tem_Cert_let,EstBa_Tem_prog)
)ENGINE=InnoDB;

CREATE TABLE zonaBa(
	ZonBa_Tem_Cert_num 	INT		NOT NULL REFERENCES temperatura(Tem_Cert_num),
	ZonBa_Tem_Cert_let 	VARCHAR(5) 	NOT NULL REFERENCES temperatura(Tem_Cert_let),
	ZonaBa_Tem_prog		DOUBLE		NOT NULL REFERENCES temperatura(Tem_prog),
	ZonBa_nom 		VARCHAR(7) 	NOT NULL,
	ZonBa_facor		INT		NOT NULL,
	ZonBa_inc		DOUBLE		NOT NULL,
	ZonBa_grad	 	DOUBLE		NOT NULL,
	PRIMARY KEY(ZonBa_Tem_Cert_num,ZonBa_Tem_Cert_let,ZonaBa_Tem_prog,ZonBa_nom)
)ENGINE=InnoDB;

CREATE TABLE bloque
(
	Bloq_Tem_Cert_num 	INT 		NOT NULL REFERENCES temperatura(Tem_Cert_num),
	Bloq_Tem_Cert_let 	VARCHAR(10) 	NOT NULL REFERENCES temperatura(Tem_Cert_let),
	Bloq_Tem_prog		DOUBLE		NOT NULL REFERENCES temperatura(Tem_prog),
	Bloq_uniax		DOUBLE		NOT NULL,
	Bloq_unirad		DOUBLE		NOT NULL,
	Bloq_est		DOUBLE		NOT NULL,
	PRIMARY KEY (Bloq_Tem_Cert_num,Bloq_Tem_Cert_let,Bloq_Tem_prog)
) ENGINE=InnoDB;

CREATE TABLE vidrio
(
	Tvid_Tem_Cert_num 	INT 		NOT NULL 	REFERENCES temperatura(Tem_Cert_num),
	Tvid_Tem_Cert_let 	VARCHAR(10) 	NOT NULL 	REFERENCES temperatura(Tem_Cert_let),
	Tvid_Tem_prog		DOUBLE		NOT NULL	REFERENCES temperatura(Tem_prog),
	Tvid_estp1		DOUBLE		NOT NULL,
	Tvid_estp2		DOUBLE		NOT NULL,
	Tvid_unifex		DOUBLE		NOT NULL,
	PRIMARY KEY (Tvid_Tem_Cert_num,Tvid_Tem_Cert_let,Tvid_Tem_prog)
) ENGINE=InnoDB;

CREATE TABLE analogo
(
	Tana_Tem_Cert_num 	INT 		NOT NULL REFERENCES temperatura(Tem_Cert_num),
	Tana_Tem_Cert_let 	VARCHAR(10) 	NOT NULL REFERENCES temperatura(Tem_Cert_let),
	Tana_Tem_prog		DOUBLE		NOT NULL REFERENCES temperatura(Tem_prog),
	Tana_Tem_estp1		DOUBLE		NOT NULL,
	Tana_Tem_unifex		DOUBLE		NOT NULL,
	PRIMARY KEY(Tana_Tem_Cert_num,Tana_Tem_Cert_let,Tana_Tem_prog)
)ENGINE=InnoDB;

CREATE TABLE digital
(
	Td_Tem_Cert_num INT 		NOT NULL REFERENCES temperatura(Tem_Cert_num),
	Td_Tem_Cert_let VARCHAR(10) 	NOT NULL REFERENCES temperatura(Tem_Cert_let),
	Td_Tem_prog	DOUBLE		NOT NULL REFERENCES temperatura(Tem_prog),
	Td_estp1	DOUBLE		NOT NULL,
	Td_estp2	DOUBLE		NOT NULL,
	Td_unifex	DOUBLE		NOT NULL,
	PRIMARY KEY(Td_Tem_Cert_num,Td_Tem_Cert_let,Td_Tem_prog)
)ENGINE=InnoDB;