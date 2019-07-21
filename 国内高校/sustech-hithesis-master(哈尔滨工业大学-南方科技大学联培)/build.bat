lualatex hithesis.ins

xelatex main.tex
bibtex main
xelatex main.tex
xelatex main.tex
splitindex main -s hithesis.ist
xelatex main.tex