#!/bin/bash


#start mysql
service mysql start

# Create a new database
mysql -e "CREATE DATABASE IF NOT EXISTS \ `${SQL_DB}\ `;"

# Create a new user
mysql -e "CREATE USER IF NOT EXISTS \ `${SQL_USER}\ `@'localhost' IDENTIFIED BY '${SQL_PASS}';"

# Grant privileges to the user
mysql -e "GANT ALL PRIVILEGES ON \ `${SQL_DB}\ `.* TO \ `${SQL_USER}\ `@'%' IDENTIFIED BY '${SQL_PASS}';"

# change the password of the root user
mysql -e "ALTER USER 'root '@'localhost' IDENTIFIED BY '${SQL_ROOT_PASS}';"

# Flush privileges It ensures that any changes made to user accounts take effect immediately without requiring a server restart.
mysql -e "FLUSH PRIVILEGES;"

#restart mysql
mysqladmin -u root -p${SQL_ROOT_PASS} shutdown

#start mysql
mysqld_safe