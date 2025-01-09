#!/bin/bash

mysqld_safe &
sleep 5

mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`$SQL_DB\`;"
mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';"
mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON \`$SQL_DB\`.* TO '$SQL_USER'@'%';"
mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';"
mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p"$SQL_ROOT_PASSWORD" shutdown
mysqld_safe