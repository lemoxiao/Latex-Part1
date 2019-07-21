DEPS:= resume.cls fontawesome5/fontawesome5.sty
SRCS:= resume-zh.tex resume-en.tex
PDFS:= $(SRCS:%.tex=%.pdf)
PDFCAT:= resume-zh+en.pdf

DATE= $(shell date +%Y%m%d)
DISTDIR= resume.$(DATE)

# Environment variables
TEXINPUTS:= .:fontawesome5:$(TEXINPUTS)

all: $(PDFCAT)
en: resume-en.pdf
zh: resume-zh.pdf

$(PDFCAT): $(PDFS)
	pdftk $(PDFS) cat output $@

resume-zh.pdf: resume-zh.tex $(DEPS)
	env TEXINPUTS=$(TEXINPUTS) latexmk -xelatex $<

resume-en.pdf: resume-en.tex $(DEPS)
	env TEXINPUTS=$(TEXINPUTS) latexmk -xelatex $<

dist: all
	mkdir $(DISTDIR)
	cp Makefile $(DEPS) $(SRCS) $(PDFS) $(DISTDIR)/
	tar -cjf $(DISTDIR).tar.bz2 $(DISTDIR)/
	rm -r $(DISTDIR)

clean:
	for f in $(SRCS); do \
		latexmk -c $$f; \
	done
	touch $(SRCS)

cleanall:
	for f in $(SRCS); do \
		latexmk -C $$f; \
	done

.PHONY: all en zh dist clean cleanall


# One liner to get the value of any makefile variable
# Credit: http://blog.jgc.org/2015/04/the-one-line-you-should-add-to-every.html
print-%: ; @echo $*=$($*)
