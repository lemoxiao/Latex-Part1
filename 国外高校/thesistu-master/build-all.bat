rem Copyright (C) 2016- Maximilian Hoheiser <maximilian.hoheiser@student.tuwien.ac.at>
@echo off
set CLASS=thesistu
set SOURCE=example
@echo on

rem Build thesistu documentation
pdflatex %CLASS%.dtx
pdflatex %CLASS%.dtx
makeindex -s gglo.ist -o %CLASS%.gls %CLASS%.glo
makeindex -s gind.ist -o %CLASS%.ind %CLASS%.idx
pdflatex %CLASS%.dtx
pdflatex %CLASS%.dtx

rem Build the thesistu class file
pdflatex %CLASS%.ins

rem Build the thesistu thesis document
pdflatex %SOURCE%
bibtex   %SOURCE%
pdflatex %SOURCE%
pdflatex %SOURCE%
makeindex -t %SOURCE%.glg -s %SOURCE%.ist -o %SOURCE%.gls %SOURCE%.glo
makeindex -t %SOURCE%.alg -s %SOURCE%.ist -o %SOURCE%.acr %SOURCE%.acn
makeindex -t %SOURCE%.ilg -o %SOURCE%.ind %SOURCE%.idx
pdflatex %SOURCE%
pdflatex %SOURCE%

rem Build the thesistu example document
copy thesistu.cls example\thesistu.cls
cd example\
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
del *.loa

cd ..
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
del example*


@echo off
echo.
echo.
echo Class file and example document compiled.
pause
