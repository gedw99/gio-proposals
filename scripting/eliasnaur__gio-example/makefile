# https://git.sr.ht/~eliasnaur/gio-example/tree/livedit

print:

dep:
	rm -rf gio-example
	git clone https://git.sr.ht/~eliasnaur/gio-example -b livedit


LIB_PATH=gio-example/livedit

WORK_PATH=$(PWD)/_work

BIN_PATH=$(PWD)/_dist
BIN_NAME=gio-livedit

build:
	mkdir -p $(WORK_PATH)
	mkdir -p $(BIN_PATH)
	
	# cd $(LIB_PATH) && go build -o $(BIN_PATH)/$(BIN_NAME) .
	cd $(LIB_PATH) && gogio -target js -x -work $(WORK_PATH)  -o $(BIN_PATH)/$(BIN_NAME) .
	cd $(LIB_PATH) && gogio -target js -o $(BIN_PATH)/$(BIN_NAME) .
	
	# copy assets to disk
	cd $(LIB_PATH) && cp -r *.png $(BIN_PATH)

mod-upgrade:
	# manually change to 1.17 and save it.
	cd gio-example && go mod tidy

	# This fixed CPU usage issues well.. easy.
run:
	# works :)
	# can edit golang live and see update live.
	
	$(BIN_PATH)/$(BIN_NAME)