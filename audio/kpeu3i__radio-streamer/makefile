# https://github.com/kpeu3i/radio-streamer

# uses oto v2

print:


dep:
	git clone https://github.com/kpeu3i/radio-streamer


EX=$(PWD)/radio-streamer


ex-print:
	@echo EX: $(EX)
ex-run:
	cd $(EX) && go run .

ex-run-wasm:
	# works :)
	cd $(EX) && wasmserve -tags=example .
ex-run-wasm-reload:
	# works :)
	curl localhost:8080/_notify