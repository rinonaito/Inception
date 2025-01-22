DOCKER_COMPOSE_DIR	= ./srcs
DOCKER_COMPOSE_FILE	= $(DOCKER_COMPOSE_DIR)/docker-compose.yml
VOLUME_DIR		= /home/rnaito/data

build	:
	sudo mkdir -p $(VOLUME_DIR)/files
	sudo mkdir -p $(VOLUME_DIR)/database
	docker-compose -f $(DOCKER_COMPOSE_FILE) up --build -d
up	:
	docker-compose -f $(DOCKER_COMPOSE_FILE) up 
down	:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down
reset	:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down -v
	sudo rm -rf $(VOLUME_DIR)

.PHONY: build
