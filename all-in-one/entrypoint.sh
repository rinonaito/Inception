service nginx start;
service php7.4-fpm restart;
service mariadb start;
exec sleep infinity;
