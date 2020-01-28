
/*auth - login*/
GRANT EXECUTE ON PROCEDURE checkUser TO 'auth'@'localhost';
GRANT EXECUTE ON PROCEDURE getUser TO 'auth'@'localhost';
/*auth - client signup*/
GRANT EXECUTE ON PROCEDURE createClientUser TO 'auth'@'localhost';
GRANT EXECUTE ON PROCEDURE createClient TO 'auth'@'localhost';
/*auth - check*/
/*show grants for'auth'@'localhost';*/