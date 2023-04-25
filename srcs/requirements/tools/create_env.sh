#!/bin/bash

env_path="srcs/.env"

# Check if env file exists
if [ -f $env_path ]; then
    echo ".env file already exists."
else
    # Ask for username and password
    read -p "Enter evaluated student Intra ID: " intra
    read -p "Enter Mariadb database name (default: wordpress): " dbname
    dbname=${dbname:-wordpress}
    read -p "Enter Mariadb username: " mdbusername
    read -s -p "Enter Mariadb password: " mdbpassword
    echo "\n"
    valid_password=false
    while [ "$valid_password" = false ]; do
        read -s -p "Enter Mariadb root password: " mdbrootpassword
    # Check if password contains the words "admin" or "123"
        if [[ $mdbrootpassword == *"admin"* || $mdbrootpassword == *"Admin"* || $mdbrootpassword == *"123"* ]]; then
            echo "Mdb root password contains the word admin or 123. Please choose a different password."
        else 
            valid_password=true
            echo "\n"
        fi
    done
    read -p "Enter wordpress title: (default: Inception)" wptitle
    wptitle=${wptitle:-Inception}
    read -p "Enter wordpress username: " wpusername
    read -s -p "Enter wordpress password: " wppassword
    echo "\n"
    read -p "Enter wordpress user email: " wpemail
    read -p "Enter wordpress admin username: " wpadminusername
    valid_password=false
    while [ "$valid_password" = false ]; do
        read -s -p "Enter wordpress admin password: " wpadminpassword
    # Check if password contains the words "admin" or "123"
        if [[ $wpadminpassword == *"admin"* || $wpadminpassword == *"Admin"* || $wpadminpassword == *"123"* ]]; then
            echo "Wordpress admin password contains the word admin or 123. Please choose a different password."
        else 
            valid_password=true
            echo "\n"
        fi
    done
    read -p "Enter wordpress admin email: " wpadminemail
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