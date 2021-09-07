MAKE_DEP_SOURCE=./../gio-tools/_make 
MAKE_DEP_TARGET=./_make

print:
	@echo
	@echo MAKE_DEP_SOURCE: $(MAKE_DEP_SOURCE)
	@echo MAKE_DEP_TARGET: $(MAKE_DEP_TARGET)

dep-make:
	cp -r $(MAKE_DEP_SOURCE) $(MAKE_DEP_TARGET)