FROM debian:bullseye

RUN apt update
RUN apt upgrade -y
RUN apt install -y vim wget unzip
RUN apt install -y sudo
RUN apt install -y php7.4-fpm php7.4-mysqli php7.4-gd php7.4-curl php7.4-xml php7.4-mbstring php7.4-zip
RUN set -eux; \
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
	php wp-cli.phar --info; \
	chmod +x wp-cli.phar; \
	mv wp-cli.phar /usr/local/bin/wp; \
	wp --allow-root --version;
COPY ./tools/entrypoint.sh /etc/
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

ENTRYPOINT ["/etc/entrypoint.sh"]
CMD ["/usr/sbin/php-fpm7.4", "--nodaemonize", "--fpm-config", "/etc/php/7.4/fpm/php-fpm.conf"]
