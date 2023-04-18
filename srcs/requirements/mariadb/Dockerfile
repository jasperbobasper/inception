FROM debian:buster

# install mariadb
RUN apt-get update && apt install -y mariadb-server \
    mariadb-client 

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

EXPOSE 3306

# move config files
COPY conf/mdb.conf /etc/mysql/mariadb.conf.d/

# move sh script to root and grant permissions
COPY tools/entrypoint.sh  /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "sh" , "/usr/local/bin/entrypoint.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0"]