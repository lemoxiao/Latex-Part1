%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Thesis/dissertation template
%   Department of Logistics
%   Stellenbosch University
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
%  Adapted from book.cls, renamed to thesis.cls
%


%%
%% This is file `book.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% classes.dtx  (with options: `book')
%% 
%% This is a generated file.
%% 
%% Copyright 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009
%% The LaTeX3 Project and any individual authors listed elsewhere
%% in this file.
%% 
%% This file was generated from file(s) of the LaTeX base system.
%% --------------------------------------------------------------
%% 
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 
%% This file has the LPPL maintenance status "maintained".
%% 
%% This file may only be distributed together with a copy of the LaTeX
%% base system. You may however distribute the LaTeX base system without
%% such generated files.
%% 
%% The list of all files belonging to the LaTeX base distribution is
%% given in the file `manifest.txt'. See also `legal.txt' for additional
%% information.
%% 
%% The list of derived (unpacked) files belonging to the distribution
%% and covered by LPPL is defined by the unpacking scripts (with
%% extension .ins) which are part of the distribution.
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{thesis}
              [2007/10/19 v1.4h
 Standard LaTeX document class]
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\if@compatibility\else
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\fi
\if@compatibility
  \renewcommand\@ptsize{0}
\else
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\fi
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
\DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility
\@openrighttrue
\else
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\fi
\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\type#1{\gdef\@type{#1}}
\type{msc}
\DeclareOption{mcomm}{\type{mcomm}}
\DeclareOption{msc}{\type{msc}}
\DeclareOption{phdcomm}{\type{phdcomm}}
\DeclareOption{phdsc}{\type{phdsc}}
\DeclareOption{meng}{\type{meng}}
\DeclareOption{skripsie}{\type{skripsie}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





\ExecuteOptions{letterpaper,11pt,twoside,onecolumn,final,openright,a4paper}
\ProcessOptions
\input{bk1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \@chapapp\ \thechapter. \ %
          \fi
        \fi
        ##1}}{}}%
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection. \ %
        \fi
        ##1}}}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \@chapapp\ \thechapter. \ %
          \fi
        \fi
        ##1}}}}
\fi
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    }
  \if@titlepage
  \newcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi
\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{2}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@arabic\c@chapter}
\renewcommand \thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}
\newcommand\frontmatter{%
    \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}}
\newcommand\mainmatter{%
    \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}}
\newcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse}
\newcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{plain}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \huge\bfseries \partname\nobreakspace\thepart
       \par
       \vskip 20\p@
     \fi
     \Huge \bfseries #2\par}%
    \@endpart}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries #1\par}%
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
               \if@openright
                \null
                \thispagestyle{empty}%
                \newpage
               \fi
              \fi
              \if@tempswa
                \twocolumn
              \fi}
\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \addtocontents{loa}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
\def\@makechapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \huge\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 20\p@
      \fi
    \fi
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \vskip 40\p@
  }}
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
    \vskip 40\p@
  }}
