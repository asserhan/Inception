FROM debian:bullseye


RUN apt-get update && apt-get install -y \
    nginx \ 
    openssl 

RUN mkdir -p /etc/nginx/ssl

# COPY ./tools/script.sh /
# RUN chmod +x /script.sh

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=hasserao.42.fr/UID=hasserao"


COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html


CMD ["nginx", "-g", "daemon off;"]