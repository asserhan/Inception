#!/bin/bash

sleep 10

# Install WordPress-CLI if not already installed
if ! wp --allow-root --version; then
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
fi

# if [ ! -e /var/www/wordpress/wp-config.php ]; then
wp config create --allow-root --dbname=$SQL_DB --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/html'

wp core install --allow-root --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --path='/var/www/html'

# # Create WordPress author user
wp user create --allow-root --role=author $AUTHOR_USER $AUTHOR_EMAIL --user_pass=$AUTHOR_PASSWORD --path='/var/www/html'
# fi

# Ensure the /run/php directory exists
if [ ! -d /run/php ]; then
    mkdir -p /run/php
fi

# Start PHP-FPM 7.4 service in the foreground
php-fpm7.4 -F
