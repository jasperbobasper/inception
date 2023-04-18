#!/bin/sh
set -e 

# Initialize the database if it is not already initialized
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Database not initialized. Initializing..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
    echo "Database initialized"
fi

# Start MariaDB in the background
/usr/bin/mysqld_safe --datadir=/var/lib/mysql &

# Wait for MariaDB to start
sleep 5

# Check if the root user can connect without a password
if ! mysqladmin ping -u root --silent; then
    echo "Setting root password..."
    mysql -u root -e "SET @@SESSION.SQL_LOG_BIN=0; DELETE FROM mysql.user WHERE user NOT IN ('mysql.session', 'mysql.sys', 'root') OR host NOT IN ('localhost');"
    mysql -u root -e "SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${MARIADB_ROOT_PASSWORD}');"
    mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;"
    mysql -u root -e "FLUSH PRIVILEGES;"
    echo "Root password set"
fi

# Create database and user if they don't exist
if ! mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "USE ${MARIADB_DATABASE}"; then
    echo "Creating database and user..."
    mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};"
    mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
    mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%';"
    mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"
    echo "Database and user created"
fi

# Stop the background MariaDB process
# mysqladmin shutdown -u root -p"${MYSQL_ROOT_PASSWORD}"

/etc/init.d/mysql stop

# Run MariaDB in the foreground
# exec /usr/sbin/mysqld --datadir=/var/lib/mysql --user=mysql

exec "$@"