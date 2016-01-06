
msrepo = https://github.com/dushoff
gitroot = ./

-include local.mk
-include $(gitroot)/local.mk
export ms = $(gitroot)/makestuff

newdir:
	$(MAKE) Makefile
	$(MAKE) lecture.draft.tex.deps

$(ms)/linux.mk: $(ms)
ifeq ($(shell uname), Linux)
include $(ms)/linux.mk
endif
