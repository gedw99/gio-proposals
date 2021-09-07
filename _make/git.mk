### GIT

# Variables overridable
GIT_NAME:=?
GIT_ORG:=?
GIT_SERVER:=?
GIT_BRANCH:=?

# File Paths overridable
# 
# the path above the git repo. Modify this checkout different branches to different folders
GIT_WORK_FSPATH=$(PWD)
# the path of the final git repo.
GIT_REPO_FSPATH=$(GIT_WORK_FSPATH)/$(GIT_NAME)

# Auth details overridable
GIT_ORIGIN_USER:=?
GIT_ORIGIN_EMAIL:=?
GIT_SSH_USER:=?

# Variables calculated at runtime
GIT_SHA    = $(shell cd $(GIT_REPO_FSPATH) && git rev-parse --short HEAD)
GIT_TAG    = $(shell cd $(GIT_REPO_FSPATH) && git describe --tags --abbrev=0 --exact-match 2>/dev/null)
GIT_DIRTY  = $(shell cd $(GIT_REPO_FSPATH) && test -n "`git status --porcelain`" && echo "dirty" || echo "clean")


## git print
git-print:
	@echo
	@echo -- GIT --
	@echo GIT_NAME: 			$(GIT_NAME)
	@echo GIT_ORG:				$(GIT_ORG)
	@echo GIT_SERVER:			$(GIT_SERVER)
	@echo GIT_BRANCH: 			$(GIT_BRANCH)

	@echo GIT_WORK_FSPATH: 		$(GIT_WORK_FSPATH)
	@echo GIT_REPO_FSPATH: 		$(GIT_REPO_FSPATH)

	@echo GIT_ORIGIN_USER: 		$(GIT_ORIGIN_USER)
	@echo GIT_ORIGIN_EMAIL: 	$(GIT_ORIGIN_EMAIL)
	@echo GIT_SSH_USER: 		$(GIT_SSH_USER)


### REPO ###


## git clone origin
git-repo-clone-origin:
	# works :)
	# assuming you have forked upstream
	mkdir -p $(GIT_WORK_FSPATH)
	cd $(GIT_WORK_FSPATH) && git clone git@$(GIT_SSH_USER):$(GIT_ORIGIN_USER)/$(GIT_NAME) -b $(GIT_BRANCH)

	$(MAKE) git-repo-clone-origin-post

	$(MAKE) git-open-config

## git clone upstream
git-repo-clone-upstream:
	mkdir -p $(GIT_WORK_FSPATH)
	cd $(GIT_WORK_FSPATH) && git clone ssh://git@$(GIT_SERVER) -b $(GIT_BRANCH)

	$(MAKE) git-open-config

## git delete the repro
git-repo-delete:
	rm -rf $(GIT_WORK_FSPATH)

# modifies the git config to include the upstream remote and your credentials. Typically used after you have clone your origin.
git-repo-clone-origin-post:
	# update the .git/config with upstream info so you can easily sync upstream
	#cd $(PWD)/$(GIT_NAME) && git remote add upstream ssh://git@github.com:$(GIT_ORG)/$(GIT_NAME).git 
	cd $(GIT_REPO_FSPATH) && git remote add upstream git@github.com:$(GIT_ORG)/$(GIT_NAME).git 
	# update user and user email
	cd $(GIT_REPO_FSPATH) && git config user.name $(GIT_ORIGIN_USER)
	cd $(GIT_REPO_FSPATH) && git config user.email $(GIT_ORIGIN_EMAIL)

## git open config, so you can check the git config.
git-open-config:
	code $(GIT_REPO_FSPATH)/.git/config




## git status, to see what has changed.
git-status-print:
	@echo
	@echo -- GIT BRANCH:
	@cd $(GIT_REPO_FSPATH) && git branch --show-current
	@echo

	@echo
	@echo -- GIT REMOTES:
	@cd $(GIT_REPO_FSPATH) && git remote -v
	@echo

	@echo
	@echo --- GIT STATUS:
	cd $(GIT_REPO_FSPATH) && git status
	@echo

	

## git version, so see version info.
git-version-print:
	@echo
	@echo --- GIT version ---
	@echo GIT_SHA: 				$(GIT_SHA)
	@echo GIT_TAG: 				$(GIT_TAG)
	@echo GIT_DIRTY: 			$(GIT_DIRTY)
	@echo

### OPERATIONS ###

## git pull from upstream, to get changes others have made.
git-pull-upstream:
	cd $(GIT_REPO_FSPATH) && git fetch upstream

	cd $(GIT_REPO_FSPATH) && git merge upstream/$(GIT_BRANCH)

## git add changes, to stage all changes.
git-add:
	cd $(GIT_REPO_FSPATH) && git add -A 
	cd $(GIT_REPO_FSPATH) && git status

## git commit changes, to commit all staged changes.
GIT_COMMENT=?
git-commmit:
	cd $(GIT_REPO_FSPATH) && git commit -m '$(GIT_COMMENT)'
	cd $(GIT_REPO_FSPATH) && git status

## git push PR to origin, to push your committed changes.
git-push-origin:
	cd $(GIT_REPO_FSPATH) && git push origin $(GIT_BRANCH)

