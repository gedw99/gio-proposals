# https://github.com/tinygo-org/bluetooth

# Not wokring: My issue: https://github.com/tinygo-org/bluetooth/issues/48

print:

hack:
	# manually give permisssions on mac like in screenshot screenshot-mac-bluetooth-settings.jpg

dep:
	rm -rf bluetooth
	git clone https://github.com/tinygo-org/bluetooth -b dev

EX_BIN_FOLDERPATH=$(PWD)/_dist

ex-scanner:
	cd bluetooth/examples/scanner && go build -o $(EX_BIN_FOLDERPATH)/scanner .
	cd $(EX_BIN_FOLDERPATH) && ./scanner

ex-discover:
	cd bluetooth/examples/discover && go build -o $(EX_BIN_FOLDERPATH)/discover .
	cd $(EX_BIN_FOLDERPATH) && ./discover EE:74:7D:C9:2A:68

