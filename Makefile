REPOSITORY=openvpn
TAG=latest
NAME=vpn2

build:
	@docker build -t="$(REPOSITORY):$(TAG)" .

run:
	@docker run -d -t --name $(NAME) -p 4500:1194 $(REPOSITORY):$(TAG)

stop:
	@docker stop $(NAME)
	@docker rm $(NAME)

bash:
	@docker exec -it $(NAME) /bin/bash

logs:
	@docker logs $(NAME)

gen-ca:
	@echo "en proceso" 

