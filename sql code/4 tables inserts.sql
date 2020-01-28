-- INSERTAR DATOS 

INSERT INTO item VALUES('1D1310572', 'BAnnO TERMOSTATICO', 'POLYSCIENCE', '9502A11C','-30 °C < T < 200 °C', 'TEMPERATURA', '200 °C','-30 °C','0.1');
INSERT INTO item VALUES('104-IR', 	'TERMOMETRO DIGITAL-IR', 	'TESTO',	'104-IR',	'-50 °C < T < 250 °C', 	'TEMPERATURA', '250 °C','-50 °C',	'0.1');
INSERT INTO item VALUES('2519', 	'TERMOMETRO DE VIDRIO', 	'PG ERTCB', 	'ASTM 8F',	'30 °F < T < 760 °F', 	'TEMPERATURA', '760 °F','30 °F',	'2');
INSERT INTO item VALUES('VC230A','TERMOHIGRÓMETRO DIGITAL','VICTOR','VC230A','30%HR A 90%HR','HUMEDAD','90%HR','30%HR','0.1');
INSERT INTO item VALUES ('A28194','BLOQUE SECO', 'HART SCIENTIFIC', '9140','35 °C < T < 350 °C', 'TEMPERATURA', '350°C','35°C','0.2');
INSERT INTO item VALUES('TBM30040C3','TERMÓMETRO ANALOGO','WINTERS','TBM30040C3','0 °C < T < 250 °C','TEMPERATURA','250 ','0 ','2');
INSERT INTO item VALUES ('260188','TERMÓMETRO ANÁLOGO', 'FISHER/BRAND', '15076B',' 0°C < T < 180°C', 'TEMPERATURA', '180°C','0°C','0.2');
INSERT INTO item VALUES ('910-9','TERMÓMETRO DIGITAL', 'LABSCIENT', 'PARA NEVERA',' -50°C < T < 70°C', 'TEMPERATURA', '70°C','-50°C','0.1');
INSERT INTO item VALUES ('BOE311','TERMÓMETRO DIGITAL', 'ACCURATE', 'BOE311',' -50°C < T < 300°C', 'TEMPERATURA', '300°C','-50°C','0.1');


INSERT INTO item_cliente VALUES('Ref-1D1310572','0101','1D1310572','Calibrar','-30 °C < T < 200 °C');
INSERT INTO item_cliente VALUES('EMC-000317',	'800194600-3',	'104-IR',	'Calibrar',	'-50 °C < T < 250 °C');
INSERT INTO item_cliente VALUES('0006756','800.194.600-3','VC230A','Equipo laboratorio','30%HR A 90%HR');
INSERT INTO item_cliente VALUES ('9140-BS','900073613-2','A28194','Equipo de laboratorio','35°C < T < 350°C');
INSERT INTO item_cliente VALUES('TDA-1','0101','TBM30040C3','Equipo de laboratorio','0 °C < T < 250 °C');
INSERT INTO item_cliente VALUES ('7-3-80021','1030586792','260188','Medir temperatura de las comidas','0°C < T < 180°C');
INSERT INTO item_cliente VALUES ('TS-1','1030586792','910-9','Medir temperatura de la nevera','-50°C < T < 70°C');
INSERT INTO item_cliente VALUES ('BOE311-TD','1030586792','BOE311','Tratamiento de alimentos','-50°C < T < 300°C');


INSERT INTO cliente VALUES('800.194.600-3','AGROSAVIA','Auxiliar de venta','2462544','2462544','AGROSAVIA@gmail.com','Bogotá','Km 14 vía Mosquera - Bogotá','4c15');
INSERT INTO cliente VALUES('0101','Creaciones y suministros', 'Directora comercial',' 9017160',' 9017160','creacionesysuministrossas@gmail.com','Bogotá','Carrera 67 No. 10-10','8c28');
INSERT INTO cliente VALUES('900073613-2','CALIBRATION SERVICE SAS', null,'2047699','2047699','calibrationservice@gmail.co', 'Bogotá','CARRERA 69 A No. 55- 16 SUR','7c02');
INSERT INTO cliente VALUES('1030586792','4 KARNES', null, '5028751','5028751','karnes@gmail.co', 'Bogotá','Carrera 70b #3-45','5c21');

