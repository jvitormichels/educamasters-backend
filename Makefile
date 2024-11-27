docker:
	sudo docker-compose up

bash:
	sudo docker-compose run rails bash


debug:
	sudo docker attach $(container)

build:
	sudo docker-compose build