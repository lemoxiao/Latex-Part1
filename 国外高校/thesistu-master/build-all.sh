#!/bin/sh
# Copyright (C) 2016- Maximilian Hoheiser <maximilian.hoheiser@student.tuwien.ac.at>

CLASS=thesistu
SOURCE=example

# Build thesistu documentation
pdflatex $CLASS.dtx
pdflatex $CLASS.dtx
makeindex -s gglo.ist -o $CLASS.gls $CLASS.glo
makeindex -s gind.ist -o $CLASS.ind $CLASS.idx
pdflatex $CLASS.dtx
pdflatex $CLASS.dtx

# Build the thesistu class file
pdflatex $CLASS.ins

# Build the thesistu example document
pdflatex $SOURCE
bibtex   $SOURCE
pdflatex $SOURCE
pdflatex $SOURCE
makeindex -t $SOURCE.glg -s $SOURCE.ist -o $SOURCE.gls $SOURCE.glo
makeindex -t $SOURCE.alg -s $SOURCE.ist -o $SOURCE.acr $SOURCE.acn
makeindex -t $SOURCE.ilg -o $SOURCE.ind $SOURCE.idx
pdflatex $SOURCE
pdflatex $SOURCE

# Build the thesistu example document
cp thesistu.cls example/thesistu.cls
cd example/
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
rm *.loa

cd ..
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
rm example*

echo
echo
echo Class file and example document compiled.
sleep