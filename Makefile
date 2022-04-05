# SIR_model_family; diagrams relating to disease sims, but no sims
## This is SIR_model_family, a screens project directory
## makestuff/project.Makefile

current: target
-include target.mk

# include makestuff/perl.def

######################################################################

## To do: 

#### Clean out the talk stuff from this directory and make it a place for SIR modeling resources

#### Find the C code for the onestoch family of pictures and put it here. Or somewhere …

# make files

## includes

-include $(ms)/newtalk.def
-include $(ms)/perl.def

##################################################################

Archive += $(wildcard archive/*)

##################################################################

## Simple R pictures for associated talks

Sources += $(wildcard *.R)

## Exponential and gamma survival
survival.Rout: survival.R

## Phenomenological heterogeneity
phen.Rout: phen.R

## What to do about svg images in new image world?
Ignore += network.png network.svg
network.png: network.svg
	convert $< $@

network.svg:
	wget -O $@ "http://upload.wikimedia.org/wikipedia/commons/6/68/Social-network.svg"

## Simpson mixing illustration

simpson.Rout: simpson.R

##################################################################

### Testing quick diagram

quick.pdf: quick.tex

##################################################################

## Make pictures with boxes, and associated equations; this was mostly me trying to learn tikz, without much success.

## Not really ordered 
Sources += boxes.tex vectors.tex tikzlib.tex sir.tex
Sources += sirs.tex sirbd.tex msir.tex seir.tex seird.tex three.tex threepage.tex fourpage.tex brides.tex nopoint.pl Makefile sources.mk

## Equation diagrams
Sources += sirodes.tex sirbdodes.tex sirbdrates.tex

## sirbdrates.pdf: sirbdrates.tex
## sirbdodes.pdf: sirbdodes.tex

## Seems not to chain right with three. (I had to  make an intermediate manually)
%.np.tex: %.tex
	perl -ne 'print unless /isipoint/' $< > $@

Ignore += *.three.*
%.three.tex: three.tex %.tex
	perl -npe 's/figtmp/$*/' $< > $@

Ignore += *.four.*
%.four.tex: four.tex %.tex
	perl -npe 's/figtmp/$*/' $< > $@

Ignore += four.tex
four.tex: three.tex 
	perl -npe 's/threepage/fourpage/' $< > $@

# Remove (N) from β for less intimidation
Ignore += *.const.tex
sirodes.const.tex: sirodes.tex 
	perl -npe 's/\(N\)//' $< > $@

diagrams/%: diagrams
	cd diagrams && $(MAKE) $*

## brides.four.pdf: brides.tex

## I've lost the code for the asymp model!!
Sources += legacy/*.pdf
%.pdf: legacy/%.pdf
	$(forcelink)

##################################################################

## Simulations

### Simple

Sources += exp.R beta.R

#### Not implemented here yet!

Sources += onestoch.pdf onesto.pdf comp0.pdf comp.pdf onedet.pdf

##################################################################

## Pictures

Sources += trans.jpg gd.png R.png R.R

Ignore += thinker.jpg stirrer.large.jpg stirrer.jpg 

thinker.jpg: 
	wget -O $@ "http://si.smugmug.com/2008/Lighting-experiments/i-9g8KcQZ/1/L/cycladic%20thinker-L.jpg"

stirrer.large.jpg:
	wget -O $@ "http://upload.wikimedia.org/wikipedia/commons/3/32/Magnetic_Stirrer.JPG"

stirrer.jpg: stirrer.large.jpg
	convert -scale 25% $< $@

##################################################################

## Diagrammatic

steps.Rout: steps.R

generationTime.Rout: generationTime.R

######################################################################

# Content

vim_session:
	bash -cl "vmt"

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff
msrepo = https://github.com/dushoff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

-include makestuff/texdeps.mk
-include makestuff/wrapR.mk
-include makestuff/os.mk
-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
