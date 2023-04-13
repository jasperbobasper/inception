# !/bin/bash

#sleep to wait for MariaDB to start
sleep 5

# download wp 
sudo -u www-data wp core download

# sudo -u www-data wp config create --dbname=$MARIADB_DATABASE --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD --dbhost=localhost

# # installing and initializing WordPress core files with admin credentials
sudo -u www-data wp core install --url=$DOMAIN_NAME --title=$WORDPRESS_TITLE \
                --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_pass \
                --admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email

# # creating WordPress user with given credentials
sudo -u www-data wp user create $WORDPRESS_USER $WORDPRESS_USER_MAIL --user_pass=$WORDPRESS_PASS

/usr/sbin/php-fpm7.3 --nodaemonize