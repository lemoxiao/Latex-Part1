# Master thesis template for the Univeristy of Torino

Hey guys ! Since I was not really satisfied by any of the templates online for the thesis, and our university has no defined template I decided to write one by myself.

Hope is helpful to anyone to save some time!

It was written from scratch with the help of many guides/tamplates found on the web, so feel free to modify and distribute it

### Folder structure

```
.                
└── Thesis folder            # The folder containing this repository
    ├── thesis.tex           # The main file
    ├── head                 # place for the tex files of the introductory part
        ├── frontPage.tex
        ├── dedication.tex
        └── abstract.tex
    ├── body                 # place for the tex files of the body part
        ├── chapter1.tex
        ├── chapter2.tex
        ├── ...
        └── conclusions.tex
    ├── tail                 # place for the tex files for the final part
        ├── appendix1.tex
        ├── aknowledgments.tex
        ├── bibliography.tex
        └── ...
    ├── images 
    └── bibliography
        └── bibThesis.bib
```

### Compiling instructions
The main file `thesis.tex`, eventually you can rename it as you wish. The compile sequence with bibliography is:

Using TeXShop

    Run LaTeX
    Run BibTeX
    Run LaTeX
    Run LaTex
    
Using a sh script

    same sequence but you have to compile the subfiles as well

### Useful readings
About latex itself
* [L'arte di scrivere con LaTeX (in Italian)](http://www.lorenzopantieri.net/LaTeX_files/ArteLaTeX.pdf "L'arte di scrivere con LaTeX")
* [??? (in English)](http://)

About how to write a text which is clear and concise text
* [A very brief guide about what NOT to do (in Italian)](https://users.dimi.uniud.it/~stefano.mizzaro/dida/come-non-scrivere-la-tesi.html)
* [Strunk & White (in English)](http://www.bartleby.com/141/)

### One last warning
This template is thinked to be used for a thesis written in english, so no effort was put in the integration of features typical of italian (e.g. return at the beginning of the chapter).
If you do a modification in that sense please do a pull request ! 

So enjoy and good luck !
