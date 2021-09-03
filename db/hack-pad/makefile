print:

dep-all: dep-hackpadfs dep-hackpad

dep-hackpadfs:
	rm -rf hackpadfs
	git clone https://github.com/hack-pad/hackpadfs

	# uses github.com/hack-pad/go-indexeddb

dep-hackpad:
	# exampel app that needs special golang.
	rm -rf hackpad
	git clone https://github.com/hack-pad/hackpad

hackpadfs-test:
	cd hackpadfs && $(MAKE) test
hackpadfs-build:
	cd hackpadfs && go build .