-- usuarios cliente
INSERT INTO usuario VALUES(default, '800.194.600-3', 'Luisa Gómez', 'contra', '800.194.600-3', null, null, false, false, false);
INSERT INTO usuario VALUES(default, '0101', 'Alejandra Lozano', 'contra', '0101', null, null, false, false, false);
INSERT INTO usuario VALUES(default, '900073613-2', null, 'contra3', '900073613-2', null, null, false, false, false);
INSERT INTO usuario VALUES(default, '1030586792', 'Fabian Avila', 'contra', '1030586792', null, null, false, false, false);
-- usuarios asesor
INSERT INTO usuario VALUES(default, 'cedula1', 'Alejandra Lozano', 'contra', null, '111', null, false, false, false);
-- usuarios laboratorista
INSERT INTO usuario VALUES(default, 'cedula2', 'Jhon Fredy Montoya', 'contra', null, null, '242', false, false, false);
INSERT INTO usuario VALUES(default, 'cedula3', 'Claudia Montoya', 'contra', null, null, '233', false, false, false);
INSERT INTO usuario VALUES(default, 'cedu', 'Juan Pablo Ovalle Sánchez', 'xlr8', null, null, null, false, false, false);

INSERT INTO orden_compra VALUES(default,'50°C, 75°C, 100°C, 150°C, 200°C', 'Caracterización','5', '725000','2019-06-18', '', 'EURAMENT-13','finalizado','5','2');
INSERT INTO orden_compra VALUES(default,'90 °C, 150 °C, 200 °C', 'Calibración','1', '300000','2019-09-11', '', 'Guía Técnica de Trazabilidad Metrológica e Incertidumbre de Medida en Caracterización Termica de Bannos y Hornos de Temperatura Controlada','finalizado','5','1');
INSERT INTO orden_compra VALUES(default,'2 °C,20°C, 40°C, 60°C, 70°C, 100°C,  150 °C,-20°C, -10 °C', 'Calibración','1', '400000','2019-08-22', '', 'Procedimiento para la calibración de Termómetros digitales  CEM-Edición digital','finalizado','5','3');
INSERT INTO orden_compra VALUES(default,'90°C, 150 °C,200 °C', 'Calibración','1', '350000','2019-08-22', '', 'TH-004','finalizado','5','2');
INSERT INTO orden_compra VALUES(default,'38%HR, 65%HR, 90%HR','Calibración','2','350000','2019-08-13','','"Procedimiento para la calibración de medidores de conciones ambientales de Temperatura y Humedad en aire"','finalizado','5','4');
INSERT INTO orden_compra VALUES (default,'90 °C, 150 °C, 180 °C', 'Calibración','1','400000','2019-09-11','','NTVVS 103','finalizado','5','4');
INSERT INTO orden_compra VALUES (default,'0°C, 5°C, 10°C, 20°C, 50°C, 70°C', 'Calibración','6', '1060000','2019-07-02', '', 'NT VVS 103','finalizado','5','4');

/* les falta el ultimo parametro, el id del usuario del cliente que solicitó la orden
INSERT INTO orden_compra VALUES (default,'-10°C, 5°C, 10°C', 'Calibración','3', '420000','2019-07-02', '', 'TH 001','finalizado','5','');
INSERT INTO orden_compra VALUES (default,'-30°C, -20°C, -10°C', 'Calibración','3', '420000','2019-07-02', '', 'TH 001','finalizado','5','');*/

