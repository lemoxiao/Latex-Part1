%%
%% iiumthesis.cls 04/02/2015 version V1.00
%%
%% This is the unofficial IIUM thesis LaTeX class for postgraduate research
%% students of International Islamic Univeersity Malaysia, formatted
%% according to the IIUM thesis manual.
%%
%% Current maintainer: Moaaz Elhag Ali (moaaz.haj@gmail.com)
%%
%% NOTE: This work is a modified version from the original class "umalayathesis.cls" 
%% at http://liantze.penguinattack.org/latextypesetting.html#umalayathesis
%% by Lim Lian Tze (liantze@gmail.com). 
%% 
%%
%%
%  BRIEF CHANGELOG
%  ===============
% v1.0 Feb 4 2015
%     - First online release
%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iiumthesis}

\LoadClass[12pt,a4paper,oneside]{memoir}
\RequirePackage{caption}
\RequirePackage{textcomp}
\RequirePackage{etoolbox}
\RequirePackage{paralist}
\RequirePackage[english]{babel}

\def\theauthor{\textbf{!INSERT AUTHOR!}}
\def\thetitle{\textbf{!INSERT TITLE!}}
\def\@mtsubmissionyear{\textbf{!INSERT YEAR!}}
\def\@mtsubmissionmonth{\textbf{!INSERT MONTH!}} 
\def\@mtdegree{\textbf{!INSERT DEGREE!}}

