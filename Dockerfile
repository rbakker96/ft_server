# pull basic image 
FROM debian:buster 

# author
MAINTAINER rbakker ft_server project

# update software packages
RUN		apt-get update
RUN		apt-get upgrade -y 
RUN		apt-get -y install wget

# install & config Nginx web server
RUN		apt-get -y install nginx 
COPY	srcs/nginx.conf /etc/nginx/sites-available/localhost
RUN		ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

# copy ssl certificates to web server
COPY	srcs/localhost.cert /ect/ssl/certs/
COPY	srcs/localhost.key /ect/ssl/certs/

# install mysql
RUN		apt-get -y install mariadb-server

# install PhP
RUN		apt-get -y install php7.3 php-mysql php-fpm php-cli php-mbstring

# install phpMyAdmin
RUN		mkdir -p /var/www/html/phpmyadmin
RUN 	wget -c https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN		tar -xzvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN		mv -v phpMyAdmin-4.9.0.1-all-languages /var/www/html/phpmyadmin
RUN		rm -rf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN		chmod -R 755 /var/www/html/phpmyadmin

# create mysql database
COPY	srcs/mysql.sh /tmp 
RUN		/bin/bash tmp/mysql.sh

# php config 

# install Wordpress


# install sendmail
# RUN apt-get -y install sendmail 

EXPOSE	80 443

# start web-server
COPY	srcs/start.sh /tmp 
CMD		/bin/bash tmp/start.sh