INSERT INTO orden_compra_espec VALUES (default,1,   'Ref-1D1310572',    '90','150000','90 °C < T < 200 °C','finalizado');
INSERT INTO orden_compra_espec VALUES (default,1,   'Ref-1D1310572',    '150','150000','90 °C < T < 200 °C','finalizado');
INSERT INTO orden_compra_espec VALUES (default,4,   'TBM30040C3',       '90','180000','0 °C < T < 250 °C','finalizado');
INSERT INTO orden_compra_espec VALUES (default,4,   'TBM30040C3',       '150','180000','0 °C < T < 250 °C','finalizado');
INSERT INTO orden_compra_espec VALUES (default,4,   'TBM30040C3',       '180','180000','0 °C < T < 250 °C','finalizado');
INSERT INTO orden_compra_espec VALUES (default,2,   '0006756',          '38','180000','30%HR A 90%HR','finalizado');
INSERT INTO orden_compra_espec VALUES (default,2,   '0006756',          '65','180000','30%HR A 90%HR','finalizado');
INSERT INTO orden_compra_espec VALUES (default,2,   '0006756',          '90','180000','30%HR A 90%HR','finalizado');
INSERT INTO orden_compra_espec VALUES (default,3,   '9140-BS',          '50°C','100000','35°C < T < 350°C','finalizado');
INSERT INTO orden_compra_espec VALUES (default,3,  '9140-BS',          '75°C','100000','35°C < T < 350°C','finalizado');
INSERT INTO orden_compra_espec VALUES (default,3,  '9140-BS',          '100°C','150000','35°C < T < 350°C','finalizado');
INSERT INTO orden_compra_espec VALUES (default,3,  '9140-BS',          '150°C','175000','35°C < T < 350°C','finalizado');
INSERT INTO orden_compra_espec VALUES (default,3,  '9140-BS',          '200°C','200000','35°C < T < 350°C','finalizado');
INSERT INTO orden_compra_espec VALUES (default,5,  '7-3-80021',        '0°C','100000',' 0°C < T <  180°C','finalizado');
INSERT INTO orden_compra_espec VALUES (default,5,  '7-3-80021',        '5°C','150000',' 0°C < T <  180°C','finalizado');
INSERT INTO orden_compra_espec VALUES (default,5,  '7-3-80021',        '10°C','160000',' 0°C < T <  180°C','finalizado');
INSERT INTO orden_compra_espec VALUES (default,5,  '7-3-80021',        '20°C','200000',' 0°C < T <  180°C','finalizado');
INSERT INTO orden_compra_espec VALUES (default,5,  '7-3-80021',        '50°C','200000',' 0°C < T <  180°C','finalizado');
INSERT INTO orden_compra_espec VALUES (default,5,  '7-3-80021',        '70°C','250000',' 0°C < T <  180°C','finalizado');
INSERT INTO orden_compra_espec VALUES (default,6,  'TS-1',             '-10°C','100000',' -50°C < T < 70°C','finalizado');
INSERT INTO orden_compra_espec VALUES (default,6,  'TS-1','5°C','150000',' -50°C < T < 70°C','finalizado');
INSERT INTO orden_compra_espec VALUES (default,6,  'TS-1','10°C','170000',' -50°C < T < 70°C','finalizado');
INSERT INTO orden_compra_espec VALUES (default,7,  'BOE311-TD','-30°C','100000',' -50°C < T < 300°C','finalizado');
INSERT INTO orden_compra_espec VALUES (default,7,  'BOE311-TD','-205°C','150000',' -50°C < T < 300°C','finalizado');
INSERT INTO orden_compra_espec VALUES (default,7,  'BOE311-TD','-10°C','170000','-50°C < T < 300°C','finalizado');



INSERT INTO trazabilidad VALUES ('0271','CMI','34316-5+1498J-19','935-14-116','','','','','','','','','');
INSERT INTO trazabilidad VALUES ('027','CMI','34316-5+1498J-19','935-14-116','','','','','','','','','');
INSERT INTO trazabilidad VALUES ('027','CTD',	'T-027',		'T-028',	'1D1310572',	'','','','','','','','');
INSERT INTO trazabilidad VALUES ('006','CTV',	'34316-5+1498J-19',	'935-14-116',	'1D1310572',	'','','','','','','','');
INSERT INTO trazabilidad VALUES ('010','CH','TH-102097275','TH-102097277','HCP108','','','','','','','','');
INSERT INTO trazabilidad VALUES ('001','CMI','TERMOMETRO DIGITAL CON SONDA Pt-100','TERMOMETRO DIGITAL CON SONDA Pt-100','','','','','','','','','');
INSERT INTO trazabilidad VALUES ('005','CMI','34316-5+1498J-19','1D1310572','','','','','','','','','');
INSERT INTO trazabilidad VALUES ('001','CTA','UBS-Pt-100','','','','','','','','','','');
INSERT INTO trazabilidad VALUES ('007','CTD','UBS-Pt-100','UBS-Pt-100','BAÑO TEMPERATURA CONTROLADA','','','','','','','','');
INSERT INTO trazabilidad VALUES ('005','CTD','UBS-Pt-100','UBS-Pt-100','BAÑO TEMPERATURA CONTROLADA','','','','','','','','');


/* no refieren a ningún certificadoexistente
INSERT INTO emitir VALUES('233','027','CTD');
INSERT INTO emitir VALUES('242','006','CTV');
INSERT INTO emitir VALUES('242','010','CH');*/

