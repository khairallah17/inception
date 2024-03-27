#!/bin/bash

echo "⚙️ Configuring MARIADB"

sed -i 's/^bind-address\s*=.*/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start

echo "  CREATE DATABASE IF NOT EXISTS $DB_NAME ;
        CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS' ;
        GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;
        FLUSH PRIVILEGES;" > database.sql

mariadb < database.sql

kill `pidof mariadbd`

echo "🚀 Starting MARIADB..."

exec mariadbd