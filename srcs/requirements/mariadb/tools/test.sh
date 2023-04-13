#!/bin/sh

export MARIADB_DATABASE
export MARIADB_USER
export MARIADB_PASSWORD
export MARIADB_ROOT_PASSWORD

echo "${MARIADB_DATABASE}! GET UR DATABASE HERE"

# if [ ! -d "/home/data/database/${MARIADB_DATABASE}" ]; then

#     echo "Creating database '${MARIADB_DATABASE}'..."

#     # start MariaDB
#     service mysql start

#     # changing MariaDB configuration using root user
#     # creating new database with name specified in .env
#     # creating new user with name and password specified in .env
#     # granting the new user all database privileges
#     # locking the root user to password specified in .env
#     # flushing for the privileges to take effect
#     mysql -u root << EOF
#     CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};
#     CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';
#     GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%' WITH GRANT OPTION;
#     ALTER USER 'root'@'localhost'   IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';
#     FLUSH PRIVILEGES;
# EOF

#     # stopping MariaDB for configuration changes to take effect
#     service mysql stop

#     echo "Database '${MARIADB_DATABASE}' created."

# else

#     echo "Database '${MARIADB_DATABASE}' already exists."

# fi

# # running MariaDB through MySQL daemon using the mysql user
#  service mysql start