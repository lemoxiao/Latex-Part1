% riverk.cls
% documentclass for proceedings, edited volumes and monographs
% to be published by River publishers
%
% Copyright 2009, 2010 River Publishers
%
% Disclaimer:
%   This file is distributed WITHOUT ANY WARRANTY;
%   without even the implied warranty of
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
%
% This program may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2003/12/01 or later.
%
% see README for the list of files comprising this work.

\def\filename{riverk}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{riverk}[2010/06/12 1.2]
\ClassInfo{riverk}{%
  Implementation by Siep Kroonenberg (siepo@cybercomm.nl)}

\ExecuteOptions{twoside,onecolumn,final}

\newif\if@ismono  \@ismonofalse
\DeclareOption{mono}{\@ismonotrue}

\newif\if@isjournal  \@isjournalfalse
\DeclareOption{journal}{\@isjournaltrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

\LoadClass[twoside,a4paper]{book}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% overrides for bk11.clo

% font sizes

\renewcommand\normalsize{%
   \@setfontsize\normalsize\@xipt{13}%
   \abovedisplayskip 10bp \@plus 2bp \@minus5bp
   \abovedisplayshortskip \z@ \@plus 3bp
   \belowdisplayshortskip 6bp \@plus 3bp \@minus3bp
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize
\renewcommand\small{%
   \@setfontsize\small\@xpt{12}%
   \abovedisplayskip 9bp \@plus3bp \@minus4bp
   \abovedisplayshortskip \z@ \@plus2bp
   \belowdisplayshortskip 5bp \@plus2bp \@minus2bp
   \def\@listi{\leftmargin\leftmargini
               \topsep 4bp \@plus2bp \@minus2bp
               \parsep 2bp \@plus1bp \@minus1bp
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\renewcommand\footnotesize{%
   \@setfontsize\footnotesize\@ixpt{11}%
   \abovedisplayskip 6bp \@plus2bp \@minus4bp
   \abovedisplayshortskip \z@ \@plus1bp
   \belowdisplayshortskip 3bp \@plus1bp \@minus2bp
   \def\@listi{\leftmargin\leftmargini
               \topsep 3bp \@plus1bp \@minus1bp
               \parsep 2bp \@plus1bp \@minus1bp
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\renewcommand\scriptsize{\@setfontsize\scriptsize\@viiipt{9.5}}
\newcommand\little{\@setfontsize\little\@viipt{8}}
\renewcommand\tiny{\@setfontsize\tiny\@vipt{7}}
\renewcommand\large{\@setfontsize\large\@xiipt{14}}
\renewcommand\Large{\@setfontsize\Large\@xivpt{16}}
\newcommand\LArge{\@setfontsize\LArge{16}{18.5}}
\renewcommand\LARGE{\@setfontsize\LARGE{18}{20}}
\renewcommand\huge{\@setfontsize\huge\@xxpt{25}}
\renewcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}

% page dimensions

\setlength\hoffset{-1in}
\setlength\voffset{0bp}

\setlength\headheight{12bp}
\setlength\headsep   {15bp}
\setlength\topskip   {10bp}
\setlength\footskip  {39bp}
\setlength\topmargin{45bp}
\textheight 494bp
\advance\textheight by \topskip
\textwidth  11.8cm

\setlength\maxdepth  {.5\topskip}
\setlength\@maxdepth\maxdepth
\setlength\columnsep{11bp}
\setlength\columnseprule{0bp}

\marginparwidth 1in
\setlength\marginparsep{10bp}
\setlength\marginparpush{5bp}

% fbox

\setlength\fboxsep{3bp}
\setlength\fboxrule{.4bp}

% lists

\setlength\partopsep{3bp \@plus 2bp \@minus 2bp}
\setlength{\leftmargini}{2em}
\setlength{\leftmarginii}{2.2em}
\setlength{\leftmarginiii}{1.87em}
\setlength{\leftmarginiv}{1.7em}
\setlength{\leftmarginv}{1em}
\setlength{\leftmarginvi}{1em}
\setlength{\labelsep}{.4em}
\setlength{\labelwidth}{\leftmargini}
\addtolength{\labelwidth}{-\labelsep}
\def\@listI{%
  \leftmargin \leftmargini
  \topsep  9bp \@plus 3bp \@minus 5bp
  \partopsep 3bp \@plus 1bp \@minus 2bp
  \itemsep 4.5bp \@plus 2bp \@minus 1bp
  \parsep 4.5bp \@plus 2bp \@minus 1bp }
\def\@listii{%
  \leftmargin \leftmarginii
  \labelwidth \leftmarginii
  \advance\labelwidth by -\labelsep
  \topsep 4.5bp \@plus 2bp \@minus 1bp
  \parsep 2bp \@plus 1bp \@minus 1bp
  \itemsep \parsep}
\def\@listiii{%
  \leftmargin \leftmarginiii
  \labelwidth \leftmarginiii
  \advance\labelwidth by -\labelsep
  \topsep 2bp \@plus 1bp \@minus 1bp
  \parsep \z@
  \partopsep 1bp \@plus 0bp \@minus 1bp
  \itemsep \topsep}
\def\@listiv{%
  \setlength{\leftmargin}{\leftmarginiv}%
  \setlength{\labelwidth}{\leftmarginiv}%
  \addtolength{\labelwidth}{-\labelsep}}
\def\@listv{%
  \setlength{\leftmargin}{\leftmarginv}%
  \setlength{\labelwidth}{\leftmarginv}%
  \addtolength{\labelwidth}{-\labelsep}}
\def\@listvi{%
  \setlength{\leftmargin}{\leftmarginvi}%
  \setlength{\labelwidth}{\leftmarginvi}%
  \addtolength{\labelwidth}{-\labelsep}}
\let\@listi\@listI
\@listi

% end of bk11.clo overrides

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% floats

\floatsep 14bp plus 2bp minus 4bp
\textfloatsep 20bp plus 2bp minus 4bp
\intextsep 14bp plus 4bp minus 4bp
\setlength\dblfloatsep{12bp \@plus 2bp \@minus 2bp}
\setlength\dbltextfloatsep{20bp \@plus 2bp \@minus 4bp}
\setlength\@fptop{0bp \@plus 1fil}
\setlength\@fpsep{8bp \@plus 2fil}
\setlength\@fpbot{0bp \@plus 1fil}
\setlength\@dblfptop{0bp \@plus 1fil}
\setlength\@dblfpsep{8bp \@plus 2fil}
\setlength\@dblfpbot{0bp \@plus 1fil}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% centering the page on the paper

\paperwidth=595.28bp % 21cm
\paperheight=841.6bp % 29.69cm

\AtBeginDocument{%
  \setlength\@tempdima{\paperwidth}%
  \addtolength\@tempdima{-\textwidth}%
  \divide\@tempdima by 2
  \marginparwidth \z@
  \marginparsep \z@
  \oddsidemargin \@tempdima
  \evensidemargin \@tempdima}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% pdf properties

\AtBeginDocument{%
  \newif \ifmypdf
  \ifx \pdfoutput \undefined
    \mypdffalse
  \else
    \ifnum \pdfoutput=1
      \mypdftrue
    \else
      \mypdffalse
    \fi
  \fi
  \ifmypdf
    \edef\pdfdate{%
      \the\year
      \ifnum \month < 10 0\the\month \else \the\month \fi
      \ifnum \day < 10 0\the\day \else \the\day \fi}
    \pdfoptionpdfminorversion=4
    \pdfinfo{%
      /CreationDate (D:\pdfdate)
      /ModDate (D:\pdfdate)
      /Trapped (False)
      /GTS_PDFXVersion (PDF/X-3)
      /Title (\jobname)
    }
    %\pdfpageattr{/TrimBox [ 0 0 595.28 841.6] }
    \pdfhorigin=1in
    \pdfvorigin=1in
    \pdfpagewidth=\paperwidth
    \pdfpageheight=\paperheight
  \fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calculating last page

%\RequirePackage{graphicx}
\RequirePackage{ifthen}

\newcommand\firstpage[1]{%
  \gdef\@firstpage{#1}%
  \ifnum\@firstpage>\c@page
    \setcounter{page}{#1}%
    \PackageWarning{rivopen}{Increasing pagenumber to \@firstpage}%
  \else \ifnum\@firstpage<\c@page
    \PackageWarning{rivopen}{Firstpage lower than pagenumber}\fi\fi
    \xdef\@firstpage{\the\c@page}%
    }
\def\@firstpage{1}
\pagenumbering{arabic}

\let\r@lastpg\relax

\newcounter{lastpage}
\setcounter{lastpage}{0}
\newcommand\lastpage[1]{\setcounter{lastpage}{#1}}
\AtBeginDocument{%
  % code adapted from latex.ltx, ltxref section
  \setcounter{lastpage}{%
    \ifx \r@lastpg \relax 0
    \else \expandafter \@secondoftwo\r@lastpg
    \fi}}

\AtEndDocument{%
  \clearpage
  \addtocounter{page}{-1}%
  \immediate\write\@auxout{\string
  \newlabel{lastpg}{{}{\thepage}}}%
  \addtocounter{page}{1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sectioning

% initialize chapter/article numbering

\if@ismono
  \setcounter{chapter}{0}
\else
  \setcounter{chapter}{1}
  \newcounter{article} % for backwards compatibility
  \setcounter{article}{0} % indicates unset
\fi

% opening environment

\renewcommand\title[2][\@empty]{%
    \begingroup
      \let\\=\endgraf
      \ifthenelse{\equal{\@empty}{#1}}{%
        \xdef\@runningtitle{#2}}{%
        \xdef\@runningtitle{#1}}%
    \endgroup
    \gdef\@title{#2}}

\def\@title{}
\def\@runningtitle{}

\renewcommand\author[2][\@empty]{%
  \begingroup
  \let\\=\endgraf
  \gdef\@author{#2}%
  \endgroup
  \ifthenelse{\equal{\@empty}{#1}}{%
    \xdef\@runningauthor{#2}}{%
    \xdef\@runningauthor{#1}}%
}

\def\@author{}
\def\@runningauthor{}

\def\institute#1{\gdef\@institute{#1}}
\def\@institute{}

% for hyperref compatibility:
\let\NoHyper\relax
\let\endNoHyper\relax
\def\hyperdef#1#2#3{\relax}

% enable thanks within article title and chapter title
% Both reset footnote counter to 0,
% so no point in saving old value of footnote counter
\global\let\thefootnotes@ve\thefootnote
\global\let\@makefnmarks@ve\@makefnmark
\global\let\@makefntexts@ve\@makefntext

\def\enablethanks{%
  \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
  \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
  \long\def\@makefntext##1{\parindent 1em\noindent
          \hb@xt@1.8em{%
              \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
  \let\thanks\footnote}

\def\disablethanks{%
  \let\thanks\relax
  \let\@makefntext\@makefntexts@ve
  \let\@makefnmark\@makefnmarks@ve
  \setcounter{footnote}{0}}

\def\opening{%
  \NoHyper
  \hsize\textwidth
  }

\if@ismono \else
  \gdef\maketitle{\endopening}
\fi

\def\endopening{%
  % we use chapter counter, also for non-monographs
  \ifnum \c@article = 0 \else
    \global\c@chapter=\c@article
  \fi
  \begingroup
    \setcounter{footnote}{0}%
    \enablethanks
    \newpage\global\@topnum\z@
    \thispagestyle{opening} % article.cls: also in \maketitle
    \@maketitle
    \disablethanks
  \endgroup
  \setcounter{footnote}{0}%
  \let\@maketitle\relax
  %\gdef\@thanks{}%
  \gdef\@title{}%
  %\let\thanks\relax

  \gdef\title##1{\opening@only\title}
  \gdef\author##1{\opening@only\author}
  \gdef\institute##1{\opening@only\institute}
  \gdef\date##1{\opening@only\date}%
  \gdef\nodagger{\opening@only\nodagger}
  \endNoHyper
}

\def\opening@only#1{\PackageWarning{rivopen}{\string#1\space
                effective only inside opening environment.}}

\if@ismono \else
\def\@maketitle{%
  \begingroup
    \null\vskip-7.7bp
    \centering
    {\sffamily\bfseries\Huge \thechapter\par}
    \vskip -3pt\rule{\textwidth}{1pt}\par\vskip 5pt
    {\sffamily\bfseries\LArge\@title\par}
    \rule{\textwidth}{1pt}\par\vskip 14pt
    \leavevmode
    \ifx\@author \@empty \else
      {\large \@author\par}
    \fi
    \ifx\@institute \@empty \else
      \vskip 24pt
      \raggedright
      \parindent=0pt
      \hangindent=0pt
      {\small \itshape\@institute\par}
    \fi
    \vskip 44pt\relax
    \gdef\@author{}%
    \gdef\@institute{}%
  \endgroup
  \if@isjournal
    \markboth{\@runningauthor}{\@runningtitle}
  \else
    \markboth{\@runningtitle}{\@runningtitle}
  \fi
}
\fi % end \if@ismono \else

% this will normally be overridden
% \AtBeginDocument{\markboth{\@runningtitle}{\@runningtitle}}

% alternate way to define runningauthor/runningtitle
% can also use optional argument to title and author
% these override the optional arguments if they come after
% the title/author commands

\def\runningauthor#1{\xdef\@runningauthor{#1}}
\xdef\@runningauthor{}

\def\runningtitle#1{\xdef\@runningtitle{#1}}
\xdef\@runningtitle{}

\long\def\keywords#1{\vspace{13pt}\noindent
  {\sffamily\bfseries Keywords:}~#1.\par}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% copyright block

\def\booktitle#1{\def\@booktitle{#1}}
\booktitle{No Title}
\def\copyrightowner#1{\def\@copyrightowner{#1}}

\def\@copyrightowner{River Publishers}

\newcommand\pubyear[1]{\gdef\@pubyear{#1}}
\def\@pubyear{\number\year}

\@ifundefined{textcopyright}{\def\textcopyright{\copyright}}{}

\def\pagerange#1{\gdef\thepagerange{#1}}

\def\thepagerange{%
  \ifnum\c@lastpage =0 {\ \bf PLEASE RUN AGAIN} \else
    \ifnum\c@lastpage = \@firstpage \ \@firstpage\else
      \ \@firstpage--\thelastpage
  \fi\fi}

\gdef\@copyrightfoot{{%
  \parindent 0pt\rlap{\vbox to 0pt{%
  \parbox{\textwidth}{%
    \leavevmode\small\itshape\@booktitle,~{\upshape\thepagerange.}\\
    {\upshape\textcopyright~\@pubyear} \@copyrightowner.
    All rights reserved.}\vss}}}}

% page headers

\def\myleftmark{}
\def\myrightmark{}
\gdef\markboth#1#2{%
    \gdef\myleftmark{#1}%
    \gdef\myrightmark{#2}}
\if@ismono
  \gdef\chaptermark#1{\xdef\myleftmark{\thechapter\ \ #1}}
\else
  \let\chaptermark\@gobble
\fi
\if@isjournal
  \let\sectionmark\@gobble
\else
  \gdef\sectionmark#1{\xdef\myrightmark{\thesection\ \ #1}}
\fi

\gdef\@markfont{\itshape\small}
\gdef\@pgnumfont{\rm\normalsize} % same as default

\def\ps@headings{%
  \let\@oddfoot\@empty
  \let\@evenfoot\@oddfoot
  \def\@evenhead{\@pgnumfont\thepage\quad
    \@markfont\myleftmark\hfill\hbox{}}%
  \def\@oddhead{\hbox{}\hfill\@markfont\myrightmark\quad
    \@pgnumfont\thepage}%
}
\def\ps@empty{%
  \let\@oddfoot\@empty
  \let\@evenfoot\@oddfoot
  \def\@evenhead{}%
  \def\@oddhead{}%
}
\let\ps@part\ps@empty
\let\ps@chapter\ps@empty

\def\ps@opening{%
  \let\@oddhead\@empty
  \let\@evenhead\@oddhead
  \def\@oddfoot{\@copyrightfoot \hss}
  \let\@evenfoot\@oddfoot}

% chapter heads

\def\@makechapterhead#1{%
  \begingroup
    \null\vskip-7.7bp
    \centering
    {\sffamily\bfseries\Huge \thechapter\par}
    \vskip -3pt\rule{\textwidth}{1pt}\par\vskip 5pt
    \enablethanks
    {\sffamily\bfseries\LArge #1\par}
    \disablethanks
    \rule{\textwidth}{1pt}\par
    \vskip 44pt\relax
  \endgroup
  }
\def\@makeschapterhead#1{%
  \begingroup
    \null\vskip-7.7bp
    \centering
    \rule{\textwidth}{1pt}\par\vskip 5pt
    \enablethanks
    {\sffamily\bfseries\LArge #1\par}
    \disablethanks
    \rule{\textwidth}{1pt}\par
    \vskip 44pt\relax
  \endgroup
  }

\def\@schapter#1{%
  \markboth{#1}{#1}%
  \addcontentsline{toc}{chapter}{#1}%
  \@makeschapterhead{#1}%
  \@afterheading}

% toc needs special treatment

\def\tableofcontents{%
  \let\atocsave\addcontentsline
  \def\addcontentsline##1##2##3{\relax}%
  \chapter*{Contents}
  \let\addcontentsline\atocsave
  \@starttoc{toc}}

\def\@mkboth#1#2{}

% lower-level sectioning

\renewcommand\@seccntformat[1]{{%
  \sffamily\upshape\csname the#1\endcsname}\hspace{0.5em}}

\def\section{\@startsection{section}{1}{\z@}%
  %{-20bp plus 3bp minus 5bp}{6.5bp plus 2bp minus 1bp}%
  {-20bp plus 1sp minus 5bp}{6.5bp plus 2bp minus 1bp}%
  {\large\sffamily\bfseries\raggedright}}

\def\subsection{\@startsection{subsection}{2}{\z@}%
  %{-16bp plus 2bp minus 3bp}{5bp plus 2bp minus 1bp}%
  {-16bp plus 1sp minus 3bp}{5bp plus 2bp minus 1bp}%
  {\normalsize\sffamily\bfseries\raggedright}}

\def\subsubsection{\@startsection{subsubsection}{3}{\z@}%
  %{-13pt plus .5bp minus 1bp}{1sp}%
  {-13pt plus 1sp minus 1bp}{1sp}%
  {\normalsize\sffamily\bfseries\raggedright}}

\setcounter{secnumdepth}{4}

\if@ismono
  % keep book.cls definition of switching
  % chapter numbering to Alph
\else
  \def\appendix{%
    \section*{\appendixname}}
\fi

\if@isjournal
  \renewcommand\thesection{\@arabic\c@section}
  \renewcommand\thefigure{\@arabic\c@figure}
  \renewcommand\thetable{\@arabic\c@table}
  \renewcommand\theequation{\@arabic\c@equation}
 \renewcommand\thechapter{} %JK
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% itemize, enumerate and some other list environments

\newskip\topsepm@th
\gdef\rivitemargs{%
  \topsep 4bp plus 2bp\parsep \z@
  \partopsep     \z@ \@plus 1pt
  \itemsep \z@
  \parsep \z@
  \leftmargin\csname leftmargin\romannumeral\@itemdepth\endcsname
  \labelwidth\leftmargin
  \advance\labelwidth-\labelsep
  \rightmargin   \z@
  \listparindent \z@
  \itemindent    \z@
}
\global\let\rivenumargs\rivitemargs

\renewcommand{\@mklab}[1]{#1\hfil} % for custom list env-s only

\def\@@enum@label#1{\hss \llap{#1}} % may stick out into l. margin
\def\@@item@label#1{\hss \llap{#1}}

\def\enumerate{\@ifnextchar[%
    {\riv@enumerate}%
    {\riv@enumerate[]}}
\def\riv@enumerate[#1]{%
     \ifnum \@enumdepth >3 \@toodeep\else
       \advance\@enumdepth \@ne
       \edef\@enumctr{enum\romannumeral\the\@enumdepth}
       \list{\csname label\@enumctr\endcsname}{%
         \topsepm@th \topsep
         \rivenumargs
         \usecounter{\@enumctr}
         \def\l@b@l@{#1}
         \ifx\l@b@l@\@empty \else
           \settowidth\labelwidth{#1.}
           \setlength{\@tempdima}{\labelwidth}
           \addtolength{\@tempdima}{\labelsep}
           \ifdim \@tempdima > \leftmargin
             \setlength{\leftmargin}{\@tempdima}
           \fi
         \fi
         \let\makelabel\@@enum@label}
     \fi
   }
\let\endenumerate\endlist

\def\itemize{\@ifnextchar[{\riv@itemize}{\riv@itemize[]}}
\def\riv@itemize[#1]{\def\riv@arg{#1}%
    \ifnum \@itemdepth >3 \@toodeep
    \else
      \advance\@itemdepth \@ne
      \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
      \ifx \riv@arg\empty
        \list {\csname\@itemitem\endcsname}{%
        \topsepm@th \topsep
        \rivitemargs
          \let\makelabel\@@item@label}
      \else
        \list {\riv@arg }{%
          \rivitemargs
          \let\makelabel\@@item@label
          }
      \fi
    \fi
    }
\let\enditemize\endlist

\renewenvironment{quotation}{\list{}{%
  \listparindent 1.5em%
  \itemindent \z@
  \rightmargin \leftmargin
  \parsep \z@}%
  \let\everysave\everypar
  \item \relax}{\endlist}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% math

\let\eqnarsave\eqnarray
\let\endeqnarsave\endeqnarray
\newdimen\arcolsave
\arcolsave=\arraycolsep
\def\eqnarray{\arraycolsep=.5\arcolsave\eqnarsave}
\def\endeqnarray{\endeqnarsave\arraycolsep=\arcolsave}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% floats

\setcounter{topnumber}{2}
\setcounter{bottomnumber}{1}
\setcounter{totalnumber}{3}
\setcounter{dbltopnumber}{2}
\renewcommand{\topfraction}{.85}
\renewcommand{\textfraction}{.01}
\renewcommand{\bottomfraction}{.4}
\renewcommand{\floatpagefraction}{.84}
\renewcommand{\dblfloatpagefraction}{.84}
\renewcommand{\dbltopfraction}{.7}

\def\@floatboxreset {%
  \reset@font \footnotesize \@setminipage \centering
}
\long\def\@makecaption#1#2{%
  \def\fnstr@t{\rule[-.2\baselineskip]{0pt}{0pt}}%
  \vspace{2pt}%
  \footnotesize
  \sbox\@tempboxa{#1\hskip.5em #2\fnstr@t}%
  \ifdim \wd\@tempboxa >\hsize
    #1\hskip.5em #2\fnstr@t\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vspace{1sp}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% footnotes

\def\footnoterule{\kern-4\p@
  \hrule width 3pc
  \kern 3.6\p@}
\long\def\@makefntext#1{\parindent 1em\noindent
 \hbox to 1.5em{\hss\textsuperscript{\@thefnmark}}%
   \hskip0.5em\footnotesize#1}
\def\@makefnmark{\hbox{\textsuperscript{\@thefnmark}}}
\footnotesep 6pt
\skip\footins 10pt plus 4pt minus 2pt

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% references

\def\refname{References}
\def\bibname{Bibliography}
\let\shortcite\cite
\let\citeauthor\cite
\let\citeyear\cite
\def\newblock{}
\def\newblock{\hskip .11em\@plus.33em\@minus.07em}

\def\@biblabel#1{\hfill[#1]}
\renewenvironment{thebibliography}[1]{%
  \if@ismono
    \chapter*{\bibname}
    \message{\bibname}
  \else
    \section*{\refname}
    \if@isjournal \else
      \markboth{\@runningtitle}{\refname}
    \fi
    \message{\refname}
  \fi
  \footnotesize
  \def\bibwidthlabel{\releft#1\redot\reright}%
    \list{\@biblabel{\@arabic\c@enumiv}}{%
       \settowidth\labelwidth{\@biblabel{#1}}%
       \leftmargin\labelwidth
       \advance\leftmargin\labelsep
       \itemsep \z@
       \parsep \z@
       \usecounter{enumiv}%
       \let\p@enumiv\@empty
       \renewcommand\theenumiv{\@arabic\c@enumiv}}%
     \sloppy
     \clubpenalty10000
     \@clubpenalty \clubpenalty
     \widowpenalty10000%
     \sfcode`\.\@m%
  }{%
    \def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
    \endlist
  }


\AtBeginDocument{%
  \ifx\bibsection\@undefined\else
    \if@ismono
      \renewcommand\bibsection{\chapter*{\bibname}}
    \else
      \renewcommand\bibsection{\section*{\refname
        \markboth{\@runningtitle}{\refname}}}
    \fi \fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% indices

\renewenvironment{theindex}%
  {\@restonecoltrue
   \twocolumn[\@makeschapterhead{\indexname}]%
   \markboth{\indexname}{\indexname}%
   \addcontentsline{toc}{chapter}{\indexname}%
   \thispagestyle{plain}\parindent\z@
   \parskip\z@ \@plus .3\p@\relax
   \columnseprule \z@
   \columnsep 35\p@
   \let\item\@idxitem}{\onecolumn}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% typesetting parameters

\parskip 0bp
\parindent 1.5em

\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}

\@lowpenalty 51
\@medpenalty 151
\@highpenalty 301
\@beginparpenalty -\@lowpenalty
\@endparpenalty -\@lowpenalty
\@itempenalty -\@lowpenalty
\clubpenalty=10000
\widowpenalty=10000
\hyphenpenalty 200
\doublehyphendemerits 640000  % corresponds to badness 800
\finalhyphendemerits  1000000  % corresponds to badness 1000
\frenchspacing
\flushbottom

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\pagestyle{headings}
\pagenumbering{arabic}

\def\clearemptydoublepage{\clearpage\ifodd\c@page \else
    ~ \thispagestyle{empty}\newpage\fi}
\let\cleardoublepage\clearemptydoublepage

\endinput
%%
%% End of file `riverk.cls'.
