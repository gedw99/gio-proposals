### VSCODE make file

vscode-print:
	@echo
	@echo --- VSCODE ---
	@echo LIB_NAME: $(LIB_NAME)
	@echo LIB_BRANCH: $(LIB_BRANCH)
	@echo 
	
vscode-open:
	# opens the project, so you can debug it, etc
	code $(LIB_NAME)