/* no son emitidos por ningún laboratorista*/
INSERT INTO certificado VALUES ('0101','CH',1,'21','20.5','85.3','47.4', '7');

INSERT INTO certificado VALUES ('0115','CU','29','38.5','92.3','45.4','35.5', '7');
INSERT INTO certificado VALUES ('0188','CRY','69','24.5','85.3','67.4','35.5', '7');
INSERT INTO certificado VALUES ('0198','CPO','54','66.5','54.3','47.4','35.5', '7');
/*----------------*/
INSERT INTO certificado VALUES ('0271','CMI',1,'24.2','20.8','67.6','45.5', '7');
INSERT INTO certificado VALUES ('027','CMI',1,'24.2','20.8','67.6','46.5', '6');
INSERT INTO certificado VALUES ('001','CMI',1,'23.6','22.0','74.0','55.0', '6');
INSERT INTO certificado VALUES ('005','CMI',1,'22.3','21.1','48.2','46.5', '6');
INSERT INTO certificado VALUES ('001','CTA',1,'24.6','20.3','61.3','48.4', '6');
INSERT INTO certificado VALUES ('007','CTD',1,'24.3','23.4','67.3','54.8', '6');
INSERT INTO certificado VALUES ('005','CTD',1,'22.8','21.6','56.8','48.5', '6');

INSERT INTO temperatura VALUES('0271','CMI','90','90','90','90','0','1.65','0.24' );
INSERT INTO temperatura VALUES('0271','CMI','150','150','150','150','0','0.79','0.53');
INSERT INTO temperatura VALUES('0271','CMI','200','200','200','200','0','1.15','0.51');
INSERT INTO temperatura VALUES('027','CMI','90','90','90','90','0','1.65','0.24' );
INSERT INTO temperatura VALUES('027','CMI','150','150','150','150','0','0.79','0.53');
INSERT INTO temperatura VALUES('027','CMI','200','200','200','200','0','1.15','0.51');
INSERT INTO temperatura VALUES ('029','CMI','50','50','50','50','0.00','0.13','-0.26' );
INSERT INTO temperatura VALUES ('029','CMI','75','75','75','75','0.00','0.13','-0.36' );
INSERT INTO temperatura VALUES ('029','CMI','100','100','100','100','0.00','0.21','-0.46' );
INSERT INTO temperatura VALUES ('029','CMI','150','150','150','150','0.00','0.19','-0.55' );
INSERT INTO temperatura VALUES ('029','CMI','200','200','200','200','0.00','0.19','-0.84' );
INSERT INTO temperatura VALUES('001','CTA','0','-0.20','0.00','-0.55','0.27','0.24','0.17');
INSERT INTO temperatura VALUES('001','CTA','5','4.40','4.40','4.40','0.00','0.26','0.69');
INSERT INTO temperatura VALUES('001','CTA','10','10.00','10.00','10.00','0.00','0.25','0.06');
INSERT INTO temperatura VALUES('001','CTA','20','20.00','20.00','20.00','0.00','0.28','0.10');
INSERT INTO temperatura VALUES('001','CTA','50','49.40','49.40','49.40','0.00','0.28','0.56');
INSERT INTO temperatura VALUES('001','CTA','70','70.00','70.00','70.00','0.00','0.27','0.00');
INSERT INTO temperatura VALUES('007','CTD','-10','-10.62','-10.60','-10.70','-10.62','0.47','0.56');
INSERT INTO temperatura VALUES('007','CTD','5','4.50','4.50','4.50','4.50','0.12','0.53');
INSERT INTO temperatura VALUES('007','CTD','10','9.60','9.60','9.60','9.60','0.12','0.41');
INSERT INTO temperatura VALUES('005','CTD','-30','-29.00','-29.00','-29.00','0.00','0.23','-0.81');
INSERT INTO temperatura VALUES('005','CTD','-20','-19.70','-19.7','-19.70','0.00','0.29','-0.35');
INSERT INTO temperatura VALUES('005','CTD','-10','-9.16','-9.10','-9.20','0.05','0.47','-0.81');


INSERT INTO estBa VALUES('0271','CMI','90','0.08','0.17','2');
INSERT INTO estBa VALUES('0271','CMI','150','0.03','0.06','2');
INSERT INTO estBa VALUES('0271','CMI','200','0.02','0.05','2');
INSERT INTO estBa VALUES('027','CMI','90','0.08','0.17','2');
INSERT INTO estBa VALUES('027','CMI','150','0.03','0.06','2');


