service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root;
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'localhost' IDENTIFIED BY 'admin';" | mysql -u root;
echo "FLUSH PRIVILEGES;" | mysql -u root;