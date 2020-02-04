/*PROCEDIMIENTOS*/

/* ########## ########## ########## ########## ########## AUTH ########## ########## ########## ########## ########## */

DROP FUNCTION IF EXISTS userExist;
DELIMITER $$
CREATE FUNCTION userExist(ccnit VARCHAR(50))
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
	RETURN EXISTS(SELECT Usu_id FROM usuario WHERE Usu_ccnit = ccnit);
END $$
DELIMITER ;

DROP FUNCTION IF EXISTS authUser;
DELIMITER $$
CREATE FUNCTION authUser(ccnit VARCHAR(50), contra VARCHAR(50))
RETURNS INTEGER
DETERMINISTIC
BEGIN
	RETURN (SELECT Usu_id FROM usuario WHERE Usu_ccnit = ccnit AND Usu_contra = contra);
END $$
DELIMITER ;

/* ########## ########## ########## ########## ########## USER ########## ########## ########## ########## ########## */

DROP PROCEDURE IF EXISTS createUser;
DELIMITER $$
CREATE PROCEDURE createUser(
	IN ccnit VARCHAR(50),
    IN nick VARCHAR(50),
    IN contra VARCHAR(50),
    IN clientId INT,
    IN esAses BOOLEAN,
    IN esLab BOOLEAN,
    IN esMetro BOOLEAN,
	IN esGerente BOOLEAN,
    IN esSu BOOLEAN)
BEGIN
	INSERT INTO	usuario(
		Usu_ccnit,
		Usu_nombre,
		Usu_contra,
		Usu_Cli_id,
		Usu_esAsesor,
		Usu_esLaboratorista,
		Usu_esMetrologo,
		Usu_esGerente,
		Usu_esSu
    )VALUES(
		ccnit,
		nick,
        contra,
        clientId,
		esAses,
		esLab,
		esMetro,
		esGerente,
		esSu
	);
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS getUser;
DELIMITER $$
CREATE PROCEDURE getUser(IN idUsuario INT)
BEGIN
	SELECT
		Usu_id,
		Usu_ccnit,
		Usu_nombre,
		Usu_contra,
		Usu_Cli_id,
		Usu_esAsesor,
		Usu_esLaboratorista,
		Usu_esMetrologo,
		Usu_esGerente,
		Usu_esSu
	FROM usuario WHERE Usu_id = idUsuario LIMIT 1;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS updateUser;
DELIMITER $$
CREATE PROCEDURE updateUser(
	IN id INT,
	IN ccnit VARCHAR(50),
	IN nombre VARCHAR(50),
	IN contra VARCHAR(50),
	IN Cli_id INT,
    IN esAses BOOLEAN,
    IN esLab BOOLEAN,
	IN esMetrologo BOOLEAN,
	IN esGerente BOOLEAN,
	IN esSu BOOLEAN)
BEGIN
	UPDATE usuario
    SET
		Usu_ccnit = ccnit,
		Usu_nombre = nombre,
		Usu_contra = contra,
		Usu_Cli_id = Cli_id,
		Usu_esAsesor = esAses,
		Usu_esLaboratorista = esLab,
		Usu_esMetrologo = esMetrologo,
		Usu_esGerente = esGerente,
		Usu_esSu = esSu
	WHERE Usu_id = id;
END $$
DELIMITER ;

/* ########## ########## ########## ########## ########## CLIENT ########## ########## ########## ########## ########## */

DROP PROCEDURE IF EXISTS createClient;
DELIMITER $$
CREATE PROCEDURE createClient(
    OUT id		INT,
	IN nit		VARCHAR(45),
	IN emp		VARCHAR(100),
	IN carg		VARCHAR(50),
	IN tel		VARCHAR(50),
	IN fax		VARCHAR(50),
	IN email	VARCHAR(100),
	IN ciu		VARCHAR(25),
	IN dir		VARCHAR(100),
    IN estado	VARCHAR(2))
BEGIN
	INSERT INTO cliente(
			Cli_nit,
			Cli_emp,
			Cli_cont_carg,
			Cli_tel,
			Cli_fax,
			Cli_email,
			Cli_ciu,
			Cli_dir,
            Cli_estado
    ) VALUES(nit, emp, carg, tel, fax, email, ciu, dir, estado);
    SET id = LAST_INSERT_ID();
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS getClient;
DELIMITER $$
CREATE PROCEDURE getClient(IN id INT)
BEGIN
	SELECT
		Cli_id,
		Cli_nit,
		Cli_emp,
		Cli_cont_carg,
		Cli_tel,
		Cli_fax,
		Cli_email,
		Cli_ciu,
		Cli_dir,
        Cli_estado
	FROM cliente WHERE Cli_id = id;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS updateClient;
