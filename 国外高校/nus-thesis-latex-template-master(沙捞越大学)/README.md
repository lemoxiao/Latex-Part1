National University of Singapore (NUS) LaTeX template
=====================================================

A LaTeX template following NUS specifications for Masters/ PhD theses.

## Synopsis

### on \*nix
```bash
wget https://raw.githubusercontent.com/ramananbalakrishnan/nus-thesis-latex-template/master/nus-thesis-latex-template.tar.gz
tar xvzf nus-thesis-latex-template.tar.gz
cd nus-thesis-latex-template
# <edit thesis_contents.tex to your liking>
# <add your references to reference_list.bib>
./make
# <the ./make command accepts an (optional) argument denoting the filename (if different from thesis_contents.tex)>
```

### on Windows
> Install TexLive
> Download nus-thesis-latex-template.tar.gz and unzip to a folder
> Edit the .tex and .bib files
> Use pdflatex / bibtex to build the files

Recommended setup: TexLive + Texworks

## Author
Ramanan Balakrishnan (ramanan90@gmail.com)

## Acknowledgements
This work is based on the
[unofficial-nus-thesis-org-latex-template](https://github.com/bowenli37/unofficial-NUS-thesis-org-latex-template) developed by
[bowenli37](https://github.com/bowenli37)

## License
MIT License
