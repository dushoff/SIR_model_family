# SIR_model_family
### Hooks for the editor to set the default target

current:target
-include target.mk

##################################################################

# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md

## includes

include stuff.mk
-include $(ms)/newtalk.def
-include $(ms)/perl.def

##################################################################

## Slides

Sources += lecture.txt beamer.fmt

lecture.draft.pdf: lecture.txt

# Archive += SIR.slides.pdf
Archive += $(wildcard archive/*)

SIR.slides.pdf: $(subdirs) lecture.draft.pdf
	$(CP) lecture.draft.pdf $@

archive/%: SIR.slides.pdf archive 
	$(copy)

archive:
	mkdir $@

##################################################################

Sources += boxes.tex vectors.tex tikzlib.tex sir.tex sirodes.tex sirs.tex sirbd.tex msir.tex seir.tex seird.tex three.tex threepage.tex fourpage.tex brides.tex nopoint.pl Makefile sources.mk

## Seems not to chain right with three. (I had to  make an intermediate manually)
%.np.tex: %.tex
	perl -ne 'print unless /isipoint/' $< > $@

%.three.tex: three.tex %.tex
	perl -npe 's/figtmp/$*/' $< > $@

%.four.tex: four.tex %.tex
	perl -npe 's/figtmp/$*/' $< > $@

four.tex: three.tex 
	perl -npe 's/threepage/fourpage/' $< > $@

# Remove (N) from β for less intimidation
sirodes.const.tex: sirodes.tex 
	perl -npe 's/\(N\)//' $< > $@

diagrams/%: diagrams
	cd diagrams && $(MAKE) $*

brides.four.pdf:

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

mmed_push: lecture.draft.pdf
	/bin/cp -f $< ~/git/MMED2016/pages/lectures/FoundationsDM.pdf

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
-include $(ms)/newlatex.mk
-include $(ms)/newtalk.mk
