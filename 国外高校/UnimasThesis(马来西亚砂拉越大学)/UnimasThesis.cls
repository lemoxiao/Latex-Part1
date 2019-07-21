\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UnimasThesis}[2018/04/06 LaTeX2e class for Unimas Thesis v1.02.  Copyright (c) 2015-2018 Lim Lian Tze (liantze@gmail.com)]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CHANGES:
% v1.02 (April 6, 2018)
% - Change page left margin to 3cm
%
% v1.01 (December 22, 2017)
% - Add title page
%
% v1.0 January 11 2015
% - First version
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[12pt,a4paper,oneside]{memoir}

%%%%%%%%%%%%
% Meta fields
%%%%%%%%%%%%
\RequirePackage{xcolor}
\def\@faculty{Faculty of ???}
\definecolor{facultyColour}[named]{HTML}{CFCFCF}
\def\@submissionyear{20xx}
\def\@degreetype{Master of ????}

\newcommand{\faculty}[1]{\def\@faculty{#1}}
\newcommand{\facultyColour}[1]{\definecolor{facultyColour}[named]{HTML}{#1}}
\newcommand{\submissionyear}[1]{\def\@submissionyear{#1}}
\newcommand{\degreetype}[1]{\def\@degreetype{#1}}

\RequirePackage{etoolbox}

%%%%%%%%%%%%
% Line and paragraph spacing
%%%%%%%%%%%%
%\abnormalparskip{\onelineskip}
%\setlength{\parindent}{12.5mm}
\DisemulatePackage{setspace}
\RequirePackage{setspace}
\setstretch{1.75}


%%%%%%%%%
% Fonts and encodings -- do not change!
%%%%%%%%%
\RequirePackage{ifxetex}
\ifxetex
\RequirePackage{fontspec}
\RequirePackage{unicode-math}
\setmainfont{Times New Roman}
\setmathfont{Cambria Math}
\setsansfont{Arial}
\else
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{newtxtext}
\RequirePackage{newtxmath}
\RequirePackage{helvet}
\fi

%%%%%%%%%%%%%
% Languages. English is the default.
%%%%%%%%%%%%%
\newif\if@bahasam
\newif\if@english
\DeclareOption{english}{\@englishtrue\@bahasamfalse}
\DeclareOption{bahasam}{\@englishfalse\@bahasamtrue}

\ExecuteOptions{english}
\ProcessOptions
\RequirePackage{translator}
\uselanguage{English,Bahasa}

\if@bahasam
  \RequirePackage[english,french,bahasam]{babel}
  \languagepath{Bahasa}
  \AtBeginDocument{
    \selectlanguage{bahasam}
  }
\fi
\if@english
  \RequirePackage[bahasam,french,english]{babel}
  \languagepath{English}
  \AtBeginDocument{
    \selectlanguage{english}
  }
\fi


%%%%%%%%%%%%
% Hyperlinks and bookmarks
%%%%%%%%%%%%
\RequirePackage[breaklinks]{hyperref}
\RequirePackage[depth=2,numbered]{bookmark}
\renewcommand\UrlFont{\rmfamily}


%%%%%%%%%
% Various translations for existing LaTeX keywords
%%%%%%%%%
\addto\captionsenglish{
   \renewcommand*\contentsname{Table of Contents}
   \renewcommand*\appendixname{Appendix}
   \renewcommand*\appendixpagename{Appendices}
   \renewcommand*\appendixtocname{Appendices}
}

\addto\captionsbahasam{
   \renewcommand*\figurename{Rajah}
   \renewcommand*\listfigurename{Senarai Ilustrasi}
   \renewcommand*\appendixname{Lampiran}
   \renewcommand*\appendixpagename{Lampiran}
   \renewcommand*\appendixtocname{Lampiran}
   \pretocmd{\bibliography}{\renewcommand*\bibname{Rujukan}}
}


%%%%%%%%%
% Various translations for GayaUKM-defined keywords
%%%%%%%%%
\newtranslation[to=Bahasa]{Acknowledgements}{Penghargaan}
\newtranslation[to=English]{Acknowledgements}{Acknowledgements}
\newtranslation[to=Bahasa]{Abstract}{Abstrak}
\newtranslation[to=English]{Abstract}{Abstract}
\newtranslation[to=Bahasa]{Source}{Sumber}
\newtranslation[to=English]{Source}{Source}
\newtranslation[to=Bahasa]{Chapter}{Bab}
\newtranslation[to=English]{Chapter}{Chapter}
\newtranslation[to=Bahasa]{Appendices}{Lampiran}
\newtranslation[to=English]{Appendices}{Appendices}
\newtranslation[to=Bahasa]{figurenumber}{No.~Rajah}
\newtranslation[to=English]{figurenumber}{Figure No.}
\newtranslation[to=Bahasa]{tablenumber}{No.~Jadual}
\newtranslation[to=English]{tablenumber}{Table No.}
\newtranslation[to=Bahasa]{FrontMatter}{Bahagian Awal}
\newtranslation[to=English]{FrontMatter}{Front Matter}
\newtranslation[to=Bahasa]{MainChapters}{Bahagian Teks}
\newtranslation[to=English]{MainChapters}{Main Chapters}


%%%%%%%%%%
% Page layout -- do not change!
%%%%%%%%%%
\settrimmedsize{297mm}{210mm}{*}
\setlrmarginsandblock{30mm}{25mm}{*}
\setulmarginsandblock{30mm}{30mm}{*}
\setheadfoot{\baselineskip}{15mm}
\setheaderspaces{15mm}{*}{*}
% page numbers: 15mm from top, 25mm from right
\makeoddhead{plain}{}{}{}
\makeoddfoot{plain}{}{\thepage}{}
\makeoddhead{headings}{}{}{}
\makeoddfoot{headings}{}{\thepage}{}
\checkandfixthelayout


%%%%%%%
% Title page
%%%%%%%
\RequirePackage{mdframed}
\renewcommand{\maketitle}{
    \newlength{\barlength}
    \setlength{\barlength}{15mm}
    \addtolength{\barlength}{-2ex}
    \setlrmarginsandblock{25mm}{25mm}{*}
    \setulmarginsandblock{25mm}{25mm}{*}
    \checkandfixthelayout
    \ch@ngetext
	\begin{titlingpage}
	\SingleSpacing
	\begin{mdframed}[hidealllines=true,align=center,backgroundcolor=facultyColour,leftmargin=0pt,rightmargin=0pt,innertopmargin=1.5cm,innerbottommargin=1.5cm]
	\centering
	\includegraphics[width=6cm,height=6cm]{unimas-logo}\par
	\vskip\barlength
	{\Large\bfseries\@faculty\par}
	\end{mdframed}
	\vskip\barlength
	\centering
	{\large\bfseries\MakeUppercase{\@title}\par}
	\vspace*{\stretch{1}}
	\@title\par
	\vspace*{\stretch{1}}
	\@degreetype\\
	\@submissionyear\par
	\end{titlingpage}
    \setlrmarginsandblock{30mm}{25mm}{*}
    \setulmarginsandblock{30mm}{30mm}{*}
    \checkandfixthelayout
    \ch@ngetext
  \begin{titlingpage}
  \centering
  {\large\MakeUppercase{\@title}\par}
  \vfill
  \@author\par
  \vfill
  A thesis submitted\par
  In fulfillment of the requirements for the degree of \@degreetype\par
  \vfill
  \@faculty\par
  UNIVERSITY MALAYSIA SARAWAK\\
  \@submissionyear
  \end{titlingpage}
}

%%%%%%%
% Numbering
%%%%%%%
\setsecnumdepth{subsection}
\settocdepth{subsection}


%%%%&&&&
% Tighter lists
%%%%%%%%
\RequirePackage{enumitem}
\setlist{nosep,leftmargin=\parindent}


%%%%%%%%%%%%
% Chapter headings
%%%%%%%%%%%%
\setlength\afterchapskip{2.5\onelineskip}
\setlength\midchapskip{2.5\onelineskip}
\renewcommand*\chapnamefont{\bfseries\large}
\renewcommand*\chapnumfont{\bfseries\large\centering}
\renewcommand*\chaptitlefont{\bfseries\Large\centering}
\renewcommand{\printchaptername}{\chapnamefont\MakeUppercase{\chaptername}}
\renewcommand*{\afterchapternum}{\vskip\midchapskip}
\renewcommand*{\printchaptertitle}[1]{\chaptitlefont\MakeTextUppercase{#1}}


%%%%%%%%%%%%
% Sectional headings
%%%%%%%%%%%%
\setsecnumdepth{paragraph}
\settocdepth{subsection}
% 7 July 14 - make section headings raggedright, sloppy
\setsecheadstyle{\raggedright\sloppy\normalsize\bfseries\large}
\setbeforesecskip{-2\onelineskip}
\setaftersecskip{1.5\onelineskip}

% 7 July 14 - make section headings raggedright
\setsubsecheadstyle{\raggedright\sloppy\normalsize\bfseries}
\setbeforesubsecskip{-2\onelineskip}
\setaftersubsecskip{1.5\onelineskip}

\renewcommand{\thesubsubsection}{\alph{subsubsection}.}
\setsubsubsecheadstyle{\normalsize\bfseries}
\setbeforesubsubsecskip{-2\onelineskip}

\renewcommand{\theparagraph}{\roman{paragraph}.}
\setparaheadstyle{\normalsize\bfseries}
\setbeforeparaskip{-2\onelineskip}
\setafterparaskip{1.5ex plus .2ex}


%%%%%%%%%%%%
% Captions
%%%%%%%%%%%%
\captiondelim{\enspace}
\hangcaption
\newsubfloat{figure}
\setcounter{lofdepth}{2}
\newsubfloat{table}
\setcounter{lotdepth}{2}
\hangsubcaption
\subcaptionsize{\normalsize}


%%%%%%%%%%%
% ToC etc
%%%%%%%%%%%
\addtocontents{toc}{\protect\sloppy}
\addtocontents{lof}{\protect\sloppy}
\addtocontents{lot}{\protect\sloppy}
\appto{\tableofcontents}{\clearpage}
\appto{\listoffigures}{\clearpage}
\appto{\listoftables}{\clearpage}
%\appto{\aftertoctitle}{%
%  \vskip2em\mbox{}\hfill{\bfseries\pagename}\par\nobreak}
%\appto{\afterloftitle}{%
%  \vskip2em\mdseries\translate{figurenumber}\hfill{\pagename}\par\nobreak}
%\appto{\afterlottitle}{%
%  \vskip2em\mdseries\translate{tablenumber}\hfill{\pagename}\par\nobreak}

\settocdepth{subsection}
\renewcommand{\cftdotsep}{\cftnodots}

\renewcommand*{\cftchaptername}{\MakeUppercase{\chaptername}\space}
\renewcommand*{\cftfigurename}{\figurename\space}
\renewcommand*{\cfttablename}{\tablename\space}



%%%%%%%
% Formatting for the FRONT MATTER:
% - chapter headings
% - page numbering
% - bookmarks
%%%%%%%
\patchcommand{\frontmatter}{
  \setlength{\beforechapskip}{-\baselineskip}
  \setlength{\midchapskip}{0mm}
  \renewcommand*\cftchapterfont{\mdseries\normalsize}
  \renewcommand*\cftchapterpagefont{\mdseries\normalsize}
  \setlength{\cftbeforechapterskip}{.5ex}
}{
  \phantomsection
  \translatelet{\foo}{FrontMatter}
  \ifpdf\pdfbookmark[-1]{\foo}{front}\fi
  \ifxetex\pdfbookmark[-1]{\foo}{front}\fi
}

%%%%%%%
% Formatting for the MAIN MATTER:
% - spacing
% - chapter headings
% - page numbering
%%%%%%%
\patchcommand{\mainmatter}{
  \setlength{\beforechapskip}{\onelineskip}
%  \addtolength{\beforechapskip}{-\topskip}
%  \addtolength{\beforechapskip}{-1em}
%  \setlength\midchapskip{3\onelineskip}
  \cftinserthook{toc}{MainToCLine}
%  \setsubsechook{\ifnumequal{\value{subsection}}{0}%
%  {\addtocontents{toc}{\bigskip}}%
%  {}}
}{
  \translatelet{\foo}{MainChapters}
  \ifpdf\pdfbookmark[-1]{\foo}{main}\fi
  \ifxetex\pdfbookmark[-1]{\foo}{main}\fi
}

%%%%%%%%%%%
% Appendix page
%%%%%%%%%%%
\addtodef\appendix{%
\clearpage
\translatelet\foo{Appendices}
\cftaddtitleline{toc}{chapter}{\appendixtocname}{}
\ifpdf\pdfbookmark[-1]{\appendixtocname}{back}\fi
\ifxetex\pdfbookmark[-1]{\appendixtocname}{back}\fi
\renewcommand\chaptername{\appendixname}
\renewcommand{\printchapternum}{\chapnumfont\Alph{chapter}}
\cftinserthook{toc}{ApdToCLine}
}{}

%%%%%%%%%%%
% Codes for TOC lines of main chapters
%%%%%%%%%%%
\cftinsertcode{MainToCLine}{
  \renewcommand*{\l@chapter}[2]{%
    \l@chapapp{\uppercase{##1}}{##2}{\cftchaptername}}
  \renewcommand*\cftchapterfont{\bfseries\normalsize}
  \renewcommand*\cftchapterpagefont{\bfseries\normalsize}
  \renewcommand*\cftchapteraftersnum{:\space}
  \setlength{\cftbeforechapterskip}{2.75ex}
  \setlength{\cftbeforesectionskip}{.5ex}
  \setlength{\cftbeforesubsectionskip}{.5ex}
  \setlength{\cftbeforefigureskip}{.5ex}
  \setlength{\cftbeforetableskip}{.5ex}
  \cftsetindents{section}{0pt}{2em}
  \cftsetindents{subsection}{2em}{3em}
}

%%%%%%%%%%%
% Codes for TOC lines of appendix chapters
%%%%%%%%%%%
\cftinsertcode{ApdToCLine}{
  \setcounter{tocdepth}{0}
  \renewcommand*\cftchapterfont{\mdseries\normalsize}
  \renewcommand*\cftchapterfont{\mdseries\normalsize}
  \renewcommand*\cftchapterpagefont{\mdseries\normalsize}
  \renewcommand*\cftchapterpresnum{}
  \renewcommand*\cftchapteraftersnum{}
  \setlength{\cftbeforechapterskip}{.5ex}
}


\newenvironment{acknowledgements}{%
\translatelet\foo{Acknowledgements}
\chapter{\foo}
}{\clearpage}

\newenvironment{msAbstract}[1][]{
%% Malay abstract must be italics if this is an English thesis
  \if@english
    \renewcommand{\chaptitlefont}{\bfseries\Large\itshape\centering}
    \foreignlanguage{bahasam}
  \fi
  \translatelet[to=Bahasa]\foo{Abstract}
  \ifblank{#1}{\chapter{\foo}}{%
  \chapter[\foo]{#1\protect\\[2\onelineskip]\foo}
  }
  \if@english\itshape\fi
}{\clearpage}

\newenvironment{enAbstract}[1][]{
%% Malay abstract must be italic if this is a Malay thesis
  \if@bahasam
    \renewcommand{\chaptitlefont}{\bfseries\Large\itshape\centering}
    \foreignlanguage{english}
  \fi
  \translatelet[to=English]\foo{Abstract}
  \ifblank{#1}{\chapter{\foo}}{%
  \chapter[\foo]{#1\protect\\[2\onelineskip]\foo}
  }
  \if@bahasam\itshape\fi
}{\clearpage}

\newcommand{\source}[1]{
  \translatelet\foo{Source}
  \foo: {#1}\par
}
