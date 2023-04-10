.PHONY: build up down

build:
	docker build -t loui/nginx nginx
	docker build -t loui/wordpress wordpress
	docker build -t loui/mariadb mariadb

up: build
	docker-compose up -d

down:
	docker-compose down
