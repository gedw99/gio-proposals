# https://github.com/SpectralOps/teller

print:

PROVIDER_DOTENV_BIN=godotenv
dep-os:
	# env provider
	go install github.com/joho/godotenv/cmd/godotenv@latest
	which $(PROVIDER_DOTENV_BIN)
	$(PROVIDER_DOTENV_BIN) -h

LIB=teller
dep:
	rm -rf cryptr
	git clone https://github.com/SpectralOps/teller

BIN_FOLDERPATH=$(GOPATH)/bin
BIN_NAME=teller
BIN_FULLPATH=$(BIN_FOLDERPATH)/$(BIN_NAME)

build:
	cd $(LIB) && go build -o $(BIN_FULLPATH) .
run:
	$(BIN_FULLPATH) -h

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

	# make provider files
	touch $(HOME)/my-dot-env.env

	cd $(NEW_RUN_FOLDERPATH) && $(BIN_FULLPATH) new -h

	cd $(NEW_RUN_FOLDERPATH) && $(BIN_FULLPATH) new -c $(NEW_RUN_FILE)

	cd $(NEW_RUN_FOLDERPATH) && $(BIN_FULLPATH) show -c $(NEW_RUN_FILE)





fixtures-run:
	cd $(LIB)/fixtures/sync && $(BIN_FULLPATH) version

	cd $(LIB)/fixtures/sync && $(BIN_FULLPATH) yaml