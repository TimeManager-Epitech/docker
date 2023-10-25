DOCKER_API=$(shell docker exec api)

install: 
	cp ./api/.dockerignore ../api
	cp ./api/Api.Dockerfile ../api
	docker compose up -d

start: install 

rebuild-api:
	docker stop api
	docker rm api
	docker compose up -d