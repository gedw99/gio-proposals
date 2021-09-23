# https://github.com/razor-1/cldr

LIB_NAME=cldr

dep-all: dep dep-os-go

dep:
	rm -rf $(LIB_NAME)
	git clone https://github.com/razor-1/cldr
dep-os-go:
	go install github.com/leonelquinteros/gotext/cli/xgotext@latest


## go mod tidy
go-mod-tidy:
	cd $(LIB_NAME) && go mod tidy
	cd $(LIB_NAME) && go mod verify
	
## go mod update
go-mod-update:
	@echo
	@echo -- Visiting:		$(LIB_NAME) to check modules
	# installs to go bin.
	cd $(LIB_NAME) && go install github.com/oligot/go-mod-upgrade@latest
	cd $(LIB_NAME) && go-mod-upgrade
	cd $(LIB_NAME) && go mod tidy
	cd $(LIB_NAME) && go mod verify


### GO

BIN_FOLDERPATH=$(PWD)/_dist


BIN_SERVER_NAME=$(LIB_NAME)-server
ifeq ($(OS),Windows_NT)
	BIN_SERVER_NAME:=$(LIB_NAME)-server.exe
else
	BIN_SERVER_NAME:=$(LIB_NAME)-server
endif
BIN_SERVER=$(BIN_FOLDERPATH)/$(BIN_SERVER_NAME)

BIN_CLI_NAME=localizer-cli
ifeq ($(OS),Windows_NT)
	BIN_CLI_NAME:=$(LIB_NAME)-cli.exe
else
	BIN_CLI_NAME:=$(LIB_NAME)-cli
endif
BIN_CLI=$(BIN_FOLDERPATH)/$(BIN_CLI_NAME)

go-all: go-build

go-build:
	cd $(LIB_NAME)/cmd/make_resources && go build -ldflags '$(LDFLAGS)' -o $(BIN_CLI) .


go-install:
	cd $(LIB_NAME)/cmd/make_resources && go install -ldflags '$(LDFLAGS)' .

go-build-clean:
	rm -rf $(BIN_FOLDERPATH)

### RUN

XGO_IN=$(PWD)/$(LIB_NAME)/store/
XGO_OUT=$(PWD)/$(LIB_NAME)/store_out
run-print:
	@echo 
	@echo XGO_IN:		$(XGO_IN)
	@echo XGO_OUT:		$(XGO_OUT)
run:
	mkdir -p $(XGO_OUT)
	$(BIN_CLI) -h 

	
