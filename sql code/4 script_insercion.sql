

/*-------------------------Auto_incre---id_cli------CC/NIT---------------NOMBRE-------------CONTRASEÑA------ASES----LAB----MET----GER----SU---*/

INSERT INTO usuario VALUES(default, 	1, 			'800.194.600-3', 	'Luisa Gómez', 		'contra1',	 	false, false, false, false, false);
INSERT INTO usuario VALUES(default, 	2, 			'0101', 			'Alejandra Lozano', 'contra2', 		false, false, false, false, false);
INSERT INTO usuario VALUES(default, 	3, 			'900073613-2', 		null, 				'contra3', 		false, false, false, false, false);
INSERT INTO usuario VALUES(default, 	4,			'1030586792', 		'Fabian Avila', 	'contra4', 		false, false, false, false, false);
-- usuarios asesor
INSERT INTO usuario VALUES(default, null, 			'cedula1', 			'Alejandra Lozano', 'contra5', 		TRUE,  false, false, false, false);
-- usuarios laboratorista
INSERT INTO usuario VALUES(default, null, 			'cedula2', 			'Jhon Fredy Montoya', 'contra', 	false, TRUE, false, false, false);
INSERT INTO usuario VALUES(default, null, 			'cedula3', 			'Claudia Montoya', 'contra', 		false, TRUE, false, false, false);



/*------------------------Auto_incre---nit-----------EMPRESA----------------------CONTACTO--------------TEL---------FAX--------EMAIL----------------------------------CIUDAD------DIRECC------------------------ESTADO*/
/*1*/INSERT INTO cliente VALUES(DEFAULT,'800.194.600-3',	'AGROSAVIA',				'Auxiliar de venta',	'2462544',	'2462544',	'AGROSAVIA@gmail.com',					'Bogotá','Km 14 vía Mosquera - Bogotá',	'A');
/*2*/INSERT INTO cliente VALUES(DEFAULT,'0101',			'Creaciones y suministros', 'Directora comercial',	'9017160',	'9017160',	'creacionesysuministrossas@gmail.com',	'Bogotá','Carrera 67 No. 10-10',		'A');
/*3*/INSERT INTO cliente VALUES(DEFAULT,'900073613-2',	'CALIBRATION SERVICE SAS', 	null,					'2047699',	'2047699',	'calibrationservice@gmail.co', 			'Bogotá','CARRERA 69 A No. 55- 16 SUR',	'B');
/*4*/INSERT INTO cliente VALUES(DEFAULT,'1030586792',	'4 KARNES', 				null, 					'5028751',	'5028751',	'karnes@gmail.co', 						'Bogotá','Carrera 70b #3-45',			'B');



/*-------------------------Auto_incre----------nombre---------------------let--------marca-------------mod--------------mag------al_max----al_min---res-----escala*/
/*1*/INSERT INTO item VALUES (DEFAULT,		'TERMÓMETRO DIGITAL', 		'CTD',	'ACCURATE', 		'BOE311',		'TEMPERATURA', 	300,	-50,	'0.1',	'°C',DEFAULT);
/*2*/INSERT INTO item VALUES (DEFAULT,		'BLOQUE SECO', 				'CBS',	'HART SCIENTIFIC', 	'9140',			'TEMPERATURA', 	350,	35,		'0.1',	'°C',DEFAULT);
/*3*/INSERT INTO item VALUES (DEFAULT,		'ULTRACONGELADOR', 			'CMI',	'SANYO', 			'MDFU53VA',		'TEMPERATURA', 	-50,	-80,	'1',		'°C',DEFAULT);
/*4*/INSERT INTO item VALUES (DEFAULT,		'TERMOHIGROMETRO', 			'CH',	'EXTECH', 			'RHT10-USB',	'HUMEDAD',	 	100,	0,		'0.1',	'%HR',DEFAULT);
/*5*/INSERT INTO item VALUES (DEFAULT,		'BANNO TERMOSTATADO',		'CBN',	'POLYSCIENCE', 		'9502A11C',		'TEMPERATURA',	200,	-30,	'0.1',	'°C',DEFAULT);
/*6*/INSERT INTO item VALUES (DEFAULT,		'TERMOMETRO DE VIDRIO',		'CTV',	'PG ERTCB', 		'ASTM 8F',		'TEMPERATURA',	760,	30,		'2',		'°F',DEFAULT);
/*7*/INSERT INTO item VALUES (DEFAULT,		'TERMÓMETRO ANALOGO', 		'CTA',	'WINTERS', 			'TBM30040C3',	'TEMPERATURA', 	250,	0,		'2',		'°C',DEFAULT);
/*8*/INSERT INTO item VALUES (DEFAULT,		'TERMÓMETRO DIGITAL', 		'CTD',	'TESTO', 			'104-IR',		'TEMPERATURA', 	250,	-50,	'0.1',	'°C',DEFAULT);


