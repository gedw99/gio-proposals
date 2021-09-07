
# https://dev.sum7.eu/genofire/push-pubsub

print:

dep:
	git clone https://dev.sum7.eu/genofire/push-pubsub

EX=$(PWD)/push-pubsub

BIN_PATH=$(PWD)/dist
BIN_NAME=push-pubsub
build:
	cd $(EX) && go build -o $(BIN_PATH)/$(BIN_NAME) .

config:
	cd $(BIN_PATH) && touch data.toml
	cp -r $(EX)/public $(BIN_PATH)
	
run:
	cd $(BIN_PATH) && ./$(BIN_NAME)
	# http://localhost:8080/

	# wasm app
	# http://localhost:8080/flash

	# prom
	# http://localhost:8080/metrics

	# api
	# http://localhost:8080/api/v1/status
