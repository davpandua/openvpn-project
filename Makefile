REPOSITORY=openvpn
TAG=latest
NAME=vpn2
KEYCONT=all-key-gen
ACTUALDIR := $(PWD)
USER := $(USER)

build:
	@docker build -t="$(REPOSITORY):$(TAG)" .

run:
	@docker run -d -t --name $(NAME) -p 4500:1194 -v $(DIR)/keys:/etc/openvpn/keys $(REPOSITORY):$(TAG)

stop:
	@docker stop $(NAME)
	@docker rm $(NAME)

bash:
	@docker exec -it $(NAME) /bin/bash

logs:
	@docker logs -f $(NAME)

test: stop build run logs

gen-ca:
	rm -rf keys
	mkdir keys
	docker run -it --rm --name $(KEYCONT) --privileged -v $(ACTUALDIR)/keys:/usr/share/easy-rsa/localkeys --entrypoint /bin/generate-ca.sh \
	$(REPOSITORY):$(TAG)
	sudo chown -R $(USER):$(USER) keys

gen-server:
	docker run -it --rm --name $(KEYCONT) --privileged -v $(ACTUALDIR)/keys:/usr/share/easy-rsa/localkeys --entrypoint /bin/generate-server-ca.sh \
	$(REPOSITORY):$(TAG)
	sudo chown -R $(USER):$(USER) keys

