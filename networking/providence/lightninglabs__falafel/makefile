# https://github.com/lightninglabs/falafel

print:

dep:
	rm -rf falafel
	git clone https://github.com/lightninglabs/falafel

LIB_PATH=$(PWD)/falafel

BIN_PATH=$(GOPATH)/bin
BIN_NAME=falafel

lib-build:
	cd $(LIB_PATH) && go build -o $(BIN_PATH)/$(BIN_NAME) .
	which falafel
lib-run:
	$(BIN_PATH)/$(BIN_NAME) -v


### EX

# The path to the falafel custom proto generator..
PROTO_PLUGIN_PATH=$(shell which falafel)

# The folderpath to the third party google apis.
GRPC_GATEWAY_GOOGLEAPIS_PATH=$(PWD)/grpc-gateway/third_party/googleapis



# The folderpath to place the generated golang code.
EX_CUSTOM_OUT_BUILD_PATH=$(PWD)/build

# The folderpath to the proto files to gen from.
PROTO_PATH=$(PWD)/lnd/lnrpc

# The filenames of the protos to gen from.
EX_PROTOS="lightning.proto walletunlocker.proto stateservice.proto"
EX_PROTOS="lightning.proto"

# Name of the package for the generated APIs.
EX_PKG=lndmobile

# The package where the protobuf definitions originally are found.
EX_TARGET_PKG=github.com/lightningnetwork/lnd/lnrpc

# A mapping from grpc service to name of the custom listeners. The grpc server
# must be configured to listen on these.
EX_LISTENERS=lightning=lightningLis walletunlocker=walletUnlockerLis
EX_LISTENERS=lightning=lightningLis

# Set to 1 to create boiler plate grpc client code and listeners. If more than
# one proto file is being parsed, it should only be done once.
EX_MEM_RPC=1

EX_OPTS="package_name=$(EX_PKG),target_package=$(EX_TARGET_PKG),listeners=$(EX_LISTENERS),mem_rpc=$(EX_MEM_RPC)"

ex-dep-os:
	# Its needs the google apis.... from here...
	rm -rf grpc-gateway
	git clone https://github.com/grpc-ecosystem/grpc-gateway -b v1

ex-dep:
	# Its needs the protos and listeners from here.
	rm -rf lnd
	git clone https://github.com/lightningnetwork/lnd

ex-print:
	@echo ex
	@echo GRPC_GATEWAY_GOOGLEAPIS_PATH: $(GRPC_GATEWAY_GOOGLEAPIS_PATH)
	@echo PROTO_PLUGIN_PATH - falafel : $(PROTO_PLUGIN_PATH)
	@echo PROTO_PATH: $(PROTO_PATH)
	@echo EX_OPTS: $(EX_OPTS)

ex-gen:

	mkdir -p $(EX_CUSTOM_OUT_BUILD_PATH)
	protoc -I/usr/local/include -I. \
		-I$(GRPC_GATEWAY_GOOGLEAPIS_PATH) \
		--plugin=protoc-gen-custom=$(PROTO_PLUGIN_PATH)\
		--custom_out=$(EX_CUSTOM_OUT_BUILD_PATH) \
		--custom_opt=$(EX_OPTS) \
		--proto_path=$(PROTO_PATH) \
		$(EX_PROTOS)
