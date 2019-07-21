
thesis.pdf : thesis.ps
	ps2pdf thesis.ps

thesis.ps : thesis.dvi
	dvips -t letter thesis.dvi -o thesis.ps

thesis.dvi : thesis.tex
	latex thesis.tex
	latex thesis.tex
	latex thesis.tex
	bibtex thesis
	latex thesis.tex
	latex thesis.tex
	latex thesis.tex

open : thesis.ps
	evince thesis.ps &

clean :
	\rm -f *.aux *.bbl *.blg *.dvi *.idx *.lof *.log *.lot *.toc

