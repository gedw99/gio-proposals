GO_ARCH=$(shell go env GOARCH)
GO_OS=$(shell go env GOOS)

# TODO
# - GOENV like here: https://github.com/shanna/entxid-test/blob/master/Makefile, so make things cleaner 
# - Docker like here: https://github.com/shanna/entxid-test/blob/master/Makefile,

## go print
go-print:
	@echo 
	@echo --- GO ---
	
	@echo GO_ARCH:			$(GO_ARCH)
	@echo GO_OS:			$(GO_OS)
	@echo GO_EX:			$(GO_EX)
	@echo GO_BIN_FSPATH:	$(GO_BIN_FSPATH)
	@echo GO_BIN_NAME:		$(GO_BIN_NAME)
	@echo 
	
## go mod tidy
go-mod-tidy:
	cd $(GO_EX) && go mod tidy
	
## go mod update
go-mod-update:
	# See: https://github.com/shanna/entxid-test/blob/master/Makefile#L19
	@echo
	@echo -- Visiting:		$(GO_EX)
	# installs to go bin.
	cd $(GO_EX) && go get github.com/oligot/go-mod-upgrade
	cd $(GO_EX) && go-mod-upgrade
	cd $(GO_EX) && go mod tidy
	cd $(GO_EX) && go mod verify

## go run
go-run:
	cd $(GO_EX) && go run .

## go build (and generate)
go-build:
	cd $(GO_EX) && go generate ./...
	cd $(GO_EX) && go build -o $(GO_BIN_FSPATH)/$(GO_BIN_NAME)

## go build and run
go-buildrun: go-build
	cd $(GO_BIN_FSPATH) && ./$(GO_BIN_NAME) 