FROM alpine:3.14

RUN apk update && apk add nginx openssl

COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /run/nginx
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=US/ST=SomeState/L=SomeCity/O=SomeOrg/CN=localhost" -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt

CMD ["nginx", "-g", "daemon off;"]
