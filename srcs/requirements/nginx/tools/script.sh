#!/bin/bash
# openssl 
# req -x509 -nodes -out $CERTS -keyout /etc/nginx/ssl/inception.key -subj "/C #=FR/ST=IDF/L=Paris/O=42/OU=42/CN=hasserao.42.fr/UID=hasserao"

openssl req -x509 -nodes -out ${CERTS} -keyout ${CERTS_KEY} -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=${DOMAIN_NAME}/UID=${LOGIN42}"

echo "
server {
    listen 443 ssl;   
    server_name ${DOMAIN_NAME} localhost wwww.${DOMAIN_NAME};  
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_certificate ${CERTS};  
    ssl_certificate_key ${CERTS_KEY};

    root /var/www/html;  
    index index.php index.html index.htm;  
    location / {
		try_files \$uri \$uri/ =404;
	} 
    location ~\.php\$ {  
        include snippets/fastcgi-php.conf;
        fastcgi_pass ${FASTCGI_PASS};
    }
}
" > /etc/nginx/conf.d/default.conf


# sleep infinity 

nginx -g "daemon off;"