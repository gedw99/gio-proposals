# https://github.com/mitranim/rout

all: dep test bench

print:

dep:
	rm 
	git clone https://github.com/mitranim/rout

test:
	cd rout && go test -v ./... 
bench:
	cd rout && go test -v -bench=. -benchtime=20s