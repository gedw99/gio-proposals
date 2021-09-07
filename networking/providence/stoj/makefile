# https://github.com/storj/storj

print:

dep:
	rm -rf storj
	git clone https://github.com/storj/storj

	rm -rf common
	git clone https://github.com/storj/common

	rm -rf drpc
	git clone https://github.com/storj/drpc

STO_LIB_PATH=$(PWD)/storj

STO_BIN_PATH=$(GOPATH)/bin
STO_BIN_NAME=storj
STO_BIN=$(STO_BIN_PATH)/$(STO_BIN_NAME)

sto-build:
	cd $(STO_LIB_PATH) && go install -v ./cmd/...
	which $(STO_BIN_NAME)
sto-run:
	$(STO_BIN)/ -v


DRP_LIB_PATH=$(PWD)/drpc

DRP_BIN_PATH=$(GOPATH)/bin
DRP_BIN_NAME=drpc

drp-build:
	cd $()
