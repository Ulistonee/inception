
all:
	sudo docker-compose -f srcs/docker-compose.yml build
	sudo docker-compose -f srcs/docker-compose.yml up -d

re:
	sudo docker-compose -f srcs/docker-compose.yml down
	sudo docker-compose -f srcs/docker-compose.yml build --no-cache
	sudo docker-compose -f srcs/docker-compose.yml up -d

up:
	sudo docker-compose -f srcs/docker-compose.yml up -d


down:
	sudo docker-compose -f srcs/docker-compose.yml down
	sudo docker system prune -a
	sudo docker volume rm db wp
	sudo rm -rf /home/rchalmer/data/db/*
	sudo rm -rf /home/rchalmer/data/wp/*


ps:
	sudo docker-compose -f srcs/docker-compose.yml ps

logs:
	sudo docker-compose -f srcs/docker-compose.yml logs wordpress
