

# https://github.com/caos/zitadel

# https://github.com/caos/zitadel-dart
# https://github.com/caos/zitadel-go


MAKE_PATH=./..
include $(MAKE_PATH)/_inc.mk

_BIN=$(PWD)/_bin
_DIST=$(PWD)/_dist

LIB_NAME=zitadel
LIB_ORG=caos
LIB=github.com/$(LIB_ORG)/$(LIB_NAME)
LIB_BRANCH=main



LIB_BIN_CLI=$(_BIN)/$(LIB_NAME)-cli
LIB_BIN_CTL=$(_BIN)/$(LIB_NAME)-ctl

FLU_EX=$(LIB_NAME)/example

this-print:
	@echo 

this-dep:
	

this-build:
	mkdir -p $(_BIN)
	cd $(LIB_NAME) && go mod download
	cd $(LIB_NAME)/cmd/zitadel && go build .
	cd $(LIB_NAME)/cmd/zitadelctl && go build .
	#cp $(LIB_NAME)/$(LIB_NAME) $(LIB_BIN)
this-docker-build:
	cd $(LIB_NAME) && DOCKER_BUILDKIT=1 docker build -f build/dockerfile . -t zitadel:local --build-arg ENV=prod
