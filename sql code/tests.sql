call getUser(1);
select login('juan','pamblo');

CALL login('juan','pablo');
select "hola";
select * from item_cliente;
select * from item;
select * from usuario;
delete from usuario where Usu_id <10;
select * from cliente;

SELECT proyectocs.userExist('6');
select proyectocs.authUser('6', '6');
drop table if exists test;
CREATE TABLE test
(
	id		INT			NOT NULL	AUTO_INCREMENT,
	camp	INT			NOT NULL,
	camp2	VARCHAR(50)	NOT NULL,
	PRIMARY KEY(id)
) ENGINE=InnoDB;
select * from test;
insert into test values (default, '3','hola');


INSERT INTO cliente VALUES('800.194.600-3','AGROSAVIA','Auxiliar de venta','2462544','2462544','AGROSAVIA@gmail.com','Bogotá','Km 14 vía Mosquera - Bogotá','4c15');



