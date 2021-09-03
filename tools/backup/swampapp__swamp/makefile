# https://github.com/swampapp/swamp

include restic.mk

print: bin-server-print bin-cli-print bin-keyring-print restic-print
	@echo

LIB=swamp
dep-all: restic-dep
	rm -rf swamp
	git clone https://github.com/swampapp/swamp

# We put all the binaries into the GOPATH... 
build-all: bin-server-build bin-cli-build bin-keyring-build




BIN_SERVER_FOLDERPATH=$(GOPATH)/bin
BIN_SERVER_NAME=swamp-server
BIN_SERVER_FULLPATH=$(BIN_SERVER_FOLDERPATH)/$(BIN_SERVER_NAME)
bin-server-print:
	@echo
	@echo BIN_SERVER_FULLPATH: $(BIN_SERVER_FULLPATH)
bin-server-build:
	cd $(LIB)/cmd/swampd && go build -o $(BIN_SERVER_FULLPATH) .
bin-server-run:
	$(BIN_SERVER_FULLPATH) -h


BIN_CLI_FOLDERPATH=$(GOPATH)/bin
BIN_CLI_NAME=swamp-cli
BIN_CLI_FULLPATH=$(BIN_CLI_FOLDERPATH)/$(BIN_CLI_NAME)
bin-cli-print:
	@echo
	@echo BIN_CLI_FULLPATH: $(BIN_CLI_FULLPATH)
bin-cli-build:
	cd $(LIB)/cmd/swp && go build -o $(BIN_CLI_FULLPATH) .
bin-cli-run:
	$(BIN_CLI_FULLPATH) -h


BIN_KEYRING_FOLDERPATH=$(GOPATH)/bin
BIN_KEYRING_NAME=swamp-keyring
BIN_KEYRING_FULLPATH=$(BIN_KEYRING_FOLDERPATH)/$(BIN_KEYRING_NAME)
bin-keyring-print:
	@echo
	@echo BIN_KEYRING_FULLPATH: $(BIN_KEYRING_FULLPATH)
bin-keyring-build:
	cd $(LIB)/cmd/keyring && go build -o $(BIN_KEYRING_FULLPATH) .
bin-keyring-run:
	$(BIN_KEYRING_FULLPATH) -h



### Use cases

USE_CASE_FOLDERPATH=$(PWD)/usecase


NEW_RUN_FOLDERPATH=$(USE_CASE_FOLDERPATH)/new-run
NEW_RUN_FILE=$(NEW_RUN_FOLDERPATH)/.teller.yml

uc-new-run-delete:
	rm -rf $(NEW_RUN_FOLDERPATH)
uc-new-run-help: 
	cd $(NEW_RUN_FOLDERPATH) && $(BIN_FULLPATH) new -h
uc-new-run: uc-new-run-delete
	# Make from nothing

	mkdir -p $(NEW_RUN_FOLDERPATH)

	# Step 1: add a restic repo 
	$(BIN_CLI_FULLPATH) add-repo --preferred $(NEW_RUN_FOLDERPATH)/_data/restic-repo
	# Repository Name: test
	# ✔ Local/Rest
	# ✔ Repository URI:  ./swamp/_data/restic-repo
	# Repository Password: *
	# Testing repository access...✅
	# Added!
	# Now you should open swamp, select the repository and manually index it.

	# Step 2: search therestic repo 
	$(BIN_CLI_FULLPATH) search --repo $(NEW_RUN_FOLDERPATH)/_data/restic-repo 




