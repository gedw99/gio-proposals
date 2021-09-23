print:

LIB_NAME=goversioninfo
dep:
	rm -rf $(LIB_NAME)
	git clone https://github.com/josephspurrier/goversioninfo
dep-os:
	go install github.com/josephspurrier/goversioninfo/cmd/goversioninfo@latest
	go install github.com/mcuadros/go-version@latest

build:
	# to gobin
	cd $(LIB_NAME)/cmd/goversioninfo && go build -o $(GOPATH)/bin/goversioninfo .
	which goversioninfo

run-example32:
	cd $(LIB_NAME)/testdata/example32 && go generate . && go build .
run-example64-gofile:
	cd $(LIB_NAME)/testdata/example64-gofile && go generate . && go build .
	open$(LIB_NAME)/testdata/example64-gofile/example64-gofile
run-gofile:
	cd $(LIB_NAME)/testdata/gofile && go generate . && go build .
	open$(LIB_NAME)/testdata/gofile/gofile