INSERT INTO zonaBa VALUES ('0271','CMI','90','P1',2,0.10, 0.11);
INSERT INTO zonaBa VALUES ('0271','CMI','90','P2',2,0.19,0.21);
INSERT INTO zonaBa VALUES ('0271','CMI','90','P3','2',0.20,0.23);
INSERT INTO zonaBa VALUES ('0271','CMI','90','P4','2',0.04,0.04);
INSERT INTO zonaBa VALUES ('0271','CMI','90','P5','2',0.021,0.24);
INSERT INTO zonaBa VALUES ('0271','CMI','90','P6','2',0.09,0.10);
INSERT INTO zonaBa VALUES ('0271','CMI','90','P7','2',0.03,0.03);
INSERT INTO zonaBa VALUES ('0271','CMI','90','P8','2',0.26,0.30);
INSERT INTO zonaBa VALUES ('0271','CMI','90','P9','2',2.28,2.63);
INSERT INTO zonaBa VALUES ('0271','CMI','90','P10','2',0.49,0.57);
INSERT INTO zonaBa VALUES ('0271','CMI','90','P11','2',0.91,1.05);
INSERT INTO zonaBa VALUES ('0271','CMI','90','P12','2',1.31,1.51);

INSERT INTO zonaBa VALUES ('0271','CMI','150','P1',2,0.03, 0.04);
INSERT INTO zonaBa VALUES ('0271','CMI','150','P2',2,0.08,0.09);
INSERT INTO zonaBa VALUES ('0271','CMI','150','P3',2,0.11,0.13);
INSERT INTO zonaBa VALUES ('0271','CMI','150','P4',2,0.12,0.14);
INSERT INTO zonaBa VALUES ('0271','CMI','150','P5',2,-0.06,0.07);
INSERT INTO zonaBa VALUES ('0271','CMI','150','P6',2,-0.13,0.14);
INSERT INTO zonaBa VALUES ('0271','CMI','150','P7',2,0.02,0.03);
INSERT INTO zonaBa VALUES ('0271','CMI','150','P8',2,0.00,0.00);
INSERT INTO zonaBa VALUES ('0271','CMI','150','P9',2,-0.85,0.99);
INSERT INTO zonaBa VALUES ('0271','CMI','150','P10',2,-0.72,0.83);
INSERT INTO zonaBa VALUES ('0271','CRS','150','P11',2,-0.60,0.69);
INSERT INTO zonaBa VALUES ('0271','CMI','150','P12',2,-0.43,0.50);

INSERT INTO zonaBa VALUES ('0271','CMI','200','P1','2',-0.01, 0.01);
INSERT INTO zonaBa VALUES ('0271','CMI','200','P2','2',0.05,0.06);
INSERT INTO zonaBa VALUES ('0271','CMI','200','P3','2',0.11,0.12);
INSERT INTO zonaBa VALUES ('0271','CMI','200','P4','2',0.02,0.03);
INSERT INTO zonaBa VALUES ('0271','CMI','200','P5','2',0.02,0.03);
INSERT INTO zonaBa VALUES ('0271','CMI','200','P6','2',0.02,0.03);
INSERT INTO zonaBa VALUES ('0271','CMI','200','P7','2',0.02,0.03);
INSERT INTO zonaBa VALUES ('0271','CMI','200','P8','2',0.02,0.03);
INSERT INTO zonaBa VALUES ('0271','CMI','200','P9','2',-1.12,1.30);
INSERT INTO zonaBa VALUES ('0271','CMI','200','P10','2',-0.80,0.93);
INSERT INTO zonaBa VALUES ('0271','CMI','200','P11','2',-1.03,1.19);
INSERT INTO zonaBa VALUES ('0271','CMI','200','P12','2',-0.96,1.11);

