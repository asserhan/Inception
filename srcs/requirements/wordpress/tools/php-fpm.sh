#!bin/bash

sleep 8

if [ ! -e /var/www/wordpress/wp-config.php ]; then
    #create Wordpress configuration
    wp config create --allow-root --dbname=$SQL_DB --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'
    #install wordpress core
    wp core install --allow-root --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --path='/var/www/wordpress'
    wp user create --allow-root --role=author $AUTHOR_USER $AUTHOR_EMAIL --user_pass=$AUTHOR_PASSWORD --path='/var/www/wordpress'


fi
#start PHP-FPM service in the foreground
/usr/sbin/php-fpm7.3 -F