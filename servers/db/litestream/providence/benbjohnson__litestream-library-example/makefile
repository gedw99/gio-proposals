# https://github.com/benbjohnson/litestream-library-example

# TODO: setup these resources. litestream.yml ?
CONFIG_DSN=?
CONFIG_BUCKET=?


print:
	@echo

	@echo CONFIG_DSN: $(CONFIG_DSN)
	@echo CONFIG_BUCKET: $(CONFIG_BUCKET)

LIB=litestream-library-example
dep:
	git clone https://github.com/benbjohnson/litestream-library-example

BIN=$(PWD)/_dist/$(LIB)
build:
	cd $(LIB) && go build -o $(BIN)
run:
	$(BIN) -dsn $(CONFIG_DSN) -bucket $(CONFIG_BUCKET)
	# http://localhost:8080

uc-file:
	# TODO: https://github.com/benbjohnson/litestream/blob/main/cmd/litestream/main_test.go#L12
uc-minio:
	# TODO: https://github.com/benbjohnson/litestream/blob/main/cmd/litestream/main_test.go#L133
uc-googlestorage:
	# TODO: https://github.com/benbjohnson/litestream/blob/main/cmd/litestream/main_test.go#L13
uc-backblaze:
	# TODO: https://github.com/benbjohnson/litestream/blob/main/cmd/litestream/main_test.go#L152
