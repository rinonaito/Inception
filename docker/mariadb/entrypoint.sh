#!/bin/bash

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
mysqld &
sleep 5

# execute query and create database
mysql -u root -p ${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE ${MYSQL_DATABASE}; CREATE USER ${MYSQL_USER}'@'%' IDENTIFIED BY ${MYSQL_PASSWOR}; GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO ${MYSQL_USER}@'%'; FLUSH PRIVILEGES;"

exec "$@"
