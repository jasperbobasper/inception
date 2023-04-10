#!/bin/sh

if [ ! -d "/var/lib/mysql/$MARIADB_DATABASE" ]; then

    echo "MariaDB entrypoint.sh: creating database '$MARIADB_DATABASE'..."

    # launching openrc and creating runlevel file to specify current runlevels and system states
    # openrc
    # touch /run/openrc/softlevel

    # preparing and starting MariaDB for initial configuration
    /etc/init.d/mariadb setup
    /etc/init.d/mariadb start

    # changing MariaDB configuration using root user
    #   first, dropping possible anonymous users for unambigous connecting
    #   second, creating new database with name specified in environment
    #   third, creating new user with name and password specified in environment
    #   fourth, granting the new user privileges to the new database including ability to grant privileges to other users at given privilege level
    #   fifth, locking the root user to password specified in environment
    #   sixth, flushing for the privileges to take effect
    mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;
CREATE USER IF NOT EXISTS $MARIADB_USER IDENTIFIED BY $MARIADB_PASSWORD;
GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO $MARIADB_USER;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost'   IDENTIFIED BY $MARIADB_ROOT_PASSWORD;
EOF

    # stopping MariaDB for configuration changes to take effect
    /etc/init.d/mariadb stop

    echo "MariaDB entrypoint.sh: database '$MARIADB_DATABASE' created."

else

    echo "MariaDB entrypoint.sh: database '$MARIADB_DATABASE' does already exist."

fi

# running MariaDB through MySQL daemon using the mysql user
/usr/bin/mysqld --user=mysql