/*------------------------------Auto_incre---id_item--------id_cli--------------serie---------------id_interna-------al_max-----al_min--uso*/
INSERT INTO item_cliente VALUES (DEFAULT,	1,				'4',		'BOE311-TD',		'BOE311-TD',	300,		-50,	'Tratamiento de alimentos',DEFAULT);
INSERT INTO item_cliente VALUES (DEFAULT,	2,				'3',		'A28194',			'9140-BS',		350,		35,		'INCUBAR MATERIAL BIOLOGICO',DEFAULT);
INSERT INTO item_cliente VALUES (DEFAULT,	3,				'1',	'11090130',			'0005593',		-50,		-80,	'CONGELADOR DE PRODUCTOS DE LABORATORIO',DEFAULT);
INSERT INTO item_cliente VALUES (DEFAULT,	4,				'1',	'101414',			'0006752',		10,			0,		'CONDICIONES AMBIENTALES',DEFAULT);
INSERT INTO item_cliente VALUES (DEFAULT,	5,				'2',				'1D1310572',		'REF-1D1310572',200,		-30,	'CALIBRACION DE EQUIPOS',DEFAULT);
INSERT INTO item_cliente VALUES (DEFAULT,	6,				'2',				'2519',				'2519-TV',		200,		-80,	'EQUIPO DE INVENTARIO',DEFAULT);
INSERT INTO item_cliente VALUES (DEFAULT,	7,				'2',				'TBM30040C3',		'TDA-1',		200,			0,	'EQUIPO DE INVENTARIO',DEFAULT);
INSERT INTO item_cliente VALUES (DEFAULT,	8,				'1',	'104-IR',			'EMC-000317',	250,		-50,	'LABORATORIO',DEFAULT);


/*------------------------------ID------ASES_ID--CLI_ID--PRE_TOT---PRE-FIN---FECHA---------ESTADO*/
INSERT INTO orden_compra VALUES (default,	5,		4,	'714350',	'714350','2019-07-02','finalizado');
INSERT INTO orden_compra VALUES (default,	5,		3,	'598100',	'598100','2019-06-18','finalizado');
INSERT INTO orden_compra VALUES (default,	5,		1,	'300000',	'300000','2019-11-30','finalizado');
INSERT INTO orden_compra VALUES (default,	5,		1,	'215400',	'215400','2019-11-01','finalizado');
INSERT INTO orden_compra VALUES (default,	5,		2,	'550000',	'550000','2019-09-16','finalizado');
INSERT INTO orden_compra VALUES (default,	5,		2,	'283900',	'283900','2019-09-13','finalizado');
INSERT INTO orden_compra VALUES (default,	5,		1,	'1610350',	'1610350','2019-08-24','finalizado');



/*------------------------------------------AI-----ordc_id---itmC_id----serv--------------obs---metodo-----magnitud--------precio total--ranc--------------estado*/
/*1*/INSERT INTO orden_compra_espec VALUES (default,	1,		1,		'Calibración','', 		'TH-001', 		'TEMPERATURA',	'420000','-10',	'-30', 	'finalizado');
/*2*/INSERT INTO orden_compra_espec VALUES (default,	2,		2,		'Caracterización','', 	'EURAMENT-13', 	'TEMPERATURA',	'598100','200',	'50', 	'finalizado');
/*3*/INSERT INTO orden_compra_espec VALUES (default,	3,		3,		'Caracterización','', 	'EURAMENT-20', 	'TEMPERATURA',	'300000','-80',	'-80', 	'finalizado');
/*4*/INSERT INTO orden_compra_espec VALUES (default,	4,		4,		'Caracterización','', 	'TH-007', 		'HUMEDAD',	 	'215400','65',	'40', 	'finalizado');
/*5*/INSERT INTO orden_compra_espec VALUES (default,	5,		5,		'Caracterización','', 	'CENAM2014',	'TEMPERATURA', 	'275000','200',	'90', 	'finalizado');
/*6*/INSERT INTO orden_compra_espec VALUES (default,	5,		6,		'Calibración','', 		'TH-004',		'TEMPERATURA', 	'275000','200',	'90', 	'finalizado');
/*7*/INSERT INTO orden_compra_espec VALUES (default,	6,		7,		'Calibración','', 		'NT-VVS-103',	'TEMPERATURA', 	'283900','180',	'90', 	'finalizado');
/*8*/INSERT INTO orden_compra_espec VALUES (default,	7,		8,		'Calibración','', 		'TH-001',		'TEMPERATURA', 	'1610350','150','-10', 	'finalizado');


