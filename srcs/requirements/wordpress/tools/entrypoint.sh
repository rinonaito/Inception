#!/bin/bash

WP_INSTALL_DIR=/var/www/html/

wget https://wordpress.org/latest.zip
unzip latest.zip
service php7.4-fpm start;

if [ ! -f /var/www/html/wp-config.php ]; then

	# add root user in www-data group
	sudo usermod -aG www-data root

	# change owner of the /var/www/html directory
	sudo chown -R www-data:www-data /var/www/html

	# chenge mode of the /var/www/html directory
	sudo chmod -R 755 /var/www/html	

	# download wordpress files to the /var/www/html directory
	wp core download --path=${WP_INSTALL_DIR} --locale=ja --debug --allow-root

	# command "wp config create" only works here
	cd ${WP_INSTALL_DIR}

	# create wp-config.php if parameter is correct
	sudo -u www-data wp --debug config create \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--dbhost=$WORDPRESS_DB_HOST \
		--force \
		--path=${WP_INSTALL_DIR}

	sudo -u www-data wp --debug core install \
		--path=${WP_INSTALL_DIR} \
		--url="localhost" \
		--title=$WP_TITLE \
		--admin_user=$ADMIN_USER \
		--admin_password=$ADMIN_PASSWORD \
		--admin_email=$ADMIN_EMAIL
#		--url=$DOMAIN_NAME \

fi

bash
