FROM debian:buster

RUN     apt-get update && apt install -y \
        sudo \
        wget \
        curl \
        bash \
        php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd php-cli \
	php-mbstring \
        && rm -rf /var/lib/apt/lists/*
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
# RUN mkdir -p /var/www/html/wordpress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp


COPY conf/www.conf /etc/php/7.3/fpm/pool.d

RUN mkdir -p /run/php

# WORKDIR /var/www/html/wordpress

# move config files to correct dir

# COPY conf/wp-config.php /var/www/html/wordpress/

COPY conf/test.php /var

# RUN chown -R www-data:www-data /var/www/
# RUN chown -R www-data:www-data /var/www/html/wordpress

# RUN chmod +x /var/www/html/wordpress/wp-config.php
# RUN chmod +x /etc/php/7.3/fpm/pool.d/www.conf

# RUN service php7.3-fpm reload

# move sh script to root and granting permissions for execution
COPY tools/config.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/config.sh


# ENTRYPOINT ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
ENTRYPOINT ["/usr/local/bin/config.sh" ]

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
