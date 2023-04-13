FROM debian:buster

# install mariadb
RUN apt-get update && apt install -y mariadb-server

# move config files
COPY conf/mdb.conf /etc/mysql/mariadb.conf.d/

# move sh script to root and grant permissions
COPY tools/entrypoint.sh  /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "sh" , "/usr/local/bin/entrypoint.sh"]