FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y php-fpm php-mysql curl mariadb-client

COPY ./tools/setup.sh /

RUN chmod +x ./setup.sh



CMD ["./setup.sh"]