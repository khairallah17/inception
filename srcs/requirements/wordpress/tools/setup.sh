#!/bin/bash

echo "⚙️ Configuring Wordpress with PHP-FPM"

mkdir -p /var/www/html
cd /var/www/html
rm -rf *

curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x /usr/local/bin/wp

sleep 7

wp core download --allow-root
wp core config --allow-root --dbhost=${DB_HOST} --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS}
wp core install --allow-root --url=${DOMAIN} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASS} --title=${WP_TITLE} --admin_email=${WP_ADMIN_EMAIL} --skip-email
wp user create --allow-root ${WP_USER} ${WP_USER_EMAIL} --role=${WP_ROLE} --user_pass=${WP_USER_PASS}

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
mkdir /run/php

echo "🚀 Starting Wordpress..."

exec php-fpm7.4 -F