FROM debian:buster

#Install required packages
RUN apt-get update && apt-get install -y\
    nginx \ 
    openssl \

#Create SSL dir
RUN mkdir -p /etc/nginx/ssl \

#Genarate SSL Certificate
RUN openssl req -x509 -nodes \
    -out /etc/nginx/ssh/inception.crt \
    -keyout /etc/nginx/ssh/inception.key \
    -subj "/CN=hasserao.42.fr"

#Create config dir
RUN mkdir -p /var/run/nginx

#Copy our conf to default container conf
COPY conf/nginx.conf /etc/nginx/nginx.conf
