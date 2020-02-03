USE proyectocs;

DROP TABLE IF EXISTS usuario;
CREATE TABLE usuario(
  Usu_id				INT 		NOT NULL	AUTO_INCREMENT UNIQUE,
  Usu_ccnit				VARCHAR(50) NOT NULL UNIQUE,
  Usu_nombre			VARCHAR(50) NULL,
  Usu_contra			VARCHAR(50) NOT NULL,
  Usu_Cli_id			INT 		NULL 		DEFAULT NULL REFERENCES cliente (Cli_id),
  Usu_esAsesor			BOOLEAN 	NULL 		DEFAULT NULL,
  Usu_esLaboratorista	BOOLEAN 	NULL 		DEFAULT NULL,
  Usu_esMetrologo		BOOLEAN 	NOT NULL	DEFAULT FALSE,
  Usu_esGerente			BOOLEAN 	NOT NULL	DEFAULT FALSE,
  Usu_esSu				BOOLEAN 	NOT NULL	DEFAULT FALSE,
  PRIMARY KEY (Usu_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS item;
CREATE TABLE item(
	Itm_id		INT	NOT NULL AUTO_INCREMENT,
	Itm_nom		VARCHAR(100)	NOT NULL,
	Itm_let		VARCHAR(10) NULL DEFAULT NULL,
	Itm_mar		VARCHAR(50)	NOT NULL,
	Itm_mod		VARCHAR(50)	NOT NULL,
	Itm_magn	VARCHAR(50)	NOT NULL,
	Itm_almax	INT	NOT NULL,
	Itm_almin	INT	NOT NULL,
	Itm_res 	DOUBLE 		NOT NULL,
    Itm_eliminado	BOOLEAN	NOT NULL DEFAULT FALSE,
	PRIMARY KEY(Itm_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS item_cliente;
CREATE TABLE item_cliente(
	ItmC_id			INT	NOT NULL AUTO_INCREMENT,
    ItmC_Itm_id		INT	NOT NULL REFERENCES item(Itm_id),
    ItmC_Cli_id		INT NOT NULL REFERENCES cliente(Cli_id),
    ItmC_serial		VARCHAR(50)	NOT NULL,
    ItmC_internId	VARCHAR(50)	NULL,
	ItmC_almax		INT	NOT NULL,
	ItmC_almin		INT	NOT NULL,
    TtmC_uso 		VARCHAR(50) NULL,
    ItmC_eliminado	BOOLEAN		NOT NULL,
	PRIMARY KEY(Itmc_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS cliente;
CREATE TABLE cliente(
	Cli_id		INT NOT NULL AUTO_INCREMENT UNIQUE,
	Cli_nit		VARCHAR(45)	NOT NULL,
	Cli_emp		VARCHAR(100)	NOT NULL,
	Cli_cont_carg	VARCHAR(50)	NULL,
	Cli_tel		VARCHAR(50)	NOT NULL,
	Cli_fax		VARCHAR(50)	NULL,
	Cli_email	VARCHAR(100)	NULL,
	Cli_ciu		VARCHAR(25)	NOT NULL,
	Cli_dir		VARCHAR(100)	NOT NULL,
    Cli_estado	VARCHAR(2)	NOT NULL,
	PRIMARY KEY(Cli_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS orden_compra;
CREATE TABLE orden_compra(
	Ordc_id	 	INT NOT NULL AUTO_INCREMENT,
	Ordc_preciotol	INT		NOT NULL,
    Ordc_precioFianl INT NOT NULL,
	Ordc_fec	DATE		NOT NULL,
	Ordc_estado	VARCHAR(50)	NOT NULL,
    Ordc_Ases_id INT NULL REFERENCES usuario(Usu_id),
    Ordc_Cli_id INT NOT NULL REFERENCES usuario(Usu_id),
	PRIMARY KEY(Ordc_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS orden_compra_espec;
CREATE TABLE orden_compra_espec(
	OrdEs_id		INT	NOT NULL AUTO_INCREMENT,
	OrdEs_Ordc_id		INT 		NOT NULL REFERENCES orden_compra(OrdC_id) ,
	OrdEs_ItemC_id	VARCHAR(50)	NOT NULL REFERENCES item_cliente(ItmC_id),
	OrdEs_serv	VARCHAR(25)	NOT NULL,
	OrdEs_obs	VARCHAR(100) 	NULL,
	OrdEs_met	VARCHAR(300)	NOT NULL,
    OrdEs_mag	VARCHAR(50)	NOT NULL,
	OrdEs_precioTotal	DOUBLE		NOT NULL,
	OrdEs_ranc		VARCHAR(100)	NOT NULL,
	OrdEs_estado		VARCHAR(50)	NOT NULL,
	PRIMARY KEY(OrdEs_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS punto;
CREATE TABLE punto(
	Pun_id	INT	NOT NULL AUTO_INCREMENT,
    Pun_OrdEs_id INT NOT NULL REFERENCES orden_compra_espec(OrdC_id),
    Pun_punto INT NOT NULL,
	PRIMARY KEY(Pun_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS precio;
CREATE TABLE precio(
	Pre_id			INT NOT NULL AUTO_INCREMENT,
	Pre_magnitud	VARCHAR(50) NOT NULL,
	Pre_puntoMin	INT	NOT NULL,
	Pre_puntoMax	INT	NOT NULL,
    Pre_precio INT NOT NULL,
	PRIMARY KEY(Pre_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS certificado_num;
CREATE TABLE certificado_num(
	CertNum_Cert_id	INT NOT NULL,
	CertNum_let		VARCHAR(10)	NOT NULL,
	CertNum_num 	INT NOT NULL,
    PRIMARY KEY(CertNum_Cert_id, CertNum_let, CertNum_num)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS certificado;
CREATE TABLE certificado(
	Cert_id			INT NOT NULL AUTO_INCREMENT,
	Cert_OrdEs_id 	INT		NOT NULL REFERENCES orden_compra_espec(OrdEs_id),
	Cert_temax		DOUBLE		NOT NULL, 
	Cert_temin		DOUBLE		NOT NULL,
	Cert_humax		DOUBLE		NOT NULL,
	Cert_humin		DOUBLE		NOT NULL,
    Cert_trazMed	VARCHAR(100)	NULL,
	Cert_Lab_id 	INT NOT NULL REFERENCES usuario(Usu_id),
	PRIMARY KEY(Cert_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS certificado_sonda;
CREATE TABLE certificado_sonda(
	Cert_id 	INT	NOT NULL REFERENCES certificado(Cert_id),
    Son_id		INT NOT NULL REFERENCES sonda(Son_id),
    PRIMARY KEY(Cert_id, Son_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS sonda;
CREATE TABLE sonda(
	Son_id	INT NOT NULL AUTO_INCREMENT,
    Son_nombre VARCHAR(100)	NOT NULL,
	PRIMARY KEY(Son_id)
)	ENGINE=InnoDB;

DROP TABLE IF EXISTS certificado_patron;
CREATE TABLE certificado_patron(
	Cert_id 	INT	NOT NULL REFERENCES certificado(Cert_id),
    Pat_id		INT NOT NULL REFERENCES sonda(Pat_id),
    PRIMARY KEY(Cert_id, Pat_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS patron;
CREATE TABLE patron(
	Pat_id	INT NOT NULL AUTO_INCREMENT,
    Pat_nombre VARCHAR(100)	NOT NULL,
	PRIMARY KEY(Pat_id)
)	ENGINE=InnoDB;

DROP TABLE IF EXISTS estadistico;
CREATE TABLE estadistico(
	Est_id INT NOT NULL AUTO_INCREMENT,
	Est_prom DOUBLE NOT NULL,
    Est_max DOUBLE NOT NULL,
    Est_min DOUBLE NOT NULL,
    Est_desv DOUBLE NOT NULL,
	PRIMARY KEY(est_id)
)	ENGINE=InnoDB;

DROP TABLE IF EXISTS resumen_estadistico;
CREATE TABLE resumen_estadistico(
	ResEst_Cert_id 	INT		NOT NULL	REFERENCES certificado(Cert_id),
    ResEst_Pun_id	INT 	NOT NULL	REFERENCES punto(Pun_id),
    ResEst_est		INT		NOT NULL	REFERENCES estadistico(Est_id),
    ResEst_estp1	INT 	NOT NULL	REFERENCES estadistico(Est_id),
    ResEst_estp2	INT 	NULL 		REFERENCES estadistico(Est_id),
	ResEst_incert	DOUBLE	NOT NULL,
	ResEst_corr		DOUBLE	NOT NULL,
	PRIMARY KEY (ResEst_Cert_id, ResEst_Pun_id)
)ENGINE=InnoDB;

DROP TABLE IF EXISTS termometro;
CREATE TABLE termometro(
	Term_Cert_id	INT	NOT NULL REFERENCES certificado(Cert_id),
	Term_Pun_id 	INT 	NOT NULL REFERENCES punto(Pun_id),
	Term_estp1		DOUBLE	NOT NULL,
	Term_estp2		DOUBLE	NULL,
	Term_unifex		DOUBLE	NOT NULL,
	PRIMARY KEY (Term_Cert_id, Term_Pun_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS camara;
CREATE TABLE camara(
	Cam_Cert_id 	INT 		NOT NULL REFERENCES certificado(Cert_id),
	Cam_Pun_id		DOUBLE		NOT NULL REFERENCES punto(Pun_id),
	Cam_efcar		DOUBLE		NOT NULL,
	Cam_inest		DOUBLE		NOT NULL,
	Cam_efrad		DOUBLE		NULL,
	Cam_inohom		DOUBLE		NOT NULL,
	PRIMARY KEY (Cam_Cert_id, Cam_Pun_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS bloque;
CREATE TABLE bloque(
	Bloq_Cert_id 	INT 		NOT NULL REFERENCES certificado(Cert_id),
	Bloq_Pun_id		DOUBLE		NOT NULL REFERENCES punto(Pun_id),
	Bloq_uniax		DOUBLE		NOT NULL,
	Bloq_unirad		DOUBLE		NOT NULL,
	Bloq_est		DOUBLE		NOT NULL,
	PRIMARY KEY (Bloq_Cert_id, Bloq_Pun_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS estBa;
CREATE TABLE estBa(
	EstBa_Cert_id 	INT 		NOT NULL REFERENCES certificado(Cert_id),
	EstBa_Pun_id	DOUBLE		NOT NULL REFERENCES punto(Pun_id),
	EstBa_estp		DOUBLE		NOT NULL,
	EstBa_incert	DOUBLE		NOT NULL,
	Estab_facor		DOUBLE		NOT NULL,
	PRIMARY KEY(EstBa_Cert_id, EstBa_Pun_id)
)ENGINE=InnoDB;

DROP TABLE IF EXISTS zonaBa;
CREATE TABLE zonaBa(
	ZonBa_Cert_id 	INT		NOT NULL REFERENCES certificado(Cert_id),
	ZonBa_Pun_id	DOUBLE	NOT NULL REFERENCES punto(Pun_id),
	ZonBa_nom 		INT 	NOT NULL,
	ZonBa_facor		INT		NOT NULL,
	ZonBa_inc		DOUBLE	NOT NULL,
	ZonBa_grad	 	DOUBLE	NOT NULL,
	PRIMARY KEY(ZonBa_Cert_id, ZonBa_Pun_id, ZonBa_nom)
)ENGINE=InnoDB;

-- 