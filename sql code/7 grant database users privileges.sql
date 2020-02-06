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
GRANT EXECUTE ON PROCEDURE getItem TO 'cliente'@'localhost';
GRANT EXECUTE ON PROCEDURE getItems TO 'cliente'@'localhost';
GRANT EXECUTE ON PROCEDURE getItemClient TO 'cliente'@'localhost'; -- 2
GRANT EXECUTE ON PROCEDURE getItemsClient TO 'cliente'@'localhost';
GRANT EXECUTE ON PROCEDURE createItem TO 'cliente'@'localhost';
GRANT EXECUTE ON PROCEDURE createItemClient TO 'cliente'@'localhost';
GRANT EXECUTE ON PROCEDURE updateItem TO 'cliente'@'localhost';
GRANT EXECUTE ON PROCEDURE updateItemClient TO 'cliente'@'localhost';
GRANT EXECUTE ON PROCEDURE deleteItem TO 'cliente'@'localhost';
GRANT EXECUTE ON PROCEDURE deleteItemClient TO 'cliente'@'localhost';
-- GRANT EXECUTE ON PROCEDURE deleteItemsClient TO 'cliente'@'localhost';

GRANT EXECUTE ON PROCEDURE getClientPurchaseOrders TO 'cliente'@'localhost';

GRANT EXECUTE ON PROCEDURE getUser TO 'cliente'@'localhost';

/* advisor */

GRANT EXECUTE ON PROCEDURE getClient TO 'asesor'@'localhost';
GRANT EXECUTE ON PROCEDURE getAdvisorPurchaseOrders TO 'asesor'@'localhost';

FLUSH PRIVILEGES;