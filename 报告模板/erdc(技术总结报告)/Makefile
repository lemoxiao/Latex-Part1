#
# Makefile for erdc package
#
# This file is in public domain
#
# $Id: Makefile,v 1.5 2009-07-02 16:11:45 boris Exp $
#

PACKAGE=erdc

SAMPLES = sample.tex

IMAGES = \
	red_corps_castle2.eps\
	nola.eps

PDFIMAGES = ${IMAGES:%.eps=%.pdf}

PDF = $(PACKAGE).pdf ${SAMPLES:%.tex=%.pdf}

WD = $(shell pwd)
CURRDIR = $(notdir ${WD})


all:  ${PDF} ${PDFIMAGES}


%.pdf:  %.dtx   $(PACKAGE).cls ${PDFIMAGES}
	pdflatex $<
	- bibtex $*
	pdflatex $<
	- makeindex -s gind.ist -o $*.ind $*.idx
	- makeindex -s gglo.ist -o $*.gls $*.glo
	pdflatex $<
	while ( grep -q '^LaTeX Warning: Label(s) may have changed' $*.log) \
	do pdflatex $<; done


%.cls:   %.ins %.dtx  
	pdflatex $<

%.pdf:  %.tex   $(PACKAGE).cls
	pdflatex $<
	- bibtex $*
	pdflatex $<
	pdflatex $<
	while ( grep -q '^LaTeX Warning: Label(s) may have changed' $*.log) \
	do pdflatex $<; done


%.pdf:  %.eps
	epstopdf $<


.PRECIOUS:  $(PACKAGE).cfg $(PACKAGE).cls


clean:
	$(RM)  $(PACKAGE).cls *.log *.aux \
	*.glo *.idx *.toc *.tbc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls *.sty *.ist \
	*.dvi *.ps *.thm *.tgz *.zip

distclean: clean
	$(RM) $(PDF) $(PDFIMAGES)

#
# Archive for the distribution. Includes typeset documentation
#
archive:  all clean
	cd ..; \
	tar -czvf $(PACKAGE).tgz  --exclude 'debug*' \
	--exclude '*~' --exclude '*.tgz' --exclude '*.zip'  \
	--exclude CVS $(CURRDIR); \
	mv $(PACKAGE).tgz $(CURRDIR); \
	cd $(CURRDIR)


zip:  all clean
	cd ..; \
	zip -r  $(PACKAGE).zip $(CURRDIR) \
	-x 'debug*' -x '*~' -x '*.tgz' -x '*.zip' -x CVS -x 'CVS/*'; \
	mv $(PACKAGE).zip $(CURRDIR); \
	cd $(CURRDIR)
