# https://github.com/gioui/gio-example

print:

dep-os:
	go install gioui.org/cmd/gogio@latest
	gogio -h

	https://github.com/nlepage/go-wasm-http-server

dep:
	git clone https://github.com/gioui/gio-example

EX=gio-example/x/haptic

run:
	# Not playing sound
	cd $(EX) && go run .
run-web:
	no JS driver it seems: https://github.com/gioui/gio-x/tree/main/haptic
	cd $(EX) && gogio -target js .
