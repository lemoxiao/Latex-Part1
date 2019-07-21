# build tex source
echo "Start to build..."
set -e
pdflatex master-thesis.tex
bibtex master-thesis.aux
pdflatex master-thesis.tex
pdflatex master-thesis.tex
echo "Done!"

