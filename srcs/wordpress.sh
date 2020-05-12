service mysql start 
sudo -u rbakker -i wp core download --path=/var/www/html/wordpress
sudo -u rbakker -i wp config create --path=/var/www/html/wordpress --dbname=wordpress --dbuser=admin --dbpass=admin 
sudo -u rbakker -i wp core install --path=/var/www/html/wordpress --url=localhost --title="Rbakker ft_server project" --admin_name=admin --admin_password=admin --admin_email=bakker.roy@hotmail.com 
chmod 644 /var/www/html/wordpress/wp-config.php