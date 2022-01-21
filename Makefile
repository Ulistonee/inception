

all:
	#mkdir -p /Users/rchalmer/data/db
	#mkdir -p /Users/rchalmer/data/wp
	docker compose -f srcs/docker-compose.yml build
	docker compose -f srcs/docker-compose.yml up -d


up:
	docker compose -f srcs/docker-compose.yml up -d


down:
	docker compose -f srcs/docker-compose.yml down


ps:
	docker compose -f srcs/docker-compose.yml ps