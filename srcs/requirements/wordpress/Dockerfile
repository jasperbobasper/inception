FROM debian:buster



RUN     apt-get update && apt install -y \
        curl \
        php \
		php-cgi \
		php-mysql \
		php-fpm \
		php-pdo \
		php-gd \
		php-cli \
		php-mbstring


# move config files to correct dir
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir /run/php

# move sh script to root and granting permissions for execution
COPY tools/config.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/config.sh

ENTRYPOINT ["/usr/local/bin/config.sh" ]