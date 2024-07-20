FROM debian:bullseye

RUN apt update
RUN apt upgrade -y
RUN apt install -y vim wget unzip
RUN apt install -y mariadb-server
COPY ./entrypoint.sh /etc/
COPY ./query.txt /etc/
ENTRYPOINT ["/etc/entrypoint.sh"]
CMD ["/usr/sbin//mysqld", "--user=mysql"]
