# https://github.com/restic/restic

# This is the Restic Server and common commands.

# We need a restic Server to test against
# from: https://restic.readthedocs.io/en/latest/020_installation.html

# NOTE all paths are with the full path so that things work properly with make file includes.


# The restic bianry, with the default password added to make things easier for testing.
RESTIC_BIN=restic --password-file $(PWD)/restic-password.txt --cache-dir $(RESTIC_CACHE_FOLDERPATH) --verbose=3

RESTIC_PASSWORD_FILEPATH=$(PWD)/restic-password.txt

# The restic base path for data. Not git committed.
RESTIC_DATA_FOLDERPATH=$(PWD)/restic/_data

# The restic fiel cache
RESTIC_CACHE_FOLDERPATH=$(RESTIC_DATA_FOLDERPATH)/cache

# The restic Repos where we backup to. Used for Use case testing.
RESTIC_REPO_01_FOLDERPATH=$(RESTIC_DATA_FOLDERPATH)/repo/repo01
RESTIC_REPO_02_FOLDERPATH=$(RESTIC_DATA_FOLDERPATH)/repo/repo02

# The restic Bootstrap data to simualte a File system we want to backup, etc
RESTIC_BOOTSTRAP_FOLDERPATH=$(PWD)/restic-bootstrap-testdata

# The folder path we restore to for testing.
RESTIC_RESTORE_FOLDERPATH=$(RESTIC_DATA_FOLDERPATH)/restore

restic-print:
	@echo
	@echo -- restic

	@echo RESTIC_BIN: $(RESTIC_BIN)
	@echo RESTIC_PASSWORD_FILEPATH: $(RESTIC_PASSWORD_FILEPATH)
	@echo RESTIC_DATA_FOLDERPATH: $(RESTIC_DATA_FOLDERPATH)
	@echo RESTIC_CACHE_FOLDERPATH: $(RESTIC_CACHE_FOLDERPATH)
	@echo RESTIC_REPO_01_FOLDERPATH: $(RESTIC_REPO_01_FOLDERPATH)
	@echo RESTIC_REPO_02_FOLDERPATH: $(RESTIC_REPO_02_FOLDERPATH)
	@echo RESTIC_BOOTSTRAP_FOLDERPATH: $(RESTIC_BOOTSTRAP_FOLDERPATH)
	@echo RESTIC_RESTORE_FOLDERPATH: $(RESTIC_RESTORE_FOLDERPATH)
	@echo

restic-dep:
	# for anything else we need on the os.

	
	brew install restic
	which restic
	restic version

restic-status:
	@echo
	@echo Checking repo: $(RESTIC_REPO_01_FOLDERPATH)
	$(RESTIC_BIN) --repo $(RESTIC_REPO_01_FOLDERPATH) check
	@echo
	@echo Checking repo: $(RESTIC_REPO_02_FOLDERPATH)
	$(RESTIC_BIN) --repo $(RESTIC_REPO_02_FOLDERPATH) check
	@echo

restic-repo-delete:
	# delete the repos.
	rm -rf $(RESTIC_DATA_FOLDERPATH)

restic-repo-init: restic-repo-delete
	# create some test repos.
	$(RESTIC_BIN) init --repo $(RESTIC_REPO_01_FOLDERPATH)
	$(RESTIC_BIN) init --repo $(RESTIC_REPO_02_FOLDERPATH)

restic-repo-backup:
	# backs up from our Bootsrap folder
	@echo
	@echo Backing up files to repos ...

	@echo
	@echo Repo 01
	$(RESTIC_BIN) --repo $(RESTIC_REPO_01_FOLDERPATH) backup $(RESTIC_BOOTSTRAP_FOLDERPATH)

	@echo
	@echo Repo 02
	$(RESTIC_BIN) --repo $(RESTIC_REPO_02_FOLDERPATH) backup $(RESTIC_BOOTSTRAP_FOLDERPATH)

	$(MAKE) restic-repo-list-snapshots

