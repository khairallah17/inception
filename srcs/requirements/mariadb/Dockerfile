FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y mariadb-server

COPY ./tools/setup.sh /

RUN chmod +x ./setup.sh

EXPOSE 3306

CMD ["./setup.sh"]