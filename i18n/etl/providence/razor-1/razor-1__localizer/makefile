# https://github.com/razor-1/localizer

# uses genji and a graph.

GO_ARCH=$(shell go env GOARCH)
GO_OS=$(shell go env GOOS)

VERSION := $(shell git describe --abbrev=0)
COMMIT_SHA := $(shell git rev-parse HEAD)
BUILD_DATE := $(shell date -u +"%Y-%m-%dT%H:%M:%SZ")

LDFLAGS += -X "github.com/$(LIB_NAME)/internal/util.Version=$(VERSION)"
LDFLAGS += -X "github.com/$(LIB_NAME)/internal/util.Commit=$(COMMIT_SHA)"
LDFLAGS += -X "github.com/$(LIB_NAME)/internal/util.BuildDate=$(BUILD_DATE)"

print:
	@echo

	@echo
	@echo GO_ARCH:			$(GO_ARCH)
	@echo GO_OS:			$(GO_OS)
	
	@echo
	@echo VERSION:			$(VERSION)
	@echo COMMIT_SHA:		$(COMMIT_SHA)
	@echo BUILD_DATE:		$(BUILD_DATE)
	@echo LDFLAGS:			$(LDFLAGS)

	@echo
	@echo LIB_NAME:			$(LIB_NAME)

	@echo
	@echo BIN_FOLDERPATH:	$(BIN_FOLDERPATH)
	@echo BIN_SERVER:		$(BIN_SERVER)
	@echo BIN_CLI:			$(BIN_CLI)



LIB_NAME=localizer

all: dep-all gui-all go-all

### DEP ( dependenies )

dep-all: dep dep-os-go

dep:
	rm -rf $(LIB_NAME)
	git clone https://github.com/razor-1/localizer

dep-os-go:
	go install github.com/leonelquinteros/gotext/cli/xgotext@latest
	
## go mod tidy
go-mod-tidy:
	cd $(LIB_NAME) && go mod tidy
	cd $(LIB_NAME) && go mod verify
	
## go mod update
go-mod-update:
	@echo
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
	cd $(LIB_NAME)/cmd/? && go build -ldflags '$(LDFLAGS)' -o $(BIN_SERVER) ..


go-build-clean:
	rm -rf $(BIN_FOLDERPATH)

### RUN

XGO_IN=$(PWD)/$(LIB_NAME)/store/
XGO_OUT=$(PWD)/$(LIB_NAME)/store_out
run-xgotext-print:
	@echo 
	@echo XGO_IN:		$(XGO_IN)
	@echo XGO_OUT:		$(XGO_OUT)
run-xgotext:
	mkdir -p $(XGO_OUT)
	xgotext -default testdomain -exclude ".git" -in $(XGO_IN) -out $(XGO_OUT)

	
