# LaTeX Makefile
filename=main
all:
	pdflatex -synctex=1 -interaction=nonstopmode ${filename}.tex

pdf:
	pdflatex -synctex=1 -interaction=nonstopmode ${filename}.tex
	pdflatex -synctex=1 -interaction=nonstopmode ${filename}.tex

check:
	java -jar docCheck.jar chapter

clean:
	rm -f ${filename}.aux
	rm -f ${filename}.log
	rm -f ${filename}.nav
	rm -f ${filename}.out
	rm -f ${filename}.snm
	rm -f ${filename}.toc
	rm -f ${filename}.synctex.gz
	rm -f ${filename}.bcf
	rm -f ${filename}.bbl
	rm -f ${filename}.blg
	rm -f ${filename}.loa
	rm -f ${filename}.lof
	rm -f ${filename}.lot
	rm -f ${filename}.maf
	rm -f ${filename}.mtc*
	rm -f ${filename}.run.xml
	rm -f ${filename}.pdf
	rm -f SunoreDocCheckOutput.txt
  