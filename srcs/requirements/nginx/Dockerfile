FROM debian:buster

#Install required packages
RUN apt-get update && apt-get install -y \
    nginx \ 
    openssl 
#Create SSL dir
RUN mkdir -p /etc/nginx/ssl

#Genarate SSL Certificate
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=hasserao.42.fr/UID=hasserao"


#Create config dir
RUN mkdir -p /var/run/nginx

#Copy our conf to default container conf
COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Start NGINX when the container is launched
CMD ["nginx", "-g", "daemon off;"]