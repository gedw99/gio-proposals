
dep-mod:
	go install github.com/oligot/go-mod-upgrade@latest

mod-check:
	go-mod-upgrade -v
mod-do:
	go get -u
	go mod tidy

server-run:
	cd ./../../providence/blugelabs__beer-search && $(MAKE) run
	# 	http://localhost:8094/?p=1&q=test

client-test:
	go test ./... -v
client-bench:
	go test -bench=. -v
client-screenshot-run:
	go run main.go -screenshot screenshot.png
client-desktop-run:
	go run main.go