DELIMITER $$
CREATE PROCEDURE updateClient(
	IN id 		INT,
	IN nit		VARCHAR(45),
	IN emp		VARCHAR(100),
	IN carg		VARCHAR(50),
	IN tel		VARCHAR(50),
	IN fax		VARCHAR(50),
	IN email	VARCHAR(100),
	IN ciu		VARCHAR(25),
	IN dir		VARCHAR(100),
	IN estado	VARCHAR(2))
BEGIN
	UPDATE cliente
    SET
		Cli_nit = nit,
		Cli_emp = emp,
		Cli_cont_carg = carg,
		Cli_tel = tel,
		Cli_fax = fax,
		Cli_email = email,
		Cli_ciu = ciu,
		Cli_dir = dir,
        Cli_estado = estado
	WHERE Cli_id = id;
END $$
DELIMITER ;

DROP FUNCTION IF EXISTS getClientId;
DELIMITER $$
CREATE FUNCTION getClientId(nit VARCHAR(50))
RETURNS INTEGER
DETERMINISTIC
BEGIN
	RETURN (SELECT Cli_id FROM cliente WHERE Cli_nit = nit limit 1);
END $$
DELIMITER ;

/* ########## ########## ########## ########## ########## ITEM ########## ########## ########## ########## ########## */


DROP PROCEDURE IF EXISTS getItems;
DELIMITER $$
CREATE PROCEDURE getItems(IN clientId INT)
BEGIN
	SELECT * FROM (SELECT distinct ItmC_Itm_id  FROM item_cliente WHERE ItmC_Cli_id = clientId) AS A JOIN item ON ItmC_Itm_id = Itm_id AND Itm_eliminado = FALSE ;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS createItem;
DELIMITER $$
CREATE PROCEDURE createItem(
	INOUT id		INT,
	IN nom		VARCHAR(100),
	IN mar		VARCHAR(50),
	IN _mod		VARCHAR(50),
	IN magn		VARCHAR(50),
	IN almax	INT,
	IN almin	INT,
	IN res		DOUBLE)
BEGIN
	INSERT INTO item(
		Itm_id,
		Itm_nom,
        Itm_let,
		Itm_mar,
		Itm_mod,
		Itm_magn,
		Itm_almax,
		Itm_almin,
		Itm_res,
        Itm_eliminado
    ) VALUES(id, nom, DEFAULT, mar, _mod, magn, almax, almin, res, DEFAULT);
    set id = LAST_INSERT_ID();
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS updateItem;
DELIMITER $$
CREATE PROCEDURE updateItem(
	IN id		INT,
	IN nom		VARCHAR(100),
	IN let		VARCHAR(10),
	IN mar		VARCHAR(50),
	IN _mod		VARCHAR(50),
	IN magn		VARCHAR(50),
	IN almax	INT,
	IN almin	INT,
	IN res		DOUBLE)
BEGIN
	UPDATE item
	SET
		Itm_nom = nom,
        Itm_let = let,
		Itm_mar = mar,
		Itm_mod = _mod,
		Itm_magn = magn,
		Itm_almax = almax,
		Itm_almin = almin,
		Itm_res = res,
        Itm_eliminado = eliminado
    WHERE Itm_id = id;
END $$
DELIMITER ;



/* ########## ########## ########## ########## ########## ITEM_CLIENTE ########## ########## ########## ########## ########## */

DROP PROCEDURE IF EXISTS getItemsClient;
DELIMITER $$
CREATE PROCEDURE getItemsClient(IN itemId INT, IN clientId INT)
BEGIN
	SELECT * FROM item_cliente WHERE ItmC_Itm_id = itemId AND ItmC_Cli_id = clientId AND ItmC_eliminado = FALSE ;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS getItemsClient;
DELIMITER $$
CREATE PROCEDURE getItemsClient(IN itemId INT, IN clientId INT)
BEGIN
	SELECT * FROM item_cliente WHERE ItmC_Itm_id = itemId AND ItmC_Cli_id = clientId AND ItmC_eliminado = FALSE;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS createItemClient;
DELIMITER $$
CREATE PROCEDURE createItemClient(
	INOUT id		INT,
	IN Itm_id		INT,
	IN Cli_id		INT,
	IN _serial		VARCHAR(50),
	IN internId		VARCHAR(50),
	IN almax		INT,
	IN almin		INT,
	IN uso			VARCHAR(50))
