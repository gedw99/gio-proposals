

dep:
	git clone ssh://git@github.com/blugelabs/beer-search -b master

dep-mod:
	go install github.com/oligot/go-mod-upgrade@latest

mod-check:
	cd beer-search && go-mod-upgrade
mod-do:
	cd beer-search && go get -u
	cd beer-search && go mod tidy
	
run:
	# works :)
	cd beer-search && go run .
	http://localhost:8094/?p=1&q=test



