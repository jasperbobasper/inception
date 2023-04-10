#!/bin/sh

if [ ! -d "/var/lib/mysql/$MARIADB_DATABASE" ]; then

    echo "Creating database '$MARIADB_DATABASE'..."

    # launching openrc and creating runlevel file to specify current runlevels and system states
    # openrc
    # touch /run/openrc/softlevel

    # preparing and starting MariaDB for initial configuration
    service mysql start

    # changing MariaDB configuration using root user
    # creating new database with name specified in .env
    # creating new user with name and password specified in .env
    # granting the new user all database privileges
    # locking the root user to password specified in .env
    # flushing for the privileges to take effect
    mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;
CREATE USER IF NOT EXISTS '$MARIADB_USER' IDENTIFIED BY '$MARIADB_PASSWORD';
GRANT ALL PRIVILEGES ON '$MARIADB_DATABASE'.* TO '$MARIADB_USER';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost'   IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';
EOF

    # stopping MariaDB for configuration changes to take effect
    service mysql stop

    echo "Database '$MARIADB_DATABASE' created."

else

    echo "Database '$MARIADB_DATABASE' does already exist."

fi

# running MariaDB through MySQL daemon using the mysql user
service mysql start 