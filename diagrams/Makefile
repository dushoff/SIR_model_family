# SIR_model_family disagrams subdirecotry
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: sir.four.png 

##################################################################

# make files

Sources = Makefile 
include ../stuff.mk
include sources.mk

-include $(ms)/talk.def
-include $(ms)/perl.def

##################################################################

sir.four.png: three.tex

%.three.tex: three.tex %.tex
	perl -npe 's/figtmp/$*/' $< > $@

%.four.tex: four.tex %.tex
	perl -npe 's/figtmp/$*/' $< > $@

four.tex: three.tex 
	perl -npe 's/threepage/fourpage/' $< > $@

# Remove (N) from β for less intimidation
sirodes.const.tex: sirodes.tex 
	perl -npe 's/\(N\)//' $< > $@

## Remove points, whatever that means FIX
%.np.tex: %.tex nopoint.pl
	$(PUSH)

##################################################################

-include $(ms)/linux.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
-include $(ms)/newlatex.mk

