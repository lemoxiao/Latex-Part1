%
% Based on Nicola Fontana's class:
% http://dev.entidi.com/p/tccv/
%
% which is inspired by Alessandro Plasmati's template:
% http://www.latextemplates.com/template/two-column-one-page-cv
%

% Base class
\LoadClass[11pt,a4paper]{article}

\hyphenation{eco-system}
% Packages
\RequirePackage{bookman,etoolbox,hyperref,marvosym,needspace,tabularx,xcolor,graphicx}
\RequirePackage[hmargin=1.25cm,vmargin=1.25cm,twocolumn,columnsep=1.25cm]{geometry}

% Colors
\definecolor{box}{HTML}{FFFFFF}
\definecolor{title}{HTML}{000000}
\definecolor{text}{HTML}{303030}
\definecolor{text2}{HTML}{808080}
\definecolor{section}{HTML}{191970}

\renewcommand{\familydefault}{\sfdefault}
\setcounter{secnumdepth}{-1}
\setlength{\parindent}{0pt}
\color{text}
\hypersetup{colorlinks,breaklinks,urlcolor=text2}
\pagenumbering{gobble}

\renewcommand\title[3]{%
    \twocolumn[%
    \begin{center}
	{\Huge\color{title} #1}
	\medskip\\
	{\Large\color{text2} #2}
    \end{center}
    \def\photo{#3}
    \if\photo\empty
    \else
    \begin{picture}(0,0)
    \put(0,10){\hbox{\includegraphics[height=2.5cm]{\photo}}}
    \end{picture}
    \fi]}

% Overrides the \section command to capitalize every
% word for cosmetic purposes and draws a rule under it.
\makeatletter
\let\old@section\section
\renewcommand\section[2][]{{\color{section}%
    \old@section[#1]{#2}}%
    \newdimen\raising%
    \raising=\dimexpr-0.7\baselineskip\relax%
    \vskip\raising\hrule height 0.4pt\vskip-\raising}
\makeatother

% Allow conditionals based on the job name. This can usually be set
% from a command-line argument: check fausto.en.tex for an example.
%
% |[
% \ifjob{jobname}{content if matches}{content if does not match}
% ]|
\newcommand\ifjob[3]{%
    \edef\JOBNAME{\jobname}%
    \edef\PIVOT{\detokenize{#1}}%
    \ifdefstrequal{\JOBNAME}{\PIVOT}{#2}{#3}%
}

% Renders a personal data box:
%
% |[
% \personal[optional: web site without scheme (no http:// prefix)]
%          {address}{phone number}{email}
% ]|
\newcommand\personal[4][]{%
    \needspace{0.5\textheight}%
    \newdimen\boxwidth%
    \boxwidth=\dimexpr\linewidth-2\fboxsep\relax%
    \colorbox{box}{\color{text2}%
    \begin{tabularx}{\boxwidth}{c|X}
    \Letter  & {#2}\smallskip\\
    \Telefon & {#3}\smallskip\\
    \MVAt    & \href{mailto:#4}{#4}
    \ifstrempty{#1}{}{\smallskip\\ & \href{#1}{#1}}
    \end{tabularx}}}

% Every \item can be followed by one or more paragraphs
% of description:
%
% |[
% \item{date range}{company}{role}
%
% Description of what achieved during this application.
% ]|
\newenvironment{eventlist}{%
    \newcommand*\inskip{}
    \renewcommand\item[3]{%
	\inskip%
	{\raggedleft\textsc{##1}\\[1pt]}
	{\textit{##2}}\\[2pt]
	{\large\textbf{##3}}
	\medskip
	\renewcommand\inskip{\bigskip}}}
    {\bigskip}

% Use only \item inside this environment: no other macros
% are allowed:
%
% |[
% \item[optional: what has been achieved]{years}{subject}{notes}
% ]|
\newenvironment{yearlist}{%
    \renewcommand\item[4][]{%
	{\textsc{##2}} & {\bfseries ##3} \\
	\ifstrempty{##1}{}{& {\textsc{##1}} \\}
	& {\textit{##4}}\medskip\\}
    \tabularx{\linewidth}{rX}}
    {\endtabularx}

% Use only \item inside this environment: no other macros
% are allowed:
%
% |[
% \item{fact}{description}
% ]|
\newenvironment{factlist}{%
    \newdimen\unbaseline
    \unbaseline=\dimexpr-\baselinestretch\baselineskip\relax
    \renewcommand\item[2]{%
	\textsc{##1} & {\raggedright ##2\medskip\\}\\[\unbaseline]}
    \tabularx{\linewidth}{rX}}
    {\endtabularx}

%
% |[
% \item{title}{authors}{proceedings}
% ]|
\newenvironment{publicationlist}{%
    \renewcommand\item[3]{%
    {-- \textbf{{##1}.} {##2}. In \textit{{##3}.}\medskip\\}}}{}

%%
%% End of file `mytccv.cls'.
