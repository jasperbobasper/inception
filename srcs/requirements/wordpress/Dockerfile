FROM debian:buster

RUN     apt-get update && apt install -y \
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
WORKDIR /var/www/wordpress
RUN wget https://wordpress.org/latest.tar.gz 
RUN tar -xzf latest.tar.gz

RUN mkdir -p /run/php

# move config files to correct dir
COPY conf/wp-config.php /var/www/wordpress/
COPY conf/www.conf /usr/sbin/php-fpm.d/

# move sh script to root and granting permissions for execution
COPY tools/config.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/config.sh

# give php client access to folder
# RUN chown www-data:www-data 


# ENTRYPOINT ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
ENTRYPOINT [ "sh", "/usr/local/bin/config.sh" ]