all: dir
	@docker compose -f ./srcs/docker-compose.yml up -d --build

re: fclean dir
	@docker compose -f ./srcs/docker-compose.yml up -d --build

reload:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down: 
	@docker compose -f ./srcs/docker-compose.yml down

# NAME = inception

# all: dir build
# 	docker-compose -f  srcs/docker-compose.yml up

# debug: dir debug-build
# 	docker-compose -f  srcs/docker-compose.yml up

# linux:
# 	echo "127.0.0.1 jpfannku.42.fr" >> /etc/hosts

dir:
	mkdir -p ~/data/database
	mkdir -p ~/data/website

# build:
# 	docker-compose -f srcs/docker-compose.yml build

# debug-build:
# 	PROGRESS_NO_TRUNC=1 docker-compose -f srcs/docker-compose.yml build --progress plain --no-cache
	
# stop:
# 	docker-compose -f  srcs/docker-compose.yml down

# clean:
# 	docker-compose -f  srcs/docker-compose.yml down --volumes

fclean:
	docker-compose -f  srcs/docker-compose.yml down --rmi all --volumes --remove-orphans
	sudo rm -rf ~/data

# re: fclean all

# .PHONY: all dir linux build stop clean fclean re