/*punto-----------------------AI-----ORD_ES------PUNTO*/
INSERT INTO punto VALUES (default,	1,	-30);
INSERT INTO punto VALUES (default,	1,	-20);
INSERT INTO punto VALUES (default,	1,	-10);
INSERT INTO punto VALUES (default,	2,	50);
INSERT INTO punto VALUES (default,	2,	75);
INSERT INTO punto VALUES (default,	2,	100);
INSERT INTO punto VALUES (default,	2,	150);
INSERT INTO punto VALUES (default,	2,	200);
INSERT INTO punto VALUES (default,	3,	-80);
INSERT INTO punto VALUES (default,	4,	40);
INSERT INTO punto VALUES (default,	4,	65);
INSERT INTO punto VALUES (default,	5,	90);
INSERT INTO punto VALUES (default,	5,	150);
INSERT INTO punto VALUES (default,	5,	200);
INSERT INTO punto VALUES (default,	6,	90);
INSERT INTO punto VALUES (default,	6,	150);
INSERT INTO punto VALUES (default,	6,	200);
INSERT INTO punto VALUES (default,	7,	90);
INSERT INTO punto VALUES (default,	7,	150);
INSERT INTO punto VALUES (default,	7,	180);
INSERT INTO punto VALUES (default,	8,	2);
INSERT INTO punto VALUES (default,	8,	20);
INSERT INTO punto VALUES (default,	8,	40);
INSERT INTO punto VALUES (default,	8,	60);
INSERT INTO punto VALUES (default,	8,	70);
INSERT INTO punto VALUES (default,	8,	100);
INSERT INTO punto VALUES (default,	8,	150);
INSERT INTO punto VALUES (default,	8,	-20);
INSERT INTO punto VALUES (default,	8,	-10);


/*precio--------------------AI-----MAGNITUD------PUN_MIN---PUN_MAX-----PRECIO*/
INSERT INTO precio VALUES (default,	'TEMPERATURA',	-80,	-70,	300000);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	-70,	-60,	282100);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	-60,	-50,	273150);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	-50,	-40,	264200);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	-40,	-30,	255300);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	-30,	-20,	246400);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	-20,	-10,	237450);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	-10,	0,		228500);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	0,		10,		219600);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	10,		20,		210700);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	20,		30,		201750);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	30,		40,		192800);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	40,		50,		183900);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	50,		60,		175000);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	60,		70,		166050);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	70,		80,		157100);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	80,		90,		148200);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	90,		100,	139300);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	100,	110,	130300);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	110,	140,	141400);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	140,	130,	114500);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	130,	140,	103600);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	140,	150,	94600);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	150,	160,	85700);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	160,	170,	76800);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	170,	180,	67850);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	180,	190,	58900);
INSERT INTO precio VALUES (default,	'TEMPERATURA',	190,	200,	50000);

INSERT INTO precio VALUES (default,	'HUMEDAD',		38,		42,		50000);
INSERT INTO precio VALUES (default,	'HUMEDAD',		42,		46,		69250);
INSERT INTO precio VALUES (default,	'HUMEDAD',		46,		50,		88500);
INSERT INTO precio VALUES (default,	'HUMEDAD',		50,		54,		107700);
INSERT INTO precio VALUES (default,	'HUMEDAD',		54,		58,		147000);
INSERT INTO precio VALUES (default,	'HUMEDAD',		58,		62,		146200);
INSERT INTO precio VALUES (default,	'HUMEDAD',		62,		66,		165400);
INSERT INTO precio VALUES (default,	'HUMEDAD',		66,		70,		184600);
INSERT INTO precio VALUES (default,	'HUMEDAD',		70,		74,		203850);
INSERT INTO precio VALUES (default,	'HUMEDAD',		74,		78,		223100);
INSERT INTO precio VALUES (default,	'HUMEDAD',		78,		82,		242300);
INSERT INTO precio VALUES (default,	'HUMEDAD',		82,		86,		261500);
INSERT INTO precio VALUES (default,	'HUMEDAD',		86,		90,		300000);

