# https://github.com/maxence-charriere/go-app
# many branches: https://github.com/maxence-charriere/go-app/branches
# v9 


# https://github.com/maxence-charriere/lofimusic
# master

print:

LIB_NAME=go-app
EX_LIB_NAME=lofimusic
dep:
	rm -rf $(LIB_NAME)
	git clone https://github.com/maxence-charriere/go-app -b v9

	rm -rf $(EX_LIB_NAME)
	git clone https://github.com/maxence-charriere/lofimusic -b master

ex-run:
	cd $(EX_LIB_NAME) && $(MAKE) build
	cd $(EX_LIB_NAME) && $(MAKE) run
