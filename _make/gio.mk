# GIO

GIO_BIN=gogio
GIO_WEB_SERVER_BIN=file-server
GIO_COMPILE_DAEMON=compile-daemon

# Override variables
GIO_EX_NAME=?
GIO_EX_PATH=FILEPATH?/$(GIO_EX_NAME)

## gio print, outputs all variables for the gio compiler
gio-print:
	@echo
	@echo ### GIO ###
	@echo GIO_BIN: $(GIO_BIN)
	@echo installed gio at : $(shell which $(GIO_BIN))
	@echo ---
	@echo GIO_WEB_SERVER_BIN: $(GIO_WEB_SERVER_BIN)
	@echo installed web runner at : $(shell which $(GIO_WEB_SERVER_BIN))
	@echo ---
	@echo GIO_COMPILE_DAEMON: $(GIO_COMPILE_DAEMON)
	@echo installed compile-daemon at : $(shell which $(GIO_COMPILE_DAEMON))
	@echo
	@echo GIO_EX_PATH: $(GIO_EX_PATH)
	@echo GIO_EX_NAME: $(GIO_EX_NAME)
	@echo

## gio dep gets the gio and file server and daemon runner
gio-dep:
	@echo
	@echo installing gogio tool
	# https://git.sr.ht/~eliasnaur/gio
	go install gioui.org/cmd/gogio@latest
	@echo installed gio at : $(shell which $(GIO_BIN))

	# FileServer
	@echo
	@echo installing FileServer
	@echo $(PWD)
	cd tools/file-server && go install .
	@echo installed FileServer at : $(shell which $(GIO_COMPILE_DAEMON))
	
	
	# CompileDaemon
	@echo
	@echo installing CompileDaemon
	go install github.com/githubnemo/CompileDaemon@latest
	@echo installed CompileDaemon at : $(shell which $(GIO_COMPILE_DAEMON))
	

### WEB

WEB_BUILD_PATH=build/web/$(GIO_EX_NAME).web
gio-web-print:
	@echo WEB_BUILD_PATH: $(WEB_BUILD_PATH)
gio-web-build:
	cd $(GIO_EX_PATH) && $(GIO_BIN) -o $(WEB_BUILD_PATH) -target js .
gio-web-run:
	cd $(GIO_EX_PATH)/$(WEB_BUILD_PATH) && file-server
gio-web-watch:
	$(GIO_COMPILE_DAEMON) -color -build="$(MAKE) gio-web-build" -command="$(MAKE) gio-web-run"

	
### DESK

### DESK - WINDOWS

# NOT finished
gio-desk-win-pack-init:
	# needs to do what gio-desk-mac-pack-init does
WINDOWS_BUILD_PATH=build/windows/$(GIO_EX_NAME).exe
gio-desk-win-print:
	@echo WINDOWS_BUILD_PATH: $(WINDOWS_BUILD_PATH)
gio-desk-win-build:
	# BUG: component_windows_amd64.syso does not respect the -o path.
	cd $(GIO_EX_PATH) && $(GIO_BIN) -o $(WINDOWS_BUILD_PATH) -target windows .
gio-desk-win-runbuild:
	cd $(GIO_EX_PATH) && $(WINDOWS_BUILD_PATH)
gio-desk-win-watch:
	$(GIO_COMPILE_DAEMON) -color -build="$(MAKE) gio-desk-win-build" -command="$(MAKE) gio-desk-win-runbuild"
	
### DESK - MACOS

MAC_PACK_PATH=build/mac/$(GIO_EX_NAME)
MAC_PACK_NAME=build/mac/$(GIO_EX_NAME).app
MAC_BUILD_PATH=build/mac/$(GIO_EX_NAME).app/Contents/MacOS/$(GIO_EX_NAME)


#MAC_BUILD_PATH=build/mac/$(GIO_EX_NAME)
gio-desk-mac-print:
	@echo MAC_BUILD_PATH: $(MAC_BUILD_PATH)
# NOT finished
gio-desk-mac-pack:
	#go get github.com/JackMordaunt/gopack
	go install git.sr.ht/~jackmordaunt/gopack/cmd/pack@latest
	which pack

gio-desk-mac-pack-init:

	# TODO: Needs mac sign & bundle creation including plist, icons
	# //go:generate mkdir -p example.app/Contents/MacOS
	# //go:generate go build -o example.app/Contents/MacOS/example
	# //go:generate codesign -s - example.app
	# TODO: Same for Windows

	cd $(GIO_EX_PATH) && mkdir -p $(MAC_PACK_PATH).app/Contents/MacOS
	cd $(GIO_EX_PATH) && mkdir -p $(MAC_PACK_PATH).app/Contents/MacOS/$(GIO_EX_NAME)
	cd $(GIO_EX_PATH) && mkdir -p $(MAC_PACK_PATH).app/Contents/MacOS/$(GIO_EX_NAME)


gio-desk-mac-build:
	cd $(GIO_EX_PATH) && go generate .
	cd $(GIO_EX_PATH) && go build -o $(MAC_BUILD_PATH) .
gio-desk-mac-runbuild:
	cd $(GIO_EX_PATH) && $(MAC_BUILD_PATH)
gio-desk-mac-runpacked:
	cd $(GIO_EX_PATH) && open $(MAC_PACK_NAME)
gio-desk-mac-watch:
	$(GIO_COMPILE_DAEMON) -color -build="$(MAKE) gio-desk-mac-build" -command="$(MAKE) gio-desk-mac-runbuild"
	

### IOS

#IOS_BUILD_PATH=build/ios/$(GIO_EX_NAME).ipa

IOS_BUILD_PATH=$(GIO_EX_NAME).ipa
gio-ios-print:
	@echo IOS_BUILD_PATH: $(IOS_BUILD_PATH)
gio-ios-build:
	# nope - needs a provioning profile.
	cd $(GIO_EX_PATH) && $(GIO_BIN) -work -appid gedw99.$(GIO_EX_NAME) -buildmode exe -o $(IOS_BUILD_PATH) -target ios .
gio-ios-install:
	# see: https://www.systutorials.com/docs/linux/man/1-ideviceinstaller/
	# idevice_id -l
	cd $(GIO_EX_PATH) && ideviceinstaller -i $(IOS_BUILD_PATH) --udid bdf90dc799709a013a25d0fc2df80e441df026f3

# Cant use due to a build bug with gogio not respecting the -o path.
#IOS_SIM_BUILD_PATH=build/ios/$(GIO_EX_NAME).app
IOS_SIM_BUILD_PATH=$(GIO_EX_NAME).app

gio-ios-sim-print:
	@echo IOS_SIM_BUILD_PATH: $(IOS_SIM_BUILD_PATH)
gio-ios-sim-build:
	#exe and archive
	# -work IF you want to see the xcode generated.
	cd $(GIO_EX_PATH) && $(GIO_BIN) -work -appid gedw99.$(GIO_EX_NAME) -buildmode exe -o $(IOS_SIM_BUILD_PATH) -target ios .
gio-ios-sim-install:
	cd $(GIO_EX_PATH) && xcrun simctl install booted $(IOS_SIM_BUILD_PATH)



### AND

gio-and-build:
	cd $(GIO_EX_PATH) && $(GIO_BIN) -o $(GIO_EX_NAME).apk -target android .
gio-and-install:
	cd $(GIO_EX_PATH) && adb install $(GIO_EX_NAME).apk