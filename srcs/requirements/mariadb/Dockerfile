FROM debian:bullseye

RUN apt update
RUN apt upgrade -y
RUN apt install -y vim wget unzip
RUN apt install -y mariadb-server
COPY ./tools/entrypoint.sh /etc/
COPY ./tools/query.txt /etc/
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
ENTRYPOINT ["/etc/entrypoint.sh"]
CMD ["/usr/sbin//mysqld", "--user=mysql"]
