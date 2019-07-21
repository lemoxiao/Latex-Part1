TEX = xelatex
BIBTEX = bibtex
FLAGS = -shell-escape
TEXSRC = main.tex
# TEXAUX = main.aux
TEXAUX = $(patsubst %.tex, %.aux, $(TEXSRC))
pdf:
	$(TEX) $(FLAGS) $(TEXSRC)
	$(BIBTEX) $(TEXAUX)
	$(TEX) $(FLAGS) $(TEXSRC)
	$(TEX) $(FLAGS) $(TEXSRC)

clean:
	rm *.log *.aux *.dvi *.bbl *.blg *.ilg *.toc *.lof *.lot *.idx *.ind *.ps *.pdf *~
