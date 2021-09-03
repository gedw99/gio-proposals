bold := $(shell tput bold)
sgr0 := $(shell tput sgr0)

include env.mk

print:
	@echo 'CLI templater in golang - $(bold)bold text$(sgr0)'

dep-cli-local:
	# local 
	@echo
	@echo '$(bold)-- local installing source and compiling into go bin$(sgr0)'
	rm -rf cli
	git clone https://github.com/create-go-app/cli
	$(MAKE) dep-tools
	cd cli && $(MAKE) install
	cgapp -v

dep-cli-remote:
	# remote
	@echo
	@echo '$(bold)-- remote installing binary into go bin$(sgr0)'
	go install github.com/create-go-app/cli/v2/cmd/cgapp@latest
	cgapp -v

dep-tools:
	@echo
	@echo '$(bold)-- go migrate for apply migrations$(sgr0)'
	go install -tags 'sqlite' github.com/golang-migrate/migrate/v4/cmd/migrate@latest
	go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest
	migrate -version

	@echo 
	@echo '$(bold)-- swag for auto-generating Swagger API docs$(sgr0)'
	go get -u github.com/swaggo/swag/cmd/swag
	swag -v

	@echo
	@echo '$(bold)-- gosec for checking Go security issues$(sgr0)'
	go get -u github.com/securego/gosec/v2/cmd/gosec
	gosec -version

	@echo
	@echo '$(bold)-- goreleaser for easy releasers$(sgr0)'
	go install github.com/goreleaser/goreleaser@latest
	goreleaser -v

### EX

EX_PATH=$(PWD)/ex

create-ex-promt:
	
	# backend: https://github.com/create-go-app/net_http-go-template
	@echo
	@echo '$(bold)-- creatign example project$(sgr0)'
	rm -rf $(EX_PATH)
	mkdir $(EX_PATH)
	cd $(EX_PATH) && cgapp create

create-ex-specific:
	
	# backend: https://github.com/create-go-app/net_http-go-template
	@echo
	@echo '$(bold)-- creatign example project$(sgr0)'
	rm -rf $(EX_PATH)
	mkdir $(EX_PATH)
	cd $(EX_PATH) && cgapp create -t net_http-go-template





ex-migate:
	cd $(EX_PATH)/backend && $(MAKE) migrate.up
ex-build:
	cd $(EX_PATH)/backend && $(MAKE) build
ex-run:
	cd $(EX_PATH)/backend && $(MAKE) run
