
## Directories to be linked for latex
subdirs += data talkdir
data = $(gitroot)/Disease_data
talkdir = $(ms)/talk

data/%:
	cd data && $(MAKE) $*

Makefile: $(ms)

$(ms):
	cd $(dir $(ms)) && git clone $(msrepo)/$(notdir $(ms)).git

$(subdirs): 
	$(MAKE) -f $(ms)/repos.mk gitroot=$(gitroot) $($@)
	-$(RM) $@
	ln -s $($@) $@