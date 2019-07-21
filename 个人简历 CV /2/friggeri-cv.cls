\ProvidesClass{friggeri-cv}[2013/07/19 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
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

\definecolor{google.plus}{HTML}{CF3E2C}
\definecolor{twitter.blue}{rgb}{0,172,237}
\definecolor{skype}{HTML}{12A5F4}
\definecolor{linkedin}{HTML}{0077B5}

\ifdefined\@cv@print
  \colorlet{google.plus}{black}
  \colorlet{twitter.blue}{black}
  \colorlet{skype}{black}
  \colorlet{blue}{black}
  \colorlet{linkedin}{black}
\fi
\colorlet{textcolor}{black}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX]{unicode-math}

\newfontfamily\bodyfont[]{Avenir Book}
\newfontfamily\thinfont[]{Avenir Next Ultra Light}
\newfontfamily\headingfont[]{Avenir Next Condensed Demi Bold}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Avenir Book}

%\setmathfont{XITS Math}

\RequirePackage{fontawesome}
\RequirePackage[utf8]{inputenc}

%%%%%%%%%%
% Header %
%%%%%%%%%%
\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{black}%
}



%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%

\pagestyle{empty}

%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont}
\newcommand{\entry}[4]{%
  #1&\parbox[t]{11.8cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{\parsep}%
  }\\}


%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont ##1}
  }
  \begin{textblock}{3.6}(1.5, 4.33)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

\RequirePackage[style=verbose, maxnames=99, sorting=ydnt]{biblatex}

\DeclareFieldFormat[article]{title}{#1\par}
\DeclareFieldFormat[book]{title}{#1\par}
\DeclareFieldFormat[inproceedings]{title}{#1\par}
\DeclareFieldFormat[misc]{title}{#1\par}
\DeclareFieldFormat[report]{title}{#1\par}

\DeclareBibliographyDriver{article}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=darkgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \newunit%
    \printfield{doi}
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{inreview}{%
  \printfield{title}%
  \newblock%
  \par%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=darkgray}\itshape%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{inbook}{%
  \printfield{chapter}%
  \newblock%
  \par%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=darkgray}\itshape%
    \printnames{editor}%
    \setunit*{\addcomma\space}%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{title}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}


\DeclareBibliographyDriver{inproceedings}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=darkgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printlist{location}
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{misc}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=darkgray}\itshape%
    \printfield{booktitle}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{report}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=darkgray}\itshape%
    \printfield{type}%
    \setunit{\space}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

% New syntax for flexible backend (BibLaTeX > v3.3)
% Correction for biblatex taken from https://github.com/posquit0/Awesome-CV
  \DeclareNameFormat{author}{%
    \small\addfontfeature{Color=lightgray}%
  \renewcommand*{\multinamedelim}{\addcomma\addspace}%
  \nameparts{#1}%
  \ifthenelse{\value{listcount}=1}
    {\ifblank{\namepartgiven}{}{\namepartgiven\space}%
    \namepartfamily}%
    {\ifblank{\namepartgiven}{}{\namepartgiven\space}%
    \namepartfamily}%
    \ifthenelse{\value{listcount}<\value{liststop}}
  {\addcomma\space}
  {}
  }

\newcommand{\printbibsection}[2]{
  \begin{refsection}
    \nocite{*}
    \printbibliography[sorting=chronological, type={#1}, title={#2}, heading=subbibliography]
  \end{refsection}
}

\DeclareSortingScheme{chronological}{
  \sort[direction=descending]{\field{year}}
  \sort[direction=descending]{\field{month}}
}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{pifont}
\RequirePackage{graphicx}
\graphicspath{ {Images/} }
