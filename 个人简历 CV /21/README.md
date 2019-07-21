# What is this

This is a repository that contains my up-to-date CV in LaTeX. There is three versions:
- **FR**: French version for France
- **FR_QC**: French version for Quebec
- **EN_US**: English version the United States

Each versions can be compiled in PDF and HTML, the HTMLs are accessible from my website [maxime.pinard.info](http://maxime.pinard.info/CV)

# How to build

## Requirements

- A LaTex distribution such as [TeX Live](http://tug.org/texlive)
- [FontAwesome](http://fontawesome.io/) installed on your system
- [LuaTex](http://www.luatex.org/) or XeTeX to generate the PDFs
- [pdf2htmlex](https://github.com/coolwanglu/pdf2htmlEX) to generate the HTMLs from the PDFs

## Build

To build, a *Makefile* is available.

To build PDFs and HTMLs:

``make``

Only the PDFs:

``make pdf``
