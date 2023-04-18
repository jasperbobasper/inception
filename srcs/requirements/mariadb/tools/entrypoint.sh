#!/bin/sh
# set -e 

# Initialize the database if it is not already initialized
if [ -d "/var/lib/mysql/$MARIADB_DATABASE" ]; then
    echo "database exists"
else
    echo "Database not initialized. Initializing..."
    mysql_install_db
    /etc/init.d/mysql start

    # Check if the root user can connect without a password
    echo "Setting root password..."
    mysql_secure_installation << _EOF_

        Y
        $MARIADB_ROOT_PASSWORD
        $MARIADB_ROOT_PASSWORD
        Y
        n
        Y
        Y
_EOF_
#     mysql -u root << _EOF_
#     SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${MARIADB_ROOT_PASSWORD}');
#     ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password USING PASSWORD('${MARIADB_ROOT_PASSWORD}');
#     GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';
#     FLUSH PRIVILEGES;
# _EOF_
    # echo "Root password set"
    echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

    # Create database and user if they don't exist
    # if ! mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "USE ${MARIADB_DATABASE}"; then
    #     echo "Creating database and user..."
    #     mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};"
    #     mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
    #     mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%';"
    #     mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"
    #     echo "Database and user created"
    # fi

    
    echo "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE; GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%';IDENTIFIED BY '${MARIADB_PASSWORD}';FLUSH PRIVILEGES;" | mysql -uroot
    # Stop the background MariaDB process
    # mysqladmin shutdown -u root -p"${MYSQL_ROOT_PASSWORD}"

fi

/etc/init.d/mysql stop
# Run MariaDB in the foreground
# exec /usr/sbin/mysqld --datadir=/var/lib/mysql --user=mysql

exec "$@"