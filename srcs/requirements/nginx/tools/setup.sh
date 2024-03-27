#!/bin/bash

echo "⚙️ Configuring Nginx with TLSv1.3"

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=OM/L=KH/O=133/OU=student/CN=$DOMAIN"

echo "<h1>HELLO NGINX</h1>" > /var/www/html/index.html

echo "🚀 Starting Nginx server..."

nginx -g "daemon off;"