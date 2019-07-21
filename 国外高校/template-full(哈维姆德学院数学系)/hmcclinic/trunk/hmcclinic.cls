% \iffalse meta-comment
% 
% hmcclinic.cls -- Harvey Mudd College Clinic Report LaTeX Class File
%
% $Id: hmcclinic.cls 384 2011-08-25 21:43:31Z cmc $
%
% Copyright (C) 2007--2010
%
% Claire Connelly <cmc@math.hmc.edu>
%              and 
% Melissa O'Neill <oneill@cs.hmc.edu>
%
% Written for Harvey Mudd College's
%
%   Department of Computer Science
%   Department of Mathematics
%
% *** HMC STUDENTS SHOULD NOT CHANGE THE TYPESETTING PARAMETERS FOR ***
% *** THEIR CLINIC REPORTS WITHOUT FIRST CHECKING WITH THEIR CLINIC ***
% *** DIRECTOR.  STUDENTS WISHING TO ADD FEATURES SHOULD DO SO WITH *** 
% *** OTHER FILES, NOT BY MODIFYING THIS FILE.                      *** 
%
% License:
% 
%   This program is free software; you can redistribute it and/or
%   modify it under the terms of the GNU General Public License as
%   published by the Free Software Foundation; either version 2 of the
%   License, or (at your option) any later version.
%
%   This program is distributed in the hope that it will be useful,
%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%   GNU General Public License for more details. 
%
%   You should have received a copy of the GNU General Public License
%   along with this program; if not, write to the Free Software
%   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
%   02111-1307  USA 
%
% \fi
%%

\ProvidesClass{hmcclinic}[2011/08/25 HMC Clinic Report class, version 3.4]
\NeedsTeXFormat{LaTeX2e}

%%% Declare and set some options.

\newif\ifshortdoc\shortdocfalse
\DeclareOption{proposal}{%
  \shortdoctrue
  \AtEndOfClass{\def\@reporttype{Statement of Work}}%
}
\DeclareOption{midyear}{%
  \AtEndOfClass{\def\@reporttype{Midyear Report}}%
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}%
    {\ifshortdoc report\else book\fi}}
\ExecuteOptions{}
\ProcessOptions

%%% Load the book class (or article class for proposals) with some
%%% default options.
\ifshortdoc
\LoadClass[11pt,twoside]{article}
\else
\LoadClass[11pt,openright]{book}
\fi

%%% Include local configuration file, if any.
\InputIfFileExists{hmcclinic.cfg}{}{}


%%% Get some useful information when errors occur.
\setcounter{errorcontextlines}{25}


%%% Load some required/very useful packages.
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{xspace}
\RequirePackage{verbatim}
\RequirePackage{booktabs}         % Publication-quality tables.
\RequirePackage{natbib}           % Better bibliography handling.
\RequirePackage{ifthen}
\RequirePackage{graphics}
\RequirePackage[obeyspaces,spaces]{url}
\RequirePackage{fancyhdr}
\RequirePackage{caption}[2010/01/09]
\captionsetup{
  font={small,sf}                % Use small, sans-serif text.
  ,labelfont=bf                  % Make label bold.
  ,labelsep=quad                 % Separate label from text with a space.
  ,justification=justified       % Justify caption.
  ,margin=2em
}


\AtBeginDocument{
  %%% Define caption appearance for subfigures (requires subfig
  %%% package to be loaded in the document preamble).
  \captionsetup*[subfloat]{
    font={small,sf}               % Use small, sans-serif font.
    ,labelformat=simple           % No parentheses on labels.
    ,labelsep=period              % Period and space separator.
    ,justification=justified
    ,format=hang
    ,margin=0pt
  }
}


%%% Set the default typeface via a package.
\RequirePackage[T1]{fontenc}
\RequirePackage{mathpazo}
\RequirePackage[scaled=.90]{helvet}


%%% Use Latin Modern Typewriter as the monospace typeface.
\renewcommand{\ttdefault}{lmtt}

%%% Set URLs in sans-serif type.
\AtBeginDocument{\urlstyle{sf}}

%%% Set some defaults for bibliographic punctuation used by natbib.sty.
\bibpunct[:~]{(}{)}{;}{a}{,}{,~} 