restic-repo-mount:
	# to mount the repository via fuse and browse the files from previous snapshots.

RESTIC_REPO_01_SNAPSHOT_ID=3f58deb0418efb0d597173f11988e9e36c08cbc629a642364358df3a6c33de87
RESTIC_REPO_02_SNAPSHOT_ID=fda4e366657e8793ae115ef9072a243c1f1d375a580a81ff3e60c53a3d6e8b46
restic-repo-restore:
	# restore from a repo to the file system.
	# needs a snapshot , so run MAKE restic-repo-list-snapshots, and then update 
	@echo
	@echo Restoring ...

	@echo
	@echo Repo 01
	$(RESTIC_BIN) --repo $(RESTIC_REPO_01_FOLDERPATH) restore --target $(RESTIC_RESTORE_FOLDERPATH)/repo01 $(RESTIC_REPO_01_SNAPSHOT_ID)

	@echo
	@echo Repo 02
	$(RESTIC_BIN) --repo $(RESTIC_REPO_02_FOLDERPATH) restore --target $(RESTIC_RESTORE_FOLDERPATH)/repo02 $(RESTIC_REPO_02_SNAPSHOT_ID)


### List operations

restic-repo-list:
	# lists objects in a repo [blobs|packs|index|snapshots|keys|locks]
	
	$(MAKE) restic-repo-list-blobs

	$(MAKE) restic-repo-list-packs

	$(MAKE) restic-repo-list-indexes

	$(MAKE) restic-repo-list-snapshots
	
	$(MAKE) restic-repo-list-keys

	$(MAKE) restic-repo-list-locks

restic-repo-list-blobs:
	@echo
	@echo Blob Objects

	@echo
	@echo Repo 01
	$(RESTIC_BIN) --repo $(RESTIC_REPO_01_FOLDERPATH) list blobs
	@echo
	@echo Repo 02
	@$(RESTIC_BIN) --repo $(RESTIC_REPO_02_FOLDERPATH) list blobs

restic-repo-list-packs:
	@echo
	@echo Packs Objects
	@echo
	@echo Repo 01
	@$(RESTIC_BIN) --repo $(RESTIC_REPO_01_FOLDERPATH) list packs
	@echo
	@echo Repo 02
	@$(RESTIC_BIN) --repo $(RESTIC_REPO_02_FOLDERPATH) list packs

restic-repo-list-indexes:
	@echo
	@echo Index Objects
	@echo
	@echo Repo 01
	@$(RESTIC_BIN) --repo $(RESTIC_REPO_01_FOLDERPATH) list index
	@echo
	@echo Repo 02
	@$(RESTIC_BIN) --repo $(RESTIC_REPO_02_FOLDERPATH) list index

restic-repo-list-snapshots:
	@echo
	@echo Listing Snapshot Objects

	@echo
	@echo Repo 01
	@$(RESTIC_BIN) --repo $(RESTIC_REPO_01_FOLDERPATH) list snapshots
	@echo
	@echo Repo 02
	@$(RESTIC_BIN) --repo $(RESTIC_REPO_02_FOLDERPATH) list snapshots

restic-repo-list-keys:
	@echo
	@echo Key Objects
	@echo
	@echo Repo 01
	@$(RESTIC_BIN) --repo $(RESTIC_REPO_01_FOLDERPATH) list keys
	@echo
	@echo Repo 02
	@$(RESTIC_BIN) --repo $(RESTIC_REPO_02_FOLDERPATH) list keys

restic-repo-list-locks:
	@echo
	@echo Locks Objects
	@echo
	@echo Repo 01
	@$(RESTIC_BIN) --repo $(RESTIC_REPO_01_FOLDERPATH) list locks
	@echo
	@echo Repo 02
	@$(RESTIC_BIN) --repo $(RESTIC_REPO_02_FOLDERPATH) list locks


	
