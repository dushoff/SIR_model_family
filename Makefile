# SIR_model_family
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: lecture.draft.pdf 

##################################################################

# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md

## Directories
subdirs += data talkdir

data = $(gitroot)/Disease_data/
talkdir = $(ms)/talk/

Makefile: $(ms) $(subdirs)

## includes

include stuff.mk
-include $(ms)/talk.def
-include $(ms)/perl.def

##################################################################

## Slides

Sources += lecture.txt beamer.fmt

lecture.draft.pdf: lecture.txt

Archive += SIR.slides.pdf $(wildcard archive/*)

SIR.slides.pdf: lecture.draft.pdf
	$(copy)

archive/%: SIR.slides.pdf archive 
	$(copy)

archive:
	mkdir $@

##################################################################

## Diagrams

include diagrams/sources.mk

diagrams/%.pdf: /proc/uptime
	cd diagrams && $(MAKE) $*.pdf

##################################################################

## Simulations

### Simple

Sources += exp.R beta.R

#### Not implemented here yet!

Sources += onestoch.pdf onesto.pdf comp0.pdf comp.pdf onedet.pdf

##################################################################

## Pictures

Sources += trans.jpg gd.png R.png

thinker.jpg: 
	wget -O $@ "http://si.smugmug.com/2008/Lighting-experiments/i-9g8KcQZ/1/L/cycladic%20thinker-L.jpg"

stirrer.large.jpg:
	wget -O $@ "http://upload.wikimedia.org/wikipedia/commons/3/32/Magnetic_Stirrer.JPG"

stirrer.jpg: stirrer.large.jpg
	convert -scale 25% $< $@

##################################################################

Sources += $(diagSources:%=diagrams/%)

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
-include $(ms)/newlatex.mk
-include $(ms)/talk.mk
