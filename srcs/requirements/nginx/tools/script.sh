

openssl req -x509 -nodes -out $CERTS -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=hasserao.42.fr/UID=hasserao"


nginx -g "daemon off;"