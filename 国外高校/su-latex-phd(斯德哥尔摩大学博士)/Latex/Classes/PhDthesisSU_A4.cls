
%---------------------------------------------------------------
% PhDthesis class file by Andreas Solders 2011 based on
% PhDthesis version 2 style file by Jakob Suckale, 2007
% and CUEDthesis version 1 by Harish Bhanderi 2002
%---------------------------------------------------------------



%-------------------------- identification ---------------------
%\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Latex/Classes/PhDthesisSU}[2011/09/23 PhD thesis class]


%:-------------------------- book style -----------------------

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[pdftex, a4paper]{book} 


%:-------------------------- packages for fancy things -----------------------
\usepackage{mathptmx} % Default font for dissertations is Times.
%\usepackage{fourier} % If mathematics don't display well using Times, then use Fourier.
\usepackage{geometry}
\usepackage{amssymb}
\usepackage{amsmath}
\usepackage{amsbsy}
%\usepackage{graphics} 
\usepackage[pdftex]{graphicx} % for improved inclusion of graphics
\usepackage{epstopdf} % converts eps figures to pdf
%\usepackage{wrapfig} % to include figure with text wrapping around it
\usepackage[margin=10pt,font=small,labelfont=bf]{caption} % for improved layout of figure captions with extra margin, smaller font than text
\usepackage{fancyhdr} % for better header layout
\usepackage{eucal}
\usepackage[english,swedish]{babel}
\usepackage[usenames, dvipsnames]{color}
\usepackage[perpage]{footmisc}
\usepackage{enumerate} % enumerated list for List of Papers
\usepackage[sort,compress]{natbib}
\usepackage{ifthen}
\usepackage{multicol} % for pages with multiple text columns, e.g. References
\setlength{\columnsep}{20pt} % space between columns; default 10pt quite narrow
\usepackage[nottoc]{tocbibind} % correct page numbers for bib in TOC, nottoc suppresses an entry for TOC itself
%\usepackage{nextpage}
\usepackage[T1]{fontenc}
\usepackage{calligra}

\renewcommand\boldsymbol[1]{\pmb{#1}}

 \DeclareFixedFont{\timesEightteen}{\encodingdefault}{\sfdefault}{\seriesdefault}{\shapedefault}{17\p@}

% Removing the "Chapter n" text an replacing it by a single number.
\def\@makechapterhead#1{%
  \vspace{0\p@}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      % Skipping the "Chapter n" text 
      \if@mainmatter
        \baselineskip=20pt\rightskip 2cm plus 3cm\huge\thechapter.\hspace{0.5em}%Chapterpoint added.
      \fi
    \fi
    \huge #1\par\nobreak
    \vskip 84\p@
  }}
\def\@makeschapterhead#1{%
  \vspace*{0\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \huge  #1\par\nobreak
    \vskip 84\p@
  }}


%:-------------------------- Glossary/Abbrev./Symbols -----------------------

