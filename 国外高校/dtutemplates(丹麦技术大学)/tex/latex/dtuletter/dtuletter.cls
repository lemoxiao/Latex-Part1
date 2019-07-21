%!TEX root = test_dtu_letter.tex
% Last update Fri May 07 15:37:08 2010 Tobias Pyndt Steinmann
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dtuletter}[2010/05/07 v1.0 DTU letter template class.]

% Default Font
\newcommand\@loadfont{\RequirePackage[scaled]{helvet}\renewcommand*\familydefault{\sfdefault}}

% Create options
\DeclareOption{arial}{\renewcommand\@loadfont{\RequirePackage[scaled]{uarial}\renewcommand*\familydefault{\sfdefault}}}
\DeclareOption{helvet}{\renewcommand\@loadfont{\RequirePackage[scaled]{uarial}\renewcommand*\familydefault{\sfdefault}}}
\DeclareOption{defaultfont}{\renewcommand\@loadfont{}}
% Passes and class options to the underlying memoir class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions

% Load the memoir class with article emulation
\LoadClass[a4paper,article,11pt]{memoir}

\RequirePackage{keyval}
\RequirePackage[T1]{fontenc}
\@loadfont
% Test i uarial is available if not use helvetica. Removed again as it would prevent MikTeX from automatically install the the package. 
%\IfFileExists{uarial.sty}{\RequirePackage[scaled]{uarial}}{\RequirePackage[scaled]{helvet}}
\RequirePackage{placeins}
\RequirePackage{xcolor}
\RequirePackage{calc}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage{ifthen}
\hypersetup{
pdfborder=0 0 0
}

% Redefine the page margins, header, and footer
\setlrmarginsandblock{25mm}{25mm}{*}
\setulmarginsandblock{41mm}{36mm}{*}
\setheadfoot{0.01mm}{13mm+36pt}
\setheaderspaces{16mm}{*}{*}
\checkandfixthelayout

% Redefine paragraph layout
\abnormalparskip{\baselineskip}
\setlength\parindent{0pt}

% Remove the numbers from all the headings (\section, \subsection, etc.)
\setcounter{secnumdepth}{-1}

