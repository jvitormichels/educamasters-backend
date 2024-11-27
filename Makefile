docker:
	sudo docker-compose up

bash:
	sudo docker-compose run --service-ports rails bash

debug:
	sudo docker attach $(container)

build:
	sudo docker-compose build