/*certificado--------------------------AI---ORD_ES_id----temax---temin---humax---humin---trazmed-----lab_id*/
INSERT INTO certificado VALUES (default,	1,			22.8,	21.6,	56.8,	48.5,	'BANNO  1D1310572',	6);
INSERT INTO certificado VALUES (default,	2,			23.6,	22.0,	74.0,	55.0,	null,				7);
INSERT INTO certificado VALUES (default,	3,			20.1,	20.1,	56.40,	56.40,	null,				6);
INSERT INTO certificado VALUES (default,	4,			20.4,	19.9,	69.1,	65.7,	'BANNO  1D1310572',	7);
INSERT INTO certificado VALUES (default,	5,			24.2,	20.8,	67.6,	46.5,	null,				6);
INSERT INTO certificado VALUES (default,	6,			21.2,	21.1,	53.1,	47.3,	'BANNO  1D1310572',	6);
INSERT INTO certificado VALUES (default,	7,			22.3,	21.1,	48.2,	46.5,	'BANNO  1D1310572',	7);
INSERT INTO certificado VALUES (default,	8,			22.7,	20.4,	63,		46.5,	'BANNO  1D1310572',	6);


/*certificado_num-------------cert_ID-----let------num*/
INSERT INTO certificado_num VALUES (1,	'CTD',		005);
INSERT INTO certificado_num VALUES (2,	'CBS',		001);
INSERT INTO certificado_num VALUES (3,	'CMI',		028);
INSERT INTO certificado_num VALUES (4,	'CH',		011);
INSERT INTO certificado_num VALUES (5,	'CBN',		027);
INSERT INTO certificado_num VALUES (6,	'CTV',		006);
INSERT INTO certificado_num VALUES (7,	'CTA',		005);
INSERT INTO certificado_num VALUES (1,	'CTD',		027);


/*sonda------------------son_id AI-----son_nom*/
INSERT INTO sonda VALUES (default,		1);
INSERT INTO sonda VALUES (default,		2);
INSERT INTO sonda VALUES (default,		3);
INSERT INTO sonda VALUES (default,		4);
INSERT INTO sonda VALUES (default,		5);
INSERT INTO sonda VALUES (default,		6);
INSERT INTO sonda VALUES (default,		7);
INSERT INTO sonda VALUES (default,		8);


/*certificado_sonda-------------cert_ID-----son_id*/
INSERT INTO sonda VALUES (3,		1);
INSERT INTO sonda VALUES (3,		2);
INSERT INTO sonda VALUES (3,		3);
INSERT INTO sonda VALUES (3,		4);
INSERT INTO sonda VALUES (3,		5);
INSERT INTO sonda VALUES (3,		6);
INSERT INTO sonda VALUES (3,		7);
INSERT INTO sonda VALUES (3,		8);

/*patron-----------------------pat_id AI-----pat_nom*/
INSERT INTO patron VALUES (default,			'T-027');
INSERT INTO patron VALUES (default,			'T-028');
INSERT INTO patron VALUES (default,			'34316-5+1498J-19');
INSERT INTO patron VALUES (default,			'935-14-116');


/*certificado_patron-------------cert_ID-----pat_id*/
INSERT INTO patron VALUES (1,		1);
INSERT INTO patron VALUES (1,		2);
INSERT INTO patron VALUES (2,		3);
INSERT INTO patron VALUES (2,		4);
INSERT INTO patron VALUES (3,		3);
INSERT INTO patron VALUES (3,		4);
INSERT INTO patron VALUES (4,		1);
INSERT INTO patron VALUES (4,		2);
INSERT INTO patron VALUES (5,		3);
INSERT INTO patron VALUES (5,		4);
INSERT INTO patron VALUES (6,		3);
INSERT INTO patron VALUES (6,		4);
INSERT INTO patron VALUES (7,		3);
INSERT INTO patron VALUES (8,		1);
INSERT INTO patron VALUES (8,		2);


