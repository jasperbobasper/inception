FROM debian:buster

# install mariadb
RUN apt-get update && apt install -y mariadb-server \
    mariadb-client net-tools sudo

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

# move config files
COPY conf/my.cnf /etc/mysql/mariadb.conf.d/

# move sh script to root and grant permissions
COPY tools/entrypoint.sh  /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh"]

CMD ["mysqld"]