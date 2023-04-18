#!/bin/bash

sleep 10

if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else

####### MANDATORY PART ##########

	# Download wordpress and all config file
	wget -q http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

    # wp core download --allow-root

	#Inport env variables in the config file
	sed -i "s/username_here/$MARIADB_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MARIADB_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MARIADB_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MARIADB_DATABASE/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php

    # wp core install --url=$DOMAIN_NAME/wordpress --title=$WORDPRESS_TITLE \
    #             --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_pass \
    #             --admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email --allow-root
    # wp user create $WORDPRESS_USER $WORDPRESS_USER_MAIL --role=author --user_pass=$WORDPRESS_PASS --allow-root
fi

exec "$@"