INSERT INTO zonaBa VALUES ('027','CMI','90','P1','2',0.10, 0.11);
INSERT INTO zonaBa VALUES ('027','CMI','90','P2','2',0.19,0.21);
INSERT INTO zonaBa VALUES ('027','CMI','90','P3','2',0.20,0.23);
INSERT INTO zonaBa VALUES ('027','CMI','90','P4','2',0.04,0.04);
INSERT INTO zonaBa VALUES ('027','CMI','90','P5','2',0.021,0.24);
INSERT INTO zonaBa VALUES ('027','CMI','90','P6','2',0.09,0.10);
INSERT INTO zonaBa VALUES ('027','CMI','90','P7',2,0.03,0.03);
INSERT INTO zonaBa VALUES ('027','CMI','90','P8','2',0.26,0.30);
INSERT INTO zonaBa VALUES ('027','CMI','90','P9','2',2.28,2.63);
INSERT INTO zonaBa VALUES ('027','CMI','90','P10','2',0.49,0.57);
INSERT INTO zonaBa VALUES ('027','CMI','90','P11','2',0.91,1.05);
INSERT INTO zonaBa VALUES ('027','CMI','90','P12','2',1.31,1.51);

INSERT INTO zonaBa VALUES ('027','CMI','150','P1','2',0.03, 0.04);
INSERT INTO zonaBa VALUES ('027','CMI','150','P2','2',0.08,0.09);
INSERT INTO zonaBa VALUES ('027','CMI','150','P3','2',0.11,0.13);
INSERT INTO zonaBa VALUES ('027','CMI','150','P4','2',0.12,0.14);
INSERT INTO zonaBa VALUES ('027','CMI','150','P5','2',-0.06,0.07);
INSERT INTO zonaBa VALUES ('027','CMI','150','P6',2,-0.13,0.14);
INSERT INTO zonaBa VALUES ('027','CMI','150','P7','2',0.02,0.03);
INSERT INTO zonaBa VALUES ('027','CMI','150','P8','2',0.00,0.00);
INSERT INTO zonaBa VALUES ('027','CMI','150','P9','2',-0.85,0.99);
INSERT INTO zonaBa VALUES ('027','CMI','150','P10','2',-0.72,0.83);
INSERT INTO zonaBa VALUES ('027','CMI','150','P11','2',-0.60,0.69);
INSERT INTO zonaBa VALUES ('027','CMI','150','P12','2',-0.43,0.50);

INSERT INTO zonaBa VALUES ('027','CMI','200','P1','2',-0.01, 0.01);
INSERT INTO zonaBa VALUES ('027','CMI','200','P2','2',0.05,0.06);
INSERT INTO zonaBa VALUES ('027','CMI','200','P3','2',0.11,0.12);
INSERT INTO zonaBa VALUES ('027','CMI','200','P4','2',0.02,0.03);
INSERT INTO zonaBa VALUES ('027','CMI','200','P5','2',0.02,0.03);
INSERT INTO zonaBa VALUES ('027','CMI','200','P6','2',0.02,0.03);
INSERT INTO zonaBa VALUES ('027','CMI','200','P7','2',0.02,0.03);
INSERT INTO zonaBa VALUES ('027','CMI','200','P8','2',0.02,0.03);
INSERT INTO zonaBa VALUES ('027','CMI','200','P9','2',-1.12,1.30);
INSERT INTO zonaBa VALUES ('027','CMI','200','P10','2',-0.80,0.93);
INSERT INTO zonaBa VALUES ('027','CMI','200','P11','2',-1.03,1.19);
INSERT INTO zonaBa VALUES ('027','CMI','200','P12','2',-0.96,1.11);


INSERT INTO bloque VALUES ('001','CMI','50','0.01','0.07','0.07');
INSERT INTO bloque VALUES ('001','CMI','75','0.02','0.04','0.06');
INSERT INTO bloque VALUES ('001','CMI','100','0.02','0.22','0.08');
INSERT INTO bloque VALUES ('001','CMI','150','0.02','0.18','0.09');
INSERT INTO bloque VALUES ('001','CMI','200','0.03','0.32','0.10');

INSERT INTO analogo VALUES ('001','CTA','0','0.01','0.00');
INSERT INTO analogo VALUES ('001','CTA','5','0.04','0.01');
INSERT INTO analogo VALUES ('001','CTA','10','0.02','0.01');
INSERT INTO analogo VALUES ('001','CTA','20','0.02','0.00');
INSERT INTO analogo VALUES ('001','CTA','50','0.01','0.00');
INSERT INTO analogo VALUES ('001','CTA','70','0.02','0.01');

INSERT INTO digital VALUES ('007','CTD','-10','0.12','0.14','0.01');
INSERT INTO digital VALUES ('007','CTD','5','0.03','0.02','-0.02');
INSERT INTO digital VALUES ('007','CTD','10','0.02','0.04','0.00');

