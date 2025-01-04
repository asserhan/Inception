FROM debian:buster

RUN apt-get update && apt-get install -y wget \
    php \
    php-fpm \
    php-mysql 

RUN wget https://wordpress.org/latest.tar.gz -P /var/www \
    && tar -xvf /var/www/latest.tar.gz -C /var/www \
    && rm /var/www/latest.tar.gz

#change the ownership of the files to the root user

RUN chown -R root:root /var/www/wordpress

COPY ./conf/wwww.conf /etc/php/fpm/pool.d/www.conf