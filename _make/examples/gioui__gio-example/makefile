
# https://github.com/gioui/gio-example
# fork: https://github.com/gedw99/gio-example

MAKE_FOLDERSPATH=./../..
include $(MAKE_FOLDERSPATH)/help.mk
include $(MAKE_FOLDERSPATH)/git.mk
include $(MAKE_FOLDERSPATH)/go.mk
include $(MAKE_FOLDERSPATH)/gcloud.mk
include $(MAKE_FOLDERSPATH)/env.mk		# Last so that other dont override it
include $(MAKE_FOLDERSPATH)/gio.mk
include $(MAKE_FOLDERSPATH)/mob.mk

GIT_NAME=gio-example
GIT_ORG=gioui
GIT_SERVER=github.com/$(GIT_ORG)/$(GIT_NAME)
GIT_BRANCH=main

# toggle to work with different branches on the file system.
# use different folders for each branch.
GIT_WORK_FSPATH=$(PWD)/origin
#GIT_WORK_FSPATH=$(PWD)/upstream


#GO_EX=$(GIT_REPO_FSPATH)/cmd/gogio
#GO_BIN=$(GOPATH)/bin/gogio

this-print: git-print

this-dep-os:
	# install gogio and commander
	$(MAKE) gio-dep

GIO_EX_NAME=tabs
GIO_EX_PATH=$(GIT_WORK_FSPATH)/$(GIT_NAME)/$(GIO_EX_NAME)

this-git-update:
	# get latest



# all below work :)
this-test:
	cd $(GIO_EX_PATH) && go test -v ./...
this-build:
	$(MAKE) gio-desk-mac-build
this-run: this-build
	$(MAKE) gio-desk-mac-runbuild 

this-web-build:
	$(MAKE) gio-web-build
this-web-run: this-web-build
	$(MAKE) gio-web-run