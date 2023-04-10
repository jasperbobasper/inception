NAME = inception

all: dir build
	docker-compose -f  srcs/docker-compose.yml up

linux:
	echo "127.0.0.1 jpfannku.42.fr" >> /etc/hosts

dir:
	mkdir -p ~/data/database
	mkdir -p ~/data/website

build:
	docker-compose -f  srcs/docker-compose.yml build
	
stop:
	docker-compose -f  srcs/docker-compose.yml down

clean:
	docker-compose -f  srcs/docker-compose.yml down --volumes

fclean:
	docker-compose -f  srcs/docker-compose.yml down --rmi all --volumes
	sudo rm -rf ~/data

re: fclean all

.PHONY: all dir linux build stop clean fclean re