/*estadistico-----------------_id AI-----prom--------max-----------min------dev*/
/* 1 (-30) IBC--P1--P2*/
INSERT INTO estadistico VALUES (default,  -29.0,	-29.0,		-29.0,		0.00);
INSERT INTO estadistico VALUES (default,  -29.95,	-29.94,		-29.97,		0.01);
INSERT INTO estadistico VALUES (default,  -29.67,	-29.64,		-29.70,		0.02);
/* 1 (-20) IBC--P1--P2*/
INSERT INTO estadistico VALUES (default,  -19.70,	-19.70,		-19.70,		0.00);
INSERT INTO estadistico VALUES (default,  -20.25,	-20.23,		-20.29,		0.01);
INSERT INTO estadistico VALUES (default,  -19.84,	-19.81,		-19.89,		0.02);
/* 1 (-10) IBC--P1--P2*/
INSERT INTO estadistico VALUES (default,  -9.16,	-9.10,		-9.2,		0.05);
INSERT INTO estadistico VALUES (default,  -10.01,	-10.0,		-10.02,		0.01);
INSERT INTO estadistico VALUES (default,  -9.92,	-9.89,		-9.94,		0.01);
/* 2 (50) IBC*/
INSERT INTO estadistico VALUES (default,  50.0,		50.0,		50.0,		0.00);
INSERT INTO estadistico VALUES (default,  49.81,	49.91,		49.67,		0.1);
INSERT INTO estadistico VALUES (default,  49.68,	49.58,		49.41,		0.07);
/* 2 (75) IBC*/
INSERT INTO estadistico VALUES (default,  75.0,	75.0,		75.0,		0.00);
INSERT INTO estadistico VALUES (default,  74.67,	74.83,		74.40,		0.18);
INSERT INTO estadistico VALUES (default,  74.51,	74.62,		74.42,		0.06);
/* 2 (100) IBC*/
INSERT INTO estadistico VALUES (default,  100,	100,		100,		0.0);
INSERT INTO estadistico VALUES (default,  99.48,	99.64,		99.21,		0.19);
INSERT INTO estadistico VALUES (default,  99.86,	99.96,		99.73,		0.08);
/* 2 (-30) IBC*/
INSERT INTO estadistico VALUES (default,  150.0,	150.0,		150.0,		0.00);
INSERT INTO estadistico VALUES (default,  149.35,	149.60,		149.02,		0.22);
INSERT INTO estadistico VALUES (default,  149.77,	149.91,		149.67,		0.09);
/* 2 (200) IBC*/
INSERT INTO estadistico VALUES (default,  200,	200,		200,		0.00);
INSERT INTO estadistico VALUES (default,  198.81,	199.07,		198.42,		0.27);
INSERT INTO estadistico VALUES (default,  199.26,	199.81,		199.54,		0.1);
/* 3(-80) IBC*/
INSERT INTO estadistico VALUES (default,  -81.35,	-81.09,		-81.62,		0.16);
INSERT INTO estadistico VALUES (default,  -81.55,	-81.21,		-81.79,		0.19);
INSERT INTO estadistico VALUES (default,  -79.86,	-79.6,		-80.00,		0.08);
/* 4 (40) IBC*/
INSERT INTO estadistico VALUES (default,  41,		41,			41, 		0.00);
INSERT INTO estadistico VALUES (default,  41.05,	41.20,		40.91,		0.08);
INSERT INTO estadistico VALUES (default,  41.46,	41.59,		41.35,		0.07);
/* 4(65) IBC*/
INSERT INTO estadistico VALUES (default,  62,		62,			62,			0);
INSERT INTO estadistico VALUES (default,  63.62,	63.87,		63.36,		0.14);
INSERT INTO estadistico VALUES (default,  63.49,	63.78,		63.27,		0.14);
/* 5(90) IBC*/
INSERT INTO estadistico VALUES (default, 	90,		90.01,		90,			0);
INSERT INTO estadistico VALUES (default, 	90.24,	90.28,		90.18,		0.1);
INSERT INTO estadistico VALUES (default, 	89.51,	90.10,		87.63,		0.07);
/* 5 (150) IBC*/
INSERT INTO estadistico VALUES (default,  150,		150.01,			150, 		0.01);
INSERT INTO estadistico VALUES (default,  150.53,	150.56,		150.49,		0.00);
INSERT INTO estadistico VALUES (default,  150.22,	150.53,		149.56,		0.01);
/* 5(200) IBC*/
INSERT INTO estadistico VALUES (default,  200,		200.01,			200,			0);
INSERT INTO estadistico VALUES (default,  200.51,	200.53,		200.49,		0);
INSERT INTO estadistico VALUES (default,  200.28,	200.66,		199.43,		0.01);
/* 6(90) IBC*/
INSERT INTO estadistico VALUES (default, 	90,		90.0,		90,			0);
INSERT INTO estadistico VALUES (default, 	90.21,	90.24,		90.18,		0.02);
INSERT INTO estadistico VALUES (default, 	89.91,	89.93,		89.88,		0.01);
/* 6 (150) IBC*/
INSERT INTO estadistico VALUES (default,  150,		150,			150, 		0.0);
INSERT INTO estadistico VALUES (default,  150.53,	150.55,		150.48,		0.02);
INSERT INTO estadistico VALUES (default,  150.42,	150.42,		150.39,		0.01);
/* 6(200) IBC*/
INSERT INTO estadistico VALUES (default,  200.6,	201,			200,	0.24);
INSERT INTO estadistico VALUES (default,  200.52,	200.54,		200.51,		0.01);
INSERT INTO estadistico VALUES (default,  200.55,	200.58,		200.52,		0.02);
/* 7(90) IBC*/
INSERT INTO estadistico VALUES (default, 	90,		90.0,		90,			0);
INSERT INTO estadistico VALUES (default, 	90.24,	90.18,		90.21,		0.02);
/* 7 (150) IBC*/
INSERT INTO estadistico VALUES (default,  150,		150,		150, 		0.0);
INSERT INTO estadistico VALUES (default,  150.3,	150.55,		150.48,		0.02);
/* 7(180) IBC*/
INSERT INTO estadistico VALUES (default,  180,		180,			180,	0.0);
INSERT INTO estadistico VALUES (default,  180.6,	180.62,		180.56,		0.01);



