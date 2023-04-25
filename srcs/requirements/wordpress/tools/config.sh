#!/bin/bash

# Make dir for wordpress install
mkdir -p /var/www/html
sleep 5

# Move to dir and install wordpress command line interface
cd /var/www/html
rm -rf *
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Download wp
wp core download --allow-root

# Import env variables in the config file
sed -i "s/username_here/$MARIADB_USER/g" wp-config-sample.php
sed -i "s/password_here/$MARIADB_PASSWORD/g" wp-config-sample.php
sed -i "s/localhost/mariadb/g" wp-config-sample.php
sed -i "s/database_name_here/$MARIADB_DATABASE/g" wp-config-sample.php
cp wp-config-sample.php wp-config.php

# Create admin and user
wp core install --url=$DOMAIN_NAME --title=$WORDPRESS_TITLE \
			--admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASS \
			--admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email --allow-root
wp user create $WORDPRESS_USER $WORDPRESS_USER_MAIL --role=author --user_pass=$WORDPRESS_PASS --allow-root

# Run php-fpm in foreground without daemon (-F)
/usr/sbin/php-fpm7.3 -F