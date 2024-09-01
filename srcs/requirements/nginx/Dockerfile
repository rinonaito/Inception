FROM debian:bullseye

RUN apt update
RUN apt upgrade -y
RUN apt install -y vim wget unzip
RUN apt install -y nginx
COPY ./tools/entrypoint.sh /etc/
ENTRYPOINT ["/etc/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
