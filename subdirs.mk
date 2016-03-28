
## Directories to be linked for latex
data = $(gitroot)/Disease_data
talkdir = $(ms)/talk

data/%: data
	cd data && $(MAKE) $*

$(subdirs): 
	$(MAKE) -f $(ms)/repos.mk gitroot=$(gitroot) $($@)
	-$(RM) $@
	ln -s $($@) $@
