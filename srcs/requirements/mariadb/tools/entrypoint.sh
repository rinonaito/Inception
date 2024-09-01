#!/bin/bash

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
	echo "inside of the biggest if";

	# add mysql-group if NOT exist
	if ! getent group mysql; then
	  groupadd -r mysql
	fi
	
	# add mysql-user if NOT exist
	if ! getent passwd mysql; then
	  useradd -r -g mysql mysql
	fi
	
	# set user:group as a owner of the data directory
	chown -R mysql:mysql /var/lib/mysql
	
	# make /run/mysqld directory if NOT exist
	if [ ! -d "/run/mysqld" ]; then
	  mkdir -p /run/mysqld
	fi
	
	# set user:group as a owner of the socket directory
	chown -R mysql:mysql /run/mysqld
	
	if [ ! -d "/var/lib/mysql/mysql" ]; then
	  mysql_install_db --user=mysql
	fi
	
	# execute mysqld in background so as to go forward
	cat <<EOF > /etc/query.txt
USE mysql;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_ROOT_USER}'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF

	mysqld --user=mysql --bootstrap < /bin/cat < /etc/query.txt
fi

exec "$@"
