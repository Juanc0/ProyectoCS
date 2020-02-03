
-- CREACIÓN USUARIOS
-- Creación de usuarios 
DROP USER if exists 'auth'@'localhost';
DROP USER if exists 'main'@'localhost';
DROP USER if exists 'profile'@'localhost';

DROP USER if exists 'cliente'@'localhost';
DROP USER if exists 'asesor'@'localhost';
DROP USER if exists 'laboratorista'@'localhost';
DROP USER if exists 'metrologo'@'localhost';
DROP USER if exists 'gerente'@'localhost';
DROP USER if exists 'su'@'localhost';

/*DROP USER if exists 'AlejandraL'@'localhost';
DROP USER if exists 'ClaudiaM'@'localhost';
DROP USER if exists 'CreacioneSuministros'@'localhost';
DROP USER if exists 'Agrosavia'@'localhost';
DROP USER if exists 'JhonFredyM'@'localhost';
DROP USER if exists 'gerente'@'localhost';
DROP USER if exists 'Calibrationservice'@'localhost';
DROP USER if exists '4Karnes'@'localhost';*/

CREATE USER 'auth'@'localhost' IDENTIFIED BY 'authPassword';
CREATE USER 'main'@'localhost' IDENTIFIED BY 'mainPassword';
CREATE USER 'profile'@'localhost' IDENTIFIED BY 'profilePassword';

CREATE USER 'cliente'@'localhost' IDENTIFIED BY 'clientePassword';
CREATE USER 'asesor'@'localhost' IDENTIFIED BY 'asesorPassword';
CREATE USER 'laboratorista'@'localhost' IDENTIFIED BY 'laboratoristaPassword';
CREATE USER 'metrologo'@'localhost' IDENTIFIED BY 'metrologoPassword';
CREATE USER 'gerente'@'localhost' IDENTIFIED BY 'gerentePassword';
CREATE USER 'su'@'localhost' IDENTIFIED BY 'suPassword';


/*CREATE USER 'AlejandraL'@'localhost' IDENTIFIED BY 'dcomercial111';
CREATE USER 'ClaudiaM'@'localhost' IDENTIFIED BY 'lab112';
CREATE USER 'Agrosavia'@'localhost' IDENTIFIED BY 'cli211';
CREATE USER 'CreacioneSuministros'@'localhost' IDENTIFIED BY 'cli212';
CREATE USER 'JhonFredyM'@'localhost' IDENTIFIED BY 'lab113';
CREATE USER 'gerente'@'localhost' IDENTIFIED BY 'gerent114';
CREATE USER 'Calibrationservice'@'localhost' IDENTIFIED BY 'cli213';
CREATE USER '4Karnes'@'localhost' IDENTIFIED BY 'cli214';*/

-- Asignación de permisos a los usuarios