\usepackage[intoc]{nomencl} % load nomencl extension; include in TOC
%\nomrefpage % to include page numbers after abbrevations
\renewcommand{\nomlabel}[1]{\textbf{#1}} % make abbreviations bold
\makenomenclature % used to be \makeglossary
\newcommand{\g}{\footnote{For all abbreviations see the glossary on page \pageref{nom}.}} % type "\g" to refer to glossary

% used to be for sorting into categories:
%\renewcommand\nomgroup[1]{%
%  \ifthenelse{\equal{#1}{A}}{%
%   \item[\textbf{Roman Symbols}] }{%             A - Roman
%    \ifthenelse{\equal{#1}{G}}{%
%     \item[\textbf{Greek Symbols}]}{%             G - Greek
%      \ifthenelse{\equal{#1}{R}}{%
%        \item[\textbf{Superscripts}]}{%              R - Superscripts
%          \ifthenelse{\equal{#1}{S}}{%
%           \item[\textbf{Subscripts}]}{{%             S - Subscripts
%	    \ifthenelse{\equal{#1}{X}}{%
%	     \item[\textbf{Other Symbols}]}{{%    X - Other Symbols
%	    \ifthenelse{\equal{#1}{Z}}{%
%	     \item[\textbf{Acronyms}]}%              Z - Acronyms
%              			{{}}}}}}}}}}


%:-------------------------- PDF/PS setup -----------------------

%if you use a macTeX 2008 or later, use the ifpdf package
\usepackage{ifpdf} 


%-->
%--> Google.com search "hyperref options"
%--> 
%--> http://www.ai.mit.edu/lab/sysadmin/latex/documentation/latex/hyperref/manual.pdf
%--> http://www.chemie.unibas.ch/~vogtp/LaTeX2PDFLaTeX.pdf 
%--> http://www.uni-giessen.de/partosch/eurotex99/ oberdiek/print/sli4a4col.pdf
%--> http://me.in-berlin.de/~miwie/tex-refs/html/latex-packages.html
%-->
    \usepackage[ pdftex, plainpages = false, pdfpagelabels, 
                 pdfpagelayout = useoutlines,
                 bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 pagebackref,
                 colorlinks = false,  % was true
                 linkcolor = blue,
                 urlcolor  = blue,
                 citecolor = red,
                 anchorcolor = green,
                 hyperindex = true,
                 hyperfigures
                 ]{hyperref} 

    \DeclareGraphicsExtensions{.png, .jpg, .jpeg, .pdf} %GIF doesn't work
    \usepackage[pdftex]{graphicx}
    \pdfcompresslevel=9
    \graphicspath{{0_frontmatter/figures/}}



%:-------------------------- page layout -----------------------

%S5 settings (default)

%\geometry{paperheight=242mm,paperwidth=165mm}
%\geometry{left=22.5mm,right=22.5mm}
%\geometry{top=22.5mm,bottom=22.5mm}


%Make al headlines non-fat
\def\section{\@startsection {section}{1}{\z@}{-3.5ex plus -1ex minus 
    -.2ex}{2.3ex plus .2ex}{\Large}}
\def\subsection{\@startsection{subsection}{2}{\z@}{-3.25ex plus -1ex minus 
   -.2ex}{1.5ex plus .2ex}{\large}}
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{-3.25ex plus
-1ex minus -.2ex}{1.5ex plus .2ex}{\normalsize}}



%:-------------------------- page layout -----------------------

% FRONTMATTER
% No page numbering until chapter 1

\newcommand{\frontmatterSU}{
\frontmatter
\pagestyle{empty}
\fancypagestyle{plain}{
    \fancyhead{}
    \fancyfoot{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}
}


% MAINMATTER
\newcommand{\mainmatterSU}{

\begingroup
\cleardoublepage
\edef\x{\endgroup
\noexpand\mainmatter
\setcounter{page}{\the\value{page}}%
}%
\x

\cleardoublepage

\fancypagestyle{plain}
{
    \fancyhead{}
    \fancyfoot[LE,RO]{{\fontfamily{verdana}\selectfont\thepage}}
}	% re-define plain page

\pagestyle{fancy}
\fancyhf{}
\fancyfoot[LE,RO]{{\fontfamily{verdana}\selectfont\thepage}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}


% BACKMATTER
\newcommand{\backmatterSU}{

\backmatter
\renewcommand{\thepage}{\roman{page}}
%
\pagestyle{empty}
\fancypagestyle{plain}{
    \fancyhead{}
    \fancyfoot{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}
}



% DECLARATIONS
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% Subtitle
\def\subtitle#1{\gdef\@subtitle{#1}}
% Defining the crest
\def\crest#1{\gdef\@crest{#1}}

% These macros define an environment for front matter that is always 
% single column even in a double-column document.

\newenvironment{alwayssingle}{%
       \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
       \else\newpage\fi}
       {\if@restonecol\twocolumn\else\newpage\fi}

%Halftitlepage
\newcommand{\halftitlepage}%
{
\thispagestyle{empty}
	\noindent
	 {\large \@title~-- \@subtitle\\}\\
	 \noindent
	 {\Large\@author}
\cleardoublepage
}

\crest{\includegraphics[width=25mm]{SU-Logga}}

%define title page layout
\renewcommand{\maketitle}{
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
{\large \vspace*{0mm} \hspace*{90mm} {{\@crest} \par} } %Move the logo
    { \Huge \vspace*{30mm}{\noindent}{\@title} \par \vspace*{4mm}}
    {\large {\noindent}{\@subtitle} \par \vspace*{8mm}}
    {{\LARGE {\noindent}\@author} \par}
  \null\vfill
}

% page number for cover back side should have page number blanked


%:-------------------------- front matter layout -----------------------

% ABSTRACT
%
\newenvironment{abstracts} { \pagestyle{empty}
\let\cleardoublepage\clearpage
\chapter{Abstract}
}



% DEDICATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{dedication}
{
  \phantom{.}
  \vspace{13cm}
  \begin{quote} \begin{flushright}}
{\end{flushright} \end{quote}}