BEGIN
	INSERT INTO item_cliente(
		ItmC_id,
		ItmC_Itm_id,
		ItmC_Cli_id,
		ItmC_serial,
		ItmC_internId,
		ItmC_almax,
		ItmC_almin,
		ItmC_uso,
		ItmC_eliminado
    ) VALUES(id, Itm_id, Cli_id, _serial, internId, almax, almin, uso, DEFAULT);
    set id = LAST_INSERT_ID();
END $$
DELIMITER ;



DROP PROCEDURE IF EXISTS updateItemClient;
DELIMITER $$
CREATE PROCEDURE updateItemClient(
	INOUT id		INT,
	IN Itm_id		INT,
	IN Cli_id		INT,
	IN _serial		VARCHAR(50),
	IN internId		VARCHAR(50),
	IN almax		INT,
	IN almin		INT,
	IN uso			VARCHAR(50),
    IN eliminado	BOOLEAN)
BEGIN
	UPDATE item_cliente
    SET
		ItmC_Itm_id = Itm_id,
		ItmC_Cli_id = Cli_id,
		ItmC_serial = _serial,
		ItmC_internId = internId,
		ItmC_almax = almax,
		ItmC_almin = almin,
		ItmC_uso = uso,
		ItmC_eliminado = eliminado
    WHERE ItmC_id = id;
END $$
DELIMITER ;



/*
########################################################################################################################
########################################################################################################################
########################################################################################################################
*/

DROP VIEW IF EXISTS vt2;
DROP VIEW IF EXISTS vt3;
DROP VIEW IF EXISTS vt4;
DROP VIEW IF EXISTS vt5;

/* Vistas: vt2 similar a una factura resumen del cliente 
 vt3 promedio de dinero pagado,número de servicios realizados, cliente, teléfono */

/* Vista vt2: factura resumen del cliente */
CREATE VIEW vt2 AS
	SELECT
		Cli_id,
		Cli_emp,
		Cli_email,
		Cli_tel,
		Ordc_preciotol,
		Ordc_fec
	FROM orden_compra JOIN cliente ON Cli_id=OrdC_Cli_id;
/*CREATE VIEW vt2 AS SELECT Cli_emp,Cli_email,Cli_tel,Ordc_preciotol,Ordc_fec FROM cliente JOIN item_cliente ON ItmC_Cli_id=Cli_id
	JOIN orden_compra_espec ON OrdEs_ItemC_id=ItmC_id JOIN orden_compra ON Ordc_id=OrdEs_Ordc_id; */


CREATE VIEW vt3 AS SELECT Cli_emp,Cli_email,Cli_tel,AVG(Ordc_preciotol) AS prom,SUM(Ordc_preciotol) AS total, COUNT(Cli_emp) AS serv FROM vt2 GROUP BY Cli_emp,Cli_email,Cli_tel; 

/* Procedimiento de descuentos: Otorga un bono de descuento por cierto valor pagado en total de servicios */
/*DELIMITER $$*/
DROP PROCEDURE IF EXISTS dest;
/*
CREATE PROCEDURE dest(empresa VARCHAR(50))
BEGIN
	DECLARE des DOUBLE DEFAULT 0;
	IF empresa='AGROSAVIA' OR empresa='Creaciones y suministros' OR empresa='4 KARNES' OR empresa='CALIBRATION SERVICE SAS' THEN 
		SET @val =(SELECT total FROM vt3 WHERE Cli_emp=empresa);
		IF @val <= 1000 THEN
			SET des=0.10;
			INSERT INTO bono VALUES(empresa,des*@val); 
			SELECT 'Se otorga un descuento por';
			SELECT bon_desc FROM bono WHERE bon_Cli_emp=empresa;
		ELSEIF @val > 1000 THEN
			SET des=0.20;
			INSERT INTO bono VALUES(empresa,des*@val); 
			SELECT 'Se otorga un descuento por'; 
			SELECT bon_desc FROM bono WHERE bon_Cli_emp=empresa;
		END IF;
	ELSEIF empresa <> 'AGROSAVIA' OR empresa<>'Creaciones y suministros' OR empresa<>'4 KARNES' OR empresa<>'CALIBRATION SERVICE SAS' THEN
		SELECT 'Empresa no existe';
	END IF;
END $$

DELIMITER ; */


/*
CALL dest('CALIBRATION SERVICE SAS');
CALL dest('Creaciones y suministros');
CALL dest('AGROSAVIA');
 CALL dest('4 KARNES');
CALL dest('Otra');
*/

