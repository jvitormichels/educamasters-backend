docker:
	sudo docker-compose up

bash:
	sudo docker-compose run rails bash

debug:
	sudo docker attach educamasters

build:
	sudo docker-compose build