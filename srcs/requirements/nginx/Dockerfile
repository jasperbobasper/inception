FROM debian:buster

RUN apt-get update && apt install -y nginx openssl

# Create ssl certificate 
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/nginx/ssl/nginx-signed.key \
-out /etc/nginx/ssl/nginx-signed.crt \
-subj "/C=DE/ST=Berlin/L=Berlin/O=42/CN=jpfannku.42.fr"

# Configure nginx
RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

# Start command
ENTRYPOINT [ "nginx", "-g", "daemon off;"]