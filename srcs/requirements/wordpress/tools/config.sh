# !/bin/bash

#sleep to wait for MariaDB to start
sleep 5

chown -R www-data:www-data /var/www/html/wordpress

chmod -R 755 /var/www/html/wordpress

# # installing and initializing WordPress core files with admin credentials
# wp core install --url=$DOMAIN_NAME --title=$WORDPRESS_TITLE \
#                 --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_pass \
#                 --admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email

# # creating WordPress user with given credentials
# wp user create $WORDPRESS_USER $WORDPRESS_USER_MAIL --user_pass=$WORDPRESS_PASS

/usr/sbin/php-fpm7.3 --nodaemonize