/* 8 (2) IBC--P1--P2*/
INSERT INTO estadistico VALUES (default,  2,	2,		2,			0.00);
INSERT INTO estadistico VALUES (default,  1.92,	1.94,	1.91,		0.01);
INSERT INTO estadistico VALUES (default,  1.99,	2.01,	1.98,		0.01);
/* 8 (-20) IBC--P1--P2*/
INSERT INTO estadistico VALUES (default,  20,		20,			20,			0.00);
INSERT INTO estadistico VALUES (default,  19.87,	19.88,		19.86,		0.00);
INSERT INTO estadistico VALUES (default,  19.96,	19.97,		19.95,		0.01);
/* 8 (40) IBC--P1--P2*/
INSERT INTO estadistico VALUES (default,  40,		40,			40,			0.0);
INSERT INTO estadistico VALUES (default,  39.84,	39.86,		39.84,		0.01);
INSERT INTO estadistico VALUES (default,  39.97,	39.98,		39.97,		0.01);
/* 8 (50) IBC*/
INSERT INTO estadistico VALUES (default,  59.9,		59.9,		59.9,		0.00);
INSERT INTO estadistico VALUES (default,  59.87,	59.86,		59.85,		0.01);
INSERT INTO estadistico VALUES (default,  60.04,	60.04,		60.03,		0.00);
/* 8 (75) IBC*/
INSERT INTO estadistico VALUES (default,  69.90,	69.9,		69.9,		0.00);
INSERT INTO estadistico VALUES (default,  69.88,	69.89,		69.86,		0.01);
INSERT INTO estadistico VALUES (default,  70.03,	70.06,		70.03,		0.01);
/* 8 (100) IBC*/
INSERT INTO estadistico VALUES (default,  100.2,	100.2,		100.2,		0.0);
INSERT INTO estadistico VALUES (default,  100.11,	100.15,		100.05,		0.02);
INSERT INTO estadistico VALUES (default,  100.28,	100.35,		100.17,		0.05);
/* 8 (-30) IBC*/
INSERT INTO estadistico VALUES (default,  150.4,	150.4,		150.4,		0.00);
INSERT INTO estadistico VALUES (default,  149.89,	150.12,		149.75,		0.07);
INSERT INTO estadistico VALUES (default,  150.17,	150.21,		150.12,		0.05);
/* 8 (200) IBC*/
INSERT INTO estadistico VALUES (default,  -20.16,	-20.10,		-20.20,		0.05);
INSERT INTO estadistico VALUES (default,  -20.18,	-20.17,		-20.19,		0.01);
INSERT INTO estadistico VALUES (default,  -19.84,	-19.81,		-19.87,		0.01);
/* 8(-80) IBC*/
INSERT INTO estadistico VALUES (default,  -10,		-10,		-10,		0);
INSERT INTO estadistico VALUES (default,  -9.97,	-9.91,		-9.98,		0.02);
INSERT INTO estadistico VALUES (default,  -9.91,	-9.85,		-9.94,		0.02);


