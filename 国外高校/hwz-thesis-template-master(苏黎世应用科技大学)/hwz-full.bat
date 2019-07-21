latex hwz.tex
latex hwz.tex
bibtex hwz
makeindex hwz
makeindex -s hwz.ist -t hwz.glg -o hwz.gls hwz.glo
latex hwz.tex
latex hwz.tex
dvips -o hwz.ps hwz.dvi
dvipdfm -o hwz-print.pdf hwz.dvi
pdflatex hwz.tex