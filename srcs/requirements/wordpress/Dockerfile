FROM debian:buster

RUN apt-get update && apt-get install -y wget \
    php \
    php-fpm \
    php-mysql 

RUN wget https://wordpress.org/latest.tar.gz -P /var/www