
/*auth - login*/
GRANT EXECUTE ON FUNCTION userExist TO 'auth'@'localhost';
GRANT EXECUTE ON FUNCTION authUser TO 'auth'@'localhost';
GRANT EXECUTE ON PROCEDURE getUser TO 'auth'@'localhost';
/* client signup*/
GRANT EXECUTE ON PROCEDURE createClient TO 'auth'@'localhost';
GRANT EXECUTE ON PROCEDURE createUser TO 'auth'@'localhost';
/* profile */
GRANT EXECUTE ON PROCEDURE updateUser TO 'main'@'localhost';
GRANT EXECUTE ON PROCEDURE getClient TO 'main'@'localhost';
GRANT EXECUTE ON PROCEDURE updateClient TO 'main'@'localhost';
/* client */
GRANT EXECUTE ON PROCEDURE getItems TO 'cliente'@'localhost';
GRANT EXECUTE ON PROCEDURE getItemsClient TO 'cliente'@'localhost';
GRANT EXECUTE ON PROCEDURE createItem TO 'cliente'@'localhost';
GRANT EXECUTE ON PROCEDURE createItemClient TO 'cliente'@'localhost';
GRANT EXECUTE ON PROCEDURE updateItem TO 'cliente'@'localhost';
GRANT EXECUTE ON PROCEDURE updateItemClient TO 'cliente'@'localhost';
/*show grants for'auth'@'localhost';*/

FLUSH PRIVILEGES;