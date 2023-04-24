FROM debian:buster

RUN     apt-get update && apt install -y \
        wget \
        curl \
        php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd php-cli \
	php-mbstring \
        && rm -rf /var/lib/apt/lists/*

# Download wp-cli 
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# move config files to correct dir
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir /run/php

# move sh script to root and granting permissions for execution
COPY tools/config.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/config.sh

ENTRYPOINT ["/usr/local/bin/config.sh" ]

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]
