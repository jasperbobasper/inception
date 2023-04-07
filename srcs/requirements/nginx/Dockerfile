FROM Debian:11

RUN apt-get update && apt-get upgrade && apt install nginx openssl

# Create ssl certificate
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/nginx/ssl/nginx-signed.key \
-out /etc/nginx/ssl/nginx-signed.crt \
-subj "/C=DE/ST=Berlin/L=Berlin/O=42/CN=jpfannku.42.fr"

#### MOVE certificate var????? 


# Configure nginx

RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

# Start command

ENTRYPOINT [ "nginx" ] 
#daemons???