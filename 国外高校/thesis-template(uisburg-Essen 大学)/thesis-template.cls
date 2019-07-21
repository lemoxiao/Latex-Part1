%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[2015/01/01]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load base class
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[openright, titlepage, numbers=noenddot, cleardoublepage=empty, BCOR=5mm, a4paper, fontsize=12pt, oneside, DIV=calc]{scrreprt}

\ProvidesClass{thesis-template}[2019/02/26 thesis-template class, on base of UDE-SYSSEC thesis template]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% translations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\ifgerman
% default to german
\germantrue
% add package options:
\DeclareOption{german}{
	\germantrue
}
\DeclareOption{english}{
	\germanfalse
}

%% Set defaults for English language
\newcommand{\@supervisor}{}
\newcommand{\@reviewerA}{}
\newcommand{\@reviewerB}{}
\newcommand{\@degree}{}
\newcommand{\@location}{}
\newcommand{\@degreecourse}{}
\newcommand{\@fieldOfDissertation}{}
\newcommand{\@emailAddress}{}
\newcommand{\@semester}{}
\newcommand{\@matriculationNumber}{}

\newcommand{\@stringTitle}{}
\newcommand{\@stringAuthor}{}
\newcommand{\@stringMail}{}
\newcommand{\@stringMatriculationNumber}{}
\newcommand{\@stringDegree}{}
\newcommand{\@stringDegreeCourse}{}
\newcommand{\@stringSupervisor}{}
\newcommand{\@stringReviewerA}{}
\newcommand{\@stringReviewerB}{}
\newcommand{\@stringHandoverdate}{}
\newcommand{\@stringSemester}{}


%% German version
\if{germantrue}
	\renewcommand{\@supervisor}{<Betreuername per \textbackslash supervisor setzen>}
	\renewcommand{\@reviewerA}{<Gutachtername 1 per \textbackslash reviewerA setzen>}
	\renewcommand{\@reviewerB}{<Gutachtername 2 per \textbackslash reviewerB setzen>}
	\renewcommand{\@fieldOfDissertation}{<Dissertationsgebiet per \textbackslash fieldOfDissertation setzen>}
	\renewcommand{\@degree}{<Angestrebten Grad per \textbackslash degree setzen>}
	\renewcommand{\@location}{<Ort der Arbeit per \textbackslash location setzen>}
	\renewcommand{\@degreecourse}{<Studiengang per \textbackslash degreecourse setzen>}

	\renewcommand{\@stringTitle}{Titel}
	\renewcommand{\@stringAuthor}{von:}
	\renewcommand{\@stringMail}{E-Mail:}
	\renewcommand{\@stringMatriculationNumber}{Matrikelnummer:}
	\renewcommand{\@stringDegree}{Angestrebter akademischer Grad}
	\renewcommand{\@stringDegreeCourse}{Studiengang}
	\renewcommand{\@stringSupervisor}{Betreuer}
	\renewcommand{\@stringReviewerA}{Erstgutachter}
	\renewcommand{\@stringReviewerB}{Zweitgutachter}
	\renewcommand{\@stringHandoverdate}{Abgabe}
	\renewcommand{\@stringSemester}{Studiensemester}

