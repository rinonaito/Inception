FROM debian:bullseye

RUN apt update
RUN apt upgrade
RUN apt install -y vim wget unzip
RUN apt install -y nginx
RUN apt install -y php7.4-fpm php7.4-mysqli php7.4-gd php7.4-curl php7.4-xml php7.4-mbstring php7.4-zip
RUN apt install -y mariadb-server
COPY entrypoint.sh /etc/
COPY ./default /etc/nginx/site-available/default
ENTRYPOINT ["/etc/entrypoint.sh"]
