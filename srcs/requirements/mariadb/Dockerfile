FROM Debian:11

RUN apt-get update && apt-get upgrade && apt install -y mariadb-server

COPY ./conf/srv.conf /etc/mysql/mariadb.conf.d/
COPY ./tools /var/www/

RUN service mysql start && /var/www/init_db.sql && rm -f /var/www/init_db.sql;

CMD ["mysqld"]