# https://github.com/tdewolff/canvas

print:

LIB_NAME=canvas
dep:
	git clone https://github.com/tdewolff/canvas

dep-go-mod-upgrade:
	go install github.com/oligot/go-mod-upgrade@latest

mod-latex-check:
	cd latex && go-mod-upgrade

mod-latex-do:
	cd latex && go get -u
	cd latex && go mod tidy

ex-latex-run:
	# works :)
	cd latex && go run .

mod-canvas-check:
	cd $(LIB_NAME) && go-mod-upgrade

mod-canvas-do:
	cd $(LIB_NAME) && go get -u
	cd $(LIB_NAME) && go mod tidy


ex-run-canvas:
	# Works, but We DONT want this.
	cd $(LIB_NAME)/examples/html-canvas && go run .
	# does everything and opens browser...

ex-run-gio:
	# Not bad....Has alot of GIO carried over.
	# Fails at runtime...related to https://github.com/go-latex/latex
	cd $(LIB_NAME)/examples/gio && go run -tags latex main.go
	#cd $(LIB_NAME)/examples/gio && go build main.go

	cd $(LIB_NAME)/examples/gio && ./main
	
ex-run-image:
	# works and outputs a png
	cd $(LIB_NAME)/examples/document && go run main.go
	code $(LIB_NAME)/examples/document/out.png

ex-run-map:
	# works and outputs a png
	cd $(LIB_NAME)/examples/map && go run main.go
	code $(LIB_NAME)/examples/map/out.png