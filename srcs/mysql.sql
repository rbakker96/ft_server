/*Create database for wordpress website*/
CREATE DATABASE wordpress DEFAULT 

/*set charachter standard*/
CHARACTER SET utf8 COLLATE utf8_unicode_ci;

/*Create admin user with all permissions*/
GRANT ALL ON wordpress.* TO 'admin'@'localhost' IDENTIFIED BY 'admin';

/*Flush current database so the current MySQL version knows about these chages*/
FLUSH PRIVILEGES;
