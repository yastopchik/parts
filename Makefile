init: docker-down-clear docker-build docker-up
up: docker-up
down: docker-down
restart: down up
rebuild: down docker-build up

docker-up:
	docker-compose up -d --build

docker-down:
	docker-compose down --remove-orphans

docker-down-clear:
	docker-compose down -v --remove-orphans

docker-build:
	docker-compose build

composer-install:
	docker-compose exec app composer install --no-interaction --prefer-dist --no-progress --no-suggest