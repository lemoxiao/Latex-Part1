#!/bin/sh
# Copyright (C) 2016- Maximilian Hoheiser <maximilian.hoheiser@student.tuwien.ac.at>

SOURCE=thesis

# Build the thesis document
pdflatex $SOURCE
bibtex   $SOURCE
pdflatex $SOURCE
pdflatex $SOURCE
makeindex -t $SOURCE.glg -s $SOURCE.ist -o $SOURCE.gls $SOURCE.glo
makeindex -t $SOURCE.alg -s $SOURCE.ist -o $SOURCE.acr $SOURCE.acn
makeindex -t $SOURCE.ilg -o $SOURCE.ind $SOURCE.idx
pdflatex $SOURCE
pdflatex $SOURCE
rm *.acn
rm *.acr
rm *.alg
rm *.aux
rm *.bbl
rm *.blg
rm *.glg
rm *.glo
rm *.gls
rm *.idx
rm *.ilg
rm *.ind
rm *.ist
rm *.lof
rm *.lot
rm *.out
rm *.toc
rm *.hd

echo
echo
echo Thesis document compiled.
sleep