%%% Define some environments.
\ifshortdoc
% No need to define abstract
\else
\newenvironment{abstract}{\chapter*{Abstract}%
\addcontentsline{toc}{chapter}{Abstract}}{}
\fi

\newenvironment{acknowledgments}{\chapter*{Acknowledgments}%
\addcontentsline{toc}{chapter}{Acknowledgments}}{}


%%% Set the page layout parameters for article and books.

\setlength{\headheight}{14pt}

\ifshortdoc
%%% Set the headers and footers.
 
\pagestyle{fancy}{%
  \fancyhf{} %% Clear all headers and footers.
  \fancyhead[LE]{\textbf{\thepage{}}}
  \fancyhead[RE]{\nouppercase\leftmark}
  \fancyhead[LO]{\nouppercase\rightmark}
  \fancyhead[RO]{\textbf{\thepage}}
  \fancyfoot{}
}

%%% Redefine the \sectionmark and \subsectionmark commands.  Note that
%%%  this redefinition must occur after setting pagestyle to fancy.
\renewcommand{\sectionmark}[1]{%
  \markboth{#1}{}}
\renewcommand{\subsectionmark}[1]{%
  \markright{#1}{}}

\else
%%% Set the headers and footers.

\pagestyle{fancy}{%
  \fancyhf{} %% Clear all headers and footers.
  \fancyhead[LE]{\textbf{\thepage{}}\hspace{1em}\nouppercase\leftmark}
  \fancyhead[RO]{\nouppercase\rightmark\hspace{1em}\textbf{\thepage}}
  \fancyfoot{}
}

%%% Redefine the \chaptermark and \sectionmark commands.  Note that
%%%  this redefinition must occur after setting pagestyle to fancy.
\renewcommand{\chaptermark}[1]{%
  \markboth{#1}{}}
\renewcommand{\sectionmark}[1]{%
  \markright{#1}{}}
\fi

\addtolength{\headwidth}{.5\marginparsep}
\addtolength{\headwidth}{.5\marginparwidth}

\fancypagestyle{plain}{%
  \fancyhf{} %% Clear all headers and footers.
%  \fancyfoot[LE,RO]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{empty}{%
  \fancyhf{} %% Clear all headers and footers.
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{front}{%
  \fancyhf{} %% Clear all headers and footers.
  \fancyhead[LE]{\textbf{\thepage{}}\hspace{1em}\nouppercase\leftmark}
  \fancyhead[RO]{\nouppercase\rightmark\hspace{1em}\textbf{\thepage}}
}



%%% Define the layout of the title page.

\newlength{\ignored@length}
\newcommand{\set@ess}[1]{%
  \renewcommand{\and}{%
    \global\def\@ess{s}%
  }%
  \global\def\@ess{}%
  \settowidth{\ignored@length}{#1}
}

  \renewcommand{\maketitle}{%
    \thispagestyle{empty}
    \begin{titlepage}%
      \enlargethispage{3em}
      \let\footnotesize\small
      \let\footnoterule\relax
      \let\thanks\ignoreit
      \raggedright
      \parindent0pt
      \null
      {\large \scalebox{0.55}{\includegraphics{hmclogo}} \\[0.5ex]%
                                % Harvey Mudd College\\[0.5ex]%
        \@department\par}%
        \vskip 60pt minus 15pt
      {\large \@reporttype{} for \\[0.5ex]%
        \emph{\@sponsor}}
        \vskip 60pt minus 15pt
      {\LARGE \noindent\@title \par}%
      \vskip 3em%
      {\large \@date \par}%       % Set date in \large size.
      \vskip 3em%
      {\large
        \lineskip .75em%
        \let\and\par
        \set@ess{\@author}%
        \textbf{Team Member\@ess} \\[0.5ex]
        \begin{tabular}[t]{l}%
          \global\let\and\\%
          \@author
        \end{tabular}%
        \par}%
      \vskip 1.5em%
      {\large
        \lineskip .75em%
        \set@ess{\@advisor}
        \textbf{Advisor\@ess} \\[0.5ex]
      \begin{tabular}[t]{l}%
        \global\let\and\\%
        \@advisor
      \end{tabular}\par}%
    \vskip 1.5em%
    {\large
      \lineskip .75em%
      \set@ess{\@liaison}
      \textbf{Liaison\@ess} \\[0.5ex]
      \begin{tabular}[t]{l}%
        \global\let\and\\%
        \@liaison
      \end{tabular}\par}%
      \ifx\@consultant\@undefined%
      \else
        {\vskip 1.5em%
          {\large
           \lineskip .75em%
           \set@ess{\@consultant}
           \textbf{Consultant\@ess} \\[0.5ex]
           \begin{tabular}[t]{l}%
           \global\let\and\\%
           \@consultant
           \end{tabular}\par}}%
      \fi
     
    \@thanks
    \vfil\eject
    \cleardoublepage
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

%%% Define some commands for specifying information for the title page
%%%  (and other parts of the document).

\def\department#1{\gdef\@department{#1}}
\def\@department{\@latex@warning@no@line{No \noexpand\department given}}
\def\sponsor#1{\gdef\@sponsor{#1}}
\def\@sponsor{\@latex@warning@no@line{No \noexpand\sponsor given}}
\def\liaison#1{\gdef\@liaison{#1}}
\def\@liaison{\@latex@warning@no@line{No \noexpand\liaison given}}
\def\advisor#1{\gdef\@advisor{#1}}
\def\@advisor{\@latex@warning@no@line{No \noexpand\advisor given}}
\def\consultant#1{\gdef\@consultant{#1}}
\def\reporttype#1{\gdef\@reporttype{#1}}
%\def\@reporttype{\@latex@warning@no@line{No \noexpand\reporttype given}}
%%% Default to Final Report
\def\@reporttype{Final Report}


%%% Make \eqref behave the way we want.
\renewcommand{\eqref}[1]{Equation~\ref{#1}}


%%% Set Metafont font.  If logo not available, use the second form.
%%%
%%% \font\mffont=logosl10 scaled\magstep1
\let\mffont=\sf



%%% Fix \cleardoublepage so it doesn't put headers on pages that are
%%% supposed to be blank.
\renewcommand*{\cleardoublepage}{%
  % original definition, see latex.ltx
  \clearpage
  \if@twoside
  \ifodd\c@page
  \else
  \thispagestyle{empty}% added
  \hbox{}\newpage
  \if@twocolumn
  \hbox{}\newpage
  \fi
  \fi
  \fi
}


%%% Handle specifics for short or long documents.
\ifshortdoc
%% Ignore the \*matter commands.
\newcommand{\frontmatter}{}
\newcommand{\mainmatter}{}
\newcommand{\backmatter}{}
\else
%% For longer documents, define the effects of the \*matter
%% commands.
\renewcommand{\frontmatter}{%
  \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}
  \pagestyle{front}}

\renewcommand{\mainmatter}{%
  \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}%
  \pagestyle{fancy}}

%% Specify some details about the appearance of the table of contents.
\renewcommand{\tableofcontents}{%
  \if@twocolumn
  \@restonecoltrue\onecolumn
  \else
  \@restonecolfalse
  \fi
  \chapter*{\contentsname
    \@mkboth{%
      \contentsname}{\contentsname}}%
  \@starttoc{toc}%
  \if@restonecol\twocolumn\fi
}

%% Redefine the thebibliography environment to typeset as a chapter.
\renewenvironment{thebibliography}[1]
{\chapter*{\bibname
    \@mkboth{\bibname}{\bibname}
    \addcontentsline{toc}{chapter}{\bibname}}%
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
\renewcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty

\AtBeginDocument{\@ifundefined{bibsection}{}{%
    % Handle natbib
    \let\N@tbibsection\bibsection
    \def\bibsection{\N@tbibsection\addcontentsline{toc}{chapter}{\bibname}}%
  }}

%% Redefine the theindex environment to typeset as a chapter.
\renewenvironment{theindex}
{\if@twocolumn
  \@restonecolfalse
  \else
  \@restonecoltrue
  \fi
  \columnseprule \z@
  \columnsep 35\p@
  \twocolumn[\@makeschapterhead{\indexname}]%
  \@mkboth{\indexname}%
  {\indexname}%
  \addcontentsline{toc}{chapter}{\indexname}%
  \thispagestyle{plain}\parindent\z@
  \parskip\z@ \@plus .3\p@\relax
  \let\item\@idxitem}
{\if@restonecol\onecolumn\else\clearpage\fi}


%% End of special handling for longer documents.
\fi


%% Ragged bottom is better than the alternative...

\raggedbottom



