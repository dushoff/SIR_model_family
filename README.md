Some code to make SIR boxes, and also to make some talks that I've given at ICI3D clinics and workshops. Moved from wikis and other sources in late 2015. 

This is my first attempt at a self-contained self-making repo. It will download other small repos that it needs, do the calculations and plots that it wants, and even download photos from the web (the photos are tagged for non-commercial reuse in Google, don't use them commerciallly)

try:

	git clone https://github.com/dushoff/SIR_model_family.git
	cd SIR_model_family
	make newdir
	make

The "make newdir" line is not so aesthetic, and not completely necessary, but it avoids dependency errors the first time latex is run

If you are on ubuntu, or something with similar flavor and window system, you can try 

	make vtarget

to remake and open the default target, lecture.draft.pdf. Otherwise, you would have to open it yourself.
