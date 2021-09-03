bold := $(shell tput bold)
sgr0 := $(shell tput sgr0)

CLI_BIN_PATH=$(GOPATH)/bin/asynq-cli
SERVER_BIN_PATH=$(GOPATH)/bin/asynq-server
WEBSERVER_BIN_PATH=$(GOPATH)/bin/asynq-websever

print:
	@echo 'CLI templater in golang - $(bold)bold text$(sgr0)'

git-clone:
	git clone https://github.com/hibiken/asynq

	git clone https://github.com/hibiken/asynqmon

build:
	# server
	cd asynq && go build -o $(SERVER_BIN_PATH) .

	# cli
	cd asynq/tools/asynq && go build -o $(CLI_BIN_PATH) .

build-web:
	# web
	cd asynqmon/ui && yarn install && yarn build
	cd asynqmon && go build -ldflags="-s -w" -o $(WEBSERVER_BIN_PATH) .

run-server:
	$(SERVER_BIN_PATH)
run-webserver:
	$(WEBSERVER_BIN_PATH)
	# http://localhost:8080/
run-cli:
	$(CLI_BIN_PATH)

