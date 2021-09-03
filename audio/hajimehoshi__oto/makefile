# https://github.com/hajimehoshi/oto

print:

dep-os:
	# https://github.com/hajimehoshi/wasmserve
	go install github.com/hajimehoshi/wasmserve@latest
	which wasmserve
	wasmserve -h

	# e.g wasmserve ./path/to/yourgame

dep:
	git clone https://github.com/hajimehoshi/oto


EX=$(PWD)/oto/example


ex-print:
	@echo EX: $(EX)
ex-run:
	# works
	cd $(EX) && go run -tags=example .

ex-run-wasm:
	# not playing. I guess not designed for wasm
	cd $(EX) && wasmserve -tags=example .
ex-run-wasm-reload:
	# works :)
	curl localhost:8080/_notify