/*rest est------------------------------cert_ID-----pun_id----est----estp1---estp2-----incert-------corr*/
INSERT INTO resumen_estadistico VALUES (	1,  	1,			1,		2,		3,		0.23,		-0.81);
INSERT INTO resumen_estadistico VALUES (	1,  	2,			4,		5,		6,		0.29,		-0.35);
INSERT INTO resumen_estadistico VALUES (	1,  	3,			7,		8,		9,		0.47,		-0.81);
INSERT INTO resumen_estadistico VALUES (	2,  	4,			10,		11,		14,		0.13,		-0.26);
INSERT INTO resumen_estadistico VALUES (	2,  	5,			13,		14,		15,		0.13,		-0.36);
INSERT INTO resumen_estadistico VALUES (	2,  	6,			16,		17,		18,		0.21,		-0.46);
INSERT INTO resumen_estadistico VALUES (	2,  	7,			19,		20,		21,		0.19,		-0.55);
INSERT INTO resumen_estadistico VALUES (	2,  	8,			22,		23,		24,		0.19,		-0.84);
INSERT INTO resumen_estadistico VALUES (	3,  	9,			25,		26,		27,		3.62,		-0.51);
INSERT INTO resumen_estadistico VALUES (	4,  	10,			28,		29,		30,		1.44,		0.25);
INSERT INTO resumen_estadistico VALUES (	4,  	11,			31,		32,		33,		1.46,		1.55);
INSERT INTO resumen_estadistico VALUES (	5,  	14,			34,		35,		36,		1.65,		0.24);
INSERT INTO resumen_estadistico VALUES (	5,  	13,			37,		38,		39,		0.79,		0.53);
INSERT INTO resumen_estadistico VALUES (	5,  	14,			40,		41,		42,		1.15,		0.51);
INSERT INTO resumen_estadistico VALUES (	6,  	15,			43,		44,		45,		1.46,		0.06);
INSERT INTO resumen_estadistico VALUES (	6,  	16,			46,		47,		48,		1.45,		0.47);
INSERT INTO resumen_estadistico VALUES (	6,  	17,			49,		50,		51,		1.45,		0.48);
INSERT INTO resumen_estadistico VALUES (	7,  	18,			52,		53,		54,		0.61,		0.21);
INSERT INTO resumen_estadistico VALUES (	7,  	19,			55,		56,		57,		0.6,		0.53);
INSERT INTO resumen_estadistico VALUES (	7,  	20,			58,		59,		60,		0.61,		0.6);
INSERT INTO resumen_estadistico VALUES (	8,  	21,			61,		62,		63,		0.10,		-0.04);
INSERT INTO resumen_estadistico VALUES (	8,  	22,			64,		65,		66,		0.12,		-0.08);
INSERT INTO resumen_estadistico VALUES (	8,  	23,			67,		68,		69,		0.11,		-0.09);
INSERT INTO resumen_estadistico VALUES (	8,  	24,			70,		71,		72,		0.11,		0.06);
INSERT INTO resumen_estadistico VALUES (	8,  	25,			73,		74,		75,		0.10,		0.06);
INSERT INTO resumen_estadistico VALUES (	8,  	26,			76,		77,		78,		0.18,		-0.01);
INSERT INTO resumen_estadistico VALUES (	8,  	27,			79,		80,		81,		0.24,		-0.37);
INSERT INTO resumen_estadistico VALUES (	8,  	28,			82,		83,		84,		0.07,		0.14);
INSERT INTO resumen_estadistico VALUES (	8,  	29,			85,		86,		87,		0.12,		0.06);


/*termometro-------------------cert_ID-----pun_id-------estp1---estp2.....unifex*/
INSERT INTO termometro VALUES (1,		  	1,			0.03,	0.06,		-0.28);
INSERT INTO termometro VALUES (1,		  	2,			0.06,	0.08,		-0.41);
INSERT INTO termometro VALUES (1,		  	3,			0.02,	0.05,		-0.10);
INSERT INTO termometro VALUES (4,		  	10,			0.29,	0.24,		-0.41);
INSERT INTO termometro VALUES (4,		  	11,			0.51,	0.51,		0.14);
INSERT INTO termometro VALUES (6,		  	15,			0.06,	0.06,		0.29);
INSERT INTO termometro VALUES (6,		  	16,			0.07,	0.04,		0.12);
INSERT INTO termometro VALUES (6,		  	17,			0.03,	0.06,		-0.03);
INSERT INTO termometro VALUES (7,		  	18,			0.06,	NULL,		0);
INSERT INTO termometro VALUES (7,		  	19,			0.07,	NULL,		0);
INSERT INTO termometro VALUES (7,		  	20,			0.06,	NULL,		0);


/*camara-------------------cert_ID-----pun_id----efcar-----inest-----efrad---------inohom*/
INSERT INTO camara VALUES (3,  			9,			0,		0.77,		0.42,		2.83);