\newcommand{\submissionyear}[1]{\def\@mtsubmissionyear{#1}}
\newcommand{\submissionmonth}[1]{\def\@mtsubmissionmonth{#1}}
\newcommand{\degree}[1]{\def\@mtdegree{#1}}
\newcommand{\major}[1]{\def\@mtmajor{#1}} 
\newcommand{\college}[1]{\def\@mtcollege{#1}} 
\newcommand{\supervisor}[1]{\def\@mtsupervisor{#1}} 
\newcommand{\cosupervisor}[1]{\def\@mtcosupervisor{#1}}
\newcommand{\internalexaminer}[1]{\def\@mtinternalexaminer{#1}} 
\newcommand{\externalexaminer}[1]{\def\@mtexternalexaminer{#1}} 
\newcommand{\departmenthead}[1]{\def\@mtdepartmenthead{#1}} 
\newcommand{\collegedean}[1]{\def\@mtcollegedean{#1}} 
\newcommand{\department}[1]{\def\@mtdepartment{#1}} 





%%%%%%%%%%%%
% Page layout
%
% Margins: T - 20mm; B - 30mm; L - 40mm; R - 20mm
% No running headers.
% Running footers are 10mm from bottom edge of paper
% i.e. (20 - 10)mm = 10mm from bottom edge of typeblock.
% Page number at right hand side of page
%%%%%%%%%%%%
\settrimmedsize{297mm}{210mm}{*}
\setlrmarginsandblock{38mm}{25mm}{*}
\setulmarginsandblock{25mm}{30mm}{*}
\setheadfoot{\baselineskip}{10mm}
\addtolength\footskip{10.5pt}
\makeoddfoot{plain}{}{\thepage}{}
\makeevenfoot{plain}{}{\thepage}{}
\pagestyle{plain}
\checkandfixthelayout

%%%%%%%%%%%%
% Simulate MS Windows fonts
% Invoking Helvetica and Times
% NOT Courier because, well, I hate it.
%
% TODO: TeX Gyre fonts + Math Times Pro with "altfonts" option
%%%%%%%%%%%%
\RequirePackage[T1]{fontenc}
\RequirePackage[scaled]{helvet}
\RequirePackage{mathptmx}
%\RequirePackage{courier}
\renewcommand\ttdefault{lmvtt}

\RequirePackage[breaklinks,pdfborder={0 0 0}]{hyperref}

%%%%%%%%%%%%
% Line and paragraph spacing
% - double spacing for normal text
%%%%%%%%%%%%
%\DoubleSpacing
\DisemulatePackage{setspace}
\RequirePackage{setspace}
\setstretch{2.0}
%\abnormalparskip{.5\onelineskip}
\setlength\parindent{3em} %12mm (Moaaz)

%%%%%%%%%%%%
% Footnotes
% - Font size = 8pt = \tiny for 12pt body font in memoir
% - Double spacing between footnotes
%%%%%%%%%%%%
\renewcommand{\foottextfont}{\tiny}
\setlength\footnotesep{\onelineskip}


%%%%%%%%%%%%
% 10pt = \footnotesize for backmatter
%%%%%%%%%%%%
\patchcommand{\backmatter}{}{\footnotesize}


%%%%%%%%%%%%
% The Cover and Title page
%%%%%%%%%%%%
\newcommand{\makecoverandtitlepage}{%
\ignorespaces
\changepage{-70mm}{0mm}{0mm}{0em}{0em}{35mm}{0em}{0em}{0em} %By Moaaz
\begin{titlingpage}
\SingleSpacing%
\centering%

\begin{Large}
\MakeUppercase{{\thetitle}}\\[72pt]
BY\par%
\vfill%
\MakeUppercase{\theauthor}\par%
\vfill%
INTERNATIONAL ISLAMIC UNIVERSITY MALAYSIA\par%\\%\\%

\vfill%
%Kuliyyah of Engineering\\%
\bigskip%
\@mtsubmissionyear\par%
%\@mtsubmissionmonth\par	 %By Moaaz
\end{Large}
\end{titlingpage}%
{\SingleSpacing\centering\thispagestyle{empty}\setcounter{page}{1}%
%\fontsize{15pt}{17pt}\selectfont%
%\renewcommand\ttdefault{lmtt}%
\begin{Large}
\MakeUppercase{\thetitle}\\[55pt]%
BY\par%
\vfill%
{\MakeUppercase{\theauthor}\par}%
\vfill%
{A dissertation submitted in fulfilment of the requirement %
for the degree of {\titlecap{\@mtdegree}} \\%
({\@mtmajor})\par}%	% By Moaaz
\vfill%
{Kuliyyah of~\titlecap{\@mtcollege}\\%
International Islamic University Malaysia}\\[1em]%\\%

\MakeUppercase{\@mtsubmissionmonth}% %
~~\@mtsubmissionyear%\\[3em]%
\end{Large}

\par\clearpage}%
\changepage{70mm}{0mm}{0mm}{0em}{0em}{-35mm}{0em}{0em}{0em}%%
\renewcommand\ttdefault{lmvtt}%
} %end of \makecoverandtitlepage

%%%%%%%%%%%%
% The Declaration page
%%%%%%%%%%%%
\newcommand{\declarationpage}{%
\chapter*{Declaration} 
I hereby declare that this dissertation is the result of my own investigations, except where otherwise stated. I also declare that it has not been previously or concurrently submitted as a whole for any other degrees at IIUM or other institutions.\\[24pt]
{\theauthor}\\[20pt]
Signature:........................... ~\hspace{5cm} Date:...........................
\addcontentsline{toc}{chapter}{Declaration Page}
\clearpage
}

%%%%%%%%%%%%%
%% Approval page
%%%%%%%%%%%%%
\newcommand{\approvalpage}{%
{\SingleSpacing
\chapter*{Approval Page}\vskip1em 
\noindent I certify that I have supervised and read this study and that in my opinion; it conforms
to acceptable standards of scholarly presentation and is fully adequate, in scope and
quality, as a dissertation for the degree of \@mtdegree~in~\@mtmajor.

\begin{flushright}
\begin{tabular}{l}
.............................................\\
 \parbox{5.5cm}{\@mtsupervisor} \\ 
 \parbox{5.5cm}{Supervisor}\\ 
\end{tabular} 
\\[12pt]		
\end{flushright}

\begin{flushright}
\begin{tabular}{l}
.............................................\\
 \parbox{5.5cm}{\@mtcosupervisor}\\ 
\parbox{5.5cm}{Co-Supervisor}\\ 
\end{tabular} 
\\[12pt]
\end{flushright}

\noindent I certify that I have read this study and that in my opinion; it conforms to acceptable
standards of scholarly presentation and is fully adequate, in scope and quality, as a
dissertation for the degree of \@mtdegree~in~\@mtmajor.

\begin{flushright}
\begin{tabular}{l}
.............................................\\
 \parbox{5.5cm}{\@mtinternalexaminer}\\ 
\parbox{5.5cm}{Examiner (Internal)}\\ 
\end{tabular} 
\\[12pt]		
\end{flushright}

\begin{flushright}
\begin{tabular}{l}
.............................................\\
 \parbox{5.5cm}{\@mtexternalexaminer}\\ 
\parbox{5.5cm}{Examiner (External)}\\ 
\end{tabular} 
\\[12pt]		
\end{flushright}

\noindent This dissertation was submitted to the Department of~\@mtdepartment~and is accepted as a fulfilment of the requirement for the degree of
\@mtdegree~in~\@mtmajor.
\begin{flushright}
\begin{tabular}{l}
.............................................\\
 \parbox{5.5cm}{\@mtdepartmenthead}\\ 
\parbox{5.5cm}{Head, Department of \@mtdepartment}\\ 
\end{tabular} 
\\[12pt]
\end{flushright}

\noindent This dissertation was submitted to the Kuliyyah of~\@mtcollege~and is accepted as a
fulfilment of the requirement for the degree of~\@mtdegree~in~\@mtmajor.
\begin{flushright}
\begin{tabular}{l}
.............................................\\
 \parbox{5.5cm}{\@mtcollegedean}\\ 
\parbox{5.5cm}{Dean, Kulliyah of \@mtcollege}\\ 
\end{tabular} 
\\[12pt]
\end{flushright}
\addcontentsline{toc}{chapter}{Approval Page}
\clearpage
}
}
%%%%%%%%%%%%%
%% Copyright page
%%%%%%%%%%%%%

\newcommand{\iiumcopyrightpage}{%
\chapter*{}
{\SingleSpacing
\addcontentsline{toc}{chapter}{Copyright Page}
\includepdf[pages=1,scale=1,,pagecommand={\begin{tikzpicture}
[remember picture, overlay]\node at (6.1,-6.1){Copyright~\copyright~ \@mtsubmissionyear~by~\theauthor. All rights reserved.};
\node at (6.3,-7.3)
{	\begin{minipage}{15cm}
	{
		\begin{center}
		\textbf{\MakeUppercase{\thetitle}}
		\end{center}
	}
	\end{minipage}
};
\node at (5.3,-16.3)
{
	\begin{tabular}{c}
	\parbox{13cm}{Affirmed by~\theauthor}\\
	\end{tabular}
};
\end{tikzpicture}}]{CopyrightPage.pdf}
\clearpage
}
}
%%%%%%%%%%%%
% The Acknowledgements (typeset like chapter?)
%%%%%%%%%%%%

%%%%%%%%%%%%
% The dedication (??? formatting???)
%%%%%%%%%%%%
\newcommand{\dedication}[1]{\newpage\hspace{1em}%
\phantomsection%
\currentpdfbookmark{Dedication}{dedication}%
\cftaddtitleline{toc}{chapter}{DEDICATION}{\thepage}%
\begin{vplace}[.5]\centering#1\end{vplace}%
\clearpage}


%%%%%%%%%%%%
% The Abstract
%%%%%%%%%%%%
\addtocontents{toc}{ \vspace{14pt} \par}
\abstractintoc
\renewcommand*\abstractname{\texorpdfstring{ABSTRACT}{Abstract}}
\renewcommand*\absnamepos{center}
\setlength\abstitleskip{1.3\onelineskip}
\renewcommand\abstractnamefont{\large\bfseries\MakeUppercase}
\renewcommand\abstracttextfont{\normalsize}
\setlength\absleftindent{0pt}
\setlength\absrightindent{0pt}
\newcommand{\abstractfromfile}[1]{\begin{abstract}\input{#1}\end{abstract}}

%%%%%%%%%%%%
% The Preface
%%%%%%%%%%%%
\newenvironment{preface}{\chapter{Preface}}{}
\newcommand{\prefacefromfile}[1]{\begin{preface}\input{#1}\end{preface}}

%%%%%%%%%%%%
% Chapter headings
%%%%%%%%%%%%
\renewcommand\chapterheadstart{\normalsize\vskip\beforechapskip}
\setlength\beforechapskip{0pt}
\setlength\midchapskip {0\onelineskip} %{1.5ex plus 1ex minus .2ex} %{0\onelineskip}
\setlength\afterchapskip{3\onelineskip}
\renewcommand*\chapnamefont{\large\bfseries}
\renewcommand*\chapnumfont{\large\bfseries\centering}
\renewcommand*\chaptitlefont{\SingleSpacing\large\bfseries\centering}
\renewcommand{\printchaptername}{{\chapnamefont\MakeUppercase{\chaptername}}}
\renewcommand*{\afterchapternum}{\vskip\midchapskip}
\renewcommand*{\printchaptertitle}[1]{{\chaptitlefont\MakeUppercase{#1}\par}}



%%%%%%%%%%%%
% The Appendices
%%%%%%%%%%%%
\renewcommand*\appendixname{Appendix}
\renewcommand\appendixtocname{\texorpdfstring{APPENDICES}{Appendices}}
%\newlistof{listofappendices}{apx}{\texorpdfstring{LIST OF APPENDICES}{List of Appendices}} 
\addtodef\appendix{}{\renewcommand\chaptername{\appendixname}}
\def\app@chapter[#1]#2{%
  \m@mpn@new@chaptrue%
  \m@mpn@new@schapfalse%
  \def\f@rbdy{#2}%
  \ifx\ch@pt@c\@empty % no optional args
    \def\f@rtoc{#2}%
    \def\f@rhdr{#2}%
  \else                  % at least one opt arg
    \let\f@rtoc\ch@pt@c
    \ifx\@empty#1\@empty
      \let\f@rhdr\ch@pt@c
    \else
      \def\f@rhdr{#1}%
    \fi
  \fi
  \m@m@Andfalse
  \ifnum \c@secnumdepth >\m@ne
    \if@mainmatter
      \m@m@Andtrue
    \fi
  \fi
  \ifm@m@And
    \refstepcounter{chapter}%
  \fi
  \ifartopt
    \@makechapterhead{#2}%
    \@afterheading
    \chaptermark{\f@rhdr}%
  \else
    \chaptermark{\f@rhdr}
    \insertchapterspace
    \if@twocolumn
      \@topnewpage[\@makechapterhead{#2}]%
    \else
      \@makechapterhead{#2}%
    \fi
    \@afterheading
  \fi
  \ifm@m@And
    \ifanappendix
      \addcontentsline{apx}{appendix}{%
        \protect\chapternumberline{\thechapter}\f@rtoc}%
      \memappchapinfo{\thechapter}{\f@rtoc}{\f@rhdr}{#2}%
    \else
      \addcontentsline{apx}{chapter}{%
        \protect\chapternumberline{\thechapter}\f@rtoc}%
      \memchapinfo{\thechapter}{\f@rtoc}{\f@rhdr}{#2}%
    \fi
  \else
    \addcontentsline{apx}{chapter}{\f@rtoc}%
    \ifanappendix
      \memappchapinfo{}{\f@rtoc}{\f@rhdr}{#2}%
    \else
      \memchapinfo{}{\f@rtoc}{\f@rhdr}{#2}%
    \fi
  \fi
  \ifheadnameref\M@gettitle{\f@rhdr}\else\M@gettitle{\f@rtoc}\fi}

\newcommand*{\startapps}{% 
  \cftinserthook{apx}{AppendixToCLines}
  \appendix %\appendixpage%
  \let\@chapter\app@chapter % use \app@chapter instead of \@chapter 
  \renewcommand\mychap[1]{\orichapter{##1}}
  \settocdepth{section}% stop sections being in the ToC 
} 
\newcommand*{\finishapps}{% 
  \renewcommand\mychap[1]{\orichapter[\texorpdfstring{\MakeUppercase{##1}}{##1}]{##1}}
  \settocdepth{section}% sections back in ToC 
} 
\cftinsertcode{AppendixToCLines}{%
\renewcommand*\cftchapteraftersnum{}%
\setlength\cftchapternumwidth{2em}%
\renewcommand*\cftchapterfont{\normalfont\mdseries\upshape}%
\renewcommand*\cftchapterpagefont{\normalfont\mdseries\upshape}%
}

%%%%%%%%%%%%
% Sectional headings (finish)
%%%%%%%%%%%%
\setsecnumdepth{paragraph}
\let\svsection\section
\let\svsubsection\subsection
\let\svsubsubsection\subsubsection
\let\svparagraph\paragraph

\def\section#1{\svsection{\titlecap{#1}}}
\def\subsection#1{\svsubsection{\titlecap{#1}}}
\def\subsubsection#1{\svsubsubsection{\titlecap{#1}}}
\def\paragraph#1{\svparagraph{\underline{\titlecap{#1}}}}

\setsecheadstyle{\SingleSpacing\normalsize\bfseries\MakeUppercase} %level 2 modified(Moaaz)
\setbeforesecskip{-5.5ex plus 1ex minus .2ex} %level 2 modified(Moaaz)
\setaftersecskip{0.1ex plus .2ex}
% % % % % %
\setsubsecheadstyle{\SingleSpacing\normalsize\bfseries}
\setbeforesubsecskip{-5.5ex plus 1ex minus .2ex} %level 3 modified(Moaaz)
\setaftersubsecskip{0.1ex plus .2ex}
%\renewcommand\thesubsubsection{\thesubsection\space(\alph{subsubsection})} %no need in iium
\setsubsubsecheadstyle{\SingleSpacing\normalsize\itshape\bfseries} %level 4
\setbeforesubsubsecskip{-5.5ex plus 1ex minus .2ex} %level 4 modified(Moaaz)
\setaftersubsubsecskip{0.1ex plus .2ex}
% % % % %
\setparaheadstyle{\SingleSpacing\normalsize\itshape} %level 5
\setbeforeparaskip{-5.5ex plus 1ex minus .2ex} %level 5 modified(Moaaz)
\setafterparaskip{0.1ex plus .2ex}




%%%%%%%%%%%
% ToC etc (By Moaaz)
%%%%%%%%%%% {\contentsname}{Table of contents}}
\settocdepth{subsubsection}
\addto{\captionsenglish}{\renewcommand*{\contentsname}{Table of Contents}}
\renewcommand*\indexname{\texorpdfstring{INDEX}{Index}}
\renewcommand*\glossaryname{\texorpdfstring{LIST OF SYMBOLS AND ACRONYMS}{List of Symbols and Acronyms}}


  \renewcommand*{\cftchapterleader}{%	% I used these two commands to add leader dots to chapters!
  \cftdotfill{\cftchapterdotsep}}
  \renewcommand*{\cftchapterdotsep}{\cftdotsep}

%\renewcommand\cftdotsep{\cftnodots}  % this ignore dots
\renewcommand\cfttabledotsep{\cftnodots}  %  ignore dots in table list(Moaaz)
\renewcommand\cftfiguredotsep{\cftnodots}%  ignore dots in figure list

\setrmarg{3.55em plus 1fil}

\setlength{\cftfigurenumwidth}{12mm}   % to change numwidth
\setlength{\cfttablenumwidth}{12mm}

%\renewcommand{\@pnumwidth}{2em} %Don't play with this again!
%\renewcommand{\@tocrmarg}{3em}

\renewcommand{\cftdotsep}{0.5} %Add dots by Moaaz'
%


\setpnumwidth{2.55em}

\renewcommand*{\cftchaptername}{\MakeUppercase{\chaptername}\space}
\renewcommand*{\cftchapteraftersnum}{:\space}
\renewcommand*{\cftchapterafterpnum}{\vspace*{-1pt}} %change this to chane after number spain
\renewcommand*{\cftappendixname}{\appendixname\space}

\setlength{\cftbeforechapterskip}{1pt}  %ADDED by MOAAZ
\setlength\cftsectionindent{1.2cm} 
\setlength\cftsubsectionindent{2.2cm} 
\setlength\cftsubsubsectionindent{3.6cm}
\let\orichapter\chapter
\renewcommand\chapter{\@ifstar{\mystarchap}{\mychap}} %capitalizing?!
\newcommand\mychap[2][]{\orichapter%
[\ifstrempty{#1}{\texorpdfstring{\MakeUppercase{#2}}{#2}}% \Decide how to print title
{\texorpdfstring{\MakeUppercase{#1}}{#1}}]%
{#2}}
\newcommand\mystarchap[1]{\orichapter*{#1}}
\renewcommand*\cftsectionafterpnum{\vskip 3pt}
%\setlength\cftsubsectionindent{\cftsectionnumwidth}
\renewcommand*\cftfigurename{\space}  % to add: Figure No.
\renewcommand*\cftfigurefont{\normalsize}  %font of figure name
\renewcommand*\cfttablefont{\normalsize}  
\renewcommand*\cfttablepagefont{\normalsize}
\renewcommand*\cftfigurepagefont{\normalsize}%font of figure page
\addtodef{\insertchapterspace}{}%
{\addtocontents{toc}{\protect\vspace*{0pt}}}


%%%%%%%%%%%%%%%%%%%%%% IIUM TOC %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newbool{specialtoc}
%\renewcommand\cftdotsep{1} 
\renewcommand{\cftchapterfont}{%
  \ifbool{specialtoc}{%
    \normalsize
  }{%
    \normalsize\bfseries
  }%
}

\renewcommand{\cftchapterpagefont}{%
  \ifbool{specialtoc}{%
    \normalsize
  }{%
    \normalsize\bfseries
  }%
}

\renewcommand*{\cftsectionfont}{\normalsize}
\renewcommand*{\cftsubsectionfont}{\normalsize}
\renewcommand*{\cftsubsubsectionfont}{\normalsize}

\renewcommand*{\cftsectionpagefont}{\normalsize}
\renewcommand*{\cftsubsectionpagefont}{\normalsize}
\renewcommand*{\cftsubsubsectionpagefont}{\normalsize}

\renewcommand*{\cftsectionafterpnum}{\vspace{-1pt}}
\renewcommand*{\cftsubsectionafterpnum}{\vspace{-1pt}}
\renewcommand*{\cftsubsubsectionafterpnum}{\vspace{-1pt}}

\renewcommand*{\cftfigureafterpnum}{\vspace{\onelineskip}} %double spacing between enteries
\renewcommand*{\cfttableafterpnum}{\vspace{\onelineskip}}

\renewcommand*{\cftpartformatpnum}[1]{%
\hbox to \@pnumwidth{{\cftpartpagefont #1}}}


% % % % %For removing spaces between chapters in lof and lot
\newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
\addtocontents{lof}{\protect\noaddvspace}
\addtocontents{lot}{\protect\noaddvspace}
% % % % % % % % % % % % % % % % % % % % % % % % %















%%%%%%%%%%%
% Indexing
%%%%%%%%%%%
%\RequirePackage{makeidx}
%\makeindex



%%%%%%%%%%%%
% Bibliograpy
% - Font size = 10pt = \footnotesize(um)for iium=\normalsize=12pt
% - Double spacing between entries
%%%%%%%%%%%%
\RequirePackage[nosectionbib]{apacite}
\newcounter{lbibcount}
\bibliographystyle{apacite}
\renewcommand\bibliographytypesize{\normalsize} %Modified by Moaaz
%\setlength\bibitemsep{\onelineskip}
\setlength\bibleftmargin{3em}
\setlength\bibindent{-3em}

\patchcommand{\bibitem}{\SingleSpacing}{}
\AtBeginDocument{\renewcommand*\bibname{\texorpdfstring{REFERENCES}{References}}}




\RequirePackage{multibib}

%\newcites{jour,conf}{Journal Articles,Conference Proceedings}
\newcites{conf}{PUBLICATIONS}
%\bibliographystylejour{apacite}	%use if u need journal
\bibliographystyleconf{apacite}


\RequirePackage{relsize}
\RequirePackage{longtable}
\RequirePackage[acronym,toc,nonumberlist,shortcuts,translate=false,style=long]{glossaries}
%\RequirePackage{glossary-longragged}
\RequirePackage{glossaries-babel}
%\renewcommand*{\acrnameformat}[2]{#2 (\acronymfont{#1})}
\renewcommand*{\glsgroupskip}{}
\renewcommand{\glossarypreamble}{\normalsize}
\renewcommand{\glossarypostamble}{\normalsize}
\setlength{\glsdescwidth}{0.95\linewidth}
\makeglossaries
%\newcommand\listacrname{List of Symbols and Acronyms}
\newcommand\listofabbreviations{{\renewcommand*{\arraystretch}{0.95}\printglossary[type=\acronymtype,title=List of Abbreviations]}}

\newcommand\listofsymbols{{\renewcommand*{\arraystretch}{0.95}\printglossary[title=List of Symbols]}}
\addto\captionsenglish{%
\renewcommand*\abstractname{\texorpdfstring{Abstract}{Abstract}}
\renewcommand*\contentsname{\texorpdfstring{Table of Contents}{Table of Contents}}
\renewcommand*\listtablename{\texorpdfstring{List of Tables}{List of Tables}}
\renewcommand*\listfigurename{\texorpdfstring{List of Figures}{List of Figures}}
\renewcommand*\indexname{\texorpdfstring{INDEX}{Index}}
%\renewcommand*\glossaryname{\texorpdfstring{LIST OF SYMBOLS AND ACRONYMS}{List of Symbols and Acronyms}}
}



