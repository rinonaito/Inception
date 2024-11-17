DOCKER_COMPOSE_DIR	= ./srcs
DOCKER_COMPOSE_FILE	= $(DOCKER_COMPOSE_DIR)/docker-compose.yml

build	:
	docker-compose -f $(DOCKER_COMPOSE_FILE) up --build -d
up	:
	docker-compose -f $(DOCKER_COMPOSE_FILE) up 
down	:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down
reset	:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down -v

.PHONY: build
