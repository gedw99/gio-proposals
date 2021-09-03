# https://github.com/hajimehoshi/ebiten

print:

dep-os:
	# https://github.com/hajimehoshi/wasmserve
	go install github.com/hajimehoshi/wasmserve@latest
	which wasmserve
	wasmserve -h

	# e.g wasmserve ./path/to/yourgame

dep:
	git clone https://github.com/hajimehoshi/ebiten



#EX=$(PWD)/ebiten/examples/noise

# YES, this does biurnal :) Requires clicking on screen to start sound for soem reason.
EX=$(PWD)/ebiten/examples/audiopanning

# image of noise.. Miht be useful later.
#EX=$(PWD)/ebiten/examples/noise

#EX=$(PWD)/ebiten/examples/wav
# Need example tags 

ex-print:
	@echo EX: $(EX)
ex-run:
	cd $(EX) && go run -tags=example .

ex-run-wasm:
	# works :)
	cd $(EX) && wasmserve -tags=example .
ex-run-wasm-reload:
	# works :)
	curl localhost:8080/_notify