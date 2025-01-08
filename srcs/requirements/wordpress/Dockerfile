FROM debian:buster

RUN apt-get update && apt-get install -y wget \
    php7.3 \
    php-fpm \
    php-mysql 

RUN wget https://wordpress.org/latest.tar.gz -P /var/www \
    && tar -xvf /var/www/latest.tar.gz -C /var/www \
    && rm /var/www/latest.tar.gz


COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN chown -R root:root /var/www/wordpress


COPY ./tools/php-fpm.sh /php-fpm.sh

RUN chmod +x /php-fpm.sh


ENTRYPOINT ["/php-fpm.sh"]