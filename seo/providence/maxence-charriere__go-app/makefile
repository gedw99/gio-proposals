# https://github.com/maxence-charriere/go-app
# many branches: https://github.com/maxence-charriere/go-app/branches
# v9 is latest, but example wants v6


# https://github.com/maxence-charriere/go-app-demo
# stuck at v6

print:

LIB_NAME=go-app
EX_LIB_NAME=go-app-demo
dep:
	rm -rf $(LIB_NAME)
	git clone https://github.com/maxence-charriere/go-app -b v6

	rm -rf $(EX_LIB_NAME)
	git clone https://github.com/maxence-charriere/go-app-demo -b v6

ex-run:
	# fails.... Is out of sync with go-app....
	cd $(EX_LIB_NAME)/hello && go run .