% usefull commands
\newcommand\createandsetlength[2]{\newlength{#1}\setlength#1{#2}}

\newcommand\addresslinezero[1]{\def\@adrzero{#1}}
\newcommand\addresslineone[1]{\def\@adrone{#1}}
\newcommand\addresslinetwo[1]{\def\@adrtwo{#1}}
\newcommand\addresslinethree[1]{\def\@adrthree{#1}}
\newcommand\addresslinefour[1]{\def\@adrfour{#1}}
\newcommand\addresslinefive[1]{\def\@adrfive{#1}}
\newcommand\addresslinesix[1]{\def\@adrsix{#1}}

\newcommand\addresscity[1]{\def\@city{#1}}
\newcommand\addresszip[1]{\def\@zip{#1}}
\newcommand\addressatt[1]{\def\@adratt{#1}}
\newcommand\addressto[1]{\def\@adrzero{#1}}

\newcommand\fromaddresslineone[1]{\def\@fromadrone{#1}}
\newcommand\fromaddresslinetwo[1]{\def\@fromadrtwo{#1}}
\newcommand\fromaddresslinethree[1]{\def\@fromadrthree{#1}}
\newcommand\frombuilding[1]{\def\@frombuilding{#1}}
\newcommand\fromzip[1]{\def\@fromzip{#1}}
\newcommand\fromcity[1]{\def\@fromcity{#1}}
\newcommand\fromphone[1]{\def\@phone{#1}}
\newcommand\fromdirectphone[1]{\def\@dirphone{#1}}
\newcommand\fromfax[1]{\def\@fax{#1}}
\newcommand\fromwebpage[1]{\def\@webpage{#1}}
\newcommand\cvr[1]{\def\@cvr{#1}}
\newcommand\fromemail[1]{\def\@fromemail{#1}}
\newcommand\fromdepartment[1]{\def\@fromdepartment{#1}}
\newcommand\docID[1]{\def\@docID{#1}}
\newcommand\dtuname[1]{\def\@dtuname{#1}}

\addresslinezero{}
\addresslineone{}
\addresslinetwo{}
\addresslinethree{}
\addresslinefour{}
\addresslinefive{}
\addresslinesix{}
\addresscity{}
\addresszip{}
\addressatt{}
\addressto{}
\fromaddresslineone{}
\fromaddresslinetwo{}
\fromaddresslinethree{}
\frombuilding{}
\fromphone{}
\fromdirectphone{}
\fromfax{}
\cvr{DK 30 06 09 46}
\fromemail{}
\fromdepartment{}
\fromwebpage{}
\fromzip{}
\fromcity{}
\docID{}
\author{}
\dtuname{}

\newcommand\printlangphone{}
\newcommand\printlangdirectphone{}
\newcommand\printlangfax{}
\newcommand\printdate{\today}
\newcommand\printcvr{}

\define@key{dtuletter}{config}			{\def\@configfile{dtu_letter_#1.cfg}} % TODO make it possible to include several config files

\def\SetValsdanish{}
\def\SetValsenglish{}
\def\lang{danish} % default value
\newif\iflangset
\define@key{dtuletter}{lang}			{\def\lang{#1}\langsettrue}
\define@key{dtuletter}{DK-department}	{\addto\SetValsdanish{\fromdepartment{#1}}}
\define@key{dtuletter}{UK-department}	{\addto\SetValsenglish{\fromdepartment{#1}}}
\define@key{dtuletter}{DK-street}		{\addto\SetValsdanish{\fromaddresslineone{#1}}}
\define@key{dtuletter}{UK-street}		{\addto\SetValsenglish{\fromaddresslineone{#1}}}
\define@key{dtuletter}{DK-zipcity}		{\addto\SetValsdanish{\fromaddresslinethree{#1}}}
\define@key{dtuletter}{UK-zipcity}		{\addto\SetValsenglish{\fromaddresslinethree{#1}}}
\define@key{dtuletter}{DK-building}		{\addto\SetValsdanish{\frombuilding{#1}\fromaddresslinetwo{\langbuilding\ \thefrombuilding}}}
\define@key{dtuletter}{UK-building}		{\addto\SetValsenglish{\frombuilding{#1}\fromaddresslinetwo{\langbuilding\ \thefrombuilding}}}
\define@key{dtuletter}{phone}			{\fromphone{#1}\renewcommand\printlangphone{\langphone}}
\define@key{dtuletter}{phone-direct}	{\fromdirectphone{#1}\renewcommand\printlangdirectphone{\langdirectphone}}
\define@key{dtuletter}{fax}				{\fromfax{#1}\renewcommand\printlangfax{\langfax}}
\define@key{dtuletter}{email}			{\fromemail{#1}}
\define@key{dtuletter}{webpage}			{\fromwebpage{\href{#1}{#1}}}
\define@key{dtuletter}{cvr}				{\cvr{#1}\renewcommand\printcvr{\ifthenelse{\equal{\thecvr}{\@empty}}{}{\langcvr\ \thecvr}}}
\define@key{dtuletter}{docID}			{\docID{#1}}
\define@key{dtuletter}{author}			{\author{#1}}
\define@key{dtuletter}{date}			{\renewcommand\printdate{#1}}

\define@key{dtuletter}{TO-name}			{\addressto{#1}}
\define@key{dtuletter}{TO-address}		{\addresslineone{#1}}
\define@key{dtuletter}{TO-zipcity}		{\addresslinetwo{#1}}
\define@key{dtuletter}{TO-country}		{\addresslinethree{#1}}
\define@key{dtuletter}{TO-att}			{\addressatt{#1}\addresslinefive{\langatt\ \theatt}}

\def\department{admin} % default value
\define@key{dtuletter}{department}		{\def\department{#1}}

\newif\ifstationery
\def\stationeryvalue{false}
\define@key{dtuletter}{stationery}[true]{\def\stationeryvalue{#1}} %true/false?

\define@key{dtuletter}{DK-lang-cvr}				{\addto\SetValsdanish{\def\langcvr{#1}}} % TODO if UK values are not specified use DK values
\define@key{dtuletter}{UK-lang-cvr}				{\addto\SetValsenglish{\def\langcvr{#1}}}
\define@key{dtuletter}{DK-lang-phone}			{\addto\SetValsdanish{\def\langphone{#1}}}
\define@key{dtuletter}{UK-lang-phone}			{\addto\SetValsenglish{\def\langphone{#1}}}
\define@key{dtuletter}{DK-lang-phone-direct}	{\addto\SetValsdanish{\def\langdirectphone{#1}}}
\define@key{dtuletter}{UK-lang-phone-direct}	{\addto\SetValsenglish{\def\langdirectphone{#1}}}
\define@key{dtuletter}{DK-lang-fax}				{\addto\SetValsdanish{\def\langfax{#1}}}
\define@key{dtuletter}{UK-lang-fax}				{\addto\SetValsenglish{\def\langfax{#1}}}
\define@key{dtuletter}{DK-lang-building}		{\addto\SetValsdanish{\def\langbuilding{#1}}}
\define@key{dtuletter}{UK-lang-building}		{\addto\SetValsenglish{\def\langbuilding{#1}}}
\define@key{dtuletter}{DK-lang-att}				{\addto\SetValsdanish{\def\langatt{#1}}}
\define@key{dtuletter}{UK-lang-att}				{\addto\SetValsenglish{\def\langatt{#1}}}
\define@key{dtuletter}{DK-lang-dtu}				{\addto\SetValsdanish{\dtuname{#1}}}
\define@key{dtuletter}{UK-lang-dtu}				{\addto\SetValsenglish{\dtuname{#1}}}

\newcommand\dtuletterconfig[1]{\setkeys{dtuletter}{#1}\csname SetVals\lang\endcsname}

% \newcommand\setDepartmentNameLogo[1]{\def\@departmentNameLogo{#1}}
% \newcommand\thedepartmentNameLogo{\@departmentNameLogo}
% \newcommand\setDepartmentNameText[1]{\def\@departmentNameText{#1}}
% \newcommand\thedepartmentNameText{\@departmentNameText}
% \newcommand\setDepartmentLongNameText[1]{\def\@departmentLongNameText{#1}}
% \newcommand\thedepartmentLongNameText{\@departmentLongNameText}
% 
% \newcommand\createDepartment[1]{%
% \expandafter\def\csname department@#1\endcsname{#1}}
% 
% \newcommand\aliasDepartment[2]{%
% \expandafter\def\csname department@#2\endcsname{#1}}
% 
% \newcommand\makeDepartmentInfo[5]{%
% 	\def\@departmentcmd{\csname department@#2\endcsname}
% 	\createDepartment{#2}
% 	\expandafter\def\csname namelogo#1@\@departmentcmd\endcsname{\setDepartmentNameLogo{#3}}%
% 	\expandafter\def\csname nametext#1@\@departmentcmd\endcsname{\setDepartmentNameText{#4}}%
% 	\expandafter\def\csname namelongtext#1@\@departmentcmd\endcsname{\setDepartmentLongNameText{#5}}%
% }
% 
% \newcommand\activateDepartmentInfo[2]{%
% 	\ifcsname department@#2\endcsname
% 		\def\@departmentcmd{\csname department@#2\endcsname}
% 	\else
% 		\def\@departmentcmd{\department@admin}
% 		\ClassInfo{dtuletter}{Department does not exist, using default.}
% 	\fi
% 	\csname namelogo#1@\@departmentcmd\endcsname % TODO test if command exists before executing it
% 	\csname nametext#1@\@departmentcmd\endcsname
% 	\csname namelongtext#1@\@departmentcmd\endcsname
% 	\fromdepartment{\thedepartmentLongNameText}
% }

\InputIfFileExists{departments}%
	{\ClassInfo{dtuletter}{The file departments.tex with department logo file naming has been loaded.}
	 }%
	{\ClassInfo{dtuletter}{The file departments.tex is missing. Consult the manual.}}%

\newcommand\theaddresslinezero{\@adrzero}
\newcommand\theaddresslineone{\@adrone}
\newcommand\theaddresslinetwo{\@adrtwo}
\newcommand\theaddresslinethree{\@adrthree}
\newcommand\theaddresslinefour{\@adrfour}
\newcommand\theaddresslinefive{\@adrfive}
\newcommand\theaddresslinesix{\@adrsix}

\newcommand\theatt{\@adratt}
\newcommand\theto{\@adrzero}
\newcommand\thezip{\@zip}
\newcommand\thecity{\@city}

\newcommand\thefromaddresslineone{\@fromadrone}
\newcommand\thefromaddresslinetwo{\@fromadrtwo}
\newcommand\thefromaddresslinethree{\@fromadrthree}
\newcommand\thefrombuilding{\@frombuilding}
\newcommand\thefromzip{\@fromzip}
\newcommand\thefromcity{\@fromcity}
\newcommand\thefromphone{\@phone}
\newcommand\thefromwebpage{\@webpage}
\newcommand\thefromdirectphone{\@dirphone}
\newcommand\thefromfax{\@fax}
\newcommand\thecvr{\@cvr}
\newcommand\thefromemail{\@fromemail}
\newcommand\thefromdepartment{\@fromdepartment}
\newcommand\thedocID{\@docID}
\newcommand\thedtuname{\@dtuname}

\addresslinetwo{\thezip\ \thecity}
\fromaddresslinethree{\thefromzip\ \thefromcity}

% \newcommand\department

% Make pagestyles
\makepagestyle{dtuletter_side1}
% \makeoddhead{dtubrev_side1}{}{}{\flushright \includegraphics[height=15mm]{tex_dtu_bomaerke}}%\vspace{59.5mm}\par text}
\makeoddhead{dtuletter_side1}{\normalfont\fontsize{11pt}{14pt}\selectfont
\begin{tabular*}{1.003\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}%\hline
\ifstationery%
\parbox[b][16mm][t]{8cm}{} &%
\else%
	\parbox[b][16mm][t]{8cm}{\includegraphics[height=4.6mm]{\thedepartmentNameLogo}}%
	& \includegraphics[height=16mm]{tex_dtu_logo}%
\fi%
\\[8mm]%
%\hline
\theaddresslinezero & \\
\theaddresslineone & \\
\theaddresslinetwo & \\
\theaddresslinethree & \\
\theaddresslinefour & \\
\theaddresslinefive & \\
\theaddresslinesix & \\
& \printdate\\
& \thedocID\\ 
& \theauthor\\ 
\end{tabular*}
}{}{}
\makeoddfoot{dtuletter_side1}{\normalfont\fontsize{8pt}{12pt}\selectfont
%
\makebox[0pt][l]{\hspace{-17mm}%
	\rotatebox{90}{\makebox[0pt][l]{%
	\hspace{13mm}\normalfont\fontsize{6pt}{10pt}\selectfont\textcolor{black!70}{%
	\ifstationery%
	\else%
	\printcvr%
	\fi%
	}}}%
}
\begin{tabular}{@{}p{43mm}@{}p{8mm}@{}p{36mm}@{}p{8mm}@{}p{7mm}@{}p{20.5mm}@{}p{8mm}@{}p{29.5mm}@{}}
{\thedtuname} & & \thefromaddresslineone & & \printlangphone & \thefromphone & & {\hfill \href{mailto:\thefromemail}{\thefromemail}}\\
\arraybackslash\raggedright{\bfseries \thefromdepartment} & & \thefromaddresslinetwo & & \printlangdirectphone & \thefromdirectphone & & {\hfill \protect\thefromwebpage}\\
 										 & & \thefromaddresslinethree    & & \printlangfax & \thefromfax & & \\  
\end{tabular}
}{}{}

\makepagestyle{dtuletter}
% \makeoddhead{dtubrev_side1}{}{}{\flushright \includegraphics[height=15mm]{tex_dtu_bomaerke}}%\vspace{59.5mm}\par text}
\makeoddhead{dtuletter}{
\begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}
	  & %
	\ifstationery%
	%box with height 16mm
	\else%
	\includegraphics[height=16mm]{tex_dtu_logo}%
	\fi%
\\
\end{tabular*}
}{}{}
\makeevenhead{dtuletter}{
\begin{tabular*}{1.003\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}
	  & %
	\ifstationery%
	%box with height 16mm
	\else%
	\includegraphics[height=16mm]{tex_dtu_logo}%
	\fi%
\\
\end{tabular*}
}{}{}
\makeoddfoot {dtuletter}{}{}{\thepage\vspace*{36pt}}
\makeevenfoot{dtuletter}{}{}{\thepage\vspace*{36pt}}

% Make chapter style
\makechapterstyle{dtuletter}{%
  \chapterstyle{default}
  \setlength{\beforechapskip}{0pt}
  \renewcommand*{\chapterheadstart}{\vspace{\beforechapskip}}
  \setlength{\afterchapskip}{0pt}
  \renewcommand{\printchaptername}{}
  \renewcommand{\chapternamenum}{}
  \renewcommand{\chaptitlefont}{\bfseries\fontsize{10pt}{14pt}\selectfont}
  \renewcommand{\chapnumfont}{\chaptitlefont}
  \renewcommand{\printchapternum}{\chapnumfont \thechapter\quad}
  \renewcommand{\afterchapternum}{}}

% Redefine the section headings
\setsecheadstyle{\bfseries\fontsize{10pt}{14pt}\selectfont}
\setbeforesecskip{0pt}
\setaftersecskip{0.1pt}

% Code to be excuted just after \begin{document}
\AtBeginDocument{%
\dtuletterconfig{
DK-lang-cvr = CVR-nr.,
DK-lang-phone = Tlf,
DK-lang-phone-direct = Dir,
DK-lang-fax = Fax,
DK-lang-att = Att.,
DK-lang-building = Bygning,
DK-lang-dtu = Danmarks Tekniske Universitet,
UK-lang-cvr = VAT no.,
UK-lang-phone = Tel,
UK-lang-phone-direct = Dir,
UK-lang-fax = Fax,
UK-lang-att = Att.,
UK-lang-building = Building,
UK-lang-dtu = Technical University of Denmark
}%

% Select language, use babel if language supported
\iflangset\else
	\ifthenelse{\equal{danish}{\languagename}\or\equal{english}{\languagename}}
		{\def\lang{\languagename}}
		{\def\lang{english}}
\fi
\activateDepartmentInfo{\lang}{\department}%
\fromdepartment{\thedepartmentLongNameText}
\csname stationery\stationeryvalue\endcsname % activate letterpage 

% Input user configuration file
\ifthenelse{\isundefined{\@configfile}}{}{%
\InputIfFileExists{\@configfile}%
  {\ClassInfo{dtuletter}{The file \@configfile\ with user configuration has been loaded.}}%
  {\ClassInfo{dtuletter}{The file \@configfile\ is missing. Consult the manual.}}%
}
\normalfont\fontsize{11pt}{14pt}\selectfont
\raggedright
\chapterstyle{dtuletter}
\pagestyle{dtuletter}
\thispagestyle{dtuletter_side1}
\createandsetlength\textskiptest{55mm-\baselineskip}
\vspace*{\textskiptest}\par% 55 -17 = 38
\FloatBarrier%
}

% That's all, folks!
\endinput