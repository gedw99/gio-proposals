
LIB_NAME=hackpadfs
dep:
	rm -rf $(LIB_NAME)
	git clone ssh://git@github.com/hack-pad/hackpadfs -b main

dep-mod:
	go install github.com/oligot/go-mod-upgrade@latest

mod-check:
	cd $(LIB_NAME) && go-mod-upgrade
mod-do:
	cd $(LIB_NAME) && go get -u
	cd $(LIB_NAME) && go mod tidy
	
run:
	# works :)
	cd $(LIB_NAME) && go run .
	http://localhost:8094/?p=1&q=test



