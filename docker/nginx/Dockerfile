FROM debian:bullseye

RUN apt update
RUN apt upgrade
RUN apt install -y vim wget unzip
RUN apt install -y nginx
COPY ./entrypoint.sh /etc/
ENTRYPOINT ["/etc/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
