#!/bin/bash
cd /var/www/html/
# Wait for services to be ready
sleep 15

# Set ownership and permissions for WordPress files
chown -R www-data:www-data /var/www/html
find /var/www/html -type d -exec chmod 755 {} \;
find /var/www/html -type f -exec chmod 644 {} \;

# Install WP-CLI if not installed
if ! wp --allow-root --version; then
    echo "WP-CLI not found. Installing WP-CLI..."
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    echo "WP-CLI installed successfully."
else
    echo "WP-CLI is already installed."
fi

# Download WordPress core if not already downloaded
if [ ! -d /var/www/html/wp-admin ]; then
    echo "Downloading WordPress..."
    wp core download --allow-root --path='/var/www/html'
fi


if [ ! -d /run/php ]; then
    mkdir -p /run/php
    chown -R www-data:www-data /run/php
fi

if [ ! -e /var/www/html/wp-config.php ]; then
    echo "Creating wp-config.php and installing WordPress..."
    wp config create --allow-root \
        --dbname="$SQL_DB" \
        --dbuser="$SQL_USER" \
        --dbpass="$SQL_PASSWORD" \
        --dbhost="mariadb" \
        --path='/var/www/html' \
    

    wp core install --allow-root \
        --url="$DOMAIN_NAME" \
        --title="$SITE_TITLE" \
        --admin_user="$ADMIN_USER" \
        --admin_password="$ADMIN_PASSWORD" \
        --admin_email="$ADMIN_EMAIL" \
        --path='/var/www/html' \
        --skip-email \
       

    wp user create --allow-root \
        --role=author \
        "$AUTHOR_USER" \
        "$AUTHOR_EMAIL" \
        --user_pass="$AUTHOR_PASSWORD" \
        --path='/var/www/html' \
         --skip-email 
        
fi
php-fpm7.4 -F
