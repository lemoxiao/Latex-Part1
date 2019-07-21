tex	 	= 	dissertation.tex
bib 	=  	$(tex:.tex=.bib)
aux 	= 	$(tex:.tex=.aux)

default: clean tex2pdf

clean: 
	rm -rf *.aux *.log *.bbl *.blg *.brf *.cb *.ind *.idx *.ilg	\
				*.inx *.toc *.lof *.lot *.out chapters/*.log *~

tex2pdf: 
	pdflatex $(tex) && bibtex $(aux) && pdflatex $(tex) && pdflatex $(tex)
