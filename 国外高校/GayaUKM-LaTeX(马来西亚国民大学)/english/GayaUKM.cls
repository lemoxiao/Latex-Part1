\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{GayaUKM}[2012/10/22 LaTeX2e class for UKM Thesis v1.00.  Copyright (c) 2013 Lim Lian Tze (liantze@gmail.com)]

\LoadClass[12pt,a4paper,oneside]{memoir}
\RequirePackage{etoolbox}
\RequirePackage[overload]{textcase}
\RequirePackage{amsmath}

%%%%%%%%%%%%%
% Languages. Bahasa is the default.
%%%%%%%%%%%%%
\newif\if@bahasam
\newif\if@english
\DeclareOption{english}{\@englishtrue\@bahasamfalse}
\DeclareOption{bahasam}{\@englishfalse\@bahasamtrue}

\ExecuteOptions{bahasam}
\ProcessOptions
\RequirePackage{translator}
\uselanguage{English,Bahasa}

\if@bahasam
  \RequirePackage[english,bahasam]{babel}
  \languagepath{Bahasa}
  \AtBeginDocument{
    \selectlanguage{bahasam}
  }
\fi
\if@english
  \RequirePackage[bahasam,english]{babel}
  \languagepath{English}
  \AtBeginDocument{
    \selectlanguage{english}
  }
\fi

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
   \renewcommand*\bibname{Rujukan}
}

%%%%%%%%%
% Various translations for GayaUKM-defined keywords
%%%%%%%%%
\newtranslation[to=Bahasa]{thesissubmission}{Tesis yang dikemukakan untuk memperoleh ijazah}
\newtranslation[to=English]{thesissubmission}{Thesis submitted in partial fulfilment of the\protect\\requirements for the degree of}
\newtranslation[to=Bahasa]{Declaration}{Pengakuan}
\newtranslation[to=English]{Declaration}{Declaration}
\newtranslation[to=Bahasa]{declarationtext}{Saya akui karya ini adalah hasil kerja saya sendiri kecuali nukilan dan ringkasan yang tiap-tiap satunya telah saya jelaskan sumbernya.}
\newtranslation[to=English]{declarationtext}{I hereby declare that the work in this thesis is my own except for quotations and summaries which have been duly acknowledged.}
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

