#!/bin/bash

env_path="srcs/.env"

# Check if env file exists
if [ -f $env_path ]; then
    echo ".env file already exists."
else
    # Ask for username and password
    read -p "Enter evaluated student Intra ID: (default: jpfannku)" intra
    intra=${intra:-jpfannku}
    read -p "Enter Mariadb database name (default: wordpress): " dbname
    dbname=${dbname:-wordpress}
    read -p "Enter Mariadb username: " mdbusername
    read -s -p "Enter Mariadb password: " mdbpassword
    echo ''
    read -s -p "Enter Mariadb root password: " mdbrootpassword
    echo ''
    read -p "Enter wordpress title: (default: Inception)" wptitle
    wptitle=${wptitle:-Inception}
    read -p "Enter wordpress username: " wpusername
    read -p "Enter wordpress user email: " wpemail
    read -s -p "Enter wordpress password: " wppassword
    echo ''
    valid_user=false
    while [ "$valid_user" = false ]; do
        read -p "Enter wordpress admin username: " wpadminusername
    # Check if username contains variations on the word "admin/administrator"
        if [[ $wpadminusername == *"admin"* || $wpadminusername == *"Admin"* ]]; then
            echo "Wordpress admin username contains the word admin. Please choose a different username."
    # Check username is different to the other user
        elif [[ $wpadminusername == $wpusername ]]; then
            echo "Admin username must be different from wordpress user"
        else 
            valid_user=true
        fi
    done
    valid_mail=false
    while [ "$valid_mail" = false ]; do
        read -p "Enter wordpress admin email: " wpadminemail
        if [[ $wpadminemail == $wpemail ]]; then
            echo "Admin email must be different than user email."
        else
            valid_mail=true
        fi
    done
    read -s -p "Enter wordpress admin password: " wpadminpassword
    echo ''
    read -p "Enter wordpress table prefix (default: _wp): " wpprefix
    wpprefix=${wpprefix:-_wp}

    # Add username and password to env file
    echo "DOMAIN_NAME=$intra.42.fr" >> $env_path
    echo "# MariaDB Credentials" >> $env_path
    echo "MARIADB_DATABASE=$dbname" >> $env_path
    echo "MARIADB_USER=$mdbusername" >> $env_path
    echo "MARIADB_PASSWORD=$mdbpassword" >> $env_path
    echo "MARIADB_ROOT_PASSWORD=$mdbrootpassword" >> $env_path
    echo "# Wordpress Credentials" >> $env_path
    echo "WORDPRESS_TITLE=$wptitle" >> $env_path
    echo "WORDPRESS_USER=$wpusername" >> $env_path
    echo "WORDPRESS_USER_MAIL=$wpemail" >> $env_path
    echo "WORDPRESS_PASS=$wppassword" >> $env_path
    echo "WORDPRESS_ADMIN_USER=$wpadminusername" >> $env_path
    echo "WORDPRESS_ADMIN_PASS=$wpadminpassword" >> $env_path
    echo "WORDPRESS_ADMIN_EMAIL=$wpadminemail" >> $env_path
    echo "WORDPRESS_TABLE_PREFIX=$wpprefix" >> $env_path

    echo "Credentials saved to .env file."
fi