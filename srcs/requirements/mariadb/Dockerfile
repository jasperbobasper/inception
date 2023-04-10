FROM debian:buster

RUN apt-get update && apt install -y mariadb-server

COPY conf/mdb.my.conf /etc/mysql/mariadb.conf.d/
COPY tools/test.sh  /usr/local/bin/
RUN chmod +x /usr/local/bin/test.sh
# COPY tools/init_db.sql /var/www/

# RUN chmod +x /var/www/init_db.sql
# RUN service mysql start && mysql < /var/www/init_db.sql 

# CMD ["mariadb"]
ENTRYPOINT [ "sh", "/usr/local/bin/test.sh" ]