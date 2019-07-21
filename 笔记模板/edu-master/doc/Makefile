TEXMFHOME ?= $(shell kpsewhich -var-value TEXMFHOME)
TEXMFMAIN ?= $(shell kpsewhich -var-value TEXMFMAIN)

.PHONY: all clean clean-test cls dist distclean examples install test tutorials # targets not associated with file

EXAMPLESTEX = $(filter-out %-nopreview.tex, $(wildcard tut-*.tex))
EXAMPLESPDF = $(patsubst %.tex, %.pdf, $(EXAMPLESTEX))

all: $(EXAMPLESPDF) clean

%.pdf: ../edu-tut.tex
	cp ../edu.cls ./
	pdflatex -interaction=nonstopmode -halt-on-error -jobname=$(basename $@) "\providecommand\docfile{$(basename $@).tex}\input{edu-doc-template-content.tex}"

clean:
	rm -f *.gl? *.glsdefs *.id? *.aux
	rm -f *.bbl *.bcf *.bib *.blg *.xdy
	rm -f *.fls *.log *.out *.run.xml *.toc
	rm -f *.cod *.gnuplot *.table
	rm -f *.log *.synctex *.tmp

distclean: clean
	rm -f tut-*.tex *.cls *.pdf *.clo *.tar.gz *.tds.zip