%%%%%%%%
% various meta-fields
%%%%%%%%
\newcommand{\authorid}[1]{\def\@authorid{#1}}
\newcommand{\degreetype}[1]{\def\@degreetype{#1}}
\newcommand{\faculty}[1]{\def\@faculty{#1}}
\newcommand{\campus}[1]{\def\@campus{#1}}
\newcommand{\submissiondate}[1]{\def\@submissiondate{#1}}
\newcommand{\submissionyear}[1]{\def\@submissionyear{#1}}


%%%%%%%%%
% Fonts and encodings -- do not change!
%%%%%%%%%
\RequirePackage{ifxetex}
\ifxetex
\RequirePackage{fontspec}
\setmainfont{Times New Roman}
\setsansfont{Arial}
\else
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{mathptmx}
\RequirePackage{helvet}
\fi

%%%%%%%%%%
% Page layout -- do not change!
%%%%%%%%%%
\settrimmedsize{297mm}{210mm}{*}
\setlrmarginsandblock{38mm}{25mm}{*}
\setulmarginsandblock{30mm}{25mm}{*}
\setheadfoot{\baselineskip}{5mm}
\setheaderspaces{15mm}{*}{*}
% page numbers: 15mm from top, 25mm from right
\makeoddhead{plain}{}{}{\thepage}
\makeoddfoot{plain}{}{}{}
\makeoddhead{headings}{}{}{\thepage}
\makeoddfoot{headings}{}{}{}
\checkandfixthelayout

%%%%%%%%%%%%
% Line and paragraph spacing
%%%%%%%%%%%%
\abnormalparskip{\onelineskip}
\setlength{\parindent}{12.5mm}
\DisemulatePackage{setspace}
\RequirePackage{setspace}

\let\orichapter\chapter
\renewcommand\chapter{\@ifstar{\mystarchap}{\mychap}}
\newcommand\mychap[2][]{%
\ifblank{#1}{
    \orichapter[#2]{#2}%
  }{%
    \orichapter[#1]{#2}%
  }    
}

\newcommand\mystarchap[1]{\orichapter*{#1}}


%%%%%%%%%%%%
% Hyperlinks and bookmarks
%%%%%%%%%%%%
\RequirePackage[breaklinks]{hyperref}
\RequirePackage[depth=2,numbered]{bookmark}


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
\appto{\tableofcontents}{\clearpage}
\appto{\listoffigures}{\clearpage}
\appto{\listoftables}{\clearpage}
\appto{\aftertoctitle}{%
  \vskip2em\mbox{}\hfill{\bfseries\pagename}\par\nobreak}
\appto{\afterloftitle}{%
  \vskip2em\mdseries\translate{figurenumber}\hfill{\pagename}\par\nobreak}
\appto{\afterlottitle}{%
  \vskip2em\mdseries\translate{tablenumber}\hfill{\pagename}\par\nobreak}

\settocdepth{subsection}
\renewcommand{\cftdotsep}{\cftnodots}
\translatelet\foo{Chapter}
\settowidth{\cftchapternumwidth}{\MakeTextUppercase{\foo} VIII}
\renewcommand*{\cftchaptername}{\MakeTextUppercase{\chaptername}}
\let\regularChapterNumberLine\chapternumberline
\renewcommand*\chapternumberline[1]{%
\makebox[\cftchapternumwidth][l]{\cftchaptername\space\uppercase\expandafter{\romannumeral#1\relax}}%
}
\renewcommand*{\l@chapter}[2]{%
  \l@chapapp{\uppercase{#1}}{#2}{\cftchaptername}}
\renewcommand*{\cftchapterformatpnum}[1]{\mdseries\normalsize #1}
\setlength{\cftsectionindent}{0pt}
\setlength{\cftsectionnumwidth}{\cftchapternumwidth}
\setlength{\cftsubsectionindent}{\cftchapternumwidth}
\setlength{\cftbeforechapterskip}{0.5em}

\renewcommand*{\cftfigureafterpnum}{\vskip1pt}
\setlength\cftbeforefigureskip{1em}
\translatelet\foo{figurenumber}
\settowidth{\cftfigurenumwidth}{\bfseries\foo}
\setlength\cftbeforesubfigureskip{3pt}
\setlength\cftsubfigureindent{\cftfigurenumwidth}
\settowidth{\cftsubfigurenumwidth}{2em}

\renewcommand*{\cfttableafterpnum}{\vskip1pt}
\setlength\cftbeforetableskip{1em}
\translatelet\foo{tablenumber}
\settowidth{\cfttablenumwidth}{\bfseries\foo}
\setlength\cftbeforesubtableskip{3pt}
\setlength\cftsubtableindent{\cftfigurenumwidth}
\settowidth{\cftsubtablenumwidth}{2em}

\newlength{\foolength}
\settowidth{\foolength}{\bfseries Halaman}
\setpnumwidth{\foolength}
\setrmarg{\foolength}
%% Do not insert extra space between chapters
%% in list of figures and tables
\renewcommand{\insertchapterspace}{}

%%%%%%%
% Formatting for the FRONT MATTER:
% - chapter headings
% - page numbering
% - bookmarks
%%%%%%%
\patchcommand{\frontmatter}{
  \setlength{\beforechapskip}{-\baselineskip}
  \setlength{\midchapskip}{0mm}	
  \makeoddhead{plain}{}{}{\thepage}
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
  \setstretch{1.5}
  %% Chapter title: bottom of FIRST LINE is 
  %% 50mm from page margin = 20mm from top margin; 
  %% this is actually \beforechapskip + \topskip 
  %% + \baselineskip (baseline here is for 2 lines!!)
  %% so \beforechapskip should be 20mm minus \topskip
  %% minus 1em
  \setlength{\beforechapskip}{20mm}
  \addtolength{\beforechapskip}{-\topskip}
  \addtolength{\beforechapskip}{-1em}
  \setlength\midchapskip{3\onelineskip}
  \cftinserthook{toc}{MainToCLine}
  \setsubsechook{\ifnumequal{\value{subsection}}{0}%
  {\addtocontents{toc}{\bigskip}}%
  {}}
}{
  \translatelet{\foo}{MainChapters}
  \ifpdf\pdfbookmark[-1]{\foo}{main}\fi
  \ifxetex\pdfbookmark[-1]{\foo}{main}\fi
  \makeoddhead{plain}{}{}{}
}

%%%%%%%%%%%
% Appendix page
%%%%%%%%%%%
\addtodef\appendix{%
\clearpage
\let\chapter\orichapter
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
  \renewcommand*{\cftchapterformatpnum}[1]{}
  \renewcommand{\cftchapterafterpnum}{}
  \setlength{\cftbeforesectionskip}{1em}
  \setlength{\cftbeforechapterskip}{2em}
}

%%%%%%%%%%%
% Codes for TOC lines of appendix chapters
%%%%%%%%%%%
\cftinsertcode{ApdToCLine}{
  \let\chapternumberline\regularChapterNumberLine
  \setcounter{tocdepth}{0}
  \renewcommand*\cftchapterfont{\mdseries\normalsize}
  \renewcommand*\chapternumberline[1]{%
  \makebox[\cftchapternumwidth][l]{##1}%
  }
  \setlength{\cftbeforechapterskip}{1em}
}

\cftinsertcode{RestoreChapPageNum}{%
  \renewcommand*{\cftchapterformatpnum}[1]{\mdseries\normalsize ##1}
}

\cftinsertcode{ExtraSpace}{%
  \vskip1em
}

%%%%%%%%%%%%
% More compact lists
%%%%%%%%%%%%
\RequirePackage{enumitem,tabularx}
\setlist{nosep,leftmargin=\parindent}


%%%%%%%%%%%%
% Chapter headings
%%%%%%%%%%%%
\setlength\afterchapskip{\onelineskip}
\setlength\midchapskip{2\onelineskip}
\renewcommand*\chapnamefont{\bfseries}
\renewcommand*\chapnumfont{\bfseries\centering}
\renewcommand*\chaptitlefont{\bfseries\centering}
\renewcommand{\printchaptername}{{\chapnamefont\MakeUppercase{\chaptername}}}
\renewcommand{\printchapternum}{\chapnumfont\Roman{chapter}}
\renewcommand*{\afterchapternum}{\vskip\midchapskip}
\renewcommand*{\printchaptertitle}[1]{\chaptitlefont\MakeTextUppercase{#1}}


%%%%%%%%%%%%
% Sectional headings
%%%%%%%%%%%%
\setsecnumdepth{paragraph}
\settocdepth{subsection}
\setsecheadstyle{\normalsize\bfseries\MakeUppercase}
\setbeforesecskip{-2\onelineskip}
\setaftersecskip{1.5\onelineskip}

\setsubsecheadstyle{\normalsize\bfseries}
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
% Bibliography
%%%%%%%%%%%%
\RequirePackage{natbib}
\let\cite\citep
\if@bahasam
  \bibliographystyle{GayaUKM-ms}
\else
  \bibliographystyle{GayaUKM}
\fi
\pretocmd{\bibliography}{%
  \cftinserthook{toc}{RestoreChapPageNum}
  \setlength{\beforechapskip}{-5mm}
}{}{}
\setlength{\bibhang}{12.5mm}
\setcitestyle{aysep={}}

%%%%%%%%
% Cover Page
%%%%%%%%
\renewcommand{\maketitle}{%
   \begin{titlingpage}
      \vspace*{15mm}
      \SingleSpacing
      \centering
      \fontsize{18pt}{20pt}\selectfont
      \MakeUppercase{\@title}\par
      \vfill
      \MakeUppercase{\@author}\par
      \vfill
      UNIVERSITI KEBANGSAAN MALAYSIA\par
      \vspace*{35mm}
   \end{titlingpage}

   \begin{titlingpage}
      \vspace*{15mm}
      \SingleSpacing
      \centering
      \MakeUppercase{\@title}\par
      \vfill
      \MakeUppercase{\@author}\par
      \vfill
      \translatelet\foo{thesissubmission}\MakeUppercase{\foo}\\
      \MakeUppercase{\@degreetype}\par
      \vfill
      \MakeUppercase{\@faculty}\\
      UNIVERSITI KEBANGSAAN MALAYSIA\\
      \MakeUppercase{\@campus}\\
      \vspace{2\onelineskip}
      \@submissionyear\par
      \vspace*{15mm}
   \end{titlingpage}
}


%%%%%%%%%
% Declaration
%%%%%%%%%
\newcommand{\declaration}{%
\setcounter{page}{2}
\translatelet\foo{Declaration}
%\chapter{\foo}
\clearpage
\phantomsection
\cftaddtitleline{toc}{chapter}{\foo}{}
\vspace*{\fill}
{\centering\bfseries\MakeUppercase{\foo}\par\mbox{}\par}
{\noindent\setstretch{1.5}\translate{declarationtext}\par\mbox{}\par}
\noindent\begin{tabularx}{\textwidth}{@{}X c@{}}
\@submissiondate & \MakeUppercase{\@author}\\
& \@authorid\\
\end{tabularx}
\vspace*{\fill}
\clearpage
}

\newenvironment{acknowledgements}{%
\translatelet\foo{Acknowledgements}
\chapter{\foo}
}{\clearpage}

\newenvironment{msAbstract}[1][]{
  \if@english\foreignlanguage{bahasam}\fi
  \translatelet[to=Bahasa]\foo{Abstract}
  \ifblank{#1}{\chapter{\foo}}{%
  \chapter[\foo]{#1\protect\\[2\onelineskip]\foo}
  }
}{\clearpage}

\newenvironment{enAbstract}[1][]{
  \if@bahasam\foreignlanguage{english}\fi
  \translatelet[to=English]\foo{Abstract}
  \ifblank{#1}{\chapter{\foo}}{%
  \chapter[\foo]{#1\protect\\[2\onelineskip]\foo}
  }
}{\clearpage}

\newcommand{\source}[1]{
  \translatelet\foo{Source}
  \foo: {#1}\par
}
