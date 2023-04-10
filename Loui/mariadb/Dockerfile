FROM alpine:3.14

RUN apk update && apk add mariadb mariadb-client

COPY my.cnf /etc/mysql/my.cnf

VOLUME ["/var/lib/mysql"]

CMD ["mysqld"]
