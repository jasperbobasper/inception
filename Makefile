all: env dir reload 

re: fclean dir reload
	
reload:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down: 
	@docker compose -f ./srcs/docker-compose.yml down

linux:
	echo "127.0.0.1 jpfannku.42.fr" >> /etc/hosts

env:
	srcs/requirements/tools/create_env.sh

dir:
	mkdir -p ~/data/database
	mkdir -p ~/data/website

fclean:
	@docker compose -f  ./srcs/docker-compose.yml down --rmi all --volumes
	sudo rm srcs/.env
	sudo rm -rf ~/data


.PHONY: all dir linux down fclean re reload env
