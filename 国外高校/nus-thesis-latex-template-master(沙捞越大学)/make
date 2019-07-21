#!/bin/sh
FILENAME=${1:-"thesis_contents"}
pdflatex "$FILENAME".tex
bibtex "$FILENAME"
pdflatex "$FILENAME".tex
pdflatex "$FILENAME".tex
mkdir -p build/
mv *.* build/
cp build/*.tex ./
cp build/*.pdf ./
cp build/*.bib ./
cp build/*.cls ./
cp build/*.bst ./
