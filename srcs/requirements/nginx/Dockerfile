FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install nginx openssl vim

COPY ./conf/nginx.conf /etc/nginx/sites-available/default
COPY ./tools/setup.sh /

RUN chmod +x ./setup.sh

EXPOSE 443

CMD ["./setup.sh"]