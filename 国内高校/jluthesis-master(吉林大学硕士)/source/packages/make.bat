rem type %1.tex | find "\def\usewhat{dvipdfm}" && goto dvipdfm
rem type %1.tex | find "\def\usewhat{pdftex}" && goto pdftex
rem type %1.tex | find "\def\usewhat{dvi}" && goto yap

type jlu.tex | find "\def\usewhat{dvipdfm}" && goto dvipdfm
type jlu.tex | find "\def\usewhat{pdftex}" && goto pdftex
type jlu.tex | find "\def\usewhat{dvi}" && goto yap


:dvipdfm
del jlu_dvipdfm.pdf jlu.dvi
latex jlu.tex
bibtex jlu
latex jlu.tex
gbk2uni jlu.out
latex jlu.tex
dvipdfmx -p a4 jlu.dvi
ren jlu.pdf jlu_dvipdfm.pdf
rem del *.aux *.bbl *.blg *.out *.thm *.toc *.lof *.fen *.toe *.lot *.ten *.log *.ps *.dvi /s
start jlu_dvipdfm.pdf
exit

:pdftex
del jlu_pdflatex.pdf
pdflatex jlu.tex
bibtex jlu
pdflatex jlu.tex
gbk2uni jlu.out
pdflatex jlu.tex
ren jlu.pdf jlu_pdflatex.pdf
rem del *.aux *.bbl *.blg *.out *.thm *.toc *.lof *.fen *.toe *.lot *.ten *.log /s
start jlu_pdflatex.pdf
exit

:yap
del jlu.dvi
latex jlu.tex
bibtex jlu
latex jlu.tex
gbk2uni jlu.out
latex jlu.tex
rem del *.aux *.bbl *.blg *.out *.thm *.toc *.lof *.fen *.toe *.lot *.ten *.log /s
start jlu.dvi
exit


