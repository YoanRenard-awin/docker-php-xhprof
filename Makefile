command =
server ?= docker

all: build

build:
	docker build -t xhprof:5.4-apache -f docker/Dockerfile .

stop:
	@docker rm -vf xhprof:5.4-apache

clean: stop
	docker rmi xhprof:5.4-apache

.PHONY: build start stop clean
