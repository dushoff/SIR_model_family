%.makestuff:
	-cd $(dir $(ms)) && mv -f $(notdir $(ms)) .$(notdir $(ms))
	cd $(dir $(ms)) && git clone $(msrepo)/$(notdir $(ms)).git
	-cd $(dir $(ms)) && rm -rf .$(notdir $(ms))
	touch $@

msrepo = https://github.com/dushoff
gitroot = ./

-include local.mk
-include $(gitroot)/local.mk
export ms = $(gitroot)/makestuff

## Directories
subdirs += data talkdir

data = $(gitroot)/Disease_data
talkdir = $(ms)/talk

Makefile: $(ms) $(subdirs)

$(ms):
	cd $(dir $(ms)) && git clone $(msrepo)/$(notdir $(ms)).git

check:
	echo $(ms)

$(subdirs): $(ms)
	$(MAKE) -f $(ms)/repos.mk $($@)
	ln -s $($@) $@
