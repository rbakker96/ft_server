# pull basic image 
FROM debian:buster 


# author
MAINTAINER rbakker ft_server project


# update software packages
RUN		apt-get update
RUN		apt-get upgrade -y 
RUN		apt-get -y install wget
# install Nginx web server
RUN		apt-get -y install nginx 
# install mysql
RUN		apt-get -y install mariadb-server
# install PhP
RUN		apt-get -y install php7.3 php-mysql php-fpm php-cli php-mbstring
# install sudo
RUN		apt-get -y install sudo
# install sendmail
RUN		apt-get -y install sendmail 


# nginx config
COPY	srcs/nginx.conf /etc/nginx/sites-available/localhost
RUN		ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
# copy ssl certificates to web server
COPY	srcs/localhost.cert /ect/ssl/certs/
COPY	srcs/localhost.key /ect/ssl/certs/


# install phpMyAdmin
RUN		mkdir -p /var/www/html/wordpress
RUN		chmod 777 /var/www/html/wordpress
RUN		mkdir -p /var/www/html/wordpress/phpmyadmin
RUN 	wget -c https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN		tar -xzvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN		mv -v phpMyAdmin-4.9.0.1-all-languages/* /var/www/html/wordpress/phpmyadmin
RUN		rm -rf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN		rm -rf phpMyAdmin-4.9.0.1-all-languages
RUN		chmod -R 755 /var/www/html/wordpress/phpmyadmin
# create mysql database
COPY	srcs/mysql.sh /tmp 
RUN		/bin/bash /tmp/mysql.sh
# php config 
RUN		mkdir -p /var/www/html/wordpress/phpmyadmin/tmp
RUN		chmod 777 /var/www/html/wordpress/phpmyadmin/tmp
COPY 	srcs/config.inc.php /var/www/html/wordpress/phpmyadmin
COPY	srcs/php.ini /etc/php/7.3/fpm/php.ini 


# install Wordpress client
RUN		chmod -R 755 /var/run/mysqld
RUN 	wget -c https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod 755 wp-cli.phar
RUN		mv wp-cli.phar /usr/local/bin/wp
RUN 	wp cli update
# create sudo user to preform wp commands
RUN		adduser --disabled-password --gecos "" rbakker
RUN 	sudo adduser rbakker sudo
# install wordpress on container
COPY	srcs/wordpress.sh /tmp
RUN		/bin/bash /tmp/wordpress.sh
# change ownership files
RUN		chown -R www-data:www-data /var/www/html/*


# open accecs poorts
EXPOSE	80 443


# start web-server
COPY	srcs/start.sh /tmp 
CMD		/bin/bash /tmp/start.sh