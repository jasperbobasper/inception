FROM debian:buster

RUN     apt-get update && apt install -y \
        sudo \
        wget \
        php \
        php-common \
        php-mysql \
        php-curl \
        php-fpm
        # php8.2-opcache \
        # php8.2-gd \
        # php8.2-cli \
        # php8.2-zip \
        # php8.2-json \
        # php8.2-mbstring \
        # php8.2-exif \
        # php8.2-openssl \
        # php8.2-fileinfo \
        # php8.2-hash \
        # php8.2-imagick \
        # php8.2-xml -y

# move to wordpress install dir, download and unzip wordpress files
# WORKDIR /var/www/wordpress
RUN mkdir -p /var/www/html/wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN tar -xzf latest.tar.gz

# ARG WORDPRESS_USER
# ARG WORDPRESS_PASS
# ARG WORDPRESS_ADMIN_USER
# ARG WORDPRESS_ADMIN_PASS
# ARG WORDPRESS_ADMIN_EMAIL
# ARG WORDPRESS_TITLE
# ARG WORDPRESS_USER_MAIL
# ARG WORDPRESS_TABLE_PREFIX
# ARG AUTH_KEY
# ARG SECURE_AUTH_KEY
# ARG LOGGED_IN_KEY
# ARG NONCE_KEY
# ARG AUTH_SALT
# ARG SECURE_AUTH_SALT
# ARG LOGGED_IN_SALT
# ARG NONCE_SALT

RUN chown -R www-data:www-data /var/www/

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php


RUN chown -R www-data:www-data /var/www/html/wordpress

WORKDIR /var/www/html/wordpress

# move config files to correct dir
COPY conf/www.conf /etc/php/7.3/fpm/pool.d
COPY conf/wp-config.php /var/www/html/wordpress/

RUN service php7.3-fpm restart 

# move sh script to root and granting permissions for execution
COPY tools/config.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/config.sh


# ENTRYPOINT ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
ENTRYPOINT [ "sh", "/usr/local/bin/config.sh" ]