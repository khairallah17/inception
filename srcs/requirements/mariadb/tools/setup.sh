#!/bin/bash

echo "⚙️ Configuring MARIADB"

sed -i '28s/^\(bind-address\s*=\s*\).*$/\10.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start

echo "  CREATE DATABASE IF NOT EXISTS $DB_NAME ;
        CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS' ;
        GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;
        ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;
        FLUSH PRIVILEGES;" > database.sql

mariadb < database.sql

kill `pidof mariadbd`

echo "🚀 Starting MARIADB..."

exec mariadbd