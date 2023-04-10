FROM alpine:3.14

RUN apk update && apk add php7-fpm php7-mysqli php7-xml php7-curl php7-json php7-gd php7-zip php7-mbstring

COPY --chown=nobody wordpress /var/www/wordpress
COPY php-fpm.conf /etc/php7/php-fpm.d/www.conf

CMD ["php-fpm7", "-F"]