-- GRANT SELECT ON proyectocs.usuario TO 'auth'@'localhost';
/*GRANT ALL PRIVILEGES ON proyectocs.cliente TO 'gerente'@'localhost';
GRANT ALL PRIVILEGES ON proyectocs.asesor TO 'gerente'@'localhost';
GRANT ALL PRIVILEGES ON proyectocs.laboratorista TO 'gerente'@'localhost';
GRANT SELECT ON proyectocs.certificado TO 'gerente'@'localhost';

GRANT ALL PRIVILEGES ON proyectocs.item TO 'AlejandraL'@'localhost';
GRANT ALL PRIVILEGES ON proyectocs.item_cliente TO 'AlejandraL'@'localhost';
GRANT ALL PRIVILEGES ON proyectocs.item TO 'AlejandraL'@'localhost';
GRANT ALL PRIVILEGES ON proyectocs.item TO 'AlejandraL'@'localhost';
GRANT INSERT ON proyectocs.cliente TO 'AlejandraL'@'localhost';
GRANT UPDATE ON proyectocs.cliente TO 'AlejandraL'@'localhost';
GRANT INSERT ON proyectocs.orden_compra_asesor TO 'AlejandraL'@'localhost';
GRANT UPDATE ON proyectocs.orden_compra_asesor TO 'AlejandraL'@'localhost';
GRANT SELECT ON proyectocs.certificado TO 'AlejandraL'@'localhost';

GRANT UPDATE ON proyectocs.cliente TO 'Agrosavia'@'localhost';
GRANT UPDATE ON proyectocs.cliente TO 'CreacioneSuministros'@'localhost';
GRANT UPDATE ON proyectocs.cliente TO  'Calibrationservice'@'localhost';
GRANT UPDATE ON proyectocs.cliente TO  '4Karnes'@'localhost';

GRANT INSERT ON proyectocs.certificado TO 'ClaudiaM'@'localhost';
GRANT UPDATE ON proyectocs.trazabilidad  TO 'ClaudiaM'@'localhost';
GRANT UPDATE ON proyectocs.resumen_estadistico TO 'ClaudiaM'@'localhost';
GRANT UPDATE ON proyectocs.certificado TO 'ClaudiaM'@'localhost';
GRANT UPDATE ON proyectocs.humedad TO 'ClaudiaM'@'localhost';
GRANT UPDATE ON proyectocs.termhighum TO 'ClaudiaM'@'localhost';
GRANT UPDATE ON proyectocs.camhum TO 'ClaudiaM'@'localhost';
GRANT UPDATE ON proyectocs.temperatura TO 'ClaudiaM'@'localhost';
GRANT UPDATE ON proyectocs.termhigtem TO 'ClaudiaM'@'localhost';
GRANT UPDATE ON proyectocs.camtem TO 'ClaudiaM'@'localhost';
GRANT UPDATE ON proyectocs.estBa TO 'ClaudiaM'@'localhost';
GRANT UPDATE ON proyectocs.zonaBa TO 'ClaudiaM'@'localhost';
GRANT UPDATE ON proyectocs.bloque TO 'ClaudiaM'@'localhost';
GRANT UPDATE ON proyectocs.vidrio TO 'ClaudiaM'@'localhost';
GRANT UPDATE ON proyectocs.analogo TO 'ClaudiaM'@'localhost';
GRANT UPDATE ON proyectocs.digital TO 'ClaudiaM'@'localhost';


GRANT UPDATE ON proyectocs.trazabilidad  TO 'JhonFredyM'@'localhost';
GRANT UPDATE ON proyectocs.resumen_estadistico TO 'JhonFredyM'@'localhost';
GRANT UPDATE ON proyectocs.certificado TO 'JhonFredyM'@'localhost';
GRANT UPDATE ON proyectocs.humedad TO 'JhonFredyM'@'localhost';
GRANT UPDATE ON proyectocs.termhighum TO 'JhonFredyM'@'localhost';
GRANT UPDATE ON proyectocs.camhum TO 'JhonFredyM'@'localhost';
GRANT UPDATE ON proyectocs.temperatura TO 'JhonFredyM'@'localhost';
GRANT UPDATE ON proyectocs.termhigtem TO 'JhonFredyM'@'localhost';
GRANT UPDATE ON proyectocs.camtem TO 'JhonFredyM'@'localhost';
GRANT UPDATE ON proyectocs.estBa TO 'JhonFredyM'@'localhost';
GRANT UPDATE ON proyectocs.zonaBa TO 'JhonFredyM'@'localhost';
GRANT UPDATE ON proyectocs.bloque TO 'JhonFredyM'@'localhost';
GRANT UPDATE ON proyectocs.vidrio TO 'JhonFredyM'@'localhost';
GRANT UPDATE ON proyectocs.analogo TO 'JhonFredyM'@'localhost';
GRANT UPDATE ON proyectocs.digital TO 'JhonFredyM'@'localhost';

FLUSH PRIVILEGES;*/