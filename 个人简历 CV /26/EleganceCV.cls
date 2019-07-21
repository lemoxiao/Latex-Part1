\ProvidesClass{EleganceCV}[2015/10/01 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{
\PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

\definecolor{headercolor}{HTML}{37C69C}
%\definecolor{headercolor}{HTML}{999999}

\ifdefined\@cv@print
\colorlet{green}{lightgray}
\colorlet{orange}{lightgray}
\colorlet{purple}{lightgray}
\colorlet{red}{lightgray}
\colorlet{blue}{lightgray}
\colorlet{fillheader}{white}
\colorlet{header}{lightgray}
\else
\colorlet{fillheader}{headercolor}
\colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{lightgray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}

\newfontfamily\bodyfont
[BoldFont=texgyreheros-bold.otf,
ItalicFont=texgyreheros-italic.otf,
BoldItalicFont=texgyreheros-bolditalic.otf]
{texgyreheros-regular.otf}
\newfontfamily\thinfont[]{Lato-Light.ttf}
\newfontfamily\headingfont[]{texgyreheros-bold.otf}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont
[Mapping=tex-text, Color=textcolor,
BoldFont=texgyreheros-bold.otf,
ItalicFont=texgyreheros-italic.otf,
BoldItalicFont=texgyreheros-bolditalic.otf
]
{texgyreheros-regular.otf}

\setmathfont{texgyreheros-regular.otf}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{
\fontsize{14pt}{24pt}\selectfont
\thinfont
\color{white}
}

\newcommand{\header}[3]{
\begin{tikzpicture}[remember picture,overlay]
\node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
\node [anchor=center] (name) at (box) {
\fontsize{40pt}{72pt}\color{header}
{\thinfont #1}{\bodyfont #2}
};
\node [anchor=north] at (name.south) {
\fontsize{14pt}{24pt}\color{header}
\thinfont #3
};
\end{tikzpicture}
\vspace{2.5cm}
\vspace{-2\parskip}
}

%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%

\RequirePackage{marvosym}

\RequirePackage[super]{nth}

\newcommand{\coverletter}[1]{
\begin{minipage}[l]{1.0\textwidth}
\noindent{\\ \\#1\\}
\end{minipage}
}

\newcommand{\elegantfootnote}[7]{
\let\thefootnote\relax\footnote{{\normalsize\hspace{-0.75cm}
\centerline{#1{\color{gray}{\tiny\hspace{0.45cm}\CircSteel}}\hspace*{0.48cm}#2{\color{gray}{\tiny\hspace{0.45cm}\CircSteel}}\hspace*{0.48cm}#3{\color{gray}{\tiny \hspace{0.45cm}\CircSteel}}\hspace*{0.48cm}#4}\\[0.05cm]
\vspace{-1.5cm}\centerline{\hspace{0.185cm}#5{\color{gray}{\tiny\hspace{0.45cm}\CircSteel}}\hspace*{0.48cm}#6{\color{gray}{\tiny\hspace{0.45cm}\CircSteel}}\hspace*{0.48cm}#7}
}}
}

\newcommand{\info}[5]{
\begin{minipage}[l]{0.662\textwidth}
\noindent{\\ \\#1}
\end{minipage}
\begin{minipage}[ht]{0.03\textwidth}
\hspace{0.45cm}\\[0.06cm]
\hspace{0.5cm}\\[0.1cm]
\hspace{0.027cm}\\[0.1cm]
\hspace{0.2cm}
\end{minipage}
\begin{minipage}[ht]{0.297\textwidth}
\vspace{0.725cm}\hfill#2\\[0.04cm]
\noindent\textcolor{white}{\rule{0.01\textwidth}{1pt}}\hfill#3\\[0.09cm]
\noindent\textcolor{white}{\rule{0.01\textwidth}{1pt}}\hfill#4\\[0.1cm]
\noindent\textcolor{white}{\rule{0.01\textwidth}{1pt}}\hfill#5\\
\end{minipage}
}

\newcommand{\signature}[6]{
#1\\
\\
\begin{minipage}[l]{0.213\textwidth}
\vspace*{-0.15cm}
\hspace*{-0.15cm}\includegraphics[scale=0.035]{#2}
\end{minipage}
\begin{minipage}[ht]{0.78\textwidth}
\noindent\textcolor{white}{\rule{0.262\textwidth}{0.1pt}}\\
\noindent\textcolor{white}{\rule{0.262\textwidth}{0.1pt}}\\
\noindent\textcolor{white}{\rule{0.262\textwidth}{0.1pt}}\hfill #3\\
\noindent\textcolor{white}{\rule{0.262\textwidth}{0.1pt}}\hfill #4\\
\noindent\textcolor{white}{\rule{0.262\textwidth}{0.1pt}}\hfill #5
\end{minipage}
\\
\\
#6
}

\RequirePackage{parskip}

\renewcommand{\section}[3]{
{\LARGE\headingfont{\color{gray}#1} {\color{lightgray}#2} {\color{darkgray}#3}}
\vspace{-0.1cm}
\\
\noindent\textcolor{blue}{\rule{\textwidth}{3pt}}\par
}

\pagestyle{empty}

%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\renewcommand{\bfseries}{\headingfont\color{headercolor}}

\newenvironment{cvline}[2]{
\begin{minipage}[l]{0.213\textwidth}
\vspace{0.5cm}
#1
\end{minipage}
\begin{minipage}[ht]{0.8\textwidth}
#2
\end{minipage}
}

\newcommand{\entryleft}[4]{
\hfill #1\hspace*{1cm}\\
\hspace*{0cm}\hfill #2\hspace*{1cm}\\
\hspace*{0cm}\hfill #3\hspace*{1cm}\\
\hspace*{0cm}\hfill #4
}

\newcommand{\entryright}[4]{
\vspace{-0.05cm}#1
#2
#3
#4\hfill
}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=2cm,top=2cm,right=2cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
