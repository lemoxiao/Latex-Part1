TEX = latexmk -pdflatex='pdflatex -file-line-error -synctex=1' -pdf

.PHONY: all view

all : NaamVoornaam_scriptie_2013.pdf

NaamVoornaam_scriptie_2013.pdf : NaamVoornaam_scriptie_2013.tex
	$(TEX) NaamVoornaam_scriptie_2013.tex
	
make clean:
	rm *.pdf *.aux *.log *.nav *.out *.snm *.synctex.gz *.toc *.fdb_latexmk *.brf *.blg *.bbl *.lof *.TODO *.backup
