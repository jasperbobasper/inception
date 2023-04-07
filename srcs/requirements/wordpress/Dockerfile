FROM    Debian:11

RUN     apt-get update && apt-get upgrade && apt install \
        php \
        php-fpm \
        php-curl \
        php-opcache \
        php-gd \
        php-cli \
        php-zip \
        php-mysql \
        php-json \
        php-mbstring \
        php-exif \
        php-openssl \
        php-fileinfo \
        php-hash \
        php-imagick \
        php-xml -y

RUN wget https://wordpress.org/latest.tar.gz

RUN tar -xzfv latest.tar.gz -C ~/home/${LINUX_USER}/inception/website/nginx/

COPY conf/wp-config.php ~/home/${LINUX_USER}/inception/website/nginx/wordpress/wp-config-sample.php

RUN chown www-data:www-data ~/home/${LINUX_USER}/inception/website/nginx/wordpress/ -R