\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\Large\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\large\bfseries}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}
\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\if@compatibility
\newenvironment{titlepage}
    {%
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\z@
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
\newenvironment{titlepage}
    {%
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi

\newcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\chaptername{Appendix}
  \gdef\thechapter{\@Alph\c@chapter}
  }
  
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset {equation}{chapter}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
\newcounter{figure}[chapter]
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{2}
\newcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
\newcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\chapter*{\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\bibname{Bibliography}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\chaptername{Chapter}
\newcommand\appendixname{Appendix}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{headings}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi

%
%% END OF DEFAULT BOOK CLASS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






%%%%%%%%%%%%
%
% packages 
%
%%%%%%%%%%%%
\usepackage[a4paper]{geometry}
\usepackage{ifthen,fancyhdr,titlesec,setspace}
\usepackage{booktabs,multirow,longtable}
\usepackage[table]{xcolor}
\usepackage[nohints]{minitoc}
\usepackage[useprefix=true,maxnames=99,backend=biber,style=orion]{biblatex}
\usepackage[ruled,linesnumbered,vlined,algochapter]{algorithm2e}
% some preliminaries for algorithm2e
% if you have more than 99 lines of pseudocode, add 0.5 to values below
  \setlength{\algomargin}{1.5em}
  \setalcaphskip{0.5em}
%%%%%%%%%%%%











%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% page layout specifications - 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% for 25 mm margins all around (left, right and bottom to text, top to header)

\newlength{\extraspace}
\setlength{\extraspace}{\lineskip}

%vertical margins
%==================
% page height is: 297mm
\voffset -1in
\topmargin 25mm
% from header down height is: 272mm
\headheight 4.3mm %just a little higher than 12pt = 12x0.3527 = 4.2324
\headsep 4mm
% from text down height is: 263.7mm
\textheight 238.7mm % compensate for 25mm bottom margin
\addtolength{\headsep}{2.5mm} %removes annoying lineskip below last line of text on page

%horizontal margins
%==================
% page width is: 210mm
\hoffset -1in
\marginparwidth 0mm
\marginparsep 0mm
\evensidemargin 25mm
\oddsidemargin 25mm
\textwidth 160mm


% Set paragraph behaviour
%========================
\parindent 0mm
\parskip 2mm plus 1pt

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Set up the style of headings on a page
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\pagestyle{fancy}
\headheight14pt
\renewcommand{\chaptermark}[1]{\markboth{\sc \chaptername\ \thechapter.\ #1}{}} %
\renewcommand{\sectionmark}[1]{\markright{\sl \thesection.\ #1}} %
\renewcommand{\headrulewidth}{0.4pt} % Thin header rule
\renewcommand{\footrulewidth}{0pt} % No footer rule
\fancyhead{} % Clear all header fields
\fancyhead[RO,LE]{\thepage} % Page number in outside header
\fancyhead[RE]{\leftmark} % Chapter reference in inside (even) header
\fancyhead[LO]{\rightmark} % Section reference in inside (odd) header
\fancyfoot{} % Clear all footer fields
% \fancyfoot[CE,CO]{\small \sc Draft copy: \today} % Print date in middle of page footer, delete this line when submitting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Watermark specs (added by R Roux)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\WaterMark}[2][0.2\paperwidth]{%
%\AddToShipoutPicture{\AtTextCenter{%
\parbox[c]{0pt}{\makebox[0pt][c]{%
\includegraphics{crest}}}}


% \newcommand*{\WaterMark}[2][0.2\paperwidth]{%
%  \AddToShipoutPicture*{%
% \put(0,0){%
% \parbox[b][\paperheight]{\paperwidth}{%
% \vfill
% \centering
% \includegraphics[width=#1]{#2}%
% \vfill
% }}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Set up the format of chapters and sections
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\titleformat{\section}
{%\titlerule
%\vspace{.8ex}%
\normalfont\Large\bfseries} {\thesection}{.5em}{}

\titleformat{\chapter}[display]
{\normalfont\Large\filcenter\normalfont}
{\titlerule[1pt]%
\vspace{1pt}%
\titlerule
\vspace{1pc}%
\LARGE\MakeUppercase{\normalfont\chaptertitlename} \thechapter} {1pc} {\titlerule
\vspace{1pc}%
\Huge}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% thesis front page and preamble info definitions
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\thesistitle#1{\gdef\@thesistitle{#1}}
\thesistitle{???}
\def\student#1{\gdef\@student{#1}}
\student{???}
\def\graduation#1{\gdef\@graduation{#1}}
\graduation{???}
\def\year#1{\gdef\@year{#1}}

\def\supervisor#1{\gdef\@supervisor{#1}}
\supervisor{???}
\def\cosupervisor#1{\gdef\@cosupervisor{#1}}
\cosupervisor{undefined}

\def\promoter#1{\gdef\@promoter{#1}}
\promoter{???}
\def\copromoter#1{\gdef\@copromoter{#1}}
\copromoter{undefined}

\def\mastersformula#1{\gdef\@mastersformula{#1}}
\def\skripsieformula#1{\gdef\@skripsieformula{#1}}
\def\phdformula#1{\gdef\@phdformula{#1}}
\def\decleration#1{\gdef\@decleration{#1}}
\def\copyrightnotice#1{\gdef\@copyrightnotice{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% compulsory information according to 2012 Stellenbosch University yearbook - edit as needed
%
% On 29 Feb 2012 this information was available in PDF form here:
% http://www.sun.ac.za/university/jaarboek/2012/Algemeen2012.pdf
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\mastersformula{
Thesis presented in partial fulfilment of the requirements for the degree of \\
\ifthenelse{\equal{\printtype}{msc}}{%
{\large \bf Master of Science} \\ in the Faculty of Science at Stellenbosch University%
}{}%
\ifthenelse{\equal{\printtype}{mcomm}}{%
{\large \bf Master of Commerce} \\ in the Faculty of Economic and Management Sciences at Stellenbosch University%
}{}%
\ifthenelse{\equal{\printtype}{meng}}{%
{\large \bf Master of (Industrial) Engineering} \\ in the Faculty of Engineering at Stellenbosch University%
}{}%
}
\skripsieformula{
Year project presented in partial fulfilment of the requirements for the degree of \\
\ifthenelse{\equal{\printtype}{skripsie}}{%
{\large \bf Bachelor of (Industrial) Engineering} \\ in the Faculty of Engineering at Stellenbosch University%
}{}%
}

\phdformula{
Dissertation presented for the degree of \\
\ifthenelse{\equal{\printtype}{phdsc}}{%
{\large \bf Doctor of Philosophy} \\ in the Faculty of Engineering at Stellenbosch University%
}{}%
\ifthenelse{\equal{\printtype}{phdcomm}}{%
{\large \bf Doctor of Philosophy} \\ in the Faculty of Economic and Management Sciences at Stellenbosch University%
}{}%
}

\decleration{
By submitting this \doctype \ electronically, I declare that the entirety of the work contained therein is my own, original work, that I am the sole author thereof (save to the extent explicitly \mbox{otherwise} stated), that reproduction and publication thereof by Stellenbosch University will not infringe any third party rights and that I have not previously in its entirety or in part submitted it for obtaining any qualification.
\\
\\
Date: \printgraduation \ 1, \printyear
}

\copyrightnotice{
Copyright \copyright \ \printyear~Stellenbosch University \\
\ \\
All rights reserved
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% newcommands for printing thesis information
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\printtitle}{\@thesistitle}
\newcommand{\printname}{\@student}
\newcommand{\printtype}{\@type}
\newcommand{\printgraduation}{\@graduation}
\newcommand{\printyear}{\@year}
\newcommand{\printsupervisorname}{\@supervisor}
\newcommand{\printcosupervisorname}{\@cosupervisor}
\newcommand{\printpromotername}{\@promoter}
\newcommand{\printcopromotername}{\@copromoter}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% for printing the preamble pages
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\ecsa}[1]{
\thispagestyle{plain}
%\ifodd\value{page}
%\newpage
%\
%\thispagestyle{plain}
%\fi
%\newpage
\chapter*{\normalfont{ECSA Exit Level Outcomes Reference}}
\markboth{ECSA Exit Level Outcomes Reference}{ECSA Exit Level Outcomes Reference}
\addstarredchapter{ECSA Exit Level Outcomes Reference}

%\makebox[1cm]{\ } \\ \vspace{0.10cm}
\thispagestyle{plain}

%\begin{center}
%{\Huge ECSA Exit Level Outcomes Reference}
%\end{center}

%\bigskip \bigskip
{\normalsize
#1
}
}

\newcommand{\engabstract}[1]{

\ifodd\value{page}
\newpage
\
\thispagestyle{plain}
\fi
\newpage
\chapter*{\normalfont{Abstract}}
\markboth{Abstract}{Abstract}
\addstarredchapter{Abstract}

%\makebox[1cm]{\ } \\ \vspace{0.10cm}
\thispagestyle{plain}

%\begin{center}
%{\Huge Abstract}
%\end{center}

%\bigskip \bigskip
{\normalsize
#1
}
}

\newcommand{\afrabstract}[1]{

\ifodd\value{page}
\newpage
\
\thispagestyle{plain}
\fi
\newpage
\chapter*{\normalfont{Uittreksel}}
\markboth{Uittreksel}{Uittreksel}
\addstarredchapter{Uittreksel}

%\makebox[1cm]{\ } \\ \vspace{0.10cm}
\thispagestyle{plain}

%\begin{center}
%{\Huge Uittreksel}
%\end{center}

%\bigskip \bigskip 
{\normalsize
#1
}
}


\newcommand{\acknowledgements}[1]{
%\makebox[1cm]{\ } \\ \vspace{0.1cm}
\thispagestyle{plain}

\chapter*{\normalfont{Acknowledgements}}
\markboth{Acknowledgements}{Acknowledgements}
\addstarredchapter{Acknowledgements}

%\begin{center}
%{\Huge Acknowledgements}
%\end{center}

%\bigskip \bigskip \bigskip \bigskip

{\normalsize The author wishes to acknowledge the following people and institutions for their various \linebreak \mbox{contributions} towards the completion of this work:
#1
}
}


%\newcommand{\acknowledgements}[1]{

%\markboth{Acknowledgements}{Acknowledgements}
%\addstarredchapter{Acknowledgements}
%{\normalsize The author wishes to acknowledge the following people and institutions for their various contributions towards the completion of this work:
%#1
%}
%}


\newcommand{\Glossary}{
\chapter*{\normalfont{Glossary}}
\markboth{Glossary}{Glossary}
\addstarredchapter{Glossary}
}

\newcommand{\listofsymbols}{
\chapter*{\normalfont{List of Reserved Symbols}}
\markboth{List of Reserved Symbols}{List of Reserved Symbols}
\addstarredchapter{List of Reserved Symbols}
}

\newenvironment{fontconventions}{
\begin{tabular}{|cll|}
\hline
\multicolumn{3}{|l|}{Symbols in this \doctype \ conform to the following font conventions:}\\
}{
\hline
\end{tabular}
}

\newenvironment{symboltable}{
\bigskip
\rowcolors{3}{gray!25}{}
\begin{longtable}{p{20mm}p{131.6mm}}
Symbol & Meaning \\ \hline
}{
\end{longtable}
}

\newcommand{\listofacronyms}{
\chapter*{\normalfont{List of Acronyms}}
\markboth{List of Acronyms}{List of Acronyms}
\addstarredchapter{List of Acronyms}
}

\newcommand{\ifoddmakenewpage}{
\ifodd\value{page}
\newpage
\
\thispagestyle{plain}
\fi
\newpage
}

\newcommand{\startarabicpagenumbering}{
\setcounter{page}{1}
\renewcommand{\thepage}{\arabic{page}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% the front page of the thesis
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\frontpage}{\renewcommand{\bibname}{References}
\thispagestyle{empty}
\makebox[5.0cm]{\ } \\
\vspace{0.5cm}  

\ifthenelse{\equal{\printtype}{msc}}{\newcommand{\doctype}{thesis}}{}
\ifthenelse{\equal{\printtype}{mcomm}}{\newcommand{\doctype}{thesis}}{}
\ifthenelse{\equal{\printtype}{meng}}{\newcommand{\doctype}{thesis}}{}
\ifthenelse{\equal{\printtype}{skripsie}}{\newcommand{\doctype}{project}}{}
\ifthenelse{\equal{\printtype}{phdsc}}{\newcommand{\doctype}{dissertation}}{}
\ifthenelse{\equal{\printtype}{phdcomm}}{\newcommand{\doctype}{dissertation}}{}

\begin{center}
\textbf{{\huge
\begin{spacing}{1}
\printtitle
\end{spacing}
}}
\end{center}
\begin{center}
\vspace{1cm}
{\Large \printname}
\end{center}
\vspace{0.2cm}
\begin{center}
%%Added by R Roux
\WaterMark{crest} \par
\vfill
%%

\end{center}
\vspace{0.2cm}
\begin{center}

\vfill

\ifthenelse{\equal{\printtype}{msc}}{\@mastersformula}{}
\ifthenelse{\equal{\printtype}{mcomm}}{\@mastersformula}{}
\ifthenelse{\equal{\printtype}{meng}}{\@mastersformula}{}
\ifthenelse{\equal{\printtype}{skripsie}}{\@skripsieformula}{}
\ifthenelse{\equal{\printtype}{phdsc}}{\@phdformula}{}
\ifthenelse{\equal{\printtype}{phdcomm}}{\@phdformula}{}

\end{center}

\vspace{2.5cm}

{\normalsize

\ifthenelse{\equal{\printtype}{phdsc}}{
Promoter: \printpromotername
\ifthenelse{\equal{\printcopromotername}{undefined}}{}{
\\Co-promoter: \printcopromotername
}
}{}%
%
\ifthenelse{\equal{\printtype}{phdcomm}}{
Promoter: \printpromotername
\ifthenelse{\equal{\printcopromotername}{undefined}}{}{
\\Co-promoter: \printcopromotername
}
}{}%
%
\ifthenelse{\equal{\printtype}{msc}}{
Supervisor: \printsupervisorname
\ifthenelse{\equal{\printcosupervisorname}{undefined}}{}{
\\Co-supervisor: \printcosupervisorname
}
}{}%
%
\ifthenelse{\equal{\printtype}{mcomm}}{
Supervisor: \printsupervisorname
\ifthenelse{\equal{\printcosupervisorname}{undefined}}{}{
\\Co-supervisor: \printcosupervisorname
}
}{}%
%
\ifthenelse{\equal{\printtype}{meng}}{
Supervisor: \printsupervisorname
\ifthenelse{\equal{\printcosupervisorname}{undefined}}{}{
\\Co-supervisor: \printcosupervisorname
}
}{}%
%
\ifthenelse{\equal{\printtype}{skripsie}}{
Supervisor: \printsupervisorname
\ifthenelse{\equal{\printcosupervisorname}{undefined}}{}{
\\Co-supervisor: \printcosupervisorname
}
}{}%
%
\hfill \printgraduation \ \printyear\rule{0mm}{4mm}

}

\newpage

\thispagestyle{empty}
\phantom{x}
\renewcommand{\thepage}{\roman{page}}
\setcounter{page}{0}
%\newpage

\makebox[1cm]{\ } \\ \vspace{0.10cm}
\thispagestyle{plain}
%\line(1,0){450}
%\begin{center}
%{\Huge Declaration}
%\end{center}
\chapter*{Declaration}

%\bigskip \bigskip \bigskip \bigskip

\@decleration

\vfill

\begin{center}
\@copyrightnotice
\end{center}

\newpage
\thispagestyle{plain}
\mbox{}

}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Package MINITOC setup
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\mtcsetdepth{minitoc}{2} % Set the depth of the minitoc to sections = 1, subsections = 2, subsubsections = 3
\mtcsettitlefont{minitoc}{\large\normalfont} % Set minitoc title font
\mtcsetrules{minitoc}{off}
\mtcsetfont{minitoc}{section}{\small\rmfamily\upshape\mdseries}
\mtcsetfont{minitoc}{subsection}{\small\rmfamily\slshape\mdseries}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Set up the format of the captions
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[format=hang,listofformat=parens]{subfig}

\usepackage{caption}
\captionsetup[subfigure]{style=default,margin=0pt,parskip=0pt,hangindent=0pt,indention=0pt,singlelinecheck=true,%
	labelsep=space,font=small,labelformat=parens,justification=justified,labelfont=up,textfont=sl}
\captionsetup[figure]{style=default,margin=0pt,parskip=0pt,hangindent=0pt,indention=0pt,singlelinecheck=true,%
	labelsep=colon,font=small,labelformat=default,justification=justified,labelfont=sc,textfont=sl}
\captionsetup[table]{style=default,margin=0pt,parskip=0pt,hangindent=0pt,indention=0pt,singlelinecheck=true,%
	labelsep=colon,font=small,labelformat=default,justification=justified,labelfont=sc,textfont=sl}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Set the formats of the headings of the TOC, etc...
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\tableofcontents{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
	\fi\chapter*{\normalfont{Table of Contents}\@mkboth{Table of Contents}{Table of Contents}}
	\@starttoc{toc}\if@restonecol\twocolumn\fi}

\def\listoffigures{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
	\fi\chapter*{\normalfont{List of Figures}\@mkboth{List of Figures}{List of Figures}}
	\mtcaddchapter[List of Figures]
	\@starttoc{lof}\if@restonecol\twocolumn\fi}

\def\listoftables{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
	\fi\chapter*{\normalfont{List of Tables}\@mkboth{List of Tables}{List of Tables}}
	\mtcaddchapter[List of Tables]
	\@starttoc{lot}\if@restonecol\twocolumn\fi}

\def\listofalgorithms{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
	\fi\chapter*{\normalfont{List of Algorithms}\@mkboth{List of Algorithms}{List of Algorithms}}
	\mtcaddchapter[List of Algorithms]
	\@starttoc{loa}\if@restonecol\twocolumn\fi}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Set up the colours for tables
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\colorlet{tableheadcolor}{gray!30}
\colorlet{tablerowcolor}{gray!15}
\newcommand{\headcol}{\rowcolor{tableheadcolor}}
\newcommand{\rowcol}{\rowcolor{tablerowcolor}}
\newcommand{\cellcolrow}{\cellcolor{tablerowcolor}}
\newcommand{\cellcolhead}{\cellcolor{tableheadcolor}}

% The top-most line of a table
\newcommand{\topline}{\arrayrulecolor{black}\specialrule{0.1em}{\abovetopsep}{0pt}%
\arrayrulecolor{tableheadcolor}\specialrule{\belowrulesep}{0pt}{0pt}%
\arrayrulecolor{black}}

% The top-most line of a table with white
\newcommand{\toplinew}{\arrayrulecolor{black}\specialrule{0.1em}{\abovetopsep}{0pt}%
\arrayrulecolor{white}\specialrule{\belowrulesep}{0pt}{0pt}%
\arrayrulecolor{black}}

% sadfsdfsdf sdfsdfsdf 
\newcommand{\midlinehr}{\arrayrulecolor{white}\specialrule{\aboverulesep}{0pt}{0pt}%
\arrayrulecolor{black}\specialrule{\lightrulewidth}{0pt}{0pt}%
\arrayrulecolor{tableheadcolor}\specialrule{\belowrulesep}{0pt}{0pt}%
\arrayrulecolor{tablerowcolor}}

% A line for when the upper row is tableheadcolor and the next line is white
\newcommand{\midlinehbc}{\arrayrulecolor{tableheadcolor}\specialrule{\aboverulesep}{0pt}{0pt}%
\arrayrulecolor{black}\specialrule{\lightrulewidth}{0pt}{0pt}%
\arrayrulecolor{tablerowcolor}\specialrule{\belowrulesep}{0pt}{0pt}%
\arrayrulecolor{black}}

% The line between the headings and the table body
\newcommand{\midline}{\arrayrulecolor{tableheadcolor}\specialrule{\aboverulesep}{0pt}{0pt}%
\arrayrulecolor{black}\specialrule{\lightrulewidth}{0pt}{0pt}%
\arrayrulecolor{white}\specialrule{\belowrulesep}{0pt}{0pt}%
\arrayrulecolor{black}}

% A line for when the upper row is rowcolor and the next line is white
\newcommand{\midlinecbw}{\arrayrulecolor{tablerowcolor}\specialrule{\aboverulesep}{0pt}{0pt}%
\arrayrulecolor{black}\specialrule{\lightrulewidth}{0pt}{0pt}%
\arrayrulecolor{white}\specialrule{\belowrulesep}{0pt}{0pt}%
\arrayrulecolor{black}}

% A line with no black, to further separate a rowcolor row and a white row
\newcommand{\midlinecw}{\arrayrulecolor{tablerowcolor}\specialrule{\aboverulesep}{0pt}{0pt}%
\arrayrulecolor{tablerowcolor}\specialrule{\lightrulewidth}{0pt}{0pt}%
\arrayrulecolor{white}\specialrule{\belowrulesep}{0pt}{0pt}%
\arrayrulecolor{black}}

% A line for when the upper row is white and the next line is rowcolor
\newcommand{\midlinewbc}{\arrayrulecolor{white}\specialrule{\aboverulesep}{0pt}{0pt}%
\arrayrulecolor{black}\specialrule{\lightrulewidth}{0pt}{0pt}%
\arrayrulecolor{tablerowcolor}\specialrule{\belowrulesep}{0pt}{0pt}%
\arrayrulecolor{black}}

% A line for when the upper row is white and the next line is white
\newcommand{\midlinewbw}{\arrayrulecolor{white}\specialrule{\aboverulesep}{0pt}{0pt}%
\arrayrulecolor{black}\specialrule{\lightrulewidth}{0pt}{0pt}%
\arrayrulecolor{white}\specialrule{\belowrulesep}{0pt}{0pt}%
\arrayrulecolor{black}}

% A line with no black, to further separate a white row and a rowcolor row
\newcommand{\midlinewc}{\arrayrulecolor{white}\specialrule{\aboverulesep}{0pt}{0pt}%
\arrayrulecolor{white}\specialrule{\lightrulewidth}{0pt}{0pt}%
\arrayrulecolor{tablerowcolor}\specialrule{\belowrulesep}{0pt}{0pt}%
\arrayrulecolor{black}}

% A line for the bottom of the table, when the last row is white
\newcommand{\bottomline}{\arrayrulecolor{white}\specialrule{\aboverulesep}{0pt}{0pt}%
\arrayrulecolor{black}\specialrule{\heavyrulewidth}{0pt}{\belowbottomsep}}%

% A line for the bottom of the table, when the last row is rowcolor
\newcommand{\bottomlinec}{\arrayrulecolor{tablerowcolor}\specialrule{\aboverulesep}{0pt}{0pt}%
\arrayrulecolor{black}\specialrule{\heavyrulewidth}{0pt}{\belowbottomsep}}%

\newcommand{\bottomlinect}{\arrayrulecolor{tableheadcolor}\specialrule{\aboverulesep}{0pt}{0pt}%
	\arrayrulecolor{black}\specialrule{\heavyrulewidth}{0pt}{\belowbottomsep}}%
%%%%% Set up the coloured tables %%%%%

% sadfsdfsdf sdfsdfsdf 
\newcommand{\midlinewbh}{\arrayrulecolor{white}\specialrule{\aboverulesep}{0pt}{0pt}%
	\arrayrulecolor{black}\specialrule{\lightrulewidth}{0pt}{0pt}%
	\arrayrulecolor{tableheadcolor}\specialrule{\belowrulesep}{0pt}{0pt}%
	\arrayrulecolor{tableheadcolor}}
	
	% A line for when the upper row is rowcolor and the next line is headcolor
\newcommand{\midlinecbh}{\arrayrulecolor{tablerowcolor}\specialrule{\aboverulesep}{0pt}{0pt}%
	\arrayrulecolor{black}\specialrule{\lightrulewidth}{0pt}{0pt}%
	\arrayrulecolor{tableheadcolor}\specialrule{\belowrulesep}{0pt}{0pt}%
	\arrayrulecolor{black}}

	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%








\endinput
%%
%% End of file `book.cls'.