INSERT INTO digital VALUES ('005','CTD','-30','0.03','0.06','-0.28');
INSERT INTO digital VALUES ('005','CTD','-20','0.06','0.08','-0.41');
INSERT INTO digital VALUES ('005','CTD','-10','0.02','0.05','-0.10');
--


INSERT INTO humedad VALUES('010','CH',38,36.74,null,null,null,1.52,3);
INSERT INTO humedad VALUES('010','CH','65','64',null,null,null,'1.60','0.70');
INSERT INTO humedad VALUES('010','CH','90','87.06',null,null,null,'1.73','-1.96');
INSERT INTO humedad VALUES('005','CMI','90','90','90','90','0','0.61','0.21');
INSERT INTO humedad VALUES('005','CMI',150,'150','150','150','0','0.60','0.53');
INSERT INTO humedad VALUES('005','CMI','180','180','180','180','0','0.61','0.60');

INSERT INTO termhighum VALUES('005','CMI',90,0,0,0);
INSERT INTO termhighum VALUES('005','CMI',150,0,0,0);
INSERT INTO termhighum VALUES('005','CMI',180,0,0,0);
INSERT INTO termhighum VALUES('010','CH','38','1','1.3','0.7');
INSERT INTO termhighum VALUES('010','CH','65','1','1.3','0.7');
INSERT INTO termhighum VALUES('010','CH','90','1','1.3','0.7');


INSERT INTO resumen_estadistico VALUES ('001','CMI','50',null,null,null,null,null,null,null,null,'49.91','49.67','49.58','49.41','49.81','49.52','0.10','0.07');
INSERT INTO resumen_estadistico VALUES ('001','CMI','75',null,null,null,null,null,null,null,null,'74.83','74.40','74.62','74.42','74.67','74.51','0.10','0.07');
INSERT INTO resumen_estadistico VALUES ('001','CMI','100',null,null,null,null,null,null,null,null,'99.64','99.21','99.96','99.73','99.48','99.86','0.10','0.07');
INSERT INTO resumen_estadistico VALUES ('001','CMI','150',null,null,null,null,null,null,null,null,'149.60','149.02','149.91','149.67','149.35','149.77','0.10','0.07');
INSERT INTO resumen_estadistico VALUES ('001','CMI','200',null,null,null,null,null,null,null,null,'199.07','198.42','199.81','199.54','198.81','199.66','0.10','0.07');

INSERT INTO resumen_estadistico VALUES ('001','CTA','0',null,null,null,null,null,null,null,null,'-0.03','-0.4',null,null,'-0.03',null,'0.00',null);
INSERT INTO resumen_estadistico VALUES ('001','CTA','5',null,null,null,null,null,null,null,null,'5.11','5.07',null,null,'5.09',null,'0.01',null);
INSERT INTO resumen_estadistico VALUES ('001','CTA','10',null,null,null,null,null,null,null,null,'10.07','10.05',null,null,'10.06',null,'0.01',null);
INSERT INTO resumen_estadistico VALUES ('001','CTA','20',null,null,null,null,null,null,null,null,'20.11','20.09',null,null,'20.09',null,'0.00',null);
INSERT INTO resumen_estadistico VALUES ('001','CTA','50',null,null,null,null,null,null,null,null,'49.97','49.96',null,null,'49.96',null,'0.00',null);
INSERT INTO resumen_estadistico VALUES ('001','CTA','70',null,null,null,null,null,null,null,null,'70.01','69.99',null,null,'70.00',null,'0.01',null);

INSERT INTO resumen_estadistico VALUES ('007','CTD','-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'-10.00','-10.12','-9.98','-10.12','-10.05','-10.6','0.03','0.03');
INSERT INTO resumen_estadistico VALUES ('007','CTD','5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5.04','5.01','5.04','5.02','5.02','5.03','0.01','0.01');
INSERT INTO resumen_estadistico VALUES ('007','CTD','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10.02','10.00','10.03','9.99','10.01','10.01','0.01','0.01');

INSERT INTO resumen_estadistico VALUES ('005','CTD','-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'-29.94','-29.97','-29.64','-29.70','-29.95','-29.67','0.01','0.02');
INSERT INTO resumen_estadistico VALUES ('005','CTD','-20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'-20.23','-20.29','-19.81','-19.89','-20.25','-19.84','0.01','0.02');
INSERT INTO resumen_estadistico VALUES ('005','CTD','-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'-10.00','-10.02','-9.89','-9.94','-10.01','-9.92','0.01','0.01');
