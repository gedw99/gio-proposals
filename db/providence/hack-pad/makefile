print:

all: dep lint test

dep:
	rm -rf hackpadfs
	git clone https://github.com/hack-pad/hackpadfs
	
### Hackfs 

# THis exercises both the FS and DB aspects..

test:
	cd hackpadfs && $(MAKE) test
lint:
	cd hackpadfs && $(MAKE) lint

### Demo

demo-repl-run:
	# This is a repl cli that runs In Web, Desktop and Mobile
	# Tested in Web and Desktop. Not tested in mobile yet.
	cd demo && go run .