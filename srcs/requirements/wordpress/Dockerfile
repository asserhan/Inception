FROM debian:bullseye

RUN apt-get update && apt-get install -y wget curl  \
php7.4 php7.4-cli php7.4-curl php7.4-fpm php7.4-mysqli php7.4-json php7.4-phar php7.4-iconv \
    mariadb-client


RUN mkdir -p  /var/www/html
RUN chown -R www-data:www-data /var/www/html 
RUN  chmod -R 755 /var/www/html  
RUN wget https://wordpress.org/latest.tar.gz -P /var/www/html \
    && tar -xvf /var/www/html/latest.tar.gz -C /var/www/html \
    && rm /var/www/html/latest.tar.gz

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf



COPY ./tools/php-fpm.sh /php-fpm.sh

RUN chmod +x /php-fpm.sh

ENTRYPOINT ["/php-fpm.sh"]