/* Procedimiento de actualización datos de CONTACTO*/ 
DROP PROCEDURE IF EXISTS act;
DELIMITER $$
CREATE PROCEDURE act(empresa VARCHAR(50),contacto VARCHAR(50),carg VARCHAR(50),tel INT, fax INT)
BEGIN
	IF empresa='AGROSAVIA' OR empresa='Creaciones y suministros' OR empresa='4 KARNES' OR empresa='CALIBRATION SERVICE SAS' THEN 
		UPDATE cliente
		SET 
			Cli_cont=contacto,
			Cli_cont_carg=carg,
			Cli_tel=tel,
			Cli_fax=fax 
		WHERE Cli_emp=empresa;
	ELSEIF empresa<>'AGROSAVIA' OR empresa<>'Creaciones y suministros' OR empresa<>'4 KARNES' OR empresa<>'CALIBRATION SERVICE SAS' THEN
		SELECT 'Empresa no existe, actualización no permitida';
	END IF;
END $$
DELIMITER ; 

/* CALL act('Creaciones y suministros','Marcela Hernandez','Subgerencia de mercadeo',2854001,2854001);
CALL act('AGROSAVIA','Luisa Andrade','Marketing',8950012,8950012);
CALL act('Creaciones ','Marcela Hernandez','Subgerencia de mercadeo',2854001,2854001);
CALL act('AGROSAVIA','Luisa Andrade','Marketing',8950012,8950012);
CALL act('4 KARNES','Luisa Andrade','Marketing',8950012,8950012);
CALL act('CALIBRATION SERVICE SAS','Luisa Andrade','Marketing',8950012,8950012);
*/

/* Vistas 
ASESOR vt4 información del cliente ítem y valor pagado
LABORATORISTA vt5 características del ítem, valor a pagar, uso de ítem, rango, puntos a calibrar
SELECT * FROM vt3;
*/

DROP VIEW IF EXISTS vt4;
DROP VIEW IF EXISTS vt5; 

/*
CREATE VIEW vt4 AS SELECT DISTINCT Cli_nit, OrdEs_ItemC_id AS idi, OrdEs_Ordc_id AS idc, OrdEs_preciopun AS valor, OrdEs_ranc AS ran, OrdEs_calp AS punt 
FROM cliente JOIN item_cliente ON Cli_nit=ItmC_Cli_nit RIGHT JOIN orden_compra_espec ON ItmC_id=OrdEs_ItemC_id;

CREATE VIEW vt5 AS SELECT DISTINCT OrdEs_ItemC_id AS idi, OrdEs_Ordc_id AS idc,ItmC_uso, OrdEs_preciopun AS valor, OrdEs_ranc AS ran, OrdEs_calp AS punt 
FROM item_cliente JOIN orden_compra_espec ON ItmC_id=OrdEs_ItemC_id;
*/
/* 
SELECT * FROM vt4;
SELECT * FROM vt5; */ 


/* Procedimiento de actualización datos orden de compra específica */ 
/* Se emplea si se quieren cambiar los atributos del laboratorista, valor del punto a calibrar y punto a calibrar*/
DROP PROCEDURE IF EXISTS act2;
DELIMITER $$
CREATE PROCEDURE act2(idmov INT,calp VARCHAR(30),valp INT, ranc VARCHAR(30))
BEGIN
	UPDATE orden_compra_espec
	SET OrdEs_calp=calp,
		OrdEs_preciopun=valp,
        OrdEs_ranc=ranc
    WHERE OrdEs_idmov=idmov;
END $$
DELIMITER ; 
/*
CALL act2(5,735,695000,125);
CALL act2(1,'458',387000,'75');
SELECT * FROM orden_compra_espec;
*/

/* TRIGGER1 */ 
 /* Trigger que conserva información de clientes eliminados de la tabla */
 /* Puede ser asignado por gerencia o por quien pueda eliminar registros de cliente */ 
DROP TRIGGER IF EXISTS TRABC1;
DELIMITER ||
CREATE TRIGGER TRABC1 BEFORE DELETE ON cliente
FOR EACH ROW BEGIN
	INSERT INTO deletedClient (Cli_emp, Cli_tel)
	values ( OLD.Cli_emp, OLD.Cli_tel );
END ||
DELIMITER ;

/*TRIGGER2*/
DROP TRIGGER IF EXISTS maxv;
DELIMITER ||
CREATE TRIGGER maxv BEFORE INSERT on certificado
FOR EACH ROW BEGIN
	SET @aa = NEW.Cert_id;
	SET @ac = NEW.Cert_temax;
	SET @ad = NEW.Cert_humax;

	INSERT INTO valMax(fecha,Cert_id, Cert_temax,Cert_humax)
	values ( CURDATE(), NEW.Cert_id, NEW.Cert_temax, NEW.Cert_humax);
END ||
DELIMITER ;
