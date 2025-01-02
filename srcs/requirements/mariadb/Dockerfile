FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/script.sh /
RUN chmod +x /script.sh

#Copy the script to the container


#Expose the port
EXPOSE 3306

#Run the script
CMD ["/script.sh"]
