#!/bin/bash

filenamesrcorig=$1
filenamepdforig="${filenamesrcorig%.*}".pdf
filenamesrctmp1="${filenamesrcorig%.*}".tmp1.tex
filenamesrctmp2="${filenamesrcorig%.*}".tmp2.tex
filenamepdftmp1="${filenamesrcorig%.*}".tmp1.pdf
filenamepdftmp2="${filenamesrcorig%.*}".tmp2.pdf

echo $filenamesrcorig
echo $filenamesrctmp1
echo $filenamesrctmp2

cp $filenamesrcorig $filenamesrctmp1
cp $filenamesrcorig $filenamesrctmp2

sed -i 's/\\begin{document}/\\begin{document}\\eduoption{showresults}{false}/' $filenamesrctmp1
sed -i 's/\\begin{document}/\\begin{document}\\eduoption{showresults}{true}/' $filenamesrctmp2

pdflatex -shell-escape -interaction=nonstopmode $filenamesrctmp1
pdflatex -shell-escape -interaction=nonstopmode $filenamesrctmp1

pdflatex -shell-escape -interaction=nonstopmode $filenamesrctmp2
pdflatex -shell-escape -interaction=nonstopmode $filenamesrctmp2

cp $filenamepdftmp1 $filenamepdforig
cp $filenamepdftmp2 "${filenamepdforig%.*}"-R.pdf

rm $filenamesrctmp1 $filenamesrctmp2 $filenamepdftmp1 $filenamepdftmp2

rm -f *.gl? *.glsdefs *.id? *.aux
rm -f *.bbl *.bcf *.bib *.blg *.xdy
rm -f *.fls *.log *.out *.run.xml *.toc
rm -f *.cod *.gnuplot *.table
rm -f *.log *.synctex *.tmp *.vrb
