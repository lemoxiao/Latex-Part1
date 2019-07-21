XELATEX=xelatex -file-line-error -interaction=nonstopmode

.PHONY: all
all: Thesis.tex
	latexmk -pdf -pdflatex="$(XELATEX)" -use-make Thesis.tex

.PHONY: auto
auto: Thesis.tex
	latexmk -pdf -pdflatex="$(XELATEX)" -use-make -pvc Thesis.tex

.PHONY: clean
clean:
	rm -f Thesis.pdf *.aux *.bbl *bcf *.blg *.log *.out *.tdo *.toc *.xdv *.synctex.gz *.fdb_latexmk *.fls *.run.xml; \
	rm -f **/*.aux
