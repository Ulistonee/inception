
all:
	#mkdir -p /Users/rchalmer/data/db
	#mkdir -p /Users/rchalmer/data/wp
	sudo docker-compose -f srcs/docker-compose.yml build
	sudo docker-compose -f srcs/docker-compose.yml up -d


up:
	sudo docker-compose -f srcs/docker-compose.yml up -d


down:
	sudo docker-compose -f srcs/docker-compose.yml down


ps:
	sudo docker-compose -f srcs/docker-compose.yml ps

logs:
	sudo docker-compose -f srcs/docker-compose.yml logs wordpress
