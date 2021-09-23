print:


## go mod tidy
go-mod-tidy:
	go mod tidy
	go mod verify
	
## go mod update
go-mod-update:
	go install github.com/oligot/go-mod-upgrade@latest
	go-mod-upgrade
	go mod tidy
	go mod verify

run-simple:
	cd simple && go run .
	