/*bloque-----------------------cert_ID-----pun_id------uniax---unirad---est*/
INSERT INTO bloque VALUES (2,  4,	0.01,	0.07,	0.07);
INSERT INTO bloque VALUES (2,  5,	0.02,	0.04,	0.06);
INSERT INTO bloque VALUES (2,  6,	0.02,	0.22,	0.08);
INSERT INTO bloque VALUES (2,  7,	0.02,	0.18,	0.09);
INSERT INTO bloque VALUES (2,  8,	0.03,	0.32,	0.1);

/*estba-----------------cert_ID-----pun_id----estp-----incert----facor*/
INSERT INTO estba VALUES (5, 		14,		0.08,		0.17,		2);
INSERT INTO estba VALUES (5, 		13,		0.03,		0.06,		2);
INSERT INTO estba VALUES (5, 		14,		0.02,		0.05,		2);


/*zonba-----------------cert_ID-----pun_id--------nom---facor---inc---grad*/
INSERT INTO zonba VALUES (5, 		 14,		'P1',	2,		0.11,	0.10);
INSERT INTO zonba VALUES (5, 		 14,		'P2',	2,		0.21,	0.19);
INSERT INTO zonba VALUES (5, 		 14,		'P3',	2,		0.23,	0.20);
INSERT INTO zonba VALUES (5, 		 14,		'P4',	2,		0.04,	0.4);
INSERT INTO zonba VALUES (5, 		 14,		'P5',	2,		0.24,	0.21);
INSERT INTO zonba VALUES (5, 		 14,		'P6',	2,		0.10,	0.09);
INSERT INTO zonba VALUES (5, 		 14,		'P7',	2,		0.03,	0.03);
INSERT INTO zonba VALUES (5, 		 14,		'P8',	2,		0.3,	0.26);
INSERT INTO zonba VALUES (5, 		 14,		'P9',	2,		2.63,	2.28);
INSERT INTO zonba VALUES (5, 		 14,		'P10',	2,		0.57,	0.49);
INSERT INTO zonba VALUES (5, 		 14,		'P11',	2,		1.05,	0.91);
INSERT INTO zonba VALUES (5, 		 14,		'P14',	2,		1.51,	1.31);

INSERT INTO zonba VALUES (5, 		 13,		'P1',	2,		0.04,	0.03);
INSERT INTO zonba VALUES (5, 		 13,		'P2',	2,		0.09,	0.08);
INSERT INTO zonba VALUES (5, 		 13,		'P3',	2,		0.13,	0.11);
INSERT INTO zonba VALUES (5, 		 13,		'P4',	2,		0.14,	0.12;
INSERT INTO zonba VALUES (5, 		 13,		'P5',	2,		0.07,	-0.06);
INSERT INTO zonba VALUES (5, 		 13,		'P6',	2,		0.14,	-0.13);
INSERT INTO zonba VALUES (5, 		 13,		'P7',	2,		0.03,	0.02);
INSERT INTO zonba VALUES (5, 		 13,		'P8',	2,		0.00,	0.00);
INSERT INTO zonba VALUES (5, 		 13,		'P9',	2,		0.99,	-0.85);
INSERT INTO zonba VALUES (5, 		 13,		'P10',	2,		0.83,	-0.72);
INSERT INTO zonba VALUES (5, 		 13,		'P11',	2,		0.69,	-0.60);
INSERT INTO zonba VALUES (5, 		 13,		'P14',	2,		0.50,	-0.43);

INSERT INTO zonba VALUES (5, 		 14,		'P1',	2,		0.01,	-0.01);
INSERT INTO zonba VALUES (5, 		 14,		'P2',	2,		0.06,	0.05);
INSERT INTO zonba VALUES (5, 		 14,		'P3',	2,		0.12,	0.11);
INSERT INTO zonba VALUES (5, 		 14,		'P4',	2,		0.03,	0.02);
INSERT INTO zonba VALUES (5, 		 14,		'P5',	2,		0.03,	0.02);
INSERT INTO zonba VALUES (5, 		 14,		'P6',	2,		0.03,	0.02);
INSERT INTO zonba VALUES (5, 		 14,		'P7',	2,		0.03,	0.02);
INSERT INTO zonba VALUES (5, 		 14,		'P8',	2,		0.03,	0.02);
INSERT INTO zonba VALUES (5, 		 14,		'P9',	2,		1.3,	-1.12);
INSERT INTO zonba VALUES (5, 		 14,		'P10',	2,		0.93,	-0.80);
INSERT INTO zonba VALUES (5, 		 14,		'P11',	2,		1.19,	-1.03);
INSERT INTO zonba VALUES (5, 		 14,		'P12',	2,		1.11,	-0.96);