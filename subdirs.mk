
## Directories
subdirs += data talkdir

data = $(gitroot)/Disease_data
talkdir = $(ms)/talk

Makefile: $(ms)

$(ms):
	cd $(dir $(ms)) && git clone $(msrepo)/$(notdir $(ms)).git

SIR.slides.pdf: $(subdirs)

$(subdirs): 
	$(MAKE) -f $(ms)/repos.mk $($@)
	-$(RM) $@
	ln -s $($@) $@