\else
	\renewcommand{\@supervisor}{<Set supervisor name with \textbackslash supervisor>}
	\renewcommand{\@reviewerA}{<Set name of 1st supervisor with \textbackslash reviewerA>}
	\renewcommand{\@reviewerB}{<Set name of 2nd supervisor with \textbackslash reviewerB>}
	\renewcommand{\@fieldOfDissertation}{<Set field of dissertation with \textbackslash fieldOfDissertation>}
	\renewcommand{\@degree}{<Set intended degree with \textbackslash degree>}
	\renewcommand{\@location}{<Set location of thesis with \textbackslash location>}
	\renewcommand{\@degreecourse}{<Set course with \textbackslash degreecourse>}

	\renewcommand{\@stringTitle}{Title}
	\renewcommand{\@stringAuthor}{by:}
	\renewcommand{\@stringMail}{Email:}
	\renewcommand{\@stringMatriculationNumber}{Matriculation Number:}
	\renewcommand{\@stringDegree}{Desired Degree}
	\renewcommand{\@stringDegreeCourse}{Course of Study}
	\renewcommand{\@stringSupervisor}{Supervisor}
	\renewcommand{\@stringReviewerA}{First Reviewer}
	\renewcommand{\@stringReviewerB}{Second Reviewer}
	\renewcommand{\@stringHandoverdate}{Date of Submission}
	\renewcommand{\@stringSemester}{Semester}
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\supervisor}[1]{\renewcommand\@supervisor{#1}}

\newcommand{\reviewerA}[1]{\renewcommand\@reviewerA{#1}}

\newcommand{\reviewerB}[1]{\renewcommand\@reviewerB{#1}}

\newcommand{\fieldOfDissertation}[1]{\renewcommand\@fieldOfDissertation{#1}}

\newcommand{\degree}[1]{\renewcommand\@degree{#1}}

\newcommand{\location}[1]{\renewcommand\@location{#1}}

\newcommand{\dateofthesis}[1]{\renewcommand\@dateofthesis{#1}}

\newcommand{\degreecourse}[1]{\renewcommand\@degreecourse{#1}}

\newcommand{\emailAddress}[1]{\renewcommand\@emailAddress{#1}}

\newcommand{\semester}[1]{\renewcommand\@semester{#1}}

\newcommand{\matriculationNumber}[1]{\renewcommand\@matriculationNumber{#1}}

\newcommand{\@handoverdate}{\today}
\newcommand{\handoverdate}[1]{\renewcommand\@handoverdate{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% internal commands defaults declaration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\listofillustrations{%
	\begingroup
		\let\clearpage\relax
		\let\cleardoublepage\relax
		\phantomsection
		\addcontentsline{toc}{chapter}{Figures}%
		\ifgerman
			\chapter*{Abbildungen}%
		\else
			\chapter*{Figures}
		\fi

		\@starttoc{lof}%
		\bigskip
		\phantomsection
		\addcontentsline{toc}{chapter}{Tables}%
		\ifgerman
			\chapter*{Tabellen}%
		\else
			\chapter*{Tables}
		\fi
		\@starttoc{lot}
    \endgroup}


\newcommand{\@titlelogos}{
	\includegraphics[height=2cm]{graphics/logo_claim_en_4c.eps}
	\hfill
	% \includegraphics[height=2cm]{graphics/logo_claim_en_4c.eps}
	% \hfill
}


\newcommand{\@supervisorreviewer}{
	\begin{tabular}{lp{8cm}}%\hline
		\small \@location, \@dateofthesis & ~\newline\newline\newline~ \\ %\hline
		\small \@stringSupervisor: & \small \@supervisor \\ %\hline
		%\small \@stringReviewerA: &  \small \@reviewerA \\
		%\small \@stringReviewerB: & \small \@reviewerB \\
		\small \@stringDegreeCourse: & \small \@degreecourse \\ %\hline
    \small \@stringSemester: & \small \@semester \\
	\end{tabular}
}

\newcommand{\@arbeitstyp}{<Art der Arbeit (Option f\"ur \textbackslash documentclass setzen)>}

\DeclareOption{bachelorthesis}{
	\renewcommand{\@supervisorreviewer}{
		\begin{tabular}{lp{8cm}}%\hline
			\small \@stringReviewerA: &  \small \@reviewerA \\
			\small \@stringReviewerB: & \small \@reviewerB \\
			\small \@stringDegreeCourse: & \small \@degreecourse \\ %\hline
			\small \@stringSemester: & \small \@semester \\
		\end{tabular}
	}

	\ifgerman
		\renewcommand{\@arbeitstyp}{Bachelorarbeit}
	\else
		\renewcommand{\@arbeitstyp}{Bachelor Thesis}
	\fi
}

\DeclareOption{masterthesis}{
	\renewcommand{\@supervisorreviewer}{
		\begin{tabular}{lp{8cm}}
			\small \@stringSupervisor: & \small \@supervisor \\ 
			\small \@stringReviewerA: &  \small \@reviewerA \\
			\small \@stringReviewerB: & \small \@reviewerB \\
			\small \@stringDegreeCourse: & \small \@degreecourse \\ 
			\small \@stringSemester: & \small \@semester \\
		\end{tabular}
	}

	\ifgerman
		\renewcommand{\@arbeitstyp}{Masterarbeit}
	\else
		\renewcommand{\@arbeitstyp}{Master Thesis}
	\fi
}

\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% define in-line special letters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\intextprime}{\ensuremath{^\prime}}
\newcommand{\intextOmega}{\ensuremath{\Omega}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage[british, english, german]{babel}
\RequirePackage{appendix}
\RequirePackage{hyperxmp}
%\RequirePackage[utf8]{inputenc}
\RequirePackage{fancyhdr}
\RequirePackage[hyphens]{url}
\RequirePackage[defernumbers=true, sorting=none, giveninits=true, backend=biber, doi=true, url=true, block=ragged, maxnames=6, citestyle=ieee]{biblatex}

% difine internet document glossary format as for example "Accessed on: 20 Feb. 2019"
\DeclareFieldFormat{urldate}{%
	(Accessed on: \thefield{urlday}\addspace%
	\mkbibmonth{\thefield{urlmonth}}\addspace%
	\thefield{urlyear}\isdot)}

\RequirePackage{csquotes} % context sensitive quotations; especially for use with biblatex and biber
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage{listings} % ?
\RequirePackage[scale=3]{ccicons} % creative commons icons
\RequirePackage{import} % for subimport and relative directory \includegraphics
\RequirePackage[skip=8pt]{caption} % caption control and positioning
% \RequirePackage{subcaption} % sub figure replacement
\RequirePackage{multirow} % tables spanning multiple rows
\RequirePackage{longtable} % required for tabu with longtabu
\RequirePackage{tabu} % supersedes tabularx, provides tables spanning multiple pages
\RequirePackage{tabularx} % enable fixed width tables
\RequirePackage{makecell}
\RequirePackage{tikz}
\usetikzlibrary{arrows}
\RequirePackage{enumitem} % inline lists, etc.
% \RequirePackage[euler]{textgreek} % enable in-text greek letters
% \RequirePackage{flexisym} % enable in-text prime

\RequirePackage[colorlinks, unicode=true]{hyperref}
\hypersetup{colorlinks=true, linktocpage=true, breaklinks=true, bookmarksnumbered, bookmarksopen=true,bookmarksopenlevel=1, pdfhighlight=/O, urlcolor=webbrown, linkcolor=linkblue, citecolor=webgreen}
\RequirePackage{textcomp} % extra symbols; used for euro and copyright symbol
\RequirePackage[load-configurations={abbreviations,binary}]{siunitx}

\RequirePackage{xspace}
\RequirePackage{algorithmic}
\RequirePackage{algorithm}
\RequirePackage[24hr,iso]{datetime}
\RequirePackage{booktabs} % \toprule and other table stuff
\RequirePackage[titles]{tocloft} % toc style
\RequirePackage{titlesec}
\RequirePackage{mathtools}

% Import packages to highlight text contents
\RequirePackage{soul}

\RequirePackage{metalogo}
\RequirePackage{graphicx}
\RequirePackage{subfig}

\RequirePackage{verbatim} % add latex commands as text

\RequirePackage{blindtext}

\RequirePackage[acronyms, nomain, style=long, toc, section=chapter, nogroupskip=true]{glossaries}
\renewcommand{\glsnamefont}[1]{\textbf{#1}}

\setlength\LTleft{0pt}
\setlength\LTright{0pt}
\setlength\glsdescwidth{0.8\hsize}

\RequirePackage{etoolbox}
\preto\chapter\glsresetall

\RequirePackage[export]{adjustbox} % change figure location

\RequirePackage{geometry} % define page format, please check the requirement of your institute
 \geometry{
 a4paper,
 total={210mm, 297mm},
 left=40mm,
 right=25mm,
 bottom=30mm,
 top=30mm,
 }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% define customized colors
\definecolor{Maroon}{cmyk}{0, 0.87, 0.68, 0.32}
\definecolor{RoyalBlue}{cmyk}{1, 0.50, 0, 0}
\definecolor{Black}{cmyk}{0, 0, 0, 0}
\definecolor{grey}{RGB}{153, 153, 153}
\definecolor{orange}{RGB}{230, 159, 0}
\definecolor{skyblue}{RGB}{86, 180, 233}
\definecolor{bluishgreen}{RGB}{0, 158, 115}
\definecolor{yellow}{RGB}{240, 228, 66}
\definecolor{blue}{RGB}{0, 114, 178}
\definecolor{vermillion}{RGB}{213, 94, 0}
\definecolor{reddishpurple}{RGB}{204, 121, 167}
\definecolor{halfgray}{gray}{0.55} % chapter numbers will be semi transparent .5 .55 .6 .0
\definecolor{webgreen}{rgb}{0,.5,0}
\definecolor{webbrown}{rgb}{.6,0,0}
\definecolor{linkblue}{RGB}{22,50,80}

\captionsetup{format=hang,font=small}
\setlength{\extrarowheight}{3pt} % increase table row height
\newcommand{\tableheadline}[1]{\spacedlowsmallcaps{#1}}
\setlength{\belowcaptionskip}{-10pt} % Less space below captions
\setlength{\parindent}{0em}
\setlength{\parskip}{1em}


%%% text
\linespread{1.5} % set paragraph spacing of text body as 1.5 times
\setlist[description]{labelindent=\parindent}
\hfuzz=1.36pt


%%% toc
\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{3}


%% set pdf parameters (title, ...)
\AtBeginDocument{
  \hypersetup{
    pdftitle = {\@title},
    pdfauthor = {\@author}
  }
}


%% settings imported and adapted from classicthesis

\clubpenalty = 10000 % Disable single lines at the start of a paragraph
\widowpenalty = 10000 % Disable single lines at the end of a paragraph 
\displaywidowpenalty = 10000 % formulas

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% set font type
\RequirePackage{fontspec} 
\setmainfont{TeX Gyre Termes} % set main font type
%\setsansfont{DejaVu Sans}
\setsansfont{TeX Gyre Heros}

% TODO set font types for mathematical expressions
%\RequirePackage{xfrac}
%\RequirePackage{unicode-math}
%\setmathfont{TeX Gyre Termes Math}[version=termes]
%\mathversion{termes}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% set font size of different titles

% chapters
\titleformat{\chapter}{\relax}{\sffamily\bfseries\LARGE\thechapter}{1em}{\sffamily\bfseries\LARGE}

% sections
\titleformat{\section}{\relax}{\sffamily\bfseries\Large\thesection}{1em}{\sffamily\bfseries\Large}

% subsections
\titleformat{\subsection}{\relax}{\sffamily\bfseries\large\thesubsection}{1em}{\sffamily\large\bfseries}

% subsubsections
\titleformat{\subsubsection}{\relax}{\sffamily\normalsize\thesubsubsection}{1em}{\sffamily\normalsize}

% paragraphs
\titleformat{\paragraph}[hang]{\sffamily\normalfont\normalsize}{\theparagraph}{0pt}{\sffamily\bfseries}

% descriptionlabels
\renewcommand{\descriptionlabel}[1]{\hspace*{\labelsep}\textsc{#1}}   % spacedlowsmallcaps textit textsc

% spacing
\titlespacing*{\chapter}{0pt}{2pt plus 2pt minus 2pt}{10pt plus 2pt minus 2pt}
\titlespacing*{\section}{0pt}{2pt plus 2pt minus 2pt}{2pt plus 2pt minus 2pt}
\titlespacing*{\subsection}{0pt}{1pt plus 2pt minus 2pt}{1pt plus 2pt minus 2pt}
\titlespacing*{\paragraph}{0pt}{0pt plus 2pt minus 2pt}{0pt plus 2pt minus 2pt}


%% default settings for the listings Package
\definecolor{lstgreen}{rgb}{0,0.6,0}
\lstset{
  basicstyle=\small\ttfamily,
  commentstyle=\color{lstgreen},
  keywordstyle=\color{blue},
  emphstyle=\bfseries\color{DarkGray},
  stringstyle=\color{RedViolet},
  numbers=left,
  numberstyle=\small,
  %columns=fullflexible,
  showstringspaces=false,
  captionpos=b,
  %xleftmargin=\parindent,
  %framexleftmargin=\parindent,
  %xleftmargin=2cm,
  %linewidth=\textwidth,
  %xleftmargin=\,
  %xleftmargin=\listingnumberwidth,
  %xleftmargin=1.5em,
  xleftmargin=\parindent,
  %xrightmargin=5pt,
  aboveskip=\bigskipamount,
  %belowskip=\bigskipamount,
  frame=single,
  %fancyvrb=true,
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% title page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand*{\maketitle}{%
	\thispagestyle{empty}

	\begin{titlepage}

	\@titlelogos

	\begin{center}

	\vskip 1.5cm

	\linespread{1.6}\selectfont

	{\huge\textbf{\textsc{\@arbeitstyp}}}\\[1.5cm]

	{% \@stringTitle\\[2mm]
	\huge\bfseries{\centering\@title}}
	\\Fachgebiet Elektrische Anlagen und Netze\\der Fakultät für Ingenieurwissenschaften\\der Universität Duisburg-Essen (Campus Duisburg)\\[2cm]
	\linespread{1.05}\selectfont % reset linespread back to the document's default

	\@stringAuthor\\
	{\bfseries \@author}\\
	\@stringMail~{\bfseries\@emailAddress}\\
  \@stringMatriculationNumber~{\bfseries\@matriculationNumber}\\
  \vfill

	%\scalebox{1.1} {
		\@supervisorreviewer
	%}
	\end{center}
	\end{titlepage}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LaTeX parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\def\toc@heading{
	\chapter*{\contentsname}
	\@mkboth{\textsc{\contentsname}}{\textsc{\contentsname}}
}