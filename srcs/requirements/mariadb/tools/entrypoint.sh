#!/bin/sh

mysql_install_db
/etc/init.d/mysql start

# set up root
mysql_secure_installation << _EOF_

    Y
    $MARIADB_ROOT_PASSWORD
    $MARIADB_ROOT_PASSWORD
    Y
    n
    Y
    Y
_EOF_

# creating database and wordpress user
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES;" | sudo mysql -uroot
sudo mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};"
sudo mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
sudo mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%' WITH GRANT OPTION;"
sudo mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

# stop background process
/etc/init.d/mysql stop

# Run MariaDB in the foreground
exec "$@"
