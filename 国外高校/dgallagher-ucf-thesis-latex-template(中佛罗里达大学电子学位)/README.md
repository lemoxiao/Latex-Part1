# LaTeX template for UCF Electronic Thesis and Dissertation (ETD)

Project type: LaTeX  
Owner: Daniel Gallagher - `dgallagher@knights.ucf.edu`   
Affiliation: [Consortium for Applied Acoustoelectronic Technology](http://caat.engr.ucf.edu/) at the [University of Central Florida](http://www.ucf.edu/)

#### Project Mirrors:  

* [Bitbucket](https://bitbucket.org/dgallagher/ucf-thesis-latex-template)
* [Github](https://github.com/danielgallagher/UCF-Thesis-LaTeX-Template)

## Introduction
This template was originally developed in 2007 in compliance with the UCF ETD masters thesis guidelines. It has since been used by various colleges in their PhD dissertation submissions. At this time there was no official LaTeX template available from the university. There is now a basic template supplied by the editor in Graduate studies located on the [ETD formatting website](http://www.students.graduate.ucf.edu/ETD_formatting/). However, some may prefer to use this template for there needs.

### Motivation
By publishing my template in a public git repository, I hope that the template may be used by others and will continue to evolve with the revised ETD format guidelines through user contributed updates. 

Hopefully many people find this template helpful. Thank you emails are always appreciated.

## Wiki

Bitbucket wiki functionality is enabled at: [Wiki](https://bitbucket.org/dgallagher/ucf-thesis-latex-template/wiki/Home)

Wiki usage for formatting or LaTeX syntax is encouraged. 

## Format updates, bugs and other issues

Bitbucket issue tracking is enabled at: [Issues](https://bitbucket.org/dgallagher/ucf-thesis-latex-template/issues)

Individuals are encouraged to support bug fixes and other updates. No official support is provided.

## Get the Template

### Git SSH:

`git clone git@bitbucket.org:dgallagher/ucf-thesis-latex-template.git`

or 

`git clone git@github.com:danielgallagher/UCF-Thesis-LaTeX-Template.git`

### Git HTTPS:

`git clone https://bitbucket.org/dgallagher/ucf-thesis-latex-template.git`

or

`git clone https://github.com/danielgallagher/UCF-Thesis-LaTeX-Template.git`
	
### Zip file:

Download the current version from [bitbucket](https://bitbucket.org/dgallagher/ucf-thesis-latex-template/downloads) or [Github](https://github.com/danielgallagher/UCF-Thesis-LaTeX-Template) repository mirrors. 

For a zip file of current code from web: Click "Downloads" > "Branches" > "zip"

## Usage
Update the necessary files listed below, then compile pdf document using pdflatex and bibtex.
 
### Source File Information
#### Main Template Files
* `ucfthes.cls` - UCF ETD class
* `ucfthma.clo` - Title page macros
* `ucfth12.clo` - Page layout and font size specifications
* `ucfthti.clo` - Preliminary page generation and formatting.

#### Example files

* `thesis.tex` - Main file - Use: ``pdflatex thesis''
* `preamble.tex`- Define packages
* `intropages.tex` - Define frontmatter and variables
* `macros.tex` - Example macros file
* `thesis.bib` - Example bibTeX bibliography 

#### Other files (optional)
* `IEEEfull.bib` and `IEEEabrv.bib` - IEEE Journal name abbreviations used for bibliography
* `thesis.pdf` - Example pdf output


## Dependencies
The code is currently functional with the following set-up:

* LaTeX or pdfLaTeX (MikTeX, TeX Live, etc)
* BibTeX
* hyperref, cite and other optional packages

Other configurations may be compatible but remain unverified.

## Contributors
* Daniel Gallagher (© 2007-2013)
* Derived from work by Ivan Garibay (© 2000-2004) 
* Taken from UCLA THESIS/DISSERTATION CLASS by John Heidemann (© 1995)
* Taken from UCLA THESIS/DISSERTATION CLASS (version 0.94 BETA, 5/23/91) © 1988 Richard B. Wales.  All Rights Reserved. by Richard B. Wales.
* Taken from DISSERTATION style (1/10/86) by Dorab Patel and Eduardo Krell
* Taken from REPORT style © 1985 by Leslie Lamport

# LICENCE AND COPYRIGHT
Released under [The MIT License](http://opensource.org/licenses/MIT)