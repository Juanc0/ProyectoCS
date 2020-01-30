
/*auth - login*/
GRANT EXECUTE ON PROCEDURE checkUser TO 'auth'@'localhost';
GRANT EXECUTE ON PROCEDURE getUser TO 'auth'@'localhost';
/*auth - client signup*/
GRANT EXECUTE ON PROCEDURE createClient TO 'auth'@'localhost';
GRANT EXECUTE ON PROCEDURE getClientId TO 'auth'@'localhost';
GRANT EXECUTE ON PROCEDURE createClientUser TO 'auth'@'localhost';
/* profile */
GRANT EXECUTE ON PROCEDURE updateUser TO 'profile'@'localhost';
GRANT EXECUTE ON PROCEDURE getClient TO 'profile'@'localhost';
GRANT EXECUTE ON PROCEDURE updateClient TO 'profile'@'localhost';
/* main */
GRANT EXECUTE ON PROCEDURE getItems TO 'main'@'localhost';
GRANT EXECUTE ON PROCEDURE createItem TO 'main'@'localhost';
/*show grants for'auth'@'localhost';*/



FLUSH PRIVILEGES;