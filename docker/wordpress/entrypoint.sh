#!/bin/bash

WP_INSTALL_DIR=/var/www/html

wget https://wordpress.org/latest.zip
unzip latest.zip
service php7.4-fpm start;

if [ ! -f /var/www/html/wp-config.php ]; then
	sudo -u www-data wp core download --path=${WP_INSTALL_DIR} --locale=ja
	sudo -u www-data wp config create \
	    --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpassword=$MYSQL_ROOT_PASSWORD --dbhost=$WORDPRESS_DB_HOST \
	    --force --path=${WP_INSTALL_DIR}
		
fi

mv wordpress/* /var/www/html/

bash
