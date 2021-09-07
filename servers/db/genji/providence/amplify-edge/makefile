# https://github.com/amplify-edge/sys

print:

SYS_SHARE_LIB_FOLDERPATH=$(PWD)/sys-share
SYS_LIB_FOLDERPATH=$(PWD)/sys

dep:
	# tools
	rm -rf booty
	git clone https://github.com/amplify-edge/booty

	# shared code needed
	rm -rf sys-share
	git clone https://github.com/amplify-edge/sys-share

	# sys itself
	rm -rf sys
	git clone https://github.com/amplify-edge/sys

booty-install:
	# puts in /usr/local/bin/
	# /usr/local/bin/booty
	# ?
	cd $(SYS_SHARE_LIB_FOLDERPATH) && $(MAKE) dep
booty-list:
	booty list-installed
	booty update-all

sys-share-build:
	

	cd $(SYS_SHARE_LIB_FOLDERPATH) && $(MAKE) build


sys-dep:
	cd $(LIB_FOLDERPATH) && $(MAKE) dep
	# booty places many binaries in your usr path, that are needed for code gen and running the system.
	# - caddy, graphana, victoria metrics, and many other.

sys-all-build:
	cd $(LIB_FOLDERPATH) && $(MAKE) all

sys-core-build:
	cd $(LIB_FOLDERPATH)/sys-core && $(MAKE) all

sys-account-build:
	cd $(LIB_FOLDERPATH)/sys-account && $(MAKE) all