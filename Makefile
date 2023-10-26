DOCKER_API=docker exec api
DOCKER_API_IT=docker exec -it api
DOCKER_WEBAPP=docker exec webapp
DOCKER_WEBAPP_IT=docker exec webapp
DOCKER_DB=docker exec database
DOCKER_DB_IT=docker exec database


build-database:
	docker compose build database

build-api: 
	cp ./api/.dockerignore ../api
	cp ./api/Api.Dockerfile ../api
	docker compose build api

build-webapp:
	cp ./webapp/.dockerignore ../webapp
	cp ./webapp/Webapp.Dockerfile ../webapp
	docker compose build webapp

install: build-database build-api build-webapp

start: install 
	docker compose up -d
	$(DOCKER_WEBAPP) npm install

shell-db: 
	$(DOCKER_DB_IT) psql -U postgres

shell-api:
	$(DOCKER_API_IT) /bin/sh

shell-webapp:
	$(DOCKER_WEBAPP_IT) /bin/sh
