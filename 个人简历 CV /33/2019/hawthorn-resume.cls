\ProvidesClass{hawthorn-resume}[2015/1/25 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}
\definecolor{black}{RGB}{0,0,0}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\colorlet{fillheader}{gray}
\colorlet{header}{white}
\colorlet{textcolor}{black}
\colorlet{headercolor}{darkgray}
\colorlet{lightcolor}{gray}


%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage{unicode-math}

\newfontfamily\bodyfont
[BoldFont=LinLibertine_RBah.ttf,
ItalicFont=LinLibertine_RIah.ttf,
BoldItalicFont=LinLibertine_RZIah.ttf]
%{texgyreheros-regular.otf}
{LinLibertine_DRah.ttf}
\newfontfamily\thinfont[]{LinLibertine_DRah.ttf}
\newfontfamily\headingfont[]{LinLibertine_DRah.ttf}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont
[Mapping=tex-text, Color=textcolor,
BoldFont=LinLibertine_RBah.ttf,
ItalicFont=LinLibertine_RIah.ttf,
BoldItalicFont=LinLibertine_RZIah.ttf]
{LinLibertine_DRah.ttf}

%\setmathfont{texgyreheros-regular.otf}


%%%%%%%%%%%%
% Geometry %
%%%%%%%%%%%%

% these are given simply as values since the textpos module requires spec of global units.
% Here I use inches, for consistency.
% width of the sidebar
\newcommand{\sidebarwidth}{1.75}
% width of the body (container for the entrylist)
\newcommand{\bodywidth}{6.25}
% vertical offset of the sidebar and body
\newcommand{\headeroffset}{1.1}
% horizontal offset of the body
\newcommand{\sectionhorizsep}{0.125}
\newcommand{\bodyhorizoffset}{1.875}

% width allotted to the text part of an \entry
\newlength{\entrywidth}
\setlength{\entrywidth}{5.25in}
% width allotted to the date part of an \entry
\newlength{\datewidth}
\setlength{\datewidth}{0.875in}
% width allowed to all of an \entry
\newlength{\entrylistwidth}
\setlength{\entrylistwidth}{\bodywidth in}
% height of the header
\newlength{\headerheight}
\setlength{\headerheight}{\headeroffset in}


% column separation for columns (currently not used)
\newlength{\colsep}
\setlength{\colsep}{0.125in}

\setlength{\tabcolsep}{0pt}


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
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=\headerheight] (box) at (current page.north){};
    \node [anchor=center] (name) at (box.center) {
      \fontsize{40pt}{72pt}\color{header}
      {\thinfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {
      \fontsize{20pt}{36pt}\color{header}
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{1in}
}


%%%%%%%%%%%%%
% Sections  %
%%%%%%%%%%%%%

\RequirePackage{parskip}

\renewcommand{\section}[1]{
  {
    \LARGE\headingfont\color{headercolor}
    #1\\[6pt]
  }
}

\renewcommand{\subsection}[1]{
  {
  \large\headingfont\color{headercolor} #1
  }
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%


\newenvironment{entrylist}{
  \begin{tabular*}{\entrylistwidth}{@{\extracolsep{\colsep}}ll}
  }{
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}

\newcommand{\entry}[4]{
  \parbox[t]{\datewidth}{#1}
  \parbox[t]{\entrywidth}{
    {\addfontfeature{Color=headercolor} \textbf{#2}
    \hfill
    \addfontfeature{Color=headercolor} \textbf{#3}}\\[3pt]
    \ifx&#4&
    \else
      {#4}
    \fi
    \vspace{\parsep}
  }\\
}

\newcommand{\awardentry}[3]{
  \parbox[t]{\datewidth}{#1}
  \parbox[t]{\entrywidth}{
    {\addfontfeature{Color=headercolor} \textbf{#2}\\}
    \ifx&#3&
    \else
      {#3}
    \fi
    \vspace{\parsep}
  }\\
}

\newcommand{\projectentry}[4]{
  #1&\parbox[t]{\entrywidth}{
    {\addfontfeature{Color=headercolor} \textbf{#2}\\
    \textbf{#3}}\\[4pt]
    \ifx&#4& 
    \else
      {#4}
    \fi
    \vspace{\parsep}
  }\\
}


%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1in}
\setlength{\TPVertModule}{1in}

\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    {\Large\headingfont\color{headercolor} ##1}
    \\[4pt]
  }
  \begin{textblock}{\sidebarwidth}(0, \headeroffset)
  \begin{flushright}
  \vspace{\parsep}
  %\obeycr
}{%
  %\restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

\newcommand{\smallitem}[1]{
  {\addfontfeature{Color=lightcolor}
  \small{#1}}
}

\newenvironment{body}{
  \begin{textblock}{\bodywidth}(\bodyhorizoffset, \headeroffset)
  \vspace{\parsep}
}{
  \end{textblock}
}






%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

\RequirePackage[style=verbose, maxnames=99, sorting=ydnt]{biblatex}

\DeclareFieldFormat[article]{title}{#1\par}
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
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
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
    \footnotesize\addfontfeature{Color=lightgray}%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
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
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
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
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{type}%
    \setunit{\space}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

%\DeclareNameFormat{author}{%
%  \small\addfontfeature{Color=lightgray}%
%  \ifblank{#3}{}{#3\space}#1%
%  \ifthenelse{\value{listcount}<\value{liststop}}
%    {\addcomma\space}
%    {}%
%}

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




\RequirePackage{hyperref}
\RequirePackage[nohead,nofoot]{geometry}

