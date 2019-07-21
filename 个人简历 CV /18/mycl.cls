%
% Matching cover letter class.
%

% Base class
\LoadClass[11pt,a4paper]{article}

\hyphenation{eco-system}
% Packages
\RequirePackage{bookman,etoolbox,hyperref,marvosym,needspace,tabularx,xcolor}
\RequirePackage[hmargin=2.5cm,vmargin=1.25cm]{geometry}

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

\renewcommand\title[2]{%
    \begin{center}
	{\Huge\color{title} #1}
	\medskip\\
	{\Large\color{text2} #2}
	\bigskip
    \end{center}}

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

% Renders a personal data box:
%
% |[
% \personal[optional: web site without scheme (no http:// prefix)]
%          {address}{phone number}{email}
% ]|
\newcommand\personal[4][]{%
    \needspace{0.5\textheight}%
    \colorbox{box}{\color{text2}%
    \hspace*{0.5\textwidth}\begin{tabularx}{0.5\textwidth}{c|X}
    \Letter  & {#2}\smallskip\\
    \Telefon & {#3}\smallskip\\
    \MVAt    & \href{mailto:#4}{#4}
    \ifstrempty{#1}{}{\smallskip\\ & \href{#1}{#1}}
    \end{tabularx}}}

% Change bullet symbol to dash
\renewcommand\labelitemi{--}
