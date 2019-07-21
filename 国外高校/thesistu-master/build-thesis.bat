rem Copyright (C) 2016- Maximilian Hoheiser <maximilian.hoheiser@student.tuwien.ac.at>
@echo off
set SOURCE=thesis
@echo on

rem Build the thesis document
pdflatex %SOURCE%
bibtex   %SOURCE%
pdflatex %SOURCE%
pdflatex %SOURCE%
makeindex -t %SOURCE%.glg -s %SOURCE%.ist -o %SOURCE%.gls %SOURCE%.glo
makeindex -t %SOURCE%.alg -s %SOURCE%.ist -o %SOURCE%.acr %SOURCE%.acn
makeindex -t %SOURCE%.ilg -o %SOURCE%.ind %SOURCE%.idx
pdflatex %SOURCE%
pdflatex %SOURCE%
del *.acn
del *.acr
del *.alg
del *.aux
del *.bbl
del *.blg
del *.glg
del *.glo
del *.gls
del *.idx
del *.ilg
del *.ind
del *.ist
del *.lof
del *.lot
del *.out
del *.toc
del *.hd

@echo off
echo.
echo.
echo Thesis document compiled.
pause
