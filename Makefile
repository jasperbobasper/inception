all: dir reload

re: fclean dir reload
	
reload:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down: 
	@docker compose -f ./srcs/docker-compose.yml down

linux:
	echo "127.0.0.1 jpfannku.42.fr" >> /etc/hosts

dir:
	mkdir -p ~/data/database
	mkdir -p ~/data/website

fclean:
	@docker compose -f  ./srcs/docker-compose.yml down --rmi all --volumes
	sudo rm -rf ~/data


.PHONY: all dir linux down fclean re reload
