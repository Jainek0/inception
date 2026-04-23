LOGIN = thcaquet

TPUT = tput -T xterm-256color
_RESET = $(shell $(TPUT) sgr0)
_BOLD = $(shell $(TPUT) bold)
_GREEN = $(shell $(TPUT) setaf 2)
_RED = $(shell $(TPUT) setaf 1)

DATA_DIR = /home/$(LOGIN)/data

all: up

up:
	@mkdir -p $(DATA_DIR)/mariadb
	@mkdir -p $(DATA_DIR)/wordpress
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down

stop: down

clean:
	@docker-compose -f ./srcs/docker-compose.yml down -v

fclean: clean
	@docker system prune -af --volumes
	@docker volume prune -af

sfclean: fclean
	@sudo rm -rf $(DATA_DIR)

re: fclean all

.PHONY: all up down stop clean fclean sfclean re
